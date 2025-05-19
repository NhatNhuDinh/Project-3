package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.BuildingRepositoryCustom;
import com.javaweb.utils.Validation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public List<BuildingEntity> getAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable) {

        StringBuilder sql = new StringBuilder("select b.* from building b");
        StringBuilder where = new StringBuilder(" where 1 = 1");
        addJoin(buildingSearchBuilder, sql);
        addWhere(buildingSearchBuilder, where);
        sql.append(where);
        String groupBy = " group by b.id ";
        sql.append(groupBy).append("Order by b.createddate desc ");
        sql.append(" LIMIT ").append(pageable.getPageSize());
        sql.append(" OFFSET ").append(pageable.getPageSize() * pageable.getPageNumber());
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalSearch(BuildingSearchBuilder buildingSearchBuilder) {
        //  Query lấy tổng số bản ghi (count)
        StringBuilder countSql = new StringBuilder("select count(distinct b.id) from building b");
        StringBuilder where = new StringBuilder(" where 1 = 1");
        addJoin(buildingSearchBuilder, countSql);
        addWhere(buildingSearchBuilder, where);
        countSql.append(where);
        Query countQuery = entityManager.createNativeQuery(countSql.toString());
        Number countResult = (Number) countQuery.getSingleResult();
        return countResult.intValue();
    }

    private void addJoin(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {

        // handle staff id
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            sql.append(" join assignmentbuilding ab on b.id = ab.buildingid");
        }

        // handle rentArea
        Long rentAreaFrom = buildingSearchBuilder.getRentAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getRentAreaTo();
        if (rentAreaFrom != null || rentAreaTo != null) {
            sql.append(" join rentarea ra on ra.buildingid = b.id");
        }

    }

    private void addWhere(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String key = field.getName(); // lay ten field thoi		
                if (!key.equals("staffId") && !key.equals("typeCode") && !key.contains("From") && !key.contains("To")) {
                    Object value =  field.get(buildingSearchBuilder);

                    if (value != null) {
                        if (Validation.isNumber(value.toString())) {
                            where.append(" and b." + key + "= " + value);
                        } else {
                            where.append(" and b." + key + " like '%" + value + "%'");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();

        if (rentPriceFrom != null) {
            where.append(" and b.rentprice >= " + rentPriceFrom);
        }
        if (rentPriceTo != null) {
            where.append(" and b.rentprice <= " + rentPriceTo);
        }


        // handle staff id
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            where.append(" and ab.staffid = '" + staffId + "'");
        }

        // handle rentArea
        Long rentAreaFrom = buildingSearchBuilder.getRentAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getRentAreaTo();

        if (rentAreaFrom != null) {
            where.append(" and ra.value >= " + rentAreaFrom);
        }
        if (rentAreaTo != null) {
            where.append(" and ra.value <= " + rentAreaTo);
        }


        // handle typeCode
        if ( buildingSearchBuilder.getTypeCode() != null && !buildingSearchBuilder.getTypeCode().isEmpty()) {
            String typeCodeCondition = buildingSearchBuilder.getTypeCode()
                    .stream()
                    .collect(Collectors.joining("|", "'", "'"));
            where.append(" and b.type REGEXP " + typeCodeCondition);
        }

    }

}
