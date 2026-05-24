-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: boot_tourismrecmngsys
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '管理员' COMMENT '角色',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `gender` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin','管理员','系统管理员','男','13800000000','admin@tourism.com',NULL,'2025-12-09 10:32:16');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `adminid` bigint DEFAULT NULL COMMENT '管理员id',
  `ask` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '提问',
  `reply` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '回复',
  `isreply` int DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779183752670 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='在线客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1779116263952,'2026-05-18 14:57:44',1678358276062,1,'你好','您好！我是旅游推荐客服，若您有目的地、预算、偏好（如自然风光/人文历史）等需求，可随时告知，我会快速为您推荐合适的旅游方案~',1),(1779160868574,'2026-05-19 03:21:08',1678358276062,1,'我在济南玩两天，预算只有500，帮我规划路线','第一天：趵突泉（40元）→大明湖（免费）→曲水亭街（免费），吃油旋甜沫；第二天：千佛山（30元）→黑虎泉（免费）→宽厚里（平价小吃）。住经济型酒店（约200元），公交出行，总预算500内。',1),(1779182063304,'2026-05-19 09:14:23',1678358276062,1,'帮我找一个在烟台的旅游路线','烟台3日路线：D1游蓬莱阁（仙境文化地标）；D2烟台山（历史建筑+无敌海景）+滨海路漫步；D3养马岛骑行环岛（海岛风光）。兼顾自然与人文，轻松惬意。',1),(1779183752669,'2026-05-19 09:42:32',1678358276062,1,'帮我推荐一下济南的美食','济南必尝美食：油旋外酥内软带葱香；糖醋鲤鱼酸甜酥脆造型别致；把子肉肥而不腻配米饭绝搭；甜沫咸香暖胃是早餐标配。这些本地特色，值得一试。',1);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '配置参数值',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置项备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg','首页轮播图1'),(2,'picture2','upload/picture2.jpg','首页轮播图2'),(3,'picture3','upload/picture3.jpg','首页轮播图3');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '编码名字',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'traveltype','旅游类型',1,'泉水文化',NULL,NULL,NULL),(2,'traveltype','旅游类型',2,'历史古迹',NULL,NULL,NULL),(3,'traveltype','旅游类型',3,'自然风光',NULL,NULL,NULL),(4,'traveltype','旅游类型',4,'休闲购物',NULL,NULL,NULL),(5,'traveltype','旅游类型',5,'红色教育',NULL,NULL,NULL),(6,'roomtype','房间类型',1,'大床房',NULL,NULL,NULL),(7,'roomtype','房间类型',2,'双人间',NULL,NULL,NULL),(8,'roomtype','房间类型',3,'豪华套房',NULL,NULL,NULL),(9,'roomtype','房间类型',4,'商务房',NULL,NULL,NULL),(10,'roomtype','房间类型',5,'亲子房',NULL,NULL,NULL),(11,'hoteltype','酒店类型',1,'星级酒店',NULL,NULL,NULL),(12,'hoteltype','酒店类型',2,'精品民宿',NULL,NULL,NULL),(13,'hoteltype','酒店类型',3,'商务酒店',NULL,NULL,NULL),(14,'hoteltype','酒店类型',4,'快捷酒店',NULL,NULL,NULL),(15,'hoteltype','酒店类型',5,'青年旅舍',NULL,NULL,NULL),(16,'traveltype','旅游类型',6,'亲子研学',NULL,NULL,NULL),(17,'traveltype','旅游类型',7,'康养休闲',NULL,NULL,NULL),(18,'traveltype','旅游类型',8,'都市漫步',NULL,NULL,NULL),(19,'traveltype','旅游类型',9,'美食品鉴',NULL,NULL,NULL),(20,'traveltype','旅游类型',10,'艺术体验',NULL,NULL,NULL),(21,'traffictype','路线类型',1,'公交出行',NULL,NULL,NULL),(22,'traffictype','路线类型',2,'地铁线路',NULL,NULL,NULL),(23,'traffictype','路线类型',3,'打车/租车',NULL,NULL,NULL),(24,'traffictype','路线类型',4,'骑行/步行',NULL,NULL,NULL),(25,'traffictype','路线类型',5,'景区接驳车',NULL,NULL,NULL),(26,'hoteltype','酒店类型',6,'商务酒店',NULL,NULL,NULL),(27,'hoteltype','酒店类型',7,'特色度假酒店',NULL,NULL,NULL),(28,'hoteltype','酒店类型',8,'连锁酒店',NULL,NULL,NULL),(29,'roomtype','房间类型',6,'标准大床房',NULL,NULL,NULL),(30,'traffictype','路线类型',6,'景区公交',NULL,NULL,NULL),(31,'traffictype','路线类型',7,'自驾',NULL,NULL,NULL);
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusshotelinfo`
--

DROP TABLE IF EXISTS `discusshotelinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discusshotelinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint DEFAULT NULL COMMENT '关联表id',
  `userid` bigint DEFAULT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779616312699 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='酒店评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusshotelinfo`
--

LOCK TABLES `discusshotelinfo` WRITE;
/*!40000 ALTER TABLE `discusshotelinfo` DISABLE KEYS */;
INSERT INTO `discusshotelinfo` VALUES (101,'2025-12-09 18:32:15',41,11,'upload/users1.jpg','账号1','桂林漓江大瀑布饭店位置超棒，正对象鼻山，晚上的瀑布秀很震撼，早餐的桂林米粉正宗！','感谢您的好评，期待您再次光临漓江畔！'),(102,'2025-12-09 18:32:15',42,12,'upload/users2.jpg','账号2','阳朔西街陌上美宿设计感十足，步行到西街仅5分钟，露台能看漓江支流，管家服务贴心。','很高兴您喜欢我们的民宿，阳朔欢迎您！'),(103,'2025-12-09 18:32:15',43,13,'upload/users3.jpg','账号3','北海银滩皇冠假日酒店私家沙滩超赞，亲子设施齐全，孩子玩得不想走，海鲜自助餐新鲜。','感谢您和家人的喜爱，银滩的阳光永远为您守候！'),(104,'2025-12-09 18:32:15',44,14,'upload/users4.jpg','账号4','崇左德天老木棉度假酒店推窗见瀑布，民族风格装修很有特色，晚上的篝火晚会热闹。','能在德天瀑布旁为您服务是我们的荣幸！'),(105,'2025-12-09 18:32:15',45,15,'upload/users5.jpg','账号5','涠洲岛珊瑚酒店就在火山口景区旁，独栋木屋私密性好，酒店接送码头很方便。','感谢您对涠洲岛的喜爱，珊瑚酒店伴您看海！'),(106,'2025-12-09 18:32:15',46,16,'upload/users6.jpg','账号6','南宁荔园山庄环境清幽，园林景观超美，离青秀山很近，早餐的老友粉很地道。','很高兴您在南宁有舒适的体验！'),(107,'2025-12-09 18:32:15',47,17,'upload/users7.jpg','账号7','柳州丽笙酒店在柳江边，夜景无敌，房间智能设备齐全，楼下就是五星街美食。','感谢您的认可，柳州的夜景确实迷人！'),(108,'2025-12-09 18:32:15',48,18,'upload/users8.jpg','账号8','桂林阳朔悦榕庄隐于山水间，私人泳池别墅超赞，SPA用的是本地精油，太放松了。','阳朔的山水与悦榕庄的服务，期待与您再会！'),(109,'2025-12-11 02:15:30',49,19,'upload/users9.jpg','账号9','三江程阳八寨民宿木质结构很有侗族特色，房东会唱侗族大歌，早餐的油茶很香。','侗族的热情永远为您敞开！'),(1779116653003,'2026-05-18 15:04:12',51,1,'',NULL,'666',NULL),(1779616312698,'2026-05-24 09:51:51',51,11,'upload/users1.jpg','账号1','测试',NULL);
/*!40000 ALTER TABLE `discusshotelinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussrestaurantinfo`
--

DROP TABLE IF EXISTS `discussrestaurantinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussrestaurantinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint DEFAULT NULL COMMENT '关联表id',
  `userid` bigint DEFAULT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='餐厅预订评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussrestaurantinfo`
--

LOCK TABLES `discussrestaurantinfo` WRITE;
/*!40000 ALTER TABLE `discussrestaurantinfo` DISABLE KEYS */;
INSERT INTO `discussrestaurantinfo` VALUES (101,'2025-12-09 18:32:15',71,11,'upload/users1.jpg','账号1','桂林椿记烧鹅预订很方便，到店直接入座，烧鹅皮脆肉嫩，荔浦芋头扣肉必点！','感谢您对椿记烧鹅的喜爱，桂林美食等您再来！'),(102,'2025-12-09 18:32:15',72,12,'upload/users2.jpg','账号2','南宁复记老友粉中山路店预订后不用排队，老友粉酸辣开胃，加个煎蛋更绝。','复记老友粉的味道，就是南宁的味道！'),(103,'2025-12-09 18:32:15',73,13,'upload/users3.jpg','账号3','柳州爱民螺蛳粉五星街店预订系统响应快，螺蛳粉汤头鲜辣，腐竹炸得酥脆。','爱民螺蛳粉，柳州人的早餐选择！'),(104,'2025-12-09 18:32:15',74,14,'upload/users4.jpg','账号4','北海外沙疍家棚海鲜排档预订的海景位超棒，清蒸老虎斑新鲜，椒盐皮皮虾入味。','外沙的海鲜，北海的味道！'),(105,'2025-12-09 18:32:15',75,15,'upload/users5.jpg','账号5','阳朔大师傅金奖啤酒鱼西街店提前预订免等位，啤酒鱼选剑骨鱼没刺，配菜入味。','阳朔啤酒鱼，大师傅更专业！'),(106,'2025-12-09 18:32:15',76,16,'upload/users6.jpg','账号6','崇左壮家宴预订的包厢有民族装饰，柠檬鸭酸辣开胃，五色糯米饭颜值高味道好。','民族美食，舌尖上的崇左！'),(107,'2025-12-09 18:32:15',77,17,'upload/users7.jpg','账号7','梧州纸包鸡骑楼城店预订后留的位置视野好，纸包鸡鲜嫩多汁，搭配冰泉豆浆绝了。','梧州老字号，传承的味道！'),(108,'2025-12-09 18:32:15',78,18,'upload/users8.jpg','账号8','玉林牛巴粉店预订后快速出餐，牛巴香韧，米粉爽滑，加个牛腩更满足。','玉林牛巴粉，嗦粉的快乐！'),(109,'2025-12-11 03:20:45',79,19,'upload/users9.jpg','账号9','钦州三娘湾海鲜大排档预订的新鲜大蚝现开现烤，蒜蓉粉丝蒸蚝太鲜美了！','钦州大蚝，北部湾的馈赠！');
/*!40000 ALTER TABLE `discussrestaurantinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussscenicinfo`
--

DROP TABLE IF EXISTS `discussscenicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussscenicinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_discussscenicinfo_refid` (`refid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779615857297 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussscenicinfo`
--

LOCK TABLES `discussscenicinfo` WRITE;
/*!40000 ALTER TABLE `discussscenicinfo` DISABLE KEYS */;
INSERT INTO `discussscenicinfo` VALUES (101,'2025-12-09 18:32:15',31,11,'upload/users1.jpg','账号1','桂林漓江竹筏漂流太震撼了！杨堤到兴坪段的九马画山栩栩如生，20元人民币背景图打卡必去。','漓江的山水，永远是桂林的名片！'),(102,'2025-12-09 18:32:15',32,12,'upload/users2.jpg','账号2','阳朔西街夜景超美，石板路两旁的小店各具特色，酒吧的驻唱歌手水平很高，很有氛围感。','阳朔西街，越夜越精彩！'),(103,'2025-12-09 18:32:15',33,13,'upload/users3.jpg','账号3','龙脊梯田金坑大寨太壮观了！十月中旬的稻谷金黄一片，缆车上去省时省力，瑶族阿姨的刺绣很精美。','龙脊梯田的四季，各有各的美！'),(104,'2025-12-09 18:32:15',34,14,'upload/users4.jpg','账号4','北海银滩的沙子真的像面粉一样细，海水清澈，租个遮阳伞躺一下午太舒服了，日落绝美。','北海银滩，天下第一滩名不虚传！'),(105,'2025-12-09 18:32:15',35,15,'upload/users5.jpg','账号5','德天跨国瀑布比想象中壮观！坐船近距离感受瀑布的震撼，中越边境的风情很特别，买的越南酸奶好喝。','德天瀑布，中越边境的璀璨明珠！'),(106,'2025-12-09 18:32:15',36,16,'upload/users6.jpg','账号6','涠洲岛火山口地质公园的火山岩地貌很独特，鳄鱼山景区的海景超棒，滴水丹屏的日落一定要看。','涠洲岛，中国最年轻的火山岛！'),(107,'2025-12-09 18:32:15',37,17,'upload/users7.jpg','账号7','南宁青秀山空气超好，龙象塔上能俯瞰南宁全景，兰园的兰花品种超多，春天去最合适。','青秀山，南宁的城市绿肺！'),(108,'2025-12-09 18:32:15',38,18,'upload/users8.jpg','账号8','三江程阳八寨的风雨桥太精致了！侗族大歌表演很震撼，百家宴的长桌菜很有特色，糯米酒香甜。','程阳八寨，侗族文化的活化石！'),(109,'2025-12-11 06:30:20',39,19,'upload/users9.jpg','账号9','桂林象鼻山景区不大但很有特色，象山水月的景观名不虚传，公园里的桂花糕很好吃。','象鼻山，桂林的城徽！'),(1763546085978,'2025-11-19 09:54:45',31,1678358276062,'upload/1678358274781.jpg','1','漓江竹筏太值了，九马画山数出了7匹马！',NULL),(1779615857296,'2026-05-24 09:44:16',31,11,'upload/users1.jpg','账号1','测试',NULL);
/*!40000 ALTER TABLE `discussscenicinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusstrafficroute`
--

DROP TABLE IF EXISTS `discusstrafficroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discusstrafficroute` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_discusstrafficroute_refid` (`refid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='交通路线评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusstrafficroute`
--

LOCK TABLES `discusstrafficroute` WRITE;
/*!40000 ALTER TABLE `discusstrafficroute` DISABLE KEYS */;
INSERT INTO `discusstrafficroute` VALUES (101,'2025-12-09 18:32:15',91,11,'upload/users1.jpg','账号1','南宁东站到桂林北站的高铁只要2小时，二等座169元，车上充电口很方便，准点率超高。','广西高铁网络越来越便捷啦！'),(102,'2025-12-09 18:32:15',92,12,'upload/users2.jpg','账号2','桂林磨盘山码头到阳朔的漓江游船4小时，船上有自助餐，一路看山水太惬意了。','漓江游船，最美的水上风景线！'),(103,'2025-12-09 18:33:15',93,13,'upload/users3.jpg','账号3','北海国际客运港到涠洲岛的客轮1.5小时，选北游25号船稳不颠簸，提前买票很重要。','涠洲岛航线，安全又舒适！'),(104,'2025-12-09 18:34:15',94,14,'upload/users4.jpg','账号4','南宁琅东站到崇左德天瀑布的旅游专线3小时，车上有导游讲解，中途会停明仕田园。','德天瀑布专线，一站式直达！'),(105,'2025-12-09 18:35:15',95,15,'upload/users5.jpg','账号5','柳州到三江的动车1.5小时，二等座58元，高铁站有到程阳八寨的大巴，很方便。','三江动车，拉近侗族风情的距离！'),(106,'2025-12-09 18:36:15',96,16,'upload/users6.jpg','账号6','桂林两江机场到市区的大巴20元，40分钟到民航大厦，打车的话约80元，建议坐大巴划算。','桂林机场交通，选择多样！'),(107,'2025-12-09 18:37:15',97,17,'upload/users7.jpg','账号7','阳朔汽车南站到龙脊梯田的直通车3小时，每天两班，比转车方便多了，座位舒服。','阳朔到龙脊，直达更省心！'),(108,'2025-12-09 18:38:15',98,18,'upload/users8.jpg','账号8','北海银滩到老街的3路公交2元，40分钟直达，沿途能看海景，比打车更有感觉。','北海公交，慢游城市的选择！');
/*!40000 ALTER TABLE `discusstrafficroute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusstravelguide`
--

DROP TABLE IF EXISTS `discusstravelguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discusstravelguide` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_discusstravelguide_refid` (`refid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='旅游攻略评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusstravelguide`
--

LOCK TABLES `discusstravelguide` WRITE;
/*!40000 ALTER TABLE `discusstravelguide` DISABLE KEYS */;
INSERT INTO `discusstravelguide` VALUES (101,'2025-12-09 18:32:15',101,11,'upload/users1.jpg','账号1','桂林阳朔3日游攻略太实用了！按攻略订的漓江竹筏早班车避开了人流，遇龙河漂流选的人工筏更有感觉。','很高兴攻略能帮到您，桂林欢迎常来！'),(102,'2025-12-09 18:32:15',102,12,'upload/users2.jpg','账号2','北海涠洲岛2日游攻略里的住宿推荐超棒，住在滴水丹屏附近看日落太方便，租电动车环岛的建议很实用。','涠洲岛的美，需要慢慢发现！'),(103,'2025-12-09 18:33:15',103,13,'upload/users3.jpg','账号3','南宁崇左德天瀑布1日游攻略的时间规划很合理，早上7点出发避开了团队游客，拍照超爽。','德天瀑布的美景，值得早起！'),(104,'2025-12-09 18:34:15',104,14,'upload/users4.jpg','账号4','广西桂柳北环线5日游攻略太全面了！从桂林到柳州再到北海，每个城市的特色都涵盖了，租车自驾很方便。','广西环线，一次看遍不同风景！'),(105,'2025-12-09 18:35:15',105,15,'upload/users5.jpg','账号5','龙脊梯田秋收季旅游攻略的最佳拍摄点推荐太准了！金佛顶的全景真的无敌，建议带长焦镜头。','龙脊的秋天，是金色的童话！'),(106,'2025-12-09 18:36:15',106,16,'upload/users6.jpg','账号6','涠洲岛潜水攻略里推荐的蓝湾潜水点超棒，能见度10米，看到了珊瑚和热带鱼，教练很专业。','涠洲岛潜水，探索海底世界！'),(107,'2025-12-09 18:37:15',107,17,'upload/users7.jpg','账号7','桂林山水甲天下深度游攻略里的小众景点太棒了！相公山的日出一定要看，人少景美。','桂林的美，不止于知名景点！'),(108,'2025-12-09 18:38:15',108,18,'upload/users8.jpg','账号8','广西少数民族风情游攻略带我们去了融水苗寨，苗年的芦笙舞太震撼了，长桌宴的酸鱼酸肉很有特色。','广西的少数民族文化，值得深入体验！');
/*!40000 ALTER TABLE `discusstravelguide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `picture` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '反馈图片',
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '反馈名称',
  `feedbacktime` datetime DEFAULT NULL COMMENT '反馈时间',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '反馈内容',
  `userid` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户姓名',
  `tips` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `sfsh` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `fankuibianhao` (`picture`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1753414904981 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='反馈意见';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (149,'2025-12-10 12:30:42','1731241842870','漓江竹筏预订建议','2025-12-10 00:00:00','希望平台能增加漓江竹筏的实时余票显示，每次订都不确定有没有票，只能打电话问很麻烦','11','李游客','竹筏预订','待审核',NULL),(150,'2025-12-10 12:31:16','1731241877339','餐厅信息补充','2025-12-10 00:00:00','餐厅推荐里能不能标注是否需要提前排队，上次去谢三姐啤酒鱼等了1个多小时，影响行程','12','王女士','餐厅排队','待审核',NULL),(151,'2025-12-10 12:32:28','1731241949375','景点导览优化','2025-12-10 00:00:00','龙脊梯田景区太大了，建议平台增加景区内的交通指引，比如从平安寨到金坑的班车时间','13','张先生','梯田交通','待审核',NULL),(1753414904980,'2025-07-25 03:41:44','upload/1678358274781.jpg','夜游两江四湖信息','2025-07-25 00:00:00','<p>想知道两江四湖夜游的游船有没有儿童优惠票，平台上没标注，另外能不能增加游船实时位置查询</p>','1678358276062','张4','夜游优惠','待审核',NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide`
--

DROP TABLE IF EXISTS `guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `guideusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `guidename` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机',
  `idcard` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '身份证',
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `qualification` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '资质',
  `specialties` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '擅长',
  `price` float DEFAULT '0' COMMENT '价格/天',
  `status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '待审核' COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `guideusername` (`guideusername`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='导游';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide`
--

LOCK TABLES `guide` WRITE;
/*!40000 ALTER TABLE `guide` DISABLE KEYS */;
INSERT INTO `guide` VALUES (21,'2025-12-09 10:32:15','guide1','123456','王导游','18600000000','370102199001010011','upload/guide_avatar1.jpg','持证导游','泉城历史,趵突泉,大明湖',300,'通过'),(22,'2025-12-09 10:32:15','guide2','123456','李导游','18600000002','370103199202020022','upload/guide_avatar2.jpg','持证导游','千佛山,泰山周边,亲子游',280,'通过');
/*!40000 ALTER TABLE `guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guideorder`
--

DROP TABLE IF EXISTS `guideorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guideorder` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint DEFAULT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户账号',
  `guideid` bigint DEFAULT NULL COMMENT '导游id',
  `guideusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '导游账号',
  `guidename` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '导游姓名',
  `plandate` date DEFAULT NULL COMMENT '预约日期',
  `days` int DEFAULT '1' COMMENT '天数',
  `amount` float DEFAULT '0' COMMENT '金额',
  `status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '待确认' COMMENT '状态',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779161396587 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='导游预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guideorder`
--

LOCK TABLES `guideorder` WRITE;
/*!40000 ALTER TABLE `guideorder` DISABLE KEYS */;
INSERT INTO `guideorder` VALUES (31,'2025-12-09 10:32:15',1678358276062,'1',21,'guide1','王导游','2025-08-10',1,300,'已完成','济南市区一日讲解'),(1779115463347,'2026-05-18 14:44:22',1678358276062,'1',21,'guide1','王导游','2026-05-19',1,300,'已完成',''),(1779161396586,'2026-05-19 03:29:56',1678358276062,'1',21,'guide1','王导游','2026-05-19',35,10500,'已取消','没空');
/*!40000 ALTER TABLE `guideorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelinfo`
--

DROP TABLE IF EXISTS `hotelinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `hotelname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '酒店名称',
  `hoteltype` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '酒店类型',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '酒店地址',
  `roomtype` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '房间类型',
  `price` float DEFAULT NULL COMMENT '预约价格',
  `telephone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系电话',
  `introduce` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '酒店介绍',
  `hotelphoto` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '酒店图片',
  `thumbsupnum` int DEFAULT '0' COMMENT '赞',
  `crazilynum` int DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '简介',
  `rating` double(8,1) DEFAULT '0.0' COMMENT '评分',
  `merchantusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商账号',
  `merchantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779615604017 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='酒店信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelinfo`
--

LOCK TABLES `hotelinfo` WRITE;
/*!40000 ALTER TABLE `hotelinfo` DISABLE KEYS */;
INSERT INTO `hotelinfo` VALUES (51,'2025-12-09 10:32:15','济南索菲特银座大饭店','星级酒店','济南市历下区泺源大街66号','豪华套房',880,'0531-86068888','位于泺源大街，紧邻泉城广场，可俯瞰泉城美景。提供法式浪漫与齐鲁文化的融合体验，交通便利。','upload/hotel1.jpg',128,5,'2026-05-24 17:51:46',528,'老牌五星级酒店，地处商业中心，服务周到。',5.0,'admin','管理员'),(52,'2025-12-09 10:32:15','泉城大酒店','星级酒店','济南市历下区南门大街2号','商务房',450,'0531-86921911','紧邻趵突泉和大明湖，地理位置极佳。提供地道的鲁菜早餐，是游览泉城的理想下榻之所。','upload/hotel2.jpg',96,3,'2026-05-24 17:17:51',361,'位置核心，性价比高，设施完备。',10.0,'admin','管理员'),(53,'2025-12-09 10:32:15','后宰门精品民宿','精品民宿','济南市历下区后宰门街','大床房',320,'0531-86012345','坐落于老城区后宰门街，由古建筑改造而成。环境清幽，出门即是泉水，让您深度体验老济南生活。','upload/hotel3.jpg',150,2,'2026-05-24 17:22:22',201,'极具泉城韵味，老街深度体验。',10.0,'admin','管理员'),(54,'2025-12-09 10:32:15','北海银滩皇冠假日酒店','滨海度假酒店','北海市银海区银滩中路8号','滨海海景房',1280,'0779-3888888','位于北海银滩景区内，酒店拥有私人海滩，客房直面北部湾海景。提供海鲜烧烤与疍家民俗体验，步行至银滩浴场仅5分钟路程','upload/hotel4.jpg,upload/hotel5.jpg,upload/hotel6.jpg',89,12,'2026-05-24 17:22:13',435,'位于北海银滩景区内，酒店拥有私人海滩，客房直面北部湾海景。提供海鲜烧烤与疍家民俗体验，步行至银滩浴场仅5分钟路程',10.0,'liuzhou_travel','柳州文旅发展集团'),(55,'2025-12-09 10:32:15','柳州丽笙酒店','商务酒店','柳州市城中区解放北路3号','商务舒适房',880,'0772-2188888','位于柳州市中心，紧邻柳江，酒店装饰融入苗族元素。提供螺蛳粉礼盒代购服务，距离龙潭公园20分钟车程','upload/hotel5.jpg,upload/hotel6.jpg,upload/hotel7.jpg',65,4,'2025-11-19 16:25:10',193,'位于柳州市中心，紧邻柳江，酒店装饰融入苗族元素。提供螺蛳粉礼盒代购服务，距离龙潭公园20分钟车程',10.0,'1','广西文旅综合管理中心'),(56,'2025-12-09 10:32:15','阳朔遇龙河竹筏酒店','精品民宿','桂林市阳朔县白沙镇遇龙河景区','山水景观房',980,'0773-8818888','毗邻遇龙河竹筏码头，酒店拥有观景露台与无边泳池。客房采用桂北民居风格，餐厅提供啤酒鱼、田螺酿等本地菜，距离遇龙河漂流起点5分钟车程','upload/hotel6.jpg,upload/hotel7.jpg,upload/hotel8.jpg',102,7,'2025-11-19 17:19:05',359,'毗邻遇龙河竹筏码头，酒店拥有观景露台与无边泳池。客房采用桂北民居风格，餐厅提供啤酒鱼、田螺酿等本地菜，距离遇龙河漂流起点5分钟车程',10.0,'beihai_travel','北海银滩景区管理有限公司'),(57,'2025-12-09 10:32:15','巴马长寿养生酒店','特色度假酒店','河池市巴马县甲篆镇坡月村','长寿养生房',820,'0778-6218888','位于巴马长寿村核心区，酒店融入瑶族养生理念。提供瑶族药浴、五谷养生餐体验，步行至百魔洞景区10分钟','upload/hotel7.jpg,upload/hotel8.jpg,upload/hotel9.jpg',93,8,'2025-11-19 16:25:17',414,'位于巴马长寿村核心区，酒店融入瑶族养生理念。提供瑶族药浴、五谷养生餐体验，步行至百魔洞景区10分钟',10.0,'bose_travel','百色靖西文旅管理公司'),(58,'2025-12-09 10:32:15','南宁东站便捷酒店','连锁酒店','南宁市青秀区凤岭北路18号','标准大床房',380,'0771-5599999','距离南宁东站仅800米，提供免费接送服务。酒店设计简约实用，周边有老友粉、螺蛳粉特色小吃店，适合高铁出行旅客','upload/hotel8.jpg,upload/hotel9.jpg,upload/hotel10.jpg',78,5,'2026-05-24 14:38:40',311,'距离南宁东站仅800米，提供免费接送服务。酒店设计简约实用，周边有老友粉、螺蛳粉特色小吃店，适合高铁出行旅客',10.0,'hechi_travel','河池巴马文旅运营公司'),(1779615604015,'2026-05-24 12:40:52','Green Wizard Star Treehouse Hotel','Resort Hotel','Starry Camp, Green Valley, Yangshuo, Guilin','Deluxe Suite',1280,'0773-8888666','Treehouse suspended among ancient trees. Wake up to the sound of birds in the morning, and gaze at the starry sky through the panoramic glass dome at night.','upload/hotel1.jpg',0,0,NULL,0,'<h3>Treehouse Hotel Experience</h3><p>Equipped with full smart home system, private outdoor terrace, and hot spring bath. Breath and touch the stars in this dream space.</p>',0.0,'shop1','Green Wizard Resort'),(1779615604016,'2026-05-24 12:40:52','Hidden Mountain Creek Boutique Homestay','Boutique Homestay','By Hidden Mountain Creek, Yangshuo, Guilin','Mountain & Water View Room',680,'0773-8888777','Live by the stream, surrounded by bamboo forests. The minimalist Zen design provides a peaceful retreat to cleanse your mind.','upload/hotel2.jpg',0,0,NULL,0,'<h3>Boutique Homestay Experience</h3><p>Features a custom tea room, book library, and creek swings. All bedding uses luxury-grade standards for an exceptional sleep.</p>',0.0,'shop1','Green Wizard Resort');
/*!40000 ALTER TABLE `hotelinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelreserve`
--

DROP TABLE IF EXISTS `hotelreserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelreserve` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `hotelname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '酒店名称',
  `hoteltype` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '酒店类型',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '酒店地址',
  `roomtype` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '房间类型',
  `price` float DEFAULT NULL COMMENT '预约价格',
  `reservetime` datetime DEFAULT NULL COMMENT '预订时间',
  `reserveremark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '预订说明',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机',
  `ispay` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '未支付' COMMENT '是否支付',
  `refid` bigint DEFAULT NULL COMMENT '父id',
  `rating` double(8,1) DEFAULT '0.0' COMMENT '评分',
  `review` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '评论',
  `sfsh` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '待审核' COMMENT '审核状态',
  `shhf` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '审核回复',
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `merchantusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商账号',
  `merchantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779116750949 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='酒店预订';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelreserve`
--

LOCK TABLES `hotelreserve` WRITE;
/*!40000 ALTER TABLE `hotelreserve` DISABLE KEYS */;
INSERT INTO `hotelreserve` VALUES (61,'2025-12-09 10:32:15','桂林漓江大瀑布饭店','五星级酒店','桂林市秀峰区杉湖北路1号','山水景观房',1680,'2025-08-10 14:00:00','需提供身份证办理入住，包含双人早餐，赠送漓江游船票','账号1','李伟','13877123451','已支付',51,10.0,'很舒适','已评价',NULL,NULL,'guilin_travel','桂林漓江景区管理有限公司'),(62,'2025-12-09 10:32:15','南宁南湖名都大酒店','四星级酒店','南宁市青秀区双拥路30号','商务舒适房',680,'2025-08-12 12:00:00','含双人早餐，可免费停车，需提前1天告知抵达时间','账号2','陈芳','13877323452','已支付',52,10.0,'很舒适','已评价',NULL,NULL,'nanning_travel','南宁文旅集团有限公司'),(63,'2025-12-09 10:32:15','阳朔西街民族特色民宿','民族特色民宿','桂林市阳朔县阳朔镇西街117号','民族特色房',780,'2025-08-15 15:00:00','含油茶制作体验，提供民族歌舞表演，需提前2天预约','账号3','黄明','13877223453','已支付',53,10.0,'很舒适','已评价',NULL,NULL,'yangshuo_travel','阳朔遇龙河文旅运营公司'),(64,'2025-12-09 10:32:15','北海银滩皇冠假日酒店','滨海度假酒店','北海市银海区银滩中路8号','滨海海景房',1280,'2025-08-08 13:00:00','含海鲜自助晚餐，提供沙滩椅租赁，需备注饮食禁忌','账号4','杨丽','13877923454','已支付',54,10.0,'很舒适','已评价',NULL,NULL,'beihai_travel','北海银滩景区管理有限公司'),(65,'2025-12-09 10:32:15','柳州丽笙酒店','商务酒店','柳州市城中区解放北路3号','商务舒适房',880,'2026-08-13 16:00:00','提供螺蛳粉礼盒代购服务，含单人早餐，可延迟退房至14:00','账号5','赵强','13877623455','已支付',55,10.0,'很舒适','已评价',NULL,NULL,'liuzhou_travel','柳州文旅发展集团'),(66,'2025-12-09 10:32:15','阳朔遇龙河竹筏酒店','精品民宿','桂林市阳朔县白沙镇遇龙河景区','山水景观房',980,'2025-08-05 12:30:00','含遇龙河竹筏优先登筏券，可免费使用观景露台','账号6','韦丽','13877823456','已支付',56,10.0,'很舒适','已评价',NULL,NULL,'yangshuo_travel','阳朔遇龙河文旅运营公司'),(67,'2025-12-09 10:32:15','巴马长寿养生酒店','特色度假酒店','河池市巴马县甲篆镇坡月村','长寿养生房',820,'2025-08-18 14:30:00','含3人早餐，提供瑶族药浴体验，可帮忙预订百魔洞讲解','账号7','周健','13877123457','已支付',57,10.0,'很舒适','已评价',NULL,NULL,'hechi_travel','河池巴马文旅运营公司'),(68,'2025-12-09 10:32:15','南宁东站便捷酒店','连锁酒店','南宁市青秀区凤岭北路18号','标准大床房',380,'2025-08-01 11:00:00','提供高铁站免费接送，含单人早餐，适合中转客人','账号8','吴丹','13877323458','已支付',58,10.0,'很舒适','已评价',NULL,NULL,'nanning_travel','南宁文旅集团有限公司'),(1779115944003,'2026-05-18 14:52:23','济南索菲特银座大饭店','星级酒店','济南市历下区泺源大街66号','豪华套房',880,'2026-05-18 22:52:20','','1','张三','18154541454','已支付',51,0.0,NULL,'已评价','666666','upload/1678358274781.jpg','admin','管理员'),(1779116750948,'2026-05-18 15:05:50','泉城大酒店','星级酒店','济南市历下区南门大街2号','商务房',450,'2026-05-18 23:05:44','','1','张三','18154541454','已支付',52,10.0,'666','已评价',NULL,'upload/1678358274781.jpg','admin','管理员');
/*!40000 ALTER TABLE `hotelreserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `merchantusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '供应商账号',
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `merchantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '供应商名称',
  `merchantaddress` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '供应商地址',
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱',
  `phonenumber` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系电话',
  `merchantlicense` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '营业执照',
  `sfsh` varchar(200) DEFAULT '待审核',
  `shhf` longtext,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `merchantusername` (`merchantusername`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779613742085 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (21,'2025-12-29 19:17:27','nanning_travel','1','南宁文旅集团有限公司','南宁市青秀区民族大道111号','nanning_travel@qq.com','13877188881','upload/merchant_merchantlicense1.jpg','待审核',NULL),(22,'2025-12-29 19:17:27','guilin_travel','1','桂林漓江景区管理有限公司','桂林市阳朔县阳朔镇抗战路6号','guilin_travel@qq.com','13877388882','upload/merchant_merchantlicense2.jpg','待审核',NULL),(23,'2025-12-29 19:17:27','yangshuo_travel','1','阳朔遇龙河文旅运营公司','桂林市阳朔县白沙镇遇龙河景区','yangshuo_travel@qq.com','13877388883','upload/merchant_merchantlicense3.jpg','待审核',NULL),(24,'2025-12-29 19:17:27','liuzhou_travel','1','柳州文旅发展集团','柳州市城中区文昌路66号','liuzhou_travel@qq.com','13877288884','upload/merchant_merchantlicense4.jpg','待审核',NULL),(25,'2025-12-29 19:17:27','1','1','广西文旅综合管理中心','南宁市青秀区金湖南路24号','gx_travel@qq.com','13877188885','upload/merchant_merchantlicense5.jpg','待审核',NULL),(26,'2025-12-29 19:17:27','beihai_travel','1','北海银滩景区管理有限公司','北海市银海区银滩大道8号','beihai_travel@qq.com','13877988886','upload/merchant_merchantlicense6.jpg','待审核',NULL),(27,'2025-12-29 19:17:27','bose_travel','1','百色靖西文旅管理公司','百色市靖西市新靖镇绣球大道','bose_travel@qq.com','13877688887','upload/merchant_merchantlicense7.jpg','待审核',NULL),(28,'2025-12-29 19:17:27','hechi_travel','1','河池巴马文旅运营公司','河池市巴马县甲篆镇长寿村','hechi_travel@qq.com','13877888888','upload/merchant_merchantlicense8.jpg','已通过','test1'),(1779613742084,'2026-05-24 09:09:02','shop1','123456','test1','test1','test1@qq.com','12342424242','upload/1779613721194.jpg','已通过','test1');
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '简介',
  `picture` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (131,'2025-12-09 10:32:16','济南天下第一泉风景区推行门票电子化','趵突泉、大明湖等景区全面升级电子门票系统，游客可实现无感入园。','upload/news1.jpg','为提升游客体验，济南天下第一泉风景区近日宣布全面推行门票电子化。游客只需通过手机预约购票，即可凭二维码直接入园，有效减少了排队时间。'),(132,'2025-12-09 10:32:16','千佛山庙会盛大开幕，传承千年民俗','一年一度的千佛山庙会如约而至，非遗展示、特色小吃精彩纷呈。','upload/news2.jpg','本届千佛山庙会以“泉城韵、民俗情”为主题，现场汇集了剪纸、皮影等众多非遗项目，让游客在游览名胜的同时，深度感受老济南的文化底蕴。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantinfo`
--

DROP TABLE IF EXISTS `restaurantinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `restaurantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '餐厅名称',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '餐厅地点',
  `businesstime` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '营业时间',
  `avgprice` int DEFAULT NULL COMMENT '人均消费',
  `reserveprice` int DEFAULT NULL COMMENT '预订价格',
  `introduce` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '餐厅介绍',
  `restaurantphoto` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '餐厅图片',
  `thumbsupnum` int DEFAULT '0' COMMENT '赞',
  `crazilynum` int DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '简介',
  `rating` double(8,1) DEFAULT '0.0' COMMENT '评分',
  `merchantusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商账号',
  `merchantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商名称',
  `telephone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='餐厅信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantinfo`
--

LOCK TABLES `restaurantinfo` WRITE;
/*!40000 ALTER TABLE `restaurantinfo` DISABLE KEYS */;
INSERT INTO `restaurantinfo` VALUES (71,'2025-12-09 10:32:15','聚丰德(经五路店)','济南市市中区经五路11号','11:00-21:00',120,0,'济南著名的老字号鲁菜馆，招牌菜有九转大肠、糖醋鲤鱼、爆三样。传承鲁菜精髓，口味地道。','upload/restaurant1.jpg',215,12,'2026-05-19 17:10:15',724,'正宗鲁菜体验，老字号品质保证。',6.0,'admin','管理员','0531-86012345'),(72,'2025-12-09 10:32:15','金春禧','济南市历下区泉城路26号','10:30-21:30',80,0,'现代精致鲁菜与地方特色融合，环境优雅。主打禧味排骨、传统鲁菜，适合亲友聚会。','upload/restaurant2.jpg',189,15,'2026-05-18 23:11:28',548,'精致鲁菜，口味丰富，环境舒适。',6.0,'admin','管理员','0531-86054321'),(73,'2025-12-09 10:32:15','城南往事','济南市历下区芙蓉街','10:00-22:00',60,0,'以老济南家常菜为特色，怀旧氛围浓厚。在这里可以吃到最亲切的泉城风味。','upload/restaurant3.jpg',120,8,'2025-12-09 18:32:15',400,'怀旧老济南味道，价格亲民。',4.5,'admin','管理员','0531-86088888'),(74,'2025-12-09 10:32:15','阳朔大师傅金奖啤酒鱼(西街口店)','桂林市阳朔县阳朔镇抗战路8号','10:30-22:00',88,0,'阳朔知名啤酒鱼品牌，招牌菜为漓江啤酒鱼、田螺酿、竹筒饭。食材为漓江鲜鱼与本地田螺，餐厅为桂北民居风格，适合家庭聚餐','upload/restaurant4.jpg,upload/restaurant5.jpg,upload/restaurant6.jpg',156,10,'2025-11-10 15:29:07',427,'阳朔知名啤酒鱼品牌，招牌菜为漓江啤酒鱼、田螺酿、竹筒饭。食材为漓江鲜鱼与本地田螺，餐厅为桂北民居风格，适合家庭聚餐',6.0,'liuzhou_travel','柳州文旅发展集团','0773-8828888'),(75,'2025-12-09 10:32:15','北海疍家海鲜大排档','北海市银海区侨港镇港口路12号','10:00-22:00',150,0,'北海老字号海鲜餐厅，主打清蒸石斑鱼、椒盐皮皮虾、沙虫刺身等疍家特色菜。可现场挑选海鲜现点现做，适合品尝北部湾海鲜','upload/restaurant5.jpg,upload/restaurant6.jpg,upload/restaurant7.jpg',128,7,'2025-11-10 15:29:08',390,'北海老字号海鲜餐厅，主打清蒸石斑鱼、椒盐皮皮虾、沙虫刺身等疍家特色菜。可现场挑选海鲜现点现做，适合品尝北部湾海鲜',6.0,'1','广西文旅综合管理中心','0779-3888888'),(76,'2025-12-09 10:32:15','百色靖西民族风味馆','百色市靖西市城中路58号','09:00-20:00',68,0,'靖西老字号民族风味餐厅，采用传统壮家烹饪工艺，主打五色糯米饭、壮家酸嘢、蕉叶烤鱼。提供真空包装五色糯米饭可带走，距离靖西通灵大峡谷30分钟车程','upload/restaurant6.jpg,upload/restaurant7.jpg,upload/restaurant8.jpg',275,9,'2025-11-19 17:28:16',849,'靖西老字号民族风味餐厅，采用传统壮家烹饪工艺，主打五色糯米饭、壮家酸嘢、蕉叶烤鱼。提供真空包装五色糯米饭可带走，距离靖西通灵大峡谷30分钟车程',6.0,'beihai_travel','北海银滩景区管理有限公司','0776-6218888'),(77,'2025-12-09 10:32:15','巴马长寿药膳馆','河池市巴马县甲篆镇长寿村','10:30-20:00',98,280,'以巴马长寿养生为特色的主题餐厅，招牌为火麻汤、巴马香猪、玉米粥。用餐环境融入瑶族元素，可体验养生药膳制作，需提前1天预订','upload/restaurant7.jpg,upload/restaurant8.jpg,upload/restaurant9.jpg',98,5,'2025-11-10 15:29:10',216,'以巴马长寿养生为特色的主题餐厅，招牌为火麻汤、巴马香猪、玉米粥。用餐环境融入瑶族元素，可体验养生药膳制作，需提前1天预订',6.0,'bose_travel','百色靖西文旅管理公司','0778-6218888'),(78,'2025-12-09 10:32:15','南宁中山路美食街','南宁市青秀区中山路','17:00-凌晨3:00',50,0,'南宁知名美食聚集区，有老友粉、卷筒粉、酸嘢等特色小吃。推荐现做的烤生蚝和炒螺，适合夜间逛吃，旺季需提前占位','upload/restaurant8.jpg,upload/restaurant9.jpg,upload/restaurant10.jpg',89,4,'2025-11-19 17:52:32',334,'南宁知名美食聚集区，有老友粉、卷筒粉、酸嘢等特色小吃。推荐现做的烤生蚝和炒螺，适合夜间逛吃，旺季需提前占位',6.0,'hechi_travel','河池巴马文旅运营公司','0771-5599999'),(85,'2026-05-24 12:40:52','Wild Bamboo Creek Private Restaurant','Deep in the Bamboo Forest, Green Valley, Yangshuo, Guilin','11:00-21:30',120,20,'Local ingredients, wild stream fish, and signature bamboo chicken cooked in the bamboo forest while listening to the stream.','upload/restaurant1.jpg',0,0,NULL,0,'<h3>Signature Dishes</h3><p>Recommended: Signature Bamboo Chicken, Mountain Spring Stewed Chicken, Authentical Yangshuo Beer Fish. Fresh and delicious taste.</p>',4.8,'shop1','Green Wizard Resort','0773-8888111'),(86,'2026-05-24 12:40:52','Summit Sunset Cliffside Western Restaurant','Edge of the Cliff, Cloud Mountain, Yangshuo, Guilin','14:00-22:00',280,50,'Breathtaking sunset views on the cliff, with top-grade steaks and fine wines, enjoying the ultimate visual and dining feast.','upload/restaurant2.jpg',0,0,NULL,0,'<h3>Cliffside Dining Experience</h3><p>Features exquisite French fine dining. Chef selected M7 Wagyu steak and fresh black truffle. Perfect for dating, proposals, and upscale salons.</p>',4.9,'shop1','Green Wizard Resort','0773-8888222');
/*!40000 ALTER TABLE `restaurantinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantreserve`
--

DROP TABLE IF EXISTS `restaurantreserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantreserve` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `restaurantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '餐厅名称',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '餐厅地点',
  `reserveprice` float DEFAULT NULL COMMENT '预订价格',
  `reservetime` datetime DEFAULT NULL COMMENT '预订时间',
  `reserveremark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '预订说明',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机',
  `ispay` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '未支付' COMMENT '是否支付',
  `refid` bigint DEFAULT NULL COMMENT '父id',
  `rating` double(8,1) DEFAULT '0.0' COMMENT '评分',
  `review` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '评论',
  `sfsh` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '待审核' COMMENT '审核状态',
  `shhf` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '审核回复',
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `merchantusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商账号',
  `merchantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779117087001 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='餐厅预订';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantreserve`
--

LOCK TABLES `restaurantreserve` WRITE;
/*!40000 ALTER TABLE `restaurantreserve` DISABLE KEYS */;
INSERT INTO `restaurantreserve` VALUES (81,'2025-12-09 10:32:15','桂林椿记烧鹅(中山店)','桂林市秀峰区中山中路2号',0,'2025-08-06 18:30:00','需提前1天预订，预留4人临窗座位，推荐椿记烧鹅+荔浦芋头扣肉','账号1','李伟','13877123451','已支付',71,6.0,'很美味','已评价',NULL,NULL,'guilin_travel','桂林漓江景区管理有限公司'),(82,'2025-12-09 10:32:15','南宁复记老友粉(中山路店)','南宁市青秀区中山路66号',0,'2025-08-08 19:00:00','预留2人座位，推荐老友粉+牛杂煲，需备注是否要辣','账号2','陈芳','13877323452','已支付',72,6.0,'很美味','已评价',NULL,NULL,'nanning_travel','南宁文旅集团有限公司'),(83,'2025-12-09 10:32:15','柳州螺霸王螺蛳粉(五星街店)','柳州市城中区五星街88号',0,'2025-08-12 18:00:00','预订6人螺蛳粉套餐，含鸭脚煲小吃，需提前1天确认','账号3','黄明','13877223453','已支付',73,6.0,'很美味','已评价',NULL,NULL,'liuzhou_travel','柳州文旅发展集团'),(84,'2025-12-09 10:32:15','阳朔大师傅金奖啤酒鱼(西街口店)','桂林市阳朔县阳朔镇抗战路8号',0,'2025-08-15 12:00:00','西街游览后用餐，预留4人座位，推荐漓江啤酒鱼+田螺酿','账号4','杨丽','13877923454','已支付',74,6.0,'很美味','已评价',NULL,NULL,'yangshuo_travel','阳朔遇龙河文旅运营公司'),(85,'2025-12-09 10:32:15','北海疍家海鲜大排档','北海市银海区侨港镇港口路12号',0,'2025-08-01 18:30:00','晚餐预订4人海鲜套餐，加椒盐皮皮虾，到店直接报姓名用餐','账号5','赵强','13877623455','已支付',75,6.0,'很美味','已评价',NULL,NULL,'beihai_travel','北海银滩景区管理有限公司'),(86,'2025-12-09 10:32:15','百色靖西民族风味馆','百色市靖西市城中路58号',0,'2025-08-18 12:30:00','预订5份五色糯米饭礼盒，现做现取，可帮忙快递','账号6','韦丽','13877823456','已支付',76,6.0,'很美味','已评价',NULL,NULL,'bose_travel','百色靖西文旅管理公司'),(87,'2025-12-09 10:32:15','巴马长寿药膳馆','河池市巴马县甲篆镇长寿村',280,'2026-08-13 18:00:00','预留5人餐桌，预订长寿药膳宴套餐，含火麻汤品鉴','账号7','周健','13877123457','已支付',77,6.0,'很美味','已评价',NULL,NULL,'hechi_travel','河池巴马文旅运营公司'),(88,'2025-12-09 10:32:15','南宁中山路美食街','南宁市青秀区中山路',0,'2025-08-05 19:30:00','预留2人座位，推荐烤生蚝+炒螺，需备注不吃辣','账号8','吴丹','13877323458','已支付',78,6.0,'很美味','已评价',NULL,NULL,'nanning_travel','南宁文旅集团有限公司'),(1766479702560,'2025-12-23 08:48:22','桂林椿记烧鹅(中山店)','桂林市秀峰区中山中路2号',0,'2025-12-23 16:48:21','','1','张三','18154541454','未支付',71,0.0,NULL,'待审核',NULL,'upload/1678358274781.jpg','nanning_travel','南宁文旅集团有限公司'),(1779117041850,'2026-05-18 15:10:41','聚丰德(经五路店)','济南市市中区经五路11号',0,'2026-05-18 23:10:40','','1','张三','18154541454','未支付',71,0.0,NULL,'待审核',NULL,'upload/1678358274781.jpg','admin','管理员'),(1779117087000,'2026-05-18 15:11:26','金春禧','济南市历下区泉城路26号',0,'2026-05-18 23:11:25','','1','张三','18154541454','未支付',72,0.0,NULL,'待审核',NULL,'upload/1678358274781.jpg','admin','管理员');
/*!40000 ALTER TABLE `restaurantreserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenicinfo`
--

DROP TABLE IF EXISTS `scenicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenicinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `scenicname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '景点名称',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '景点地址',
  `sceniclevel` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '景点等级',
  `price` int DEFAULT NULL COMMENT '门票价格',
  `telephone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '景点电话',
  `opentime` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开放时间',
  `introduce` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '景点介绍',
  `scenicphoto` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '景点图片',
  `thumbsupnum` int DEFAULT '0' COMMENT '赞',
  `crazilynum` int DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int DEFAULT '0' COMMENT '点击次数',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '简介',
  `rating` double(8,1) DEFAULT '0.0' COMMENT '评分',
  `merchantusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商账号',
  `merchantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='景点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenicinfo`
--

LOCK TABLES `scenicinfo` WRITE;
/*!40000 ALTER TABLE `scenicinfo` DISABLE KEYS */;
INSERT INTO `scenicinfo` VALUES (31,'2025-12-09 10:32:15','漓江景区','桂林市阳朔县阳朔镇抗战路6号','AAAAA',210,'0773-8822666','08:00-17:00（冬季08:30-16:30）','世界自然遗产，以“山青、水秀、洞奇、石美”四绝闻名。核心景点包括象鼻山、九马画山、黄布倒影等。可乘竹筏漂流（230元）体验“百里漓江，百里画廊”，春季烟雨漓江最美，秋季观红叶，适合摄影与休闲','upload/scenic1.jpg',329,15,'2026-05-24 17:44:12',1302,'广西旅游核心，世界自然遗产，建议安排1-2天游览',8.0,'nanning_travel','南宁文旅集团有限公司'),(32,'2025-12-09 10:32:15','德天跨国瀑布景区','崇左市大新县硕龙镇德天村','AAAAA',115,'0771-3690999','07:30-17:30','亚洲第一、世界第四大跨国瀑布，横跨中越两国。核心景点包括德天瀑布、53号界碑、中越集市等，可体验竹筏近距离观赏瀑布，适合摄影与边境风情体验','upload/scenic2.jpg',295,12,'2025-11-10 15:21:28',989,'中越边境标志性景点，跨国瀑布奇观，建议安排1天',8.0,'guilin_travel','桂林漓江景区管理有限公司'),(33,'2025-12-09 10:32:15','银滩景区','北海市银海区银滩中路','AAAA',0,'0779-3888888','全天开放','被誉为“天下第一滩”，以“滩长平、沙细白、水温净、浪柔软”著称。核心景点包括银滩公园、海滩公园、情人岛等，适合沙滩休闲、水上运动，夏季海水温度适宜游泳','upload/scenic3.jpg',268,9,'2025-11-10 15:29:01',846,'北海标志性海滩，免费开放，适合亲子游与休闲',8.0,'yangshuo_travel','阳朔遇龙河文旅运营公司'),(34,'2025-12-09 10:32:15','巴马长寿村','河池市巴马县甲篆镇坡月村','AAAA',80,'0778-6218888','08:00-17:30','世界长寿之乡，以长寿文化、养生环境闻名。核心景点包括百魔洞、百鸟岩、长寿村等，可体验瑶族养生文化、品尝火麻汤等长寿食品，适合养生度假与研学旅行','upload/scenic4.jpg',245,7,'2025-11-10 15:29:00',763,'世界长寿之乡，适合养生度假，建议安排2-3天',8.0,'liuzhou_travel','柳州文旅发展集团'),(35,'2025-12-09 10:32:15','青秀山景区','南宁市青秀区凤岭南路6号','AAAAA',20,'0771-5560666','07:00-18:00','南宁城市绿肺，以亚热带植物、邕江风光为特色。核心景点包括龙象塔、苏铁园、桃花岛等，山顶可俯瞰南宁城区全景，春季桃花盛开时景色最佳','upload/scenic5.jpg',218,8,'2025-11-10 15:29:02',699,'南宁城市名片，休闲度假胜地，建议安排半天',8.0,'1','广西文旅综合管理中心'),(36,'2025-12-09 10:32:15','遇龙河景区','桂林市阳朔县白沙镇遇龙村','AAAA',230,'0773-8818888','08:00-17:00','被誉为“小漓江”，以竹筏漂流、田园风光为特色。核心景点包括遇龙桥、富里桥、旧县村等，可体验人工撑筏漂流（230元），两岸田园风光如画，适合摄影与休闲','upload/scenic6.jpg',186,6,'2025-11-10 15:29:01',544,'阳朔精华景区，竹筏漂流体验佳，建议安排半天',8.0,'beihai_travel','北海银滩景区管理有限公司'),(37,'2025-12-09 10:32:15','龙潭公园','柳州市鱼峰区龙潭路43号','AAAA',0,'0772-3173378','06:30-22:00','以喀斯特地貌、侗族风情为特色。核心景点包括风雨桥、鼓楼、镜湖等，园内有4A景区大龙潭，可体验侗族歌舞表演，适合休闲散步与民俗体验','upload/scenic7.jpg',152,5,'2025-11-10 15:29:03',490,'柳州城市公园，免费开放，适合休闲游',8.0,'bose_travel','百色靖西文旅管理公司'),(38,'2025-12-09 10:32:15','通灵大峡谷','百色市靖西市湖润镇新灵村','AAAA',115,'0776-6218888','08:00-17:00','集峡谷、瀑布、溶洞为一体的自然奇观。核心景点包括通灵大瀑布、地下暗河、古悬洞葬等，峡谷内负氧离子含量高，适合徒步探险与避暑','upload/scenic8.jpg',312,18,'2025-11-10 15:50:59',1573,'靖西自然奇观，徒步探险胜地，建议安排1天',8.0,'hechi_travel','河池巴马文旅运营公司'),(45,'2026-05-24 12:40:52','Green Wizard Secret Canyon','No. 1 Green Valley, Yangshuo, Guilin','AAAAA',85,'0773-8888888','08:00 - 18:00','A secret canyon surrounded by mountains and lush forests, where crystal clear spring waters gurgle through the streams.','upload/scenic1.jpg',0,0,NULL,0,'<h3>Green Wizard Secret Canyon Introduction</h3><p>Enjoy the most pristine canyon forest landscape with waterfalls and unique rock formations. Perfect for family outings, summer escapes, and outdoor adventures.</p>',4.9,'shop1','Green Wizard Resort'),(46,'2026-05-24 12:40:52','Summit Sunset Walk Observation Deck','Peak of Cloud Mountain, Yangshuo, Guilin','AAAA',60,'0773-9999999','09:00 - 21:00','Stand above the clouds and look down at the spectacular karst landform painting, walking in the clouds under the sunset glow.','upload/scenic2.jpg',0,0,NULL,0,'<h3>Summit Sunset Walk Observation Deck Introduction</h3><p>One of the highest landmarks in Yangshuo with 360-degree panoramic views. Enjoy the sunset and the beautiful skyline of Yangshuo city.</p>',4.7,'shop1','Green Wizard Resort');
/*!40000 ALTER TABLE `scenicinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storeup` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片',
  `type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779173067652 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
INSERT INTO `storeup` VALUES (1766479716616,'2025-12-23 08:48:36',1678358276062,31,'scenicinfo','漓江景区','upload/scenic1.jpg','1',NULL,NULL),(1766479718535,'2025-12-23 08:48:38',1678358276062,51,'hotelinfo','桂林漓江大瀑布饭店','upload/hotel1.jpg','1',NULL,NULL),(1766479721558,'2025-12-23 08:48:41',1678358276062,71,'restaurantinfo','桂林椿记烧鹅(中山店)','upload/restaurant1.jpg','1',NULL,NULL),(1779173067651,'2026-05-19 06:44:26',18,31,'scenicinfo','漓江景区','upload/scenic1.jpg','1',NULL,NULL);
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketreserve`
--

DROP TABLE IF EXISTS `ticketreserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketreserve` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `scenicname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '景点名称',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '景点地址',
  `price` float DEFAULT NULL COMMENT '门票价格',
  `sceniclevel` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '景点等级',
  `reservetime` datetime DEFAULT NULL COMMENT '预订时间',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机',
  `ispay` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '未支付' COMMENT '是否支付',
  `refid` bigint DEFAULT NULL COMMENT '父id',
  `rating` double(8,1) DEFAULT '0.0' COMMENT '评分',
  `review` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '评论',
  `sfsh` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '待审核' COMMENT '审核状态',
  `shhf` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '审核回复',
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  `merchantusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商账号',
  `merchantname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1779183552756 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='门票预订';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketreserve`
--

LOCK TABLES `ticketreserve` WRITE;
/*!40000 ALTER TABLE `ticketreserve` DISABLE KEYS */;
INSERT INTO `ticketreserve` VALUES (41,'2025-12-09 10:32:15','漓江景区','桂林市阳朔县阳朔镇抗战路6号',210,'AAAAA','2025-08-06 09:00:00','已预约漓江竹筏漂流，凭身份证入园，建议上午游览九马画山','账号1','李伟','13877123451','已支付',31,8.0,'景色不错','已评价',NULL,NULL,'guilin_travel','桂林漓江景区管理有限公司'),(42,'2025-12-09 10:32:15','德天跨国瀑布景区','崇左市大新县硕龙镇德天村',115,'AAAAA','2025-08-08 09:00:00','预订景区观光车，含中越边境讲解服务，需提前30分钟到游客中心','账号2','陈芳','13877323452','已支付',32,8.0,'景色不错','已评价',NULL,NULL,'bose_travel','百色靖西文旅管理公司'),(43,'2025-12-09 10:32:15','银滩景区','北海市银海区银滩中路',0,'AAAA','2025-08-10 10:00:00','含沙滩椅租赁，建议先游览银滩公园，再到海滩公园看音乐喷泉','账号3','黄明','13877223453','已支付',33,8.0,'景色不错','已评价',NULL,NULL,'beihai_travel','北海银滩景区管理有限公司'),(44,'2025-12-09 10:32:15','巴马长寿村','河池市巴马县甲篆镇坡月村',80,'AAAA','2025-08-12 08:30:00','预订长寿文化讲解服务，含百魔洞门票，需8:30前到游客中心','账号4','杨丽','13877923454','已支付',34,8.0,'景色不错','已评价',NULL,NULL,'hechi_travel','河池巴马文旅运营公司'),(45,'2025-12-09 10:32:15','青秀山景区','南宁市青秀区凤岭南路6号',20,'AAAAA','2025-08-15 09:30:00','含景区观光车，需穿防晒衣物，山上有茶水供应','账号5','赵强','13877623455','已支付',35,8.0,'景色不错','已评价',NULL,NULL,'nanning_travel','南宁文旅集团有限公司'),(46,'2025-12-09 10:32:15','遇龙河景区','桂林市阳朔县白沙镇遇龙村',230,'AAAA','2025-08-18 10:00:00','计划乘坐遇龙河竹筏漂流，需穿防滑鞋，带防晒用品','账号6','韦丽','13877823456','已支付',36,8.0,'景色不错','已评价',NULL,NULL,'yangshuo_travel','阳朔遇龙河文旅运营公司'),(47,'2025-12-09 10:32:15','龙潭公园','柳州市鱼峰区龙潭路43号',0,'AAAA','2026-08-13 09:30:00','含侗族歌舞表演观赏，建议先逛镜湖，再看风雨桥','账号7','周健','13877123457','已支付',37,8.0,'景色不错','已评价',NULL,NULL,'liuzhou_travel','柳州文旅发展集团'),(48,'2025-12-09 10:32:15','通灵大峡谷','百色市靖西市湖润镇新灵村',115,'AAAA','2025-08-22 08:00:00','计划徒步游览峡谷，需穿舒适鞋子，带饮用水','账号8','吴丹','13877323458','已支付',38,8.0,'景色不错','已评价',NULL,NULL,'bose_travel','百色靖西文旅管理公司'),(1766479694978,'2025-12-23 08:48:14','漓江景区','桂林市阳朔县阳朔镇抗战路6号',210,'AAAAA','2025-12-23 16:48:13','','1','张三','18154541454','未支付',31,0.0,NULL,'待审核',NULL,'upload/1678358274781.jpg','nanning_travel','南宁文旅集团有限公司'),(1766479697964,'2025-12-23 08:48:17','漓江景区','桂林市阳朔县阳朔镇抗战路6号',210,'AAAAA','2025-12-23 16:48:16','','1','张三','18154541454','未支付',31,0.0,NULL,'待审核',NULL,'upload/1678358274781.jpg','nanning_travel','南宁文旅集团有限公司'),(1779183552755,'2026-05-19 09:39:12','漓江景区','桂林市阳朔县阳朔镇抗战路6号',210,'AAAAA','2026-05-20 00:00:00','','1','张三','18154541454','未支付',31,0.0,NULL,'待审核',NULL,'upload/1678358274781.jpg','nanning_travel','南宁文旅集团有限公司');
/*!40000 ALTER TABLE `ticketreserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (12,1678358276062,'1','users','用户','bd5b95ml6zxk17ncigxdzt7ny5clpv7y','2026-05-18 14:38:16','2026-05-19 10:37:56'),(13,21,'guide1','guide','导游','9rlek17pua444sdnejrc2crbkalhf4wl','2026-05-18 14:39:13','2026-05-24 09:30:36'),(14,1,'admin','admin','管理员','wrkhz2i5urstm61kqhtwo08mt9woq13z','2026-05-18 14:42:30','2026-05-24 10:59:32'),(15,18,'账号8','users','用户','s811ws7pmxqmv45zztrvba2dduod77t9','2026-05-19 06:16:19','2026-05-19 07:16:19'),(16,1779613742084,'shop1','merchant','商家','4dut7wop9n30xxob9aqkm4ja2g4vylt6','2026-05-24 09:10:50','2026-05-24 10:19:28'),(17,28,'hechi_travel','merchant','商家','phmlvjt7t4xzqm2ylvz3dxkihimiowo6','2026-05-24 09:13:53','2026-05-24 10:13:53'),(18,11,'账号1','users','用户','kpns8s66xe3xmy7o3pnmipy9jb7vpmqg','2026-05-24 09:17:20','2026-05-24 10:40:30');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourplan`
--

DROP TABLE IF EXISTS `tourplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourplan` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mudedi` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '目的地',
  `starttime` datetime DEFAULT NULL COMMENT '出发时间',
  `duration` int DEFAULT NULL COMMENT '预计天数',
  `route` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '旅游路线',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '规划内容',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1678358426135 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='旅游规划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourplan`
--

LOCK TABLES `tourplan` WRITE;
/*!40000 ALTER TABLE `tourplan` DISABLE KEYS */;
INSERT INTO `tourplan` VALUES (111,'2025-12-09 10:32:16','桂林+阳朔','2025-08-06 08:00:00',3,'D1：抵达桂林→象鼻山→两江四湖→椿记烧鹅晚餐→夜游两江四湖；D2：漓江竹筏（杨堤→兴坪）→十里画廊→阳朔西街夜游；D3：遇龙河漂流→银子岩→返回桂林','D1住宿推荐漓江大瀑布饭店，体验江景房；D2漓江竹筏建议选金龙号游船；阳朔住西街附近民宿，可免二次入园门票；推荐品尝桂林米粉、阳朔啤酒鱼、田螺酿','账号1','张三'),(112,'2025-12-09 10:32:16','北海银滩+涠洲岛','2025-08-12 08:00:00',2,'D1：北海银滩→侨港风情街→乘船赴涠洲岛→住涠洲岛；D2：涠洲岛鳄鱼山→天主教堂→石螺口海滩→返程北海','需提前预订船票与海岛民宿，涠洲岛船票150元/人；建议携带防晒用品；北海推荐品尝海鲜大餐、沙虫粥，现点现做','账号2','李四'),(113,'2025-12-09 10:32:16','龙脊梯田深度游','2025-08-18 08:00:00',3,'D1：抵达龙胜→平安寨梯田（09:30-11:30）→龙脊镇午餐→金坑大寨梯田（14:00-15:30）→住大寨；D2：大寨日出→千层天梯（09:00-11:00）→黄洛瑶寨长发村（14:00-15:30）→住平安寨；D3：平安寨七星伴月→返程桂林','龙脊梯田门票100元/人，需导游讲解更有意境；金坑大寨梯田秋季稻谷金黄，拍照效果佳；黄洛瑶寨需看瑶族歌舞表演；大寨晚餐推荐竹筒饭、酸肉，人均60元；景区间交通可租景区直通车（40元/天）','账号3','王五'),(114,'2025-12-09 10:32:16','南宁亲子游','2025-08-22 08:00:00',4,'D1：抵达南宁→南宁动物园（09:30-12:00，熊猫馆+海豚表演）→中山路美食街午餐→广西科技馆（14:30-16:30，免费，儿童互动展区）→住市区；D2：青秀山（09:00-11:00，儿童乐园）→广西民族博物馆（14:00-15:30，民族服饰体验）→住市区；D3：方特东盟神画（09:00-17:00，亲子互动表演）→住市区；D4：南宁海底世界（10:00-14:00，美人鱼表演）→返程','南宁动物园50元/人，儿童游乐区有过山车、旋转木马；广西科技馆周二至周日开放，需提前预约；青秀山门票20元/人，电瓶车50元/人；方特东盟神画有儿童喜欢的《伴你飞翔》表演；海底世界门票120元/人，美人鱼表演时间为11:00和15:00，提前占位','账号4','赵六'),(115,'2025-12-09 10:32:16','柳州文化休闲游','2025-08-25 08:00:00',3,'D1：抵达柳州→螺蛳粉小镇（09:30-11:30，螺蛳粉制作体验）→青云民生市场午餐→龙潭公园（14:00-15:30，侗族风雨桥）→住市区；D2：程阳八寨（09:00-11:00，侗族百家宴）→三江鼓楼（14:00-15:30，侗族歌舞）→住市区；D3：马鞍山（09:00-11:00，俯瞰柳州全景）→窑埠古镇（14:00-16:00，文创购物）→返程','螺蛳粉小镇免费，需预约，可体验螺蛳粉制作；程阳八寨门票100元/人，百家宴50元/人；龙潭公园免费，风雨桥拍照极佳；窑埠古镇有文创店铺，可买侗族饰品；马鞍山缆车30元/人，夜景绝美','账号5','孙七'),(116,'2025-12-09 10:32:16','巴马长寿村+凤山避暑游','2025-08-28 08:00:00',3,'D1：南宁→巴马长寿村（08:00-11:00，乘旅游大巴）→长寿村民宿入住→百魔洞（14:00-15:30）→长寿村晚餐→养生讲座（20:00-21:30）；D2：巴马长寿村日出（05:30-06:30）→盘阳河漂流（09:00-11:30）→民宿午餐→凤山三门海（14:00-15:30，乘船游览）→住凤山；D3：凤山鸳鸯洞（09:00-10:00）→返程南宁（11:00-12:30）','巴马长寿村民宿选长寿老人附近，夏季气温22-28℃，需带薄外套；百魔洞门票80元/人，地磁区适合养生；盘阳河漂流120元/人，水质清澈；三门海乘船60元/人，可看天窗奇观；凤山夏季避暑胜地，平均气温25℃','账号6','周八'),(117,'2025-12-09 10:32:16','崇左短线休闲游','2025-09-01 08:00:00',2,'D1：抵达崇左→德天瀑布（09:30-10:30）→中越边境公路（11:00-12:00）→明仕田园午餐→明仕田园竹筏（14:00-15:30）→住明仕；D2：花山岩画（09:00-11:00，小游船）→友谊关午餐→返程崇左','德天瀑布门票80元/人，观光车35元/人；明仕田园竹筏120元/人，《花千骨》取景地；花山岩画游船190元/人，世界文化遗产；友谊关门票50元/人，中越边境地标；适合时间紧张的游客，行程轻松不赶','账号7','吴九'),(118,'2025-12-09 10:32:16','涠洲岛+北海老街游','2025-09-05 08:00:00',2,'D1：抵达北海→北海老街（09:30-11:00）→侨港海滩午餐→乘船赴涠洲岛（14:00-17:00，鳄鱼山）→涠洲岛夜景→住涠洲岛；D2：涠洲岛→天主教堂（09:00-11:00）→贝壳沙滩午餐→滴水丹屏（14:00-15:00）→返程北海','北海老街免费，百年骑楼建筑；涠洲岛船票+门票240元/人；天主教堂门票10元/人，法式建筑特色鲜明；贝壳沙滩适合赶海；滴水丹屏日落绝美；推荐品尝海鲜烧烤、糖水','账号8','郑十'),(1678358426134,'2025-12-09 10:40:26','桂林+阳朔3日家庭游','2025-07-30 08:00:00',5,'D1：抵达桂林→住桂林漓江大瀑布饭店→象鼻山（10:00-11:30）→酒店午餐→东西巷（15:00-16:30）→阿甘酒家晚餐；D2：桂林→阳朔（09:00-11:30，自驾）→漓江游船（14:00-17:30）→住阳朔；D3：遇龙河漂流（10:00-13:00）→阳朔西街晚餐；D4：阳朔→桂林（09:00-11:30）→融创乐园（14:00-17:00）→住桂林；D5：桂林两江四湖（09:00-14:00）→返程','<p>家庭游行程宽松，每天只安排2-3个景点，避免孩子疲劳；D1酒店选江景房，孩子喜欢湖边散步；D2漓江游船选家庭座位，空间大；阳朔推荐品尝啤酒鱼，适合儿童口味；D3融创乐园有儿童互动环节，孩子参与度高；D4两江四湖可乘船游览，景色优美；D5返程前可购买桂花糕作为手信</p>','111','张三');
/*!40000 ALTER TABLE `tourplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trafficroute`
--

DROP TABLE IF EXISTS `trafficroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trafficroute` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `trafficname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '路线名称',
  `traffictype` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '路线类型',
  `origin` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '始发地',
  `destination` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '终点地',
  `distance` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '全程距离',
  `trafficcontent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '路线详情',
  `trafficphoto` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '路线图片',
  `content` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '路线简介',
  `guideid` bigint DEFAULT NULL COMMENT '导游ID',
  `guideusername` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '导游账号',
  `guidename` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '导游姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='交通路线';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trafficroute`
--

LOCK TABLES `trafficroute` WRITE;
/*!40000 ALTER TABLE `trafficroute` DISABLE KEYS */;
INSERT INTO `trafficroute` VALUES (91,'2025-12-09 10:32:15','济南站-大明湖-趵突泉 泉城观光专线','景区接驳车','济南火车站','趵突泉东门','约8公里','<p>专线连接济南核心景点，途径大明湖、芙蓉街、泉城广场。每15分钟一班，是游客游览市区的首选方式。</p>','upload/traffic1.jpg','泉城游览首选，直达各大核心景点。',21,'guide1','王导游'),(92,'2025-12-09 10:32:15','济南西站-经十路-千佛山 旅游快线','公交出行','济南西站','千佛山风景区','约15公里','<p>从高铁站直达南部景区，全程走经十路，线路快捷。运营时间：06:00-21:00。</p>','upload/traffic2.jpg','高铁站直达景区，高效便捷。',22,'guide2','李导游'),(93,'2025-12-09 10:32:15','济南市区-红叶谷 自驾路线','自驾路线','济南市区','红叶谷景区','约30公里','<p>沿省道103线向南行驶，沿途风景优美，路况良好。秋季红叶满山时是最佳自驾时段。</p>','upload/traffic3.jpg','适合周末家庭出游，感受自然风光。',21,'guide1','王导游');
/*!40000 ALTER TABLE `trafficroute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelguide`
--

DROP TABLE IF EXISTS `travelguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelguide` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '标题',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '旅行地点',
  `traveltype` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '旅行类型',
  `duration` int DEFAULT NULL COMMENT '旅行天数',
  `introduction` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '旅行内容',
  `travelphoto` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '旅行图片',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '账号',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '姓名',
  `thumbsupnum` int DEFAULT '0' COMMENT '赞',
  `crazilynum` int DEFAULT '0' COMMENT '踩',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='旅游攻略';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelguide`
--

LOCK TABLES `travelguide` WRITE;
/*!40000 ALTER TABLE `travelguide` DISABLE KEYS */;
INSERT INTO `travelguide` VALUES (101,'2025-12-09 10:32:15','济南泉水文化2日深度游','济南市','泉水文化',2,'D1：趵突泉→五龙潭→大明湖。D2：黑虎泉→解放阁→芙蓉街。带你领略“天下第一泉”的魅力。','upload/guide1.jpg','admin','管理员',50,2,'深度体验泉城特色文化。'),(102,'2025-12-09 10:32:15','老济南慢生活·漫步古街','济南老城区','都市漫步',1,'漫步曲水亭街、后宰门街，感受“家家泉水，户户垂柳”的老济南韵味。','upload/guide2.jpg','admin','管理员',30,1,'适合寻找老城记忆的旅行者。');
/*!40000 ALTER TABLE `travelguide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓名',
  `gender` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '性别',
  `age` int DEFAULT NULL COMMENT '年龄',
  `telephone` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机',
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1678358276063 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'2025-12-09 10:32:15','账号1','123456','李伟','男',32,'13877123451','upload/users1.jpg'),(12,'2025-12-09 10:32:15','账号2','123456','陈芳','女',28,'13877323452','upload/users2.jpg'),(13,'2025-12-09 10:32:15','账号3','123456','黄明','男',45,'13877223453','upload/users3.jpg'),(14,'2025-12-09 10:32:15','账号4','123456','杨丽','女',36,'13877923454','upload/users4.jpg'),(15,'2025-12-09 10:32:15','账号5','123456','赵强','男',29,'13877623455','upload/users5.jpg'),(16,'2025-12-09 10:32:15','账号6','123456','韦丽','女',33,'13877823456','upload/users6.jpg'),(17,'2025-12-09 10:32:15','账号7','123456','周健','男',41,'13877123457','upload/users7.jpg'),(18,'2025-12-09 10:32:15','账号8','123456','吴丹','女',27,'13877323458','upload/users8.jpg'),(1678358276062,'2025-12-09 10:37:56','1','1','张三','女',25,'18154541454','upload/1678358274781.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `city` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '城市',
  `picture` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '封面',
  `weather` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '天气',
  `temp` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '气温',
  `wet` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '湿度',
  `wind` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '风向',
  `windspeed` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '风速',
  `outdoor` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '适宜出行',
  `clothing` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '穿衣推荐',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='天气预报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (21,'2025-12-09 10:32:15','济南','upload/weather1.jpg','晴','22℃','40%','北风','3级','适宜','泉城游览好时节，建议户外活动。','2025-12-09 18:32:15');
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 20:41:02
