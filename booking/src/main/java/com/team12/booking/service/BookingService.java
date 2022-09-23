package com.team12.booking.service;
import com.team12.booking.dao.BookingDAO;
import com.team12.booking.model.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
