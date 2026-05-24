package com.dao;

import com.entity.WeatherEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.WeatherView;


/**
 * 天气预报
 * 
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface WeatherDao extends BaseMapper<WeatherEntity> {
	

	
	List<WeatherView> selectListView(@Param("ew") Wrapper<WeatherEntity> wrapper);

	List<WeatherView> selectListView(Pagination page,@Param("ew") Wrapper<WeatherEntity> wrapper);
	
	WeatherView selectView(@Param("ew") Wrapper<WeatherEntity> wrapper);
	

}
