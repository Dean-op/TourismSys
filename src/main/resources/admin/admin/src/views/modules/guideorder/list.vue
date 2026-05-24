<template>
	<div class="main-content">
		<!-- 列表页 -->
		<template v-if="showFlag">
			<el-form class="center-form-pv" :style='{ "width": "10%", "margin": "0 0 20px 10px" }' :inline="true"
				:model="searchForm">
				<el-row :style='{ "flexDirection": "column", "display": "flex" }'>
					<div :style='{ "margin": "0", "flexDirection": "column", "display": "flex" }'>
						<label
							:style='{ "margin": "0 10px 0 0", "color": "#000", "textAlign": "center", "display": "inline-block", "width": "100%", "lineHeight": "40px", "fontSize": "14px", "fontWeight": "500", "height": "40px" }'
							class="item-label">用户账号</label>
						<el-input v-model="searchForm.username" placeholder="用户账号" clearable></el-input>
					</div>
					<div :style='{ "margin": "0", "flexDirection": "column", "display": "flex" }'>
						<label
							:style='{ "margin": "0 10px 0 0", "color": "#000", "textAlign": "center", "display": "inline-block", "width": "100%", "lineHeight": "40px", "fontSize": "14px", "fontWeight": "500", "height": "40px" }'
							class="item-label">导游姓名</label>
						<el-input v-model="searchForm.guidename" placeholder="导游姓名" clearable></el-input>
					</div>
					<div :style='{ "margin": "0 15px 0 0", "display": "inline-block" }' class="select">
						<label
							:style='{ "margin": "0 10px 0 0", "color": "#000", "textAlign": "center", "display": "inline-block", "width": "100%", "lineHeight": "40px", "fontSize": "14px", "fontWeight": "500", "height": "40px" }'
							class="item-label">状态</label>
						<el-select clearable v-model="searchForm.status" placeholder="状态">
							<el-option v-for="(item, index) in statusOptions" v-bind:key="index" :label="item"
								:value="item"></el-option>
						</el-select>
					</div>
					<el-button
						:style='{ "border": "0", "cursor": "pointer", "padding": "0", "boxShadow": "0px 2px 6px 0px rgba(0,0,0,0.3020)", "outline": "none", "margin": "6px 0 0", "color": "#fff", "borderRadius": "30px", "background": "#BAD399", "width": "100%", "fontSize": "14px", "height": "40px" }'
						type="success" @click="search()">查询</el-button>
				</el-row>

				<el-row :style='{ "margin": "20px 0", "flexDirection": "column", "display": "flex" }'>
					<el-button
						:style='{ "border": "0", "cursor": "pointer", "padding": "0", "boxShadow": "0px 2px 6px 0px rgba(0,0,0,0.3020)", "margin": "0 0 10px", "outline": "none", "color": "#fff", "borderRadius": "30px", "background": "#BAD399", "width": "100%", "fontSize": "14px", "height": "40px" }'
						v-if="isAuth('guideorder', '新增')" type="success" @click="addOrUpdateHandler()">新增</el-button>
					<el-button
						:style='{ "border": "0", "cursor": "pointer", "padding": "0", "boxShadow": "0px 2px 6px 0px rgba(0,0,0,0.3020)", "margin": "0 0 10px", "outline": "none", "color": "#fff", "borderRadius": "30px", "background": "#BAD399", "width": "100%", "fontSize": "14px", "height": "40px" }'
						v-if="isAuth('guideorder', '删除') && roleName=='管理员'" :disabled="dataListSelections.length <= 0" type="danger"
						@click="deleteHandler()">删除</el-button>
				</el-row>
			</el-form>

			<el-table class="tables" :stripe='false'
				:style='{ "padding": "0", "borderColor": "#6F6F97", "borderWidth": "1px", "background": "#fff", "width": "100%", "borderStyle": "solid", "height": "fit-content" }'
				v-if="isAuth('guideorder', '查看')" :data="dataList" v-loading="dataListLoading"
				@selection-change="selectionChangeHandler">
				<el-table-column :resizable='true' type="selection" align="center" width="50"></el-table-column>
				<el-table-column :resizable='true' :sortable='false' label="索引" type="index" width="50" />
				<el-table-column :resizable='true' :sortable='false' prop="username" label="用户账号">
					<template slot-scope="scope">
						{{ scope.row.username }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="guidename" label="导游姓名">
					<template slot-scope="scope">
						{{ scope.row.guidename }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="plandate" label="预约日期">
					<template slot-scope="scope">
						{{ scope.row.plandate }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="days" label="天数">
					<template slot-scope="scope">
						{{ scope.row.days }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="amount" label="金额">
					<template slot-scope="scope">
						{{ scope.row.amount }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="status" label="状态">
					<template slot-scope="scope">
						<span :style='{
							"padding": "3px 8px",
							"borderRadius": "4px",
							"fontSize": "12px",
							"cursor": "pointer",
							"background": scope.row.status === "待确认" ? "rgba(249, 115, 22, 0.2)" :
								scope.row.status === "已取消" ? "rgba(239, 68, 68, 0.2)" :
									scope.row.status === "已确认" ? "rgba(16, 185, 129, 0.2)" :
										scope.row.status === "已完成" ? "rgba(59, 130, 246, 0.2)" :
									"rgba(249, 115, 22, 0.2)",
							"color": scope.row.status === "待确认" ? "#f97316" :
								scope.row.status === "已取消" ? "#ef4444" :
									scope.row.status === "已确认" ? "#10b981" :
										scope.row.status === "已完成" ? "#3b82f6" :
									"#f97316"
						}' @click="statusDialog(scope.row)">
							{{ scope.row.status }}
						</span>
					</template>
				</el-table-column>
				<el-table-column width="300" label="操作">
					<template slot-scope="scope">
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="isAuth('guideorder', '查看')" type="success" size="mini"
							@click="addOrUpdateHandler(scope.row.id, 'info')">详情</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="isAuth('guideorder', '修改')" type="primary" size="mini"
							@click="addOrUpdateHandler(scope.row.id)">修改</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="(roleName=='导游' || roleName=='管理员') && scope.row.status=='待确认'" type="success" size="mini"
							@click="confirmHandler(scope.row)">确认</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="(roleName=='导游' || roleName=='管理员') && (scope.row.status=='待确认' || scope.row.status=='已确认')" type="warning" size="mini"
							@click="rejectHandler(scope.row)">拒绝</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="(roleName=='导游' || roleName=='管理员') && scope.row.status=='已确认'" type="primary" size="mini"
							@click="finishHandler(scope.row)">完成</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="(roleName=='用户' || roleName=='管理员') && (scope.row.status=='待确认' || scope.row.status=='已确认')" type="danger" size="mini"
							@click="cancelHandler(scope.row)">取消</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="isAuth('guideorder', '删除') && roleName=='管理员'" type="danger" size="mini"
							@click="deleteHandler(scope.row.id)">删除</el-button>
					</template>
				</el-table-column>
			</el-table>
			<el-pagination @size-change="sizeChangeHandle" @current-change="currentChangeHandle" :current-page="pageIndex"
				background :page-sizes="[10, 20, 30, 50]" :page-size="pageSize" :layout="layouts.join()"
				:total="totalPage" prev-text="<" next-text=">" :hide-on-single-page="true"
				:style='{ "padding": "0", "margin": "20px 0", "whiteSpace": "nowrap", "color": "#333", "textAlign": "center", "width": "100%", "fontWeight": "500" }'></el-pagination>
		</template>

		<add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>

		<el-dialog title="状态操作" :visible.sync="statusVisiable" width="40%"
			:style='{ "background": "rgba(15, 23, 42, 0.2)", "borderRadius": "8px", "border": "1px solid rgba(59, 130, 246, 0.3)" }'>
			<div style="padding:10px 0;">
				<div style="margin-bottom:10px;">当前状态：{{ statusRow.status }}</div>
				<el-button v-if="(roleName=='导游' || roleName=='管理员') && statusRow.status=='待确认'" type="success" size="mini"
					@click="confirmHandler(statusRow)">确认</el-button>
				<el-button v-if="(roleName=='导游' || roleName=='管理员') && (statusRow.status=='待确认' || statusRow.status=='已确认')" type="warning" size="mini"
					@click="rejectHandler(statusRow)">拒绝</el-button>
				<el-button v-if="(roleName=='导游' || roleName=='管理员') && statusRow.status=='已确认'" type="primary" size="mini"
					@click="finishHandler(statusRow)">完成</el-button>
				<el-button v-if="(roleName=='用户' || roleName=='管理员') && (statusRow.status=='待确认' || statusRow.status=='已确认')" type="danger" size="mini"
					@click="cancelHandler(statusRow)">取消</el-button>
			</div>
			<span slot="footer" class="dialog-footer">
				<el-button @click="statusDialog()">关闭</el-button>
			</span>
		</el-dialog>
	</div>
</template>

<script>
import AddOrUpdate from "./add-or-update";
export default {
	data() {
		return {
			searchForm: {
				key: ""
			},
			form: {},
			dataList: [],
			pageIndex: 1,
			pageSize: 10,
			totalPage: 0,
			dataListLoading: false,
			dataListSelections: [],
			showFlag: true,
			addOrUpdateFlag: false,
			layouts: ["total", "prev", "pager", "next", "sizes", "jumper"],
			statusOptions: ["待确认", "已确认", "已完成", "已取消"],
			roleName: '',
			statusVisiable: false,
			statusRow: {},
		};
	},
	created() {
		this.roleName = this.$storage.get('role') || '';
		if(this.roleName == '导游') {
			this.searchForm.statusin = '待确认,已确认';
		}
		this.getDataList();
		this.contentStyleChange()
	},
	components: {
		AddOrUpdate,
	},
	methods: {
		statusDialog(row) {
			this.statusVisiable = !this.statusVisiable;
			if (row) {
				this.statusRow = { ...row };
			}
		},
		confirmHandler(row) {
			this.$confirm(`确定确认该预约?`, "提示", {
				confirmButtonText: "确定",
				cancelButtonText: "取消",
				type: "warning"
			}).then(() => {
				this.$http({
					url: `guideorder/confirm/${row.id}`,
					method: 'post'
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$message({ message: '操作成功', type: 'success', duration: 1500, onClose: () => this.getDataList() });
						this.statusVisiable = false;
					} else {
						this.$message.error(data.msg);
					}
				})
			});
		},
		rejectHandler(row) {
			this.$prompt('请输入拒绝原因(可选)', '提示', {
				confirmButtonText: '确定',
				cancelButtonText: '取消',
				inputValue: ''
			}).then(({ value }) => {
				this.$http({
					url: `guideorder/reject/${row.id}`,
					method: 'post',
					params: { remark: value }
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$message({ message: '操作成功', type: 'success', duration: 1500, onClose: () => this.getDataList() });
						this.statusVisiable = false;
					} else {
						this.$message.error(data.msg);
					}
				})
			}).catch(() => { });
		},
		finishHandler(row) {
			this.$confirm(`确定完成该预约?`, "提示", {
				confirmButtonText: "确定",
				cancelButtonText: "取消",
				type: "warning"
			}).then(() => {
				this.$http({
					url: `guideorder/finish/${row.id}`,
					method: 'post'
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$message({ message: '操作成功', type: 'success', duration: 1500, onClose: () => this.getDataList() });
						this.statusVisiable = false;
					} else {
						this.$message.error(data.msg);
					}
				})
			});
		},
		cancelHandler(row) {
			this.$confirm(`确定取消该预约?`, "提示", {
				confirmButtonText: "确定",
				cancelButtonText: "取消",
				type: "warning"
			}).then(() => {
				this.$http({
					url: `guideorder/cancel/${row.id}`,
					method: 'post'
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$message({ message: '操作成功', type: 'success', duration: 1500, onClose: () => this.getDataList() });
						this.statusVisiable = false;
					} else {
						this.$message.error(data.msg);
					}
				})
			});
		},
		search() {
			this.pageIndex = 1;
			this.getDataList();
		},
		getDataList() {
			this.dataListLoading = true;
			this.$http({
				url: "guideorder/page",
				method: "get",
				params: {
					page: this.pageIndex,
					limit: this.pageSize,
					...this.searchForm
				}
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.dataList = data.data.list;
					this.totalPage = data.data.total;
				} else {
					this.dataList = [];
					this.totalPage = 0;
				}
				this.dataListLoading = false;
			});
		},
		sizeChangeHandle(val) {
			this.pageSize = val;
			this.pageIndex = 1;
			this.getDataList();
		},
		currentChangeHandle(val) {
			this.pageIndex = val;
			this.getDataList();
		},
		selectionChangeHandler(val) {
			this.dataListSelections = val;
		},
		addOrUpdateHandler(id, type) {
			this.showFlag = false;
			this.addOrUpdateFlag = true;
			this.$nextTick(() => {
				this.$refs.addOrUpdate.init(id, type);
			});
		},
		deleteHandler(id) {
			var ids = id ? [id] : this.dataListSelections.map(item => {
				return item.id;
			});
			this.$confirm(`确定进行删除操作?`, "提示", {
				confirmButtonText: "确定",
				cancelButtonText: "取消",
				type: "warning"
			}).then(() => {
				this.$http({
					url: "guideorder/delete",
					method: "post",
					data: ids
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$message({
							message: "操作成功",
							type: "success",
							duration: 1500,
							onClose: () => {
								this.getDataList();
							}
						});
					} else {
						this.$message.error(data.msg);
					}
				});
			});
		},
		contentStyleChange() {
			this.$nextTick(() => {
				document.querySelector('.main-content').style.minHeight = window.innerHeight - 64 - 100 + 'px'
			})
		}
	}
};
</script>

<style lang="scss" scoped>
</style>
