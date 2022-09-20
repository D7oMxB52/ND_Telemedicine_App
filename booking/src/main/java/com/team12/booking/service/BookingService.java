package com.team12.booking.service;
import com.team12.booking.dao.BookingDAO;
import com.team12.booking.model.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {

    @Autowired
    BookingDAO bookingDao;

    public Booking createBooking(Booking booking) {
        System.out.println("In createBooking method!");
        int numOfUsers = bookingDao.findAll().size();
        booking.setBookingId(numOfUsers+1);
        System.out.println(numOfUsers);
        return bookingDao.save(booking);
    }


}
