CREATE DATABASE  IF NOT EXISTS `radio-station` /*!40100 DEFAULT CHARACTER SET gbk */;
USE `radio-station`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: radio-station
-- ------------------------------------------------------
-- Server version	5.5.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audiomes`
--

DROP TABLE IF EXISTS `audiomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiomes` (
  `audioid` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `audioUrl` varchar(2083) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `album` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `authorid` int(11) NOT NULL,
  `image` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`audioid`)
) ENGINE=InnoDB AUTO_INCREMENT=10070 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiomes`
--

LOCK TABLES `audiomes` WRITE;
/*!40000 ALTER TABLE `audiomes` DISABLE KEYS */;
INSERT INTO `audiomes` VALUES (10001,'郭德纲','郭德纲 相声/3f05e9e8f41b879837338ccdd6223a0d','《学问家》','郭德纲相声精选',10003,'郭德纲.png'),(10002,'郭德纲','郭德纲 相声/4d41ed7cd8be822ed4635edc8646eaa1','《人在江湖》 ','郭德纲相声精选',10003,'郭德纲.png'),(10003,'郭德纲','郭德纲 相声/36bcb94a307128af180b949c072a1749','《败家子儿》','郭德纲相声精选',10003,'郭德纲.png'),(10004,'郭德纲','郭德纲 相声/40ddef0f7349969a14b3d6ee8e967170','《一户侯》','郭德纲相声精选',10003,'郭德纲.png'),(10005,'郭德纲','郭德纲 相声/79f1a0064460323778fcdceb0457427c','《拴娃娃》','郭德纲相声精选',10003,'郭德纲.png'),(10006,'郭德纲','郭德纲 相声/82a486f411f08066cadbb19e28144a5f','《文史专家》','郭德纲相声精选',10003,'郭德纲.png'),(10007,'Eva','英语三分钟  英语/2f3d6f3bae3b50526d35c6dca7910313','Phrases forDisagreeing','英语三分钟',10004,'英语三分钟.png'),(10008,'Eva','英语三分钟  英语/8ad62f8f3a78a39d4b787ae1bfa2651f','Phrases for Invitation','英语三分钟',10004,'英语三分钟.png'),(10009,'Eva','英语三分钟  英语/8adcbe6e9fb6703f6ce13ab475d5f932','How are you?','英语三分钟',10004,'英语三分钟.png'),(10010,'Eva','英语三分钟  英语/56ed2b545ec80096a04509c387abd073','How to Make a Suggestion','英语三分钟',10004,'英语三分钟.png'),(10011,'Eva','英语三分钟  英语/3063d88e052b998595be653e519def0a','Informal Ways to Say Yes and No','英语三分钟',10004,'英语三分钟.png'),(10012,'Eva','英语三分钟  英语/28298b888708b1b865b65c8ddc288fff','How to describe relationships','英语三分钟',10004,'英语三分钟.png'),(10013,'梨子','口语天天练  英语/9e912297548df0fb70aba61aa2128527','英语打电话，你必须掌握这几句','口语天天练',10007,'口语天天练.jpg'),(10015,'梨子','口语天天练  英语/978b368365cc7717e110af0a74f73e4b','\"记仇\"不用remember!千万别说错!','口语天天练',10007,'口语天天练.jpg'),(10016,'梨子','口语天天练  英语/424691adc247d6f90c6d924b334bb393','\"没关系\"应该这样表达','口语天天练',10007,'口语天天练.jpg'),(10017,'梨子','口语天天练  英语/a78a560aa57cd41184cddaa501ef7c28','\"脱发\"的英语怎么说？好扎心','口语天天练',10007,'口语天天练.jpg'),(10018,'梨子','口语天天练  英语/bbbc2c1f2c905c281212fa930ab1993f','“应该”不等于should','口语天天练',10007,'口语天天练.jpg'),(10019,'大宇茶馆','话说明朝    大宇茶馆  历史/bf2d369e20a1c8427f1a7846001601ef','洪武出世','话说明朝',10006,'话说明朝.png'),(10020,'大宇茶馆','话说明朝    大宇茶馆  历史/f64ef9e1a8e2ac12c474a00a0d3961ae','石人现身','话说明朝',10006,'话说明朝.png'),(10021,'大宇茶馆','话说明朝    大宇茶馆  历史/b121b6d16e2f9326644891c13b8060b6','仗义疏财','话说明朝',10006,'话说明朝.png'),(10022,'大宇茶馆','话说明朝    大宇茶馆  历史/1cd9e23cd73364e7fd093f519b1b36b4','占据应天','话说明朝',10006,'话说明朝.png'),(10023,'大宇茶馆','话说明朝    大宇茶馆  历史/f8f6065a04dbde534ffb350847e90c54','篡夺帝位','话说明朝',10006,'话说明朝.png'),(10024,'大宇茶馆','话说明朝    大宇茶馆  历史/fe69b14d9bdef38f8d13043126e8871d','太平失守','话说明朝',10006,'话说明朝.png'),(10025,'李峙','李峙的不老歌  李峙/9bf851d738f929f116a4b29d5c383e9b','第一期','李峙的不老歌',10008,'李峙的不老歌.jpg'),(10026,'李峙','李峙的不老歌  李峙/609bcb0df0c18701010af4faf162166c','第二期','李峙的不老歌',10008,'李峙的不老歌.jpg'),(10027,'李峙','李峙的不老歌  李峙/bbf358b61e3a5c7bedde6912292692ec','第三期','李峙的不老歌',10008,'李峙的不老歌.jpg'),(10028,'李峙','李峙的不老歌  李峙/db9ee13b6016e696115cfcc4ac5e6a6b','第四期','李峙的不老歌',10008,'李峙的不老歌.jpg'),(10029,'李峙','李峙的不老歌  李峙/e36844e44dc4ac9b0bfb64be0c52ae86','第五期','李峙的不老歌',10008,'李峙的不老歌.jpg'),(10030,'李峙','李峙的不老歌  李峙/ebe87d6d5c56c5129fd716251a982ccd','第六期','李峙的不老歌',10008,'李峙的不老歌.jpg'),(10031,'谢涛','听谢涛.秦汉  历史/0a0cc6da741089432ff82eabe7c94933','始皇帝（上）','听谢涛.秦汉',10009,'听谢涛 秦汉.jpg'),(10032,'谢涛','听谢涛.秦汉  历史/01cdd6cf52e2dc059e9eb58e31d83e07','始皇帝（下）','听谢涛.秦汉',10009,'听谢涛 秦汉.jpg'),(10033,'谢涛','听谢涛.秦汉  历史/5aafa011f78b763309c4ce516f2ed328','泰山封禅（上）','听谢涛.秦汉',10009,'听谢涛 秦汉.jpg'),(10034,'谢涛','听谢涛.秦汉  历史/b45145ad1e35427b4bba3bdf1a19924e','泰山封禅（下）','听谢涛.秦汉',10009,'听谢涛 秦汉.jpg'),(10035,'谢涛','听谢涛.秦汉  历史/e7b508857ee27e3630e108e681fd15b7','张良拜师（上）','听谢涛.秦汉',10009,'听谢涛 秦汉.jpg'),(10036,'谢涛','听谢涛.秦汉  历史/2a6071ca68ed74131bd26d5c1f313ae5','张良拜师（下）','听谢涛.秦汉',10009,'听谢涛 秦汉.jpg'),(10037,'笑话事务所','笑话事务所  段子/2b8a157d6c4f73273fe34483a012e773','快递公司为什么很少有女快递员？','笑话事务所',10011,'笑话事务所.png'),(10038,'笑话事务所','笑话事务所  段子/5d6b64c4b8efb763666d0df674a844a0','胖子的未来，就是变成死胖子！','笑话事务所',10011,'笑话事务所.png'),(10039,'笑话事务所','笑话事务所  段子/56ffee0c34e09158b18181d10feb0eb5','比起一个人吃火锅，更忧伤的是一个人没钱吃火锅','笑话事务所',10011,'笑话事务所.png'),(10040,'笑话事务所','笑话事务所  段子/a0f5ff3c5c0da0645712b4f0277372b2','下班路上被歹徒抢了包包，不报警也不去追究竟是为何？','笑话事务所',10011,'笑话事务所.png'),(10041,'笑话事务所','笑话事务所  段子/acc9207c3fe12ab0c717e9b171b7c1d8','未满18岁请在大人的陪同下观看','笑话事务所',10011,'笑话事务所.png'),(10042,'笑话事务所','笑话事务所  段子/e4a8b66bac66c82f0416364790ffcb41','猴哥有妖怪快保护师傅','笑话事务所',10011,'笑话事务所.png'),(10043,'岳云鹏','岳云鹏最新相声  相声/6b4e6cac59310bf7b33b0dc3b99f5b14','《满洲话》岳云鹏 孙越 湖广会馆','岳云鹏最新相声',10012,'岳云鹏.png'),(10044,'岳云鹏','岳云鹏最新相声  相声/6dad5185a1154e7f4a4843e24d2a1181','《我的style》岳云鹏 孙越 天津春晚','岳云鹏最新相声',10012,'岳云鹏.png'),(10045,'岳云鹏','岳云鹏最新相声  相声/7ecca02a6d293e356e7506a50e6dd5fa','《戏嫦娥》岳云鹏 孙越 天桥茶馆','岳云鹏最新相声',10012,'岳云鹏.png'),(10046,'岳云鹏','岳云鹏最新相声  相声/f8af0864898fe9c24d5da7ec423254a3','《乡村爱情》岳云鹏 孙越 天桥茶馆','岳云鹏最新相声',10012,'岳云鹏.png'),(10047,'岳云鹏','岳云鹏最新相声  相声/fda2cfee08fca4dfdadcc7a7ba008754','《杂学唱》岳云鹏 孙越 河北春晚','岳云鹏最新相声',10012,'岳云鹏.png'),(10048,'岳云鹏','岳云鹏最新相声  相声/fe4160fe2def47e30477cde42c6fc5b9','《点歌台》岳云鹏 孙越 岁末小封箱','岳云鹏最新相声',10012,'岳云鹏.png'),(10049,'紫依','勿忘初心 不负流年  紫依   听歌/6f9b4b61b5f1e97eabb5ed890407363d','红昭愿','勿忘初心 不负流年',10010,'勿忘初心 不负流年  紫依.jpg'),(10050,'紫依','勿忘初心 不负流年  紫依   听歌/7a6061e64d7e3761ad0554a5d45d9533','天分','勿忘初心 不负流年',10010,'勿忘初心 不负流年  紫依.jpg'),(10051,'紫依','勿忘初心 不负流年  紫依   听歌/8c0bdd2ef32e0536bb8e9ea99bf37494','小狐狸——《东宫》插曲','勿忘初心 不负流年',10010,'勿忘初心 不负流年  紫依.jpg'),(10052,'紫依','勿忘初心 不负流年  紫依   听歌/5773f752da834dc0563f3411481ca16a','时光摇篮（原创）','勿忘初心 不负流年',10010,'勿忘初心 不负流年  紫依.jpg'),(10053,'紫依','勿忘初心 不负流年  紫依   听歌/211949b4e1fc7624b39042dbd5ae4ace','九万字','勿忘初心 不负流年',10010,'勿忘初心 不负流年  紫依.jpg'),(10054,'紫依','勿忘初心 不负流年  紫依   听歌/cfd321d99dcd149ef5905ebbeba76624','一爱难求——《扶摇》片尾曲','勿忘初心 不负流年',10010,'勿忘初心 不负流年  紫依.jpg'),(10055,'阿哈东北','东北讲笑话  阿哈东北  段子/1cd280c36098b9749697b98c5fe7b46d','女生要多长时间才能哄好呢？','东北讲笑话',10005,'阿哈东北.jpg'),(10056,'阿哈东北','东北讲笑话  阿哈东北  段子/06bc8ef92272d868247d25b5510f24bf','你们喜欢这么可爱的媳妇吗','东北讲笑话',10005,'阿哈东北.jpg'),(10057,'阿哈东北','东北讲笑话  阿哈东北  段子/821b3f0e04d7f7c4a9d9701215deddfe','把你另一半换100万你愿意吗？','东北讲笑话',10005,'阿哈东北.jpg'),(10058,'阿哈东北','东北讲笑话  阿哈东北  段子/a00a2576b0ebc04665595731e771c432','那个蓝瓶的酒叫什么来着？','东北讲笑话',10005,'阿哈东北.jpg'),(10059,'阿哈东北','东北讲笑话  阿哈东北  段子/b2e834b4b75ad03bfe331a87a6c9de0c','站在电线上的鸟被电死了？','东北讲笑话',10005,'阿哈东北.jpg'),(10060,'阿哈东北','东北讲笑话  阿哈东北  段子/b74caec3f463609007764fdeddb47a42','男人逛街简直了','东北讲笑话',10005,'阿哈东北.jpg'),(10061,'岩','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.obL5CfOc3w6B5f11f0287c0e4c03986908e56bc48795.silk','first','我的列表',10032,'yan.jpg'),(10062,'岩','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.DsO36eP4WgVRff053259a620e65cb3922748be92ae3c.silk','second','我的列表',10032,'yan.jpg'),(10063,'郭德纲','郭德纲 相声/0e99ac1faf56079be71aba088def1f88','《大上寿》','郭德纲相声精选',10003,'郭德纲.png'),(10064,'岩','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.obL5CfOc3w6B5f11f0287c0e4c03986908e56bc48795.silk\r\n','third','我的专辑',0,'wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.P6fdRjdVZDO9ea6d8f98e1dfb466431cf3ceb876ced7.png\r\n'),(10065,'岩','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.A8H4o9zZwlPb34d96f377ae3976b289dca39afa87846.durationTime=6002.mp3','third','我的专辑',10032,'wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.P6fdRjdVZDO9ea6d8f98e1dfb466431cf3ceb876ced7.png\r\n'),(10066,'岩','','第一次提交','我的专辑',10038,'tmp_5180b019acc9ea025969a22cdfc71d3513aed28c10931d55.jpg'),(10067,'岩','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.iY2hclNhTj2Db3b3633bd16f2e31e7656ea66d201f11.durationTime=6003.mp3\r\n','four','我的专辑',10032,'wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.P6fdRjdVZDO9ea6d8f98e1dfb466431cf3ceb876ced7.png\r\n'),(10068,'岩','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.VRIfrxiWEbW92b74093f28ee229dbc5e9552a3015940.durationTime=6002.mp3\r\n','6月17','我的专辑',10032,'wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.P6fdRjdVZDO9ea6d8f98e1dfb466431cf3ceb876ced7.png\r\n'),(10069,'岩','wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.qQDrT8M4CNWJc588461c67c63992dba6ca511be1d94d.durationTime=6011.mp3\r\n','six','我的专辑',10032,'wxc28aa3218c79e8f6.o6zAJs4i341ERP8FrVPBrIpVVqdw.P6fdRjdVZDO9ea6d8f98e1dfb466431cf3ceb876ced7.png\r\n');
/*!40000 ALTER TABLE `audiomes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-18 19:27:50
