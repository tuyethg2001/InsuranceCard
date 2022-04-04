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
import model.Account;
import model.AccountStatusCode;

/**
 *
 * @author area1
 */
public class AccountDBContext extends DBContext {

    public Account getAccountByEmailNGoogleID(String email, String googleID) {
        try {
            // Customer customer = new Customer();
            connection.setAutoCommit(false);
            String sql_select_account = "SELECT [ID]\n"
                    + "      ,[Email]\n"
                    + "      ,[Password]\n"
                    + "      ,[Role]\n"
                    + "      ,[Status]\n"
                    + "      ,[GoogleID]\n"
                    + "  FROM [Account]\n"
                    + "  WHERE (Email=? OR GoogleID=?) AND Status=1 AND isDelete=0";
            PreparedStatement psm_select_account = connection.prepareStatement(sql_select_account);
            psm_select_account.setNString(1, email);
            psm_select_account.setNString(2, googleID);
            ResultSet rs_select_account = psm_select_account.executeQuery();
            Account account = null;
            // Boolean isAccountExist = false;
            if (rs_select_account.next()) {
                account = new Account();
                account.setId(rs_select_account.getInt("ID"));
                account.setEmail(rs_select_account.getString("Email"));
                account.setPassword(rs_select_account.getString("Password"));
                account.setRole(rs_select_account.getBoolean("Role"));
                account.setStatus(rs_select_account.getShort("Status"));
                String gettingGoogleID = rs_select_account.getString("GoogleID");
                if (gettingGoogleID == null) {
                    gettingGoogleID = "";
                }
                account.setGoogleID(gettingGoogleID);
                // isAccountExist = true;
            }
            if (account != null && (account.getGoogleID().isEmpty() || account.getGoogleID() == null)) {
                String sql_update_googleID = "UPDATE [Account]\n"
                        + "   SET[GoogleID] = ?\n"
                        + " WHERE ID=?";
                PreparedStatement psm_update_googleID = connection.prepareStatement(sql_update_googleID);
                psm_update_googleID.setString(1, googleID);
                psm_update_googleID.setInt(2, account.getId());
                psm_update_googleID.executeUpdate();
                account.setGoogleID(googleID);
                // customer.setAccount(account);;
                // query get Info Customer from AccountID
                ////
            }
            connection.commit();
            return account;
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }

    public Account getAccount(String user, String pass) {
        try {
            String sql = "select ID, Email, [Password], [Role], [asc].StatusCode, [asc].StatusName\n"
                    + "from Account a inner join AccountStatusCode [asc] on a.[Status] = [asc].StatusCode\n"
                    + "where BINARY_CHECKSUM([Email]) = BINARY_CHECKSUM(?)\n"
                    + "      AND BINARY_CHECKSUM([Password]) = BINARY_CHECKSUM(?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            Account a = null;
            while (rs.next()) {
                if (a == null) {
                    a = new Account();
                    a.setId(rs.getInt("ID"));
                    a.setEmail(rs.getString("Email"));
                    a.setPassword(rs.getString("Password"));
                    a.setRole(rs.getBoolean("Role"));
                    AccountStatusCode asc = new AccountStatusCode();
                    asc.setStatusCode(rs.getShort("StatusCode"));
                    asc.setStatusName(rs.getString("StatusName"));
                    a.setStatusCode(asc);
                }
            }
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccount(int accountID) {
        try {
            String sql = "select ID, Email, [Password], [Role], [asc].StatusCode, [asc].StatusName\n"
                    + "from Account a inner join AccountStatusCode [asc] on a.[Status] = [asc].StatusCode\n"
                    + "where ID = ? and a.[isDelete] = 0 and a.[Status] = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountID);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("ID"));
                a.setEmail(rs.getString("Email"));
                a.setPassword(rs.getString("Password"));
                a.setRole(rs.getBoolean("Role"));
                AccountStatusCode asc = new AccountStatusCode();
                asc.setStatusCode(rs.getShort("StatusCode"));
                asc.setStatusName(rs.getString("StatusName"));
                a.setStatusCode(asc);
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public boolean checkExist(String email) {
        try {
            String sql = "select * from Account\n"
                    + "where Email = ? and Status = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkExistCusAccEmail(Account cusAcc) {
        try {
            String sql = "select * from Account\n"
                    + "where Email = ? and Status = 1 and ID <> ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cusAcc.getEmail());
            ps.setInt(2, cusAcc.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void resetPass(String newPass, String email) {
        try {
            String sql = "UPDATE [Account]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE Email like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newPass);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public boolean checkExistEmailOfStaff(String email) {
        try {
            String sql = "SELECT ID\n"
                    + "  FROM [Account]\n"
                    + "  WHERE Role = 1 and BINARY_CHECKSUM(Email) = BINARY_CHECKSUM(?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
