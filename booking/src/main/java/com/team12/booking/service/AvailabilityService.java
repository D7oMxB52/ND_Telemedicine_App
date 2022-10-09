package com.team12.booking.service;

import com.team12.booking.dao.AvailabilityDAO;

import com.team12.booking.model.Availability;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class AvailabilityService {
    @Autowired
    AvailabilityDAO availabilityDao;

    final private LocalTime OPENING_HOURS = LocalTime.parse("08:59:59");
    final private LocalTime CLOSING_HOURS = LocalTime.parse("17:00:00");
    final private long APPOINTMENT_DURATION = 15;

    public Availability createAvailability(Availability availability) throws Exception {
        // CHECK THAT THERE ISN'T ANOTHER AVAILABILITY FOR THE DOCTOR AT THAT TIME
        try {
            if (!availabilityIsNotDuplicate(availability.getAvailabilityTime(), availability.getDoctorId()) && availability.getAvailabilityTime().isAfter(OPENING_HOURS)
                    && availability.getAvailabilityTime().isBefore(CLOSING_HOURS)) {

                if (isWithinTimeLimit(availability.getAvailabilityTime(), availability.getAvailabilityEndTime()) == 0){
                    int numOfAvailabilities = availabilityDao.findAll().size();
                    availability.setAvailabilityId(numOfAvailabilities+1);
                    availabilityDao.save(availability);
                    return availability;
                }
            }

            return null;
        } catch (Exception e){
            throw new Exception("Availabilty was not made successfully. Check availability_id");
        }
    }

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

    private boolean availabilityIsNotDuplicate(LocalTime startTime, Integer doctorId){
        List<Availability> allAvailabilities = getAllAvailabilitiesForDoctor(doctorId);
        boolean isAlreadyEntered = false;
        for (int i = 0; i < allAvailabilities.size(); i++){
            if (allAvailabilities.get(i).getAvailabilityTime() == startTime) {
                isAlreadyEntered = true;
            }
        }
        return isAlreadyEntered;
    }

    public List<Availability> getAllAvailabilitiesForDoctor(Integer doctorId){
        List<Availability> allAvailabilities = availabilityDao.findAll();
        List<Availability> availabilitiesForDoctorId = new ArrayList<>();

        for (int i = 0; i < allAvailabilities.size(); i++) {
            if (allAvailabilities.get(i).getDoctorId() == doctorId) {
                availabilitiesForDoctorId.add(allAvailabilities.get(i));
            }
        }
        return availabilitiesForDoctorId;
    }
}
