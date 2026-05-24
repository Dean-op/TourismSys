<template>
	<div class="addEdit-block" style="width: 100%;">
		<el-form
			:style='{ "padding": "30px", "boxShadow": "0 0px 0px rgba(64, 158, 255, .3)", "margin": "-30px 0 0", "borderRadius": "0 0 30px 30px", "flexWrap": "wrap", "background": "#F8F6F7", "display": "flex", "width": "100%" }'
			class="add-update-preview" ref="ruleForm" :model="ruleForm" :rules="rules" label-width="120px">
			<template>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="用户账号" prop="username">
					<el-input v-model="ruleForm.username" placeholder="用户账号" clearable :readonly="ro.username"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="用户账号"
					prop="username">
					<el-input v-model="ruleForm.username" placeholder="用户账号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="select" v-if="type != 'info'"
					label="选择导游" prop="guideid">
					<el-select :disabled="ro.guideid" v-model="ruleForm.guideid" placeholder="请选择导游" filterable @change="guideChange">
						<el-option v-for="item in guideOptions" :key="item.id" :label="item.guidename" :value="item.id"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="导游姓名"
					prop="guidename">
					<el-input v-model="ruleForm.guidename" placeholder="导游姓名" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="date" v-if="type != 'info'"
					label="预约日期" prop="plandate">
					<el-date-picker :disabled="ro.plandate" v-model="ruleForm.plandate" type="date" placeholder="选择预约日期"
						value-format="yyyy-MM-dd"></el-date-picker>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="预约日期"
					prop="plandate">
					<el-input v-model="ruleForm.plandate" placeholder="预约日期" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="天数" prop="days">
					<el-input v-model="ruleForm.days" placeholder="天数" clearable :readonly="ro.days" @input="calcAmount"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="天数" prop="days">
					<el-input v-model="ruleForm.days" placeholder="天数" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="金额" prop="amount">
					<el-input v-model="ruleForm.amount" placeholder="金额" clearable :readonly="true"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="金额" prop="amount">
					<el-input v-model="ruleForm.amount" placeholder="金额" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="select" v-if="type != 'info'"
					label="状态" prop="status">
					<el-select :disabled="ro.status" v-model="ruleForm.status" placeholder="请选择状态">
						<el-option v-for="(item, index) in statusOptions" v-bind:key="index" :label="item" :value="item"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="状态" prop="status">
					<el-input v-model="ruleForm.status" placeholder="状态" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="备注" prop="remark">
					<el-input v-model="ruleForm.remark" placeholder="备注" clearable :readonly="ro.remark"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="备注" prop="remark">
					<el-input v-model="ruleForm.remark" placeholder="备注" readonly></el-input>
				</el-form-item>
			</template>
			<el-form-item :style='{ "width": "100%", "padding": "0", "margin": "0" }' class="btn">
				<el-button
					:style='{ "border": "0", "cursor": "pointer", "padding": "0", "margin": "0 20px 0 0", "outline": "none", "color": "rgba(255, 255, 255, 1)", "borderRadius": "0", "background": "#BAD399", "width": "128px", "lineHeight": "40px", "fontSize": "14px", "height": "40px" }'
					v-if="type != 'info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
				<el-button
					:style='{ "border": "0px solid rgba(64, 158, 255, 1)", "cursor": "pointer", "padding": "0", "margin": "0", "outline": "none", "color": "#fff", "borderRadius": "0", "background": "#BAD399", "width": "128px", "lineHeight": "40px", "fontSize": "14px", "height": "40px" }'
					v-if="type != 'info'" class="btn-close" @click="back()">取消</el-button>
				<el-button
					:style='{ "border": "0px solid rgba(64, 158,  255, 1)", "cursor": "pointer", "padding": "0", "margin": "0", "outline": "none", "color": "#fff", "borderRadius": "0", "background": "#BAD399", "width": "128px", "lineHeight": "40px", "fontSize": "14px", "height": "40px" }'
					v-if="type == 'info'" class="btn-close" @click="back()">返回</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
import { isNumber, isIntNumer, isEmail, isPhone, isMobile, isURL, checkIdCard } from "@/utils/validate";
export default {
	data() {
		var validateNumber = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!isNumber(value)) {
				callback(new Error("请输入数字"));
			} else {
				callback();
			}
		};
		var validateIntNumber = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!isIntNumer(value)) {
				callback(new Error("请输入整数"));
			} else {
				callback();
			}
		};
		return {
			id: '',
			type: '',
			guideOptions: [],
			guidePriceMap: {},
			ro: {
				username: false,
				guideid: false,
				plandate: false,
				days: false,
				amount: true,
				status: false,
				remark: false,
			},
			ruleForm: {
				username: '',
				guideid: '',
				guideusername: '',
				guidename: '',
				plandate: '',
				days: 1,
				amount: 0,
				status: '待确认',
				remark: ''
			},
			statusOptions: ["待确认", "已确认", "已完成", "已取消"],
			rules: {
				guideid: [{ required: true, message: '请选择导游', trigger: 'change' }],
				days: [{ validator: validateIntNumber, trigger: 'blur' }],
				amount: [{ validator: validateNumber, trigger: 'blur' }],
			}
		};
	},
	props: ["parent"],
	methods: {
		getGuideOptions() {
			this.$http({
				url: 'guide/list',
				method: 'get',
				params: {
					page: 1,
					limit: 9999,
					status: '通过'
				}
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.guideOptions = data.data.list || [];
					const map = {};
					(this.guideOptions || []).forEach(g => {
						map[g.id] = g.price || 0;
					});
					this.guidePriceMap = map;
					this.calcAmount();
				}
			});
		},
		guideChange(val) {
			const guide = (this.guideOptions || []).find(g => g.id === val);
			if (guide) {
				this.ruleForm.guideid = guide.id;
				this.ruleForm.guideusername = guide.guideusername;
				this.ruleForm.guidename = guide.guidename;
			}
			this.calcAmount();
		},
		calcAmount() {
			const days = parseInt(this.ruleForm.days, 10);
			const d = isNaN(days) || days <= 0 ? 1 : days;
			this.ruleForm.days = d;
			const price = this.guidePriceMap[this.ruleForm.guideid] || 0;
			this.ruleForm.amount = Number((price * d).toFixed(2));
		},
		init(id, type) {
			this.id = id;
			this.type = type;
			this.getGuideOptions();
			if (this.type === 'info') {
				this.ro.username = true;
				this.ro.guideid = true;
				this.ro.plandate = true;
				this.ro.days = true;
				this.ro.amount = true;
				this.ro.status = true;
				this.ro.remark = true;
			}
			if (this.id) {
				this.$http({
					url: `guideorder/info/${this.id}`,
					method: 'get'
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.ruleForm = data.data
						this.calcAmount();
					}
				})
			} else {
				this.calcAmount();
			}
		},
		onSubmit() {
			this.$refs["ruleForm"].validate(valid => {
				if (!valid) return;
				this.calcAmount();
				this.$http({
					url: `guideorder/${!this.ruleForm.id ? 'save' : 'update'}`,
					method: 'post',
					data: this.ruleForm
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$message({
							message: '操作成功',
							type: 'success',
							duration: 1500,
							onClose: () => {
								this.parent.showFlag = true;
								this.parent.addOrUpdateFlag = false;
								this.parent.getDataList();
							}
						});
					} else {
						this.$message.error(data.msg);
					}
				})
			})
		},
		back() {
			this.parent.showFlag = true;
			this.parent.addOrUpdateFlag = false;
		}
	}
};
</script>

<style lang="scss" scoped>
</style>
