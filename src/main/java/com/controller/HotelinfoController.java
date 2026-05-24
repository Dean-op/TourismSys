package com.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import com.service.HotelreserveService;
import org.apache.commons.lang3.StringUtils;
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

import com.entity.HotelinfoEntity;
import com.entity.view.HotelinfoView;

import com.service.HotelinfoService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.service.StoreupService;

/**
 * 酒店信息
 * 后端接口
 * @author 
 * @email 
 * @date 2025-11-09 18:31:55
 */
@RestController
@RequestMapping("/hotelinfo")
public class HotelinfoController {
    @Autowired
    private HotelinfoService hotelinfoService;

    @Autowired
    private HotelreserveService hotelreserveService;



    @Autowired
    private StoreupService storeupService;

    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,HotelinfoEntity hotelinfo,
		HttpServletRequest request){
        EntityWrapper<HotelinfoEntity> ew = new EntityWrapper<HotelinfoEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("merchant")) {
            hotelinfo.setMerchantusername((String)request.getSession().getAttribute("username"));
        }
		PageUtils page = hotelinfoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, hotelinfo), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,HotelinfoEntity hotelinfo, 
		HttpServletRequest request){
        EntityWrapper<HotelinfoEntity> ew = new EntityWrapper<HotelinfoEntity>();

		PageUtils page = hotelinfoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, hotelinfo), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( HotelinfoEntity hotelinfo){
       	EntityWrapper<HotelinfoEntity> ew = new EntityWrapper<HotelinfoEntity>();
      	ew.allEq(MPUtil.allEQMapPre( hotelinfo, "hotelinfo")); 
        return R.ok().put("data", hotelinfoService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(HotelinfoEntity hotelinfo){
        EntityWrapper< HotelinfoEntity> ew = new EntityWrapper< HotelinfoEntity>();
 		ew.allEq(MPUtil.allEQMapPre( hotelinfo, "hotelinfo")); 
		HotelinfoView hotelinfoView =  hotelinfoService.selectView(ew);
		return R.ok("查询酒店信息成功").put("data", hotelinfoView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        HotelinfoEntity hotelinfo = hotelinfoService.selectById(id);
		hotelinfo.setClicknum(hotelinfo.getClicknum()+1);
		hotelinfo.setClicktime(new Date());
        Double rating = hotelreserveService.calculateRating(id);
        hotelinfo.setRating(rating);
		hotelinfoService.updateById(hotelinfo);
        return R.ok().put("data", hotelinfo);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        HotelinfoEntity hotelinfo = hotelinfoService.selectById(id);
		hotelinfo.setClicknum(hotelinfo.getClicknum()+1);
		hotelinfo.setClicktime(new Date());
        Double rating = hotelreserveService.calculateRating(id);
        hotelinfo.setRating(rating);
		hotelinfoService.updateById(hotelinfo);
        return R.ok().put("data", hotelinfo);
    }
    


    /**
     * 赞或踩
     */
    @RequestMapping("/thumbsup/{id}")
    public R vote(@PathVariable("id") String id,String type){
        HotelinfoEntity hotelinfo = hotelinfoService.selectById(id);
        if(type.equals("1")) {
        	hotelinfo.setThumbsupnum(hotelinfo.getThumbsupnum()+1);
        } else {
        	hotelinfo.setCrazilynum(hotelinfo.getCrazilynum()+1);
        }
        hotelinfoService.updateById(hotelinfo);
        return R.ok("投票成功");
    }

    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody HotelinfoEntity hotelinfo, HttpServletRequest request){
    	hotelinfo.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(hotelinfo);
        hotelinfoService.insert(hotelinfo);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody HotelinfoEntity hotelinfo, HttpServletRequest request){
    	hotelinfo.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(hotelinfo);
        hotelinfoService.insert(hotelinfo);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody HotelinfoEntity hotelinfo, HttpServletRequest request){
        //ValidatorUtils.validateEntity(hotelinfo);
        hotelinfoService.updateById(hotelinfo);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        hotelinfoService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<HotelinfoEntity> wrapper = new EntityWrapper<HotelinfoEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = hotelinfoService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	/**
     * 前端智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,HotelinfoEntity hotelinfo, HttpServletRequest request,String pre){
        EntityWrapper<HotelinfoEntity> ew = new EntityWrapper<HotelinfoEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicknum");
        params.put("order", "desc");
		PageUtils page = hotelinfoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, hotelinfo), params), params));
        return R.ok().put("data", page);
    }









}
