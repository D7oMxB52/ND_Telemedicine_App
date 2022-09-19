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

    @Column(name = "health_status")
    private String healthStatus;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public PatientHealthInfo() {
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

//    public User getUser() {
//        return user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }

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
