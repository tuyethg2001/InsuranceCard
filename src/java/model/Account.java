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
public class Account {

    private int id;
    private String email;
    private String password;
    private boolean role;
    private short status;
    private String googleID;
    private AccountStatusCode statusCode;

    public Account(int id, String email, String password, boolean role, short status, String googleID, AccountStatusCode statusCode) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
        this.googleID = googleID;
        this.statusCode = statusCode;
    }

    public AccountStatusCode getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(AccountStatusCode statusCode) {
        this.statusCode = statusCode;
    }

    public Account() {
    }

    public String getGoogleID() {
        return googleID;
    }

    public void setGoogleID(String googleID) {
        this.googleID = googleID;
    }

    public Account(int id, String email, String password, boolean role, short status, String googleID) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
        this.googleID = googleID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

}
