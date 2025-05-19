package com.javaweb.controller.admin;


import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IBuildingService buildingService;

    @GetMapping("/admin/building-list")
    public ModelAndView getBuilding(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("buildingSearchRequest", buildingSearchRequest);
        mav.addObject("staff", userService.getStaffs());
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypeCodes());

        DisplayTagUtils.of(request, buildingSearchRequest);
        List<BuildingSearchResponse> buildings = buildingService.findAll(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        BuildingSearchResponse buildingSearchResponse = new BuildingSearchResponse();
        buildingSearchResponse.setListResult(buildings);
        buildingSearchResponse.setTotalItems(buildingService.countTotalSearch(buildingSearchRequest));
        mav.addObject("buildingSearchResponse", buildingSearchResponse);
        return mav;
    }


    @GetMapping("/admin/building-edit")
    public ModelAndView createBuilding(@ModelAttribute BuildingDTO buildingDTO) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingDTO", buildingDTO);
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypeCodes());
        return mav;
    }

    @GetMapping("/admin/building-edit-{id}")
    public ModelAndView editBuilding(@PathVariable Long id){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.findById(id);
        mav.addObject("buildingDTO", buildingDTO);
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypeCodes());
        return mav;
    }

}
