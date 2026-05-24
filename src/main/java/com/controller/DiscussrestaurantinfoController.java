package com.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.DiscussrestaurantinfoEntity;
import com.entity.RestaurantinfoEntity;
import com.entity.view.DiscussrestaurantinfoView;

import com.service.DiscussrestaurantinfoService;
import com.service.RestaurantinfoService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;

/**
 * 餐厅信息评论表
 * 后端接口
 * @author 
 * @email 
 * @date 2025-11-09 18:31:56
 */
@RestController
@RequestMapping("/discussrestaurantinfo")
public class DiscussrestaurantinfoController {
    @Autowired
    private DiscussrestaurantinfoService discussrestaurantinfoService;

    @Autowired
    private RestaurantinfoService restaurantinfoService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiscussrestaurantinfoEntity discussrestaurantinfo,
		HttpServletRequest request){
        EntityWrapper<DiscussrestaurantinfoEntity> ew = new EntityWrapper<DiscussrestaurantinfoEntity>();

        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("merchant")) {
            String username = (String)request.getSession().getAttribute("username");
            List<RestaurantinfoEntity> restaurants = restaurantinfoService.selectList(new EntityWrapper<RestaurantinfoEntity>().eq("merchantusername", username));
            List<Long> restaurantIds = new ArrayList<>();
            for(RestaurantinfoEntity r : restaurants) {
                restaurantIds.add(r.getId());
            }
            if(restaurantIds.size() > 0) {
                ew.in("refid", restaurantIds);
            } else {
                ew.eq("refid", -1L); // 无餐厅，则显示空评论
            }
        }

		PageUtils page = discussrestaurantinfoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussrestaurantinfo), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DiscussrestaurantinfoEntity discussrestaurantinfo, 
		HttpServletRequest request){
        EntityWrapper<DiscussrestaurantinfoEntity> ew = new EntityWrapper<DiscussrestaurantinfoEntity>();

		PageUtils page = discussrestaurantinfoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussrestaurantinfo), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiscussrestaurantinfoEntity discussrestaurantinfo){
       	EntityWrapper<DiscussrestaurantinfoEntity> ew = new EntityWrapper<DiscussrestaurantinfoEntity>();
      	ew.allEq(MPUtil.allEQMapPre( discussrestaurantinfo, "discussrestaurantinfo")); 
        return R.ok().put("data", discussrestaurantinfoService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiscussrestaurantinfoEntity discussrestaurantinfo){
        EntityWrapper< DiscussrestaurantinfoEntity> ew = new EntityWrapper< DiscussrestaurantinfoEntity>();
 		ew.allEq(MPUtil.allEQMapPre( discussrestaurantinfo, "discussrestaurantinfo")); 
		DiscussrestaurantinfoView discussrestaurantinfoView =  discussrestaurantinfoService.selectView(ew);
		return R.ok("查询餐厅信息评论表成功").put("data", discussrestaurantinfoView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiscussrestaurantinfoEntity discussrestaurantinfo = discussrestaurantinfoService.selectById(id);
        return R.ok().put("data", discussrestaurantinfo);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiscussrestaurantinfoEntity discussrestaurantinfo = discussrestaurantinfoService.selectById(id);
        return R.ok().put("data", discussrestaurantinfo);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DiscussrestaurantinfoEntity discussrestaurantinfo, HttpServletRequest request){
    	discussrestaurantinfo.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(discussrestaurantinfo);
        discussrestaurantinfoService.insert(discussrestaurantinfo);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DiscussrestaurantinfoEntity discussrestaurantinfo, HttpServletRequest request){
    	discussrestaurantinfo.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(discussrestaurantinfo);
        discussrestaurantinfoService.insert(discussrestaurantinfo);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody DiscussrestaurantinfoEntity discussrestaurantinfo, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussrestaurantinfo);
        discussrestaurantinfoService.updateById(discussrestaurantinfo);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        discussrestaurantinfoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<DiscussrestaurantinfoEntity> wrapper = new EntityWrapper<DiscussrestaurantinfoEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = discussrestaurantinfoService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	









}
