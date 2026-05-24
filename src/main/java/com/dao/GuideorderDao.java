package com.dao;

import com.entity.GuideorderEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.GuideorderView;


/**
 * 导游预约
 */
public interface GuideorderDao extends BaseMapper<GuideorderEntity> {
	
	List<GuideorderView> selectListView(@Param("ew") Wrapper<GuideorderEntity> wrapper);

	List<GuideorderView> selectListView(Pagination page,@Param("ew") Wrapper<GuideorderEntity> wrapper);
	
	GuideorderView selectView(@Param("ew") Wrapper<GuideorderEntity> wrapper);
	
}
