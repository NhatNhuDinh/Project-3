package com.javaweb.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name="building")
@Getter
@Setter
public class BuildingEntity extends BaseEntity{

    @OneToMany(mappedBy = "buildingEntity", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference(value = "building-rentArea")
    private List<RentAreaEntity> rentAreaEntityList;

//    @OneToMany(mappedBy = "buildingEntity", fetch = FetchType.LAZY)
//    @JsonManagedReference(value = "building-assignmentBuilding")
//    private List<AssignmentBuildingEntity> assignmentBuildingEntityList;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> userEntityList = new ArrayList<>();

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "street")
    private String street;

    @Column(name = "ward")
    private String ward;

    @Column(name = "district", nullable = false)
    private String district;

    @Column(name = "structure")
    private String structure;

    @Column(name = "numberofbasement")
    private Long numberOfBasement;

    @Column(name = "floorarea")
    private Long floorArea;

    @Column(name = "level")
    private String level;

    @Column(name = "type", nullable = false)
    private String typeCode;

    @Column(name = "overtimefee")
    private String overtimeFee;

    @Column(name = "electricityfee")
    private String electricityFee;

    @Column(name = "deposit")
    private String deposit;

    @Column(name = "payment")
    private String payment;

    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationTime;

    @Column(name = "rentpricedescription")
    private String rentPriceDescription;

    @Column(name = "carfee")
    private String carFee;

    @Column(name = "motofee")
    private String motoFee;

    @Column(name = "direction")
    private String direction;

    @Column(name = "note")
    private String note;

    @Column(name = "managername")
    private String managerName;

    @Column(name = "managerphone")
    private String managerPhone;

    @Column(name = "rentprice", nullable = false)
    private String rentPrice;

    @Column(name = "servicefee")
    private String serviceFee;

    @Column(name = "brokeragefee")
    private Double brokerageFee;

    @Column(name = "avatar")
    private String image;
}
