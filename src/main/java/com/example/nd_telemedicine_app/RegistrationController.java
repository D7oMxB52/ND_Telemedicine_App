//package com.example.nd_telemedicine_app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//@RestController
//@RequestMapping(value="/ndt") // We're trying to access this endpoint through the API gateway
//public class RegistrationController {
//    @Autowired
//    private User registrationService;
//    /**
//     * Prototype api endpoint
//     * @return arbitrary string value
//     */
//    @GetMapping(value = "/register", produces = "application/json")
//    public String testUser(){
//        return "Registration success";
//    }

//    @PostMapping(value = "/register", consumes = "application/json")
//    public ResponseEntity<Object> registerUser(
//            @RequestHeader(name="X-COM-PERSIST", required=false) String headerPersist,
//            @RequestHeader(name="X-COM-LOCATION", required = false, defaultValue = "Asia") String headerLocation,
//            @RequestBody User userDetails) {
//        return registrationService.addUser(id, userDetails);
//    }
}