package com.team12.booking.controller;

import com.team12.booking.model.Availability;
import com.team12.booking.service.AvailabilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

//    // Get all availabilities by doctor id
//    @GetMapping(path="/doctor{doctorId}", produces = "application/json")
//    public ResponseEntity<Object> getBookingByDoctorId(@PathVariable("doctorId") Integer doctorId)
//            throws Exception {
//        List<Booking> bookingList = bookingService.findBookingByDoctorId(doctorId);
//        if (bookingList.size() > 0) {
//            return  new ResponseEntity<>(bookingList, HttpStatus.OK);
//        } else  {
//            throw new Exception("Could not find bookings for doctor");
//        }
//    }

    /// See when a doctor is available
    // All availabilities for a certain date
    // Business hours only

}
