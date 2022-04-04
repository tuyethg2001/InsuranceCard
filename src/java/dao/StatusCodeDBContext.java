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
import model.Compensation;
import model.CompensationStatusCode;
import model.ContractStatusCode;
import model.ProductStatusCode;

/**
 *
 * @author area1
 */
public class StatusCodeDBContext extends DBContext {

    public ArrayList<CompensationStatusCode> getCompensationStatusCodes() {
        ArrayList<CompensationStatusCode> statusCodes = new ArrayList<>();
        String sql_select_statuscode = "SELECT [StatusCode]\n"
                + "      ,[StatusName]\n"
                + "  FROM [CompensationStatusCode]"
                + "WHERE isDelete = 0";

        try {
            PreparedStatement psm_select_statuscode = connection.prepareStatement(sql_select_statuscode);
            ResultSet rs_select_statuscode = psm_select_statuscode.executeQuery();
            while (rs_select_statuscode.next()) {
                CompensationStatusCode statusCode = new CompensationStatusCode();
                statusCode.setStatusCode(rs_select_statuscode.getShort("StatusCode"));
                statusCode.setStatusName(rs_select_statuscode.getString("StatusName"));

                statusCodes.add(statusCode);
            }
            return statusCodes;
        } catch (SQLException ex) {
            Logger.getLogger(StatusCodeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public CompensationStatusCode getCompensationStatusCode(int code) {
        try {
            String sql = "SELECT [StatusCode]\n"
                    + "      ,[StatusName]\n"
                    + "  FROM [CompensationStatusCode]\n"
                    + "  WHERE [StatusCode] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, code);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                CompensationStatusCode csc = new CompensationStatusCode();
                csc.setStatusCode(code);
                csc.setStatusName(rs.getString("StatusName"));
                return csc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusCodeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<ContractStatusCode> getContractStatusCodes() {
        ArrayList<ContractStatusCode> statusCodes = new ArrayList<>();
        String sql_select_statuscode = "SELECT [StatusCode]\n"
                + "      ,[StatusName]\n"
                + "  FROM [ContractStatusCode]";

        try {
            PreparedStatement psm_select_statuscode = connection.prepareStatement(sql_select_statuscode);
            ResultSet rs_select_statuscode = psm_select_statuscode.executeQuery();
            while (rs_select_statuscode.next()) {
                ContractStatusCode statusCode = new ContractStatusCode();
                statusCode.setStatusCode(rs_select_statuscode.getShort("StatusCode"));
                statusCode.setStatusName(rs_select_statuscode.getString("StatusName"));

                statusCodes.add(statusCode);
            }
            return statusCodes;
        } catch (SQLException ex) {
            Logger.getLogger(StatusCodeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ContractStatusCode getContractStatusCode(int code) {
        String sql_select_statuscode = "SELECT [StatusCode]\n"
                + "      ,[StatusName]\n"
                + "  FROM [ContractStatusCode]"
                + "  WHERE [StatusCode] = ?";

        try {
            PreparedStatement psm_select_statuscode = connection.prepareStatement(sql_select_statuscode);
            psm_select_statuscode.setInt(1, code);
            ResultSet rs_select_statuscode = psm_select_statuscode.executeQuery();
            if (rs_select_statuscode.next()) {
                ContractStatusCode statusCode = new ContractStatusCode();
                statusCode.setStatusCode(rs_select_statuscode.getShort("StatusCode"));
                statusCode.setStatusName(rs_select_statuscode.getString("StatusName"));

                return statusCode;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusCodeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ProductStatusCode getProductStatusCode(int code) {
        try {
            String sql = "SELECT [StatusCode]\n"
                    + "      ,[StatusName]\n"
                    + "  FROM [ProductStatusCode]\n"
                    + "  WHERE [StatusCode] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, code);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ProductStatusCode psc = new ProductStatusCode();
                psc.setStatusCode(rs.getShort("StatusCode"));
                psc.setStatusName(rs.getString("StatusName"));
                return psc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusCodeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
