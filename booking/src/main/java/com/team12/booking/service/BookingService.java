package com.team12.booking.service;
import com.team12.booking.dao.BookingDAO;
import com.team12.booking.model.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class BookingService {

    @Autowired
    BookingDAO bookingDao;


    final private LocalTime OPENING_HOURS = LocalTime.parse("08:59:59");
    final private LocalTime CLOSING_HOURS = LocalTime.parse("17:00:00");
    final private long APPOINTMENT_DURATION = 15;

    /**
     * Generates new booking and saves to database
     * manually increments primary key booking_id based on number of bookings in database.
     * @param booking
     * @return Booking object to confirm successful creation.
     */
    public Booking createBooking(Booking booking) throws Exception {
        System.out.println("INSIDE CREATEBOOKING in booking service" + booking.getDoctorId());
        try {
            System.out.println("INSIDE TRY BLOCK");
            if (!availabilityIsNotDuplicate(booking.getBookingDate(), booking.getBookingTime(), booking.getDoctorId()) &&
                    booking.getBookingTime().isAfter(OPENING_HOURS)
                    && booking.getBookingTime().isBefore(CLOSING_HOURS)) {
                    System.out.println("LEVEL 1 IF");

                if (isWithinTimeLimit(booking.getBookingTime(), booking.getBookingEndTime()) == 0){
                    System.out.println("LEVEL 2 IF");
                    int numOfBookings = bookingDao.findAll().size();
                    booking.setBookingId(numOfBookings+1);

                    bookingDao.save(booking);
                    return booking;
                }
            }
            return null;
        } catch (Exception e) {
            throw new Exception("Booking was not made successfully. Check booking_id");
        }
    }

//    public Availability createAvailability(Availability availability) throws Exception {
//        try {
//
//
//            return null;
//        } catch (Exception e){
//            throw new Exception("Availabilty was not made successfully. Check availability_id");
//        }
//    }

    /**
     * Find a single booking by primary key bookingId.
     * @param bookingId
     * @return
     * @throws NoSuchElementException
     */
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

    /**
     * Searches all bookings in database to find bookings associated with a doctor
     * @param doctorId Doctor's user id (primary key in user table)
     * @return List of all bookings associated with a particular doctor
     * @throws NoSuchElementException
     */
    public List findBookingByDoctorId(Integer doctorId) throws NoSuchElementException {
        List<Booking> allBookings;
        List<Booking> doctorBookings;
        try {
            allBookings = bookingDao.findAll();
            doctorBookings = new ArrayList<>();
            for (int i = 0; i < allBookings.size(); i++){
                if (allBookings.get(i).getDoctorId() == doctorId){
                    doctorBookings.add(allBookings.get(i));
                }
            }
            return doctorBookings;

        } catch (Exception e){
            throw new NoSuchElementException("No bookings exist for this patient or patient doesn't exist. ");
        }
    }

//    public List<Availability> getAllBookingsForDoctor(Integer doctorId){
//        List<Availability> allAvailabilities = availabilityDao.findAll();
//        List<Availability> availabilitiesForDoctorId = new ArrayList<>();
//
//        for (int i = 0; i < allAvailabilities.size(); i++) {
//            if (allAvailabilities.get(i).getDoctorId() == doctorId) {
//                availabilitiesForDoctorId.add(allAvailabilities.get(i));
//            }
//        }
//        return availabilitiesForDoctorId;
//    }

    /**
     * Verifies that availability is of exactly 15 minute duration.
     * @param startTime
     * @param endTime
     * @return Integer value representing the comparison of the start and endtimes. 0 = valid appointment duration
     */
    private int isWithinTimeLimit(LocalTime startTime, LocalTime endTime){
        LocalTime durationAppointment = endTime.minusMinutes(APPOINTMENT_DURATION);
        return (durationAppointment.compareTo(startTime));
    }

    private boolean availabilityIsNotDuplicate(LocalDate date, LocalTime startTime, Integer doctorId){
        System.out.println("AVAILABILITY NOT DUPLICATE METHOD");
        List<Booking> allBookings = findBookingByDoctorId(doctorId);
        System.out.println("AFTER BOOKING LIST RETRIEVED");
        boolean isAlreadyEntered = false;
        for (int i = 0; i < allBookings.size(); i++){
            if (allBookings.get(i).getBookingTime() == startTime && (allBookings.get(i).getBookingDate()).compareTo(date) == 0) {
                isAlreadyEntered = true;
            }
        }
        return isAlreadyEntered;
    }

//    public List<Availability> getAllAvailabilitiesForDate(LocalDate availabilityDate){
//        List<Availability> allAvailabilities = availabilityDao.findAll();
//        List<Availability> availabilitiesForDate = new ArrayList<>();
//
//        for (int i = 0; i < allAvailabilities.size(); i++) {
//            if (allAvailabilities.get(i).getAvailabilityDate().compareTo(availabilityDate) == 0) {
//                availabilitiesForDate.add(allAvailabilities.get(i));
//
//            }
//        }
//        return availabilitiesForDate;
//    }
}
