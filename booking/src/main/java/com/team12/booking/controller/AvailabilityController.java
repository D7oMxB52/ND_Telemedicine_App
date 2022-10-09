package com.team12.booking.controller;

import com.team12.booking.model.Availability;
import com.team12.booking.service.AvailabilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping(path="/availability")
public class AvailabilityController {

    @Autowired
    private AvailabilityService availabilityService;

    // CRUD OPERATIONS
    // read
    // update
    // delete

    // CREATE
    // date time doctor id availability
    @PostMapping(path="/", consumes = "application/json",  produces = "application/json")
    public ResponseEntity<Object> createAvailability(@RequestBody Availability availability)
            throws Exception {

        Availability newAvailability =  availabilityService.createAvailability(availability);
        if (newAvailability != null){
            return new ResponseEntity<>(newAvailability, HttpStatus.CREATED);
        }
            return new ResponseEntity<>("Availability invalid. Please change the time and try again",
                    HttpStatus.BAD_REQUEST);
    }

    // Get all availabilities by doctor id
    @GetMapping(path="/doctor{doctorId}", consumes = "application/json", produces = "application/json")
    public ResponseEntity<Object> getAvailabilitiesByDoctorId(@PathVariable("doctorId") Integer doctorId)
            throws Exception {
        List<Availability> availabilityList = availabilityService.getAllAvailabilitiesForDoctor(doctorId);
        if (availabilityList.size() > 0) {
            return  new ResponseEntity<>(availabilityList, HttpStatus.OK);
        } else  {
            throw new Exception("Doctor has no availabilities");
        }
    }

    @GetMapping(path="/date{availabilityDate}", produces = "application/json")
    public ResponseEntity<Object> getAvailabilitiesByDate(@PathVariable("availabilityDate")
                      @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate availabilityDate)
            throws Exception {
        List<Availability> availabilityList = availabilityService.getAllAvailabilitiesForDate(availabilityDate);
        if (availabilityList.size() > 0) {
            return  new ResponseEntity<>(availabilityList, HttpStatus.OK);
        } else  {
            return new ResponseEntity<>("No availabilities found", HttpStatus.BAD_REQUEST);
        }
    }
}
