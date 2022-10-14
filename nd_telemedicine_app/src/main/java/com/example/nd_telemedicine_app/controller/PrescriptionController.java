package com.example.nd_telemedicine_app.controller;

import com.example.nd_telemedicine_app.model.Prescription;
import com.example.nd_telemedicine_app.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/prescription")
public class PrescriptionController {

    @Autowired
    private PrescriptionService prescriptionService;


    @PostMapping(path = "/", consumes = "application/json", produces = "application/json")
    public ResponseEntity<Object> createPrescription(@RequestBody Prescription prescription)
            throws Exception {
        Prescription createdPrescription = prescriptionService.createPrescription(prescription);
        return new ResponseEntity<>(createdPrescription, HttpStatus.CREATED);
    }

    @GetMapping(path="/all", produces = "application/json")
    public ResponseEntity<Object> getAllPrescriptions()
            throws Exception {
        List<Prescription> prescriptionList = prescriptionService.getAllPrescriptions();
        if (prescriptionList.size() > 0) {
            return  new ResponseEntity<>(prescriptionList, HttpStatus.OK);
        } else  {
            return new ResponseEntity<>("No prescription found", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(path="/patient{patientId}", produces = "application/json")
    public ResponseEntity<Object> getPrescriptionByPatientId(@PathVariable("patientId") Integer patientId)
            throws Exception {
        List<Prescription> prescriptionList = prescriptionService.getPrescriptionByPatientId(patientId);
        if (prescriptionList.size() > 0) {
            return  new ResponseEntity<>(prescriptionList, HttpStatus.OK);
        } else  {
            throw new Exception("Could not find prescriptions for the patient");
        }
    }

    @GetMapping(path="/doctor{doctorId}", produces = "application/json")
    public ResponseEntity<Object> getPrescriptionByDoctorId(@PathVariable("doctorId") Integer doctorId)
            throws Exception {
        List<Prescription> prescriptionList = prescriptionService.getPrescriptionByDoctorId(doctorId);
        if (prescriptionList.size() > 0) {
            return  new ResponseEntity<>(prescriptionList, HttpStatus.OK);
        } else  {
            throw new Exception("Could not find prescriptions for the patient");
        }
    }

}
