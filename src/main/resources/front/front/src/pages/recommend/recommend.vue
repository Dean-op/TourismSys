<template>
<div :style='{"border":"2px solid #bad399","padding":"20px","margin":"20px auto 0","borderRadius":"8px","flexWrap":"wrap","background":"#fff","width":"1200px","position":"relative"}'>
    <div style="font-size: 24px; color: #4E8531; text-align: center; margin-bottom: 20px;">济南旅游路线定制推荐</div>
    
    <el-form :inline="true" :model="queryForm" style="text-align: center; margin-bottom: 30px;">
        <el-form-item label="旅游天数">
            <el-input-number v-model="queryForm.days" :min="1" :max="7" label="天数"></el-input-number>
        </el-form-item>
        <el-form-item label="兴趣偏好">
            <el-input v-model="queryForm.preferKeywords" placeholder="如：自然,历史,泉水" clearable style="width: 250px;"></el-input>
        </el-form-item>
        <el-form-item label="门票预算上限">
            <el-input-number v-model="queryForm.budgetMax" :min="0" label="预算"></el-input-number>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="getRecommend" icon="el-icon-magic-stick" style="background: #bad399; border: none;">生成推荐方案</el-button>
        </el-form-item>
    </el-form>

    <div v-if="recommendList.length > 0" class="recommend-results">
        <el-row :gutter="20">
            <el-col :span="8" v-for="(item, index) in recommendList" :key="index">
                <el-card :body-style="{ padding: '20px' }" style="border: 1px solid #bad399; height: 100%;">
                    <div slot="header" style="font-weight: bold; color: #4E8531; display: flex; justify-content: space-between; align-items: center;">
                        <span>推荐方案 {{ index + 1 }}</span>
                        <el-tag size="small" type="success">估算票价: ¥{{ item.totalTicketPrice }}</el-tag>
                    </div>
                    
                    <div style="min-height: 300px; margin-bottom: 20px;">
                        <div v-for="(day, dIdx) in item.byDay" :key="dIdx" style="margin-bottom: 15px;">
                            <div style="font-weight: bold; margin-bottom: 5px; color: #666;">第 {{ dIdx + 1 }} 天</div>
                            <div v-for="(spot, sIdx) in day" :key="sIdx" style="padding-left: 15px; font-size: 14px; line-height: 24px;">
                                <i class="el-icon-location-outline" style="color: #bad399;"></i> {{ spot.scenicname }}
                                <span style="color: #999; font-size: 12px;">({{ spot.price ? '¥'+spot.price : '免费' }})</span>
                            </div>
                        </div>
                    </div>

                    <div style="border-top: 1px dashed #eee; padding-top: 15px; text-align: center;">
                        <el-button type="success" size="medium" @click="savePlan(item)" style="background: #47b144; border: none;">保存到我的规划</el-button>
                    </div>
                </el-card>
            </el-col>
        </el-row>
    </div>
    
    <div v-else-if="searched" style="text-align: center; color: #999; padding: 50px 0;">
        未找到符合偏好的景点，请尝试减少偏好词或调高预算。
    </div>
</div>
</template>

<script>
export default {
    data() {
        return {
            queryForm: {
                days: 1,
                preferKeywords: '',
                budgetMax: 500
            },
            recommendList: [],
            searched: false,
            Token: localStorage.getItem('Token')
        }
    },
    methods: {
        getRecommend() {
            this.$http.post('recommend/routes', this.queryForm).then(res => {
                if (res.data.code == 0) {
                    this.recommendList = res.data.data;
                    this.searched = true;
                } else {
                    this.$message.error(res.data.msg);
                }
            });
        },
        savePlan(item) {
            if (!this.Token) {
                this.$message.warning('请先登录后再保存规划');
                this.$router.push('/login');
                return;
            }
            
            this.$confirm('确定要将此推荐路线保存到您的旅游规划中吗？', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'info'
            }).then(() => {
                const postData = {
                    route: item.route,
                    duration: item.days,
                    content: item.content,
                    mudedi: '济南',
                    starttime: this.getCurDate() + ' 08:00:00'
                };
                
                this.$http.post('recommend/save', postData).then(res => {
                    if (res.data.code == 0) {
                        this.$message.success('保存成功，可在个人中心-旅游规划查看');
                        this.$router.push('/index/tourplan');
                    } else {
                        this.$message.error(res.data.msg);
                    }
                });
            }).catch(() => {});
        },
        getCurDate() {
            let currentTime = new Date();
            let year = currentTime.getFullYear();
            let month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1;
            let day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate();
            return year + "-" + month + "-" + day;
        }
    }
}
</script>

<style scoped>
.recommend-results {
    margin-top: 20px;
}
.el-card {
    transition: all 0.3s;
}
.el-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}
</style>
