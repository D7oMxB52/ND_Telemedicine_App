package com.example.nd_telemedicine_app;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

public class Testing_UserProfile_Patient {
    UserProfile_Patient test_p_1;

    @BeforeEach
    void setup(){
        test_p_1 = new UserProfile_Patient();
    }
    @Test
    void shouldShowCorrectRole(){
        // making sure that the user is patient
        Assertions.assertEquals(User.Role.PA,test_p_1.role);

    }

    @Test
    @DisplayName(" Should have inserted correct day")
    void ShouldHaveInsertedCorrectDay(){
        // i can also set condition for some months that may do not contain 31
        // but just for making it easy i leave it as it is.

        assertTrue(test_p_1.birthday.getDay() <= 31 && test_p_1.birthday.getDay() >= 1, () -> "The inserted Day is wrong");

    }
    @Test
    @DisplayName(" Should have inserted correct month")
    void ShouldHaveInsertedCorrectMonth(){

        assertTrue(test_p_1.birthday.getMonth() <= 12 && test_p_1.birthday.getMonth() >= 1, () -> "The inserted month is wrong");
    }
    @Test
    @DisplayName(" Should have inserted correct year")
    void ShouldHaveInsertedCorrectYear(){

        // assume the patient could be a baby and his parent is making a profile for him in the app
        // we also assume that the age can be maximum 120
        assertTrue(test_p_1.birthday.getYear() <= 2022 && test_p_1.birthday.getYear() >= 1902, () -> "The inserted Year is wrong");

    }

}
