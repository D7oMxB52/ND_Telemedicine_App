package com.example.nd_telemedicine_app.service;

import com.example.nd_telemedicine_app.model.Prescription;
import com.example.nd_telemedicine_app.model.User;
import com.example.nd_telemedicine_app.repository.PrescriptionRepository;
import com.example.nd_telemedicine_app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PrescriptionService {

    @Autowired
    private PrescriptionRepository prescriptionRepository;
    @Autowired
    private UserService userService;


    public Prescription createPrescription(Prescription prescription) throws Exception {
        List<User> allPatients = userService.getAllPatients();
        List<User> allDoctors = userService.getAllUnverifiedDoctors();
        try {
            for (int i=0; i < allPatients.size(); i++){
                if (allPatients.get(i).getUserId() == prescription.getPatientId()) {
                    for (int j = 0; j < allDoctors.size(); j++) {
                        if (allDoctors.get(j).getUserId() == prescription.getDoctorId()) {
                            int numOfPrescriptions = prescriptionRepository.findAll().size();
                            prescription.setPrescriptionId(numOfPrescriptions+1);
                            prescriptionRepository.save(prescription);
                            return prescription;
                        }
                    }
                }
            }
            return null;
        } catch (Exception e) {
            throw new Exception("Prescription was not created successfully!");
        }
    }

    public List<Prescription> getAllPrescriptions() throws Exception {
        try{
        List<Prescription> allPrescriptions = prescriptionRepository.findAll();
        return allPrescriptions;
        } catch (Exception e) {
            throw new Exception("Cannot retrieve prescriptions!");
        }
    }

    public List<Prescription> getPrescriptionByPatientId(Integer patientId) throws Exception {
        try{
            List<Prescription> allPrescriptions = prescriptionRepository.findAll();
            List<Prescription> patientPrescriptions = new ArrayList<>();
            for (int i=0; i < allPrescriptions.size(); i++){
                if (allPrescriptions.get(i).getPatientId() == patientId){
                    patientPrescriptions.add(allPrescriptions.get(i));
                }
            }
            return patientPrescriptions;
        } catch (Exception e) {
            throw new Exception("Cannot retrieve any prescription from the patient!");
        }
    }

    public List<Prescription> getPrescriptionByDoctorId(Integer doctorId) throws Exception {
        try{
            List<Prescription> allPrescriptions = prescriptionRepository.findAll();
            List<Prescription> doctorPrescriptions = new ArrayList<>();
            for (int i=0; i < allPrescriptions.size(); i++){
                if (allPrescriptions.get(i).getDoctorId() == doctorId){
                    doctorPrescriptions.add(allPrescriptions.get(i));
                }
            }
            return doctorPrescriptions;
        } catch (Exception e) {
            throw new Exception("Cannot retrieve any prescription from the doctor!");
        }
    }
}
