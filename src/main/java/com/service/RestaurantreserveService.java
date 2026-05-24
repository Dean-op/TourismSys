package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.RestaurantreserveEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.RestaurantreserveView;


/**
 * 餐厅预订
 *
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface RestaurantreserveService extends IService<RestaurantreserveEntity> {

    PageUtils queryPage(Map<String, Object> params);
    

   	
   	List<RestaurantreserveView> selectListView(Wrapper<RestaurantreserveEntity> wrapper);
   	
   	RestaurantreserveView selectView(@Param("ew") Wrapper<RestaurantreserveEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<RestaurantreserveEntity> wrapper);

	Double calculateRating(Long id);
}

