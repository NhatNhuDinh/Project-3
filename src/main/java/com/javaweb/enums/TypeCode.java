package com.javaweb.enums;

import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

public enum TypeCode {
    NOI_THAT("Nội Thất"),
    NGUYEN_CAN("Nguyên Căn"),
    TANG_TRET("Tầng Trệt");

    private final String TypeName;

    TypeCode(String typeName) {
        TypeName = typeName;
    }
    public String getTypeName() {
        return TypeName;
    }

    public static Map<String, String> getTypeCodes(){
        Map<String, String> typeCodes = Arrays.stream(TypeCode.values())
                .collect(Collectors.toMap(TypeCode::toString, TypeCode::getTypeName,(e, r) -> e, TreeMap::new));
        return typeCodes;
    }
}
