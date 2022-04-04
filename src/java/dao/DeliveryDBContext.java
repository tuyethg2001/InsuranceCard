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
import model.Delivery;

/**
 *
 * @author quynm
 */
public class DeliveryDBContext extends DBContext {

    public void insertDelivery(Delivery delivery) {
        try {
            String sql = "INSERT INTO [Delivery]\n"
                    + "           ([FullName]\n"
                    + "           ,[Phone]\n"
                    + "           ,[Email]\n"
                    + "           ,[Address]\n"
                    + "           ,[Province]\n"
                    + "           ,[District]\n"
                    + "           ,[ContractID])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, delivery.getFullName());
            stm.setString(2, delivery.getPhone());
            stm.setString(3, delivery.getEmail());
            stm.setString(4, delivery.getAddress());
            stm.setString(5, delivery.getProvince());
            stm.setString(6, delivery.getDistrict());
            stm.setInt(7, delivery.getContract().getId());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Delivery getDeliveryByContract(int contractID) {
        Delivery delivery = new Delivery();
        try {
            String sql = "select FullName\n"
                    + "	, Phone\n"
                    + "	, Email\n"
                    + "	, Address\n"
                    + "	, Province\n"
                    + "	, District\n"
                    + "from Delivery\n"
                    + "where ContractID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, contractID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {                
                delivery.setFullName(rs.getString("FullName"));
                delivery.setPhone(rs.getString("Phone"));
                delivery.setEmail(rs.getString("Email"));
                delivery.setAddress(rs.getString("Address"));
                delivery.setProvince(rs.getString("Province"));
                delivery.setDistrict(rs.getString("District"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeliveryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return delivery;
    }

    public void updateDelivery(Delivery delivery) {
        try {
            String sql = "UPDATE Delivery\n"
                    + " SET FullName = ?\n"
                    + "	, Phone = ?\n"
                    + "	, Email = ?\n"
                    + "	, Address = ?\n"
                    + "	, Province = ?\n"
                    + "	, District = ?\n"
                    + "WHERE ContractID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, delivery.getFullName());
            ps.setString(2, delivery.getPhone());
            ps.setString(3, delivery.getEmail());
            ps.setString(4, delivery.getAddress());
            ps.setString(5, delivery.getProvince());
            ps.setString(6, delivery.getDistrict());
            ps.setInt(7, delivery.getContract().getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DeliveryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
