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


import com.dao.GuideorderDao;
import com.entity.GuideorderEntity;
import com.service.GuideorderService;
import com.entity.view.GuideorderView;

@Service("guideorderService")
public class GuideorderServiceImpl extends ServiceImpl<GuideorderDao, GuideorderEntity> implements GuideorderService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GuideorderEntity> page = this.selectPage(
                new Query<GuideorderEntity>(params).getPage(),
                new EntityWrapper<GuideorderEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<GuideorderEntity> wrapper) {
		  Page<GuideorderView> page =new Query<GuideorderView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

	
	@Override
	public List<GuideorderView> selectListView(Wrapper<GuideorderEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public GuideorderView selectView(Wrapper<GuideorderEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
