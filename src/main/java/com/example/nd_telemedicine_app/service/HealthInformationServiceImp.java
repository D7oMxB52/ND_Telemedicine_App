package com.example.nd_telemedicine_app.service;

import com.example.nd_telemedicine_app.models.PatientHealthInfo;
import com.example.nd_telemedicine_app.repository.PatientHealthInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HealthInformationServiceImp implements HealthInformationService{
    private PatientHealthInfoRepository patientRepo;

    @Autowired
    public HealthInformationServiceImp(PatientHealthInfoRepository patientRepo) {
        super();
        this.patientRepo = patientRepo;
    }
    @Override
    public PatientHealthInfo savePatientHealthInfo(PatientHealthInfo patientHealthInfo){
        return patientRepo.save(patientHealthInfo);
    }

    @Override
    public List<PatientHealthInfo> getAllPatientHealthInfo(){
        return patientRepo.findAll();
    }





}
