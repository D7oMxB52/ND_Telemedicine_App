package com.example.nd_telemedicine_app.model;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class RoleConverter implements AttributeConverter<Role, String> {

    @Override
    public String convertToDatabaseColumn(Role role) {
        if (role == Role.AD) {
            return "AD";
        } else if (role == Role.DR) {
            return "DR";
        } else if (role == Role.PA) {
            return "PA";
        } else {
            return "";
        }
    }

    @Override
    public Role convertToEntityAttribute(String dbData) {
        if (dbData.equals("AD")) {
            return Role.AD;
        } else if (dbData.equals("DR")) {
            return Role.DR;
        } else {
            return Role.PA;
        }
    }

}
