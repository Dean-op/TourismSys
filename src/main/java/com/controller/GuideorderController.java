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

import com.entity.GuideorderEntity;
import com.entity.GuideEntity;
import com.entity.view.GuideorderView;

import com.service.GuideorderService;
import com.service.GuideService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;

/**
 * 导游预约
 * 后端接口
 */
@RestController
@RequestMapping("/guideorder")
public class GuideorderController {
    @Autowired
    private GuideorderService guideorderService;

	@Autowired
	private GuideService guideService;

	private String getTableName(HttpServletRequest request) {
		Object tableName = request.getSession().getAttribute("tableName");
		return tableName == null ? "" : tableName.toString();
	}

	private String getSessionUsername(HttpServletRequest request) {
		Object username = request.getSession().getAttribute("username");
		return username == null ? "" : username.toString();
	}

	private boolean isAdmin(HttpServletRequest request) {
		return "admin".equals(getTableName(request));
	}

	private boolean canAccessOrder(HttpServletRequest request, GuideorderEntity order) {
		String tableName = getTableName(request);
		if ("admin".equals(tableName)) {
			return true;
		}
		String username = getSessionUsername(request);
		if ("users".equals(tableName)) {
			return username.equals(order.getUsername());
		}
		if ("guide".equals(tableName)) {
			return username.equals(order.getGuideusername());
		}
		return false;
	}

    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,GuideorderEntity guideorder,
		HttpServletRequest request){
		String tableName = getTableName(request);
		if(tableName.equals("users")) {
			guideorder.setUsername((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("guide")) {
			guideorder.setGuideusername((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<GuideorderEntity> ew = new EntityWrapper<GuideorderEntity>();
		if(params.get("statusin")!=null && params.get("statusin").toString().trim().length()>0) {
			String[] statusArr = params.get("statusin").toString().split(",");
			ew.in("status", statusArr);
		}

		PageUtils page = guideorderService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, guideorder), params), params));

        return R.ok().put("data", page);
    }

    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,GuideorderEntity guideorder, 
		HttpServletRequest request){
		String tableName = getTableName(request);
		if("".equals(tableName)) {
			return R.error("请先登录");
		}
		if(tableName.equals("users")) {
			guideorder.setUsername((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("guide")) {
			guideorder.setGuideusername((String)request.getSession().getAttribute("username"));
		}
		EntityWrapper<GuideorderEntity> ew = new EntityWrapper<GuideorderEntity>();
		if(params.get("statusin")!=null && params.get("statusin").toString().trim().length()>0) {
			String[] statusArr = params.get("statusin").toString().split(",");
			ew.in("status", statusArr);
		}

		PageUtils page = guideorderService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, guideorder), params), params));
		return R.ok().put("data", page);
    }

    @RequestMapping("/lists")
    public R list(GuideorderEntity guideorder, HttpServletRequest request){
		String tableName = getTableName(request);
		if("".equals(tableName)) {
			return R.error("请先登录");
		}
		if(tableName.equals("users")) {
			guideorder.setUsername((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("guide")) {
			guideorder.setGuideusername((String)request.getSession().getAttribute("username"));
		}
       	EntityWrapper<GuideorderEntity> ew = new EntityWrapper<GuideorderEntity>();
      	ew.allEq(MPUtil.allEQMapPre( guideorder, "guideorder")); 
        return R.ok().put("data", guideorderService.selectListView(ew));
    }

    @RequestMapping("/query")
    public R query(GuideorderEntity guideorder, HttpServletRequest request){
		String tableName = getTableName(request);
		if("".equals(tableName)) {
			return R.error("请先登录");
		}
		if(tableName.equals("users")) {
			guideorder.setUsername((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("guide")) {
			guideorder.setGuideusername((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper< GuideorderEntity> ew = new EntityWrapper< GuideorderEntity>();
		ew.allEq(MPUtil.allEQMapPre( guideorder, "guideorder")); 
		GuideorderView guideorderView =  guideorderService.selectView(ew);
		return R.ok("查询导游预约成功").put("data", guideorderView);
    }

    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        GuideorderEntity guideorder = guideorderService.selectById(id);
		if(guideorder == null) {
			return R.error("记录不存在");
		}
		if(!canAccessOrder(request, guideorder)) {
			return R.error("无权限");
		}
        return R.ok().put("data", guideorder);
    }

    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        GuideorderEntity guideorder = guideorderService.selectById(id);
		if(guideorder == null) {
			return R.error("记录不存在");
		}
		if(!canAccessOrder(request, guideorder)) {
			return R.error("无权限");
		}
        return R.ok().put("data", guideorder);
    }

    @RequestMapping("/save")
    public R save(@RequestBody GuideorderEntity guideorder, HttpServletRequest request){
     	guideorder.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		if(guideorder.getGuideid()!=null) {
			GuideEntity guide = guideService.selectById(guideorder.getGuideid());
			if(guide != null) {
				guideorder.setGuideusername(guide.getGuideusername());
				guideorder.setGuidename(guide.getGuidename());
				if(guideorder.getDays()==null || guideorder.getDays()<=0) {
					guideorder.setDays(1);
				}
				guideorder.setAmount((guide.getPrice()==null?0f:guide.getPrice()) * guideorder.getDays());
			}
		}
		guideorderService.insert(guideorder);
        return R.ok();
    }

    @RequestMapping("/add")
    public R add(@RequestBody GuideorderEntity guideorder, HttpServletRequest request){
		String tableName = getTableName(request);
		if(!tableName.equals("users")) {
			return R.error("请先登录");
		}

		Long userId = (Long)request.getSession().getAttribute("userId");
		String username = (String)request.getSession().getAttribute("username");

		GuideEntity guide = guideService.selectById(guideorder.getGuideid());
		if(guide == null) {
			return R.error("导游不存在");
		}
		if(guide.getStatus()!=null && !"通过".equals(guide.getStatus())) {
			return R.error("导游不可预约");
		}

		if(guideorder.getPlandate() == null) {
			return R.error("请选择预约日期");
		}
		if(guideorder.getDays() == null || guideorder.getDays()<=0) {
			guideorder.setDays(1);
		}

		EntityWrapper<GuideorderEntity> ew = new EntityWrapper<GuideorderEntity>();
		ew.eq("guideid", guide.getId());
		ew.eq("plandate", new SimpleDateFormat("yyyy-MM-dd").format(guideorder.getPlandate()));
		ew.in("status", new String[]{"待确认","已确认"});
		GuideorderEntity exists = guideorderService.selectOne(ew);
		if(exists != null) {
			return R.error("该导游当天已有预约");
		}

		guideorder.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		guideorder.setUserid(userId);
		guideorder.setUsername(username);
		guideorder.setGuideid(guide.getId());
		guideorder.setGuideusername(guide.getGuideusername());
		guideorder.setGuidename(guide.getGuidename());
		guideorder.setStatus("待确认");
		guideorder.setAmount((guide.getPrice()==null?0f:guide.getPrice()) * guideorder.getDays());
		guideorderService.insert(guideorder);

        return R.ok();
    }

    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody GuideorderEntity guideorder, HttpServletRequest request){
		GuideorderEntity db = guideorderService.selectById(guideorder.getId());
		if(db == null) {
			return R.error("记录不存在");
		}
		if(!canAccessOrder(request, db)) {
			return R.error("无权限");
		}
		String tableName = getTableName(request);
		if("users".equals(tableName)) {
			guideorder.setUserid(db.getUserid());
			guideorder.setUsername(db.getUsername());
			guideorder.setGuideid(db.getGuideid());
			guideorder.setGuideusername(db.getGuideusername());
			guideorder.setGuidename(db.getGuidename());
		}
		if("guide".equals(tableName)) {
			guideorder.setUserid(db.getUserid());
			guideorder.setUsername(db.getUsername());
			guideorder.setGuideid(db.getGuideid());
			guideorder.setGuideusername(db.getGuideusername());
			guideorder.setGuidename(db.getGuidename());
		}
		guideorderService.updateById(guideorder);
        return R.ok();
    }

    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids, HttpServletRequest request){
		if(!isAdmin(request)) {
			return R.error("无权限");
		}
		guideorderService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

	/**
	 * 导游确认预约
	 */
	@RequestMapping("/confirm/{id}")
	@Transactional
	public R confirm(@PathVariable("id") Long id, HttpServletRequest request) {
		if(!"guide".equals(getTableName(request)) && !isAdmin(request)) {
			return R.error("无权限");
		}
		GuideorderEntity order = guideorderService.selectById(id);
		if(order == null) {
			return R.error("记录不存在");
		}
		if(!canAccessOrder(request, order)) {
			return R.error("无权限");
		}
		if(order.getStatus() != null && !"待确认".equals(order.getStatus())) {
			return R.error("当前状态不可确认");
		}
		EntityWrapper<GuideorderEntity> ew = new EntityWrapper<GuideorderEntity>();
		ew.eq("guideid", order.getGuideid());
		ew.eq("plandate", new SimpleDateFormat("yyyy-MM-dd").format(order.getPlandate()));
		ew.eq("status", "已确认");
		ew.ne("id", order.getId());
		GuideorderEntity exists = guideorderService.selectOne(ew);
		if(exists != null) {
			return R.error("该导游当天已有已确认预约");
		}
		order.setStatus("已确认");
		guideorderService.updateById(order);
		return R.ok();
	}

	/**
	 * 导游拒绝预约（置为已取消）
	 */
	@RequestMapping("/reject/{id}")
	@Transactional
	public R reject(@PathVariable("id") Long id, @RequestParam(required = false) String remark, HttpServletRequest request) {
		if(!"guide".equals(getTableName(request)) && !isAdmin(request)) {
			return R.error("无权限");
		}
		GuideorderEntity order = guideorderService.selectById(id);
		if(order == null) {
			return R.error("记录不存在");
		}
		if(!canAccessOrder(request, order)) {
			return R.error("无权限");
		}
		if(order.getStatus() != null && !("待确认".equals(order.getStatus()) || "已确认".equals(order.getStatus()))) {
			return R.error("当前状态不可拒绝");
		}
		order.setStatus("已取消");
		if(remark != null && remark.trim().length() > 0) {
			order.setRemark(remark);
		}
		guideorderService.updateById(order);
		return R.ok();
	}

	/**
	 * 用户取消预约
	 */
	@RequestMapping("/cancel/{id}")
	@Transactional
	public R cancel(@PathVariable("id") Long id, HttpServletRequest request) {
		if(!"users".equals(getTableName(request)) && !isAdmin(request)) {
			return R.error("无权限");
		}
		GuideorderEntity order = guideorderService.selectById(id);
		if(order == null) {
			return R.error("记录不存在");
		}
		if(!canAccessOrder(request, order)) {
			return R.error("无权限");
		}
		if(order.getStatus() != null && !("待确认".equals(order.getStatus()) || "已确认".equals(order.getStatus()))) {
			return R.error("当前状态不可取消");
		}
		order.setStatus("已取消");
		guideorderService.updateById(order);
		return R.ok();
	}

	/**
	 * 导游完成预约
	 */
	@RequestMapping("/finish/{id}")
	@Transactional
	public R finish(@PathVariable("id") Long id, HttpServletRequest request) {
		if(!"guide".equals(getTableName(request)) && !isAdmin(request)) {
			return R.error("无权限");
		}
		GuideorderEntity order = guideorderService.selectById(id);
		if(order == null) {
			return R.error("记录不存在");
		}
		if(!canAccessOrder(request, order)) {
			return R.error("无权限");
		}
		if(order.getStatus() != null && !"已确认".equals(order.getStatus())) {
			return R.error("当前状态不可完成");
		}
		order.setStatus("已完成");
		guideorderService.updateById(order);
		return R.ok();
	}

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

		Wrapper<GuideorderEntity> wrapper = new EntityWrapper<GuideorderEntity>();
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
		if(tableName.equals("guide")) {
			wrapper.eq("guideusername", (String)request.getSession().getAttribute("username"));
		}

		int count = guideorderService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
}
