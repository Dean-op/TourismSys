<template>
    <div class="content">
        <div class="welcome-title">
            欢迎使用 {{ this.$project.projectName }}
        </div>

        <div class="main-stats-wrapper">
            <div v-if="role === '管理员'" class="stats-container">
                <!-- 统计卡片 -->
                <el-row :gutter="20" class="card-row">
                    <el-col :span="6">
                        <el-card shadow="hover" class="stat-card color1">
                            <div class="stat-val">{{ summary.userCount || 0 }}</div>
                            <div class="stat-label">注册用户</div>
                        </el-card>
                    </el-col>
                    <el-col :span="6">
                        <el-card shadow="hover" class="stat-card color2">
                            <div class="stat-val">{{ summary.scenicCount || 0 }}</div>
                            <div class="stat-label">景点总数</div>
                        </el-card>
                    </el-col>
                    <el-col :span="6">
                        <el-card shadow="hover" class="stat-card color3">
                            <div class="stat-val">{{ summary.guideCount || 0 }}</div>
                            <div class="stat-label">入驻导游</div>
                        </el-card>
                    </el-col>
                    <el-col :span="6">
                        <el-card shadow="hover" class="stat-card color4">
                            <div class="stat-val">{{ summary.orderCount || 0 }}</div>
                            <div class="stat-label">总单量</div>
                        </el-card>
                    </el-col>
                </el-row>

                <!-- 图表区域 -->
                <el-row :gutter="20" style="margin-top: 20px;">
                    <el-col :span="12">
                        <el-card shadow="never">
                            <div id="performance-chart" style="height: 400px;"></div>
                        </el-card>
                    </el-col>
                    <el-col :span="12">
                        <el-card shadow="never">
                            <div id="hot-routes-chart" style="height: 400px;"></div>
                        </el-card>
                    </el-col>
                </el-row>
            </div>

            <div v-if="role === '导游'" class="stats-container">
                <el-row :gutter="20" class="card-row">
                    <el-col :span="8">
                        <el-card shadow="hover" class="stat-card color3">
                            <div class="stat-val">{{ guideStats.pendingCount || 0 }}</div>
                            <div class="stat-label">待处理预约</div>
                        </el-card>
                    </el-col>
                    <el-col :span="8">
                        <el-card shadow="hover" class="stat-card color1">
                            <div class="stat-val">¥{{ guideStats.totalIncome || 0 }}</div>
                            <div class="stat-label">累计总收入</div>
                        </el-card>
                    </el-col>
                    <el-col :span="8">
                        <el-card shadow="hover" class="stat-card color2">
                            <div class="stat-val">{{ guideStats.totalCount || 0 }}</div>
                            <div class="stat-label">累计服务单量</div>
                        </el-card>
                    </el-col>
                </el-row>

                <el-row style="margin-top: 20px;">
                    <el-col :span="24">
                        <el-card shadow="never" header="近期日程 (未来7天)">
                            <el-table :data="guideStats.upcomingOrders" style="width: 100%">
                                <el-table-column prop="plandate" label="日期" width="180"></el-table-column>
                                <el-table-column prop="username" label="客户账号" width="180"></el-table-column>
                                <el-table-column prop="days" label="时长(天)"></el-table-column>
                                <el-table-column prop="status" label="状态">
                                    <template slot-scope="scope">
                                        <el-tag :type="scope.row.status === '已确认' ? 'success' : 'warning'">{{ scope.row.status }}</el-tag>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </el-card>
                    </el-col>
                </el-row>
            </div>

            <div v-if="role === '商家'" class="stats-container">
                <!-- 统计卡片 -->
                <el-row :gutter="20" class="card-row">
                    <el-col :span="8">
                        <el-card shadow="hover" class="stat-card color1">
                            <div class="stat-val">{{ merchantStats.totalOrders || 0 }}</div>
                            <div class="stat-label">订单总量</div>
                        </el-card>
                    </el-col>
                    <el-col :span="8">
                        <el-card shadow="hover" class="stat-card color2">
                            <div class="stat-val">¥{{ merchantStats.totalRevenue || 0 }}</div>
                            <div class="stat-label">累计营业额</div>
                        </el-card>
                    </el-col>
                    <el-col :span="8">
                        <el-card shadow="hover" class="stat-card color3">
                            <div class="stat-val">{{ merchantStats.averageRating || '5.00' }}</div>
                            <div class="stat-label">资源好评率</div>
                        </el-card>
                    </el-col>
                </el-row>

                <!-- 图表区域 -->
                <el-row :gutter="20" style="margin-top: 20px;">
                    <el-col :span="24">
                        <el-card shadow="never">
                            <div id="merchant-order-chart" style="height: 400px; width: 100%;"></div>
                        </el-card>
                    </el-col>
                </el-row>
            </div>
        </div>
    </div>
</template>

<script>
import * as echarts from 'echarts'
export default {
    data() {
        return {
            role: '',
            summary: {},
            performanceData: [],
            hotRoutesData: [],
            guideStats: {
                pendingCount: 0,
                totalIncome: 0,
                totalCount: 0,
                upcomingOrders: []
            },
            merchantStats: {
                totalOrders: 0,
                totalRevenue: 0,
                averageRating: '5.00',
                orderDetail: {}
            }
        };
    },
    mounted() {
        this.role = this.$storage.get('role');
        this.init();
        if (this.role === '管理员') {
            this.getSummary();
            this.getPerformance();
            this.getHotRoutes();
        } else if (this.role === '导游') {
            this.getGuideSummary();
        } else if (this.role === '商家') {
            this.getMerchantSummary();
        }
    },
    methods: {
        init() {
            if (!this.$storage.get('Token')) {
                this.$router.push({ name: 'login' })
            }
        },
        getGuideSummary() {
            this.$http({
                url: "stats/guideSummary",
                method: "get"
            }).then(({ data }) => {
                if (data && data.code === 0) {
                    this.guideStats = data.data;
                }
            });
        },
        getMerchantSummary() {
            this.$http({
                url: "stats/merchantSummary",
                method: "get"
            }).then(({ data }) => {
                if (data && data.code === 0) {
                    this.merchantStats = data.data;
                    this.initMerchantOrderChart();
                }
            });
        },
        initMerchantOrderChart() {
            this.$nextTick(() => {
                const chart = echarts.init(document.getElementById("merchant-order-chart"));
                const pieData = [];
                const detail = this.merchantStats.orderDetail || {};
                for (let key in detail) {
                    pieData.push({ name: key, value: detail[key] });
                }
                const option = {
                    title: { text: '商户订单结构分析占比', left: 'center' },
                    tooltip: { trigger: 'item', formatter: '{a} <br/>{b} : {c} ({d}%)' },
                    legend: { orient: 'horizontal', bottom: 'bottom' },
                    series: [{
                        name: '订单类型',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '50%'],
                        data: pieData,
                        emphasis: {
                            itemStyle: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }]
                };
                chart.setOption(option);
            });
        },
        getSummary() {
            this.$http({
                url: "stats/summary",
                method: "get"
            }).then(({ data }) => {
                if (data && data.code === 0) {
                    this.summary = data.data;
                }
            });
        },
        getPerformance() {
            this.$http({
                url: "stats/guidePerformance",
                method: "get"
            }).then(({ data }) => {
                if (data && data.code === 0) {
                    this.performanceData = data.data;
                    this.initPerformanceChart();
                }
            });
        },
        getHotRoutes() {
            this.$http({
                url: "stats/hotRoutes",
                method: "get"
            }).then(({ data }) => {
                if (data && data.code === 0) {
                    this.hotRoutesData = data.data;
                    this.initHotRoutesChart();
                }
            });
        },
        initPerformanceChart() {
            const chart = echarts.init(document.getElementById("performance-chart"));
            const option = {
                title: { text: '导游服务订单量统计', left: 'center' },
                tooltip: { trigger: 'axis' },
                xAxis: {
                    type: 'category',
                    data: this.performanceData.map(item => item.name),
                    axisLabel: { interval: 0, rotate: 30 }
                },
                yAxis: { type: 'value' },
                series: [{
                    data: this.performanceData.map(item => item.value),
                    type: 'bar',
                    itemStyle: { color: '#bad399' }
                }]
            };
            chart.setOption(option);
        },
        initHotRoutesChart() {
            const chart = echarts.init(document.getElementById("hot-routes-chart"));
            const option = {
                title: { text: '热门景点点击量占比', left: 'center' },
                tooltip: { trigger: 'item' },
                legend: { orient: 'vertical', left: 'left', top: 'center' },
                series: [{
                    name: '点击量',
                    type: 'pie',
                    radius: '50%',
                    data: this.hotRoutesData,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }]
            };
            chart.setOption(option);
        }
    }
};
</script>

<style lang="scss" scoped>
.content {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    min-height: 100%;
}

.welcome-title {
    margin: 30px auto;
    font-size: 28px;
    color: rgb(51, 51, 51);
    text-align: center;
    font-weight: bold;
    width: 100%;
}

.main-stats-wrapper {
    width: 95%;
    max-width: 1400px;
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
}

.stats-container {
    padding: 0;
    .card-row {
        margin-bottom: 20px;
    }
    .stat-card {
        text-align: center;
        padding: 20px 0;
        border: none;
        color: #fff;
        &.color1 { background: #67C23A; }
        &.color2 { background: #409EFF; }
        &.color3 { background: #E6A23C; }
        &.color4 { background: #F56C6C; }
        
        .stat-val {
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .stat-label {
            font-size: 14px;
            opacity: 0.9;
        }
    }
}
</style>
