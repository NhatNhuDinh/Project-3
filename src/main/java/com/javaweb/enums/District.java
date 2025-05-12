package com.javaweb.enums;

import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

public enum District {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4"),
    QUAN_5("Quận 5"),
    QUAN_6("Quận 6"),
    QUAN_7("Quận 7");

    private final String districtName;

    District(String districtName) {
        this.districtName = districtName;
    }

    public String getdistrictName() {
        return districtName;
    }

    public static Map<String, String> getDistricts(){
        Map<String, String> districts = Arrays.stream(District.values())
                .collect(Collectors.toMap(District::toString, District::getdistrictName,(e, r) -> e, TreeMap::new));
        return districts;
    }
}
