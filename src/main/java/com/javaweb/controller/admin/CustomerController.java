package com.javaweb.controller.admin;

import com.javaweb.enums.Status;
import com.javaweb.enums.Transaction;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.ITransactionService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomerController {

    @Autowired
    private IUserService userService;

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private ITransactionService transactionService;

    @GetMapping("/admin/customer-list")
    public ModelAndView getCustomer(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("customerDTO", customerSearchRequest);
        mav.addObject("staff", userService.getStaffs());
        mav.addObject("statuses", Status.getType());

        DisplayTagUtils.of(request, customerSearchRequest);
        customerSearchRequest.setStatus(Status.getType().get(customerSearchRequest.getStatus()));
        Page<CustomerSearchResponse> customers = customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems()));
        int totalItems = (int) customers.getTotalElements();
        int pageSize = customers.getSize();
        mav.addObject("totalItems", totalItems);
        mav.addObject("pageSize", pageSize);
        mav.addObject("customerSearchResponse", customers.getContent());
        return mav;
    }


    @GetMapping("/admin/customer-edit")
    public ModelAndView createCustomer(@ModelAttribute CustomerDTO customerDTO) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerDTO", customerDTO);
        mav.addObject("statuses", Status.getType());
        return mav;
    }

    @GetMapping("/admin/customer-edit-{id}")
    public ModelAndView editCustomer(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.findCustomerById(id);

        mav.addObject("customerDTO", customerDTO);
        mav.addObject("statuses", Status.getType());
        mav.addObject("ddxList", transactionService.getAllTransactionByCodeAndCustomer(Transaction.DDX.toString(), id));
        mav.addObject("cskhList", transactionService.getAllTransactionByCodeAndCustomer(Transaction.CSKH.toString(), id));
        return mav;
    }





}
