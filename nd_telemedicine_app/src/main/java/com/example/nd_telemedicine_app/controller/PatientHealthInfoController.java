package com.example.nd_telemedicine_app.controller;

import com.example.nd_telemedicine_app.model.PatientHealthInfo;
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
    @GetMapping("/all")
    public List<PatientHealthInfo> getAllHealthInfo(){
        return healthInformationService.getAllPatientHealthInfo();
    }


    // build get healthInformation by id REST API
    // for example:   http://localhost:8080/api/healthinfo/1
    @GetMapping("/{id}")
    public ResponseEntity<PatientHealthInfo> getPatientHealthInfoById(@PathVariable("id") Integer profileId){
        System.out.print("Hits endpoint");
        return new ResponseEntity<PatientHealthInfo>
                (healthInformationService.getPatientHealthInfoById(profileId), HttpStatus.OK);
    }

    // build updated health information for existing patients REST API
    // for example:   http://localhost:8080/api/healthinfo/1
    @PutMapping("/{id}")
    public ResponseEntity<PatientHealthInfo> updatePatientHealthInfo(@PathVariable("id") Integer id
                                                                    ,@RequestBody PatientHealthInfo patientHealthInfo){
        return new ResponseEntity<PatientHealthInfo>
                (healthInformationService.updatePatientHealthInfo(patientHealthInfo, id),HttpStatus.OK);

    }

    // build delete patient's health information REST API
    // for example:   http://localhost:8080/api/healthinfo/1
    @DeleteMapping("{id}")
    public ResponseEntity<String> deletingPatientHealthInfo(@PathVariable("id") Integer id){

        //deleting the patient's health information by id
        healthInformationService.deletePatientHealthInfo(id);

        return new ResponseEntity<String>("Patient with ID: "+id+" has been deleted successfully!", HttpStatus.OK);
    }
}
