package com.javaweb.repository;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> {

   @Query(
           "SELECT DISTINCT c FROM CustomerEntity c LEFT JOIN c.userEntityList u " +
                   "WHERE c.isActive = 1 AND " +
                   "((:#{#customerSearchRequest.name} IS NOT NULL AND :#{#customerSearchRequest.name} <> '' AND c.fullName LIKE CONCAT('%', :#{#customerSearchRequest.name}, '%')) OR (:#{#customerSearchRequest.name} IS NULL OR :#{#customerSearchRequest.name} = '')) AND " +
                   "((:#{#customerSearchRequest.customerPhone} IS NOT NULL AND :#{#customerSearchRequest.customerPhone} <> '' AND c.phone LIKE CONCAT('%', :#{#customerSearchRequest.customerPhone}, '%')) OR (:#{#customerSearchRequest.customerPhone} IS NULL OR :#{#customerSearchRequest.customerPhone} = '')) AND " +
                   "(:#{#customerSearchRequest.managementStaff} IS NULL OR u.id = :#{#customerSearchRequest.managementStaff}) AND " +
                   "((:#{#customerSearchRequest.status} IS NOT NULL AND :#{#customerSearchRequest.status} <> '' AND c.status = :#{#customerSearchRequest.status}) OR (:#{#customerSearchRequest.status} IS NULL OR :#{#customerSearchRequest.status} = '')) " +
                   "ORDER BY c.modifiedDate DESC"
   )
    Page<CustomerEntity> findByCustomerSearchRequest(CustomerSearchRequest customerSearchRequest, Pageable pageable);

    List<CustomerEntity> findAllByIdInAndIsActive(List<Long> ids, Long isActive);

    CustomerEntity findByPhone(String phone);

}
