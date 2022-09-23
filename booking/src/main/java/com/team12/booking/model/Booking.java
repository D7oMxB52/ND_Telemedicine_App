package com.team12.booking.model;

import java.time.LocalDate;
import java.time.LocalTime;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Booking {

    @Id
    private Integer bookingId;
    private Integer patientId; // Placeholder - update with User object
    private Integer doctorId; // Placeholder - update with User Object
    private LocalDate bookingDate;
    private LocalTime bookingTime; // Assume all appointments fixed at 15 minutes.
    private String chatLink;
    private boolean hasPaid;
    private boolean hasConfirmed;

    public Booking() {

    }

    public Booking(Integer bookingId, Integer patientId, Integer doctorId, LocalDate bookingDate,
                   LocalTime bookingTime, String chatLink, boolean hasPaid, boolean hasConfirmed) {
        this.bookingId = bookingId;
        this.patientId = patientId;
        this.doctorId = doctorId;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.chatLink = chatLink;
        this.hasPaid = hasPaid;
        this.hasConfirmed = hasConfirmed;
    }



    public Integer getBookingId() {
        return bookingId;
    }

    public void setBookingId(Integer bookingId) {
        this.bookingId = bookingId;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public LocalTime getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(LocalTime bookingTime) {
        this.bookingTime = bookingTime;
    }

    public String getChatLink() {
        return chatLink;
    }

    public void setChatLink(String chatLink) {
        this.chatLink = chatLink;
    }

    public boolean isHasPaid() {
        return hasPaid;
    }

    public void setHasPaid(boolean hasPaid) {
        this.hasPaid = hasPaid;
    }

    public boolean isHasConfirmed() {
        return hasConfirmed;
    }

    public void setHasConfirmed(boolean hasConfirmed) {
        this.hasConfirmed = hasConfirmed;
    }
}
