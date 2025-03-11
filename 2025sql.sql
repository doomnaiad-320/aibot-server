-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: ai_howlife_cc
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `la_admin`
--

DROP TABLE IF EXISTS `la_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `root` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否超级管理员 0-否 1-是',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `login_time` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(39) DEFAULT '' COMMENT '最后登录ip',
  `multipoint_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否支持多处登录：1-是；0-否；',
  `disable` tinyint(1) unsigned DEFAULT '0' COMMENT '是否禁用：0-否；1-是；',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_admin`
--

LOCK TABLES `la_admin` WRITE;
/*!40000 ALTER TABLE `la_admin` DISABLE KEYS */;
INSERT INTO `la_admin` VALUES (1,1,'admin','','admin','44f90f2fd5d74697ae4208cf5153b274',1741163705,'140.250.132.18',1,0,1741134431,1741163705,NULL);
/*!40000 ALTER TABLE `la_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_admin_dept`
--

DROP TABLE IF EXISTS `la_admin_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_admin_dept` (
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `dept_id` int(10) NOT NULL DEFAULT '0' COMMENT '部门id',
  PRIMARY KEY (`admin_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_admin_dept`
--

LOCK TABLES `la_admin_dept` WRITE;
/*!40000 ALTER TABLE `la_admin_dept` DISABLE KEYS */;
INSERT INTO `la_admin_dept` VALUES (1,1);
/*!40000 ALTER TABLE `la_admin_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_admin_jobs`
--

DROP TABLE IF EXISTS `la_admin_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_admin_jobs` (
  `admin_id` int(10) NOT NULL COMMENT '管理员id',
  `jobs_id` int(10) NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`admin_id`,`jobs_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_admin_jobs`
--

LOCK TABLES `la_admin_jobs` WRITE;
/*!40000 ALTER TABLE `la_admin_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_admin_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_admin_role`
--

DROP TABLE IF EXISTS `la_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_admin_role` (
  `admin_id` int(10) NOT NULL COMMENT '管理员id',
  `role_id` int(10) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`admin_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_admin_role`
--

LOCK TABLES `la_admin_role` WRITE;
/*!40000 ALTER TABLE `la_admin_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_admin_session`
--

DROP TABLE IF EXISTS `la_admin_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_admin_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `terminal` tinyint(1) NOT NULL DEFAULT '1' COMMENT '客户端类型：1-pc管理后台 2-mobile手机管理后台',
  `token` varchar(32) NOT NULL COMMENT '令牌',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `expire_time` int(10) NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_id_client` (`admin_id`,`terminal`) USING BTREE COMMENT '一个用户在一个终端只有一个token',
  UNIQUE KEY `token` (`token`) USING BTREE COMMENT 'token是唯一的'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员会话表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_admin_session`
--

LOCK TABLES `la_admin_session` WRITE;
/*!40000 ALTER TABLE `la_admin_session` DISABLE KEYS */;
INSERT INTO `la_admin_session` VALUES (1,1,1,'5d7bcb28f28c57a724787026e878c2c1',1741163705,1741192505);
/*!40000 ALTER TABLE `la_admin_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_article`
--

DROP TABLE IF EXISTS `la_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `cid` int(11) NOT NULL COMMENT '文章分类',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `desc` varchar(255) DEFAULT '' COMMENT '简介',
  `abstract` text COMMENT '文章摘要',
  `image` varchar(128) DEFAULT NULL COMMENT '文章图片',
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `content` text COMMENT '文章内容',
  `click_virtual` int(10) DEFAULT '0' COMMENT '虚拟浏览量',
  `click_actual` int(11) DEFAULT '0' COMMENT '实际浏览量',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示:1-是.0-否',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_article`
--

LOCK TABLES `la_article` WRITE;
/*!40000 ALTER TABLE `la_article` DISABLE KEYS */;
INSERT INTO `la_article` VALUES (1,3,'让生活更精致！五款居家好物推荐，实用性超高','##好物推荐🔥','随着当代生活节奏的忙碌，很多人在闲暇之余都想好好的享受生活。随着科技的发展，也出现了越来越多可以帮助我们提升幸福感，让生活变得更精致的产品，下面周周就给大家盘点五款居家必备的好物，都是实用性很高的产品，周周可以保证大家买了肯定会喜欢。','resource/image/adminapi/default/article01.png','红花','<p>拥有一台投影仪，闲暇时可以在家里直接看影院级别的大片，光是想想都觉得超级爽。市面上很多投影仪大几千，其实周周觉得没必要，选泰捷这款一千多的足够了，性价比非常高。</p><p>泰捷的专业度很高，在电视TV领域研发已经十年，有诸多专利和技术创新，荣获国内外多项技术奖项，拿下了腾讯创新工场投资，打造的泰捷视频TV端和泰捷电视盒子都获得了极高评价。</p><p>这款投影仪的分辨率在3000元内无敌，做到了真1080P高分辨率，也就是跟市场售价三千DLP投影仪一样的分辨率，真正做到了分毫毕现，像桌布的花纹、天空的云彩等，这些细节都清晰可见。</p><p>亮度方面，泰捷达到了850ANSI流明，同价位一般是200ANSI。这是因为泰捷为了提升亮度和LCD技术透射率低的问题，首创高功率LED灯源，让其亮度做到同价位最好。专业媒体也进行了多次对比，效果与3000元价位投影仪相当。</p><p>操作系统周周也很喜欢，完全不卡。泰捷作为资深音视频品牌，在系统优化方面有十年的研发经验，打造出的“零极”系统是业内公认效率最高、速度最快的系统，用户也评价它流畅度能一台顶三台，而且为了解决行业广告多这一痛点，系统内不植入任何广告。</p>',1,2,1,0,1663317759,1727070911,NULL),(2,2,'埋葬UI设计师的坟墓不是内卷，而是免费模式','','本文从另外一个角度，聊聊作者对UI设计师职业发展前景的担忧，欢迎从事UI设计的同学来参与讨论，会有赠书哦','resource/image/adminapi/default/article02.jpeg','小明','<p><br></p><p style=\"text-align: justify;\">一个职业，卷，根本就没什么大不了的，尤其是成熟且收入高的职业，不卷才不符合事物发展的规律。何况 UI 设计师的人力市场到今天也和 5 年前一样，还是停留在大型菜鸡互啄的场面。远不能和医疗、证券、教师或者演艺练习生相提并论。</p><p style=\"text-align: justify;\">真正会让我对UI设计师发展前景觉得悲观的事情就只有一件 —— 国内的互联网产品免费机制。这也是一个我一直以来想讨论的话题，就在这次写一写。</p><p style=\"text-align: justify;\">国内互联网市场的发展，是一部浩瀚的 “免费经济” 发展史。虽然今天免费已经是深入国内民众骨髓的认知，但最早的中文互联网也是需要付费的，网游也都是要花钱的。</p><p style=\"text-align: justify;\">只是自有国情在此，付费确实阻碍了互联网行业的扩张和普及，一批创业家就开始通过免费的模式为用户提供服务，从而扩大了自己的产品覆盖面和普及程度。</p><p style=\"text-align: justify;\">印象最深的就是免费急先锋周鸿祎，和现在鲜少出现在公众视野不同，一零年前他是当之无愧的互联网教主，因为他开发出了符合中国国情的互联网产品 “打法”，让 360 的发展如日中天。</p><p style=\"text-align: justify;\">就是他在自传中提到：</p><p style=\"text-align: justify;\">只要是在互联网上每个人都需要的服务，我们就认为它是基础服务，基础服务一定是免费的，这样的话不会形成价值歧视。就是说，只要这种服务是每个人都一定要用的，我一定免费提供，而且是无条件免费。增值服务不是所有人都需要的，这个比例可能会相当低，它只是百分之几甚至更少比例的人需要，所以这种服务一定要收费……</p><p style=\"text-align: justify;\">这就是互联网的游戏规则，它决定了要想建立一个有效的商业模式，就一定要有海量的用户基数……</p>',2,4,1,0,1663322854,1727071178,NULL),(3,1,'金山电池公布“沪广深市民绿色生活方式”调查结果','','60%以上受访者认为高质量的10分钟足以完成“自我充电”','resource/image/adminapi/default/article03.png','中网资讯科技','<p style=\"text-align: left;\"><strong>深圳，2021年10月22日）</strong>生活在一线城市的沪广深市民一向以效率见称，工作繁忙和快节奏的生活容易缺乏充足的休息。近日，一项针对沪广深市民绿色生活方式而展开的网络问卷调查引起了大家的注意。问卷的问题设定集中于市民对休息时间的看法，以及从对循环充电电池的使用方面了解其对绿色生活方式的态度。该调查采用随机抽样的模式，并对最终收集的1,500份有效问卷进行专业分析后发现，超过60%的受访者表示，在每天的工作时段能拥有10分钟高质量的休息时间，就可以高效“自我充电”。该调查结果反映出，在快节奏时代下，人们需要高质量的休息时间，也要学会利用高效率的休息方式和工具来应对快节奏的生活，以时刻保持“满电”状态。</p><p style=\"text-align: left;\">　　<strong>60%以上受访者认为高质量的10分钟足以完成“自我充电”</strong></p><p style=\"text-align: left;\">　　这次调查超过1,500人，主要聚焦18至85岁的沪广深市民，了解他们对于休息时间的观念及使用充电电池的习惯，结果发现：</p><p style=\"text-align: left;\">　　· 90%以上有工作受访者每天工作时间在7小时以上，平均工作时间为8小时，其中43%以上的受访者工作时间超过9小时</p><p style=\"text-align: left;\">　　· 70%受访者认为在工作期间拥有10分钟“自我充电”时间不是一件困难的事情</p><p style=\"text-align: left;\">　　· 60%受访者认为在工作期间有10分钟休息时间足以为自己快速充电</p><p style=\"text-align: left;\">　　临床心理学家黄咏诗女士在发布会上分享为自己快速充电的实用技巧，她表示：“事实上，只要选择正确的休息方法，10分钟也足以为自己充电。以喝咖啡为例，我们可以使用心灵休息法 ── 静观呼吸，慢慢感受咖啡的温度和气味，如果能配合着聆听流水或海洋的声音，能够有效放松大脑及心灵。”</p><p style=\"text-align: left;\">　　这次调查结果反映出沪广深市民的希望在繁忙的工作中适时停下来，抽出10分钟喝杯咖啡、聆听音乐或小睡片刻，为自己充电。金山电池全新推出的“绿再十分充”超快速充电器仅需10分钟就能充好电，喝一杯咖啡的时间既能完成“自我充电”，也满足设备使用的用电需求，为提升工作效率和放松身心注入新能量。</p><p style=\"text-align: left;\">　　<strong>金山电池推出10分钟超快电池充电器*绿再十分充，以创新科技为市场带来革新体验</strong></p><p style=\"text-align: left;\">　　该问卷同时从沪广深市民对循环充电电池的使用方面进行了调查，以了解其对绿色生活方式的态度：</p><p style=\"text-align: left;\">　　· 87%受访者目前没有使用充电电池，其中61%表示会考虑使用充电电池</p><p style=\"text-align: left;\">　　· 58%受访者过往曾使用过充电电池，却只有20%左右市民仍在使用</p><p style=\"text-align: left;\">　　· 60%左右受访者认为充电电池尚未被广泛使用，主要障碍来自于充电时间过长、缺乏相关教育</p><p style=\"text-align: left;\">　　· 90%以上受访者认为充电电池充满电需要1小时或更长的时间</p><p style=\"text-align: left;\">　　金山电池一直致力于为大众提供安全可靠的充电电池，并与消费者的需求和生活方式一起演变及进步。今天，金山电池宣布推出10分钟超快电池充电器*绿再十分充，只需10分钟*即可将4粒绿再十分充充电电池充好电，充电速度比其他品牌提升3倍**。充电器的LED灯可以显示每粒电池的充电状态和模式，并提示用户是否错误插入已损坏电池或一次性电池。尽管其体型小巧，却具备多项创新科技 ，如拥有独特的充电算法以优化充电电流，并能根据各个电池类型、状况和温度用最短的时间为充电电池充好电;绿再十分充内置横流扇，有效防止电池温度过热和提供低噪音的充电环境等。<br></p>',11,4,1,0,1663322665,1727071154,NULL);
/*!40000 ALTER TABLE `la_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_article_cate`
--

DROP TABLE IF EXISTS `la_article_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `name` varchar(90) DEFAULT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示:1-是;0-否',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_article_cate`
--

LOCK TABLES `la_article_cate` WRITE;
/*!40000 ALTER TABLE `la_article_cate` DISABLE KEYS */;
INSERT INTO `la_article_cate` VALUES (1,'科技',0,1,1663317280,1663317280,NULL),(2,'生活',0,1,1663317280,1663321464,NULL),(3,'好物',0,1,1727070858,1727070858,NULL);
/*!40000 ALTER TABLE `la_article_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_article_collect`
--

DROP TABLE IF EXISTS `la_article_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_article_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '收藏状态 0-未收藏 1-已收藏',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_article_collect`
--

LOCK TABLES `la_article_collect` WRITE;
/*!40000 ALTER TABLE `la_article_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_article_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_config`
--

DROP TABLE IF EXISTS `la_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL COMMENT '类型',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text COMMENT '值',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_config`
--

LOCK TABLES `la_config` WRITE;
/*!40000 ALTER TABLE `la_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_decorate_page`
--

DROP TABLE IF EXISTS `la_decorate_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_decorate_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '页面类型 1=商城首页, 2=个人中心, 3=客服设置 4-PC首页',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '页面名称',
  `data` text COMMENT '页面数据',
  `meta` text COMMENT '页面设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='装修页面配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_decorate_page`
--

LOCK TABLES `la_decorate_page` WRITE;
/*!40000 ALTER TABLE `la_decorate_page` DISABLE KEYS */;
INSERT INTO `la_decorate_page` VALUES (1,1,'商城首页','[{\"title\":\"搜索\",\"name\":\"search\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"首页轮播图\",\"name\":\"banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/resource/image/adminapi/default/banner001.png\",\"name\":\"\",\"link\":{\"id\":6,\"name\":\"来自瓷器的爱\",\"path\":\"/pages/news_detail/news_detail\",\"query\":{\"id\":6},\"type\":\"article\"},\"is_show\":\"1\",\"bg\":\"/resource/image/adminapi/default/banner001_bg.png\"},{\"image\":\"/resource/image/adminapi/default/banner002.png\",\"name\":\"\",\"link\":{\"id\":3,\"name\":\"金山电池公布“沪广深市民绿色生活方式”调查结果\",\"path\":\"/pages/news_detail/news_detail\",\"query\":{\"id\":3},\"type\":\"article\"},\"is_show\":\"1\",\"bg\":\"/resource/image/adminapi/default/banner002_bg.png\"},{\"is_show\":\"1\",\"image\":\"/resource/image/adminapi/default/banner003.png\",\"name\":\"\",\"link\":{\"id\":1,\"name\":\"让生活更精致！五款居家好物推荐，实用性超高\",\"path\":\"/pages/news_detail/news_detail\",\"query\":{\"id\":1},\"type\":\"article\"},\"bg\":\"/resource/image/adminapi/default/banner003_bg.png\"}],\"style\":1,\"bg_style\":1},\"styles\":{}},{\"title\":\"导航菜单\",\"name\":\"nav\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/resource/image/adminapi/default/nav01.png\",\"name\":\"资讯中心\",\"link\":{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\",\"canTab\":true},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/nav03.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/nav02.png\",\"name\":\"我的收藏\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/nav05.png\",\"name\":\"关于我们\",\"link\":{\"path\":\"/pages/as_us/as_us\",\"name\":\"关于我们\",\"type\":\"shop\"},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/nav04.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"},\"is_show\":\"1\"}],\"style\":2,\"per_line\":5,\"show_line\":2},\"styles\":{}},{\"title\":\"首页中部轮播图\",\"name\":\"middle-banner\",\"content\":{\"enabled\":1,\"data\":[{\"is_show\":\"1\",\"image\":\"/resource/image/adminapi/default/index_ad01.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/agreement/agreement\",\"name\":\"隐私政策\",\"query\":{\"type\":\"privacy\"},\"type\":\"shop\"}}]},\"styles\":{}},{\"id\":\"l84almsk2uhyf\",\"title\":\"资讯\",\"name\":\"news\",\"disabled\":1,\"content\":{},\"styles\":{}}]','[{\"title\":\"页面设置\",\"name\":\"page-meta\",\"content\":{\"title\":\"首页\",\"bg_type\":\"2\",\"bg_color\":\"#2F80ED\",\"bg_image\":\"/resource/image/adminapi/default/page_meta_bg01.png\",\"text_color\":\"2\",\"title_type\":\"2\",\"title_img\":\"/resource/image/adminapi/default/page_mate_title.png\"},\"styles\":{}}]',1661757188,1710989700),(2,2,'个人中心','[{\"title\":\"用户信息\",\"name\":\"user-info\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"我的服务\",\"name\":\"my-service\",\"content\":{\"style\":1,\"title\":\"我的服务\",\"data\":[{\"image\":\"/resource/image/adminapi/default/user_collect.png\",\"name\":\"我的收藏\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/user_setting.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/user_kefu.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/wallet.png\",\"name\":\"我的钱包\",\"link\":{\"path\":\"/packages/pages/user_wallet/user_wallet\",\"name\":\"我的钱包\",\"type\":\"shop\"},\"is_show\":\"1\"}],\"enabled\":1},\"styles\":{}},{\"title\":\"个人中心广告图\",\"name\":\"user-banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/resource/image/adminapi/default/user_ad01.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"},\"is_show\":\"1\"},{\"image\":\"/resource/image/adminapi/default/user_ad02.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"},\"is_show\":\"1\"}]},\"styles\":{}}]','[{\"title\":\"页面设置\",\"name\":\"page-meta\",\"content\":{\"title\":\"个人中心\",\"bg_type\":\"1\",\"bg_color\":\"#2F80ED\",\"bg_image\":\"\",\"text_color\":\"1\",\"title_type\":\"2\",\"title_img\":\"/resource/image/adminapi/default/page_mate_title.png\"},\"styles\":{}}]',1661757188,1710933097),(3,3,'客服设置','[{\"title\":\"客服设置\",\"name\":\"customer-service\",\"content\":{\"title\":\"添加客服二维码\",\"time\":\"早上 9:30 - 19:00\",\"mobile\":\"18578768757\",\"qrcode\":\"/resource/image/adminapi/default/kefu01.png\",\"remark\":\"长按添加客服或拨打客服热线\"},\"styles\":{}}]','',1661757188,1710929953),(4,4,'PC设置','[{\"id\":\"lajcn8d0hzhed\",\"title\":\"首页轮播图\",\"name\":\"pc-banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/resource/image/adminapi/default/banner003.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/banner002.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/banner001.png\",\"name\":\"\",\"link\":{}}]},\"styles\":{\"position\":\"absolute\",\"left\":\"40\",\"top\":\"75px\",\"width\":\"750px\",\"height\":\"340px\"}}]','',1661757188,1710990175),(5,5,'系统风格','{\"themeColorId\":3,\"topTextColor\":\"white\",\"navigationBarColor\":\"#A74BFD\",\"themeColor1\":\"#A74BFD\",\"themeColor2\":\"#CB60FF\",\"buttonColor\":\"white\"}','',1710410915,1710990415);
/*!40000 ALTER TABLE `la_decorate_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_decorate_tabbar`
--

DROP TABLE IF EXISTS `la_decorate_tabbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_decorate_tabbar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '导航名称',
  `selected` varchar(200) NOT NULL DEFAULT '' COMMENT '未选图标',
  `unselected` varchar(200) NOT NULL DEFAULT '' COMMENT '已选图标',
  `link` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `is_show` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='装修底部导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_decorate_tabbar`
--

LOCK TABLES `la_decorate_tabbar` WRITE;
/*!40000 ALTER TABLE `la_decorate_tabbar` DISABLE KEYS */;
INSERT INTO `la_decorate_tabbar` VALUES (1,'首页','resource/image/adminapi/default/tabbar_home_sel.png','resource/image/adminapi/default/tabbar_home.png','{\"path\":\"/pages/index/index\",\"name\":\"商城首页\",\"type\":\"shop\"}',1,1662688157,1662688157),(2,'资讯','resource/image/adminapi/default/tabbar_text_sel.png','resource/image/adminapi/default/tabbar_text.png','{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\",\"canTab\":\"1\"}',1,1662688157,1662688157),(3,'我的','resource/image/adminapi/default/tabbar_me_sel.png','resource/image/adminapi/default/tabbar_me.png','{\"path\":\"/pages/user/user\",\"name\":\"个人中心\",\"type\":\"shop\",\"canTab\":\"1\"}',1,1662688157,1662688157);
/*!40000 ALTER TABLE `la_decorate_tabbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_dept`
--

DROP TABLE IF EXISTS `la_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '部门名称',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级部门id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `leader` varchar(64) DEFAULT NULL COMMENT '负责人',
  `mobile` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '部门状态（0停用 1正常）',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_dept`
--

LOCK TABLES `la_dept` WRITE;
/*!40000 ALTER TABLE `la_dept` DISABLE KEYS */;
INSERT INTO `la_dept` VALUES (1,'公司',0,0,'boss','12345698745',1,1650592684,1653640368,NULL);
/*!40000 ALTER TABLE `la_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_dev_crontab`
--

DROP TABLE IF EXISTS `la_dev_crontab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_dev_crontab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '定时任务名称',
  `type` tinyint(1) NOT NULL COMMENT '类型 1-定时任务',
  `system` tinyint(4) DEFAULT '0' COMMENT '是否系统任务 0-否 1-是',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `command` varchar(64) NOT NULL COMMENT '命令内容',
  `params` varchar(64) DEFAULT '' COMMENT '参数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1-运行 2-停止 3-错误',
  `expression` varchar(64) NOT NULL COMMENT '运行规则',
  `error` varchar(256) DEFAULT NULL COMMENT '运行失败原因',
  `last_time` int(11) DEFAULT NULL COMMENT '最后执行时间',
  `time` varchar(64) DEFAULT '0' COMMENT '实时执行时长',
  `max_time` varchar(64) DEFAULT '0' COMMENT '最大执行时长',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='计划任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_dev_crontab`
--

LOCK TABLES `la_dev_crontab` WRITE;
/*!40000 ALTER TABLE `la_dev_crontab` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_dev_crontab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_dev_pay_config`
--

DROP TABLE IF EXISTS `la_dev_pay_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_dev_pay_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模版名称',
  `pay_way` tinyint(1) NOT NULL COMMENT '支付方式:1-余额支付;2-微信支付;3-支付宝支付;',
  `config` text COMMENT '对应支付配置(json字符串)',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_dev_pay_config`
--

LOCK TABLES `la_dev_pay_config` WRITE;
/*!40000 ALTER TABLE `la_dev_pay_config` DISABLE KEYS */;
INSERT INTO `la_dev_pay_config` VALUES (1,'余额支付',1,'','/resource/image/adminapi/default/balance_pay.png',128,'余额支付备注'),(2,'微信支付',2,'{\"interface_version\":\"v3\",\"merchant_type\":\"ordinary_merchant\",\"mch_id\":\"\",\"pay_sign_key\":\"\",\"apiclient_cert\":\"\",\"apiclient_key\":\"\"}','/resource/image/adminapi/default/wechat_pay.png',123,'微信支付备注'),(3,'支付宝支付',3,'{\"mode\":\"normal_mode\",\"merchant_type\":\"ordinary_merchant\",\"app_id\":\"\",\"private_key\":\"\",\"ali_public_key\":\"\"}','/resource/image/adminapi/default/ali_pay.png',123,'支付宝支付');
/*!40000 ALTER TABLE `la_dev_pay_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_dev_pay_way`
--

DROP TABLE IF EXISTS `la_dev_pay_way`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_dev_pay_way` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_config_id` int(11) NOT NULL COMMENT '支付配置ID',
  `scene` tinyint(1) NOT NULL COMMENT '场景:1-微信小程序;2-微信公众号;3-H5;4-PC;5-APP;',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认支付:0-否;1-是;',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:0-关闭;1-开启;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_dev_pay_way`
--

LOCK TABLES `la_dev_pay_way` WRITE;
/*!40000 ALTER TABLE `la_dev_pay_way` DISABLE KEYS */;
INSERT INTO `la_dev_pay_way` VALUES (1,1,1,0,1),(2,2,1,1,1),(3,1,2,0,1),(4,2,2,1,1),(5,1,3,0,1),(6,2,3,1,1),(7,3,3,0,1);
/*!40000 ALTER TABLE `la_dev_pay_way` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_dict_data`
--

DROP TABLE IF EXISTS `la_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_dict_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '数据名称',
  `value` varchar(255) NOT NULL COMMENT '数据值',
  `type_id` int(11) NOT NULL COMMENT '字典类型id',
  `type_value` varchar(255) NOT NULL COMMENT '字典类型',
  `sort` int(10) DEFAULT '0' COMMENT '排序值',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-停用 1-正常',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_dict_data`
--

LOCK TABLES `la_dict_data` WRITE;
/*!40000 ALTER TABLE `la_dict_data` DISABLE KEYS */;
INSERT INTO `la_dict_data` VALUES (1,'隐藏','0',1,'show_status',0,1,'',1656381543,1656381543,NULL),(2,'显示','1',1,'show_status',0,1,'',1656381550,1656381550,NULL),(3,'进行中','0',2,'business_status',0,1,'',1656381410,1656381410,NULL),(4,'成功','1',2,'business_status',0,1,'',1656381437,1656381437,NULL),(5,'失败','2',2,'business_status',0,1,'',1656381449,1656381449,NULL),(6,'待处理','0',3,'event_status',0,1,'',1656381212,1656381212,NULL),(7,'已处理','1',3,'event_status',0,1,'',1656381315,1656381315,NULL),(8,'拒绝处理','2',3,'event_status',0,1,'',1656381331,1656381331,NULL),(9,'禁用','1',4,'system_disable',0,1,'',1656312030,1656312030,NULL),(10,'正常','0',4,'system_disable',0,1,'',1656312040,1656312040,NULL),(11,'未知','0',5,'sex',0,1,'',1656062988,1656062988,NULL),(12,'男','1',5,'sex',0,1,'',1656062999,1656062999,NULL),(13,'女','2',5,'sex',0,1,'',1656063009,1656063009,NULL);
/*!40000 ALTER TABLE `la_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_dict_type`
--

DROP TABLE IF EXISTS `la_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_dict_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字典名称',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '字典类型名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-停用 1-正常',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_dict_type`
--

LOCK TABLES `la_dict_type` WRITE;
/*!40000 ALTER TABLE `la_dict_type` DISABLE KEYS */;
INSERT INTO `la_dict_type` VALUES (1,'显示状态','show_status',1,'',1656381520,1656381520,NULL),(2,'业务状态','business_status',1,'',1656381393,1656381393,NULL),(3,'事件状态','event_status',1,'',1656381075,1656381075,NULL),(4,'禁用状态','system_disable',1,'',1656311838,1656311838,NULL),(5,'用户性别','sex',1,'',1656062946,1656380925,NULL);
/*!40000 ALTER TABLE `la_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_file`
--

DROP TABLE IF EXISTS `la_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类目ID',
  `source_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传者id',
  `source` tinyint(1) NOT NULL DEFAULT '0' COMMENT '来源类型[0-后台,1-用户]',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '类型[10=图片, 20=视频]',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名称',
  `uri` varchar(200) NOT NULL COMMENT '文件路径',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_file`
--

LOCK TABLES `la_file` WRITE;
/*!40000 ALTER TABLE `la_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_file_cate`
--

DROP TABLE IF EXISTS `la_file_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_file_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '类型[10=图片，20=视频，30=文件]',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_file_cate`
--

LOCK TABLES `la_file_cate` WRITE;
/*!40000 ALTER TABLE `la_file_cate` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_file_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_generate_column`
--

DROP TABLE IF EXISTS `la_generate_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_generate_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_id` int(11) NOT NULL DEFAULT '0' COMMENT '表id',
  `column_name` varchar(100) NOT NULL DEFAULT '' COMMENT '字段名称',
  `column_comment` varchar(300) NOT NULL DEFAULT '' COMMENT '字段描述',
  `column_type` varchar(100) NOT NULL DEFAULT '' COMMENT '字段类型',
  `is_required` tinyint(1) DEFAULT '0' COMMENT '是否必填 0-非必填 1-必填',
  `is_pk` tinyint(1) DEFAULT '0' COMMENT '是否为主键 0-不是 1-是',
  `is_insert` tinyint(1) DEFAULT '0' COMMENT '是否为插入字段 0-不是 1-是',
  `is_update` tinyint(1) DEFAULT '0' COMMENT '是否为更新字段 0-不是 1-是',
  `is_lists` tinyint(1) DEFAULT '0' COMMENT '是否为列表字段 0-不是 1-是',
  `is_query` tinyint(1) DEFAULT '0' COMMENT '是否为查询字段 0-不是 1-是',
  `query_type` varchar(100) DEFAULT '=' COMMENT '查询类型',
  `view_type` varchar(100) DEFAULT 'input' COMMENT '显示类型',
  `dict_type` varchar(255) DEFAULT '' COMMENT '字典类型',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表字段信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_generate_column`
--

LOCK TABLES `la_generate_column` WRITE;
/*!40000 ALTER TABLE `la_generate_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_generate_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_generate_table`
--

DROP TABLE IF EXISTS `la_generate_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_generate_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_name` varchar(200) NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(300) NOT NULL DEFAULT '' COMMENT '表描述',
  `template_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模板类型 0-单表(curd) 1-树表(curd)',
  `author` varchar(100) DEFAULT '' COMMENT '作者',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `generate_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '生成方式  0-压缩包下载 1-生成到模块',
  `module_name` varchar(100) DEFAULT '' COMMENT '模块名',
  `class_dir` varchar(100) DEFAULT '' COMMENT '类目录名',
  `class_comment` varchar(100) DEFAULT '' COMMENT '类描述',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员id',
  `menu` text COMMENT '菜单配置',
  `delete` text COMMENT '删除配置',
  `tree` text COMMENT '树表配置',
  `relations` text COMMENT '关联配置',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_generate_table`
--

LOCK TABLES `la_generate_table` WRITE;
/*!40000 ALTER TABLE `la_generate_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_generate_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_hot_search`
--

DROP TABLE IF EXISTS `la_hot_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_hot_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '关键词',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='热门搜索表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_hot_search`
--

LOCK TABLES `la_hot_search` WRITE;
/*!40000 ALTER TABLE `la_hot_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_hot_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_jobs`
--

DROP TABLE IF EXISTS `la_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '岗位名称',
  `code` varchar(64) NOT NULL COMMENT '岗位编码',
  `sort` int(11) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0停用 1正常）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_jobs`
--

LOCK TABLES `la_jobs` WRITE;
/*!40000 ALTER TABLE `la_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_notice_record`
--

DROP TABLE IF EXISTS `la_notice_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_notice_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `scene_id` int(10) unsigned DEFAULT '0' COMMENT '场景',
  `read` tinyint(1) DEFAULT '0' COMMENT '已读状态;0-未读,1-已读',
  `recipient` tinyint(1) DEFAULT '0' COMMENT '通知接收对象类型;1-会员;2-商家;3-平台;4-游客(未注册用户)',
  `send_type` tinyint(1) DEFAULT '0' COMMENT '通知发送类型 1-系统通知 2-短信通知 3-微信模板 4-微信小程序',
  `notice_type` tinyint(1) DEFAULT NULL COMMENT '通知类型 1-业务通知 2-验证码',
  `extra` varchar(255) DEFAULT '' COMMENT '其他',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_notice_record`
--

LOCK TABLES `la_notice_record` WRITE;
/*!40000 ALTER TABLE `la_notice_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_notice_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_notice_setting`
--

DROP TABLE IF EXISTS `la_notice_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_notice_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scene_id` int(10) NOT NULL COMMENT '场景id',
  `scene_name` varchar(255) NOT NULL DEFAULT '' COMMENT '场景名称',
  `scene_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '场景描述',
  `recipient` tinyint(1) NOT NULL DEFAULT '1' COMMENT '接收者 1-用户 2-平台',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '通知类型: 1-业务通知 2-验证码',
  `system_notice` text COMMENT '系统通知设置',
  `sms_notice` text COMMENT '短信通知设置',
  `oa_notice` text COMMENT '公众号通知设置',
  `mnp_notice` text COMMENT '小程序通知设置',
  `support` char(10) NOT NULL DEFAULT '' COMMENT '支持的发送类型 1-系统通知 2-短信通知 3-微信模板消息 4-小程序提醒',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='通知设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_notice_setting`
--

LOCK TABLES `la_notice_setting` WRITE;
/*!40000 ALTER TABLE `la_notice_setting` DISABLE KEYS */;
INSERT INTO `la_notice_setting` VALUES (1,101,'登录验证码','用户手机号码登录时发送',1,2,'{\"type\":\"system\",\"title\":\"\",\"content\":\"\",\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\"]}','{\"type\":\"sms\",\"template_id\":\"SMS_123456\",\"content\":\"您正在登录，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"status\":\"1\",\"is_show\":\"1\"}','{\"type\":\"oa\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"first\":\"\",\"remark\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\",\"配置路径：小程序后台 > 功能 > 订阅消息\"]}','{\"type\":\"mnp\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\",\"配置路径：小程序后台 > 功能 > 订阅消息\"]}','2',NULL),(2,102,'绑定手机验证码','用户绑定手机号码时发送',1,2,'{\"type\":\"system\",\"title\":\"\",\"content\":\"\",\"status\":\"0\",\"is_show\":\"\"}','{\"type\":\"sms\",\"template_id\":\"SMS_123456\",\"content\":\"您正在绑定手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"status\":\"1\",\"is_show\":\"1\"}','{\"type\":\"oa\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"first\":\"\",\"remark\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\"}','{\"type\":\"mnp\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\"}','2',NULL),(3,103,'变更手机验证码','用户变更手机号码时发送',1,2,'{\"type\":\"system\",\"title\":\"\",\"content\":\"\",\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\"]}','{\"type\":\"sms\",\"template_id\":\"SMS_123456\",\"content\":\"您正在变更手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"status\":\"1\",\"is_show\":\"1\"}','{\"type\":\"oa\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"first\":\"\",\"remark\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\",\"配置路径：小程序后台 > 功能 > 订阅消息\"]}','{\"type\":\"mnp\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\",\"配置路径：小程序后台 > 功能 > 订阅消息\"]}','2',NULL),(4,104,'找回登录密码验证码','用户找回登录密码号码时发送',1,2,'{\"type\":\"system\",\"title\":\"\",\"content\":\"\",\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\"]}','{\"type\":\"sms\",\"template_id\":\"SMS_123456\",\"content\":\"您正在找回登录密码，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"status\":\"1\",\"is_show\":\"1\"}','{\"type\":\"oa\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"first\":\"\",\"remark\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\",\"配置路径：小程序后台 > 功能 > 订阅消息\"]}','{\"type\":\"mnp\",\"template_id\":\"\",\"template_sn\":\"\",\"name\":\"\",\"tpl\":[],\"status\":\"0\",\"is_show\":\"\",\"tips\":[\"可选变量 验证码:code\",\"配置路径：小程序后台 > 功能 > 订阅消息\"]}','2',NULL);
/*!40000 ALTER TABLE `la_notice_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_official_account_reply`
--

DROP TABLE IF EXISTS `la_official_account_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_official_account_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '规则名称',
  `keyword` varchar(64) NOT NULL DEFAULT '' COMMENT '关键词',
  `reply_type` tinyint(1) NOT NULL COMMENT '回复类型 1-关注回复 2-关键字回复 3-默认回复',
  `matching_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '匹配方式：1-全匹配；2-模糊匹配',
  `content_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '内容类型：1-文本',
  `content` text NOT NULL COMMENT '回复内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '启动状态：1-启动；0-关闭',
  `sort` int(11) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公众号消息回调表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_official_account_reply`
--

LOCK TABLES `la_official_account_reply` WRITE;
/*!40000 ALTER TABLE `la_official_account_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_official_account_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_operation_log`
--

DROP TABLE IF EXISTS `la_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员ID',
  `admin_name` varchar(16) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `account` varchar(16) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `action` varchar(64) DEFAULT '' COMMENT '操作名称',
  `type` varchar(8) NOT NULL COMMENT '请求方式',
  `url` varchar(600) NOT NULL COMMENT '访问链接',
  `params` text COMMENT '请求数据',
  `result` text COMMENT '请求结果',
  `ip` varchar(39) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_operation_log`
--

LOCK TABLES `la_operation_log` WRITE;
/*!40000 ALTER TABLE `la_operation_log` DISABLE KEYS */;
INSERT INTO `la_operation_log` VALUES (1,0,'','',' 基础配置','GET','http://ai.howlife.cc/adminapi/config/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"oss_domain\":\"http:\\/\\/ai.howlife.cc\\/\",\"web_name\":\"likeadmin\",\"web_favicon\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_favicon.ico\",\"web_logo\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_logo.jpg\",\"login_image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/login_image.png\",\"copyright_config\":[],\"version\":\"1.9.4\"}}','120.224.95.107',1741134442),(2,0,'','',' 基础配置','GET','http://ai.howlife.cc/adminapi/config/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"oss_domain\":\"http:\\/\\/ai.howlife.cc\\/\",\"web_name\":\"likeadmin\",\"web_favicon\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_favicon.ico\",\"web_logo\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_logo.jpg\",\"login_image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/login_image.png\",\"copyright_config\":[],\"version\":\"1.9.4\"}}','120.224.95.107',1741134442),(3,0,'','',' 账号登录','POST','http://ai.howlife.cc/adminapi/login/account','{\"account\":\"admin\",\"password\":\"******\",\"terminal\":\"1\"}','{\"code\":0,\"show\":1,\"msg\":\"密码错误\",\"data\":[]}','120.224.95.107',1741134447),(4,0,'','',' 账号登录','POST','http://ai.howlife.cc/adminapi/login/account','{\"account\":\"admin\",\"password\":\"******\",\"terminal\":\"1\"}','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"name\":\"admin\",\"avatar\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/avatar.png\",\"role_name\":\"系统管理员\",\"token\":\"e11b7b0149f21e0cf2a9e61f39b55c87\"}}','120.224.95.107',1741134453),(5,1,'admin','admin',' 获取当前管理员信息','GET','http://ai.howlife.cc/adminapi/auth.admin/mySelf','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"user\":{\"role_id\":[],\"dept_id\":[1],\"jobs_id\":[],\"id\":1,\"account\":\"admin\",\"name\":\"admin\",\"disable\":0,\"root\":1,\"multipoint_login\":1,\"avatar\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/avatar.png\"},\"menu\":[{\"id\":5,\"pid\":0,\"type\":\"C\",\"name\":\"工作台\",\"icon\":\"el-icon-Monitor\",\"sort\":1000,\"perms\":\"workbench\\/index\",\"paths\":\"workbench\",\"component\":\"workbench\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-01 16:39:53\",\"update_time\":\"2022-09-28 16:49:41\"},{\"id\":117,\"pid\":0,\"type\":\"M\",\"name\":\"用户管理\",\"icon\":\"el-icon-User\",\"sort\":900,\"perms\":\"\",\"paths\":\"consumer\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:39:11\",\"update_time\":\"2024-03-15 11:07:54\",\"children\":[{\"id\":118,\"pid\":117,\"type\":\"C\",\"name\":\"用户列表\",\"icon\":\"local-icon-user_guanli\",\"sort\":100,\"perms\":\"user.user\\/lists\",\"paths\":\"lists\",\"component\":\"consumer\\/lists\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:39:52\",\"update_time\":\"2024-03-15 11:04:05\"},{\"id\":119,\"pid\":117,\"type\":\"C\",\"name\":\"用户详情\",\"icon\":\"\",\"sort\":90,\"perms\":\"user.user\\/detail\",\"paths\":\"lists\\/detail\",\"component\":\"consumer\\/lists\\/detail\",\"selected\":\"\\/consumer\\/lists\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-09-23 11:41:10\",\"update_time\":\"2024-03-15 11:04:11\"}]},{\"id\":158,\"pid\":0,\"type\":\"M\",\"name\":\"应用管理\",\"icon\":\"el-icon-Postcard\",\"sort\":800,\"perms\":\"\",\"paths\":\"app\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 17:10:30\",\"update_time\":\"2024-03-15 11:07:59\",\"children\":[{\"id\":159,\"pid\":158,\"type\":\"C\",\"name\":\"用户充值\",\"icon\":\"local-icon-fukuan\",\"sort\":100,\"perms\":\"recharge.recharge\\/getConfig\",\"paths\":\"recharge\",\"component\":\"app\\/recharge\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 17:24:44\",\"update_time\":\"2024-03-15 11:04:20\"},{\"id\":70,\"pid\":158,\"type\":\"M\",\"name\":\"文章资讯\",\"icon\":\"el-icon-ChatLineSquare\",\"sort\":90,\"perms\":\"\",\"paths\":\"article\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 16:46:05\",\"update_time\":\"2024-03-15 11:04:27\",\"children\":[{\"id\":71,\"pid\":70,\"type\":\"C\",\"name\":\"文章管理\",\"icon\":\"el-icon-ChatDotSquare\",\"sort\":0,\"perms\":\"article.article\\/lists\",\"paths\":\"lists\",\"component\":\"article\\/lists\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 16:48:21\",\"update_time\":\"2022-09-28 16:43:35\"},{\"id\":72,\"pid\":70,\"type\":\"C\",\"name\":\"文章添加\\/编辑\",\"icon\":\"\",\"sort\":0,\"perms\":\"article.article\\/add:edit\",\"paths\":\"lists\\/edit\",\"component\":\"article\\/lists\\/edit\",\"selected\":\"\\/article\\/lists\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-09-21 16:49:13\",\"update_time\":\"2022-09-28 17:11:15\"},{\"id\":73,\"pid\":70,\"type\":\"C\",\"name\":\"文章栏目\",\"icon\":\"el-icon-CollectionTag\",\"sort\":0,\"perms\":\"article.articleCate\\/lists\",\"paths\":\"column\",\"component\":\"article\\/column\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":1,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 16:51:27\",\"update_time\":\"2022-09-28 16:44:38\"}]},{\"id\":101,\"pid\":158,\"type\":\"M\",\"name\":\"消息管理\",\"icon\":\"el-icon-ChatDotRound\",\"sort\":80,\"perms\":\"\",\"paths\":\"message\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 17:23:22\",\"update_time\":\"2024-03-15 11:04:34\",\"children\":[{\"id\":102,\"pid\":101,\"type\":\"C\",\"name\":\"通知设置\",\"icon\":\"\",\"sort\":0,\"perms\":\"notice.notice\\/settingLists\",\"paths\":\"notice\",\"component\":\"message\\/notice\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 17:33:15\",\"update_time\":\"2022-09-22 17:33:15\"},{\"id\":104,\"pid\":101,\"type\":\"C\",\"name\":\"通知设置编辑\",\"icon\":\"\",\"sort\":0,\"perms\":\"notice.notice\\/set\",\"paths\":\"notice\\/edit\",\"component\":\"message\\/notice\\/edit\",\"selected\":\"\\/message\\/notice\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-09-22 17:44:33\",\"update_time\":\"2022-09-23 10:01:17\"},{\"id\":107,\"pid\":101,\"type\":\"C\",\"name\":\"短信设置\",\"icon\":\"\",\"sort\":0,\"perms\":\"notice.sms_config\\/getConfig\",\"paths\":\"short_letter\",\"component\":\"message\\/short_letter\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 10:03:11\",\"update_time\":\"2022-09-28 17:01:48\"}]},{\"id\":63,\"pid\":158,\"type\":\"M\",\"name\":\"素材管理\",\"icon\":\"el-icon-Picture\",\"sort\":0,\"perms\":\"\",\"paths\":\"material\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-11 10:38:53\",\"update_time\":\"2024-03-15 11:10:43\",\"children\":[{\"id\":64,\"pid\":63,\"type\":\"C\",\"name\":\"素材中心\",\"icon\":\"el-icon-PictureRounded\",\"sort\":0,\"perms\":\"\",\"paths\":\"index\",\"component\":\"material\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-11 10:41:36\",\"update_time\":\"2022-09-28 17:00:53\"}]}]},{\"id\":166,\"pid\":0,\"type\":\"M\",\"name\":\"财务管理\",\"icon\":\"local-icon-user_gaikuang\",\"sort\":700,\"perms\":\"\",\"paths\":\"finance\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-28 10:44:29\",\"update_time\":\"2024-03-15 11:08:05\",\"children\":[{\"id\":168,\"pid\":166,\"type\":\"C\",\"name\":\"余额明细\",\"icon\":\"local-icon-qianbao\",\"sort\":100,\"perms\":\"finance.account_log\\/lists\",\"paths\":\"balance_details\",\"component\":\"finance\\/balance_details\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-28 10:56:16\",\"update_time\":\"2024-03-15 11:21:34\"},{\"id\":167,\"pid\":166,\"type\":\"C\",\"name\":\"充值记录\",\"icon\":\"el-icon-Wallet\",\"sort\":90,\"perms\":\"recharge.recharge\\/lists\",\"paths\":\"recharge_record\",\"component\":\"finance\\/recharge_record\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-28 10:52:37\",\"update_time\":\"2024-03-15 11:21:42\"},{\"id\":170,\"pid\":166,\"type\":\"C\",\"name\":\"退款记录\",\"icon\":\"local-icon-heshoujilu\",\"sort\":0,\"perms\":\"finance.refund\\/record\",\"paths\":\"refund_record\",\"component\":\"finance\\/refund_record\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-03-03 10:41:11\",\"update_time\":\"2023-03-03 10:41:11\"}]},{\"id\":96,\"pid\":0,\"type\":\"M\",\"name\":\"装修管理\",\"icon\":\"el-icon-Brush\",\"sort\":600,\"perms\":\"\",\"paths\":\"decoration\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 16:20:25\",\"update_time\":\"2024-03-15 11:08:19\",\"children\":[{\"id\":175,\"pid\":96,\"type\":\"M\",\"name\":\"移动端\",\"icon\":\"\",\"sort\":100,\"perms\":\"\",\"paths\":\"mobile\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-03-20 10:25:43\",\"update_time\":\"2024-03-20 18:08:14\",\"children\":[{\"id\":97,\"pid\":175,\"type\":\"C\",\"name\":\"页面装修\",\"icon\":\"el-icon-CopyDocument\",\"sort\":100,\"perms\":\"decorate.page\\/detail\",\"paths\":\"pages\",\"component\":\"decoration\\/pages\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 16:21:19\",\"update_time\":\"2024-03-20 18:07:36\"},{\"id\":99,\"pid\":175,\"type\":\"C\",\"name\":\"底部导航\",\"icon\":\"el-icon-Position\",\"sort\":90,\"perms\":\"decorate.tabbar\\/detail\",\"paths\":\"tabbar\",\"component\":\"decoration\\/tabbar\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 16:23:24\",\"update_time\":\"2024-03-20 18:07:42\"},{\"id\":173,\"pid\":175,\"type\":\"C\",\"name\":\"系统风格\",\"icon\":\"el-icon-Brush\",\"sort\":80,\"perms\":\"\",\"paths\":\"style\",\"component\":\"decoration\\/style\\/style\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-04-16 16:50:44\",\"update_time\":\"2024-03-20 18:07:58\"}]},{\"id\":176,\"pid\":96,\"type\":\"M\",\"name\":\"PC端\",\"icon\":\"\",\"sort\":90,\"perms\":\"\",\"paths\":\"pc\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-03-20 10:26:32\",\"update_time\":\"2024-03-20 18:08:19\",\"children\":[{\"id\":142,\"pid\":176,\"type\":\"C\",\"name\":\"PC端装修\",\"icon\":\"el-icon-Monitor\",\"sort\":8,\"perms\":\"\",\"paths\":\"pc\",\"component\":\"decoration\\/pc\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-11-14 18:54:44\",\"update_time\":\"2024-03-20 10:26:42\"}]},{\"id\":174,\"pid\":96,\"type\":\"C\",\"name\":\"素材中心\",\"icon\":\"local-icon-shangchuanzhaopian\",\"sort\":0,\"perms\":\"file\\/listCate\",\"paths\":\"material\",\"component\":\"material\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-03-18 11:59:27\",\"update_time\":\"2024-03-18 11:59:52\"}]},{\"id\":82,\"pid\":0,\"type\":\"M\",\"name\":\"渠道设置\",\"icon\":\"el-icon-Message\",\"sort\":500,\"perms\":\"\",\"paths\":\"channel\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 17:54:44\",\"update_time\":\"2024-03-15 11:17:29\",\"children\":[{\"id\":83,\"pid\":82,\"type\":\"C\",\"name\":\"h5设置\",\"icon\":\"el-icon-Cellphone\",\"sort\":100,\"perms\":\"channel.web_page_setting\\/getConfig\",\"paths\":\"h5\",\"component\":\"channel\\/h5\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 17:55:58\",\"update_time\":\"2024-03-15 11:22:09\"},{\"id\":94,\"pid\":82,\"type\":\"C\",\"name\":\"微信小程序\",\"icon\":\"local-icon-weixin\",\"sort\":90,\"perms\":\"channel.mnp_settings\\/getConfig\",\"paths\":\"weapp\",\"component\":\"channel\\/weapp\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 15:23:16\",\"update_time\":\"2024-03-15 11:22:21\"},{\"id\":85,\"pid\":82,\"type\":\"M\",\"name\":\"微信公众号\",\"icon\":\"local-icon-dingdan\",\"sort\":80,\"perms\":\"\",\"paths\":\"wx_oa\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 18:17:50\",\"update_time\":\"2024-03-15 11:22:26\",\"children\":[{\"id\":86,\"pid\":85,\"type\":\"C\",\"name\":\"公众号配置\",\"icon\":\"\",\"sort\":0,\"perms\":\"channel.official_account_setting\\/getConfig\",\"paths\":\"config\",\"component\":\"channel\\/wx_oa\\/config\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 18:21:03\",\"update_time\":\"2022-09-28 16:57:30\"},{\"id\":87,\"pid\":85,\"type\":\"C\",\"name\":\"菜单管理\",\"icon\":\"\",\"sort\":0,\"perms\":\"channel.official_account_menu\\/detail\",\"paths\":\"menu\",\"component\":\"channel\\/wx_oa\\/menu\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 18:22:47\",\"update_time\":\"2022-09-28 16:57:36\"},{\"id\":90,\"pid\":85,\"type\":\"C\",\"name\":\"关注回复\",\"icon\":\"\",\"sort\":0,\"perms\":\"channel.official_account_reply\\/lists\",\"paths\":\"follow\",\"component\":\"channel\\/wx_oa\\/reply\\/follow_reply\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 11:45:58\",\"update_time\":\"2022-09-22 11:46:06\"},{\"id\":91,\"pid\":85,\"type\":\"C\",\"name\":\"关键字回复\",\"icon\":\"\",\"sort\":0,\"perms\":\"\",\"paths\":\"keyword\",\"component\":\"channel\\/wx_oa\\/reply\\/keyword_reply\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 11:47:25\",\"update_time\":\"2022-09-22 11:47:25\"},{\"id\":93,\"pid\":85,\"type\":\"C\",\"name\":\"默认回复\",\"icon\":\"\",\"sort\":0,\"perms\":\"\",\"paths\":\"default\",\"component\":\"channel\\/wx_oa\\/reply\\/default_reply\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 11:49:40\",\"update_time\":\"2022-09-22 11:49:40\"}]},{\"id\":140,\"pid\":82,\"type\":\"C\",\"name\":\"微信开发平台\",\"icon\":\"local-icon-notice_buyer\",\"sort\":70,\"perms\":\"channel.open_setting\\/getConfig\",\"paths\":\"open_setting\",\"component\":\"channel\\/open_setting\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-10-18 17:35:13\",\"update_time\":\"2024-03-15 11:22:31\"}]},{\"id\":25,\"pid\":0,\"type\":\"M\",\"name\":\"组织管理\",\"icon\":\"el-icon-OfficeBuilding\",\"sort\":400,\"perms\":\"\",\"paths\":\"organization\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:31:54\",\"update_time\":\"2024-03-15 11:19:57\",\"children\":[{\"id\":26,\"pid\":25,\"type\":\"C\",\"name\":\"部门管理\",\"icon\":\"el-icon-Coordinate\",\"sort\":100,\"perms\":\"dept.dept\\/lists\",\"paths\":\"department\",\"component\":\"organization\\/department\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":1,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:33:09\",\"update_time\":\"2024-03-15 11:22:42\"},{\"id\":27,\"pid\":25,\"type\":\"C\",\"name\":\"岗位管理\",\"icon\":\"el-icon-PriceTag\",\"sort\":90,\"perms\":\"dept.jobs\\/lists\",\"paths\":\"post\",\"component\":\"organization\\/post\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:34:04\",\"update_time\":\"2024-03-15 11:22:47\"}]},{\"id\":4,\"pid\":0,\"type\":\"M\",\"name\":\"权限管理\",\"icon\":\"el-icon-Lock\",\"sort\":300,\"perms\":\"\",\"paths\":\"permission\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-01 16:35:56\",\"update_time\":\"2024-03-15 11:20:02\",\"children\":[{\"id\":6,\"pid\":4,\"type\":\"C\",\"name\":\"菜单\",\"icon\":\"el-icon-Operation\",\"sort\":100,\"perms\":\"auth.menu\\/lists\",\"paths\":\"menu\",\"component\":\"permission\\/menu\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":1,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-01 16:42:40\",\"update_time\":\"2024-03-15 11:23:14\"},{\"id\":8,\"pid\":4,\"type\":\"C\",\"name\":\"角色\",\"icon\":\"el-icon-Female\",\"sort\":90,\"perms\":\"auth.role\\/lists\",\"paths\":\"role\",\"component\":\"permission\\/role\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-04 10:27:40\",\"update_time\":\"2024-03-15 11:23:20\"},{\"id\":7,\"pid\":4,\"type\":\"C\",\"name\":\"管理员\",\"icon\":\"local-icon-shouyiren\",\"sort\":80,\"perms\":\"auth.admin\\/lists\",\"paths\":\"admin\",\"component\":\"permission\\/admin\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-04 10:26:07\",\"update_time\":\"2024-03-15 11:23:33\"}]},{\"id\":28,\"pid\":0,\"type\":\"M\",\"name\":\"系统设置\",\"icon\":\"el-icon-Setting\",\"sort\":200,\"perms\":\"\",\"paths\":\"setting\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:36:04\",\"update_time\":\"2024-03-15 11:20:07\",\"children\":[{\"id\":29,\"pid\":28,\"type\":\"M\",\"name\":\"网站设置\",\"icon\":\"el-icon-Basketball\",\"sort\":100,\"perms\":\"\",\"paths\":\"website\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:37:10\",\"update_time\":\"2024-03-15 11:24:09\",\"children\":[{\"id\":30,\"pid\":29,\"type\":\"C\",\"name\":\"网站信息\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.web.web_setting\\/getWebsite\",\"paths\":\"information\",\"component\":\"setting\\/website\\/information\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:38:26\",\"update_time\":\"2022-07-07 11:26:52\"},{\"id\":31,\"pid\":29,\"type\":\"C\",\"name\":\"网站备案\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.web.web_setting\\/getCopyright\",\"paths\":\"filing\",\"component\":\"setting\\/website\\/filing\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:40:34\",\"update_time\":\"2022-07-07 11:32:03\"},{\"id\":32,\"pid\":29,\"type\":\"C\",\"name\":\"政策协议\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.web.web_setting\\/getAgreement\",\"paths\":\"protocol\",\"component\":\"setting\\/website\\/protocol\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:42:51\",\"update_time\":\"2022-07-07 11:32:50\"},{\"id\":177,\"pid\":29,\"type\":\"C\",\"name\":\"站点统计\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.web.web_setting\\/getSiteStatistics\",\"paths\":\"statistics\",\"component\":\"setting\\/website\\/statistics\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-09-20 22:11:21\",\"update_time\":\"2024-09-20 22:43:54\"}]},{\"id\":112,\"pid\":28,\"type\":\"M\",\"name\":\"用户设置\",\"icon\":\"local-icon-keziyuyue\",\"sort\":90,\"perms\":\"\",\"paths\":\"user\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:21:42\",\"update_time\":\"2024-03-15 11:24:16\",\"children\":[{\"id\":113,\"pid\":112,\"type\":\"C\",\"name\":\"用户设置\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.user.user\\/getConfig\",\"paths\":\"setup\",\"component\":\"setting\\/user\\/setup\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:25:06\",\"update_time\":\"2022-09-23 11:25:06\"},{\"id\":115,\"pid\":112,\"type\":\"C\",\"name\":\"登录注册\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.user.user\\/getRegisterConfig\",\"paths\":\"login_register\",\"component\":\"setting\\/user\\/login_register\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:30:32\",\"update_time\":\"2022-09-23 11:30:32\"}]},{\"id\":161,\"pid\":28,\"type\":\"M\",\"name\":\"支付设置\",\"icon\":\"local-icon-set_pay\",\"sort\":80,\"perms\":\"\",\"paths\":\"pay\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 18:27:55\",\"update_time\":\"2024-03-15 11:24:21\",\"children\":[{\"id\":162,\"pid\":161,\"type\":\"C\",\"name\":\"支付方式\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.pay.pay_way\\/getPayWay\",\"paths\":\"method\",\"component\":\"setting\\/pay\\/method\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 18:30:07\",\"update_time\":\"2023-02-23 18:30:07\"},{\"id\":163,\"pid\":161,\"type\":\"C\",\"name\":\"支付配置\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.pay.pay_config\\/lists\",\"paths\":\"config\",\"component\":\"setting\\/pay\\/config\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 18:31:00\",\"update_time\":\"2023-02-23 18:32:54\"}]},{\"id\":33,\"pid\":28,\"type\":\"C\",\"name\":\"存储设置\",\"icon\":\"el-icon-FolderOpened\",\"sort\":70,\"perms\":\"setting.storage\\/lists\",\"paths\":\"storage\",\"component\":\"setting\\/storage\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:29:19\",\"update_time\":\"2024-03-15 11:24:55\"},{\"id\":110,\"pid\":28,\"type\":\"C\",\"name\":\"热门搜索\",\"icon\":\"el-icon-Search\",\"sort\":60,\"perms\":\"setting.hot_search\\/getConfig\",\"paths\":\"search\",\"component\":\"setting\\/search\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 10:57:01\",\"update_time\":\"2024-03-15 11:25:09\"},{\"id\":35,\"pid\":28,\"type\":\"M\",\"name\":\"系统维护\",\"icon\":\"el-icon-SetUp\",\"sort\":50,\"perms\":\"\",\"paths\":\"system\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:39:29\",\"update_time\":\"2024-03-15 11:25:22\",\"children\":[{\"id\":143,\"pid\":35,\"type\":\"C\",\"name\":\"定时任务\",\"icon\":\"\",\"sort\":100,\"perms\":\"crontab.crontab\\/lists\",\"paths\":\"scheduled_task\",\"component\":\"setting\\/system\\/scheduled_task\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-11-25 14:25:09\",\"update_time\":\"2024-03-15 11:27:26\"},{\"id\":36,\"pid\":35,\"type\":\"C\",\"name\":\"系统日志\",\"icon\":\"\",\"sort\":90,\"perms\":\"setting.system.log\\/lists\",\"paths\":\"journal\",\"component\":\"setting\\/system\\/journal\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:41:36\",\"update_time\":\"2024-03-15 11:27:33\"},{\"id\":37,\"pid\":35,\"type\":\"C\",\"name\":\"系统缓存\",\"icon\":\"\",\"sort\":80,\"perms\":\"\",\"paths\":\"cache\",\"component\":\"setting\\/system\\/cache\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:44:56\",\"update_time\":\"2024-03-15 11:27:38\"},{\"id\":38,\"pid\":35,\"type\":\"C\",\"name\":\"系统环境\",\"icon\":\"\",\"sort\":70,\"perms\":\"setting.system.system\\/info\",\"paths\":\"environment\",\"component\":\"setting\\/system\\/environment\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:46:40\",\"update_time\":\"2024-03-15 11:27:45\"},{\"id\":144,\"pid\":35,\"type\":\"C\",\"name\":\"定时任务添加\\/编辑\",\"icon\":\"\",\"sort\":0,\"perms\":\"crontab.crontab\\/add:edit\",\"paths\":\"scheduled_task\\/edit\",\"component\":\"setting\\/system\\/scheduled_task\\/edit\",\"selected\":\"\\/setting\\/system\\/scheduled_task\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-11-25 14:27:50\",\"update_time\":\"2022-11-25 14:29:25\"}]},{\"id\":23,\"pid\":28,\"type\":\"M\",\"name\":\"开发工具\",\"icon\":\"el-icon-EditPen\",\"sort\":40,\"perms\":\"\",\"paths\":\"dev_tools\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 16:55:44\",\"update_time\":\"2024-03-15 11:25:27\",\"children\":[{\"id\":24,\"pid\":23,\"type\":\"C\",\"name\":\"代码生成器\",\"icon\":\"el-icon-DocumentAdd\",\"sort\":1,\"perms\":\"tools.generator\\/generateTable\",\"paths\":\"code\",\"component\":\"dev_tools\\/code\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:01:50\",\"update_time\":\"2022-07-28 14:23:43\"},{\"id\":34,\"pid\":23,\"type\":\"C\",\"name\":\"字典管理\",\"icon\":\"el-icon-Box\",\"sort\":1,\"perms\":\"setting.dict.dict_type\\/lists\",\"paths\":\"dict\",\"component\":\"setting\\/dict\\/type\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:33:31\",\"update_time\":\"2022-09-15 15:12:15\"},{\"id\":41,\"pid\":23,\"type\":\"C\",\"name\":\"编辑数据表\",\"icon\":\"\",\"sort\":1,\"perms\":\"tools.generator\\/edit\",\"paths\":\"code\\/edit\",\"component\":\"dev_tools\\/code\\/edit\",\"selected\":\"\\/dev_tools\\/code\",\"params\":\"\",\"is_cache\":1,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-07-07 11:01:06\",\"update_time\":\"2022-09-21 16:24:28\"},{\"id\":62,\"pid\":23,\"type\":\"C\",\"name\":\"字典数据管理\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.dict.dict_data\\/lists\",\"paths\":\"dict\\/data\",\"component\":\"setting\\/dict\\/data\\/index\",\"selected\":\"\\/dev_tools\\/dict\",\"params\":\"\",\"is_cache\":1,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-07-07 14:12:31\",\"update_time\":\"2022-09-21 15:33:37\"}]}]},{\"id\":148,\"pid\":0,\"type\":\"M\",\"name\":\"模板示例\",\"icon\":\"el-icon-SetUp\",\"sort\":100,\"perms\":\"\",\"paths\":\"template\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:20:19\",\"update_time\":\"2024-03-15 11:20:11\",\"children\":[{\"id\":149,\"pid\":148,\"type\":\"M\",\"name\":\"组件示例\",\"icon\":\"el-icon-Coin\",\"sort\":0,\"perms\":\"\",\"paths\":\"component\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:26:22\",\"update_time\":\"2022-12-05 10:27:24\",\"children\":[{\"id\":152,\"pid\":149,\"type\":\"C\",\"name\":\"图标\",\"icon\":\"\",\"sort\":100,\"perms\":\"\",\"paths\":\"icon\",\"component\":\"template\\/component\\/icon\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 16:47:49\",\"update_time\":\"2024-03-15 11:28:26\"},{\"id\":150,\"pid\":149,\"type\":\"C\",\"name\":\"富文本\",\"icon\":\"\",\"sort\":90,\"perms\":\"\",\"paths\":\"rich_text\",\"component\":\"template\\/component\\/rich_text\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:35:51\",\"update_time\":\"2024-03-15 11:28:35\"},{\"id\":151,\"pid\":149,\"type\":\"C\",\"name\":\"上传文件\",\"icon\":\"\",\"sort\":80,\"perms\":\"\",\"paths\":\"upload\",\"component\":\"template\\/component\\/upload\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:55:25\",\"update_time\":\"2024-03-15 11:28:42\"},{\"id\":156,\"pid\":149,\"type\":\"C\",\"name\":\"悬浮input\",\"icon\":\"\",\"sort\":70,\"perms\":\"\",\"paths\":\"popover_input\",\"component\":\"template\\/component\\/popover_input\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-06 10:22:16\",\"update_time\":\"2024-03-15 11:28:49\"},{\"id\":153,\"pid\":149,\"type\":\"C\",\"name\":\"文件选择器\",\"icon\":\"\",\"sort\":60,\"perms\":\"\",\"paths\":\"file\",\"component\":\"template\\/component\\/file\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 17:22:09\",\"update_time\":\"2024-03-15 11:29:01\"},{\"id\":154,\"pid\":149,\"type\":\"C\",\"name\":\"链接选择器\",\"icon\":\"\",\"sort\":50,\"perms\":\"\",\"paths\":\"link\",\"component\":\"template\\/component\\/link\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-06 10:10:36\",\"update_time\":\"2024-03-15 11:29:06\"},{\"id\":155,\"pid\":149,\"type\":\"C\",\"name\":\"超出自动打点\",\"icon\":\"\",\"sort\":40,\"perms\":\"\",\"paths\":\"overflow\",\"component\":\"template\\/component\\/overflow\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-06 10:14:43\",\"update_time\":\"2024-03-15 11:29:11\"}]}]}],\"permissions\":[\"*\"]}}','120.224.95.107',1741134453),(6,1,'admin','admin',' 工作台','GET','http://ai.howlife.cc/adminapi/workbench/index','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"version\":{\"version\":\"1.9.4\",\"website\":\"www.likeadmin.cn\\/\",\"name\":\"likeadmin\",\"based\":\"vue3.x、ElementUI、MySQL\",\"channel\":{\"website\":\"https:\\/\\/www.likeadmin.cn\",\"gitee\":\"https:\\/\\/gitee.com\\/likeadmin\\/likeadmin_php\"}},\"today\":{\"time\":\"2025-03-05 08:27:33\",\"today_sales\":100,\"total_sales\":1000,\"today_visitor\":10,\"total_visitor\":100,\"today_new_user\":30,\"total_new_user\":3000,\"order_num\":12,\"order_sum\":255},\"menu\":[{\"name\":\"管理员\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_admin.png\",\"url\":\"\\/permission\\/admin\"},{\"name\":\"角色管理\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_role.png\",\"url\":\"\\/permission\\/role\"},{\"name\":\"部门管理\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_dept.png\",\"url\":\"\\/organization\\/department\"},{\"name\":\"字典管理\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_dict.png\",\"url\":\"\\/dev_tools\\/dict\"},{\"name\":\"代码生成器\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_generator.png\",\"url\":\"\\/dev_tools\\/code\"},{\"name\":\"素材中心\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_file.png\",\"url\":\"\\/material\\/index\"},{\"name\":\"菜单权限\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_auth.png\",\"url\":\"\\/permission\\/menu\"},{\"name\":\"网站信息\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_web.png\",\"url\":\"\\/setting\\/website\\/information\"}],\"visitor\":{\"date\":[\"03\\/05\",\"03\\/04\",\"03\\/03\",\"03\\/02\",\"03\\/01\",\"02\\/28\",\"02\\/27\",\"02\\/26\",\"02\\/25\",\"02\\/24\",\"02\\/23\",\"02\\/22\",\"02\\/21\",\"02\\/20\",\"02\\/19\"],\"list\":[{\"name\":\"访客数\",\"data\":[38,27,68,12,45,66,0,30,12,43,81,42,13,32,27]}]},\"support\":[{\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/qq_group.png\",\"title\":\"官方公众号\",\"desc\":\"关注官方公众号\"},{\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/customer_service.jpg\",\"title\":\"添加企业客服微信\",\"desc\":\"想了解更多请添加客服\"}],\"sale\":{\"date\":[\"03\\/05\",\"03\\/04\",\"03\\/03\",\"03\\/02\",\"03\\/01\",\"02\\/28\",\"02\\/27\"],\"list\":[{\"name\":\"销售量\",\"data\":[109,187,174,91,184,191,83]}]}}}','120.224.95.107',1741134453),(7,1,'admin','admin',' 获取存储引擎列表','GET','http://ai.howlife.cc/adminapi/setting.storage/lists','[]','{\"code\":1,\"show\":0,\"msg\":\"获取成功\",\"data\":[{\"name\":\"本地存储\",\"path\":\"存储在本地服务器\",\"engine\":\"local\",\"status\":1},{\"name\":\"七牛云存储\",\"path\":\"存储在七牛云，请前往七牛云开通存储服务\",\"engine\":\"qiniu\",\"status\":0},{\"name\":\"阿里云OSS\",\"path\":\"存储在阿里云，请前往阿里云开通存储服务\",\"engine\":\"aliyun\",\"status\":0},{\"name\":\"腾讯云COS\",\"path\":\"存储在腾讯云，请前往腾讯云开通存储服务\",\"engine\":\"qcloud\",\"status\":0}]}','120.224.95.107',1741134471),(8,1,'admin','admin',' 存储配置信息','GET','http://ai.howlife.cc/adminapi/setting.storage/detail?engine=qiniu','{\"engine\":\"qiniu\"}','{\"code\":1,\"show\":0,\"msg\":\"获取成功\",\"data\":{\"bucket\":\"\",\"access_key\":\"\",\"secret_key\":\"\",\"domain\":\"\",\"status\":0}}','120.224.95.107',1741134474),(9,1,'admin','admin',' 获取热门搜索','GET','http://ai.howlife.cc/adminapi/setting.hot_search/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"status\":0,\"data\":[]}}','120.224.95.107',1741134480),(10,1,'admin','admin',' 获取微信开放平台设置','GET','http://ai.howlife.cc/adminapi/channel.open_setting/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"app_id\":\"\",\"app_secret\":\"\"}}','120.224.95.107',1741134493),(11,1,'admin','admin',' 获取装修修页面详情','GET','http://ai.howlife.cc/adminapi/decorate.page/detail?id=1','{\"id\":\"1\"}','{\"code\":1,\"show\":0,\"msg\":\"获取成功\",\"data\":{\"id\":1,\"type\":1,\"name\":\"商城首页\",\"data\":\"[{\\\"title\\\":\\\"搜索\\\",\\\"name\\\":\\\"search\\\",\\\"disabled\\\":1,\\\"content\\\":{},\\\"styles\\\":{}},{\\\"title\\\":\\\"首页轮播图\\\",\\\"name\\\":\\\"banner\\\",\\\"content\\\":{\\\"enabled\\\":1,\\\"data\\\":[{\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/banner001.png\\\",\\\"name\\\":\\\"\\\",\\\"link\\\":{\\\"id\\\":6,\\\"name\\\":\\\"来自瓷器的爱\\\",\\\"path\\\":\\\"\\/pages\\/news_detail\\/news_detail\\\",\\\"query\\\":{\\\"id\\\":6},\\\"type\\\":\\\"article\\\"},\\\"is_show\\\":\\\"1\\\",\\\"bg\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/banner001_bg.png\\\"},{\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/banner002.png\\\",\\\"name\\\":\\\"\\\",\\\"link\\\":{\\\"id\\\":3,\\\"name\\\":\\\"金山电池公布“沪广深市民绿色生活方式”调查结果\\\",\\\"path\\\":\\\"\\/pages\\/news_detail\\/news_detail\\\",\\\"query\\\":{\\\"id\\\":3},\\\"type\\\":\\\"article\\\"},\\\"is_show\\\":\\\"1\\\",\\\"bg\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/banner002_bg.png\\\"},{\\\"is_show\\\":\\\"1\\\",\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/banner003.png\\\",\\\"name\\\":\\\"\\\",\\\"link\\\":{\\\"id\\\":1,\\\"name\\\":\\\"让生活更精致！五款居家好物推荐，实用性超高\\\",\\\"path\\\":\\\"\\/pages\\/news_detail\\/news_detail\\\",\\\"query\\\":{\\\"id\\\":1},\\\"type\\\":\\\"article\\\"},\\\"bg\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/banner003_bg.png\\\"}],\\\"style\\\":1,\\\"bg_style\\\":1},\\\"styles\\\":{}},{\\\"title\\\":\\\"导航菜单\\\",\\\"name\\\":\\\"nav\\\",\\\"content\\\":{\\\"enabled\\\":1,\\\"data\\\":[{\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/nav01.png\\\",\\\"name\\\":\\\"资讯中心\\\",\\\"link\\\":{\\\"path\\\":\\\"\\/pages\\/news\\/news\\\",\\\"name\\\":\\\"文章资讯\\\",\\\"type\\\":\\\"shop\\\",\\\"canTab\\\":true},\\\"is_show\\\":\\\"1\\\"},{\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/nav03.png\\\",\\\"name\\\":\\\"个人设置\\\",\\\"link\\\":{\\\"path\\\":\\\"\\/pages\\/user_set\\/user_set\\\",\\\"name\\\":\\\"个人设置\\\",\\\"type\\\":\\\"shop\\\"},\\\"is_show\\\":\\\"1\\\"},{\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/nav02.png\\\",\\\"name\\\":\\\"我的收藏\\\",\\\"link\\\":{\\\"path\\\":\\\"\\/pages\\/collection\\/collection\\\",\\\"name\\\":\\\"我的收藏\\\",\\\"type\\\":\\\"shop\\\"},\\\"is_show\\\":\\\"1\\\"},{\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/nav05.png\\\",\\\"name\\\":\\\"关于我们\\\",\\\"link\\\":{\\\"path\\\":\\\"\\/pages\\/as_us\\/as_us\\\",\\\"name\\\":\\\"关于我们\\\",\\\"type\\\":\\\"shop\\\"},\\\"is_show\\\":\\\"1\\\"},{\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/nav04.png\\\",\\\"name\\\":\\\"联系客服\\\",\\\"link\\\":{\\\"path\\\":\\\"\\/pages\\/customer_service\\/customer_service\\\",\\\"name\\\":\\\"联系客服\\\",\\\"type\\\":\\\"shop\\\"},\\\"is_show\\\":\\\"1\\\"}],\\\"style\\\":2,\\\"per_line\\\":5,\\\"show_line\\\":2},\\\"styles\\\":{}},{\\\"title\\\":\\\"首页中部轮播图\\\",\\\"name\\\":\\\"middle-banner\\\",\\\"content\\\":{\\\"enabled\\\":1,\\\"data\\\":[{\\\"is_show\\\":\\\"1\\\",\\\"image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/index_ad01.png\\\",\\\"name\\\":\\\"\\\",\\\"link\\\":{\\\"path\\\":\\\"\\/pages\\/agreement\\/agreement\\\",\\\"name\\\":\\\"隐私政策\\\",\\\"query\\\":{\\\"type\\\":\\\"privacy\\\"},\\\"type\\\":\\\"shop\\\"}}]},\\\"styles\\\":{}},{\\\"id\\\":\\\"l84almsk2uhyf\\\",\\\"title\\\":\\\"资讯\\\",\\\"name\\\":\\\"news\\\",\\\"disabled\\\":1,\\\"content\\\":{},\\\"styles\\\":{}}]\",\"meta\":\"[{\\\"title\\\":\\\"页面设置\\\",\\\"name\\\":\\\"page-meta\\\",\\\"content\\\":{\\\"title\\\":\\\"首页\\\",\\\"bg_type\\\":\\\"2\\\",\\\"bg_color\\\":\\\"#2F80ED\\\",\\\"bg_image\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/page_meta_bg01.png\\\",\\\"text_color\\\":\\\"2\\\",\\\"title_type\\\":\\\"2\\\",\\\"title_img\\\":\\\"\\/resource\\/image\\/adminapi\\/default\\/page_mate_title.png\\\"},\\\"styles\\\":{}}]\",\"create_time\":\"2022-08-29 15:13:08\",\"update_time\":\"2024-03-21 10:55:00\"}}','120.224.95.107',1741134500),(12,1,'admin','admin',' 文章列表','GET','http://ai.howlife.cc/adminapi/decorate.data/article?limit=10','{\"limit\":\"10\"}','{\"code\":1,\"show\":0,\"msg\":\"获取成功\",\"data\":[{\"click\":15,\"id\":3,\"title\":\"金山电池公布“沪广深市民绿色生活方式”调查结果\",\"desc\":\"\",\"abstract\":\"60%以上受访者认为高质量的10分钟足以完成“自我充电”\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/article03.png\",\"author\":\"中网资讯科技\",\"content\":\"<p style=\\\"text-align: left;\\\"><strong>深圳，2021年10月22日）<\\/strong>生活在一线城市的沪广深市民一向以效率见称，工作繁忙和快节奏的生活容易缺乏充足的休息。近日，一项针对沪广深市民绿色生活方式而展开的网络问卷调查引起了大家的注意。问卷的问题设定集中于市民对休息时间的看法，以及从对循环充电电池的使用方面了解其对绿色生活方式的态度。该调查采用随机抽样的模式，并对最终收集的1,500份有效问卷进行专业分析后发现，超过60%的受访者表示，在每天的工作时段能拥有10分钟高质量的休息时间，就可以高效“自我充电”。该调查结果反映出，在快节奏时代下，人们需要高质量的休息时间，也要学会利用高效率的休息方式和工具来应对快节奏的生活，以时刻保持“满电”状态。<\\/p><p style=\\\"text-align: left;\\\">　　<strong>60%以上受访者认为高质量的10分钟足以完成“自我充电”<\\/strong><\\/p><p style=\\\"text-align: left;\\\">　　这次调查超过1,500人，主要聚焦18至85岁的沪广深市民，了解他们对于休息时间的观念及使用充电电池的习惯，结果发现：<\\/p><p style=\\\"text-align: left;\\\">　　· 90%以上有工作受访者每天工作时间在7小时以上，平均工作时间为8小时，其中43%以上的受访者工作时间超过9小时<\\/p><p style=\\\"text-align: left;\\\">　　· 70%受访者认为在工作期间拥有10分钟“自我充电”时间不是一件困难的事情<\\/p><p style=\\\"text-align: left;\\\">　　· 60%受访者认为在工作期间有10分钟休息时间足以为自己快速充电<\\/p><p style=\\\"text-align: left;\\\">　　临床心理学家黄咏诗女士在发布会上分享为自己快速充电的实用技巧，她表示：“事实上，只要选择正确的休息方法，10分钟也足以为自己充电。以喝咖啡为例，我们可以使用心灵休息法 ── 静观呼吸，慢慢感受咖啡的温度和气味，如果能配合着聆听流水或海洋的声音，能够有效放松大脑及心灵。”<\\/p><p style=\\\"text-align: left;\\\">　　这次调查结果反映出沪广深市民的希望在繁忙的工作中适时停下来，抽出10分钟喝杯咖啡、聆听音乐或小睡片刻，为自己充电。金山电池全新推出的“绿再十分充”超快速充电器仅需10分钟就能充好电，喝一杯咖啡的时间既能完成“自我充电”，也满足设备使用的用电需求，为提升工作效率和放松身心注入新能量。<\\/p><p style=\\\"text-align: left;\\\">　　<strong>金山电池推出10分钟超快电池充电器*绿再十分充，以创新科技为市场带来革新体验<\\/strong><\\/p><p style=\\\"text-align: left;\\\">　　该问卷同时从沪广深市民对循环充电电池的使用方面进行了调查，以了解其对绿色生活方式的态度：<\\/p><p style=\\\"text-align: left;\\\">　　· 87%受访者目前没有使用充电电池，其中61%表示会考虑使用充电电池<\\/p><p style=\\\"text-align: left;\\\">　　· 58%受访者过往曾使用过充电电池，却只有20%左右市民仍在使用<\\/p><p style=\\\"text-align: left;\\\">　　· 60%左右受访者认为充电电池尚未被广泛使用，主要障碍来自于充电时间过长、缺乏相关教育<\\/p><p style=\\\"text-align: left;\\\">　　· 90%以上受访者认为充电电池充满电需要1小时或更长的时间<\\/p><p style=\\\"text-align: left;\\\">　　金山电池一直致力于为大众提供安全可靠的充电电池，并与消费者的需求和生活方式一起演变及进步。今天，金山电池宣布推出10分钟超快电池充电器*绿再十分充，只需10分钟*即可将4粒绿再十分充充电电池充好电，充电速度比其他品牌提升3倍**。充电器的LED灯可以显示每粒电池的充电状态和模式，并提示用户是否错误插入已损坏电池或一次性电池。尽管其体型小巧，却具备多项创新科技 ，如拥有独特的充电算法以优化充电电流，并能根据各个电池类型、状况和温度用最短的时间为充电电池充好电;绿再十分充内置横流扇，有效防止电池温度过热和提供低噪音的充电环境等。<br><\\/p>\",\"create_time\":\"2022-09-16 18:04:25\"},{\"click\":6,\"id\":2,\"title\":\"埋葬UI设计师的坟墓不是内卷，而是免费模式\",\"desc\":\"\",\"abstract\":\"本文从另外一个角度，聊聊作者对UI设计师职业发展前景的担忧，欢迎从事UI设计的同学来参与讨论，会有赠书哦\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/article02.jpeg\",\"author\":\"小明\",\"content\":\"<p><br><\\/p><p style=\\\"text-align: justify;\\\">一个职业，卷，根本就没什么大不了的，尤其是成熟且收入高的职业，不卷才不符合事物发展的规律。何况 UI 设计师的人力市场到今天也和 5 年前一样，还是停留在大型菜鸡互啄的场面。远不能和医疗、证券、教师或者演艺练习生相提并论。<\\/p><p style=\\\"text-align: justify;\\\">真正会让我对UI设计师发展前景觉得悲观的事情就只有一件 —— 国内的互联网产品免费机制。这也是一个我一直以来想讨论的话题，就在这次写一写。<\\/p><p style=\\\"text-align: justify;\\\">国内互联网市场的发展，是一部浩瀚的 “免费经济” 发展史。虽然今天免费已经是深入国内民众骨髓的认知，但最早的中文互联网也是需要付费的，网游也都是要花钱的。<\\/p><p style=\\\"text-align: justify;\\\">只是自有国情在此，付费确实阻碍了互联网行业的扩张和普及，一批创业家就开始通过免费的模式为用户提供服务，从而扩大了自己的产品覆盖面和普及程度。<\\/p><p style=\\\"text-align: justify;\\\">印象最深的就是免费急先锋周鸿祎，和现在鲜少出现在公众视野不同，一零年前他是当之无愧的互联网教主，因为他开发出了符合中国国情的互联网产品 “打法”，让 360 的发展如日中天。<\\/p><p style=\\\"text-align: justify;\\\">就是他在自传中提到：<\\/p><p style=\\\"text-align: justify;\\\">只要是在互联网上每个人都需要的服务，我们就认为它是基础服务，基础服务一定是免费的，这样的话不会形成价值歧视。就是说，只要这种服务是每个人都一定要用的，我一定免费提供，而且是无条件免费。增值服务不是所有人都需要的，这个比例可能会相当低，它只是百分之几甚至更少比例的人需要，所以这种服务一定要收费……<\\/p><p style=\\\"text-align: justify;\\\">这就是互联网的游戏规则，它决定了要想建立一个有效的商业模式，就一定要有海量的用户基数……<\\/p>\",\"create_time\":\"2022-09-16 18:07:34\"},{\"click\":3,\"id\":1,\"title\":\"让生活更精致！五款居家好物推荐，实用性超高\",\"desc\":\"##好物推荐🔥\",\"abstract\":\"随着当代生活节奏的忙碌，很多人在闲暇之余都想好好的享受生活。随着科技的发展，也出现了越来越多可以帮助我们提升幸福感，让生活变得更精致的产品，下面周周就给大家盘点五款居家必备的好物，都是实用性很高的产品，周周可以保证大家买了肯定会喜欢。\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/article01.png\",\"author\":\"红花\",\"content\":\"<p>拥有一台投影仪，闲暇时可以在家里直接看影院级别的大片，光是想想都觉得超级爽。市面上很多投影仪大几千，其实周周觉得没必要，选泰捷这款一千多的足够了，性价比非常高。<\\/p><p>泰捷的专业度很高，在电视TV领域研发已经十年，有诸多专利和技术创新，荣获国内外多项技术奖项，拿下了腾讯创新工场投资，打造的泰捷视频TV端和泰捷电视盒子都获得了极高评价。<\\/p><p>这款投影仪的分辨率在3000元内无敌，做到了真1080P高分辨率，也就是跟市场售价三千DLP投影仪一样的分辨率，真正做到了分毫毕现，像桌布的花纹、天空的云彩等，这些细节都清晰可见。<\\/p><p>亮度方面，泰捷达到了850ANSI流明，同价位一般是200ANSI。这是因为泰捷为了提升亮度和LCD技术透射率低的问题，首创高功率LED灯源，让其亮度做到同价位最好。专业媒体也进行了多次对比，效果与3000元价位投影仪相当。<\\/p><p>操作系统周周也很喜欢，完全不卡。泰捷作为资深音视频品牌，在系统优化方面有十年的研发经验，打造出的“零极”系统是业内公认效率最高、速度最快的系统，用户也评价它流畅度能一台顶三台，而且为了解决行业广告多这一痛点，系统内不植入任何广告。<\\/p>\",\"create_time\":\"2022-09-16 16:42:39\"}]}','120.224.95.107',1741134500),(13,1,'admin','admin',' 文章列表','GET','http://ai.howlife.cc/adminapi/decorate.data/article?limit=10','{\"limit\":\"10\"}','{\"code\":1,\"show\":0,\"msg\":\"获取成功\",\"data\":[{\"click\":15,\"id\":3,\"title\":\"金山电池公布“沪广深市民绿色生活方式”调查结果\",\"desc\":\"\",\"abstract\":\"60%以上受访者认为高质量的10分钟足以完成“自我充电”\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/article03.png\",\"author\":\"中网资讯科技\",\"content\":\"<p style=\\\"text-align: left;\\\"><strong>深圳，2021年10月22日）<\\/strong>生活在一线城市的沪广深市民一向以效率见称，工作繁忙和快节奏的生活容易缺乏充足的休息。近日，一项针对沪广深市民绿色生活方式而展开的网络问卷调查引起了大家的注意。问卷的问题设定集中于市民对休息时间的看法，以及从对循环充电电池的使用方面了解其对绿色生活方式的态度。该调查采用随机抽样的模式，并对最终收集的1,500份有效问卷进行专业分析后发现，超过60%的受访者表示，在每天的工作时段能拥有10分钟高质量的休息时间，就可以高效“自我充电”。该调查结果反映出，在快节奏时代下，人们需要高质量的休息时间，也要学会利用高效率的休息方式和工具来应对快节奏的生活，以时刻保持“满电”状态。<\\/p><p style=\\\"text-align: left;\\\">　　<strong>60%以上受访者认为高质量的10分钟足以完成“自我充电”<\\/strong><\\/p><p style=\\\"text-align: left;\\\">　　这次调查超过1,500人，主要聚焦18至85岁的沪广深市民，了解他们对于休息时间的观念及使用充电电池的习惯，结果发现：<\\/p><p style=\\\"text-align: left;\\\">　　· 90%以上有工作受访者每天工作时间在7小时以上，平均工作时间为8小时，其中43%以上的受访者工作时间超过9小时<\\/p><p style=\\\"text-align: left;\\\">　　· 70%受访者认为在工作期间拥有10分钟“自我充电”时间不是一件困难的事情<\\/p><p style=\\\"text-align: left;\\\">　　· 60%受访者认为在工作期间有10分钟休息时间足以为自己快速充电<\\/p><p style=\\\"text-align: left;\\\">　　临床心理学家黄咏诗女士在发布会上分享为自己快速充电的实用技巧，她表示：“事实上，只要选择正确的休息方法，10分钟也足以为自己充电。以喝咖啡为例，我们可以使用心灵休息法 ── 静观呼吸，慢慢感受咖啡的温度和气味，如果能配合着聆听流水或海洋的声音，能够有效放松大脑及心灵。”<\\/p><p style=\\\"text-align: left;\\\">　　这次调查结果反映出沪广深市民的希望在繁忙的工作中适时停下来，抽出10分钟喝杯咖啡、聆听音乐或小睡片刻，为自己充电。金山电池全新推出的“绿再十分充”超快速充电器仅需10分钟就能充好电，喝一杯咖啡的时间既能完成“自我充电”，也满足设备使用的用电需求，为提升工作效率和放松身心注入新能量。<\\/p><p style=\\\"text-align: left;\\\">　　<strong>金山电池推出10分钟超快电池充电器*绿再十分充，以创新科技为市场带来革新体验<\\/strong><\\/p><p style=\\\"text-align: left;\\\">　　该问卷同时从沪广深市民对循环充电电池的使用方面进行了调查，以了解其对绿色生活方式的态度：<\\/p><p style=\\\"text-align: left;\\\">　　· 87%受访者目前没有使用充电电池，其中61%表示会考虑使用充电电池<\\/p><p style=\\\"text-align: left;\\\">　　· 58%受访者过往曾使用过充电电池，却只有20%左右市民仍在使用<\\/p><p style=\\\"text-align: left;\\\">　　· 60%左右受访者认为充电电池尚未被广泛使用，主要障碍来自于充电时间过长、缺乏相关教育<\\/p><p style=\\\"text-align: left;\\\">　　· 90%以上受访者认为充电电池充满电需要1小时或更长的时间<\\/p><p style=\\\"text-align: left;\\\">　　金山电池一直致力于为大众提供安全可靠的充电电池，并与消费者的需求和生活方式一起演变及进步。今天，金山电池宣布推出10分钟超快电池充电器*绿再十分充，只需10分钟*即可将4粒绿再十分充充电电池充好电，充电速度比其他品牌提升3倍**。充电器的LED灯可以显示每粒电池的充电状态和模式，并提示用户是否错误插入已损坏电池或一次性电池。尽管其体型小巧，却具备多项创新科技 ，如拥有独特的充电算法以优化充电电流，并能根据各个电池类型、状况和温度用最短的时间为充电电池充好电;绿再十分充内置横流扇，有效防止电池温度过热和提供低噪音的充电环境等。<br><\\/p>\",\"create_time\":\"2022-09-16 18:04:25\"},{\"click\":6,\"id\":2,\"title\":\"埋葬UI设计师的坟墓不是内卷，而是免费模式\",\"desc\":\"\",\"abstract\":\"本文从另外一个角度，聊聊作者对UI设计师职业发展前景的担忧，欢迎从事UI设计的同学来参与讨论，会有赠书哦\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/article02.jpeg\",\"author\":\"小明\",\"content\":\"<p><br><\\/p><p style=\\\"text-align: justify;\\\">一个职业，卷，根本就没什么大不了的，尤其是成熟且收入高的职业，不卷才不符合事物发展的规律。何况 UI 设计师的人力市场到今天也和 5 年前一样，还是停留在大型菜鸡互啄的场面。远不能和医疗、证券、教师或者演艺练习生相提并论。<\\/p><p style=\\\"text-align: justify;\\\">真正会让我对UI设计师发展前景觉得悲观的事情就只有一件 —— 国内的互联网产品免费机制。这也是一个我一直以来想讨论的话题，就在这次写一写。<\\/p><p style=\\\"text-align: justify;\\\">国内互联网市场的发展，是一部浩瀚的 “免费经济” 发展史。虽然今天免费已经是深入国内民众骨髓的认知，但最早的中文互联网也是需要付费的，网游也都是要花钱的。<\\/p><p style=\\\"text-align: justify;\\\">只是自有国情在此，付费确实阻碍了互联网行业的扩张和普及，一批创业家就开始通过免费的模式为用户提供服务，从而扩大了自己的产品覆盖面和普及程度。<\\/p><p style=\\\"text-align: justify;\\\">印象最深的就是免费急先锋周鸿祎，和现在鲜少出现在公众视野不同，一零年前他是当之无愧的互联网教主，因为他开发出了符合中国国情的互联网产品 “打法”，让 360 的发展如日中天。<\\/p><p style=\\\"text-align: justify;\\\">就是他在自传中提到：<\\/p><p style=\\\"text-align: justify;\\\">只要是在互联网上每个人都需要的服务，我们就认为它是基础服务，基础服务一定是免费的，这样的话不会形成价值歧视。就是说，只要这种服务是每个人都一定要用的，我一定免费提供，而且是无条件免费。增值服务不是所有人都需要的，这个比例可能会相当低，它只是百分之几甚至更少比例的人需要，所以这种服务一定要收费……<\\/p><p style=\\\"text-align: justify;\\\">这就是互联网的游戏规则，它决定了要想建立一个有效的商业模式，就一定要有海量的用户基数……<\\/p>\",\"create_time\":\"2022-09-16 18:07:34\"},{\"click\":3,\"id\":1,\"title\":\"让生活更精致！五款居家好物推荐，实用性超高\",\"desc\":\"##好物推荐🔥\",\"abstract\":\"随着当代生活节奏的忙碌，很多人在闲暇之余都想好好的享受生活。随着科技的发展，也出现了越来越多可以帮助我们提升幸福感，让生活变得更精致的产品，下面周周就给大家盘点五款居家必备的好物，都是实用性很高的产品，周周可以保证大家买了肯定会喜欢。\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/article01.png\",\"author\":\"红花\",\"content\":\"<p>拥有一台投影仪，闲暇时可以在家里直接看影院级别的大片，光是想想都觉得超级爽。市面上很多投影仪大几千，其实周周觉得没必要，选泰捷这款一千多的足够了，性价比非常高。<\\/p><p>泰捷的专业度很高，在电视TV领域研发已经十年，有诸多专利和技术创新，荣获国内外多项技术奖项，拿下了腾讯创新工场投资，打造的泰捷视频TV端和泰捷电视盒子都获得了极高评价。<\\/p><p>这款投影仪的分辨率在3000元内无敌，做到了真1080P高分辨率，也就是跟市场售价三千DLP投影仪一样的分辨率，真正做到了分毫毕现，像桌布的花纹、天空的云彩等，这些细节都清晰可见。<\\/p><p>亮度方面，泰捷达到了850ANSI流明，同价位一般是200ANSI。这是因为泰捷为了提升亮度和LCD技术透射率低的问题，首创高功率LED灯源，让其亮度做到同价位最好。专业媒体也进行了多次对比，效果与3000元价位投影仪相当。<\\/p><p>操作系统周周也很喜欢，完全不卡。泰捷作为资深音视频品牌，在系统优化方面有十年的研发经验，打造出的“零极”系统是业内公认效率最高、速度最快的系统，用户也评价它流畅度能一台顶三台，而且为了解决行业广告多这一痛点，系统内不植入任何广告。<\\/p>\",\"create_time\":\"2022-09-16 16:42:39\"}]}','120.224.95.107',1741134500),(14,0,'','',' 基础配置','GET','http://ai.howlife.cc/adminapi/config/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"oss_domain\":\"http:\\/\\/ai.howlife.cc\\/\",\"web_name\":\"likeadmin\",\"web_favicon\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_favicon.ico\",\"web_logo\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_logo.jpg\",\"login_image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/login_image.png\",\"copyright_config\":[],\"version\":\"1.9.4\"}}','140.250.132.18',1741163700),(15,0,'','',' 基础配置','GET','http://ai.howlife.cc/adminapi/config/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"oss_domain\":\"http:\\/\\/ai.howlife.cc\\/\",\"web_name\":\"likeadmin\",\"web_favicon\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_favicon.ico\",\"web_logo\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/web_logo.jpg\",\"login_image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/login_image.png\",\"copyright_config\":[],\"version\":\"1.9.4\"}}','140.250.132.18',1741163700),(16,0,'','',' 账号登录','POST','http://ai.howlife.cc/adminapi/login/account','{\"account\":\"admin\",\"password\":\"******\",\"terminal\":\"1\"}','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"name\":\"admin\",\"avatar\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/avatar.png\",\"role_name\":\"系统管理员\",\"token\":\"5d7bcb28f28c57a724787026e878c2c1\"}}','140.250.132.18',1741163705),(17,1,'admin','admin',' 获取当前管理员信息','GET','http://ai.howlife.cc/adminapi/auth.admin/mySelf','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"user\":{\"role_id\":[],\"dept_id\":[1],\"jobs_id\":[],\"id\":1,\"account\":\"admin\",\"name\":\"admin\",\"disable\":0,\"root\":1,\"multipoint_login\":1,\"avatar\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/avatar.png\"},\"menu\":[{\"id\":5,\"pid\":0,\"type\":\"C\",\"name\":\"工作台\",\"icon\":\"el-icon-Monitor\",\"sort\":1000,\"perms\":\"workbench\\/index\",\"paths\":\"workbench\",\"component\":\"workbench\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-01 16:39:53\",\"update_time\":\"2022-09-28 16:49:41\"},{\"id\":117,\"pid\":0,\"type\":\"M\",\"name\":\"用户管理\",\"icon\":\"el-icon-User\",\"sort\":900,\"perms\":\"\",\"paths\":\"consumer\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:39:11\",\"update_time\":\"2024-03-15 11:07:54\",\"children\":[{\"id\":118,\"pid\":117,\"type\":\"C\",\"name\":\"用户列表\",\"icon\":\"local-icon-user_guanli\",\"sort\":100,\"perms\":\"user.user\\/lists\",\"paths\":\"lists\",\"component\":\"consumer\\/lists\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:39:52\",\"update_time\":\"2024-03-15 11:04:05\"},{\"id\":119,\"pid\":117,\"type\":\"C\",\"name\":\"用户详情\",\"icon\":\"\",\"sort\":90,\"perms\":\"user.user\\/detail\",\"paths\":\"lists\\/detail\",\"component\":\"consumer\\/lists\\/detail\",\"selected\":\"\\/consumer\\/lists\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-09-23 11:41:10\",\"update_time\":\"2024-03-15 11:04:11\"}]},{\"id\":158,\"pid\":0,\"type\":\"M\",\"name\":\"应用管理\",\"icon\":\"el-icon-Postcard\",\"sort\":800,\"perms\":\"\",\"paths\":\"app\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 17:10:30\",\"update_time\":\"2024-03-15 11:07:59\",\"children\":[{\"id\":159,\"pid\":158,\"type\":\"C\",\"name\":\"用户充值\",\"icon\":\"local-icon-fukuan\",\"sort\":100,\"perms\":\"recharge.recharge\\/getConfig\",\"paths\":\"recharge\",\"component\":\"app\\/recharge\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 17:24:44\",\"update_time\":\"2024-03-15 11:04:20\"},{\"id\":70,\"pid\":158,\"type\":\"M\",\"name\":\"文章资讯\",\"icon\":\"el-icon-ChatLineSquare\",\"sort\":90,\"perms\":\"\",\"paths\":\"article\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 16:46:05\",\"update_time\":\"2024-03-15 11:04:27\",\"children\":[{\"id\":71,\"pid\":70,\"type\":\"C\",\"name\":\"文章管理\",\"icon\":\"el-icon-ChatDotSquare\",\"sort\":0,\"perms\":\"article.article\\/lists\",\"paths\":\"lists\",\"component\":\"article\\/lists\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 16:48:21\",\"update_time\":\"2022-09-28 16:43:35\"},{\"id\":72,\"pid\":70,\"type\":\"C\",\"name\":\"文章添加\\/编辑\",\"icon\":\"\",\"sort\":0,\"perms\":\"article.article\\/add:edit\",\"paths\":\"lists\\/edit\",\"component\":\"article\\/lists\\/edit\",\"selected\":\"\\/article\\/lists\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-09-21 16:49:13\",\"update_time\":\"2022-09-28 17:11:15\"},{\"id\":73,\"pid\":70,\"type\":\"C\",\"name\":\"文章栏目\",\"icon\":\"el-icon-CollectionTag\",\"sort\":0,\"perms\":\"article.articleCate\\/lists\",\"paths\":\"column\",\"component\":\"article\\/column\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":1,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 16:51:27\",\"update_time\":\"2022-09-28 16:44:38\"}]},{\"id\":101,\"pid\":158,\"type\":\"M\",\"name\":\"消息管理\",\"icon\":\"el-icon-ChatDotRound\",\"sort\":80,\"perms\":\"\",\"paths\":\"message\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 17:23:22\",\"update_time\":\"2024-03-15 11:04:34\",\"children\":[{\"id\":102,\"pid\":101,\"type\":\"C\",\"name\":\"通知设置\",\"icon\":\"\",\"sort\":0,\"perms\":\"notice.notice\\/settingLists\",\"paths\":\"notice\",\"component\":\"message\\/notice\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 17:33:15\",\"update_time\":\"2022-09-22 17:33:15\"},{\"id\":104,\"pid\":101,\"type\":\"C\",\"name\":\"通知设置编辑\",\"icon\":\"\",\"sort\":0,\"perms\":\"notice.notice\\/set\",\"paths\":\"notice\\/edit\",\"component\":\"message\\/notice\\/edit\",\"selected\":\"\\/message\\/notice\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-09-22 17:44:33\",\"update_time\":\"2022-09-23 10:01:17\"},{\"id\":107,\"pid\":101,\"type\":\"C\",\"name\":\"短信设置\",\"icon\":\"\",\"sort\":0,\"perms\":\"notice.sms_config\\/getConfig\",\"paths\":\"short_letter\",\"component\":\"message\\/short_letter\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 10:03:11\",\"update_time\":\"2022-09-28 17:01:48\"}]},{\"id\":63,\"pid\":158,\"type\":\"M\",\"name\":\"素材管理\",\"icon\":\"el-icon-Picture\",\"sort\":0,\"perms\":\"\",\"paths\":\"material\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-11 10:38:53\",\"update_time\":\"2024-03-15 11:10:43\",\"children\":[{\"id\":64,\"pid\":63,\"type\":\"C\",\"name\":\"素材中心\",\"icon\":\"el-icon-PictureRounded\",\"sort\":0,\"perms\":\"\",\"paths\":\"index\",\"component\":\"material\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-11 10:41:36\",\"update_time\":\"2022-09-28 17:00:53\"}]}]},{\"id\":166,\"pid\":0,\"type\":\"M\",\"name\":\"财务管理\",\"icon\":\"local-icon-user_gaikuang\",\"sort\":700,\"perms\":\"\",\"paths\":\"finance\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-28 10:44:29\",\"update_time\":\"2024-03-15 11:08:05\",\"children\":[{\"id\":168,\"pid\":166,\"type\":\"C\",\"name\":\"余额明细\",\"icon\":\"local-icon-qianbao\",\"sort\":100,\"perms\":\"finance.account_log\\/lists\",\"paths\":\"balance_details\",\"component\":\"finance\\/balance_details\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-28 10:56:16\",\"update_time\":\"2024-03-15 11:21:34\"},{\"id\":167,\"pid\":166,\"type\":\"C\",\"name\":\"充值记录\",\"icon\":\"el-icon-Wallet\",\"sort\":90,\"perms\":\"recharge.recharge\\/lists\",\"paths\":\"recharge_record\",\"component\":\"finance\\/recharge_record\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-28 10:52:37\",\"update_time\":\"2024-03-15 11:21:42\"},{\"id\":170,\"pid\":166,\"type\":\"C\",\"name\":\"退款记录\",\"icon\":\"local-icon-heshoujilu\",\"sort\":0,\"perms\":\"finance.refund\\/record\",\"paths\":\"refund_record\",\"component\":\"finance\\/refund_record\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-03-03 10:41:11\",\"update_time\":\"2023-03-03 10:41:11\"}]},{\"id\":96,\"pid\":0,\"type\":\"M\",\"name\":\"装修管理\",\"icon\":\"el-icon-Brush\",\"sort\":600,\"perms\":\"\",\"paths\":\"decoration\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 16:20:25\",\"update_time\":\"2024-03-15 11:08:19\",\"children\":[{\"id\":175,\"pid\":96,\"type\":\"M\",\"name\":\"移动端\",\"icon\":\"\",\"sort\":100,\"perms\":\"\",\"paths\":\"mobile\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-03-20 10:25:43\",\"update_time\":\"2024-03-20 18:08:14\",\"children\":[{\"id\":97,\"pid\":175,\"type\":\"C\",\"name\":\"页面装修\",\"icon\":\"el-icon-CopyDocument\",\"sort\":100,\"perms\":\"decorate.page\\/detail\",\"paths\":\"pages\",\"component\":\"decoration\\/pages\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 16:21:19\",\"update_time\":\"2024-03-20 18:07:36\"},{\"id\":99,\"pid\":175,\"type\":\"C\",\"name\":\"底部导航\",\"icon\":\"el-icon-Position\",\"sort\":90,\"perms\":\"decorate.tabbar\\/detail\",\"paths\":\"tabbar\",\"component\":\"decoration\\/tabbar\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 16:23:24\",\"update_time\":\"2024-03-20 18:07:42\"},{\"id\":173,\"pid\":175,\"type\":\"C\",\"name\":\"系统风格\",\"icon\":\"el-icon-Brush\",\"sort\":80,\"perms\":\"\",\"paths\":\"style\",\"component\":\"decoration\\/style\\/style\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-04-16 16:50:44\",\"update_time\":\"2024-03-20 18:07:58\"}]},{\"id\":176,\"pid\":96,\"type\":\"M\",\"name\":\"PC端\",\"icon\":\"\",\"sort\":90,\"perms\":\"\",\"paths\":\"pc\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-03-20 10:26:32\",\"update_time\":\"2024-03-20 18:08:19\",\"children\":[{\"id\":142,\"pid\":176,\"type\":\"C\",\"name\":\"PC端装修\",\"icon\":\"el-icon-Monitor\",\"sort\":8,\"perms\":\"\",\"paths\":\"pc\",\"component\":\"decoration\\/pc\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-11-14 18:54:44\",\"update_time\":\"2024-03-20 10:26:42\"}]},{\"id\":174,\"pid\":96,\"type\":\"C\",\"name\":\"素材中心\",\"icon\":\"local-icon-shangchuanzhaopian\",\"sort\":0,\"perms\":\"file\\/listCate\",\"paths\":\"material\",\"component\":\"material\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-03-18 11:59:27\",\"update_time\":\"2024-03-18 11:59:52\"}]},{\"id\":82,\"pid\":0,\"type\":\"M\",\"name\":\"渠道设置\",\"icon\":\"el-icon-Message\",\"sort\":500,\"perms\":\"\",\"paths\":\"channel\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 17:54:44\",\"update_time\":\"2024-03-15 11:17:29\",\"children\":[{\"id\":83,\"pid\":82,\"type\":\"C\",\"name\":\"h5设置\",\"icon\":\"el-icon-Cellphone\",\"sort\":100,\"perms\":\"channel.web_page_setting\\/getConfig\",\"paths\":\"h5\",\"component\":\"channel\\/h5\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 17:55:58\",\"update_time\":\"2024-03-15 11:22:09\"},{\"id\":94,\"pid\":82,\"type\":\"C\",\"name\":\"微信小程序\",\"icon\":\"local-icon-weixin\",\"sort\":90,\"perms\":\"channel.mnp_settings\\/getConfig\",\"paths\":\"weapp\",\"component\":\"channel\\/weapp\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 15:23:16\",\"update_time\":\"2024-03-15 11:22:21\"},{\"id\":85,\"pid\":82,\"type\":\"M\",\"name\":\"微信公众号\",\"icon\":\"local-icon-dingdan\",\"sort\":80,\"perms\":\"\",\"paths\":\"wx_oa\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 18:17:50\",\"update_time\":\"2024-03-15 11:22:26\",\"children\":[{\"id\":86,\"pid\":85,\"type\":\"C\",\"name\":\"公众号配置\",\"icon\":\"\",\"sort\":0,\"perms\":\"channel.official_account_setting\\/getConfig\",\"paths\":\"config\",\"component\":\"channel\\/wx_oa\\/config\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 18:21:03\",\"update_time\":\"2022-09-28 16:57:30\"},{\"id\":87,\"pid\":85,\"type\":\"C\",\"name\":\"菜单管理\",\"icon\":\"\",\"sort\":0,\"perms\":\"channel.official_account_menu\\/detail\",\"paths\":\"menu\",\"component\":\"channel\\/wx_oa\\/menu\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-21 18:22:47\",\"update_time\":\"2022-09-28 16:57:36\"},{\"id\":90,\"pid\":85,\"type\":\"C\",\"name\":\"关注回复\",\"icon\":\"\",\"sort\":0,\"perms\":\"channel.official_account_reply\\/lists\",\"paths\":\"follow\",\"component\":\"channel\\/wx_oa\\/reply\\/follow_reply\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 11:45:58\",\"update_time\":\"2022-09-22 11:46:06\"},{\"id\":91,\"pid\":85,\"type\":\"C\",\"name\":\"关键字回复\",\"icon\":\"\",\"sort\":0,\"perms\":\"\",\"paths\":\"keyword\",\"component\":\"channel\\/wx_oa\\/reply\\/keyword_reply\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 11:47:25\",\"update_time\":\"2022-09-22 11:47:25\"},{\"id\":93,\"pid\":85,\"type\":\"C\",\"name\":\"默认回复\",\"icon\":\"\",\"sort\":0,\"perms\":\"\",\"paths\":\"default\",\"component\":\"channel\\/wx_oa\\/reply\\/default_reply\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-22 11:49:40\",\"update_time\":\"2022-09-22 11:49:40\"}]},{\"id\":140,\"pid\":82,\"type\":\"C\",\"name\":\"微信开发平台\",\"icon\":\"local-icon-notice_buyer\",\"sort\":70,\"perms\":\"channel.open_setting\\/getConfig\",\"paths\":\"open_setting\",\"component\":\"channel\\/open_setting\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-10-18 17:35:13\",\"update_time\":\"2024-03-15 11:22:31\"}]},{\"id\":25,\"pid\":0,\"type\":\"M\",\"name\":\"组织管理\",\"icon\":\"el-icon-OfficeBuilding\",\"sort\":400,\"perms\":\"\",\"paths\":\"organization\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:31:54\",\"update_time\":\"2024-03-15 11:19:57\",\"children\":[{\"id\":26,\"pid\":25,\"type\":\"C\",\"name\":\"部门管理\",\"icon\":\"el-icon-Coordinate\",\"sort\":100,\"perms\":\"dept.dept\\/lists\",\"paths\":\"department\",\"component\":\"organization\\/department\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":1,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:33:09\",\"update_time\":\"2024-03-15 11:22:42\"},{\"id\":27,\"pid\":25,\"type\":\"C\",\"name\":\"岗位管理\",\"icon\":\"el-icon-PriceTag\",\"sort\":90,\"perms\":\"dept.jobs\\/lists\",\"paths\":\"post\",\"component\":\"organization\\/post\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:34:04\",\"update_time\":\"2024-03-15 11:22:47\"}]},{\"id\":4,\"pid\":0,\"type\":\"M\",\"name\":\"权限管理\",\"icon\":\"el-icon-Lock\",\"sort\":300,\"perms\":\"\",\"paths\":\"permission\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-01 16:35:56\",\"update_time\":\"2024-03-15 11:20:02\",\"children\":[{\"id\":6,\"pid\":4,\"type\":\"C\",\"name\":\"菜单\",\"icon\":\"el-icon-Operation\",\"sort\":100,\"perms\":\"auth.menu\\/lists\",\"paths\":\"menu\",\"component\":\"permission\\/menu\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":1,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-01 16:42:40\",\"update_time\":\"2024-03-15 11:23:14\"},{\"id\":8,\"pid\":4,\"type\":\"C\",\"name\":\"角色\",\"icon\":\"el-icon-Female\",\"sort\":90,\"perms\":\"auth.role\\/lists\",\"paths\":\"role\",\"component\":\"permission\\/role\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-04 10:27:40\",\"update_time\":\"2024-03-15 11:23:20\"},{\"id\":7,\"pid\":4,\"type\":\"C\",\"name\":\"管理员\",\"icon\":\"local-icon-shouyiren\",\"sort\":80,\"perms\":\"auth.admin\\/lists\",\"paths\":\"admin\",\"component\":\"permission\\/admin\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-04 10:26:07\",\"update_time\":\"2024-03-15 11:23:33\"}]},{\"id\":28,\"pid\":0,\"type\":\"M\",\"name\":\"系统设置\",\"icon\":\"el-icon-Setting\",\"sort\":200,\"perms\":\"\",\"paths\":\"setting\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:36:04\",\"update_time\":\"2024-03-15 11:20:07\",\"children\":[{\"id\":29,\"pid\":28,\"type\":\"M\",\"name\":\"网站设置\",\"icon\":\"el-icon-Basketball\",\"sort\":100,\"perms\":\"\",\"paths\":\"website\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:37:10\",\"update_time\":\"2024-03-15 11:24:09\",\"children\":[{\"id\":30,\"pid\":29,\"type\":\"C\",\"name\":\"网站信息\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.web.web_setting\\/getWebsite\",\"paths\":\"information\",\"component\":\"setting\\/website\\/information\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:38:26\",\"update_time\":\"2022-07-07 11:26:52\"},{\"id\":31,\"pid\":29,\"type\":\"C\",\"name\":\"网站备案\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.web.web_setting\\/getCopyright\",\"paths\":\"filing\",\"component\":\"setting\\/website\\/filing\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:40:34\",\"update_time\":\"2022-07-07 11:32:03\"},{\"id\":32,\"pid\":29,\"type\":\"C\",\"name\":\"政策协议\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.web.web_setting\\/getAgreement\",\"paths\":\"protocol\",\"component\":\"setting\\/website\\/protocol\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:42:51\",\"update_time\":\"2022-07-07 11:32:50\"},{\"id\":177,\"pid\":29,\"type\":\"C\",\"name\":\"站点统计\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.web.web_setting\\/getSiteStatistics\",\"paths\":\"statistics\",\"component\":\"setting\\/website\\/statistics\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2024-09-20 22:11:21\",\"update_time\":\"2024-09-20 22:43:54\"}]},{\"id\":112,\"pid\":28,\"type\":\"M\",\"name\":\"用户设置\",\"icon\":\"local-icon-keziyuyue\",\"sort\":90,\"perms\":\"\",\"paths\":\"user\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:21:42\",\"update_time\":\"2024-03-15 11:24:16\",\"children\":[{\"id\":113,\"pid\":112,\"type\":\"C\",\"name\":\"用户设置\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.user.user\\/getConfig\",\"paths\":\"setup\",\"component\":\"setting\\/user\\/setup\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:25:06\",\"update_time\":\"2022-09-23 11:25:06\"},{\"id\":115,\"pid\":112,\"type\":\"C\",\"name\":\"登录注册\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.user.user\\/getRegisterConfig\",\"paths\":\"login_register\",\"component\":\"setting\\/user\\/login_register\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 11:30:32\",\"update_time\":\"2022-09-23 11:30:32\"}]},{\"id\":161,\"pid\":28,\"type\":\"M\",\"name\":\"支付设置\",\"icon\":\"local-icon-set_pay\",\"sort\":80,\"perms\":\"\",\"paths\":\"pay\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 18:27:55\",\"update_time\":\"2024-03-15 11:24:21\",\"children\":[{\"id\":162,\"pid\":161,\"type\":\"C\",\"name\":\"支付方式\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.pay.pay_way\\/getPayWay\",\"paths\":\"method\",\"component\":\"setting\\/pay\\/method\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 18:30:07\",\"update_time\":\"2023-02-23 18:30:07\"},{\"id\":163,\"pid\":161,\"type\":\"C\",\"name\":\"支付配置\",\"icon\":\"\",\"sort\":0,\"perms\":\"setting.pay.pay_config\\/lists\",\"paths\":\"config\",\"component\":\"setting\\/pay\\/config\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2023-02-23 18:31:00\",\"update_time\":\"2023-02-23 18:32:54\"}]},{\"id\":33,\"pid\":28,\"type\":\"C\",\"name\":\"存储设置\",\"icon\":\"el-icon-FolderOpened\",\"sort\":70,\"perms\":\"setting.storage\\/lists\",\"paths\":\"storage\",\"component\":\"setting\\/storage\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:29:19\",\"update_time\":\"2024-03-15 11:24:55\"},{\"id\":110,\"pid\":28,\"type\":\"C\",\"name\":\"热门搜索\",\"icon\":\"el-icon-Search\",\"sort\":60,\"perms\":\"setting.hot_search\\/getConfig\",\"paths\":\"search\",\"component\":\"setting\\/search\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-09-23 10:57:01\",\"update_time\":\"2024-03-15 11:25:09\"},{\"id\":35,\"pid\":28,\"type\":\"M\",\"name\":\"系统维护\",\"icon\":\"el-icon-SetUp\",\"sort\":50,\"perms\":\"\",\"paths\":\"system\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:39:29\",\"update_time\":\"2024-03-15 11:25:22\",\"children\":[{\"id\":143,\"pid\":35,\"type\":\"C\",\"name\":\"定时任务\",\"icon\":\"\",\"sort\":100,\"perms\":\"crontab.crontab\\/lists\",\"paths\":\"scheduled_task\",\"component\":\"setting\\/system\\/scheduled_task\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-11-25 14:25:09\",\"update_time\":\"2024-03-15 11:27:26\"},{\"id\":36,\"pid\":35,\"type\":\"C\",\"name\":\"系统日志\",\"icon\":\"\",\"sort\":90,\"perms\":\"setting.system.log\\/lists\",\"paths\":\"journal\",\"component\":\"setting\\/system\\/journal\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:41:36\",\"update_time\":\"2024-03-15 11:27:33\"},{\"id\":37,\"pid\":35,\"type\":\"C\",\"name\":\"系统缓存\",\"icon\":\"\",\"sort\":80,\"perms\":\"\",\"paths\":\"cache\",\"component\":\"setting\\/system\\/cache\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:44:56\",\"update_time\":\"2024-03-15 11:27:38\"},{\"id\":38,\"pid\":35,\"type\":\"C\",\"name\":\"系统环境\",\"icon\":\"\",\"sort\":70,\"perms\":\"setting.system.system\\/info\",\"paths\":\"environment\",\"component\":\"setting\\/system\\/environment\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:46:40\",\"update_time\":\"2024-03-15 11:27:45\"},{\"id\":144,\"pid\":35,\"type\":\"C\",\"name\":\"定时任务添加\\/编辑\",\"icon\":\"\",\"sort\":0,\"perms\":\"crontab.crontab\\/add:edit\",\"paths\":\"scheduled_task\\/edit\",\"component\":\"setting\\/system\\/scheduled_task\\/edit\",\"selected\":\"\\/setting\\/system\\/scheduled_task\",\"params\":\"\",\"is_cache\":0,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-11-25 14:27:50\",\"update_time\":\"2022-11-25 14:29:25\"}]},{\"id\":23,\"pid\":28,\"type\":\"M\",\"name\":\"开发工具\",\"icon\":\"el-icon-EditPen\",\"sort\":40,\"perms\":\"\",\"paths\":\"dev_tools\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 16:55:44\",\"update_time\":\"2024-03-15 11:25:27\",\"children\":[{\"id\":24,\"pid\":23,\"type\":\"C\",\"name\":\"代码生成器\",\"icon\":\"el-icon-DocumentAdd\",\"sort\":1,\"perms\":\"tools.generator\\/generateTable\",\"paths\":\"code\",\"component\":\"dev_tools\\/code\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-06 17:01:50\",\"update_time\":\"2022-07-28 14:23:43\"},{\"id\":34,\"pid\":23,\"type\":\"C\",\"name\":\"字典管理\",\"icon\":\"el-icon-Box\",\"sort\":1,\"perms\":\"setting.dict.dict_type\\/lists\",\"paths\":\"dict\",\"component\":\"setting\\/dict\\/type\\/index\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-07-07 10:33:31\",\"update_time\":\"2022-09-15 15:12:15\"},{\"id\":41,\"pid\":23,\"type\":\"C\",\"name\":\"编辑数据表\",\"icon\":\"\",\"sort\":1,\"perms\":\"tools.generator\\/edit\",\"paths\":\"code\\/edit\",\"component\":\"dev_tools\\/code\\/edit\",\"selected\":\"\\/dev_tools\\/code\",\"params\":\"\",\"is_cache\":1,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-07-07 11:01:06\",\"update_time\":\"2022-09-21 16:24:28\"},{\"id\":62,\"pid\":23,\"type\":\"C\",\"name\":\"字典数据管理\",\"icon\":\"\",\"sort\":1,\"perms\":\"setting.dict.dict_data\\/lists\",\"paths\":\"dict\\/data\",\"component\":\"setting\\/dict\\/data\\/index\",\"selected\":\"\\/dev_tools\\/dict\",\"params\":\"\",\"is_cache\":1,\"is_show\":0,\"is_disable\":0,\"create_time\":\"2022-07-07 14:12:31\",\"update_time\":\"2022-09-21 15:33:37\"}]}]},{\"id\":148,\"pid\":0,\"type\":\"M\",\"name\":\"模板示例\",\"icon\":\"el-icon-SetUp\",\"sort\":100,\"perms\":\"\",\"paths\":\"template\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:20:19\",\"update_time\":\"2024-03-15 11:20:11\",\"children\":[{\"id\":149,\"pid\":148,\"type\":\"M\",\"name\":\"组件示例\",\"icon\":\"el-icon-Coin\",\"sort\":0,\"perms\":\"\",\"paths\":\"component\",\"component\":\"\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:26:22\",\"update_time\":\"2022-12-05 10:27:24\",\"children\":[{\"id\":152,\"pid\":149,\"type\":\"C\",\"name\":\"图标\",\"icon\":\"\",\"sort\":100,\"perms\":\"\",\"paths\":\"icon\",\"component\":\"template\\/component\\/icon\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 16:47:49\",\"update_time\":\"2024-03-15 11:28:26\"},{\"id\":150,\"pid\":149,\"type\":\"C\",\"name\":\"富文本\",\"icon\":\"\",\"sort\":90,\"perms\":\"\",\"paths\":\"rich_text\",\"component\":\"template\\/component\\/rich_text\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:35:51\",\"update_time\":\"2024-03-15 11:28:35\"},{\"id\":151,\"pid\":149,\"type\":\"C\",\"name\":\"上传文件\",\"icon\":\"\",\"sort\":80,\"perms\":\"\",\"paths\":\"upload\",\"component\":\"template\\/component\\/upload\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 10:55:25\",\"update_time\":\"2024-03-15 11:28:42\"},{\"id\":156,\"pid\":149,\"type\":\"C\",\"name\":\"悬浮input\",\"icon\":\"\",\"sort\":70,\"perms\":\"\",\"paths\":\"popover_input\",\"component\":\"template\\/component\\/popover_input\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-06 10:22:16\",\"update_time\":\"2024-03-15 11:28:49\"},{\"id\":153,\"pid\":149,\"type\":\"C\",\"name\":\"文件选择器\",\"icon\":\"\",\"sort\":60,\"perms\":\"\",\"paths\":\"file\",\"component\":\"template\\/component\\/file\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-05 17:22:09\",\"update_time\":\"2024-03-15 11:29:01\"},{\"id\":154,\"pid\":149,\"type\":\"C\",\"name\":\"链接选择器\",\"icon\":\"\",\"sort\":50,\"perms\":\"\",\"paths\":\"link\",\"component\":\"template\\/component\\/link\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-06 10:10:36\",\"update_time\":\"2024-03-15 11:29:06\"},{\"id\":155,\"pid\":149,\"type\":\"C\",\"name\":\"超出自动打点\",\"icon\":\"\",\"sort\":40,\"perms\":\"\",\"paths\":\"overflow\",\"component\":\"template\\/component\\/overflow\",\"selected\":\"\",\"params\":\"\",\"is_cache\":0,\"is_show\":1,\"is_disable\":0,\"create_time\":\"2022-12-06 10:14:43\",\"update_time\":\"2024-03-15 11:29:11\"}]}]}],\"permissions\":[\"*\"]}}','140.250.132.18',1741163705),(18,1,'admin','admin',' 工作台','GET','http://ai.howlife.cc/adminapi/workbench/index','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"version\":{\"version\":\"1.9.4\",\"website\":\"www.likeadmin.cn\\/\",\"name\":\"likeadmin\",\"based\":\"vue3.x、ElementUI、MySQL\",\"channel\":{\"website\":\"https:\\/\\/www.likeadmin.cn\",\"gitee\":\"https:\\/\\/gitee.com\\/likeadmin\\/likeadmin_php\"}},\"today\":{\"time\":\"2025-03-05 16:35:05\",\"today_sales\":100,\"total_sales\":1000,\"today_visitor\":10,\"total_visitor\":100,\"today_new_user\":30,\"total_new_user\":3000,\"order_num\":12,\"order_sum\":255},\"menu\":[{\"name\":\"管理员\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_admin.png\",\"url\":\"\\/permission\\/admin\"},{\"name\":\"角色管理\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_role.png\",\"url\":\"\\/permission\\/role\"},{\"name\":\"部门管理\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_dept.png\",\"url\":\"\\/organization\\/department\"},{\"name\":\"字典管理\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_dict.png\",\"url\":\"\\/dev_tools\\/dict\"},{\"name\":\"代码生成器\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_generator.png\",\"url\":\"\\/dev_tools\\/code\"},{\"name\":\"素材中心\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_file.png\",\"url\":\"\\/material\\/index\"},{\"name\":\"菜单权限\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_auth.png\",\"url\":\"\\/permission\\/menu\"},{\"name\":\"网站信息\",\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/menu_web.png\",\"url\":\"\\/setting\\/website\\/information\"}],\"visitor\":{\"date\":[\"03\\/05\",\"03\\/04\",\"03\\/03\",\"03\\/02\",\"03\\/01\",\"02\\/28\",\"02\\/27\",\"02\\/26\",\"02\\/25\",\"02\\/24\",\"02\\/23\",\"02\\/22\",\"02\\/21\",\"02\\/20\",\"02\\/19\"],\"list\":[{\"name\":\"访客数\",\"data\":[43,75,100,52,14,76,84,31,86,23,82,65,46,3,52]}]},\"support\":[{\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/qq_group.png\",\"title\":\"官方公众号\",\"desc\":\"关注官方公众号\"},{\"image\":\"http:\\/\\/ai.howlife.cc\\/resource\\/image\\/adminapi\\/default\\/customer_service.jpg\",\"title\":\"添加企业客服微信\",\"desc\":\"想了解更多请添加客服\"}],\"sale\":{\"date\":[\"03\\/05\",\"03\\/04\",\"03\\/03\",\"03\\/02\",\"03\\/01\",\"02\\/28\",\"02\\/27\"],\"list\":[{\"name\":\"销售量\",\"data\":[137,48,83,197,53,148,155]}]}}}','140.250.132.18',1741163705),(19,1,'admin','admin',' 获取公众号配置','GET','http://ai.howlife.cc/adminapi/channel.official_account_setting/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"name\":\"\",\"original_id\":\"\",\"qr_code\":\"\",\"app_id\":\"\",\"app_secret\":\"\",\"url\":\"http:\\/\\/ai.howlife.cc\\/adminapi\\/channel.official_account_reply\\/index\",\"token\":null,\"encoding_aes_key\":\"\",\"encryption_type\":1,\"business_domain\":\"ai.howlife.cc\",\"js_secure_domain\":\"ai.howlife.cc\",\"web_auth_domain\":\"ai.howlife.cc\"}}','140.250.132.18',1741163711),(20,1,'admin','admin',' 获取微信开放平台设置','GET','http://ai.howlife.cc/adminapi/channel.open_setting/getConfig','[]','{\"code\":1,\"show\":0,\"msg\":\"\",\"data\":{\"app_id\":\"\",\"app_secret\":\"\"}}','140.250.132.18',1741163712);
/*!40000 ALTER TABLE `la_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_recharge_order`
--

DROP TABLE IF EXISTS `la_recharge_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_recharge_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sn` varchar(64) NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `pay_sn` varchar(255) DEFAULT '' COMMENT '支付编号-冗余字段，针对微信同一主体不同客户端支付需用不同订单号预留。',
  `pay_way` tinyint(2) NOT NULL DEFAULT '2' COMMENT '支付方式 2-微信支付 3-支付宝支付',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态：0-待支付；1-已支付',
  `pay_time` int(10) DEFAULT NULL COMMENT '支付时间',
  `order_amount` decimal(10,2) NOT NULL COMMENT '充值金额',
  `order_terminal` tinyint(1) DEFAULT '1' COMMENT '终端',
  `transaction_id` varchar(128) DEFAULT NULL COMMENT '第三方平台交易流水号',
  `refund_status` tinyint(1) DEFAULT '0' COMMENT '退款状态 0-未退款 1-已退款',
  `refund_transaction_id` varchar(255) DEFAULT NULL COMMENT '退款交易流水号',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_recharge_order`
--

LOCK TABLES `la_recharge_order` WRITE;
/*!40000 ALTER TABLE `la_recharge_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_recharge_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_refund_log`
--

DROP TABLE IF EXISTS `la_refund_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_refund_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sn` varchar(32) DEFAULT NULL COMMENT '编号',
  `record_id` int(11) NOT NULL COMMENT '退款记录id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联用户',
  `handle_id` int(11) NOT NULL DEFAULT '0' COMMENT '处理人id（管理员id）',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总的应付款金额，冗余字段',
  `refund_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本次退款金额',
  `refund_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '退款状态，0退款中，1退款成功，2退款失败',
  `refund_msg` text COMMENT '退款信息',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_refund_log`
--

LOCK TABLES `la_refund_log` WRITE;
/*!40000 ALTER TABLE `la_refund_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_refund_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_refund_record`
--

DROP TABLE IF EXISTS `la_refund_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_refund_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sn` varchar(32) NOT NULL DEFAULT '' COMMENT '退款编号',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联用户',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源订单id',
  `order_sn` varchar(32) NOT NULL COMMENT '来源单号',
  `order_type` varchar(255) DEFAULT 'order' COMMENT '订单来源 order-商品订单 recharge-充值订单',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总的应付款金额，冗余字段',
  `refund_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本次退款金额',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT '第三方平台交易流水号',
  `refund_way` tinyint(1) NOT NULL DEFAULT '1' COMMENT '退款方式 1-线上退款 2-线下退款',
  `refund_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '退款类型 1-后台退款',
  `refund_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '退款状态，0退款中，1退款成功，2退款失败',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_refund_record`
--

LOCK TABLES `la_refund_record` WRITE;
/*!40000 ALTER TABLE `la_refund_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_refund_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_sms_log`
--

DROP TABLE IF EXISTS `la_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `scene_id` int(11) NOT NULL COMMENT '场景id',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `content` varchar(255) NOT NULL COMMENT '发送内容',
  `code` varchar(32) DEFAULT NULL COMMENT '发送关键字（注册、找回密码）',
  `is_verify` tinyint(1) DEFAULT '0' COMMENT '是否已验证；0-否；1-是',
  `check_num` int(5) DEFAULT '0' COMMENT '验证次数',
  `send_status` tinyint(1) NOT NULL COMMENT '发送状态：0-发送中；1-发送成功；2-发送失败',
  `send_time` int(10) NOT NULL COMMENT '发送时间',
  `results` text COMMENT '短信结果',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_sms_log`
--

LOCK TABLES `la_sms_log` WRITE;
/*!40000 ALTER TABLE `la_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_system_menu`
--

DROP TABLE IF EXISTS `la_system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_system_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `type` char(2) NOT NULL DEFAULT '' COMMENT '权限类型: M=目录，C=菜单，A=按钮',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '菜单排序',
  `perms` varchar(100) NOT NULL DEFAULT '' COMMENT '权限标识',
  `paths` varchar(100) NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(200) NOT NULL DEFAULT '' COMMENT '前端组件',
  `selected` varchar(200) NOT NULL DEFAULT '' COMMENT '选中路径',
  `params` varchar(200) NOT NULL DEFAULT '' COMMENT '路由参数',
  `is_cache` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否缓存: 0=否, 1=是',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示: 0=否, 1=是',
  `is_disable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用: 0=否, 1=是',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_system_menu`
--

LOCK TABLES `la_system_menu` WRITE;
/*!40000 ALTER TABLE `la_system_menu` DISABLE KEYS */;
INSERT INTO `la_system_menu` VALUES (4,0,'M','权限管理','el-icon-Lock',300,'','permission','','','',0,1,0,1656664556,1710472802),(5,0,'C','工作台','el-icon-Monitor',1000,'workbench/index','workbench','workbench/index','','',0,1,0,1656664793,1664354981),(6,4,'C','菜单','el-icon-Operation',100,'auth.menu/lists','menu','permission/menu/index','','',1,1,0,1656664960,1710472994),(7,4,'C','管理员','local-icon-shouyiren',80,'auth.admin/lists','admin','permission/admin/index','','',0,1,0,1656901567,1710473013),(8,4,'C','角色','el-icon-Female',90,'auth.role/lists','role','permission/role/index','','',0,1,0,1656901660,1710473000),(12,8,'A','新增','',1,'auth.role/add','','','','',0,1,0,1657001790,1663750625),(14,8,'A','编辑','',1,'auth.role/edit','','','','',0,1,0,1657001924,1663750631),(15,8,'A','删除','',1,'auth.role/delete','','','','',0,1,0,1657001982,1663750637),(16,6,'A','新增','',1,'auth.menu/add','','','','',0,1,0,1657072523,1663750565),(17,6,'A','编辑','',1,'auth.menu/edit','','','','',0,1,0,1657073955,1663750570),(18,6,'A','删除','',1,'auth.menu/delete','','','','',0,1,0,1657073987,1663750578),(19,7,'A','新增','',1,'auth.admin/add','','','','',0,1,0,1657074035,1663750596),(20,7,'A','编辑','',1,'auth.admin/edit','','','','',0,1,0,1657074071,1663750603),(21,7,'A','删除','',1,'auth.admin/delete','','','','',0,1,0,1657074108,1663750609),(23,28,'M','开发工具','el-icon-EditPen',40,'','dev_tools','','','',0,1,0,1657097744,1710473127),(24,23,'C','代码生成器','el-icon-DocumentAdd',1,'tools.generator/generateTable','code','dev_tools/code/index','','',0,1,0,1657098110,1658989423),(25,0,'M','组织管理','el-icon-OfficeBuilding',400,'','organization','','','',0,1,0,1657099914,1710472797),(26,25,'C','部门管理','el-icon-Coordinate',100,'dept.dept/lists','department','organization/department/index','','',1,1,0,1657099989,1710472962),(27,25,'C','岗位管理','el-icon-PriceTag',90,'dept.jobs/lists','post','organization/post/index','','',0,1,0,1657100044,1710472967),(28,0,'M','系统设置','el-icon-Setting',200,'','setting','','','',0,1,0,1657100164,1710472807),(29,28,'M','网站设置','el-icon-Basketball',100,'','website','','','',0,1,0,1657100230,1710473049),(30,29,'C','网站信息','',1,'setting.web.web_setting/getWebsite','information','setting/website/information','','',0,1,0,1657100306,1657164412),(31,29,'C','网站备案','',1,'setting.web.web_setting/getCopyright','filing','setting/website/filing','','',0,1,0,1657100434,1657164723),(32,29,'C','政策协议','',1,'setting.web.web_setting/getAgreement','protocol','setting/website/protocol','','',0,1,0,1657100571,1657164770),(33,28,'C','存储设置','el-icon-FolderOpened',70,'setting.storage/lists','storage','setting/storage/index','','',0,1,0,1657160959,1710473095),(34,23,'C','字典管理','el-icon-Box',1,'setting.dict.dict_type/lists','dict','setting/dict/type/index','','',0,1,0,1657161211,1663225935),(35,28,'M','系统维护','el-icon-SetUp',50,'','system','','','',0,1,0,1657161569,1710473122),(36,35,'C','系统日志','',90,'setting.system.log/lists','journal','setting/system/journal','','',0,1,0,1657161696,1710473253),(37,35,'C','系统缓存','',80,'','cache','setting/system/cache','','',0,1,0,1657161896,1710473258),(38,35,'C','系统环境','',70,'setting.system.system/info','environment','setting/system/environment','','',0,1,0,1657162000,1710473265),(39,24,'A','导入数据表','',1,'tools.generator/selectTable','','','','',0,1,0,1657162736,1657162736),(40,24,'A','代码生成','',1,'tools.generator/generate','','','','',0,1,0,1657162806,1657162806),(41,23,'C','编辑数据表','',1,'tools.generator/edit','code/edit','dev_tools/code/edit','/dev_tools/code','',1,0,0,1657162866,1663748668),(42,24,'A','同步表结构','',1,'tools.generator/syncColumn','','','','',0,1,0,1657162934,1657162934),(43,24,'A','删除数据表','',1,'tools.generator/delete','','','','',0,1,0,1657163015,1657163015),(44,24,'A','预览代码','',1,'tools.generator/preview','','','','',0,1,0,1657163263,1657163263),(45,26,'A','新增','',1,'dept.dept/add','','','','',0,1,0,1657163548,1663750492),(46,26,'A','编辑','',1,'dept.dept/edit','','','','',0,1,0,1657163599,1663750498),(47,26,'A','删除','',1,'dept.dept/delete','','','','',0,1,0,1657163687,1663750504),(48,27,'A','新增','',1,'dept.jobs/add','','','','',0,1,0,1657163778,1663750524),(49,27,'A','编辑','',1,'dept.jobs/edit','','','','',0,1,0,1657163800,1663750530),(50,27,'A','删除','',1,'dept.jobs/delete','','','','',0,1,0,1657163820,1663750535),(51,30,'A','保存','',1,'setting.web.web_setting/setWebsite','','','','',0,1,0,1657164469,1663750649),(52,31,'A','保存','',1,'setting.web.web_setting/setCopyright','','','','',0,1,0,1657164692,1663750657),(53,32,'A','保存','',1,'setting.web.web_setting/setAgreement','','','','',0,1,0,1657164824,1663750665),(54,33,'A','设置','',1,'setting.storage/setup','','','','',0,1,0,1657165303,1663750673),(55,34,'A','新增','',1,'setting.dict.dict_type/add','','','','',0,1,0,1657166966,1663750783),(56,34,'A','编辑','',1,'setting.dict.dict_type/edit','','','','',0,1,0,1657166997,1663750789),(57,34,'A','删除','',1,'setting.dict.dict_type/delete','','','','',0,1,0,1657167038,1663750796),(58,62,'A','新增','',1,'setting.dict.dict_data/add','','','','',0,1,0,1657167317,1663750758),(59,62,'A','编辑','',1,'setting.dict.dict_data/edit','','','','',0,1,0,1657167371,1663750751),(60,62,'A','删除','',1,'setting.dict.dict_data/delete','','','','',0,1,0,1657167397,1663750768),(61,37,'A','清除系统缓存','',1,'setting.system.cache/clear','','','','',0,1,0,1657173837,1657173939),(62,23,'C','字典数据管理','',1,'setting.dict.dict_data/lists','dict/data','setting/dict/data/index','/dev_tools/dict','',1,0,0,1657174351,1663745617),(63,158,'M','素材管理','el-icon-Picture',0,'','material','','','',0,1,0,1657507133,1710472243),(64,63,'C','素材中心','el-icon-PictureRounded',0,'','index','material/index','','',0,1,0,1657507296,1664355653),(66,26,'A','详情','',0,'dept.dept/detail','','','','',0,1,0,1663725459,1663750516),(67,27,'A','详情','',0,'dept.jobs/detail','','','','',0,1,0,1663725514,1663750559),(68,6,'A','详情','',0,'auth.menu/detail','','','','',0,1,0,1663725564,1663750584),(69,7,'A','详情','',0,'auth.admin/detail','','','','',0,1,0,1663725623,1663750615),(70,158,'M','文章资讯','el-icon-ChatLineSquare',90,'','article','','','',0,1,0,1663749965,1710471867),(71,70,'C','文章管理','el-icon-ChatDotSquare',0,'article.article/lists','lists','article/lists/index','','',0,1,0,1663750101,1664354615),(72,70,'C','文章添加/编辑','',0,'article.article/add:edit','lists/edit','article/lists/edit','/article/lists','',0,0,0,1663750153,1664356275),(73,70,'C','文章栏目','el-icon-CollectionTag',0,'article.articleCate/lists','column','article/column/index','','',1,1,0,1663750287,1664354678),(74,71,'A','新增','',0,'article.article/add','','','','',0,1,0,1663750335,1663750335),(75,71,'A','详情','',0,'article.article/detail','','','','',0,1,0,1663750354,1663750383),(76,71,'A','删除','',0,'article.article/delete','','','','',0,1,0,1663750413,1663750413),(77,71,'A','修改状态','',0,'article.article/updateStatus','','','','',0,1,0,1663750442,1663750442),(78,73,'A','添加','',0,'article.articleCate/add','','','','',0,1,0,1663750483,1663750483),(79,73,'A','删除','',0,'article.articleCate/delete','','','','',0,1,0,1663750895,1663750895),(80,73,'A','详情','',0,'article.articleCate/detail','','','','',0,1,0,1663750913,1663750913),(81,73,'A','修改状态','',0,'article.articleCate/updateStatus','','','','',0,1,0,1663750936,1663750936),(82,0,'M','渠道设置','el-icon-Message',500,'','channel','','','',0,1,0,1663754084,1710472649),(83,82,'C','h5设置','el-icon-Cellphone',100,'channel.web_page_setting/getConfig','h5','channel/h5','','',0,1,0,1663754158,1710472929),(84,83,'A','保存','',0,'channel.web_page_setting/setConfig','','','','',0,1,0,1663754259,1663754259),(85,82,'M','微信公众号','local-icon-dingdan',80,'','wx_oa','','','',0,1,0,1663755470,1710472946),(86,85,'C','公众号配置','',0,'channel.official_account_setting/getConfig','config','channel/wx_oa/config','','',0,1,0,1663755663,1664355450),(87,85,'C','菜单管理','',0,'channel.official_account_menu/detail','menu','channel/wx_oa/menu','','',0,1,0,1663755767,1664355456),(88,86,'A','保存','',0,'channel.official_account_setting/setConfig','','','','',0,1,0,1663755799,1663755799),(89,86,'A','保存并发布','',0,'channel.official_account_menu/save','','','','',0,1,0,1663756490,1663756490),(90,85,'C','关注回复','',0,'channel.official_account_reply/lists','follow','channel/wx_oa/reply/follow_reply','','',0,1,0,1663818358,1663818366),(91,85,'C','关键字回复','',0,'','keyword','channel/wx_oa/reply/keyword_reply','','',0,1,0,1663818445,1663818445),(93,85,'C','默认回复','',0,'','default','channel/wx_oa/reply/default_reply','','',0,1,0,1663818580,1663818580),(94,82,'C','微信小程序','local-icon-weixin',90,'channel.mnp_settings/getConfig','weapp','channel/weapp','','',0,1,0,1663831396,1710472941),(95,94,'A','保存','',0,'channel.mnp_settings/setConfig','','','','',0,1,0,1663831436,1663831436),(96,0,'M','装修管理','el-icon-Brush',600,'','decoration','','','',0,1,0,1663834825,1710472099),(97,175,'C','页面装修','el-icon-CopyDocument',100,'decorate.page/detail','pages','decoration/pages/index','','',0,1,0,1663834879,1710929256),(98,97,'A','保存','',0,'decorate.page/save','','','','',0,1,0,1663834956,1663834956),(99,175,'C','底部导航','el-icon-Position',90,'decorate.tabbar/detail','tabbar','decoration/tabbar','','',0,1,0,1663835004,1710929262),(100,99,'A','保存','',0,'decorate.tabbar/save','','','','',0,1,0,1663835018,1663835018),(101,158,'M','消息管理','el-icon-ChatDotRound',80,'','message','','','',0,1,0,1663838602,1710471874),(102,101,'C','通知设置','',0,'notice.notice/settingLists','notice','message/notice/index','','',0,1,0,1663839195,1663839195),(103,102,'A','详情','',0,'notice.notice/detail','','','','',0,1,0,1663839537,1663839537),(104,101,'C','通知设置编辑','',0,'notice.notice/set','notice/edit','message/notice/edit','/message/notice','',0,0,0,1663839873,1663898477),(105,71,'A','编辑','',0,'article.article/edit','','','','',0,1,0,1663840043,1663840053),(107,101,'C','短信设置','',0,'notice.sms_config/getConfig','short_letter','message/short_letter/index','','',0,1,0,1663898591,1664355708),(108,107,'A','设置','',0,'notice.sms_config/setConfig','','','','',0,1,0,1663898644,1663898644),(109,107,'A','详情','',0,'notice.sms_config/detail','','','','',0,1,0,1663898661,1663898661),(110,28,'C','热门搜索','el-icon-Search',60,'setting.hot_search/getConfig','search','setting/search/index','','',0,1,0,1663901821,1710473109),(111,110,'A','保存','',0,'setting.hot_search/setConfig','','','','',0,1,0,1663901856,1663901856),(112,28,'M','用户设置','local-icon-keziyuyue',90,'','user','','','',0,1,0,1663903302,1710473056),(113,112,'C','用户设置','',0,'setting.user.user/getConfig','setup','setting/user/setup','','',0,1,0,1663903506,1663903506),(114,113,'A','保存','',0,'setting.user.user/setConfig','','','','',0,1,0,1663903522,1663903522),(115,112,'C','登录注册','',0,'setting.user.user/getRegisterConfig','login_register','setting/user/login_register','','',0,1,0,1663903832,1663903832),(116,115,'A','保存','',0,'setting.user.user/setRegisterConfig','','','','',0,1,0,1663903852,1663903852),(117,0,'M','用户管理','el-icon-User',900,'','consumer','','','',0,1,0,1663904351,1710472074),(118,117,'C','用户列表','local-icon-user_guanli',100,'user.user/lists','lists','consumer/lists/index','','',0,1,0,1663904392,1710471845),(119,117,'C','用户详情','',90,'user.user/detail','lists/detail','consumer/lists/detail','/consumer/lists','',0,0,0,1663904470,1710471851),(120,119,'A','编辑','',0,'user.user/edit','','','','',0,1,0,1663904499,1663904499),(140,82,'C','微信开发平台','local-icon-notice_buyer',70,'channel.open_setting/getConfig','open_setting','channel/open_setting','','',0,1,0,1666085713,1710472951),(141,140,'A','保存','',0,'channel.open_setting/setConfig','','','','',0,1,0,1666085751,1666085776),(142,176,'C','PC端装修','el-icon-Monitor',8,'','pc','decoration/pc','','',0,1,0,1668423284,1710901602),(143,35,'C','定时任务','',100,'crontab.crontab/lists','scheduled_task','setting/system/scheduled_task/index','','',0,1,0,1669357509,1710473246),(144,35,'C','定时任务添加/编辑','',0,'crontab.crontab/add:edit','scheduled_task/edit','setting/system/scheduled_task/edit','/setting/system/scheduled_task','',0,0,0,1669357670,1669357765),(145,143,'A','添加','',0,'crontab.crontab/add','','','','',0,1,0,1669358282,1669358282),(146,143,'A','编辑','',0,'crontab.crontab/edit','','','','',0,1,0,1669358303,1669358303),(147,143,'A','删除','',0,'crontab.crontab/delete','','','','',0,1,0,1669358334,1669358334),(148,0,'M','模板示例','el-icon-SetUp',100,'','template','','','',0,1,0,1670206819,1710472811),(149,148,'M','组件示例','el-icon-Coin',0,'','component','','','',0,1,0,1670207182,1670207244),(150,149,'C','富文本','',90,'','rich_text','template/component/rich_text','','',0,1,0,1670207751,1710473315),(151,149,'C','上传文件','',80,'','upload','template/component/upload','','',0,1,0,1670208925,1710473322),(152,149,'C','图标','',100,'','icon','template/component/icon','','',0,1,0,1670230069,1710473306),(153,149,'C','文件选择器','',60,'','file','template/component/file','','',0,1,0,1670232129,1710473341),(154,149,'C','链接选择器','',50,'','link','template/component/link','','',0,1,0,1670292636,1710473346),(155,149,'C','超出自动打点','',40,'','overflow','template/component/overflow','','',0,1,0,1670292883,1710473351),(156,149,'C','悬浮input','',70,'','popover_input','template/component/popover_input','','',0,1,0,1670293336,1710473329),(157,119,'A','余额调整','',0,'user.user/adjustMoney','','','','',0,1,0,1677143088,1677143088),(158,0,'M','应用管理','el-icon-Postcard',800,'','app','','','',0,1,0,1677143430,1710472079),(159,158,'C','用户充值','local-icon-fukuan',100,'recharge.recharge/getConfig','recharge','app/recharge/index','','',0,1,0,1677144284,1710471860),(160,159,'A','保存','',0,'recharge.recharge/setConfig','','','','',0,1,0,1677145012,1677145012),(161,28,'M','支付设置','local-icon-set_pay',80,'','pay','','','',0,1,0,1677148075,1710473061),(162,161,'C','支付方式','',0,'setting.pay.pay_way/getPayWay','method','setting/pay/method/index','','',0,1,0,1677148207,1677148207),(163,161,'C','支付配置','',0,'setting.pay.pay_config/lists','config','setting/pay/config/index','','',0,1,0,1677148260,1677148374),(164,162,'A','设置支付方式','',0,'setting.pay.pay_way/setPayWay','','','','',0,1,0,1677219624,1677219624),(165,163,'A','配置','',0,'setting.pay.pay_config/setConfig','','','','',0,1,0,1677219655,1677219655),(166,0,'M','财务管理','local-icon-user_gaikuang',700,'','finance','','','',0,1,0,1677552269,1710472085),(167,166,'C','充值记录','el-icon-Wallet',90,'recharge.recharge/lists','recharge_record','finance/recharge_record','','',0,1,0,1677552757,1710472902),(168,166,'C','余额明细','local-icon-qianbao',100,'finance.account_log/lists','balance_details','finance/balance_details','','',0,1,0,1677552976,1710472894),(169,167,'A','退款','',0,'recharge.recharge/refund','','','','',0,1,0,1677809715,1677809715),(170,166,'C','退款记录','local-icon-heshoujilu',0,'finance.refund/record','refund_record','finance/refund_record','','',0,1,0,1677811271,1677811271),(171,170,'A','重新退款','',0,'recharge.recharge/refundAgain','','','','',0,1,0,1677811295,1677811295),(172,170,'A','退款日志','',0,'finance.refund/log','','','','',0,1,0,1677811361,1677811361),(173,175,'C','系统风格','el-icon-Brush',80,'','style','decoration/style/style','','',0,1,0,1681635044,1710929278),(174,96,'C','素材中心','local-icon-shangchuanzhaopian',0,'file/listCate','material','material/index','','',0,1,0,1710734367,1710734392),(175,96,'M','移动端','',100,'','mobile','','','',0,1,0,1710901543,1710929294),(176,96,'M','PC端','',90,'','pc','','','',0,1,0,1710901592,1710929299),(177,29,'C','站点统计','',0,'setting.web.web_setting/getSiteStatistics','statistics','setting/website/statistics','','',0,1,0,1726841481,1726843434),(178,177,'A','保存','',0,'setting.web.web_setting/saveSiteStatistics','','','','',1,1,0,1726841507,1726841507);
/*!40000 ALTER TABLE `la_system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_system_role`
--

DROP TABLE IF EXISTS `la_system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_system_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_system_role`
--

LOCK TABLES `la_system_role` WRITE;
/*!40000 ALTER TABLE `la_system_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_system_role_menu`
--

DROP TABLE IF EXISTS `la_system_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_system_role_menu` (
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_system_role_menu`
--

LOCK TABLES `la_system_role_menu` WRITE;
/*!40000 ALTER TABLE `la_system_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_system_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_user`
--

DROP TABLE IF EXISTS `la_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编号',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '头像',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '用户电话',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别: [1=男, 2=女]',
  `channel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '注册渠道: [1-微信小程序 2-微信公众号 3-手机H5 4-电脑PC 5-苹果APP 6-安卓APP]',
  `is_disable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用: [0=否, 1=是]',
  `login_ip` varchar(200) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `is_new_user` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是新注册用户: [1-是, 0-否]',
  `user_money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '用户余额',
  `total_recharge_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '累计充值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sn` (`sn`) USING BTREE COMMENT '编号唯一',
  UNIQUE KEY `account` (`account`) USING BTREE COMMENT '账号唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_user`
--

LOCK TABLES `la_user` WRITE;
/*!40000 ALTER TABLE `la_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_user_account_log`
--

DROP TABLE IF EXISTS `la_user_account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_user_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) NOT NULL DEFAULT '' COMMENT '流水号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `change_object` tinyint(1) NOT NULL DEFAULT '0' COMMENT '变动对象',
  `change_type` smallint(5) NOT NULL COMMENT '变动类型',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '动作 1-增加 2-减少',
  `change_amount` decimal(10,2) NOT NULL COMMENT '变动数量',
  `left_amount` decimal(10,2) NOT NULL DEFAULT '100.00' COMMENT '变动后数量',
  `source_sn` varchar(255) DEFAULT NULL COMMENT '关联单号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `extra` text COMMENT '预留扩展字段',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_user_account_log`
--

LOCK TABLES `la_user_account_log` WRITE;
/*!40000 ALTER TABLE `la_user_account_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_user_account_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_user_auth`
--

DROP TABLE IF EXISTS `la_user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `openid` varchar(128) NOT NULL COMMENT '微信openid',
  `unionid` varchar(128) DEFAULT '' COMMENT '微信unionid',
  `terminal` tinyint(1) NOT NULL DEFAULT '1' COMMENT '客户端类型：1-微信小程序；2-微信公众号；3-手机H5；4-电脑PC；5-苹果APP；6-安卓APP',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_user_auth`
--

LOCK TABLES `la_user_auth` WRITE;
/*!40000 ALTER TABLE `la_user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `la_user_session`
--

DROP TABLE IF EXISTS `la_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `la_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `terminal` tinyint(1) NOT NULL DEFAULT '1' COMMENT '客户端类型：1-微信小程序；2-微信公众号；3-手机H5；4-电脑PC；5-苹果APP；6-安卓APP',
  `token` varchar(32) NOT NULL COMMENT '令牌',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `expire_time` int(10) NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_id_client` (`user_id`,`terminal`) USING BTREE COMMENT '一个用户在一个终端只有一个token',
  UNIQUE KEY `token` (`token`) USING BTREE COMMENT 'token是唯一的'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户会话表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `la_user_session`
--

LOCK TABLES `la_user_session` WRITE;
/*!40000 ALTER TABLE `la_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `la_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ai_howlife_cc'
--

--
-- Dumping routines for database 'ai_howlife_cc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-08 22:08:06
