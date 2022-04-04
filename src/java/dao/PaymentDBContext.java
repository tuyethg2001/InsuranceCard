/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Contract;
import model.ContractStatusCode;
import model.Payment;
import model.PaymentMethod;
import model.Product;

/**
 *
 * @author area1
 */
public class PaymentDBContext extends DBContext {

    public double totalRevenues() {
        double total = 0;
        String sql_select_count_revenues = "SELECT SUM([Amount]) AS TotalRevenues\n"
                + "  FROM [Payment]\n"
                + "  WHERE Payment.isDelete = 0 AND PaidDate IS NOT NULL";
        try {
            PreparedStatement psm_select_count_revenues = connection.prepareStatement(sql_select_count_revenues);
            ResultSet rs_select_count_revenues = psm_select_count_revenues.executeQuery();
            if (rs_select_count_revenues.next()) {
                total = rs_select_count_revenues.getDouble("TotalRevenues");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public double totalAmountSpent(int customerID) {
        try {
            double totalAmount = 0;
            String sql_count_total_amount = "SELECT SUM(Payment.Amount) AS TotalAmount\n"
                    + "  FROM [Contract] INNER JOIN Payment ON Contract.ID=Payment.ContractID\n"
                    + "	WHERE Contract.CustomerID = ? AND Payment.PaidDate IS NOT NULL";
            PreparedStatement psm_count_total_amount = connection.prepareStatement(sql_count_total_amount);
            psm_count_total_amount.setInt(1, customerID);
            ResultSet rs_count_total_amount = psm_count_total_amount.executeQuery();

            if (rs_count_total_amount.next()) {
                totalAmount = rs_count_total_amount.getDouble("TotalAmount");
            }
            return totalAmount;
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Payment> getContractPayments(int contractID) {
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            String sql = "select p.ID\n"
                    + "	, PaidDate\n"
                    + "	, PaymentMethodID\n"
                    + "	, PaymentMethod\n"
                    + "	, Note\n"
                    + "	, Amount\n"
                    + "	, StartDate\n"
                    + "from Payment p inner join PaymentMethod pm\n"
                    + "on p.PaymentMethodID = pm.ID\n"
                    + "where ContractID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, contractID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PaymentMethod payMethod = new PaymentMethod();
                payMethod.setId(rs.getInt("PaymentMethodID"));
                payMethod.setPaymentMethod(rs.getString("PaymentMethod"));

                Payment pay = new Payment();
                pay.setId(rs.getInt("ID"));
                pay.setPaidDate(rs.getTimestamp("PaidDate"));
                pay.setNote(rs.getString("Note"));
                pay.setAmount(rs.getDouble("Amount"));
                pay.setStartDate(rs.getTimestamp("StartDate"));
                pay.setPaymentMethod2(payMethod);
                payments.add(pay);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
    }

    public double getTotalPayment(int cusID) {
        double total = 0;
        try {
            String sql = "SELECT SUM([Amount]) as Total\n"
                    + "  FROM [Payment]\n"
                    + "  INNER JOIN Contract\n"
                    + "  ON Contract.ID = Payment.ContractID\n"
                    + "  WHERE CustomerID = ?\n"
                    + "  and PaidDate is not null";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cusID);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                total = rs.getDouble("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int countPaymentRecord(int cusID, String date) {
        int num = 0;
        try {
            String sql = "SELECT COUNT(paidDate) as NumberOfRecord\n"
                    + "        FROM Payment\n"
                    + "		INNER JOIN Contract\n"
                    + "		ON Contract.ID = Payment.ContractID\n"
                    + "		WHERE Contract.CustomerID = ?\n";

            PreparedStatement stm;
            if (date != null) {
                sql += "and (CAST(Payment.StartDate AS date) = ? or CAST(PaidDate AS date) = ?)";
                stm = connection.prepareStatement(sql);
                stm.setString(2, date);
                stm.setString(3, date);
            } else {
                stm = connection.prepareStatement(sql);
            }
            stm.setInt(1, cusID);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                num = rs.getInt("NumberOfRecord");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return num;
    }

    public ArrayList<Payment> paymentHistory(int pagesize, int pageindex, int cusID, String date) {
        ArrayList<Payment> payments = new ArrayList<>();

        try {
            String sql = "WITH Pay AS (\n"
                    + "          SELECT Payment.ID as PayID\n"
                    + "          ,PaidDate\n"
                    + "		  ,Note\n"
                    + "		  ,Amount\n"
                    + "          ,Payment.StartDate\n"
                    + "		  ,PaymentMethod.PaymentMethod\n"
                    + "          ,Product.Title\n"
                    + "		  ,Contract.ID as ContractID\n"
                    + "		  ,Contract.Status\n"
                    + "          ,ROW_NUMBER() OVER (ORDER BY Payment.ID) AS 'RowNumber'\n"
                    + "          FROM Payment\n"
                    + "		  INNER JOIN PaymentMethod\n"
                    + "		  ON PaymentMethod.ID = Payment.PaymentMethodID\n"
                    + "		  INNER JOIN Contract\n"
                    + "		  ON Contract.ID = Payment.ContractID\n"
                    + "		  INNER JOIN Product\n"
                    + "		  ON Product.ID = Contract.ProductID\n"
                    + "           WHERE Contract.CustomerID = ?\n";

            if (date != null) {
                sql += "and (CAST(Payment.StartDate AS date) = ? or CAST(PaidDate AS date) = ?)\n";
            } 

            sql += ")";
            sql += "SELECT PayID, PaidDate, Note, Amount,\n"
                    + "       StartDate, PaymentMethod,\n"
                    + "       Title, ContractID, Status\n"
                    + "FROM Pay\n"
                    + "WHERE RowNumber >= (? - 1)*? + 1 AND RowNumber <= ? * ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cusID);
            
            if (date != null) {
                stm.setString(2, date);
                stm.setString(3, date);
                stm.setInt(4, pageindex);
                stm.setInt(5, pagesize);
                stm.setInt(6, pageindex);
                stm.setInt(7, pagesize);
            } else {
                stm.setInt(2, pageindex);
                stm.setInt(3, pagesize);
                stm.setInt(4, pageindex);
                stm.setInt(5, pagesize);
            }

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                PaymentMethod pm = new PaymentMethod();
                pm.setPaymentMethod(rs.getString("PaymentMethod"));

                Product pro = new Product();
                pro.setTitle(rs.getString("Title"));

                ContractStatusCode csc = new ContractStatusCode();
                csc.setStatusCode(rs.getShort("Status"));

                Contract contract = new Contract();
                contract.setId(rs.getInt("ContractID"));
                contract.setProduct(pro);
                contract.setStatusCode(csc);

                Payment payment = new Payment();
                payment.setId(rs.getInt("PayID"));
                payment.setPaidDate(rs.getTimestamp("PaidDate"));
                payment.setNote(rs.getString("Note"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setStartDate(rs.getTimestamp("StartDate"));
                payment.setPaymentMethod2(pm);
                payment.setContractID(contract);

                payments.add(payment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
    }
    
    
}
