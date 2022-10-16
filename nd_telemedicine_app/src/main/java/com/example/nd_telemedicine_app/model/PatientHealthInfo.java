package com.example.nd_telemedicine_app.model;

import javax.persistence.*;

@Entity
@Table(name = "patient_health_info")
public class PatientHealthInfo {

    @Id
    @Column
    private Integer profileId;

    @Column
    private Integer userId;

    @Column
    private double height;

    @Column
    private double weight;

    @Column
    private String healthStatus;

    public PatientHealthInfo() {}

    public PatientHealthInfo(Integer profileId, Integer userId, double height, double weight, String healthStatus) {
        this.profileId = profileId;
        this.userId = userId;
        this.height = height;
        this.weight = weight;
        this.healthStatus = healthStatus;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    public void setProfileId(Integer profileId) {
        this.profileId = profileId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

}
