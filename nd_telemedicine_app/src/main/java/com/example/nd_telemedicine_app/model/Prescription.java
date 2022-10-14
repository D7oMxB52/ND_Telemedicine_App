package com.example.nd_telemedicine_app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Prescription {
    @Id
    @Column
    private Integer prescriptionId;

    @Column
    private Integer patientId;

    @Column
    private Integer doctorId;

    @Column
    private String medicineName;

    @Column
    private String dose;

    @Column
    private String instructions;

    public Prescription() {
    }

    public Prescription(Integer prescriptionId, Integer patientId, Integer doctorId, String medicineName, String medicineDose, String instructions) {
        this.prescriptionId = prescriptionId;
        this.patientId = patientId;
        this.doctorId = doctorId;
        this.medicineName = medicineName;
        this.dose = medicineDose;
        this.instructions = instructions;
    }

    public Integer getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(Integer prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getDose() {
        return dose;
    }

    public void setDose(String medicineDose) {
        this.dose = medicineDose;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }
}
