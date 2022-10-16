package com.example.nd_telemedicine_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;


// entrypoint that will configure the application
@SpringBootApplication
@Configuration
public class NdTelemedicineAppApplication {
    public static void main(String[] args) {
        SpringApplication.run(NdTelemedicineAppApplication.class, args);
    }

}
