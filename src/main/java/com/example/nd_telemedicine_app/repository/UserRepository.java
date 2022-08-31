package com.example.nd_telemedicine_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.nd_telemedicine_app.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}
