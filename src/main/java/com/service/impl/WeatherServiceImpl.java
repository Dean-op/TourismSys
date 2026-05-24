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


import com.dao.WeatherDao;
import com.entity.WeatherEntity;
import com.service.WeatherService;
import com.entity.view.WeatherView;

@Service("weatherService")
public class WeatherServiceImpl extends ServiceImpl<WeatherDao, WeatherEntity> implements WeatherService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<WeatherEntity> page = this.selectPage(
                new Query<WeatherEntity>(params).getPage(),
                new EntityWrapper<WeatherEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<WeatherEntity> wrapper) {
		  Page<WeatherView> page =new Query<WeatherView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    

	@Override
	public List<WeatherView> selectListView(Wrapper<WeatherEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public WeatherView selectView(Wrapper<WeatherEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
