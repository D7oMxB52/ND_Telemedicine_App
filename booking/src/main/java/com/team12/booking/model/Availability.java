package com.team12.booking.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Availability {
   @Id
   private Integer availabilityId;
   @Column
   private LocalTime availabilityTime;
   @Column
   private LocalTime availabilityEndTime;
   @Column
   private LocalDate availabilityDate;
   @Column
   private Integer doctorId;

   public Availability() {
   }

   public Availability(Integer availabilityId, LocalTime availabilityTime, LocalTime availabilityEndTime,
                       LocalDate availabilityDate, Integer doctorId) {
      this.availabilityId = availabilityId;
      this.availabilityTime = availabilityTime;
      this.availabilityEndTime = availabilityEndTime;
      this.availabilityDate = availabilityDate;
      this.doctorId = doctorId;
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

   public Integer getDoctorId() {
      return doctorId;
   }

   public void setDoctorId(Integer doctorID) {
      this.doctorId = doctorID;
   }

   public LocalTime getAvailabilityEndTime() {
      return availabilityEndTime;
   }

   public void setAvailabilityEndTime(LocalTime availabilityEndTime) {
      this.availabilityEndTime = availabilityEndTime;
   }
}
