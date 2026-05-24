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


import com.dao.DiscusshotelinfoDao;
import com.entity.DiscusshotelinfoEntity;
import com.service.DiscusshotelinfoService;

import com.entity.view.DiscusshotelinfoView;

@Service("discusshotelinfoService")
public class DiscusshotelinfoServiceImpl extends ServiceImpl<DiscusshotelinfoDao, DiscusshotelinfoEntity> implements DiscusshotelinfoService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscusshotelinfoEntity> page = this.selectPage(
                new Query<DiscusshotelinfoEntity>(params).getPage(),
                new EntityWrapper<DiscusshotelinfoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscusshotelinfoEntity> wrapper) {
		  Page<DiscusshotelinfoView> page =new Query<DiscusshotelinfoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    

	
	@Override
	public List<DiscusshotelinfoView> selectListView(Wrapper<DiscusshotelinfoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscusshotelinfoView selectView(Wrapper<DiscusshotelinfoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
