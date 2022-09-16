package com.example.nd_telemedicine_app.repository;

import com.example.nd_telemedicine_app.model.PatientHealthInfo;


import static org.assertj.core.api.Assertions.assertThat;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.List;
import java.util.Optional;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class PatientHealthInfoRepositoryTest {

    @Autowired
    private PatientHealthInfoRepository patientHealthInfoRepository;



    //UNIT TEST FOR SAVING PATIENT'S INFORMATION INTO REPOSITORY
    @Test
    public void savePatientInfoTest(){
//        PatientHealthInfo phi = new PatientHealthInfo();
//                phi.setHeight(13.2);
//                phi.setWeight(70.3);
//                phi.setHealthStatus("fine");
//        patientHealthInfoRepository.save(phi);
//        Assertions.assertThat(phi.getId()).isGreaterThan(0);


}
    @Test
    public void gettingSpecificPatientByIdTest(){

//        PatientHealthInfo phi = patientHealthInfoRepository.findById(1L).get();
//        Assertions.assertThat(phi.getId()).isEqualTo(1L);
    }

    @Test
    public void getListOfPatientsTest(){

        List<PatientHealthInfo> phi = patientHealthInfoRepository.findAll();

        // if the size is greater than 0 then the phi contain list of patients
        Assertions.assertThat(phi.size()).isGreaterThan(0);
    }

    @Test
    public void updatedPatientByIdTest(){

        PatientHealthInfo phi = patientHealthInfoRepository.findById(1L).get();
        // i will update the weight as example.
        phi.setWeight(89.3);
        PatientHealthInfo updated_phi = patientHealthInfoRepository.save(phi);
        Assertions.assertThat(updated_phi.getWeight()).isEqualTo(phi.getWeight());
    }

    @Test
    public void deletePatientTest(){

        PatientHealthInfo phi = patientHealthInfoRepository.findById(1L).get();
        patientHealthInfoRepository.delete(phi);
        PatientHealthInfo phi_test = null;

        Optional<PatientHealthInfo> optional_phi = patientHealthInfoRepository.findById(1L);

        if(optional_phi.isPresent()){
            phi_test = optional_phi.get();
        }

        assertThat(phi_test).isNull();
    }
}