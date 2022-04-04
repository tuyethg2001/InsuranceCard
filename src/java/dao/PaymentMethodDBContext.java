/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PaymentMethod;

/**
 *
 * @author area1
 */
public class PaymentMethodDBContext extends DBContext {

    public PaymentMethod getPaymentMethod(int contractId) {
        try {
            String sql = "SELECT pm.[ID] as paymentMethodId\n"
                    + "      ,[PaymentMethod]\n"
                    + "  FROM [PaymentMethod] pm inner join Payment p on pm.[ID] = p.PaymentMethodID\n"
                    + "							inner join [Contract] c on p.ContractID = c.[ID]\n"
                    + "	where c.[ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, contractId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                PaymentMethod pm = new PaymentMethod();
                pm.setId(rs.getInt("paymentMethodId"));
                pm.setPaymentMethod(rs.getString("PaymentMethod"));
                return pm;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentMethodDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
