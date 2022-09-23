package com.team12.booking.controller;

import com.team12.booking.dao.BookingDAO;
import com.team12.booking.model.Booking;
import com.team12.booking.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path="/booking")
public class BookingController {

    @Autowired
    private BookingService bookingService;


    /**
     * Retrieve a particular booking from database
     * @param bookingId Primary key identifier of booking
     * @return Booking object if a match is found with
     * @throws Exception
     */
    @GetMapping(path="/{bookingId}", produces = "application/json")
    public ResponseEntity<Object> getBookingById(@PathVariable("bookingId") Integer bookingId)
            throws Exception {
        Optional booking = bookingService.findBookingById(bookingId);
        if (booking == null){
            throw new Exception("Booking not found");
        } else
            return new ResponseEntity<>(booking, HttpStatus.OK);
        // List of HttpStatus codes https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpStatus.html
    }

    /**
     * Find all bookings for a particular patient ID
     * @param patientId Integer value of patient's userId
     * @return List of all bookings associated with patientID
     * @throws Exception
     */
    @GetMapping(path="/patient{patientId}", produces = "application/json")
    public ResponseEntity<Object> getBookingByPatientId(@PathVariable("patientId") Integer patientId)
        throws Exception {
        List<Booking> bookingList = bookingService.findBookingByPatientId(patientId);
        if (bookingList.size() > 0) {
            return  new ResponseEntity<>(bookingList, HttpStatus.OK);
        } else  {
            throw new Exception("Could not find bookings for patient");
        }
    }


    /**
     * Find all bookings for a particular doctor id
     * @param doctorId Integer value of doctor's userId
     * @return List of all bookings associated with a particular doctor id
     * @throws Exception
     */
    @GetMapping(path="/doctor{doctorId}", produces = "application/json")
    public ResponseEntity<Object> getBookingByDoctorId(@PathVariable("doctorId") Integer doctorId)
            throws Exception {
        List<Booking> bookingList = bookingService.findBookingByDoctorId(doctorId);
        if (bookingList.size() > 0) {
            return  new ResponseEntity<>(bookingList, HttpStatus.OK);
        } else  {
            throw new Exception("Could not find bookings for doctor");
        }
    }


    /**
     * Create new booking in the database. Booking ID is added internally.
     * @param booking - booking object as json
     * @return booking object as created in database.
     * @throws Exception
     */
    @PostMapping(path = "/new", consumes = "application/json", produces = "application/json")
    public ResponseEntity<Object> makeBooking(@RequestBody Booking booking)
            throws Exception {
        Booking createdService = bookingService.createBooking(booking);
        return new ResponseEntity<>(createdService, HttpStatus.CREATED);
    }



}
