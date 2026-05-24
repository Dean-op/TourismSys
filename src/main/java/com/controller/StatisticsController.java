package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.ScenicinfoEntity;
import com.service.*;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 平台数据统计与分析
 */
@RestController
@RequestMapping("/stats")
public class StatisticsController {

    @Autowired
    private UsersService usersService;
    @Autowired
    private ScenicinfoService scenicinfoService;
    @Autowired
    private GuideService guideService;
    @Autowired
    private GuideorderService guideorderService;
    @Autowired
    private TicketreserveService ticketreserveService;
    @Autowired
    private HotelreserveService hotelreserveService;
    @Autowired
    private RestaurantreserveService restaurantreserveService;
    @Autowired
    private HotelinfoService hotelinfoService;
    @Autowired
    private RestaurantinfoService restaurantinfoService;

    /**
     * 管理员概览统计卡片数据
     */
    @RequestMapping("/summary")
    public R summary(HttpServletRequest request) {
        String tableName = (String) request.getSession().getAttribute("tableName");
        if (!"admin".equals(tableName)) {
            return R.error("无权限查看统计数据");
        }

        Map<String, Object> data = new HashMap<>();
        
        // 用户总数
        data.put("userCount", usersService.selectCount(new EntityWrapper<>()));
        // 景点总数
        data.put("scenicCount", scenicinfoService.selectCount(new EntityWrapper<>()));
        // 导游总数（已通过）
        data.put("guideCount", guideService.selectCount(new EntityWrapper<com.entity.GuideEntity>().eq("status", "通过")));
        // 总预约额（门票+导游）
        // 这里简化处理，仅统计已支付或已确认的
        data.put("orderCount", guideorderService.selectCount(new EntityWrapper<>()) + ticketreserveService.selectCount(new EntityWrapper<>()));
        
        return R.ok().put("data", data);
    }

    /**
     * 导游个人日程与收入统计
     */
    @RequestMapping("/guideSummary")
    public R guideSummary(HttpServletRequest request) {
        String tableName = (String) request.getSession().getAttribute("tableName");
        String username = (String) request.getSession().getAttribute("username");
        if (!"guide".equals(tableName)) {
            return R.error("仅导游可查看个人统计");
        }

        Map<String, Object> data = new HashMap<>();

        // 待处理预约
        data.put("pendingCount", guideorderService.selectCount(new EntityWrapper<com.entity.GuideorderEntity>()
                .eq("guideusername", username).eq("status", "待确认")));
        
        // 总预约数
        data.put("totalCount", guideorderService.selectCount(new EntityWrapper<com.entity.GuideorderEntity>()
                .eq("guideusername", username)));

        // 总收入统计（已完成单量）
        List<com.entity.GuideorderEntity> finishedOrders = guideorderService.selectList(new EntityWrapper<com.entity.GuideorderEntity>()
                .eq("guideusername", username).eq("status", "已完成"));
        
        float totalIncome = 0;
        for (com.entity.GuideorderEntity order : finishedOrders) {
            if (order.getAmount() != null) {
                totalIncome += order.getAmount();
            }
        }
        data.put("totalIncome", totalIncome);

        // 日程概览（未来7天的预约）
        List<com.entity.GuideorderEntity> upcomingOrders = guideorderService.selectList(new EntityWrapper<com.entity.GuideorderEntity>()
                .eq("guideusername", username)
                .in("status", Arrays.asList("待确认", "已确认"))
                .ge("plandate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()))
                .orderBy("plandate", true));
        data.put("upcomingOrders", upcomingOrders);

        return R.ok().put("data", data);
    }

    /**
     * 热门路线统计（基于旅游规划的词频或目的地）
     */
    @RequestMapping("/hotRoutes")
    public R hotRoutes(HttpServletRequest request) {
        // 最简实现：返回点击量前5的景点作为热门推荐基础
        EntityWrapper<ScenicinfoEntity> ew = new EntityWrapper<>();
        ew.orderBy("clicknum", false);
        ew.last("limit 5");
        List<ScenicinfoEntity> list = scenicinfoService.selectList(ew);
        
        List<Map<String, Object>> result = new ArrayList<>();
        for (ScenicinfoEntity s : list) {
            Map<String, Object> m = new HashMap<>();
            m.put("name", s.getScenicname());
            m.put("value", s.getClicknum());
            result.add(m);
        }
        return R.ok().put("data", result);
    }

    /**
     * 导游服务情况统计（按导游统计订单数）
     */
    @RequestMapping("/guidePerformance")
    public R guidePerformance(HttpServletRequest request) {
        // 这里本应使用 group by，为保持最简且兼容现有 MyBatis-Plus，直接查出前10名导游
        // 在实际项目中通常在 Dao 层写 XML，这里用业务代码模拟
        List<com.entity.GuideEntity> guides = guideService.selectList(new EntityWrapper<com.entity.GuideEntity>().eq("status", "通过").last("limit 10"));
        List<Map<String, Object>> result = new ArrayList<>();
        for (com.entity.GuideEntity g : guides) {
            Map<String, Object> m = new HashMap<>();
            m.put("name", g.getGuidename());
            int count = guideorderService.selectCount(new EntityWrapper<com.entity.GuideorderEntity>().eq("guideid", g.getId()));
            m.put("value", count);
            result.add(m);
        }
        return R.ok().put("data", result);
    }

    /**
     * 商家经营数据统计
     */
    @RequestMapping("/merchantSummary")
    public R merchantSummary(HttpServletRequest request) {
        String tableName = (String) request.getSession().getAttribute("tableName");
        String username = (String) request.getSession().getAttribute("username");
        if (!"merchant".equals(tableName)) {
            return R.error("仅商家可查看商户统计");
        }

        Map<String, Object> data = new HashMap<>();

        // 1. 景点门票预订量
        int ticketCount = ticketreserveService.selectCount(new EntityWrapper<com.entity.TicketreserveEntity>()
                .eq("merchantusername", username));
        // 2. 酒店房间预订量
        int hotelCount = hotelreserveService.selectCount(new EntityWrapper<com.entity.HotelreserveEntity>()
                .eq("merchantusername", username));
        // 3. 餐厅桌位预约量
        int restaurantCount = restaurantreserveService.selectCount(new EntityWrapper<com.entity.RestaurantreserveEntity>()
                .eq("merchantusername", username));

        data.put("totalOrders", ticketCount + hotelCount + restaurantCount);

        // 4. 总营业额（已支付订单）
        float totalRevenue = 0;
        // 门票收入
        List<com.entity.TicketreserveEntity> paidTickets = ticketreserveService.selectList(new EntityWrapper<com.entity.TicketreserveEntity>()
                .eq("merchantusername", username).eq("ispay", "已支付"));
        for (com.entity.TicketreserveEntity t : paidTickets) {
            if (t.getPrice() != null) totalRevenue += t.getPrice();
        }
        // 酒店收入
        List<com.entity.HotelreserveEntity> paidHotels = hotelreserveService.selectList(new EntityWrapper<com.entity.HotelreserveEntity>()
                .eq("merchantusername", username).eq("ispay", "已支付"));
        for (com.entity.HotelreserveEntity h : paidHotels) {
            if (h.getPrice() != null) totalRevenue += h.getPrice();
        }
        // 餐厅收入 (预订款)
        List<com.entity.RestaurantreserveEntity> paidRestaurants = restaurantreserveService.selectList(new EntityWrapper<com.entity.RestaurantreserveEntity>()
                .eq("merchantusername", username).eq("ispay", "已支付"));
        for (com.entity.RestaurantreserveEntity r : paidRestaurants) {
            if (r.getReserveprice() != null) totalRevenue += r.getReserveprice();
        }

        data.put("totalRevenue", totalRevenue);

        // 5. 商家下辖资源的评分统计
        double totalRating = 0;
        int ratingCount = 0;
        
        List<com.entity.HotelinfoEntity> hotels = hotelinfoService.selectList(new EntityWrapper<com.entity.HotelinfoEntity>().eq("merchantusername", username));
        for (com.entity.HotelinfoEntity h : hotels) {
            if (h.getRating() != null && h.getRating() > 0) {
                totalRating += h.getRating();
                ratingCount++;
            }
        }
        List<com.entity.RestaurantinfoEntity> restaurants = restaurantinfoService.selectList(new EntityWrapper<com.entity.RestaurantinfoEntity>().eq("merchantusername", username));
        for (com.entity.RestaurantinfoEntity r : restaurants) {
            if (r.getRating() != null && r.getRating() > 0) {
                totalRating += r.getRating();
                ratingCount++;
            }
        }
        List<com.entity.ScenicinfoEntity> scenics = scenicinfoService.selectList(new EntityWrapper<com.entity.ScenicinfoEntity>().eq("merchantusername", username));
        for (com.entity.ScenicinfoEntity s : scenics) {
            if (s.getRating() != null && s.getRating() > 0) {
                totalRating += s.getRating();
                ratingCount++;
            }
        }

        double averageRating = ratingCount > 0 ? (totalRating / ratingCount) : 5.0;
        data.put("averageRating", String.format("%.2f", averageRating));

        // 6. 订单明细分类
        Map<String, Integer> orderDetail = new HashMap<>();
        orderDetail.put("门票预订", ticketCount);
        orderDetail.put("酒店房间", hotelCount);
        orderDetail.put("餐厅桌位", restaurantCount);
        data.put("orderDetail", orderDetail);

        return R.ok().put("data", data);
    }
}
