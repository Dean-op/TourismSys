<template>
	<div class="addEdit-block" style="width: 100%;">
		<el-form
			:style='{ "padding": "30px", "boxShadow": "0 0px 0px rgba(64, 158, 255, .3)", "margin": "-30px 0 0", "borderRadius": "0 0 30px 30px", "flexWrap": "wrap", "background": "#F8F6F7", "display": "flex", "width": "100%" }'
			class="add-update-preview" ref="ruleForm" :model="ruleForm" :rules="rules" label-width="120px">
			<template>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="账号" prop="guideusername">
					<el-input v-model="ruleForm.guideusername" placeholder="账号" clearable
						:readonly="ro.guideusername"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="账号"
					prop="guideusername">
					<el-input v-model="ruleForm.guideusername" placeholder="账号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="密码" prop="password">
					<el-input v-model="ruleForm.password" placeholder="密码" clearable :readonly="ro.password"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="密码"
					prop="password">
					<el-input v-model="ruleForm.password" placeholder="密码" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="姓名" prop="guidename">
					<el-input v-model="ruleForm.guidename" placeholder="姓名" clearable :readonly="ro.guidename"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="姓名"
					prop="guidename">
					<el-input v-model="ruleForm.guidename" placeholder="姓名" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="手机" prop="phone">
					<el-input v-model="ruleForm.phone" placeholder="手机" clearable :readonly="ro.phone"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="手机"
					prop="phone">
					<el-input v-model="ruleForm.phone" placeholder="手机" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="身份证" prop="idcard">
					<el-input v-model="ruleForm.idcard" placeholder="身份证" clearable :readonly="ro.idcard"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="身份证"
					prop="idcard">
					<el-input v-model="ruleForm.idcard" placeholder="身份证" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="upload"
					v-if="type != 'info' && !ro.avatar" label="头像" prop="avatar">
					<file-upload tip="点击上传头像" action="file/upload" :limit="3" :multiple="true"
						:fileUrls="ruleForm.avatar ? ruleForm.avatar : ''" @change="avatarUploadChange"></file-upload>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="upload" v-else-if="ruleForm.avatar"
					label="头像" prop="avatar">
					<img v-if="ruleForm.avatar.substring(0, 4) == 'http'" class="upload-img" style="margin-right:20px;"
						v-bind:key="index" :src="ruleForm.avatar.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index"
						v-for="(item, index) in ruleForm.avatar.split(',')" :src="$base.url + item" width="100" height="100">
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="资质" prop="qualification">
					<el-input v-model="ruleForm.qualification" placeholder="资质" clearable
						:readonly="ro.qualification"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="资质"
					prop="qualification">
					<el-input v-model="ruleForm.qualification" placeholder="资质" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="擅长" prop="specialties">
					<el-input v-model="ruleForm.specialties" placeholder="擅长" clearable
						:readonly="ro.specialties"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="擅长"
					prop="specialties">
					<el-input v-model="ruleForm.specialties" placeholder="擅长" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="input" v-if="type != 'info'"
					label="价格/天" prop="price">
					<el-input v-model="ruleForm.price" placeholder="价格/天" clearable :readonly="ro.price"></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="价格/天"
					prop="price">
					<el-input v-model="ruleForm.price" placeholder="价格/天" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' class="select" v-if="type != 'info'"
					label="审核状态" prop="status">
					<el-select :disabled="ro.status" v-model="ruleForm.status" placeholder="请选择审核状态">
						<el-option v-for="(item, index) in statusOptions" v-bind:key="index" :label="item" :value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{ "width": "100%", "margin": "0 0 20px 0" }' v-else class="input" label="审核状态"
					prop="status">
					<el-input v-model="ruleForm.status" placeholder="审核状态" readonly></el-input>
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
					:style='{ "border": "0px solid rgba(64, 158, 255, 1)", "cursor": "pointer", "padding": "0", "margin": "0", "outline": "none", "color": "#fff", "borderRadius": "0", "background": "#BAD399", "width": "128px", "lineHeight": "40px", "fontSize": "14px", "height": "40px" }'
					v-if="type == 'info'" class="btn-close" @click="back()">返回</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>
<script>
import { isNumber, isIntNumer, isEmail, isPhone, isMobile, isURL, checkIdCard } from "@/utils/validate";
export default {
	data() {
		var validateIdCard = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!checkIdCard(value)) {
				callback(new Error("请输入正确的身份证号码"));
			} else {
				callback();
			}
		};
		var validateMobile = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!isMobile(value)) {
				callback(new Error("请输入正确的手机号码"));
			} else {
				callback();
			}
		};
		var validateNumber = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!isNumber(value)) {
				callback(new Error("请输入数字"));
			} else {
				callback();
			}
		};
		return {
			id: '',
			type: '',
			ro: {
				guideusername: false,
				password: false,
				guidename: false,
				phone: false,
				idcard: false,
				avatar: false,
				qualification: false,
				specialties: false,
				price: false,
				status: false,
			},
			ruleForm: {
				guideusername: '',
				password: '',
				guidename: '',
				phone: '',
				idcard: '',
				avatar: '',
				qualification: '',
				specialties: '',
				price: '',
				status: '待审核'
			},
			statusOptions: ["待审核", "通过", "拒绝"],
			rules: {
				guideusername: [{ required: true, message: '账号不能为空', trigger: 'blur' }],
				password: [{ required: true, message: '密码不能为空', trigger: 'blur' }],
				guidename: [{ required: true, message: '姓名不能为空', trigger: 'blur' }],
				phone: [{ validator: validateMobile, trigger: 'blur' }],
				idcard: [{ validator: validateIdCard, trigger: 'blur' }],
				price: [{ validator: validateNumber, trigger: 'blur' }],
			}
		};
	},
	props: ["parent"],
	methods: {
		init(id, type) {
			this.id = id;
			this.type = type;
			if (this.type === 'info') {
				this.ro.guideusername = true;
				this.ro.password = true;
				this.ro.guidename = true;
				this.ro.phone = true;
				this.ro.idcard = true;
				this.ro.avatar = true;
				this.ro.qualification = true;
				this.ro.specialties = true;
				this.ro.price = true;
				this.ro.status = true;
			}
			if (this.id) {
				this.$http({
					url: `guide/info/${this.id}`,
					method: 'get'
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.ruleForm = data.data
					}
				})
			}
		},
		avatarUploadChange(fileUrls) {
			this.ruleForm.avatar = fileUrls;
		},
		onSubmit() {
			this.$refs["ruleForm"].validate(valid => {
				if (!valid) return;
				this.$http({
					url: `guide/${!this.ruleForm.id ? 'save' : 'update'}`,
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
