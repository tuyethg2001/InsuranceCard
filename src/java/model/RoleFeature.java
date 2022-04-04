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
public class RoleFeature {
    private short role;
    private String roleName;

    public RoleFeature() {
    }

    public RoleFeature(short role, String roleName) {
        this.role = role;
        this.roleName = roleName;
    }

    public short getRole() {
        return role;
    }

    public void setRole(short role) {
        this.role = role;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    
    
    
}
