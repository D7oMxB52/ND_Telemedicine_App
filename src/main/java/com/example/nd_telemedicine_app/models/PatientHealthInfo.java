package com.example.nd_telemedicine_app.models;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
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

}
