<template>
  <div class="center-preview">
    <div :style='{"width":"1200px","padding":"10px","margin":"12px auto 0","borderRadius":"16px","background":"#BAD399"}' class="breadcrumb-preview">
      <el-breadcrumb :separator="'///'" :style='{"fontSize":"14px","lineHeight":"1"}'>
        <el-breadcrumb-item>首页</el-breadcrumb-item>
        <el-breadcrumb-item>导游预约</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div :style='{"width":"1200px","margin":"20px auto","padding":"20px","background":"#fff","border":"2px solid #bad399","borderRadius":"8px"}'>
      <el-table :data="dataList" style="width: 100%">
        <el-table-column prop="guidename" label="导游姓名" width="120"></el-table-column>
        <el-table-column prop="plandate" label="预约日期" width="120"></el-table-column>
        <el-table-column prop="days" label="天数" width="80"></el-table-column>
        <el-table-column prop="amount" label="总金额" width="100">
          <template slot-scope="scope">￥{{scope.row.amount}}</template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="100">
          <template slot-scope="scope">
            <el-tag :type="statusType(scope.row.status)">{{scope.row.status}}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="remark" label="备注"></el-table-column>
        <el-table-column label="操作" width="150">
          <template slot-scope="scope">
            <el-button v-if="scope.row.status == '待确认'" type="text" style="color: #F56C6C;" @click="cancelOrder(scope.row)">取消预约</el-button>
            <el-button type="text" @click="toDetail(scope.row)">详情</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <el-pagination
        background
        class="pagination"
        :page-size="pageSize"
        :total="total"
        @current-change="curChange"
        :style='{"width":"100%","margin":"20px auto","textAlign":"center"}'
      ></el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dataList: [],
      total: 0,
      pageSize: 10,
    }
  },
  created() {
    this.getList(1);
  },
  methods: {
    getList(page) {
      this.$http.get('guideorder/list', {
        params: {
          page,
          limit: this.pageSize,
          userid: localStorage.getItem('userid')
        }
      }).then(res => {
        if (res.data.code == 0) {
          this.dataList = res.data.data.list;
          this.total = res.data.data.total;
        }
      });
    },
    curChange(page) {
      this.getList(page);
    },
    statusType(status) {
      const map = {
        '待确认': 'warning',
        '已确认': 'success',
        '已拒绝': 'danger',
        '已取消': 'info',
        '已完成': 'primary'
      };
      return map[status] || '';
    },
    cancelOrder(item) {
      this.$confirm('确定要取消该预约吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        item.status = '已取消';
        this.$http.post('guideorder/update', item).then(res => {
          if (res.data.code == 0) {
            this.$message.success('取消成功');
            this.getList(1);
          }
        });
      });
    },
    toDetail(item) {
      // 可以在此处实现详情展示
    }
  }
}
</script>
