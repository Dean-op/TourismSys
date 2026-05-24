package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.DiscussrestaurantinfoDao;
import com.entity.DiscussrestaurantinfoEntity;
import com.service.DiscussrestaurantinfoService;
import com.entity.view.DiscussrestaurantinfoView;

@Service("discussrestaurantinfoService")
public class DiscussrestaurantinfoServiceImpl extends ServiceImpl<DiscussrestaurantinfoDao, DiscussrestaurantinfoEntity> implements DiscussrestaurantinfoService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussrestaurantinfoEntity> page = this.selectPage(
                new Query<DiscussrestaurantinfoEntity>(params).getPage(),
                new EntityWrapper<DiscussrestaurantinfoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussrestaurantinfoEntity> wrapper) {
		  Page<DiscussrestaurantinfoView> page =new Query<DiscussrestaurantinfoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

	
	@Override
	public List<DiscussrestaurantinfoView> selectListView(Wrapper<DiscussrestaurantinfoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussrestaurantinfoView selectView(Wrapper<DiscussrestaurantinfoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
