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


import com.dao.HotelinfoDao;
import com.entity.HotelinfoEntity;
import com.service.HotelinfoService;
import com.entity.view.HotelinfoView;

@Service("hotelinfoService")
public class HotelinfoServiceImpl extends ServiceImpl<HotelinfoDao, HotelinfoEntity> implements HotelinfoService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<HotelinfoEntity> page = this.selectPage(
                new Query<HotelinfoEntity>(params).getPage(),
                new EntityWrapper<HotelinfoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<HotelinfoEntity> wrapper) {
		  Page<HotelinfoView> page =new Query<HotelinfoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

	
	@Override
	public List<HotelinfoView> selectListView(Wrapper<HotelinfoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public HotelinfoView selectView(Wrapper<HotelinfoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
