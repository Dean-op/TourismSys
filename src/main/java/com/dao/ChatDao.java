package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.ChatEntity;
import com.entity.view.ChatView;

import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * AI问答
 * 
 * @author 
 * @email 
 * @date 2025-11-06 09:56:36
 */
public interface ChatDao extends BaseMapper<ChatEntity> {
	

	
	List<ChatView> selectListView(@Param("ew") Wrapper<ChatEntity> wrapper);

	List<ChatView> selectListView(Pagination page,@Param("ew") Wrapper<ChatEntity> wrapper);
	
	ChatView selectView(@Param("ew") Wrapper<ChatEntity> wrapper);
	

}
