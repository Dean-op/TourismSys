<template>
	<div class="addEdit-block" style="width: 100%">
		<el-form :style="{
			padding: '30px',
			boxShadow: '0 0px 0px rgba(64, 158, 255, .3)',
			margin: '-30px 0 0',
			borderRadius: '0 0 30px 30px',
			flexWrap: 'wrap',
			background: '#F8F6F7',
			display: 'flex',
			width: '100%',
		}" class="add-update-preview" ref="ruleForm" :model="ruleForm" :rules="rules" label-width="120px">
			<template>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="input" v-if="type != 'info'"
					label="酒店名称" prop="hotelname">
					<el-input v-model="ruleForm.hotelname" placeholder="酒店名称" clearable
						:readonly="ro.hotelname"></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else class="input" label="酒店名称"
					prop="hotelname">
					<el-input v-model="ruleForm.hotelname" placeholder="酒店名称" readonly></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="select" v-if="type != 'info'"
					label="酒店类型" prop="hoteltype">
					<el-select v-model="ruleForm.hoteltype" placeholder="酒店类型" clearable :readonly="ro.hoteltype">
						<el-option v-for="item in hoteltypeList" :key="item.indexName" :label="item.indexName"
							:value="item.indexName"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else class="input" label="酒店类型"
					prop="hoteltype">
					<el-input v-model="ruleForm.hoteltype" placeholder="酒店类型" readonly></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="input" v-if="type != 'info'"
					label="酒店地址" prop="address">
					<el-input v-model="ruleForm.address" placeholder="酒店地址" clearable :readonly="ro.address"></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else class="input" label="酒店地址"
					prop="address">
					<el-input v-model="ruleForm.address" placeholder="酒店地址" readonly></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="select" v-if="type != 'info'"
					label="房间类型" prop="roomtype">
					<el-select v-model="ruleForm.roomtype" placeholder="房间类型" clearable :readonly="ro.roomtype">
						<el-option v-for="item in roomtypeList" :key="item.indexName" :label="item.indexName"
							:value="item.indexName"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else class="input" label="房间类型"
					prop="roomtype">
					<el-input v-model="ruleForm.roomtype" placeholder="房间类型" readonly></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="input" v-if="type != 'info'"
					label="预约价格" prop="price">
					<el-input v-model="ruleForm.price" placeholder="预约价格" clearable :readonly="ro.price"></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else class="input" label="预约价格"
					prop="price">
					<el-input v-model="ruleForm.price" placeholder="预约价格" readonly></el-input>
				</el-form-item>

				<!-- 商家账号 -->
				<el-form-item :style="{
					width: '45%',
					margin: '0 2% 20px 0',
					display: 'inline-block',
				}" class="input" v-if="type != 'info'" label="商家账号" prop="merchantusername">
					<el-input v-model="ruleForm.merchantusername" placeholder="商家账号" clearable
						:readonly="ro.merchantusername || isFromSelect"></el-input>
				</el-form-item>
				<el-form-item :style="{
					width: '45%',
					margin: '0 2% 20px 0',
					display: 'inline-block',
				}" v-else class="input" label="商家账号" prop="merchantusername">
					<el-input v-model="ruleForm.merchantusername" placeholder="商家账号" readonly></el-input>
				</el-form-item>

				<!-- 商家名称改为下拉框 -->
				<el-form-item :style="{
					width: '45%',
					margin: '0 2% 20px 0',
					display: 'inline-block',
				}" class="input" v-if="type != 'info'" label="商家名称" prop="merchantname">
					<el-select v-model="ruleForm.merchantname" placeholder="请选择商家" clearable :disabled="ro.merchantname"
						@change="handleMerchantChange" filterable>
						<el-option v-for="merchant in merchantList" :key="merchant.id" :label="merchant.merchantname"
							:value="merchant.merchantname"></el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style="{
					width: '45%',
					margin: '0 2% 20px 0',
					display: 'inline-block',
				}" v-else class="input" label="商家名称" prop="merchantname">
					<el-input v-model="ruleForm.merchantname" placeholder="商家名称" readonly></el-input>
				</el-form-item>

				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="input" v-if="type != 'info'"
					label="联系电话" prop="telephone">
					<el-input v-model="ruleForm.telephone" placeholder="联系电话" clearable
						:readonly="ro.telephone"></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else class="input" label="联系电话"
					prop="telephone">
					<el-input v-model="ruleForm.telephone" placeholder="联系电话" readonly></el-input>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="upload"
					v-if="type != 'info' && !ro.hotelphoto" label="酒店图片" prop="hotelphoto">
					<file-upload tip="点击上传酒店图片" action="file/upload" :limit="3" :multiple="true"
						:fileUrls="ruleForm.hotelphoto ? ruleForm.hotelphoto : ''"
						@change="hotelphotoUploadChange"></file-upload>
				</el-form-item>
				<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="upload"
					v-else-if="ruleForm.hotelphoto" label="酒店图片" prop="hotelphoto">
					<img v-if="ruleForm.hotelphoto.substring(0, 4) == 'http'" class="upload-img"
						style="margin-right: 20px" v-bind:key="index" :src="ruleForm.hotelphoto.split(',')[0]"
						width="100" height="100" />
					<img v-else class="upload-img" style="margin-right: 20px" v-bind:key="index"
						v-for="(item, index) in ruleForm.hotelphoto.split(',')" :src="$base.url + item" width="100"
						height="100" />
				</el-form-item>
			</template>
			<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" class="textarea" v-if="type != 'info'"
				label="简介" prop="content">
				<el-input style="min-width: 200px; max-width: 600px" type="textarea" :rows="8" placeholder="简介"
					v-model="ruleForm.content">
				</el-input>
			</el-form-item>
			<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else-if="ruleForm.content" label="简介"
				prop="content">
				<span :style="{
					fontSize: '14px',
					lineHeight: '40px',
					color: '#000',
					fontWeight: '500',
					display: 'inline-block',
				}">{{ ruleForm.content }}</span>
			</el-form-item>
			<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-if="type != 'info'" label="酒店介绍"
				prop="introduce">
				<editor style="min-width: 200px; max-width: 600px" v-model="ruleForm.introduce" class="editor"
					action="file/upload">
				</editor>
			</el-form-item>
			<el-form-item :style="{ width: '100%', margin: '0 0 20px 0' }" v-else-if="ruleForm.introduce" label="酒店介绍"
				prop="introduce">
				<span :style="{
					fontSize: '14px',
					lineHeight: '40px',
					color: '#000',
					fontWeight: '500',
					display: 'inline-block',
				}" v-html="ruleForm.introduce"></span>
			</el-form-item>
			<el-form-item :style="{ width: '100%', padding: '0', margin: '0' }" class="btn">
				<el-button :style="{
					border: '0',
					cursor: 'pointer',
					padding: '0',
					margin: '0 20px 0 0',
					outline: 'none',
					color: 'rgba(255, 255, 255, 1)',
					borderRadius: '0',
					background: '#BAD399',
					width: '128px',
					lineHeight: '40px',
					fontSize: '14px',
					height: '40px',
				}" v-if="type != 'info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
				<el-button :style="{
					border: '0px solid rgba(64, 158, 255, 1)',
					cursor: 'pointer',
					padding: '0',
					margin: '0',
					outline: 'none',
					color: '#fff',
					borderRadius: '0',
					background: '#BAD399',
					width: '128px',
					lineHeight: '40px',
					fontSize: '14px',
					height: '40px',
				}" v-if="type != 'info'" class="btn-close" @click="back()">取消</el-button>
				<el-button :style="{
					border: '0px solid rgba(64, 158, 255, 1)',
					cursor: 'pointer',
					padding: '0',
					margin: '0',
					outline: 'none',
					color: '#fff',
					borderRadius: '0',
					background: '#BAD399',
					width: '128px',
					lineHeight: '40px',
					fontSize: '14px',
					height: '40px',
				}" v-if="type == 'info'" class="btn-close" @click="back()">返回</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>
<script>
// 数字，邮件，手机，url，身份证校验
import {
	isNumber,
	isIntNumer,
	isEmail,
	isPhone,
	isMobile,
	isURL,
	checkIdCard,
} from "@/utils/validate";
export default {
	data() {
		let self = this;
		var validateIdCard = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!checkIdCard(value)) {
				callback(new Error("请输入正确的身份证号码"));
			} else {
				callback();
			}
		};
		var validateUrl = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!isURL(value)) {
				callback(new Error("请输入正确的URL地址"));
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
		var validatePhone = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!isPhone(value)) {
				callback(new Error("请输入正确的电话号码"));
			} else {
				callback();
			}
		};
		var validateEmail = (rule, value, callback) => {
			if (!value) {
				callback();
			} else if (!isEmail(value)) {
				callback(new Error("请输入正确的邮箱地址"));
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
			id: "",
			type: "",

			ro: {
				hotelname: false,
				hoteltype: false,
				address: false,
				roomtype: false,
				price: false,
				telephone: false,
				introduce: false,
				hotelphoto: false,
				thumbsupnum: false,
				crazilynum: false,
				clicktime: false,
				clicknum: false,
				merchantusername: false,
				merchantname: false,
				content: false,
			},

			ruleForm: {
				hotelname: "",
				hoteltype: "",
				address: "",
				roomtype: "",
				price: "",
				telephone: "",
				introduce: "",
				hotelphoto: "",
				clicktime: "",
				clicknum: "",
				merchantusername: "",
				merchantname: "",
				content: "",
			},

			hoteltypeOptions: [],
			roomtypeOptions: [],
			merchantList: [],
			isFromSelect: false,

			rules: {
				hotelname: [
					{ required: true, message: "酒店名称不能为空", trigger: "blur" },
				],
				hoteltype: [
					{ required: true, message: "酒店类型不能为空", trigger: "blur" },
				],
				address: [],
				roomtype: [],
				price: [{ validator: validateNumber, trigger: "blur" }],
				telephone: [],
				introduce: [],
				hotelphoto: [],
				thumbsupnum: [{ validator: validateIntNumber, trigger: "blur" }],
				crazilynum: [{ validator: validateIntNumber, trigger: "blur" }],
				clicktime: [],
				clicknum: [{ validator: validateIntNumber, trigger: "blur" }],
				merchantusername: [],
				merchantname: [],
				content: [],
			},
		};
	},
	props: ["parent"],
	computed: {},
	created() { },
	methods: {
		// 下载
		download(file) {
			window.open(`${file}`);
		},
		// 初始化
		init(id, type) {
			if (id) {
				this.id = id;
				this.type = type;
			}
			if (this.type == "info" || this.type == "else") {
				this.info(id);
			} else if (this.type == "logistics") {
				this.logistics = false;
				this.info(id);
			} else if (this.type == "cross") {
				var obj = this.$storage.getObj("crossObj");
				for (var o in obj) {
					if (o == "hotelname") {
						this.ruleForm.hotelname = obj[o];
						this.ro.hotelname = true;
						continue;
					}
					if (o == "hoteltype") {
						this.ruleForm.hoteltype = obj[o];
						this.ro.hoteltype = true;
						continue;
					}
					if (o == "address") {
						this.ruleForm.address = obj[o];
						this.ro.address = true;
						continue;
					}
					if (o == "roomtype") {
						this.ruleForm.roomtype = obj[o];
						this.ro.roomtype = true;
						continue;
					}
					if (o == "price") {
						this.ruleForm.price = obj[o];
						this.ro.price = true;
						continue;
					}
					if (o == "telephone") {
						this.ruleForm.telephone = obj[o];
						this.ro.telephone = true;
						continue;
					}
					if (o == "introduce") {
						this.ruleForm.introduce = obj[o];
						this.ro.introduce = true;
						continue;
					}
					if (o == "hotelphoto") {
						this.ruleForm.hotelphoto = obj[o];
						this.ro.hotelphoto = true;
						continue;
					}
					if (o == "thumbsupnum") {
						this.ruleForm.thumbsupnum = obj[o];
						this.ro.thumbsupnum = true;
						continue;
					}
					if (o == "crazilynum") {
						this.ruleForm.crazilynum = obj[o];
						this.ro.crazilynum = true;
						continue;
					}
					if (o == "clicktime") {
						this.ruleForm.clicktime = obj[o];
						this.ro.clicktime = true;
						continue;
					}
					if (o == "clicknum") {
						this.ruleForm.clicknum = obj[o];
						this.ro.clicknum = true;
						continue;
					}
					if (o == "merchantusername") {
						this.ruleForm.merchantusername = obj[o];
						this.ro.merchantusername = true;
						continue;
					}
					if (o == "merchantname") {
						this.ruleForm.merchantname = obj[o];
						this.ro.merchantname = true;
						continue;
					}
					if (o == "content") {
						this.ruleForm.content = obj[o];
						this.ro.content = true;
						continue;
					}
				}
			}
			this.$http({
				url: "merchant/page",
				method: "get",
				params: {
					page: 1,
					limit: 1000, // 适当设置较大的数量，确保获取所有商家
				},
			})
				.then(({ data }) => {
					if (data && data.code === 0) {
						this.merchantList = data.data.list || [];
					} else {
						this.$message.error(data.msg || "获取商家列表失败");
					}
				})
				.catch((err) => {
					console.error("获取商家列表出错:", err);
					this.$message.error("获取商家列表失败");
				});

			// 获取用户信息
			this.$http({
				url: `${this.$storage.get("sessionTable")}/session`,
				method: "get",
			}).then(({ data }) => {
				if (data && data.code === 0) {
					var json = data.data;
					if(this.$storage.get("sessionTable") == "merchant") {
						this.ruleForm.merchantusername = json.merchantusername;
						this.ruleForm.merchantname = json.merchantname;
						this.ro.merchantusername = true;
						this.ro.merchantname = true;
					}
				} else {
					this.$message.error(data.msg);
				}
			});
			this.$http({
				url: "dictionary/page",
				method: "get",
				params: {
					dicCode: "hoteltype",
					page: 1,
					limit: 1000, // 适当设置较大的数量，确保获取所有商家
				},
			})
				.then(({ data }) => {
					if (data && data.code === 0) {
						this.hoteltypeList = data.data.list || [];
					} else {
						this.$message.error(data.msg || "获取酒店类型列表失败");
					}
				})
				.catch((err) => {
					console.error("获取酒店类型列表出错:", err);
					this.$message.error("获取酒店类型列表失败");
				});
			this.$http({
				url: "dictionary/page",
				method: "get",
				params: {
					dicCode: "roomtype",
					page: 1,
					limit: 1000, // 适当设置较大的数量，确保获取所有商家
				},
			})
				.then(({ data }) => {
					if (data && data.code === 0) {
						this.roomtypeList = data.data.list || [];
					} else {
						this.$message.error(data.msg || "获取房间类型列表失败");
					}
				})
				.catch((err) => {
					console.error("获取房间类型列表出错:", err);
					this.$message.error("获取房间类型列表失败");
				});
		},
		// 多级联动参数
		handleMerchantChange(merchantname) {
			if (!merchantname) {
				// 如果清空选择，重置相关字段和标记
				this.isFromSelect = false;
				return;
			}

			// 查找选中的商家信息
			const selectedMerchant = this.merchantList.find(
				(item) => item.merchantname === merchantname
			);

			if (selectedMerchant) {
				// 同步更新其他字段
				this.ruleForm.merchantusername = selectedMerchant.merchantusername;
				this.ruleForm.merchantaddress = selectedMerchant.merchantaddress;
				// this.ruleForm.phonenumber = selectedMerchant.phonenumber;

				// 标记为从下拉框选择，设置相关字段为只读
				this.isFromSelect = true;
			}
		},
		info(id) {
			this.$http({
				url: `hotelinfo/info/${id}`,
				method: "get",
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.ruleForm = data.data;
					//解决前台上传图片后台不显示的问题
					let reg = new RegExp("../../../upload", "g"); //g代表全部
					this.ruleForm.introduce = this.ruleForm.introduce.replace(
						reg,
						"../../../tourismrecmngsys/upload"
					);
				} else {
					this.$message.error(data.msg);
				}
			});
		},

		// 提交
		onSubmit() {
			if (this.ruleForm.hotelphoto != null) {
				this.ruleForm.hotelphoto = this.ruleForm.hotelphoto.replace(
					new RegExp(this.$base.url, "g"),
					""
				);
			}

			var objcross = this.$storage.getObj("crossObj");

			//更新跨表属性
			var crossuserid;
			var crossrefid;
			var crossoptnum;
			if (this.type == "cross") {
				var statusColumnName = this.$storage.get("statusColumnName");
				var statusColumnValue = this.$storage.get("statusColumnValue");
				if (statusColumnName != "") {
					var obj = this.$storage.getObj("crossObj");
					if (statusColumnName && !statusColumnName.startsWith("[")) {
						for (var o in obj) {
							if (o == statusColumnName) {
								obj[o] = statusColumnValue;
							}
						}
						var table = this.$storage.get("crossTable");
						this.$http({
							url: `${table}/update`,
							method: "post",
							data: obj,
						}).then(({ data }) => { });
					} else {
						crossuserid = this.$storage.get("userid");
						crossrefid = obj["id"];
						crossoptnum = this.$storage.get("statusColumnName");
						crossoptnum = crossoptnum.replace(/\[/, "").replace(/\]/, "");
					}
				}
			}
			this.$refs["ruleForm"].validate((valid) => {
				if (valid) {
					if (crossrefid && crossuserid) {
						this.ruleForm.crossuserid = crossuserid;
						this.ruleForm.crossrefid = crossrefid;
						let params = {
							page: 1,
							limit: 10,
							crossuserid: this.ruleForm.crossuserid,
							crossrefid: this.ruleForm.crossrefid,
						};
						this.$http({
							url: "hotelinfo/page",
							method: "get",
							params: params,
						}).then(({ data }) => {
							if (data && data.code === 0) {
								if (data.data.total >= crossoptnum) {
									this.$message.error(this.$storage.get("tips"));
									return false;
								} else {
									this.$http({
										url: `hotelinfo/${!this.ruleForm.id ? "save" : "update"}`,
										method: "post",
										data: this.ruleForm,
									}).then(({ data }) => {
										if (data && data.code === 0) {
											this.$message({
												message: "操作成功",
												type: "success",
												duration: 1500,
												onClose: () => {
													this.parent.showFlag = true;
													this.parent.addOrUpdateFlag = false;
													this.parent.hotelinfoCrossAddOrUpdateFlag = false;
													this.parent.search();
													this.parent.contentStyleChange();
												},
											});
										} else {
											this.$message.error(data.msg);
										}
									});
								}
							} else {
							}
						});
					} else {
						this.$http({
							url: `hotelinfo/${!this.ruleForm.id ? "save" : "update"}`,
							method: "post",
							data: this.ruleForm,
						}).then(({ data }) => {
							if (data && data.code === 0) {
								this.$message({
									message: "操作成功",
									type: "success",
									duration: 1500,
									onClose: () => {
										this.parent.showFlag = true;
										this.parent.addOrUpdateFlag = false;
										this.parent.hotelinfoCrossAddOrUpdateFlag = false;
										this.parent.search();
										this.parent.contentStyleChange();
									},
								});
							} else {
								this.$message.error(data.msg);
							}
						});
					}
				}
			});
		},
		// 获取uuid
		getUUID() {
			return new Date().getTime();
		},
		// 返回
		back() {
			this.parent.showFlag = true;
			this.parent.addOrUpdateFlag = false;
			this.parent.hotelinfoCrossAddOrUpdateFlag = false;
			this.parent.contentStyleChange();
		},
		hotelphotoUploadChange(fileUrls) {
			this.ruleForm.hotelphoto = fileUrls;
		},
	},
};
</script>
<style lang="scss" scoped>
.amap-wrapper {
	width: 100%;
	height: 500px;
}

.search-box {
	position: absolute;
}

.el-date-editor.el-input {
	width: auto;
}

.add-update-preview .el-form-item ::v-deep .el-form-item__label {
	padding: 0 10px 0 0;
	color: #666;
	font-weight: 500;
	width: 120px;
	font-size: 14px;
	line-height: 40px;
	text-align: center;
}

.add-update-preview .el-form-item ::v-deep .el-form-item__content {
	margin-left: 120px;
}

.add-update-preview .el-input ::v-deep .el-input__inner {
	border: 2px solid #797979;
	border-radius: 0;
	padding: 0 12px;
	box-shadow: 0 0 0px rgba(64, 158, 255, 0.5);
	outline: none;
	color: #000;
	width: 400px;
	font-size: 14px;
	height: 40px;
}

.add-update-preview .el-select ::v-deep .el-input__inner {
	border: 2px solid #797979;
	border-radius: 0;
	padding: 0 10px;
	box-shadow: 0 0 0px rgba(64, 158, 255, 0.5);
	outline: none;
	color: #000;
	width: 300px;
	font-size: 14px;
	height: 40px;
}

.add-update-preview .el-date-editor ::v-deep .el-input__inner {
	border: 2px solid #797979;
	border-radius: 0;
	padding: 0 10px 0 30px;
	box-shadow: 0 0 0px rgba(64, 158, 255, 0.5);
	outline: none;
	color: #000;
	width: 300px;
	font-size: 14px;
	height: 40px;
}

.add-update-preview ::v-deep .el-upload--picture-card {
	background: transparent;
	border: 0;
	border-radius: 0;
	width: auto;
	height: auto;
	line-height: initial;
	vertical-align: middle;
}

.add-update-preview ::v-deep .upload .upload-img {
	border: 2px solid #797979;
	cursor: pointer;
	border-radius: 6px;
	color: #797979;
	width: 90px;
	font-size: 32px;
	line-height: 90px;
	text-align: center;
	height: 90px;
}

.add-update-preview ::v-deep .el-upload-list .el-upload-list__item {
	border: 2px solid #797979;
	cursor: pointer;
	border-radius: 6px;
	color: #797979;
	width: 90px;
	font-size: 32px;
	line-height: 90px;
	text-align: center;
	height: 90px;
}

.add-update-preview ::v-deep .el-upload .el-icon-plus {
	border: 2px solid #797979;
	cursor: pointer;
	border-radius: 6px;
	color: #797979;
	width: 90px;
	font-size: 32px;
	line-height: 90px;
	text-align: center;
	height: 90px;
}

.add-update-preview .el-textarea ::v-deep .el-textarea__inner {
	border: 2px solid #797979;
	border-radius: 0;
	padding: 12px;
	box-shadow: 0 0 0px rgba(64, 158, 255, 0.5);
	outline: none;
	color: #000;
	width: 400px;
	font-size: 14px;
	height: 120px;
}
</style>
