/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;
import model.Contract;
import model.Customer;

/**
 *
 * @author quynm
 */
public class PaymentServices {
    private static final String CLIENT_ID = "AfXI8bXa--uC5ks36CAQwK-2pptjTeqD8JCudoogI28L4EKqR2f1lDjhDRmJujsl3axKTWRJmPI3qwX1";
    private static final String CLIENT_SECRET = "EAoedCE8S7ygtqwP_P3ycXgxEokYlq8JJpelAra6EVvvPcyfZWdxIQEQMZ40I8xt14T0lE_ZP4G7md3m";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(Contract contract)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation(contract.getCustomer());
        RedirectUrls redirectUrls = getRedirectURLs(contract);
        List<Transaction> listTransaction = getTransactionInformation(contract);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
    private Payer getPayerInformation(Customer customer) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName(customer.getFirstName())
                .setLastName(customer.getLastName())
                .setEmail(customer.getAccount().getEmail());

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs(Contract contract) {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/insurancecard/customer/contract/detail?id="+contract.getId());
        redirectUrls.setReturnUrl("http://localhost:8080/insurancecard/execute_payment?contractid="+contract.getId());

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(Contract contract) {
        //convert fee to usd
        double usdContractFee = (double) contract.getContractFee() / 23000.0;
        
        Details details = new Details();
        details.setShipping("0");
        //format of the amount must be USD xx.xx
        details.setSubtotal(String.format("%.2f", usdContractFee));
        details.setTax("0");

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.format("%.2f", usdContractFee));
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(contract.getProduct().getTitle());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setName(contract.getProduct().getTitle());
        item.setPrice(String.format("%.2f", usdContractFee));
        item.setTax("0");
        item.setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }

    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }
}
