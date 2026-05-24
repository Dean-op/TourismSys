package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.GuideorderEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.GuideorderView;


/**
 * 导游预约
 */
public interface GuideorderService extends IService<GuideorderEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
    	List<GuideorderView> selectListView(Wrapper<GuideorderEntity> wrapper);
    	
    	GuideorderView selectView(@Param("ew") Wrapper<GuideorderEntity> wrapper);
    	
    	PageUtils queryPage(Map<String, Object> params,Wrapper<GuideorderEntity> wrapper);
    	
}
