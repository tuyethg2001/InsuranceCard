/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.VehicleType;

/**
 *
 * @author area1
 */
public class VehicleTypeDBContext extends DBContext {

    public ArrayList<VehicleType> getVehicleTypes() {
        ArrayList<VehicleType> types = new ArrayList<>();
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[VehicleType]\n"
                    + "  FROM [VehicleType]"
                    + "  WHERE isDelete = 0 OR isDelete is NULL";
            PreparedStatement psm = connection.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();

            while (rs.next()) {
                VehicleType type = new VehicleType(rs.getInt("ID"), rs.getString("VehicleType"));
                types.add(type);
            }

        } catch (SQLException ex) {
            Logger.getLogger(VehicleTypeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return types;
    }
    
    public VehicleType getVehicleTypeByID(int id){
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[VehicleType]\n"
                    + "  FROM [VehicleType]"
                    + "  WHERE [ID] = ? AND (isDelete = 0 OR isDelete is NULL)";
            PreparedStatement psm = connection.prepareStatement(sql);
            psm.setInt(1, id);
            ResultSet rs = psm.executeQuery();

            if (rs.next()) {
                VehicleType type = new VehicleType(rs.getInt("ID"), rs.getString("VehicleType"));
                return type;
            }
        } catch (SQLException ex) {
            Logger.getLogger(VehicleTypeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
