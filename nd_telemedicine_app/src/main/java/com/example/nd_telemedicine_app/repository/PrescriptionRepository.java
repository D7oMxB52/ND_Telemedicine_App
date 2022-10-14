package com.example.nd_telemedicine_app.repository;

import com.example.nd_telemedicine_app.model.Prescription;
import com.example.nd_telemedicine_app.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrescriptionRepository extends JpaRepository<Prescription, Integer> {
}
