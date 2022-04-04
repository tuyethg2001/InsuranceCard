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
import model.Feature;
import model.RoleFeature;

/**
 *
 * @author area1
 */
public class FeatureDBContext extends DBContext {

    public ArrayList<String> getFeatueURLsByRole(String role) {
        ArrayList<String> features = new ArrayList<>();
        String sql_select_featureURLs = "SELECT [URL]\n"
                + "  FROM [Feature] INNER JOIN RoleFeature\n"
                + "  ON [Feature].RoleID = RoleFeature.ID\n"
                + "  WHERE Feature.isDelete=0 AND RoleFeature.isDelete=0\n"
                + "		AND RoleFeature.RoleName=?";
        try {
            PreparedStatement psm_select_featureURLs = connection.prepareStatement(sql_select_featureURLs);
            int i = 0;
            psm_select_featureURLs.setString(++i, role);
            ResultSet rs_select_featureURLs = psm_select_featureURLs.executeQuery();
            while (rs_select_featureURLs.next()) {
                features.add(rs_select_featureURLs.getString("URL"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeatureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return features;
    }
    
    public boolean isAuthor(String role, String checkingURL){
        boolean isAccess = false;
        String sql_select_featureURLs = "SELECT [URL]\n"
                + "  FROM [Feature] INNER JOIN RoleFeature\n"
                + "  ON [Feature].RoleID = RoleFeature.ID\n"
                + "  WHERE Feature.isDelete=0 AND RoleFeature.isDelete=0\n"
                + " AND RoleFeature.RoleName = ? AND Feature.URL = ?";
        try {
            PreparedStatement psm_select_featureURLs = connection.prepareStatement(sql_select_featureURLs);
            int i = 0;
            psm_select_featureURLs.setString(++i, role);
            psm_select_featureURLs.setString(++i, checkingURL);
            ResultSet rs_select_featureURLs = psm_select_featureURLs.executeQuery();
            if (rs_select_featureURLs.next()) {
                isAccess = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeatureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isAccess;
    }
}
