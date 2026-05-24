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

import com.entity.GuideEntity;
import com.entity.view.GuideView;

import com.service.GuideService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;

/**
 * 导游
 * 后端接口
 */
@RestController
@RequestMapping("/guide")
public class GuideController {
    @Autowired
    private GuideService guideService;

	@Autowired
	private TokenService tokenService;

	/**
	 * 登录
	 */
	@IgnoreAuth
	@RequestMapping(value = "/login")
	public R login(String username, String password, String captcha, HttpServletRequest request) {
		GuideEntity u = guideService.selectOne(new EntityWrapper<GuideEntity>().eq("guideusername", username));
		if(u==null || !u.getPassword().equals(password)) {
			return R.error("账号或密码不正确");
		}
		if(u.getStatus()!=null && !"通过".equals(u.getStatus())) {
			return R.error("账号未审核通过");
		}
		String token = tokenService.generateToken(u.getId(), username,"guide",  "导游" );
		return R.ok().put("token", token);
	}

	/**
	 * 注册
	 */
	@IgnoreAuth
	@RequestMapping("/register")
	public R register(@RequestBody GuideEntity guide){
		GuideEntity u = guideService.selectOne(new EntityWrapper<GuideEntity>().eq("guideusername", guide.getGuideusername()));
		if(u!=null) {
			return R.error("注册用户已存在");
		}
		Long uId = new Date().getTime();
		guide.setId(uId);
		if(guide.getStatus()==null || "".equals(guide.getStatus())) {
			guide.setStatus("待审核");
		}
		guideService.insert(guide);
		return R.ok();
	}

	@RequestMapping("/logout")
	public R logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return R.ok("退出成功");
	}

	@RequestMapping("/session")
	public R getCurrUser(HttpServletRequest request){
		Long id = (Long)request.getSession().getAttribute("userId");
		GuideEntity u = guideService.selectById(id);
		return R.ok().put("data", u);
	}

	@IgnoreAuth
	@RequestMapping(value = "/resetPass")
	public R resetPass(String username, HttpServletRequest request){
		GuideEntity u = guideService.selectOne(new EntityWrapper<GuideEntity>().eq("guideusername", username));
		if(u==null) {
			return R.error("账号不存在");
		}
		u.setPassword("123456");
		guideService.updateById(u);
		return R.ok("密码已重置为：123456");
	}

    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,GuideEntity guide,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("guide")) {
			guide.setGuideusername((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<GuideEntity> ew = new EntityWrapper<GuideEntity>();

		PageUtils page = guideService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, guide), params), params));

        return R.ok().put("data", page);
    }

	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,GuideEntity guide, 
		HttpServletRequest request){
        EntityWrapper<GuideEntity> ew = new EntityWrapper<GuideEntity>();

		PageUtils page = guideService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, guide), params), params));
        return R.ok().put("data", page);
    }

    @RequestMapping("/lists")
    public R list( GuideEntity guide){
       	EntityWrapper<GuideEntity> ew = new EntityWrapper<GuideEntity>();
      	ew.allEq(MPUtil.allEQMapPre( guide, "guide")); 
        return R.ok().put("data", guideService.selectListView(ew));
    }

    @RequestMapping("/query")
    public R query(GuideEntity guide){
        EntityWrapper< GuideEntity> ew = new EntityWrapper< GuideEntity>();
 		ew.allEq(MPUtil.allEQMapPre( guide, "guide")); 
		GuideView guideView =  guideService.selectView(ew);
		return R.ok("查询导游成功").put("data", guideView);
    }

    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        GuideEntity guide = guideService.selectById(id);
        return R.ok().put("data", guide);
    }

	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        GuideEntity guide = guideService.selectById(id);
        return R.ok().put("data", guide);
    }

    @RequestMapping("/save")
    public R save(@RequestBody GuideEntity guide, HttpServletRequest request){
    	guide.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		GuideEntity u = guideService.selectOne(new EntityWrapper<GuideEntity>().eq("guideusername", guide.getGuideusername()));
		if(u!=null) {
			return R.error("用户已存在");
		}
		guide.setId(new Date().getTime());
		if(guide.getStatus()==null || "".equals(guide.getStatus())) {
			guide.setStatus("待审核");
		}
        guideService.insert(guide);
        return R.ok();
    }

    @RequestMapping("/add")
    public R add(@RequestBody GuideEntity guide, HttpServletRequest request){
    	guide.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
		GuideEntity u = guideService.selectOne(new EntityWrapper<GuideEntity>().eq("guideusername", guide.getGuideusername()));
		if(u!=null) {
			return R.error("用户已存在");
		}
		guide.setId(new Date().getTime());
		if(guide.getStatus()==null || "".equals(guide.getStatus())) {
			guide.setStatus("待审核");
		}
        guideService.insert(guide);
        return R.ok();
    }

    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody GuideEntity guide, HttpServletRequest request){
        guideService.updateById(guide);
        return R.ok();
    }

    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        guideService.deleteBatchIds(Arrays.asList(ids));
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

		Wrapper<GuideEntity> wrapper = new EntityWrapper<GuideEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("guide")) {
			wrapper.eq("guideusername", (String)request.getSession().getAttribute("username"));
		}

		int count = guideService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
}
