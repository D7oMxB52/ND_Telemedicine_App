package com.example.nd_telemedicine_app;
import java.util.Date;

public class UserProfile_Patient {
    // making an example of adding or viewing profile data
    String f_name = "Abdul";
    String l_name = "Alanazi";
    //assume its 1 of Jan 1990
    Date birthday = new Date(90,0,0);
    String email = "abdul@alanazi.com";
    String password = "123456";
    String address  = "1 Bourke st, vic, melbourne";
    // why string ?
    String phoneNum = "0123456789";

    User patient_1 = new    User(f_name, l_name, birthday, email, password, address, phoneNum);

    /*
    assume that the patient want to add/change his profile

    ### the code below must fetch user's data from the database, but for now I will
    get the data from above temporary for testing

     */

    


}


