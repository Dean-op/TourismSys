package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussrestaurantinfoEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussrestaurantinfoView;


/**
 * 餐厅信息评论表
 *
 * @author 
 * @email 
 * @date 2025-11-09 18:31:56
 */
public interface DiscussrestaurantinfoService extends IService<DiscussrestaurantinfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    

   	
   	List<DiscussrestaurantinfoView> selectListView(Wrapper<DiscussrestaurantinfoEntity> wrapper);
   	
   	DiscussrestaurantinfoView selectView(@Param("ew") Wrapper<DiscussrestaurantinfoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussrestaurantinfoEntity> wrapper);
   	

}

