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

import com.entity.HotelreserveEntity;
import com.entity.view.HotelreserveView;

import com.service.HotelreserveService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;

/**
 * 酒店预订
 * 后端接口
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
@RestController
@RequestMapping("/hotelreserve")
public class HotelreserveController {
    @Autowired
    private HotelreserveService hotelreserveService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,HotelreserveEntity hotelreserve,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("users")) {
			hotelreserve.setUsername((String)request.getSession().getAttribute("username"));
		}
        if(tableName.equals("merchant")) {
			hotelreserve.setMerchantusername((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<HotelreserveEntity> ew = new EntityWrapper<HotelreserveEntity>();

		PageUtils page = hotelreserveService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, hotelreserve), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,HotelreserveEntity hotelreserve, 
		HttpServletRequest request){
        EntityWrapper<HotelreserveEntity> ew = new EntityWrapper<HotelreserveEntity>();

		PageUtils page = hotelreserveService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, hotelreserve), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( HotelreserveEntity hotelreserve){
       	EntityWrapper<HotelreserveEntity> ew = new EntityWrapper<HotelreserveEntity>();
      	ew.allEq(MPUtil.allEQMapPre( hotelreserve, "hotelreserve")); 
        return R.ok().put("data", hotelreserveService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(HotelreserveEntity hotelreserve){
        EntityWrapper< HotelreserveEntity> ew = new EntityWrapper< HotelreserveEntity>();
 		ew.allEq(MPUtil.allEQMapPre( hotelreserve, "hotelreserve")); 
		HotelreserveView hotelreserveView =  hotelreserveService.selectView(ew);
		return R.ok("查询酒店预订成功").put("data", hotelreserveView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        HotelreserveEntity hotelreserve = hotelreserveService.selectById(id);
        return R.ok().put("data", hotelreserve);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        HotelreserveEntity hotelreserve = hotelreserveService.selectById(id);
        return R.ok().put("data", hotelreserve);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody HotelreserveEntity hotelreserve, HttpServletRequest request){
    	hotelreserve.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(hotelreserve);
        hotelreserveService.insert(hotelreserve);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody HotelreserveEntity hotelreserve, HttpServletRequest request){
    	hotelreserve.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(hotelreserve);
        hotelreserveService.insert(hotelreserve);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody HotelreserveEntity hotelreserve, HttpServletRequest request){
        //ValidatorUtils.validateEntity(hotelreserve);
        hotelreserveService.updateById(hotelreserve);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        hotelreserveService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<HotelreserveEntity> wrapper = new EntityWrapper<HotelreserveEntity>();
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

		int count = hotelreserveService.selectCount(wrapper);
		return R.ok().put("count", count);
	}










}
