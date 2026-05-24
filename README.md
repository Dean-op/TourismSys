# 🌟 桂林漓江旅游推荐与管理系统 (TourismSys)

本系统是一款专为旅游业打造的完整数字平台。项目采用**前后端分离架构**进行高标准开发，并在生产部署时通过 Spring Boot 将前端 Vue 编译包进行了**单体托管**，从而实现了“双端同端口极简运行”的极佳体验。

系统具备三个独立核心角色：**用户端（前台）**、**商家端（发布资源、审批订单与好评看板）**、**系统管理员端（资质审核、全局调度与数据分析）**。

---

## 🛠️ 本机运行环境准备
在正式运行系统前，请确保您的电脑上已安装并配置好以下基础开发工具：
1. **Java 运行环境**：`JDK 1.8`（或更高版本，推荐 1.8）
2. **数据库服务**：`MySQL 5.7` 或 `MySQL 8.0`
3. **集成开发工具**：`IntelliJ IDEA`（推荐，Ultimate 或 Community 版本皆可）
4. **数据库管理工具**：`Navicat`（推荐）或 `SQLyog`
5. **推荐浏览器**：谷歌 `Chrome` 或 微软 `Edge` 浏览器

---

## 🚀 极其详细的启动教程（小白必看步骤）

遵循以下 4 个步骤，保证您能在您的电脑上完美复现所有功能：

### 📌 第一步：创建数据库并导入 SQL 脚本
1. 打开您的数据库管理工具（以 **Navicat** 为例）。
2. 连接上您的本地 MySQL 数据库服务。
3. 在左侧连接上右键，选择 **“新建数据库”**：
   * ⚠️ **数据库名** 必须填入：`boot_tourismrecmngsys`
   * ⚠️ **字符集** 必须选择：`utf8mb4` (防止中文汉字或特殊符号乱码)
   * ⚠️ **排序规则** 必须选择：`utf8mb4_general_ci`
4. 双击打开新建的 `boot_tourismrecmngsys` 数据库（使其图标变成绿色）。
5. 在数据库上右键，选择 **“运行 SQL 文件...”**。
6. 点击文件夹图标，选择本项目源码中对应的数据库备份文件：
   * 路径：`[您的项目根目录]/db/boot_tourismrecmngsys.sql`
7. 点击 **“开始”** 运行，等待下方进度条跑满并提示 `Successfully` 导入成功后，点击关闭。
8. 选中左侧数据库，按下 `F5` 键刷新，此时即可看到所有数据表（如 `hotelinfo`、`merchant` 等）以及丰富的初始旅游数据已完美导入！

---

### 📌 第二步：用 IDEA 打开项目并修改数据库配置
1. 打开 **IntelliJ IDEA** 软件。
2. 选择 **“Open”**（打开），然后导航到本项目的根目录文件夹，点击确定导入项目。
3. 等待右下角 Maven 依赖加载完成（确保电脑网络畅通，项目会自动下载所有相关的 Java 依赖包）。
4. 在左侧项目目录树中，找到并打开配置文件：
   * 路径：`src/main/resources/application.yml`
5. 找到第 13 行起的 `datasource` 数据库配置部分，将其修改为您本机 MySQL 的实际连接信息：
   ```yaml
   spring:
       datasource:
           driverClassName: com.mysql.cj.jdbc.Driver
           # 确保下方数据库名称正确，默认为 boot_tourismrecmngsys
           url: jdbc:mysql://127.0.0.1:3306/boot_tourismrecmngsys?useUnicode=true&characterEncoding=utf-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&useSSL=false&requireSSL=false
           username: root
           password: 123456  # ⚠️ 修改这里！填写您电脑上 MySQL 的 root 账号密码
   ```

---

### 📌 第三步：一键运行后端 Spring Boot 主程序
1. 在 IDEA 左侧的工程目录中，依次展开路径：
   * `src` -> `main` -> `java` -> `com`
2. 找到并双击打开主启动类：`SpringbootSchemaApplication.java`
3. 在代码编辑区域的空白处右键，或者在 `public class SpringbootSchemaApplication` 旁，点击绿色的 **“运行”图标 (Run 'SpringbootSchemaApplication.main()')**。
4. 控制台开始滚动日志，当看到输出漂亮的 `Spring` 图案，并最终打印出类似如下的启动成功日志时：
   `Started SpringbootSchemaApplication in 4.567 seconds (JVM running for 5.123)`
   说明整个后端服务器已在 **`8080` 端口** 成功跑起来了！

---

### 📌 第四步：浏览器访问与登录验证

后端服务启动后，前端页面已经自动处于托管运行状态。请打开您的 Chrome 或 Edge 浏览器，直接输入以下链接进行体验：

#### 📱 A. 旅游系统前台（用户端入口）
* **访问链接**：[http://localhost:8080/tourismrecmngsys/front/dist/index.html](http://localhost:8080/tourismrecmngsys/front/dist/index.html)
* **功能体验**：查阅景点、预订星空酒店、寻找当地导游、在悬崖餐厅点餐、发表真实评论等。
* **内置测试用户**：
  * 账号：`1`
  * 密码：`1`
  * *(注：您也可以直接在页面上点击“注册”按钮自主创建新的普通用户角色)*

#### 🛡️ B. 旅游系统后台管理中心（管理员/商家端入口）
* **访问链接**：[http://localhost:8080/tourismrecmngsys/admin/dist/index.html](http://localhost:8080/tourismrecmngsys/admin/dist/index.html)
* **不同角色的账号与密码**：
  1. **系统最高管理员 (Admin)**：
     * 账号：`admin`
     * 密码：`admin`
     * *（权限：拥有全盘掌控能力，可以对自主入驻的商家资质进行审核，发布公共新闻，全局数据宏观调配等）*
  2. **景区入住商家 (Merchant - 绿野仙踪度假村)**：
     * 账号：`shop1`
     * 密码：`123456`
     * *（权限：拥有高颜值的专属 ECharts 经营看板，可以增删改查自家经营的酒店、景点、餐厅，审批用户预订订单，回复用户对自己资源的评论等）*
  3. **专业当地导游 (Guide)**：
     * 账号：`guide1`
     * 密码：`123456`
     * *（权限：个人导游中心、接收并处理游客的导游预约订单等）*

---

## ⚠️ 核心排错 & 注意事项

### 1. 为什么我打开列表都是问号 `?` 乱码？
如果您在打开网页的列表中看到了很多问号，说明在数据导入环节中发生了 GBK 与 UTF-8 编码冲突。
* **最快解决办法**：
  1. 在 IDEA 中，点击红色方块按钮**关闭当前项目运行**。
  2. 按照【第一步】重新创建一遍 `utf8mb4` 字符集的数据库并导入我们提供的最新 `db/boot_tourismrecmngsys.sql` 文件。
  3. 重新点击绿色图标**启动主程序**。
  4. 回到浏览器网页，按键盘上的 **`Ctrl + F5`** (Mac 用户请按 **`Cmd + Shift + R`**) 进行强制无缓存刷新。问号乱码将瞬间完全消失，全部展现为精美的中文旅游模拟数据！

### 2. 数据库密码错误导致启动失败？
如果启动时控制台抛出 `Access denied for user 'root'@'localhost' (using password: YES)` 错误，请检查 `application.yml` 文件中的 `password:` 字段是否和您本机 MySQL 的真实密码对齐，并确认数据库服务本身已开启。

---

祝您使用愉快！项目架构已全面理顺，是一套极高完成度、可以直接汇报演示的商业级旅游推荐管理系统原型！✨
