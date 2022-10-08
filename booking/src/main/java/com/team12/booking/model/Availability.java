package com.team12.booking.model;

import javax.persistence.Column;
import javax.persistence.Id;
import java.time.LocalDate;
import java.time.LocalTime;

public class Availability {
   @Id
   private Integer availabilityId;
   @Column
   private LocalTime availabilityTime;
   @Column
   private LocalDate availabilityDate;
   @Column
   private Integer doctorID;

   public Availability() {
   }

   public Availability(Integer availabilityId, LocalTime availabilityTime, LocalDate availabilityDate, Integer doctorID) {
      this.availabilityId = availabilityId;
      this.availabilityTime = availabilityTime;
      this.availabilityDate = availabilityDate;
      this.doctorID = doctorID;
   }

   public Integer getAvailabilityId() {
      return availabilityId;
   }

   public void setAvailabilityId(Integer availabilityId) {
      this.availabilityId = availabilityId;
   }

   public LocalTime getAvailabilityTime() {
      return availabilityTime;
   }

   public void setAvailabilityTime(LocalTime availabilityTime) {
      this.availabilityTime = availabilityTime;
   }

   public LocalDate getAvailabilityDate() {
      return availabilityDate;
   }

   public void setAvailabilityDate(LocalDate availabilityDate) {
      this.availabilityDate = availabilityDate;
   }

   public Integer getDoctorID() {
      return doctorID;
   }

   public void setDoctorID(Integer doctorID) {
      this.doctorID = doctorID;
   }
}
