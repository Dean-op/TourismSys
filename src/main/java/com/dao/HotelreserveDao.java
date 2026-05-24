package com.dao;

import com.entity.HotelreserveEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.HotelreserveView;


/**
 * 酒店预订
 * 
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface HotelreserveDao extends BaseMapper<HotelreserveEntity> {

	List<HotelreserveView> selectListView(@Param("ew") Wrapper<HotelreserveEntity> wrapper);

	List<HotelreserveView> selectListView(Pagination page,@Param("ew") Wrapper<HotelreserveEntity> wrapper);
	
	HotelreserveView selectView(@Param("ew") Wrapper<HotelreserveEntity> wrapper);

	Double calculateRating(Long id);
}
