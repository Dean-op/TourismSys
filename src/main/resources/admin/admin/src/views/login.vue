<template>
  <div>
    <div class="container">
      <el-form class="login-form">
        <div class="title-container">旅游推荐管理系统</div>
        <div class="subtitle-container">欢迎回来，请登录您的账户</div>

        <!-- 用户名输入框 -->
        <div v-if="loginType==1" class="form-group">
          <label class="form-label">用户名</label>
          <el-input 
            placeholder="请输入用户名" 
            prefix-icon="el-icon-user" 
            v-model="rulesForm.username"
            clearable>
          </el-input>
        </div>

        <!-- 密码输入框 -->
        <div v-if="loginType==1" class="form-group">
          <label class="form-label">密码</label>
          <el-input 
            placeholder="请输入密码" 
            prefix-icon="el-icon-lock" 
            type="password" 
            v-model="rulesForm.password"
            show-password
            clearable>
          </el-input>
        </div>

        <!-- 角色选择 (美化为按钮选项组) -->
        <div class="role-group" v-if="roles.length>1">
          <label class="form-label">登录角色</label>
          <el-radio-group v-model="rulesForm.role" class="role-radios">
            <el-radio-button 
              v-for="item in roles" 
              :key="item.roleName" 
              :label="item.roleName">
              {{item.roleName}}
            </el-radio-button>
          </el-radio-group>
        </div>

        <!-- 登录与注册操作区 -->
        <div class="action-container">
          <el-button 
            v-if="loginType==1" 
            type="primary" 
            @click="login()" 
            class="login-submit-btn">
            登 录
          </el-button>
          <div class="register-entry" v-if="rulesForm.role=='商家'">
            <span @click="register('merchant')">立即注册成为商家 →</span>
          </div>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import menu from "@/utils/menu";
export default {
  data() {
    return {
      baseUrl:this.$base.url,
      loginType: 1,
      rulesForm: {
        username: "",
        password: "",
        role: "",
        code: '',
      },
      menus: [],
      roles: [],
      tableName: "",
      codes: [{
        num: 1,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 2,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 3,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 4,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      }],
    };
  },
  mounted() {
    let menus = menu.list();
    this.menus = menus;

    for (let i = 0; i < this.menus.length; i++) {
      if (this.menus[i].hasBackLogin=='是') {
        this.roles.push(this.menus[i])
      }
    }
  },
  created() {
    this.getRandCode()
  },
  destroyed() {
  },
  methods: {
    // 注册
    register(tableName){
      this.$storage.set("loginTable", tableName);
      this.$storage.set("pageFlag", "register");
      this.$router.push({path:'/register'})
    },
    // 登录
    login() {
      if (!this.rulesForm.username) {
        this.$message.error("请输入用户名");
        return;
      }
      if (!this.rulesForm.password) {
        this.$message.error("请输入密码");
        return;
      }
      if(this.roles.length>1) {
        if (!this.rulesForm.role) {
          this.$message.error("请选择角色");
          return;
        }

        let menus = this.menus;
        for (let i = 0; i < menus.length; i++) {
          if (menus[i].roleName == this.rulesForm.role) {
            this.tableName = menus[i].tableName;
          }
        }
      } else {
        this.tableName = this.roles[0].tableName;
        this.rulesForm.role = this.roles[0].roleName;
      }

      this.$http({
        url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
        method: "post"
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.$storage.set("Token", data.token);
          this.$storage.set("role", this.rulesForm.role);
          this.$storage.set("sessionTable", this.tableName);
          this.$storage.set("adminName", this.rulesForm.username);
          this.$router.replace({ path: "/index/" });
        } else {
          this.$message.error(data.msg);
        }
      });
    },
    getRandCode(len = 4){
      this.randomString(len)
    },
    randomString(len = 4) {
      let chars = [
          "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
          "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
          "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
          "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
          "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
          "3", "4", "5", "6", "7", "8", "9"
      ]
      let colors = ["0", "1", "2","3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
      let sizes = ['14', '15', '16', '17', '18']

      let output = [];
      for (let i = 0; i < len; i++) {
        // 随机验证码
        let key = Math.floor(Math.random()*chars.length)
        this.codes[i].num = chars[key]
        // 随机验证码颜色
        let code = '#'
        for (let j = 0; j < 6; j++) {
          let key = Math.floor(Math.random()*colors.length)
          code += colors[key]
        }
        this.codes[i].color = code
        // 随机验证码方向
        let rotate = Math.floor(Math.random()*60)
        let plus = Math.floor(Math.random()*2)
        if(plus == 1) rotate = '-'+rotate
        this.codes[i].rotate = 'rotate('+rotate+'deg)'
        // 随机验证码字体大小
        let size = Math.floor(Math.random()*sizes.length)
        this.codes[i].size = sizes[size]+'px'
      }
    },
  }
};
</script>

<style lang="scss" scoped>
.container {
  min-height: 100vh;
  position: relative;
  background: url(~@/assets/img/travel_login_bg.png) no-repeat center center / cover;
  display: flex;
  justify-content: flex-end; /* 右侧对齐 */
  align-items: center;
  width: 100vw;
  overflow: hidden;
}

.login-form {
  padding: 60px 45px;
  background: rgba(255, 255, 255, 0.82);
  backdrop-filter: blur(25px);
  -webkit-backdrop-filter: blur(25px);
  width: 480px;
  height: 100vh;
  box-shadow: -15px 0 35px rgba(0, 0, 0, 0.12);
  border-left: 1px solid rgba(255, 255, 255, 0.4);
  display: flex;
  flex-direction: column;
  justify-content: center;
  box-sizing: border-box;

  .title-container {
    margin-bottom: 8px;
    color: #1e293b;
    text-align: center;
    font-size: 28px;
    font-weight: 800;
    letter-spacing: -0.5px;
    background: linear-gradient(135deg, #2c3e50 0%, #000000 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .subtitle-container {
    color: #64748b;
    text-align: center;
    font-size: 14px;
    margin-bottom: 40px;
  }

  .form-group {
    margin-bottom: 24px;
    display: flex;
    flex-direction: column;
    width: 100%;

    .form-label {
      font-size: 13px;
      font-weight: 600;
      color: #475569;
      margin-bottom: 8px;
      letter-spacing: 0.5px;
      text-align: left;
    }

    ::v-deep .el-input__inner {
      border: 1px solid rgba(148, 163, 184, 0.3);
      border-radius: 12px;
      padding: 0 16px 0 40px;
      color: #1e293b;
      background: rgba(255, 255, 255, 0.6);
      font-size: 14px;
      height: 48px;
      line-height: 48px;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);

      &:focus {
        border-color: #BAD399;
        background: #fff;
        box-shadow: 0 0 0 3px rgba(186, 211, 153, 0.25);
      }
    }

    ::v-deep .el-input__prefix {
      left: 12px;
      color: #94a3b8;
      
      .el-input__icon {
        line-height: 48px;
        font-size: 16px;
      }
    }
  }

  .role-group {
    margin-bottom: 30px;
    display: flex;
    flex-direction: column;
    width: 100%;

    .form-label {
      font-size: 13px;
      font-weight: 600;
      color: #475569;
      margin-bottom: 8px;
      letter-spacing: 0.5px;
      text-align: left;
    }

    .role-radios {
      display: flex;
      width: 100%;
      gap: 10px;

      ::v-deep .el-radio-button {
        flex: 1;
        
        .el-radio-button__inner {
          width: 100%;
          border: 1px solid rgba(148, 163, 184, 0.3);
          border-radius: 10px;
          background: rgba(255, 255, 255, 0.6);
          color: #475569;
          font-size: 14px;
          height: 42px;
          line-height: 40px;
          padding: 0;
          text-align: center;
          transition: all 0.3s ease;
          box-shadow: none;

          &:hover {
            color: #BAD399;
            border-color: #BAD399;
          }
        }

        &.is-active {
          .el-radio-button__inner {
            background: #BAD399;
            border-color: #BAD399;
            color: #fff;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(186, 211, 153, 0.3);
          }
        }
        
        &:first-child .el-radio-button__inner {
          border-radius: 10px;
        }
        &:last-child .el-radio-button__inner {
          border-radius: 10px;
        }
      }
    }
  }

  .action-container {
    width: 100%;
    margin-top: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;

    .login-submit-btn {
      width: 100%;
      height: 48px;
      border: 0;
      border-radius: 12px;
      background: linear-gradient(135deg, #bad399 0%, #a4bf82 100%);
      color: #fff;
      font-size: 16px;
      font-weight: 600;
      letter-spacing: 2px;
      box-shadow: 0 4px 15px rgba(186, 211, 153, 0.4);
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);

      &:hover {
        transform: translateY(-1px);
        box-shadow: 0 6px 20px rgba(186, 211, 153, 0.55);
      }

      &:active {
        transform: translateY(1px);
      }
    }

    .register-entry {
      margin-top: 20px;
      width: 100%;
      text-align: center;

      span {
        cursor: pointer;
        color: #7c9d65;
        font-size: 13px;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.3s ease;

        &:hover {
          color: #bad399;
          text-decoration: underline;
        }
      }
    }
  }
}
</style>
