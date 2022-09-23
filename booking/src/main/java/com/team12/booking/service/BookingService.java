package com.team12.booking.service;
import com.team12.booking.dao.BookingDAO;
import com.team12.booking.model.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class BookingService {

    @Autowired
    BookingDAO bookingDao;

    /**
     * Generates new booking and saves to database
     * manually increments primary key booking_id based on number of bookings in database.
     * @param booking
     * @return Booking object to confirm successful creation.
     */
    public Booking createBooking(Booking booking) throws Exception {
        try {
            int numOfUsers = bookingDao.findAll().size();
            booking.setBookingId(numOfUsers+1);
            bookingDao.save(booking);
            return booking;
        } catch (Exception e) {
            throw new Exception("Booking was not made successfully. Check booking_id");
        }
    }

    public Optional findBookingById(Integer bookingId) throws NoSuchElementException {
        try {
            return bookingDao.findById(bookingId);
        } catch (Exception e) {
            throw new NoSuchElementException("Booking ID not found");
        }
    }

    /**
     * Find all bookings for a particular patientId
     * @param patientId foreign key of patient (user) id
     * @return ArrayList of bookings
     * @throws NoSuchElementException
     */
    public List findBookingByPatientId(Integer patientId) throws NoSuchElementException {
        List<Booking> allBookings;
        List<Booking> patientBookings;
        try {
           allBookings = bookingDao.findAll();
           patientBookings = new ArrayList<>();
           for (int i = 0; i < allBookings.size(); i++){
               if (allBookings.get(i).getPatientId() == patientId){
                   patientBookings.add(allBookings.get(i));
               }
           }
        return patientBookings;

        } catch (Exception e){
            throw new NoSuchElementException("No bookings exist for this patient or patient doesn't exist. ");
        }
    }
}
