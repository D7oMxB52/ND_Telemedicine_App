package com.example.nd_telemedicine_app.service;

import com.example.nd_telemedicine_app.models.PatientHealthInfo;
import com.example.nd_telemedicine_app.repository.PatientHealthInfoRepository;
import org.springframework.stereotype.Service;

@Service
public class HealthInformationServiceImp implements HealthInformationService{
    private PatientHealthInfoRepository patientRepo;

    // springboot has @Autowire this constructor
    public HealthInformationServiceImp(PatientHealthInfoRepository patientRepo) {
        this.patientRepo = patientRepo;
    }
    @Override
    public PatientHealthInfo savePatientHealthInfo(PatientHealthInfo patientHealthInfo){
        return patientRepo.save(patientHealthInfo);
    }





}
