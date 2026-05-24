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


import com.dao.HotelreserveDao;
import com.entity.HotelreserveEntity;
import com.service.HotelreserveService;
import com.entity.view.HotelreserveView;

@Service("hotelreserveService")
public class HotelreserveServiceImpl extends ServiceImpl<HotelreserveDao, HotelreserveEntity> implements HotelreserveService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<HotelreserveEntity> page = this.selectPage(
                new Query<HotelreserveEntity>(params).getPage(),
                new EntityWrapper<HotelreserveEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<HotelreserveEntity> wrapper) {
		  Page<HotelreserveView> page =new Query<HotelreserveView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    

	@Override
	public List<HotelreserveView> selectListView(Wrapper<HotelreserveEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public HotelreserveView selectView(Wrapper<HotelreserveEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

	@Override
	public Double calculateRating(Long id) {
		return baseMapper.calculateRating(id);
	}
}
