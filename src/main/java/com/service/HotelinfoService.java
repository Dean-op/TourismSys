package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.HotelinfoEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.HotelinfoView;


/**
 * 酒店信息
 *
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface HotelinfoService extends IService<HotelinfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

   	
   	List<HotelinfoView> selectListView(Wrapper<HotelinfoEntity> wrapper);
   	
   	HotelinfoView selectView(@Param("ew") Wrapper<HotelinfoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<HotelinfoEntity> wrapper);

}

