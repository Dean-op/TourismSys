package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.RestaurantinfoEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.RestaurantinfoView;


/**
 * 餐厅信息
 *
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface RestaurantinfoService extends IService<RestaurantinfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    

   	
   	List<RestaurantinfoView> selectListView(Wrapper<RestaurantinfoEntity> wrapper);
   	
   	RestaurantinfoView selectView(@Param("ew") Wrapper<RestaurantinfoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<RestaurantinfoEntity> wrapper);
   	

}

