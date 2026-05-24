package com.dao;

import com.entity.HotelinfoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.HotelinfoView;


/**
 * 酒店信息
 * 
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
public interface HotelinfoDao extends BaseMapper<HotelinfoEntity> {
	

	
	List<HotelinfoView> selectListView(@Param("ew") Wrapper<HotelinfoEntity> wrapper);

	List<HotelinfoView> selectListView(Pagination page,@Param("ew") Wrapper<HotelinfoEntity> wrapper);
	
	HotelinfoView selectView(@Param("ew") Wrapper<HotelinfoEntity> wrapper);
	

}
