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
import model.Moderator;

/**
 *
 * @author area1
 */
public class ModeratorDBContext extends DBContext {

    public Moderator getModAccount(String user, String pass) {
        Moderator mod = new Moderator();

        try {
            String sql = "SELECT UserName, Password\n"
                    + "     FROM Moderator\n"
                    + "  WHERE BINARY_CHECKSUM(UserName) = BINARY_CHECKSUM(?)\n"
                    + "      AND BINARY_CHECKSUM(Password) = BINARY_CHECKSUM(?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                mod.setUserName(user);
                mod.setPassword(pass);

                return mod;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModeratorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void changePass(String newPassword, String username) {
        try {
            String sql = "UPDATE [Moderator]\n"
                    + "   SET [Password] = ?\n"
                    + " WHERE username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newPassword);
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ModeratorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
