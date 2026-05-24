package com.dao;

import com.entity.DiscusshotelinfoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;

import com.entity.view.DiscusshotelinfoView;


/**
 * 酒店信息评论表
 * 
 * @author 
 * @email 
 * @date 2025-11-09 18:31:56
 */
public interface DiscusshotelinfoDao extends BaseMapper<DiscusshotelinfoEntity> {
	

	
	List<DiscusshotelinfoView> selectListView(@Param("ew") Wrapper<DiscusshotelinfoEntity> wrapper);

	List<DiscusshotelinfoView> selectListView(Pagination page,@Param("ew") Wrapper<DiscusshotelinfoEntity> wrapper);
	
	DiscusshotelinfoView selectView(@Param("ew") Wrapper<DiscusshotelinfoEntity> wrapper);
	

}
