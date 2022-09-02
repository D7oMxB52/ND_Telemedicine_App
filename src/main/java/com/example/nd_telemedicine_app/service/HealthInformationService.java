package com.example.nd_telemedicine_app.service;

import com.example.nd_telemedicine_app.models.PatientHealthInfo;

public interface HealthInformationService {
    PatientHealthInfo savePatientHealthInfo(PatientHealthInfo patientHealthInfo);
}
