<template>
  <div>
    <div :style='{"width":"1200px","padding":"10px","margin":"12px auto 0","borderRadius":"16px","background":"#BAD399"}' class="breadcrumb-preview">
      <el-breadcrumb :separator="'///'" :style='{"fontSize":"14px","lineHeight":"1"}'>
        <el-breadcrumb-item>首页</el-breadcrumb-item>
        <el-breadcrumb-item>导游展示</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div class="list-preview" :style='{"width":"1200px","margin":"10px auto","position":"relative","flexWrap":"wrap","background":"none","display":"flex"}'>
      <el-form :inline="true" :model="formSearch" class="list-form-pv" :style='{"border":"2px solid #bad399","padding":"10px 0","margin":"10px 0 0 0","borderRadius":"8px","flexWrap":"wrap","background":"#fff","display":"flex","width":"100%","height":"auto"}'>
        <el-form-item :style='{"margin":"10px"}'>
          <div class="lable" :style='{"width":"auto","padding":"0 10px","lineHeight":"42px","color":"#29292a","display":"inline-block"}'>导游姓名</div>
          <el-input v-model="formSearch.guidename" placeholder="导游姓名" clearable></el-input>
        </el-form-item>
        <el-form-item :style='{"margin":"10px"}'>
          <div class="lable" :style='{"width":"auto","padding":"0 10px","lineHeight":"42px","color":"#29292a","display":"inline-block"}'>擅长领域</div>
          <el-input v-model="formSearch.specialties" placeholder="擅长领域" clearable></el-input>
        </el-form-item>
        <el-button :style='{"cursor":"pointer","border":"0","padding":"0px 15px","margin":"10px","outline":"none","color":"#fff","borderRadius":"10px","background":"#bad399","width":"auto","fontSize":"14px","lineHeight":"42px","height":"42px"}' type="primary" @click="getList(1)">
          <i class="el-icon-search"></i>查询
        </el-button>
      </el-form>

      <div class="list" :style='{"margin":"20px 0 0 0","flex":"1","width":"100%"}'>
        <el-row :gutter="20">
          <el-col :span="6" v-for="(item, index) in dataList" :key="index" style="margin-bottom: 20px;">
            <el-card :body-style="{ padding: '0px' }" class="guide-card" @click.native="toDetail(item)">
              <el-image :src="baseUrl + item.avatar" class="guide-img" fit="cover">
                <div slot="error" class="image-slot">
                  <i class="el-icon-picture-outline"></i>
                </div>
              </el-image>
              <div style="padding: 14px;">
                <div class="guide-name">{{item.guidename}}</div>
                <div class="guide-specialties">擅长：{{item.specialties}}</div>
                <div class="guide-price">￥{{item.price}}/天</div>
              </div>
            </el-card>
          </el-col>
        </el-row>

        <el-pagination
          background
          class="pagination"
          :pager-count="7"
          :page-size="pageSize"
          :total="total"
          prev-text="上一页"
          next-text="下一页"
          @current-change="curChange"
          :style='{"width":"100%","margin":"20px auto","textAlign":"center"}'
        ></el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      baseUrl: '',
      formSearch: {
        guidename: '',
        specialties: ''
      },
      dataList: [],
      total: 0,
      pageSize: 12,
    }
  },
  created() {
    this.baseUrl = this.$config.baseUrl;
    this.getList(1);
  },
  methods: {
    getList(page) {
      let params = {
        page,
        limit: this.pageSize,
        status: '正常'
      };
      if (this.formSearch.guidename) params.guidename = '%' + this.formSearch.guidename + '%';
      if (this.formSearch.specialties) params.specialties = '%' + this.formSearch.specialties + '%';
      
      this.$http.get('guide/list', {params}).then(res => {
        if (res.data.code == 0) {
          this.dataList = res.data.data.list;
          this.total = res.data.data.total;
        }
      });
    },
    curChange(page) {
      this.getList(page);
    },
    toDetail(item) {
      this.$router.push({path: '/index/guideDetail', query: {id: item.id}});
    }
  }
}
</script>

<style scoped>
.guide-card {
  cursor: pointer;
  transition: all 0.3s;
  border: 1px solid #bad399;
}
.guide-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}
.guide-img {
  width: 100%;
  height: 250px;
}
.guide-name {
  font-size: 18px;
  font-weight: bold;
  color: #333;
  margin-bottom: 8px;
}
.guide-specialties {
  font-size: 14px;
  color: #666;
  margin-bottom: 8px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.guide-price {
  font-size: 16px;
  color: #f00;
  font-weight: bold;
}
</style>
