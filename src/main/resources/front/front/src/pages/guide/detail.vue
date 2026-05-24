<template>
  <div class="detail-preview">
    <div :style='{"width":"1200px","padding":"10px","margin":"12px auto 0","borderRadius":"16px","background":"#BAD399"}' class="breadcrumb-preview">
      <el-breadcrumb :separator="'///'" :style='{"fontSize":"14px","lineHeight":"1"}'>
        <el-breadcrumb-item>首页</el-breadcrumb-item>
        <el-breadcrumb-item>导游详情</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div :style='{"width":"1200px","padding":"20px","margin":"20px auto","borderRadius":"8px","background":"#fff","border":"2px solid #bad399"}'>
      <el-row :gutter="40">
        <el-col :span="10">
          <el-image :src="baseUrl + detail.avatar" style="width: 100%; height: 450px; border-radius: 8px;" fit="cover"></el-image>
        </el-col>
        <el-col :span="14">
          <div class="guide-info">
            <h2 style="margin-top: 0; color: #333;">{{detail.guidename}}</h2>
            <div class="info-item">
              <span class="label">擅长领域：</span>
              <span class="content">{{detail.specialties}}</span>
            </div>
            <div class="info-item">
              <span class="label">导游证号：</span>
              <span class="content">{{detail.qualification}}</span>
            </div>
            <div class="info-item">
              <span class="label">联系电话：</span>
              <span class="content">{{detail.phone}}</span>
            </div>
            <div class="info-item">
              <span class="label">服务价格：</span>
              <span class="price">￥{{detail.price}} / 天</span>
            </div>
            
            <div style="margin-top: 30px;">
              <el-button type="primary" size="large" @click="bookingVisible = true" style="background: #bad399; border: none; width: 200px; height: 50px; font-size: 18px;">立即预约</el-button>
            </div>
          </div>
        </el-col>
      </el-row>

      <el-tabs v-model="activeTab" style="margin-top: 40px;">
        <el-tab-pane label="详细介绍" name="detail">
          <div v-html="detail.qualification" style="line-height: 1.8; color: #666;"></div>
        </el-tab-pane>
        <el-tab-pane label="推荐路线" name="routes">
          <el-table :data="routesList" style="width: 100%">
            <el-table-column prop="mudedi" label="目的地" width="180"></el-table-column>
            <el-table-column prop="duration" label="天数" width="100"></el-table-column>
            <el-table-column prop="route" label="路线详情"></el-table-column>
            <el-table-column label="操作" width="120">
              <template slot-scope="scope">
                <el-button type="text" @click="toRouteDetail(scope.row)">查看详情</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
      </el-tabs>
    </div>

    <!-- 预约弹窗 -->
    <el-dialog title="预约导游" :visible.sync="bookingVisible" width="500px">
      <el-form :model="bookingForm" label-width="100px">
        <el-form-item label="导游姓名">
          <el-input v-model="detail.guidename" disabled></el-input>
        </el-form-item>
        <el-form-item label="服务价格">
          <el-input :value="'￥' + detail.price + '/天'" disabled></el-input>
        </el-form-item>
        <el-form-item label="预约日期">
          <el-date-picker v-model="bookingForm.plandate" type="date" placeholder="选择日期" value-format="yyyy-MM-dd" style="width: 100%;"></el-date-picker>
        </el-form-item>
        <el-form-item label="预约天数">
          <el-input-number v-model="bookingForm.days" :min="1" @change="calcAmount" style="width: 100%;"></el-input-number>
        </el-form-item>
        <el-form-item label="预估总价">
          <span style="color: #f00; font-size: 20px; font-weight: bold;">￥{{bookingForm.amount}}</span>
        </el-form-item>
        <el-form-item label="备注说明">
          <el-input type="textarea" v-model="bookingForm.remark"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="bookingVisible = false">取消</el-button>
        <el-button type="primary" @click="submitBooking" style="background: #bad399; border: none;">确认预约</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      baseUrl: '',
      detail: {},
      activeTab: 'detail',
      routesList: [],
      bookingVisible: false,
      bookingForm: {
        plandate: '',
        days: 1,
        amount: 0,
        remark: ''
      }
    }
  },
  created() {
    this.baseUrl = this.$config.baseUrl;
    this.getDetail();
    this.getRoutes();
  },
  methods: {
    getDetail() {
      const id = this.$route.query.id;
      this.$http.get(`guide/info/${id}`).then(res => {
        if (res.data.code == 0) {
          this.detail = res.data.data;
          this.calcAmount();
        }
      });
    },
    getRoutes() {
      // 导游绑定的路线：从 tourplan 中筛选
      this.$http.get('tourplan/list', {params: {limit: 5}}).then(res => {
        if (res.data.code == 0) {
          this.routesList = res.data.data.list;
        }
      });
    },
    calcAmount() {
      this.bookingForm.amount = (this.detail.price || 0) * this.bookingForm.days;
    },
    submitBooking() {
      if (!this.bookingForm.plandate) {
        this.$message.error('请选择预约日期');
        return;
      }
      const user = JSON.parse(localStorage.getItem('userForm') || '{}');
      const params = {
        userid: localStorage.getItem('userid'),
        username: localStorage.getItem('username'),
        guideid: this.detail.id,
        guideusername: this.detail.guideusername,
        guidename: this.detail.guidename,
        plandate: this.bookingForm.plandate,
        days: this.bookingForm.days,
        amount: this.bookingForm.amount,
        remark: this.bookingForm.remark,
        status: '待确认'
      };
      this.$http.post('guideorder/add', params).then(res => {
        if (res.data.code == 0) {
          this.$message.success('预约申请已提交，请等待导游确认');
          this.bookingVisible = false;
        } else {
          this.$message.error(res.data.msg);
        }
      });
    },
    toRouteDetail(item) {
      this.$router.push({path: '/index/tourplanDetail', query: {id: item.id}});
    }
  }
}
</script>

<style scoped>
.info-item {
  margin: 15px 0;
  font-size: 16px;
}
.label {
  color: #666;
  width: 100px;
  display: inline-block;
}
.price {
  color: #f00;
  font-size: 24px;
  font-weight: bold;
}
</style>
