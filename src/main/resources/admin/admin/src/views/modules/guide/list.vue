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
							class="item-label">账号</label>
						<el-input v-model="searchForm.guideusername" placeholder="账号" clearable></el-input>
					</div>
					<div :style='{ "margin": "0", "flexDirection": "column", "display": "flex" }'>
						<label
							:style='{ "margin": "0 10px 0 0", "color": "#000", "textAlign": "center", "display": "inline-block", "width": "100%", "lineHeight": "40px", "fontSize": "14px", "fontWeight": "500", "height": "40px" }'
							class="item-label">姓名</label>
						<el-input v-model="searchForm.guidename" placeholder="姓名" clearable></el-input>
					</div>
					<div :style='{ "margin": "0 15px 0 0", "display": "inline-block" }' class="select">
						<label
							:style='{ "margin": "0 10px 0 0", "color": "#000", "textAlign": "center", "display": "inline-block", "width": "100%", "lineHeight": "40px", "fontSize": "14px", "fontWeight": "500", "height": "40px" }'
							class="item-label">审核状态</label>
						<el-select clearable v-model="searchForm.status" placeholder="审核状态">
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
						v-if="isAuth('guide', '新增')" type="success" @click="addOrUpdateHandler()">新增</el-button>
					<el-button
						:style='{ "border": "0", "cursor": "pointer", "padding": "0", "boxShadow": "0px 2px 6px 0px rgba(0,0,0,0.3020)", "margin": "0 0 10px", "outline": "none", "color": "#fff", "borderRadius": "30px", "background": "#BAD399", "width": "100%", "fontSize": "14px", "height": "40px" }'
						v-if="isAuth('guide', '删除')" :disabled="dataListSelections.length <= 0" type="danger"
						@click="deleteHandler()">删除</el-button>
				</el-row>
			</el-form>

			<el-table class="tables" :stripe='false'
				:style='{ "padding": "0", "borderColor": "#6F6F97", "borderWidth": "1px", "background": "#fff", "width": "100%", "borderStyle": "solid", "height": "fit-content" }'
				v-if="isAuth('guide', '查看')" :data="dataList" v-loading="dataListLoading"
				@selection-change="selectionChangeHandler">
				<el-table-column :resizable='true' type="selection" align="center" width="50"></el-table-column>
				<el-table-column :resizable='true' :sortable='false' label="索引" type="index" width="50" />
				<el-table-column :resizable='true' :sortable='false' prop="guideusername" label="账号">
					<template slot-scope="scope">
						{{ scope.row.guideusername }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="guidename" label="姓名">
					<template slot-scope="scope">
						{{ scope.row.guidename }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="phone" label="手机">
					<template slot-scope="scope">
						{{ scope.row.phone }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="price" label="价格/天">
					<template slot-scope="scope">
						{{ scope.row.price }}
					</template>
				</el-table-column>
				<el-table-column :resizable='true' :sortable='false' prop="status" label="审核状态">
					<template slot-scope="scope">
						<span :style='{
							"padding": "3px 8px",
							"borderRadius": "4px",
							"fontSize": "12px",
							"background": scope.row.status === "待审核" ? "rgba(249, 115, 22, 0.2)" :
								scope.row.status === "拒绝" ? "rgba(239, 68, 68, 0.2)" :
									scope.row.status === "通过" ? "rgba(16, 185, 129, 0.2)" :
									"rgba(249, 115, 22, 0.2)",
							"color": scope.row.status === "待审核" ? "#f97316" :
								scope.row.status === "拒绝" ? "#ef4444" :
									scope.row.status === "通过" ? "#10b981" :
									"#f97316"
						}' @click="statusDialog(scope.row)">
							{{ scope.row.status ? scope.row.status : '待审核' }}
						</span>
					</template>
				</el-table-column>
				<el-table-column width="300" label="操作">
					<template slot-scope="scope">
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="isAuth('guide', '查看')" type="success" size="mini"
							@click="addOrUpdateHandler(scope.row.id, 'info')">详情</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="isAuth('guide', '修改')" type="primary" size="mini"
							@click="addOrUpdateHandler(scope.row.id)">修改</el-button>
						<el-button
							:style='{ "border": "0", "cursor": "pointer", "padding": "0 24px", "margin": "0 10px 4px 0", "outline": "none", "color": "#000", "borderRadius": "30px", "background": "#E4E4E4", "width": "auto", "fontSize": "14px", "height": "32px" }'
							v-if="isAuth('guide', '删除')" type="danger" size="mini"
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

		<el-dialog title="审核" :visible.sync="statusVisiable" width="50%"
			:style='{ "background": "rgba(15, 23, 42, 0.2)", "borderRadius": "8px", "border": "1px solid rgba(59, 130, 246, 0.3)" }'>
			<el-form ref="form" :model="form" label-width="80px">
				<el-form-item label="审核状态">
					<el-select v-model="statusForm.status" placeholder="审核状态">
						<el-option v-for="(item, index) in statusOptions" v-bind:key="index" :label="item"
							:value="item"></el-option>
					</el-select>
				</el-form-item>
			</el-form>
			<span slot="footer" class="dialog-footer">
				<el-button
					:style='{ "border": "1px solid rgba(100, 116, 139, 0.5)", "cursor": "pointer", "padding": "0 15px", "margin": "0 10px 0 0", "outline": "none", "color": "#94a3b8", "borderRadius": "4px", "background": "rgba(30, 41, 59, 0.6)", "width": "auto", "fontSize": "14px", "height": "32px" }'
					@click="statusDialog">取消</el-button>
				<el-button
					:style='{ "border": "1px solid rgba(59, 130, 246, 0.5)", "cursor": "pointer", "padding": "0 15px", "margin": "0 10px 0 0", "outline": "none", "color": "#fff", "borderRadius": "4px", "background": "linear-gradient(90deg, rgba(59, 130, 246, 0.7), rgba(37, 99, 235, 0.7))", "width": "auto", "fontSize": "14px", "height": "32px" }'
					type="primary" @click="statusHandler">确定</el-button>
			</span>
		</el-dialog>
	</div>
</template>

<script>
import axios from 'axios'
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
			statusVisiable: false,
			statusForm: {},
			statusOptions: ["待审核", "通过", "拒绝"],
		};
	},
	created() {
		this.init();
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
				this.statusForm = {
					...row,
					status: row.status,
					id: row.id
				}
			}
		},
		statusHandler() {
			this.$confirm(`确定操作?`, "提示", {
				confirmButtonText: "确定",
				cancelButtonText: "取消",
				type: "warning"
			}).then(() => {
				this.$http({
					url: "guide/update",
					method: "post",
					data: this.statusForm
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$message({
							message: "操作成功",
							type: "success",
							duration: 1500,
							onClose: () => {
								this.getDataList();
								this.statusDialog()
							}
						});
					} else {
						this.$message.error(data.msg);
					}
				});
			});
		},
		init() {
		},
		search() {
			this.pageIndex = 1;
			this.getDataList();
		},
		getDataList() {
			this.dataListLoading = true;
			this.$http({
				url: "guide/page",
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
					url: "guide/delete",
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
