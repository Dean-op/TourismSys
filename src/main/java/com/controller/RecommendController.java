package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.ScenicinfoEntity;
import com.entity.TourplanEntity;
import com.service.ScenicinfoService;
import com.service.TourplanService;
import com.utils.R;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 路线推荐（最简闭环）
 */
@RestController
@RequestMapping("/recommend")
public class RecommendController {

    @Autowired
    private ScenicinfoService scenicinfoService;

    @Autowired
    private TourplanService tourplanService;

    private String getTableName(HttpServletRequest request) {
        Object tableName = request.getSession().getAttribute("tableName");
        return tableName == null ? "" : tableName.toString();
    }

    private String getSessionUsername(HttpServletRequest request) {
        Object username = request.getSession().getAttribute("username");
        return username == null ? "" : username.toString();
    }

    private String getSessionName(HttpServletRequest request) {
        Object name = request.getSession().getAttribute("name");
        return name == null ? "" : name.toString();
    }

    /**
     * 生成 3 条候选景点串联路线
     * 入参：days(默认1), preferKeywords(逗号分隔，可空), budgetMax(可空)
     */
    @RequestMapping("/routes")
    public R routes(@RequestBody Map<String, Object> body, HttpServletRequest request) {
        Integer days = 1;
        if (body.get("days") != null) {
            try {
                days = Integer.parseInt(body.get("days").toString());
            } catch (Exception ignored) {
            }
        }
        if (days == null || days <= 0) {
            days = 1;
        }
        if (days > 7) {
            days = 7;
        }

        Integer budgetMax = null;
        if (body.get("budgetMax") != null && body.get("budgetMax").toString().trim().length() > 0) {
            try {
                budgetMax = Integer.parseInt(body.get("budgetMax").toString());
            } catch (Exception ignored) {
            }
        }

        String preferKeywords = body.get("preferKeywords") == null ? "" : body.get("preferKeywords").toString();

        List<ScenicinfoEntity> scenicList = queryScenics(preferKeywords, budgetMax, 200);
        if (scenicList.size() < days) {
            scenicList = queryScenics("", budgetMax, 200);
        }
        if (scenicList.size() == 0) {
            return R.ok().put("data", Collections.emptyList());
        }

        int perDay = 3;
        int need = days * perDay;

        List<Map<String, Object>> result = new ArrayList<>();
        for (int c = 0; c < 3; c++) {
            List<ScenicinfoEntity> pick = pickSpots(scenicList, need, c);
            Map<String, Object> one = buildCandidate(days, perDay, pick);
            one.put("candidateIndex", c);
            result.add(one);
        }

        return R.ok().put("data", result);
    }

    /**
     * 保存候选路线到 tourplan
     * 入参：route, duration, starttime(yyyy-MM-dd HH:mm:ss 或 yyyy-MM-dd), mudedi(可空)
     */
    @RequestMapping("/save")
    @Transactional
    public R save(@RequestBody Map<String, Object> body, HttpServletRequest request) {
        String tableName = getTableName(request);
        if (!"users".equals(tableName)) {
            return R.error("请先以用户身份登录");
        }

        String route = body.get("route") == null ? "" : body.get("route").toString();
        if (route.trim().length() == 0) {
            return R.error("route不能为空");
        }

        Integer duration = 1;
        if (body.get("duration") != null) {
            try {
                duration = Integer.parseInt(body.get("duration").toString());
            } catch (Exception ignored) {
            }
        }
        if (duration == null || duration <= 0) {
            duration = 1;
        }

        Date starttime = new Date();
        if (body.get("starttime") != null && body.get("starttime").toString().trim().length() > 0) {
            String s = body.get("starttime").toString().trim();
            try {
                if (s.length() == 10) {
                    starttime = new SimpleDateFormat("yyyy-MM-dd").parse(s);
                } else {
                    starttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(s);
                }
            } catch (Exception ignored) {
            }
        }

        String mudedi = body.get("mudedi") == null ? "济南" : body.get("mudedi").toString();

        TourplanEntity tourplan = new TourplanEntity();
        tourplan.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        tourplan.setMudedi(mudedi);
        tourplan.setStarttime(starttime);
        tourplan.setDuration(duration);
        tourplan.setRoute(route);
        tourplan.setContent(body.get("content") == null ? "" : body.get("content").toString());
        tourplan.setUsername(getSessionUsername(request));
        tourplan.setName(getSessionName(request));
        tourplanService.insert(tourplan);

        return R.ok().put("data", tourplan.getId());
    }

    private List<ScenicinfoEntity> queryScenics(String preferKeywords, Integer budgetMax, int limit) {
        EntityWrapper<ScenicinfoEntity> ew = new EntityWrapper<ScenicinfoEntity>();
        if (budgetMax != null) {
            ew.le("price", budgetMax);
        }

        if (preferKeywords != null && preferKeywords.trim().length() > 0) {
            String[] kws = preferKeywords.split(",");
            for (String kw : kws) {
                if (kw == null) continue;
                String k = kw.trim();
                if (k.length() == 0) continue;
                ew.andNew();
                ew.like("scenicname", k).or().like("content", k).or().like("introduce", k).or().like("address", k);
            }
        }

        ew.orderBy("rating", false);
        ew.orderBy("clicknum", false);
        List<ScenicinfoEntity> list = scenicinfoService.selectList(ew);
        if (list == null) {
            return new ArrayList<>();
        }
        if (list.size() > limit) {
            return list.subList(0, limit);
        }
        return list;
    }

    private List<ScenicinfoEntity> pickSpots(List<ScenicinfoEntity> all, int need, int variant) {
        if (all.size() <= need) {
            return new ArrayList<>(all);
        }
        List<ScenicinfoEntity> list = new ArrayList<>(all);
        if (variant == 1) {
            Collections.shuffle(list);
        }
        if (variant == 2) {
            Collections.reverse(list);
        }
        return list.subList(0, need);
    }

    private Map<String, Object> buildCandidate(int days, int perDay, List<ScenicinfoEntity> pick) {
        Map<String, Object> data = new HashMap<>();
        List<List<Map<String, Object>>> byDay = new ArrayList<>();

        int idx = 0;
        int totalPrice = 0;
        StringBuilder routeText = new StringBuilder();

        for (int d = 1; d <= days; d++) {
            List<Map<String, Object>> dayList = new ArrayList<>();
            routeText.append("D").append(d).append("：");
            for (int j = 0; j < perDay; j++) {
                if (idx >= pick.size()) break;
                ScenicinfoEntity s = pick.get(idx++);
                Map<String, Object> one = new HashMap<>();
                one.put("id", s.getId());
                one.put("scenicname", s.getScenicname());
                one.put("address", s.getAddress());
                one.put("price", s.getPrice());
                dayList.add(one);

                routeText.append(s.getScenicname());
                if (j != perDay - 1 && idx < pick.size()) {
                    routeText.append("→");
                }
                if (s.getPrice() != null) {
                    totalPrice += s.getPrice();
                }
            }
            if (d != days) {
                routeText.append("；");
            }
            byDay.add(dayList);
        }

        data.put("days", days);
        data.put("route", routeText.toString());
        data.put("byDay", byDay);
        data.put("totalTicketPrice", totalPrice);
        data.put("content", "门票预算参考：约" + totalPrice + "元（仅景点门票，实际以现场为准）");
        return data;
    }
}
