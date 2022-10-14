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

    public PatientHealthInfo savePatientHealthInfo(PatientHealthInfo patientHealthInfo){
        int numProfiles = patientRepo.findAll().size();
        patientHealthInfo.setProfileId(numProfiles+1);
        return patientRepo.save(patientHealthInfo);
    }

    public List<PatientHealthInfo> getAllPatientHealthInfo(){
        return patientRepo.findAll();
    }

    public PatientHealthInfo getPatientHealthInfoById(Integer id) {
        Optional<PatientHealthInfo> patientHealthInfo = patientRepo.findById(id);
        if (patientHealthInfo.isEmpty()) {
            return null;
        }
        return patientHealthInfo.get();
    }

    public PatientHealthInfo getPatientHealthInfoByPatientId(Integer id) {
        List<PatientHealthInfo> allProfiles;
        PatientHealthInfo profile;

        allProfiles = patientRepo.findAll();
        for (int i = 0; i < allProfiles.size(); i++){
            if (allProfiles.get(i).getUserId() == id){
                return allProfiles.get(i);
            }
        }
        return null;
    }

    public PatientHealthInfo updatePatientHealthInfo(PatientHealthInfo patientHealthInfo, Integer id) {

        // fetching patient's info from DB
        PatientHealthInfo existingPatient = patientRepo.findById(id).get();
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
