package com.example.nd_telemedicine_app.repository;

import com.example.nd_telemedicine_app.model.PatientHealthInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

// no need to add @Repository bcz its already there
public interface PatientHealthInfoRepository extends JpaRepository<PatientHealthInfo, Integer> {

//    Optional<PatientHealthInfo> findByWeight(double weight);
//    Optional<PatientHealthInfo> findByHeight(double height);
//    Optional<PatientHealthInfo> findByHealthStatus(String healthStatus);

}
