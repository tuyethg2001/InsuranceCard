/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author area1
 */
public class Product {

    private int id;
    private String title;
    private String description;
    private double price;
    private String imageURL;
    private short status;
    private boolean isDelete;
    private Timestamp startDate;
    private Timestamp updateDate;
    private String contentDetail;
    private ArrayList<Timestamp> updateTime = new ArrayList<>();
    private ProductStatusCode statusCode;

    public ProductStatusCode getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(ProductStatusCode statusCode) {
        this.statusCode = statusCode;
    }
    
    

    public ArrayList<Timestamp> getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(ArrayList<Timestamp> UpdateTime) {
        this.updateTime = UpdateTime;
    }
    
    

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }
    
    

    public Product() {
    }

    public Product(int id, String title, String description, double price, String imageURL, short status, boolean isDelete) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.imageURL = imageURL;
        this.status = status;
        this.isDelete = isDelete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public String getContentDetail() {
        return contentDetail;
    }

    public void setContentDetail(String contentDetail) {
        this.contentDetail = contentDetail;
    }
    
}
