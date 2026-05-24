package com.dao;

import com.entity.GuideEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.GuideView;


/**
 * 导游
 */
public interface GuideDao extends BaseMapper<GuideEntity> {
	
	List<GuideView> selectListView(@Param("ew") Wrapper<GuideEntity> wrapper);

	List<GuideView> selectListView(Pagination page,@Param("ew") Wrapper<GuideEntity> wrapper);
	
	GuideView selectView(@Param("ew") Wrapper<GuideEntity> wrapper);
	
}
