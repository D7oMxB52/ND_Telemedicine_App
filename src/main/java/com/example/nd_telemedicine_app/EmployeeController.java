package com.example.nd_telemedicine_app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(value="/employees", method=RequestMethod.GET)
public class EmployeeController {

    @GetMapping(path="/", produces = "application/json")
    public String createEmployee() {
        return "Return all employees ";
    }
//    @Autowired
//    String empController;
}
