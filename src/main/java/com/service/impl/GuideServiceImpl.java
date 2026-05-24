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


import com.dao.GuideDao;
import com.entity.GuideEntity;
import com.service.GuideService;
import com.entity.view.GuideView;

@Service("guideService")
public class GuideServiceImpl extends ServiceImpl<GuideDao, GuideEntity> implements GuideService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GuideEntity> page = this.selectPage(
                new Query<GuideEntity>(params).getPage(),
                new EntityWrapper<GuideEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<GuideEntity> wrapper) {
		  Page<GuideView> page =new Query<GuideView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

	
	@Override
	public List<GuideView> selectListView(Wrapper<GuideEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public GuideView selectView(Wrapper<GuideEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
