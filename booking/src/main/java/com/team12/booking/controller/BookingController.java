package com.team12.booking.controller;

import com.team12.booking.dao.BookingDAO;
import com.team12.booking.model.Booking;
import com.team12.booking.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/booking")
public class BookingController {

    @Autowired
    private BookingDAO bookingDao;
    @Autowired
    private BookingService bookingService;


    // Get a booking based on bookingId.
    @GetMapping(path="/{bookingId}", produces = "application/json")
    public ResponseEntity<Object> getBookingById(@PathVariable("bookingId") Integer bookingId)
            throws Exception {
        Booking booking = bookingDao.findById(bookingId).get();
        if (booking.getBookingId() == null){
            throw new Exception("Booking not found");
        } else
            return new ResponseEntity<>(booking, HttpStatus.OK);
        // List of HttpStatus codes https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/http/HttpStatus.html
    }

    // getbooking for a particular user (patient and doctor)

    // Make booking
    @PostMapping(path = "/new", consumes = "application/json", produces = "application/json")
    public ResponseEntity<Object> makeBooking(@RequestBody Booking booking)
            throws Exception {
        Booking createdService = bookingService.createBooking(booking);
        return new ResponseEntity<>(createdService, HttpStatus.CREATED);
    }



}
