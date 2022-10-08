package com.team12.booking.controller;

import com.team12.booking.model.Availability;
import com.team12.booking.service.AvailabilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/availability")
public class AvailabilityController {

    @Autowired
    private AvailabilityService availabilityService;

    // CRUD OPERATIONS
    // create
    // read
    // update
    // delete

    // CREATE
    // date time doctor id availability
    @PostMapping(path="/", consumes = "application/json",  produces = "application/json")
    public ResponseEntity<Object> createAvailability(@RequestBody Availability availability)
            throws Exception {
        System.out.println("availabilllity endpoint hit:  \nDoctpr: " + availability.getDoctorId() + " " + availability.getAvailabilityDate()
        + " " + availability.getAvailabilityTime() + " " + availability.getAvailabilityEndTime());
        Availability newAvailability =  availabilityService.createAvailability(availability);
        return new ResponseEntity<>(newAvailability, HttpStatus.CREATED);
    }
}
