package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.GuideEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.GuideView;


/**
 * 导游
 */
public interface GuideService extends IService<GuideEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    	List<GuideView> selectListView(Wrapper<GuideEntity> wrapper);
    	
    	GuideView selectView(@Param("ew") Wrapper<GuideEntity> wrapper);
    	
    	PageUtils queryPage(Map<String, Object> params,Wrapper<GuideEntity> wrapper);
    	
}
