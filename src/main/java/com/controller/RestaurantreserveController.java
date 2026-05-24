package com.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.Date;
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

import com.entity.RestaurantreserveEntity;
import com.entity.view.RestaurantreserveView;

import com.service.RestaurantreserveService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;

/**
 * 餐厅预订
 * 后端接口
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
@RestController
@RequestMapping("/restaurantreserve")
public class RestaurantreserveController {
    @Autowired
    private RestaurantreserveService restaurantreserveService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,RestaurantreserveEntity restaurantreserve,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("users")) {
			restaurantreserve.setUsername((String)request.getSession().getAttribute("username"));
		}
        if(tableName.equals("merchant")) {
			restaurantreserve.setMerchantusername((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<RestaurantreserveEntity> ew = new EntityWrapper<RestaurantreserveEntity>();

		PageUtils page = restaurantreserveService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, restaurantreserve), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,RestaurantreserveEntity restaurantreserve, 
		HttpServletRequest request){
        EntityWrapper<RestaurantreserveEntity> ew = new EntityWrapper<RestaurantreserveEntity>();

		PageUtils page = restaurantreserveService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, restaurantreserve), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( RestaurantreserveEntity restaurantreserve){
       	EntityWrapper<RestaurantreserveEntity> ew = new EntityWrapper<RestaurantreserveEntity>();
      	ew.allEq(MPUtil.allEQMapPre( restaurantreserve, "restaurantreserve")); 
        return R.ok().put("data", restaurantreserveService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(RestaurantreserveEntity restaurantreserve){
        EntityWrapper< RestaurantreserveEntity> ew = new EntityWrapper< RestaurantreserveEntity>();
 		ew.allEq(MPUtil.allEQMapPre( restaurantreserve, "restaurantreserve")); 
		RestaurantreserveView restaurantreserveView =  restaurantreserveService.selectView(ew);
		return R.ok("查询餐厅预订成功").put("data", restaurantreserveView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        RestaurantreserveEntity restaurantreserve = restaurantreserveService.selectById(id);
        return R.ok().put("data", restaurantreserve);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        RestaurantreserveEntity restaurantreserve = restaurantreserveService.selectById(id);
        return R.ok().put("data", restaurantreserve);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody RestaurantreserveEntity restaurantreserve, HttpServletRequest request){
    	restaurantreserve.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(restaurantreserve);
        restaurantreserveService.insert(restaurantreserve);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody RestaurantreserveEntity restaurantreserve, HttpServletRequest request){
    	restaurantreserve.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(restaurantreserve);
        restaurantreserveService.insert(restaurantreserve);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody RestaurantreserveEntity restaurantreserve, HttpServletRequest request){
        //ValidatorUtils.validateEntity(restaurantreserve);
        restaurantreserveService.updateById(restaurantreserve);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        restaurantreserveService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<RestaurantreserveEntity> wrapper = new EntityWrapper<RestaurantreserveEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("users")) {
			wrapper.eq("username", (String)request.getSession().getAttribute("username"));
		}

		int count = restaurantreserveService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	









}
