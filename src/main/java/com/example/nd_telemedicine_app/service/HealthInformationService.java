package com.example.nd_telemedicine_app.service;

import com.example.nd_telemedicine_app.models.PatientHealthInfo;

import java.util.List;

public interface HealthInformationService {
    PatientHealthInfo savePatientHealthInfo(PatientHealthInfo patientHealthInfo);
    List<PatientHealthInfo> getAllPatientHealthInfo();
    PatientHealthInfo getPatientHealthInfoById(long id);
}
