package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.WeatherEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.WeatherView;


/**
 * 天气预报
 *
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface WeatherService extends IService<WeatherEntity> {

    PageUtils queryPage(Map<String, Object> params);

   	
   	List<WeatherView> selectListView(Wrapper<WeatherEntity> wrapper);
   	
   	WeatherView selectView(@Param("ew") Wrapper<WeatherEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<WeatherEntity> wrapper);
   	

}

