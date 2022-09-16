package com.example.nd_telemedicine_app.model;

import javax.persistence.*;

@Entity
@Table(name = "patient_health_info")
public class PatientHealthInfo {

    @Id
    @Column(name = "profile_id")
    private int profileId;

    // need to discuss with product owner about more things to add to the patient profile.
    @Column(name = "height")
    private double height;

    @Column(name = "weight")
    private double weight;

    @Column(name = "HealthStatus")
    private String healthStatus;

    @OneToOne
    @MapsId
    @JoinColumn(name = "profile_id")
    private User user;

    public PatientHealthInfo() {
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



}
