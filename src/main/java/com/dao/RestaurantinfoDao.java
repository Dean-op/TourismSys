package com.dao;

import com.entity.RestaurantinfoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.RestaurantinfoView;


/**
 * 餐厅信息
 * 
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface RestaurantinfoDao extends BaseMapper<RestaurantinfoEntity> {
	

	List<RestaurantinfoView> selectListView(@Param("ew") Wrapper<RestaurantinfoEntity> wrapper);

	List<RestaurantinfoView> selectListView(Pagination page,@Param("ew") Wrapper<RestaurantinfoEntity> wrapper);
	
	RestaurantinfoView selectView(@Param("ew") Wrapper<RestaurantinfoEntity> wrapper);
	

}
