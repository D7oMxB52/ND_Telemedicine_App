package com.team12.booking.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AvailabilityDAO extends JpaRepository<Availability, Integer> {

}
