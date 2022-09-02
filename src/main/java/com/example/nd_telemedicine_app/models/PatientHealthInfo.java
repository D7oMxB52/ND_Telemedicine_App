package com.example.nd_telemedicine_app.models;


import javax.persistence.*;

@Entity
@Table(name = "PatientHealthInformation")
public class PatientHealthInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    // need to discuss with product owner about more things to add to the patient profile.
    @Column(name = "length", nullable = true)
    private double length;
    @Column(name = "weight", nullable = true)
    private double weight;
    @Column(name = "HealthStatus", nullable = true)
    private String healthStatus;

    public PatientHealthInfo() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
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

    @Override
    public String toString() {
        return "PatientHealthInfo{" +
                "id=" + id +
                ", length=" + length +
                ", weight=" + weight +
                ", healthStatus='" + healthStatus + '\'' +
                '}';
    }
}
