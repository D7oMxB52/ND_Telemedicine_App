package com.example.nd_telemedicine_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.nd_telemedicine_app.model.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("SELECT u FROM User u WHERE u.role = 'DR' and u.verified = false and u.active = true")
    List<User> getAllUnverifiedDoctors();

    @Query("SELECT u FROM User u WHERE u.role = 'PA' and u.active = true")
    List<User> getAllActivePatients();

    @Query("SELECT u from User u WHERE u.role = 'DR' and u.active = true and u.verified = true")
    List<User> getAllActiveDoctors();
}