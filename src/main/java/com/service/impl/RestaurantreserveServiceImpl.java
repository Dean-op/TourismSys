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


import com.dao.RestaurantreserveDao;
import com.entity.RestaurantreserveEntity;
import com.service.RestaurantreserveService;

import com.entity.view.RestaurantreserveView;

@Service("restaurantreserveService")
public class RestaurantreserveServiceImpl extends ServiceImpl<RestaurantreserveDao, RestaurantreserveEntity> implements RestaurantreserveService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<RestaurantreserveEntity> page = this.selectPage(
                new Query<RestaurantreserveEntity>(params).getPage(),
                new EntityWrapper<RestaurantreserveEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<RestaurantreserveEntity> wrapper) {
		  Page<RestaurantreserveView> page =new Query<RestaurantreserveView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    

	
	@Override
	public List<RestaurantreserveView> selectListView(Wrapper<RestaurantreserveEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public RestaurantreserveView selectView(Wrapper<RestaurantreserveEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

	@Override
	public Double calculateRating(Long id) {
		return baseMapper.calculateRating(id);
	}
}
