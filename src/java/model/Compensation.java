/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author area1
 */
public class Compensation {

    private int id;
    private Accident accident;
    private String driverName;
    private Timestamp createDate;
    private Timestamp resolveDate;
    private String resolveNote;
    private CompensationStatusCode status;
    private String description;
    private String attachment; 

    public Compensation() {
    }

    public Compensation(int id, Accident accident, String driverName, Timestamp createDate, Timestamp resolveDate, String resolveNote, CompensationStatusCode status, String description, String attachment) {
        this.id = id;
        this.accident = accident;
        this.driverName = driverName;
        this.createDate = createDate;
        this.resolveDate = resolveDate;
        this.resolveNote = resolveNote;
        this.status = status;
        this.description = description;
        this.attachment = attachment;
    }

    public Accident getAccident() {
        return accident;
    }

    public void setAccident(Accident accident) {
        this.accident = accident;
    }

    public CompensationStatusCode getStatus() {
        return status;
    }

    public void setStatus(CompensationStatusCode status) {
        this.status = status;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public Timestamp getResolveDate() {
        return resolveDate;
    }

    public void setResolveDate(Timestamp resolveDate) {
        this.resolveDate = resolveDate;
    }

    public String getResolveNote() {
        return resolveNote;
    }

    public void setResolveNote(String resolveNote) {
        this.resolveNote = resolveNote;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

}
