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


import com.dao.RestaurantinfoDao;
import com.entity.RestaurantinfoEntity;
import com.service.RestaurantinfoService;

import com.entity.view.RestaurantinfoView;

@Service("restaurantinfoService")
public class RestaurantinfoServiceImpl extends ServiceImpl<RestaurantinfoDao, RestaurantinfoEntity> implements RestaurantinfoService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<RestaurantinfoEntity> page = this.selectPage(
                new Query<RestaurantinfoEntity>(params).getPage(),
                new EntityWrapper<RestaurantinfoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<RestaurantinfoEntity> wrapper) {
		  Page<RestaurantinfoView> page =new Query<RestaurantinfoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    

	
	@Override
	public List<RestaurantinfoView> selectListView(Wrapper<RestaurantinfoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public RestaurantinfoView selectView(Wrapper<RestaurantinfoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
