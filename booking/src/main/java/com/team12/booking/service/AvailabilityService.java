package com.team12.booking.service;

import com.team12.booking.dao.AvailabilityDAO;

import com.team12.booking.model.Availability;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AvailabilityService {
    @Autowired
    AvailabilityDAO availabilityDao;

    public Availability createAvailability(Availability availability) throws Exception {
        try {
            int numOfAvailabilities = availabilityDao.findAll().size();
            availability.setAvailabilityId(numOfAvailabilities+1);
            availabilityDao.save(availability);
            return availability;
        } catch (Exception e){
            throw new Exception("Availabilty was not made successfully. Check availability_id");
        }
    }
    // Methods here for functionality

}
