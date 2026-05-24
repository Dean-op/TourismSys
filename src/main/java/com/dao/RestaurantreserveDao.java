package com.dao;

import com.entity.RestaurantreserveEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.RestaurantreserveView;


/**
 * 餐厅预订
 * 
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface RestaurantreserveDao extends BaseMapper<RestaurantreserveEntity> {
	

	
	List<RestaurantreserveView> selectListView(@Param("ew") Wrapper<RestaurantreserveEntity> wrapper);

	List<RestaurantreserveView> selectListView(Pagination page,@Param("ew") Wrapper<RestaurantreserveEntity> wrapper);
	
	RestaurantreserveView selectView(@Param("ew") Wrapper<RestaurantreserveEntity> wrapper);

	Double calculateRating(Long id);
}
