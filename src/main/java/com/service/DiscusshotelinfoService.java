package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscusshotelinfoEntity;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscusshotelinfoView;


/**
 * 酒店信息评论表
 *
 * @author 
 * @email 
 * @date 2025-11-09 18:31:56
 */
public interface DiscusshotelinfoService extends IService<DiscusshotelinfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    

   	
   	List<DiscusshotelinfoView> selectListView(Wrapper<DiscusshotelinfoEntity> wrapper);
   	
   	DiscusshotelinfoView selectView(@Param("ew") Wrapper<DiscusshotelinfoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscusshotelinfoEntity> wrapper);
   	

}

