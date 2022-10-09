package com.team12.booking.dao;

import com.team12.booking.model.Availability;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AvailabilityDAO extends JpaRepository<Availability, Integer> {

}
