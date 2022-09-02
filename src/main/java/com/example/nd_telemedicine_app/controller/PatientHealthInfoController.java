package com.example.nd_telemedicine_app.controller;

import com.example.nd_telemedicine_app.models.PatientHealthInfo;
import com.example.nd_telemedicine_app.service.HealthInformationService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/healthinfo")
public class PatientHealthInfoController {

    private HealthInformationService healthInformationService;

    public PatientHealthInfoController(HealthInformationService healthInformationService) {
        super();
        this.healthInformationService = healthInformationService;
    }
    // build create healthInformation REST API
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public ResponseEntity<PatientHealthInfo> saveHealthInfo(@RequestBody PatientHealthInfo patientHealthInfo){
        return new ResponseEntity<PatientHealthInfo>
                (healthInformationService.savePatientHealthInfo(patientHealthInfo), HttpStatus.CREATED);
    }

    // build get all healthInformation REST API
    @GetMapping
    public List<PatientHealthInfo> getAllHealthInfo(){
        return healthInformationService.getAllPatientHealthInfo();
    }
}
