/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author area1
 */
public class Feature {
    private int id;
    private String URL;
    private RoleFeature roleFeature;
    private boolean isDelete;

    public Feature() {
    }

    public Feature(int id, String URL, RoleFeature roleFeature, boolean isDelete) {
        this.id = id;
        this.URL = URL;
        this.roleFeature = roleFeature;
        this.isDelete = isDelete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public RoleFeature getRoleFeature() {
        return roleFeature;
    }

    public void setRoleFeature(RoleFeature roleFeature) {
        this.roleFeature = roleFeature;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    
}
