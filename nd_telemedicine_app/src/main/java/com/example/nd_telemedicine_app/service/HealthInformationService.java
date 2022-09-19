package com.example.nd_telemedicine_app.service;

import com.example.nd_telemedicine_app.model.PatientHealthInfo;
import com.example.nd_telemedicine_app.repository.PatientHealthInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HealthInformationService {
    @Autowired
    PatientHealthInfoRepository patientRepo;

//    public HealthInformationService(PatientHealthInfoRepository patientRepo) {
//        super();
//        this.patientRepo = patientRepo;
//    }

    public PatientHealthInfo savePatientHealthInfo(PatientHealthInfo patientHealthInfo){
        return patientRepo.save(patientHealthInfo);
    }


    public List<PatientHealthInfo> getAllPatientHealthInfo(){
        return patientRepo.findAll();
    }

    public PatientHealthInfo getPatientHealthInfoById(Integer id) {
        Optional<PatientHealthInfo> patientHealthInfo = patientRepo.findById(id);
        return patientHealthInfo.get();
    }

    public PatientHealthInfo updatePatientHealthInfo(PatientHealthInfo patientHealthInfo, Integer id) {

        // fetching patient's info from DB
        PatientHealthInfo existingPatient = patientRepo.findById(id).orElse(null);

        existingPatient.setWeight(patientHealthInfo.getWeight());
        existingPatient.setHeight(patientHealthInfo.getHeight());
        existingPatient.setHealthStatus(patientHealthInfo.getHealthStatus());

        //save existing patient's info to DB
        patientRepo.save(existingPatient);

        return existingPatient;
    }

    public void deletePatientHealthInfo(Integer id) {
        //TODO write Exceptions later
        patientRepo.deleteById(id);
    }


}
