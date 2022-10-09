package com.example.nd_telemedicine_app.controller;

import com.example.nd_telemedicine_app.model.PatientHealthInfo;
import com.example.nd_telemedicine_app.service.HealthInformationService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/ndt/pa-healthinfo")
public class PatientHealthInfoController {
    private HealthInformationService healthInformationService;
    public PatientHealthInfoController(HealthInformationService healthInformationService) {
        super();
        this.healthInformationService = healthInformationService;
    }
    // build create healthInformation REST API
    @RequestMapping(value="/save", method = RequestMethod.POST, produces="application/json", consumes="application/json")
    public PatientHealthInfo saveHealthInfo(@RequestBody PatientHealthInfo patientHealthInfo){
        return healthInformationService.savePatientHealthInfo(patientHealthInfo);
    }
    // build get all healthInformation REST API
    @RequestMapping(value = "/all", method = RequestMethod.GET,produces="application/json")
    public List<PatientHealthInfo> getAllHealthInfo(){
        return healthInformationService.getAllPatientHealthInfo();
    }
    // build get healthInformation by id REST API
    @RequestMapping(value = "/{id}", method = RequestMethod.GET,produces="application/json")
    public PatientHealthInfo getPatientHealthInfoById(@PathVariable("id") Integer profileId){
        System.out.print("Hits endpoint");
        return healthInformationService.getPatientHealthInfoById(profileId);
    }
    // build updated health information for existing patients REST API
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces="application/json", consumes="application/json")
    public PatientHealthInfo updatePatientHealthInfo(@PathVariable("id") Integer id
                                       ,@RequestBody PatientHealthInfo patientHealthInfo){
        System.out.println(patientHealthInfo.getHealthStatus());
        return healthInformationService.updatePatientHealthInfo(patientHealthInfo, id);
    }
    // build delete patient's health information REST API
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deletingPatientHealthInfo(@PathVariable("id") Integer id){
        //deleting the patient's health information by id
        healthInformationService.deletePatientHealthInfo(id);
        System.out.println("Patient with ID: "+id+" has been deleted successfully!");
    }
}
