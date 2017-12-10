/*
Navicat MySQL Data Transfer

Source Server         : mysql_conn
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : db_hwm

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-03-01 09:44:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminName` (`adminName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('6', 'libaoshen', 'e10adc3949ba59abbe56e057f20f883e', '18202710065', 'libaoshen@qq.com');
INSERT INTO `tb_admin` VALUES ('9', 'yaohaoyu', '202cb962ac59075b964b07152d234b70', '13812345678', 'yhy@qq.com');
INSERT INTO `tb_admin` VALUES ('10', 'zhangxq', '202cb962ac59075b964b07152d234b70', '13887654321', 'zxq@hust.com');
INSERT INTO `tb_admin` VALUES ('11', 'wangzhi', '202cb962ac59075b964b07152d234b70', '18212345678', 'wz@hust.com');

-- ----------------------------
-- Table structure for `tb_admin_role_rela`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_role_rela`;
CREATE TABLE `tb_admin_role_rela` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `adminId` int(4) NOT NULL,
  `roleId` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adminId` (`adminId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `tb_admin_role_rela_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `tb_admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_admin_role_rela_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `tb_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin_role_rela
-- ----------------------------
INSERT INTO `tb_admin_role_rela` VALUES ('3', '6', '1');
INSERT INTO `tb_admin_role_rela` VALUES ('6', '9', '2');
INSERT INTO `tb_admin_role_rela` VALUES ('7', '10', '3');
INSERT INTO `tb_admin_role_rela` VALUES ('8', '11', '4');

-- ----------------------------
-- Table structure for `tb_collection`
-- ----------------------------
DROP TABLE IF EXISTS `tb_collection`;
CREATE TABLE `tb_collection` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userId` int(4) NOT NULL,
  `musicId` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `musicId` (`musicId`),
  CONSTRAINT `tb_collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_collection_ibfk_2` FOREIGN KEY (`musicId`) REFERENCES `tb_music` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_collection
-- ----------------------------
INSERT INTO `tb_collection` VALUES ('1', '4', '52');
INSERT INTO `tb_collection` VALUES ('2', '4', '53');
INSERT INTO `tb_collection` VALUES ('3', '4', '57');
INSERT INTO `tb_collection` VALUES ('4', '4', '60');
INSERT INTO `tb_collection` VALUES ('5', '4', '59');
INSERT INTO `tb_collection` VALUES ('6', '4', '55');
INSERT INTO `tb_collection` VALUES ('15', '4', '72');
INSERT INTO `tb_collection` VALUES ('17', '4', '56');
INSERT INTO `tb_collection` VALUES ('18', '4', '61');
INSERT INTO `tb_collection` VALUES ('21', '4', '63');
INSERT INTO `tb_collection` VALUES ('23', '4', '70');
INSERT INTO `tb_collection` VALUES ('24', '4', '66');
INSERT INTO `tb_collection` VALUES ('26', '4', '67');
INSERT INTO `tb_collection` VALUES ('27', '4', '65');
INSERT INTO `tb_collection` VALUES ('28', '4', '68');
INSERT INTO `tb_collection` VALUES ('35', '4', '76');
INSERT INTO `tb_collection` VALUES ('36', '4', '75');
INSERT INTO `tb_collection` VALUES ('44', '5', '72');
INSERT INTO `tb_collection` VALUES ('47', '5', '68');
INSERT INTO `tb_collection` VALUES ('49', '5', '60');
INSERT INTO `tb_collection` VALUES ('50', '5', '59');
INSERT INTO `tb_collection` VALUES ('51', '5', '77');
INSERT INTO `tb_collection` VALUES ('52', '5', '79');
INSERT INTO `tb_collection` VALUES ('53', '4', '79');
INSERT INTO `tb_collection` VALUES ('54', '4', '77');
INSERT INTO `tb_collection` VALUES ('55', '4', '96');
INSERT INTO `tb_collection` VALUES ('56', '4', '84');
INSERT INTO `tb_collection` VALUES ('58', '7', '56');
INSERT INTO `tb_collection` VALUES ('59', '7', '57');
INSERT INTO `tb_collection` VALUES ('60', '7', '61');
INSERT INTO `tb_collection` VALUES ('61', '7', '53');
INSERT INTO `tb_collection` VALUES ('62', '7', '63');
INSERT INTO `tb_collection` VALUES ('63', '7', '55');
INSERT INTO `tb_collection` VALUES ('64', '7', '60');
INSERT INTO `tb_collection` VALUES ('65', '7', '65');
INSERT INTO `tb_collection` VALUES ('66', '7', '70');
INSERT INTO `tb_collection` VALUES ('67', '7', '72');
INSERT INTO `tb_collection` VALUES ('68', '7', '59');
INSERT INTO `tb_collection` VALUES ('69', '7', '76');
INSERT INTO `tb_collection` VALUES ('70', '7', '79');
INSERT INTO `tb_collection` VALUES ('71', '7', '67');
INSERT INTO `tb_collection` VALUES ('72', '7', '66');
INSERT INTO `tb_collection` VALUES ('73', '7', '68');
INSERT INTO `tb_collection` VALUES ('74', '7', '77');
INSERT INTO `tb_collection` VALUES ('75', '7', '96');
INSERT INTO `tb_collection` VALUES ('76', '7', '84');

-- ----------------------------
-- Table structure for `tb_comments`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comments`;
CREATE TABLE `tb_comments` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `userId` int(4) NOT NULL,
  `musicId` int(4) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `commentTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `love` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `musicId` (`musicId`),
  CONSTRAINT `tb_comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_comments_ibfk_2` FOREIGN KEY (`musicId`) REFERENCES `tb_music` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comments
-- ----------------------------
INSERT INTO `tb_comments` VALUES ('1', '4', '53', '这首歌很好听！', '2017-02-27 10:45:15', '1');
INSERT INTO `tb_comments` VALUES ('2', '4', '53', 'very good!', '2017-02-27 10:45:41', '0');
INSERT INTO `tb_comments` VALUES ('3', '4', '53', 'safd', '2017-02-27 10:47:20', '0');
INSERT INTO `tb_comments` VALUES ('4', '4', '52', 'sdfsa', '2017-02-27 10:50:46', '0');
INSERT INTO `tb_comments` VALUES ('5', '4', '53', 'sfdadf', '2017-02-27 10:51:49', '0');
INSERT INTO `tb_comments` VALUES ('6', '4', '52', '这首歌真好听!', '2017-02-27 11:43:10', '0');
INSERT INTO `tb_comments` VALUES ('15', '4', '52', '哈哈', '2017-02-27 17:04:31', '0');
INSERT INTO `tb_comments` VALUES ('16', '4', '76', '好听啊', '2017-02-27 22:17:34', '0');
INSERT INTO `tb_comments` VALUES ('17', '4', '53', 'keyi', '2017-02-28 15:01:48', '0');
INSERT INTO `tb_comments` VALUES ('18', '5', '79', 'hao', '2017-02-28 19:45:32', '0');
INSERT INTO `tb_comments` VALUES ('19', '4', '53', '不错', '2017-02-28 21:01:03', '0');
INSERT INTO `tb_comments` VALUES ('20', '4', '65', '没听过', '2017-02-28 21:02:52', '0');
INSERT INTO `tb_comments` VALUES ('21', '7', '52', '好听', '2017-03-01 00:28:52', '0');

-- ----------------------------
-- Table structure for `tb_download`
-- ----------------------------
DROP TABLE IF EXISTS `tb_download`;
CREATE TABLE `tb_download` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(4) NOT NULL,
  `musicId` int(4) NOT NULL,
  `downloadTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `counts` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `musicId` (`musicId`),
  CONSTRAINT `tb_download_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_download_ibfk_2` FOREIGN KEY (`musicId`) REFERENCES `tb_music` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_download
-- ----------------------------
INSERT INTO `tb_download` VALUES ('25', '4', '63', '2017-02-27 21:15:04', '2');
INSERT INTO `tb_download` VALUES ('26', '4', '57', '2017-02-28 20:51:29', '3');
INSERT INTO `tb_download` VALUES ('27', '5', '79', '2017-02-28 19:45:19', '1');
INSERT INTO `tb_download` VALUES ('28', '4', '56', '2017-02-28 20:46:11', '1');
INSERT INTO `tb_download` VALUES ('29', '4', '65', '2017-02-28 21:04:16', '1');
INSERT INTO `tb_download` VALUES ('30', '7', '52', '2017-03-01 00:25:11', '1');

-- ----------------------------
-- Table structure for `tb_love`
-- ----------------------------
DROP TABLE IF EXISTS `tb_love`;
CREATE TABLE `tb_love` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(4) NOT NULL,
  `commentId` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `commentId` (`commentId`),
  CONSTRAINT `tb_love_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_love_ibfk_2` FOREIGN KEY (`commentId`) REFERENCES `tb_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_love
-- ----------------------------
INSERT INTO `tb_love` VALUES ('5', '4', '1');

-- ----------------------------
-- Table structure for `tb_music`
-- ----------------------------
DROP TABLE IF EXISTS `tb_music`;
CREATE TABLE `tb_music` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `musicName` varchar(30) NOT NULL,
  `uploadTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `playCounts` int(6) NOT NULL,
  `img` varchar(50) NOT NULL,
  `lyr` varchar(50) NOT NULL,
  `musicTime` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_music
-- ----------------------------
INSERT INTO `tb_music` VALUES ('52', '见习爱神', '2017-02-20 15:28:43', '112', '见习爱神.jpg', '见习爱神.lrc', '03:31');
INSERT INTO `tb_music` VALUES ('53', '南方', '2017-02-20 15:29:31', '29', '南方.jpg', '南方.lrc', '04:31');
INSERT INTO `tb_music` VALUES ('55', '小鸟睡在我身旁', '2017-02-20 15:30:28', '20', '小鸟睡在我身旁.jpg', '小鸟睡在我身旁.lrc', '02:41');
INSERT INTO `tb_music` VALUES ('56', '旧欢如梦', '2017-02-20 15:31:00', '49', '旧欢如梦.jpg', '旧欢如梦.lrc', '02:39');
INSERT INTO `tb_music` VALUES ('57', 'single boy single dog', '2017-02-20 15:31:39', '40', 'single boy single dog.jpg', 'single boy single dog.lrc', '05:22');
INSERT INTO `tb_music` VALUES ('59', '另一个天堂', '2017-02-20 15:32:20', '12', '另一个天堂.jpg', '另一个天堂.lrc', '04:26');
INSERT INTO `tb_music` VALUES ('60', '我最亲爱的', '2017-02-20 15:32:48', '17', '我最亲爱的.jpg', '我最亲爱的.lrc', '04:44');
INSERT INTO `tb_music` VALUES ('61', '做你的男人', '2017-02-20 15:33:13', '34', '做你的男人.jpg', '做你的男人.lrc', '04:33');
INSERT INTO `tb_music` VALUES ('63', '在此刻', '2017-02-20 22:01:16', '24', '在此刻.jpg', '在此刻.lrc', '03:42');
INSERT INTO `tb_music` VALUES ('65', '一吻天荒', '2017-02-20 22:05:25', '13', '一吻天荒.jpg', '一吻天荒.lrc', '04:10');
INSERT INTO `tb_music` VALUES ('66', '不敢听情歌', '2017-02-20 22:07:19', '10', '不敢听情歌.jpg', '不敢听情歌.lrc', '03:41');
INSERT INTO `tb_music` VALUES ('67', '闹够了没有', '2017-02-20 22:08:22', '11', '闹够了没有.jpg', '闹够了没有.lrc', '03:58');
INSERT INTO `tb_music` VALUES ('68', '最后我们都变了', '2017-02-20 22:09:05', '10', '最后我们都变了.jpg', '最后我们都变了.lrc', '03:46');
INSERT INTO `tb_music` VALUES ('70', '不将就', '2017-02-20 22:11:26', '13', '不将就.jpg', '不将就.lrc', '05:13');
INSERT INTO `tb_music` VALUES ('72', '命运派对', '2017-02-22 14:56:28', '13', '命运派对.jpg', '命运派对.lrc', '04:58');
INSERT INTO `tb_music` VALUES ('75', '领跑2017爱在一起演唱会', '2017-02-27 14:53:23', '0', '领跑2017爱在一起演唱会.jpg', '领跑2017爱在一起演唱会.lrc', '09:19');
INSERT INTO `tb_music` VALUES ('76', '爱和承诺', '2017-02-27 15:43:52', '12', '爱和承诺.jpg', '爱和承诺.lrc', '05:26');
INSERT INTO `tb_music` VALUES ('77', '青花瓷', '2017-02-28 17:26:56', '6', '青花瓷.jpg', '青花瓷.lrc', '03:59');
INSERT INTO `tb_music` VALUES ('78', '告白气球', '2017-02-28 17:27:37', '1', '告白气球.jpg', '告白气球.lrc', '03:32');
INSERT INTO `tb_music` VALUES ('79', '红尘客栈', '2017-02-28 17:29:23', '13', '红尘客栈.jpg', '红尘客栈.lrc', '04:34');
INSERT INTO `tb_music` VALUES ('80', '花儿与少年', '2017-02-28 22:56:20', '1', '花儿与少年.jpg', '花儿与少年.lrc', '02:21');
INSERT INTO `tb_music` VALUES ('81', '杉杉来了 电视剧原声带', '2017-02-28 22:57:05', '1', '杉杉来了 电视剧原声带.jpg', '杉杉来了 电视剧原声带.lrc', '03:54');
INSERT INTO `tb_music` VALUES ('82', '拾忆', '2017-02-28 22:57:44', '2', '拾忆.jpg', '拾忆.lrc', '03:46');
INSERT INTO `tb_music` VALUES ('83', '冬天的秘密', '2017-02-28 22:58:35', '1', '冬天的秘密.jpg', '冬天的秘密.lrc', '04:32');
INSERT INTO `tb_music` VALUES ('84', '黄昏', '2017-02-28 22:59:24', '2', '黄昏.jpg', '黄昏.lrc', '05:44');
INSERT INTO `tb_music` VALUES ('85', '寂寞沙洲冷', '2017-02-28 23:00:01', '2', '寂寞沙洲冷.jpg', '寂寞沙洲冷.lrc', '04:34');
INSERT INTO `tb_music` VALUES ('86', '演员', '2017-02-28 23:00:51', '2', '演员.jpg', '演员.lrc', '04:21');
INSERT INTO `tb_music` VALUES ('87', '薛之谦 - 丑八怪', '2017-02-28 23:01:23', '1', '薛之谦 - 丑八怪.jpg', '薛之谦 - 丑八怪.lrc', '04:08');
INSERT INTO `tb_music` VALUES ('88', '你还要我怎样 (Live)', '2017-02-28 23:01:55', '3', '你还要我怎样 (Live).jpg', '你还要我怎样 (Live).lrc', '05:03');
INSERT INTO `tb_music` VALUES ('89', '王凯 - 一次就好 (Live)', '2017-02-28 23:02:49', '2', '王凯 - 一次就好 (Live).jpg', '王凯 - 一次就好 (Live).lrc', '04:54');
INSERT INTO `tb_music` VALUES ('90', '王凯 - 好久不见 (Live)', '2017-02-28 23:03:25', '1', '王凯 - 好久不见 (Live).jpg', '王凯 - 好久不见 (Live).lrc', '04:07');
INSERT INTO `tb_music` VALUES ('91', '徐良 - 后会无期', '2017-02-28 23:04:19', '1', '徐良 - 后会无期.jpg', '徐良 - 后会无期.lrc', '03:31');
INSERT INTO `tb_music` VALUES ('92', '汪苏泷 - 不分手的恋爱', '2017-02-28 23:04:44', '2', '汪苏泷 - 不分手的恋爱.jpg', '汪苏泷 - 不分手的恋爱.lrc', '03:25');
INSERT INTO `tb_music` VALUES ('93', '汪苏泷 - 不分手的恋爱', '2017-02-28 23:06:38', '1', '汪苏泷 - 不分手的恋爱.jpg', '汪苏泷 - 不分手的恋爱.lrc', '03:16');
INSERT INTO `tb_music` VALUES ('94', '心动心痛', '2017-02-28 23:07:49', '2', '心动心痛.jpg', '心动心痛.lrc', '03:51');
INSERT INTO `tb_music` VALUES ('95', '彩虹天堂', '2017-02-28 23:08:29', '1', '彩虹天堂.jpg', '彩虹天堂.lrc', '05:04');
INSERT INTO `tb_music` VALUES ('96', '刘畊宏_天使之城-迦南美地_4', '2017-02-28 23:08:50', '4', '刘畊宏_天使之城-迦南美地_4.jpg', '刘畊宏_天使之城-迦南美地_4.lrc', '04:24');
INSERT INTO `tb_music` VALUES ('99', '李白', '2017-02-28 23:15:02', '3', '李白.jpg', '李白.lrc', '02:00');
INSERT INTO `tb_music` VALUES ('100', '给我一个理由忘记', '2017-02-28 23:19:33', '1', '给我一个理由忘记.jpg', '给我一个理由忘记.lrc', '04:46');
INSERT INTO `tb_music` VALUES ('101', '随心所遇', '2017-02-28 23:20:03', '2', '随心所遇.jpg', '随心所遇.lrc', '04:11');
INSERT INTO `tb_music` VALUES ('102', '给我一个理由忘记 (Live)', '2017-02-28 23:20:30', '0', '给我一个理由忘记 (Live).jpg', '给我一个理由忘记 (Live).lrc', '04:31');
INSERT INTO `tb_music` VALUES ('103', '本兮 - 别闹', '2017-02-28 23:22:39', '0', '本兮 - 别闹.jpg', '本兮 - 别闹.lrc', '03:04');
INSERT INTO `tb_music` VALUES ('106', 'Justin Bieber - Boyfriend', '2017-02-28 23:25:23', '0', 'Justin Bieber - Boyfriend.jpg', 'Justin Bieber - Boyfriend.lrc', '02:52');
INSERT INTO `tb_music` VALUES ('107', 'Adele - Someone Like You', '2017-02-28 23:26:06', '0', 'Adele - Someone Like You.jpg', 'Adele - Someone Like You.lrc', '04:45');
INSERT INTO `tb_music` VALUES ('108', 'What Doesn\'t Kill You', '2017-02-28 23:27:23', '0', 'What Doesn\'t Kill You.jpg', 'What Doesn\'t Kill You.lrc', '03:39');
INSERT INTO `tb_music` VALUES ('115', '小星星', '2017-03-01 00:50:20', '2', '小星星.jpg', '小星星.lrc', '06:51');

-- ----------------------------
-- Table structure for `tb_music_singer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_music_singer`;
CREATE TABLE `tb_music_singer` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `musicId` int(4) NOT NULL,
  `singerId` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `musicId` (`musicId`),
  KEY `singerId` (`singerId`),
  CONSTRAINT `tb_music_singer_ibfk_1` FOREIGN KEY (`musicId`) REFERENCES `tb_music` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_music_singer_ibfk_2` FOREIGN KEY (`singerId`) REFERENCES `tb_singer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_music_singer
-- ----------------------------
INSERT INTO `tb_music_singer` VALUES ('28', '52', '27');
INSERT INTO `tb_music_singer` VALUES ('29', '53', '28');
INSERT INTO `tb_music_singer` VALUES ('31', '55', '30');
INSERT INTO `tb_music_singer` VALUES ('32', '56', '31');
INSERT INTO `tb_music_singer` VALUES ('33', '57', '32');
INSERT INTO `tb_music_singer` VALUES ('35', '59', '34');
INSERT INTO `tb_music_singer` VALUES ('36', '60', '35');
INSERT INTO `tb_music_singer` VALUES ('37', '61', '36');
INSERT INTO `tb_music_singer` VALUES ('39', '63', '49');
INSERT INTO `tb_music_singer` VALUES ('41', '65', '49');
INSERT INTO `tb_music_singer` VALUES ('42', '66', '48');
INSERT INTO `tb_music_singer` VALUES ('43', '67', '48');
INSERT INTO `tb_music_singer` VALUES ('44', '68', '48');
INSERT INTO `tb_music_singer` VALUES ('46', '70', '47');
INSERT INTO `tb_music_singer` VALUES ('48', '72', '64');
INSERT INTO `tb_music_singer` VALUES ('51', '75', '47');
INSERT INTO `tb_music_singer` VALUES ('52', '76', '142');
INSERT INTO `tb_music_singer` VALUES ('53', '77', '38');
INSERT INTO `tb_music_singer` VALUES ('54', '78', '38');
INSERT INTO `tb_music_singer` VALUES ('55', '79', '38');
INSERT INTO `tb_music_singer` VALUES ('56', '80', '41');
INSERT INTO `tb_music_singer` VALUES ('57', '81', '41');
INSERT INTO `tb_music_singer` VALUES ('58', '82', '41');
INSERT INTO `tb_music_singer` VALUES ('59', '83', '40');
INSERT INTO `tb_music_singer` VALUES ('60', '84', '40');
INSERT INTO `tb_music_singer` VALUES ('61', '85', '40');
INSERT INTO `tb_music_singer` VALUES ('62', '86', '42');
INSERT INTO `tb_music_singer` VALUES ('63', '87', '42');
INSERT INTO `tb_music_singer` VALUES ('64', '88', '42');
INSERT INTO `tb_music_singer` VALUES ('65', '89', '44');
INSERT INTO `tb_music_singer` VALUES ('66', '90', '44');
INSERT INTO `tb_music_singer` VALUES ('67', '91', '45');
INSERT INTO `tb_music_singer` VALUES ('68', '92', '45');
INSERT INTO `tb_music_singer` VALUES ('69', '93', '45');
INSERT INTO `tb_music_singer` VALUES ('70', '94', '46');
INSERT INTO `tb_music_singer` VALUES ('71', '95', '46');
INSERT INTO `tb_music_singer` VALUES ('72', '96', '46');
INSERT INTO `tb_music_singer` VALUES ('75', '99', '47');
INSERT INTO `tb_music_singer` VALUES ('76', '100', '50');
INSERT INTO `tb_music_singer` VALUES ('77', '101', '50');
INSERT INTO `tb_music_singer` VALUES ('78', '102', '50');
INSERT INTO `tb_music_singer` VALUES ('79', '103', '51');
INSERT INTO `tb_music_singer` VALUES ('82', '106', '79');
INSERT INTO `tb_music_singer` VALUES ('83', '107', '82');
INSERT INTO `tb_music_singer` VALUES ('84', '108', '85');
INSERT INTO `tb_music_singer` VALUES ('91', '115', '72');

-- ----------------------------
-- Table structure for `tb_music_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_music_type`;
CREATE TABLE `tb_music_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) NOT NULL,
  `value` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `typeName` (`typeName`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_music_type
-- ----------------------------
INSERT INTO `tb_music_type` VALUES ('1', '华语', '1');
INSERT INTO `tb_music_type` VALUES ('2', '英语', '2');
INSERT INTO `tb_music_type` VALUES ('3', '粤语', '3');
INSERT INTO `tb_music_type` VALUES ('4', '韩语', '4');
INSERT INTO `tb_music_type` VALUES ('5', '日语', '5');
INSERT INTO `tb_music_type` VALUES ('6', '流行', '6');
INSERT INTO `tb_music_type` VALUES ('7', '摇滚', '7');
INSERT INTO `tb_music_type` VALUES ('8', '民谣', '8');
INSERT INTO `tb_music_type` VALUES ('9', '说唱', '9');
INSERT INTO `tb_music_type` VALUES ('10', '电子', '10');
INSERT INTO `tb_music_type` VALUES ('11', '古风', '11');
INSERT INTO `tb_music_type` VALUES ('12', '轻音乐', '12');
INSERT INTO `tb_music_type` VALUES ('13', '金属', '13');
INSERT INTO `tb_music_type` VALUES ('14', '清晨', '14');
INSERT INTO `tb_music_type` VALUES ('15', '夜晚', '15');
INSERT INTO `tb_music_type` VALUES ('16', '学习', '16');
INSERT INTO `tb_music_type` VALUES ('17', '工作', '17');
INSERT INTO `tb_music_type` VALUES ('18', '午休', '18');
INSERT INTO `tb_music_type` VALUES ('19', '地铁', '19');
INSERT INTO `tb_music_type` VALUES ('20', '驾车', '20');
INSERT INTO `tb_music_type` VALUES ('21', '运动', '21');
INSERT INTO `tb_music_type` VALUES ('22', '旅行', '22');
INSERT INTO `tb_music_type` VALUES ('23', '散步', '23');

-- ----------------------------
-- Table structure for `tb_music_type_rela`
-- ----------------------------
DROP TABLE IF EXISTS `tb_music_type_rela`;
CREATE TABLE `tb_music_type_rela` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `musicId` int(4) NOT NULL,
  `typeId` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `musicId` (`musicId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `tb_music_type_rela_ibfk_1` FOREIGN KEY (`musicId`) REFERENCES `tb_music` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_music_type_rela_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `tb_music_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_music_type_rela
-- ----------------------------
INSERT INTO `tb_music_type_rela` VALUES ('120', '52', '1');
INSERT INTO `tb_music_type_rela` VALUES ('121', '52', '6');
INSERT INTO `tb_music_type_rela` VALUES ('122', '52', '14');
INSERT INTO `tb_music_type_rela` VALUES ('123', '53', '1');
INSERT INTO `tb_music_type_rela` VALUES ('124', '53', '6');
INSERT INTO `tb_music_type_rela` VALUES ('125', '53', '14');
INSERT INTO `tb_music_type_rela` VALUES ('129', '55', '1');
INSERT INTO `tb_music_type_rela` VALUES ('130', '55', '6');
INSERT INTO `tb_music_type_rela` VALUES ('131', '55', '14');
INSERT INTO `tb_music_type_rela` VALUES ('132', '56', '1');
INSERT INTO `tb_music_type_rela` VALUES ('133', '56', '6');
INSERT INTO `tb_music_type_rela` VALUES ('134', '56', '14');
INSERT INTO `tb_music_type_rela` VALUES ('135', '57', '1');
INSERT INTO `tb_music_type_rela` VALUES ('136', '57', '6');
INSERT INTO `tb_music_type_rela` VALUES ('137', '57', '14');
INSERT INTO `tb_music_type_rela` VALUES ('141', '59', '1');
INSERT INTO `tb_music_type_rela` VALUES ('142', '59', '6');
INSERT INTO `tb_music_type_rela` VALUES ('143', '59', '14');
INSERT INTO `tb_music_type_rela` VALUES ('144', '60', '1');
INSERT INTO `tb_music_type_rela` VALUES ('145', '60', '6');
INSERT INTO `tb_music_type_rela` VALUES ('146', '60', '14');
INSERT INTO `tb_music_type_rela` VALUES ('147', '61', '1');
INSERT INTO `tb_music_type_rela` VALUES ('148', '61', '6');
INSERT INTO `tb_music_type_rela` VALUES ('149', '61', '14');
INSERT INTO `tb_music_type_rela` VALUES ('153', '63', '1');
INSERT INTO `tb_music_type_rela` VALUES ('154', '63', '6');
INSERT INTO `tb_music_type_rela` VALUES ('155', '63', '14');
INSERT INTO `tb_music_type_rela` VALUES ('156', '63', '15');
INSERT INTO `tb_music_type_rela` VALUES ('157', '63', '16');
INSERT INTO `tb_music_type_rela` VALUES ('158', '63', '18');
INSERT INTO `tb_music_type_rela` VALUES ('168', '65', '1');
INSERT INTO `tb_music_type_rela` VALUES ('169', '65', '6');
INSERT INTO `tb_music_type_rela` VALUES ('170', '65', '12');
INSERT INTO `tb_music_type_rela` VALUES ('171', '65', '14');
INSERT INTO `tb_music_type_rela` VALUES ('172', '65', '15');
INSERT INTO `tb_music_type_rela` VALUES ('173', '65', '16');
INSERT INTO `tb_music_type_rela` VALUES ('174', '65', '18');
INSERT INTO `tb_music_type_rela` VALUES ('175', '65', '22');
INSERT INTO `tb_music_type_rela` VALUES ('176', '65', '23');
INSERT INTO `tb_music_type_rela` VALUES ('177', '66', '1');
INSERT INTO `tb_music_type_rela` VALUES ('178', '66', '6');
INSERT INTO `tb_music_type_rela` VALUES ('179', '66', '9');
INSERT INTO `tb_music_type_rela` VALUES ('180', '66', '13');
INSERT INTO `tb_music_type_rela` VALUES ('181', '66', '14');
INSERT INTO `tb_music_type_rela` VALUES ('182', '66', '15');
INSERT INTO `tb_music_type_rela` VALUES ('183', '66', '17');
INSERT INTO `tb_music_type_rela` VALUES ('184', '66', '18');
INSERT INTO `tb_music_type_rela` VALUES ('185', '66', '19');
INSERT INTO `tb_music_type_rela` VALUES ('186', '66', '20');
INSERT INTO `tb_music_type_rela` VALUES ('187', '67', '1');
INSERT INTO `tb_music_type_rela` VALUES ('188', '67', '6');
INSERT INTO `tb_music_type_rela` VALUES ('189', '67', '7');
INSERT INTO `tb_music_type_rela` VALUES ('190', '67', '9');
INSERT INTO `tb_music_type_rela` VALUES ('191', '67', '10');
INSERT INTO `tb_music_type_rela` VALUES ('192', '67', '11');
INSERT INTO `tb_music_type_rela` VALUES ('193', '67', '12');
INSERT INTO `tb_music_type_rela` VALUES ('194', '67', '13');
INSERT INTO `tb_music_type_rela` VALUES ('195', '67', '14');
INSERT INTO `tb_music_type_rela` VALUES ('196', '67', '16');
INSERT INTO `tb_music_type_rela` VALUES ('197', '67', '17');
INSERT INTO `tb_music_type_rela` VALUES ('198', '67', '19');
INSERT INTO `tb_music_type_rela` VALUES ('199', '67', '20');
INSERT INTO `tb_music_type_rela` VALUES ('200', '67', '21');
INSERT INTO `tb_music_type_rela` VALUES ('201', '67', '22');
INSERT INTO `tb_music_type_rela` VALUES ('202', '68', '1');
INSERT INTO `tb_music_type_rela` VALUES ('203', '68', '6');
INSERT INTO `tb_music_type_rela` VALUES ('204', '68', '14');
INSERT INTO `tb_music_type_rela` VALUES ('219', '70', '1');
INSERT INTO `tb_music_type_rela` VALUES ('220', '70', '6');
INSERT INTO `tb_music_type_rela` VALUES ('221', '70', '7');
INSERT INTO `tb_music_type_rela` VALUES ('222', '70', '9');
INSERT INTO `tb_music_type_rela` VALUES ('223', '70', '10');
INSERT INTO `tb_music_type_rela` VALUES ('224', '70', '12');
INSERT INTO `tb_music_type_rela` VALUES ('225', '70', '13');
INSERT INTO `tb_music_type_rela` VALUES ('226', '70', '14');
INSERT INTO `tb_music_type_rela` VALUES ('227', '70', '16');
INSERT INTO `tb_music_type_rela` VALUES ('228', '70', '17');
INSERT INTO `tb_music_type_rela` VALUES ('229', '70', '18');
INSERT INTO `tb_music_type_rela` VALUES ('230', '70', '19');
INSERT INTO `tb_music_type_rela` VALUES ('231', '70', '20');
INSERT INTO `tb_music_type_rela` VALUES ('232', '70', '21');
INSERT INTO `tb_music_type_rela` VALUES ('233', '70', '22');
INSERT INTO `tb_music_type_rela` VALUES ('234', '70', '23');
INSERT INTO `tb_music_type_rela` VALUES ('254', '72', '1');
INSERT INTO `tb_music_type_rela` VALUES ('255', '72', '6');
INSERT INTO `tb_music_type_rela` VALUES ('256', '72', '7');
INSERT INTO `tb_music_type_rela` VALUES ('257', '72', '9');
INSERT INTO `tb_music_type_rela` VALUES ('258', '72', '10');
INSERT INTO `tb_music_type_rela` VALUES ('259', '72', '14');
INSERT INTO `tb_music_type_rela` VALUES ('260', '72', '17');
INSERT INTO `tb_music_type_rela` VALUES ('261', '72', '19');
INSERT INTO `tb_music_type_rela` VALUES ('262', '72', '20');
INSERT INTO `tb_music_type_rela` VALUES ('263', '72', '22');
INSERT INTO `tb_music_type_rela` VALUES ('282', '75', '1');
INSERT INTO `tb_music_type_rela` VALUES ('283', '75', '6');
INSERT INTO `tb_music_type_rela` VALUES ('284', '75', '7');
INSERT INTO `tb_music_type_rela` VALUES ('285', '75', '12');
INSERT INTO `tb_music_type_rela` VALUES ('286', '75', '14');
INSERT INTO `tb_music_type_rela` VALUES ('287', '75', '15');
INSERT INTO `tb_music_type_rela` VALUES ('288', '75', '17');
INSERT INTO `tb_music_type_rela` VALUES ('289', '75', '18');
INSERT INTO `tb_music_type_rela` VALUES ('290', '75', '20');
INSERT INTO `tb_music_type_rela` VALUES ('291', '76', '1');
INSERT INTO `tb_music_type_rela` VALUES ('292', '76', '6');
INSERT INTO `tb_music_type_rela` VALUES ('293', '76', '8');
INSERT INTO `tb_music_type_rela` VALUES ('294', '76', '14');
INSERT INTO `tb_music_type_rela` VALUES ('295', '76', '16');
INSERT INTO `tb_music_type_rela` VALUES ('296', '76', '21');
INSERT INTO `tb_music_type_rela` VALUES ('297', '77', '1');
INSERT INTO `tb_music_type_rela` VALUES ('298', '77', '6');
INSERT INTO `tb_music_type_rela` VALUES ('299', '77', '8');
INSERT INTO `tb_music_type_rela` VALUES ('300', '77', '11');
INSERT INTO `tb_music_type_rela` VALUES ('301', '77', '12');
INSERT INTO `tb_music_type_rela` VALUES ('302', '77', '14');
INSERT INTO `tb_music_type_rela` VALUES ('303', '77', '18');
INSERT INTO `tb_music_type_rela` VALUES ('304', '77', '20');
INSERT INTO `tb_music_type_rela` VALUES ('305', '77', '21');
INSERT INTO `tb_music_type_rela` VALUES ('306', '77', '22');
INSERT INTO `tb_music_type_rela` VALUES ('307', '78', '1');
INSERT INTO `tb_music_type_rela` VALUES ('308', '78', '6');
INSERT INTO `tb_music_type_rela` VALUES ('309', '78', '7');
INSERT INTO `tb_music_type_rela` VALUES ('310', '78', '8');
INSERT INTO `tb_music_type_rela` VALUES ('311', '78', '9');
INSERT INTO `tb_music_type_rela` VALUES ('312', '78', '14');
INSERT INTO `tb_music_type_rela` VALUES ('313', '78', '15');
INSERT INTO `tb_music_type_rela` VALUES ('314', '78', '19');
INSERT INTO `tb_music_type_rela` VALUES ('315', '79', '1');
INSERT INTO `tb_music_type_rela` VALUES ('316', '79', '6');
INSERT INTO `tb_music_type_rela` VALUES ('317', '79', '7');
INSERT INTO `tb_music_type_rela` VALUES ('318', '79', '8');
INSERT INTO `tb_music_type_rela` VALUES ('319', '79', '14');
INSERT INTO `tb_music_type_rela` VALUES ('320', '79', '15');
INSERT INTO `tb_music_type_rela` VALUES ('321', '79', '16');
INSERT INTO `tb_music_type_rela` VALUES ('322', '79', '17');
INSERT INTO `tb_music_type_rela` VALUES ('323', '79', '18');
INSERT INTO `tb_music_type_rela` VALUES ('324', '80', '1');
INSERT INTO `tb_music_type_rela` VALUES ('325', '80', '6');
INSERT INTO `tb_music_type_rela` VALUES ('326', '80', '10');
INSERT INTO `tb_music_type_rela` VALUES ('327', '80', '12');
INSERT INTO `tb_music_type_rela` VALUES ('328', '80', '14');
INSERT INTO `tb_music_type_rela` VALUES ('329', '80', '17');
INSERT INTO `tb_music_type_rela` VALUES ('330', '80', '18');
INSERT INTO `tb_music_type_rela` VALUES ('331', '80', '19');
INSERT INTO `tb_music_type_rela` VALUES ('332', '81', '1');
INSERT INTO `tb_music_type_rela` VALUES ('333', '81', '6');
INSERT INTO `tb_music_type_rela` VALUES ('334', '81', '7');
INSERT INTO `tb_music_type_rela` VALUES ('335', '81', '11');
INSERT INTO `tb_music_type_rela` VALUES ('336', '81', '12');
INSERT INTO `tb_music_type_rela` VALUES ('337', '81', '13');
INSERT INTO `tb_music_type_rela` VALUES ('338', '81', '14');
INSERT INTO `tb_music_type_rela` VALUES ('339', '81', '15');
INSERT INTO `tb_music_type_rela` VALUES ('340', '81', '16');
INSERT INTO `tb_music_type_rela` VALUES ('341', '81', '17');
INSERT INTO `tb_music_type_rela` VALUES ('342', '81', '18');
INSERT INTO `tb_music_type_rela` VALUES ('343', '81', '20');
INSERT INTO `tb_music_type_rela` VALUES ('344', '81', '21');
INSERT INTO `tb_music_type_rela` VALUES ('345', '82', '1');
INSERT INTO `tb_music_type_rela` VALUES ('346', '82', '6');
INSERT INTO `tb_music_type_rela` VALUES ('347', '82', '8');
INSERT INTO `tb_music_type_rela` VALUES ('348', '82', '10');
INSERT INTO `tb_music_type_rela` VALUES ('349', '82', '14');
INSERT INTO `tb_music_type_rela` VALUES ('350', '82', '17');
INSERT INTO `tb_music_type_rela` VALUES ('351', '82', '18');
INSERT INTO `tb_music_type_rela` VALUES ('352', '82', '20');
INSERT INTO `tb_music_type_rela` VALUES ('353', '82', '21');
INSERT INTO `tb_music_type_rela` VALUES ('354', '83', '1');
INSERT INTO `tb_music_type_rela` VALUES ('355', '83', '6');
INSERT INTO `tb_music_type_rela` VALUES ('356', '83', '9');
INSERT INTO `tb_music_type_rela` VALUES ('357', '83', '10');
INSERT INTO `tb_music_type_rela` VALUES ('358', '83', '11');
INSERT INTO `tb_music_type_rela` VALUES ('359', '83', '14');
INSERT INTO `tb_music_type_rela` VALUES ('360', '83', '16');
INSERT INTO `tb_music_type_rela` VALUES ('361', '83', '18');
INSERT INTO `tb_music_type_rela` VALUES ('362', '83', '19');
INSERT INTO `tb_music_type_rela` VALUES ('363', '83', '20');
INSERT INTO `tb_music_type_rela` VALUES ('364', '83', '21');
INSERT INTO `tb_music_type_rela` VALUES ('365', '84', '1');
INSERT INTO `tb_music_type_rela` VALUES ('366', '84', '6');
INSERT INTO `tb_music_type_rela` VALUES ('367', '84', '8');
INSERT INTO `tb_music_type_rela` VALUES ('368', '84', '9');
INSERT INTO `tb_music_type_rela` VALUES ('369', '84', '10');
INSERT INTO `tb_music_type_rela` VALUES ('370', '84', '11');
INSERT INTO `tb_music_type_rela` VALUES ('371', '84', '12');
INSERT INTO `tb_music_type_rela` VALUES ('372', '84', '13');
INSERT INTO `tb_music_type_rela` VALUES ('373', '84', '14');
INSERT INTO `tb_music_type_rela` VALUES ('374', '84', '16');
INSERT INTO `tb_music_type_rela` VALUES ('375', '84', '18');
INSERT INTO `tb_music_type_rela` VALUES ('376', '84', '19');
INSERT INTO `tb_music_type_rela` VALUES ('377', '84', '20');
INSERT INTO `tb_music_type_rela` VALUES ('378', '85', '1');
INSERT INTO `tb_music_type_rela` VALUES ('379', '85', '6');
INSERT INTO `tb_music_type_rela` VALUES ('380', '85', '9');
INSERT INTO `tb_music_type_rela` VALUES ('381', '85', '11');
INSERT INTO `tb_music_type_rela` VALUES ('382', '85', '12');
INSERT INTO `tb_music_type_rela` VALUES ('383', '85', '13');
INSERT INTO `tb_music_type_rela` VALUES ('384', '85', '14');
INSERT INTO `tb_music_type_rela` VALUES ('385', '85', '18');
INSERT INTO `tb_music_type_rela` VALUES ('386', '85', '19');
INSERT INTO `tb_music_type_rela` VALUES ('387', '85', '20');
INSERT INTO `tb_music_type_rela` VALUES ('388', '85', '21');
INSERT INTO `tb_music_type_rela` VALUES ('389', '85', '22');
INSERT INTO `tb_music_type_rela` VALUES ('390', '85', '23');
INSERT INTO `tb_music_type_rela` VALUES ('391', '86', '1');
INSERT INTO `tb_music_type_rela` VALUES ('392', '86', '6');
INSERT INTO `tb_music_type_rela` VALUES ('393', '86', '7');
INSERT INTO `tb_music_type_rela` VALUES ('394', '86', '8');
INSERT INTO `tb_music_type_rela` VALUES ('395', '86', '9');
INSERT INTO `tb_music_type_rela` VALUES ('396', '86', '10');
INSERT INTO `tb_music_type_rela` VALUES ('397', '86', '11');
INSERT INTO `tb_music_type_rela` VALUES ('398', '86', '12');
INSERT INTO `tb_music_type_rela` VALUES ('399', '86', '14');
INSERT INTO `tb_music_type_rela` VALUES ('400', '86', '15');
INSERT INTO `tb_music_type_rela` VALUES ('401', '86', '16');
INSERT INTO `tb_music_type_rela` VALUES ('402', '86', '17');
INSERT INTO `tb_music_type_rela` VALUES ('403', '86', '19');
INSERT INTO `tb_music_type_rela` VALUES ('404', '86', '20');
INSERT INTO `tb_music_type_rela` VALUES ('405', '87', '1');
INSERT INTO `tb_music_type_rela` VALUES ('406', '87', '6');
INSERT INTO `tb_music_type_rela` VALUES ('407', '87', '9');
INSERT INTO `tb_music_type_rela` VALUES ('408', '87', '10');
INSERT INTO `tb_music_type_rela` VALUES ('409', '87', '12');
INSERT INTO `tb_music_type_rela` VALUES ('410', '87', '13');
INSERT INTO `tb_music_type_rela` VALUES ('411', '87', '14');
INSERT INTO `tb_music_type_rela` VALUES ('412', '87', '17');
INSERT INTO `tb_music_type_rela` VALUES ('413', '87', '18');
INSERT INTO `tb_music_type_rela` VALUES ('414', '87', '19');
INSERT INTO `tb_music_type_rela` VALUES ('415', '87', '21');
INSERT INTO `tb_music_type_rela` VALUES ('416', '88', '1');
INSERT INTO `tb_music_type_rela` VALUES ('417', '88', '6');
INSERT INTO `tb_music_type_rela` VALUES ('418', '88', '7');
INSERT INTO `tb_music_type_rela` VALUES ('419', '88', '9');
INSERT INTO `tb_music_type_rela` VALUES ('420', '88', '10');
INSERT INTO `tb_music_type_rela` VALUES ('421', '88', '11');
INSERT INTO `tb_music_type_rela` VALUES ('422', '88', '14');
INSERT INTO `tb_music_type_rela` VALUES ('423', '88', '16');
INSERT INTO `tb_music_type_rela` VALUES ('424', '88', '18');
INSERT INTO `tb_music_type_rela` VALUES ('425', '88', '19');
INSERT INTO `tb_music_type_rela` VALUES ('426', '88', '20');
INSERT INTO `tb_music_type_rela` VALUES ('427', '88', '21');
INSERT INTO `tb_music_type_rela` VALUES ('428', '89', '1');
INSERT INTO `tb_music_type_rela` VALUES ('429', '89', '6');
INSERT INTO `tb_music_type_rela` VALUES ('430', '89', '7');
INSERT INTO `tb_music_type_rela` VALUES ('431', '89', '8');
INSERT INTO `tb_music_type_rela` VALUES ('432', '89', '11');
INSERT INTO `tb_music_type_rela` VALUES ('433', '89', '14');
INSERT INTO `tb_music_type_rela` VALUES ('434', '89', '16');
INSERT INTO `tb_music_type_rela` VALUES ('435', '89', '17');
INSERT INTO `tb_music_type_rela` VALUES ('436', '89', '18');
INSERT INTO `tb_music_type_rela` VALUES ('437', '89', '19');
INSERT INTO `tb_music_type_rela` VALUES ('438', '90', '1');
INSERT INTO `tb_music_type_rela` VALUES ('439', '90', '6');
INSERT INTO `tb_music_type_rela` VALUES ('440', '90', '8');
INSERT INTO `tb_music_type_rela` VALUES ('441', '90', '9');
INSERT INTO `tb_music_type_rela` VALUES ('442', '90', '10');
INSERT INTO `tb_music_type_rela` VALUES ('443', '90', '11');
INSERT INTO `tb_music_type_rela` VALUES ('444', '90', '14');
INSERT INTO `tb_music_type_rela` VALUES ('445', '90', '17');
INSERT INTO `tb_music_type_rela` VALUES ('446', '90', '19');
INSERT INTO `tb_music_type_rela` VALUES ('447', '90', '20');
INSERT INTO `tb_music_type_rela` VALUES ('448', '90', '21');
INSERT INTO `tb_music_type_rela` VALUES ('449', '90', '22');
INSERT INTO `tb_music_type_rela` VALUES ('450', '91', '1');
INSERT INTO `tb_music_type_rela` VALUES ('451', '91', '6');
INSERT INTO `tb_music_type_rela` VALUES ('452', '91', '8');
INSERT INTO `tb_music_type_rela` VALUES ('453', '91', '11');
INSERT INTO `tb_music_type_rela` VALUES ('454', '91', '12');
INSERT INTO `tb_music_type_rela` VALUES ('455', '91', '13');
INSERT INTO `tb_music_type_rela` VALUES ('456', '91', '14');
INSERT INTO `tb_music_type_rela` VALUES ('457', '91', '15');
INSERT INTO `tb_music_type_rela` VALUES ('458', '91', '18');
INSERT INTO `tb_music_type_rela` VALUES ('459', '91', '21');
INSERT INTO `tb_music_type_rela` VALUES ('460', '91', '22');
INSERT INTO `tb_music_type_rela` VALUES ('461', '92', '1');
INSERT INTO `tb_music_type_rela` VALUES ('462', '92', '6');
INSERT INTO `tb_music_type_rela` VALUES ('463', '92', '14');
INSERT INTO `tb_music_type_rela` VALUES ('464', '93', '1');
INSERT INTO `tb_music_type_rela` VALUES ('465', '93', '6');
INSERT INTO `tb_music_type_rela` VALUES ('466', '93', '14');
INSERT INTO `tb_music_type_rela` VALUES ('467', '94', '1');
INSERT INTO `tb_music_type_rela` VALUES ('468', '94', '6');
INSERT INTO `tb_music_type_rela` VALUES ('469', '94', '7');
INSERT INTO `tb_music_type_rela` VALUES ('470', '94', '9');
INSERT INTO `tb_music_type_rela` VALUES ('471', '94', '10');
INSERT INTO `tb_music_type_rela` VALUES ('472', '94', '12');
INSERT INTO `tb_music_type_rela` VALUES ('473', '94', '13');
INSERT INTO `tb_music_type_rela` VALUES ('474', '94', '14');
INSERT INTO `tb_music_type_rela` VALUES ('475', '94', '17');
INSERT INTO `tb_music_type_rela` VALUES ('476', '94', '18');
INSERT INTO `tb_music_type_rela` VALUES ('477', '94', '19');
INSERT INTO `tb_music_type_rela` VALUES ('478', '94', '20');
INSERT INTO `tb_music_type_rela` VALUES ('479', '94', '21');
INSERT INTO `tb_music_type_rela` VALUES ('480', '95', '1');
INSERT INTO `tb_music_type_rela` VALUES ('481', '95', '6');
INSERT INTO `tb_music_type_rela` VALUES ('482', '95', '9');
INSERT INTO `tb_music_type_rela` VALUES ('483', '95', '12');
INSERT INTO `tb_music_type_rela` VALUES ('484', '95', '13');
INSERT INTO `tb_music_type_rela` VALUES ('485', '95', '14');
INSERT INTO `tb_music_type_rela` VALUES ('486', '95', '18');
INSERT INTO `tb_music_type_rela` VALUES ('487', '95', '19');
INSERT INTO `tb_music_type_rela` VALUES ('488', '95', '20');
INSERT INTO `tb_music_type_rela` VALUES ('489', '95', '21');
INSERT INTO `tb_music_type_rela` VALUES ('490', '96', '1');
INSERT INTO `tb_music_type_rela` VALUES ('491', '96', '6');
INSERT INTO `tb_music_type_rela` VALUES ('492', '96', '14');
INSERT INTO `tb_music_type_rela` VALUES ('507', '99', '1');
INSERT INTO `tb_music_type_rela` VALUES ('508', '99', '6');
INSERT INTO `tb_music_type_rela` VALUES ('509', '99', '14');
INSERT INTO `tb_music_type_rela` VALUES ('510', '100', '1');
INSERT INTO `tb_music_type_rela` VALUES ('511', '100', '6');
INSERT INTO `tb_music_type_rela` VALUES ('512', '100', '8');
INSERT INTO `tb_music_type_rela` VALUES ('513', '100', '9');
INSERT INTO `tb_music_type_rela` VALUES ('514', '100', '10');
INSERT INTO `tb_music_type_rela` VALUES ('515', '100', '14');
INSERT INTO `tb_music_type_rela` VALUES ('516', '100', '18');
INSERT INTO `tb_music_type_rela` VALUES ('517', '100', '19');
INSERT INTO `tb_music_type_rela` VALUES ('518', '100', '20');
INSERT INTO `tb_music_type_rela` VALUES ('519', '100', '21');
INSERT INTO `tb_music_type_rela` VALUES ('520', '100', '22');
INSERT INTO `tb_music_type_rela` VALUES ('521', '101', '1');
INSERT INTO `tb_music_type_rela` VALUES ('522', '101', '6');
INSERT INTO `tb_music_type_rela` VALUES ('523', '101', '8');
INSERT INTO `tb_music_type_rela` VALUES ('524', '101', '9');
INSERT INTO `tb_music_type_rela` VALUES ('525', '101', '10');
INSERT INTO `tb_music_type_rela` VALUES ('526', '101', '13');
INSERT INTO `tb_music_type_rela` VALUES ('527', '101', '14');
INSERT INTO `tb_music_type_rela` VALUES ('528', '101', '18');
INSERT INTO `tb_music_type_rela` VALUES ('529', '101', '19');
INSERT INTO `tb_music_type_rela` VALUES ('530', '101', '20');
INSERT INTO `tb_music_type_rela` VALUES ('531', '101', '21');
INSERT INTO `tb_music_type_rela` VALUES ('532', '101', '22');
INSERT INTO `tb_music_type_rela` VALUES ('533', '102', '1');
INSERT INTO `tb_music_type_rela` VALUES ('534', '102', '6');
INSERT INTO `tb_music_type_rela` VALUES ('535', '102', '14');
INSERT INTO `tb_music_type_rela` VALUES ('536', '103', '1');
INSERT INTO `tb_music_type_rela` VALUES ('537', '103', '6');
INSERT INTO `tb_music_type_rela` VALUES ('538', '103', '14');
INSERT INTO `tb_music_type_rela` VALUES ('553', '106', '1');
INSERT INTO `tb_music_type_rela` VALUES ('554', '106', '2');
INSERT INTO `tb_music_type_rela` VALUES ('555', '106', '6');
INSERT INTO `tb_music_type_rela` VALUES ('556', '106', '7');
INSERT INTO `tb_music_type_rela` VALUES ('557', '106', '10');
INSERT INTO `tb_music_type_rela` VALUES ('558', '106', '12');
INSERT INTO `tb_music_type_rela` VALUES ('559', '106', '13');
INSERT INTO `tb_music_type_rela` VALUES ('560', '106', '14');
INSERT INTO `tb_music_type_rela` VALUES ('561', '106', '16');
INSERT INTO `tb_music_type_rela` VALUES ('562', '106', '19');
INSERT INTO `tb_music_type_rela` VALUES ('563', '106', '20');
INSERT INTO `tb_music_type_rela` VALUES ('564', '106', '21');
INSERT INTO `tb_music_type_rela` VALUES ('565', '107', '1');
INSERT INTO `tb_music_type_rela` VALUES ('566', '107', '2');
INSERT INTO `tb_music_type_rela` VALUES ('567', '107', '6');
INSERT INTO `tb_music_type_rela` VALUES ('568', '107', '7');
INSERT INTO `tb_music_type_rela` VALUES ('569', '107', '8');
INSERT INTO `tb_music_type_rela` VALUES ('570', '107', '9');
INSERT INTO `tb_music_type_rela` VALUES ('571', '107', '10');
INSERT INTO `tb_music_type_rela` VALUES ('572', '107', '11');
INSERT INTO `tb_music_type_rela` VALUES ('573', '107', '12');
INSERT INTO `tb_music_type_rela` VALUES ('574', '107', '14');
INSERT INTO `tb_music_type_rela` VALUES ('575', '107', '16');
INSERT INTO `tb_music_type_rela` VALUES ('576', '107', '17');
INSERT INTO `tb_music_type_rela` VALUES ('577', '107', '18');
INSERT INTO `tb_music_type_rela` VALUES ('578', '107', '19');
INSERT INTO `tb_music_type_rela` VALUES ('579', '107', '20');
INSERT INTO `tb_music_type_rela` VALUES ('580', '108', '2');
INSERT INTO `tb_music_type_rela` VALUES ('581', '108', '6');
INSERT INTO `tb_music_type_rela` VALUES ('582', '108', '8');
INSERT INTO `tb_music_type_rela` VALUES ('583', '108', '9');
INSERT INTO `tb_music_type_rela` VALUES ('584', '108', '10');
INSERT INTO `tb_music_type_rela` VALUES ('585', '108', '14');
INSERT INTO `tb_music_type_rela` VALUES ('586', '108', '16');
INSERT INTO `tb_music_type_rela` VALUES ('587', '108', '18');
INSERT INTO `tb_music_type_rela` VALUES ('588', '108', '19');
INSERT INTO `tb_music_type_rela` VALUES ('589', '108', '20');
INSERT INTO `tb_music_type_rela` VALUES ('627', '115', '1');
INSERT INTO `tb_music_type_rela` VALUES ('628', '115', '6');
INSERT INTO `tb_music_type_rela` VALUES ('629', '115', '7');
INSERT INTO `tb_music_type_rela` VALUES ('630', '115', '10');
INSERT INTO `tb_music_type_rela` VALUES ('631', '115', '14');
INSERT INTO `tb_music_type_rela` VALUES ('632', '115', '15');
INSERT INTO `tb_music_type_rela` VALUES ('633', '115', '16');
INSERT INTO `tb_music_type_rela` VALUES ('634', '115', '17');
INSERT INTO `tb_music_type_rela` VALUES ('635', '115', '19');

-- ----------------------------
-- Table structure for `tb_playrecord`
-- ----------------------------
DROP TABLE IF EXISTS `tb_playrecord`;
CREATE TABLE `tb_playrecord` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `userId` int(4) NOT NULL,
  `musicId` int(4) NOT NULL,
  `playTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `playCounts` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `musicId` (`musicId`),
  CONSTRAINT `tb_playrecord_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_playrecord_ibfk_2` FOREIGN KEY (`musicId`) REFERENCES `tb_music` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_playrecord
-- ----------------------------
INSERT INTO `tb_playrecord` VALUES ('4', '4', '56', '2017-02-28 20:45:45', '3');
INSERT INTO `tb_playrecord` VALUES ('5', '4', '63', '2017-02-27 22:15:23', '1');
INSERT INTO `tb_playrecord` VALUES ('6', '4', '59', '2017-02-27 22:36:26', '1');
INSERT INTO `tb_playrecord` VALUES ('7', '4', '53', '2017-02-27 23:00:32', '2');
INSERT INTO `tb_playrecord` VALUES ('8', '4', '52', '2017-02-27 23:12:43', '2');
INSERT INTO `tb_playrecord` VALUES ('9', '5', '79', '2017-02-28 19:50:45', '9');
INSERT INTO `tb_playrecord` VALUES ('10', '5', '76', '2017-02-28 19:50:28', '6');
INSERT INTO `tb_playrecord` VALUES ('11', '5', '72', '2017-02-28 19:51:14', '4');
INSERT INTO `tb_playrecord` VALUES ('12', '5', '77', '2017-02-28 19:49:53', '5');
INSERT INTO `tb_playrecord` VALUES ('13', '5', '61', '2017-02-28 19:51:08', '1');
INSERT INTO `tb_playrecord` VALUES ('14', '4', '65', '2017-02-28 21:06:47', '1');
INSERT INTO `tb_playrecord` VALUES ('15', '5', '57', '2017-02-28 22:27:35', '2');
INSERT INTO `tb_playrecord` VALUES ('16', '5', '56', '2017-02-28 22:27:30', '1');
INSERT INTO `tb_playrecord` VALUES ('17', '5', '52', '2017-02-28 22:27:44', '1');
INSERT INTO `tb_playrecord` VALUES ('18', '7', '52', '2017-03-01 00:26:09', '2');
INSERT INTO `tb_playrecord` VALUES ('19', '7', '63', '2017-03-01 00:30:47', '1');
INSERT INTO `tb_playrecord` VALUES ('20', '4', '60', '2017-03-01 00:36:00', '1');
INSERT INTO `tb_playrecord` VALUES ('21', '4', '79', '2017-03-01 00:38:04', '1');
INSERT INTO `tb_playrecord` VALUES ('23', '4', '101', '2017-03-01 00:40:10', '1');
INSERT INTO `tb_playrecord` VALUES ('24', '4', '100', '2017-03-01 00:40:12', '1');
INSERT INTO `tb_playrecord` VALUES ('25', '4', '99', '2017-03-01 00:41:19', '2');
INSERT INTO `tb_playrecord` VALUES ('26', '4', '88', '2017-03-01 00:41:26', '2');
INSERT INTO `tb_playrecord` VALUES ('27', '4', '92', '2017-03-01 00:40:33', '1');
INSERT INTO `tb_playrecord` VALUES ('28', '4', '93', '2017-03-01 00:40:36', '1');
INSERT INTO `tb_playrecord` VALUES ('29', '4', '82', '2017-03-01 00:40:58', '1');
INSERT INTO `tb_playrecord` VALUES ('31', '4', '94', '2017-03-01 00:41:23', '1');
INSERT INTO `tb_playrecord` VALUES ('32', '4', '89', '2017-03-01 00:41:25', '1');
INSERT INTO `tb_playrecord` VALUES ('33', '4', '86', '2017-03-01 00:41:28', '1');
INSERT INTO `tb_playrecord` VALUES ('34', '4', '85', '2017-03-01 00:41:29', '1');

-- ----------------------------
-- Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('3', '歌手管理员');
INSERT INTO `tb_role` VALUES ('4', '用户管理员');
INSERT INTO `tb_role` VALUES ('1', '超级管理员');
INSERT INTO `tb_role` VALUES ('2', '音乐管理员');

-- ----------------------------
-- Table structure for `tb_sign`
-- ----------------------------
DROP TABLE IF EXISTS `tb_sign`;
CREATE TABLE `tb_sign` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userId` int(4) NOT NULL,
  `signTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `tb_sign_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sign
-- ----------------------------
INSERT INTO `tb_sign` VALUES ('1', '4', '2017-03-01 00:22:22');
INSERT INTO `tb_sign` VALUES ('2', '5', '2017-02-28 19:51:41');

-- ----------------------------
-- Table structure for `tb_singer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_singer`;
CREATE TABLE `tb_singer` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `singerName` varchar(20) NOT NULL,
  `img` varchar(50) NOT NULL,
  `introduction` varchar(300) NOT NULL,
  `counts` int(6) NOT NULL,
  `uploadTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_singer
-- ----------------------------
INSERT INTO `tb_singer` VALUES ('27', 'Twins', 'Twins.jpg', 'Twins是中国香港的女子双人歌唱组合，由钟欣潼与蔡卓妍组成。', '0', '2017-02-20 14:35:15');
INSERT INTO `tb_singer` VALUES ('28', '达达乐队', '达达乐队.jpg', '中国内地第一支也是唯一一支签约全球五大唱片公司的中国摇滚乐队--达达乐队，在2001年1月推出他们的首张专辑《天使》，立即引起中国流行乐坛的轰动。', '0', '2017-02-20 14:36:30');
INSERT INTO `tb_singer` VALUES ('29', '范玮琪', '范玮琪.jpg', '范玮琪（Fan Fan），1976年3月18日出生于美国俄亥俄州，华语流行乐女歌手、影视演员、主持人。', '0', '2017-02-20 14:37:37');
INSERT INTO `tb_singer` VALUES ('30', '李健', '李健.jpg', '李健，1974年9月23日出生于黑龙江省哈尔滨市，中国流行男歌手。毕业于清华大学电子工程系。', '0', '2017-02-20 14:38:11');
INSERT INTO `tb_singer` VALUES ('31', '李克勤', '李克勤.jpg', '李克勤（Hacken Lee），生于香港，籍贯广东新会崖西，中国香港歌手，演员，主持人。', '0', '2017-02-20 14:39:23');
INSERT INTO `tb_singer` VALUES ('32', '尚雯婕', '尚雯婕.jpg', '尚雯婕（Laure Shang）1982年12月22日出生于上海，复旦大学法语系毕业，华语流行乐女歌手。', '0', '2017-02-20 14:40:00');
INSERT INTO `tb_singer` VALUES ('34', '王力宏', '王力宏.jpg', '王力宏（Leehom Wang），1976年5月17日出生于美国纽约罗切斯特，祖籍浙江义乌，华语流行乐男歌手、音乐制作人、演员、导演，毕业于威廉姆斯学院。', '0', '2017-02-20 14:42:44');
INSERT INTO `tb_singer` VALUES ('35', '张惠妹', '张惠妹.jpg', '张惠妹（A Mei），1972年8月9日出生于中国台湾台东县卑南乡泰安部落，中国台湾原住民歌手。', '0', '2017-02-20 14:43:14');
INSERT INTO `tb_singer` VALUES ('36', '张信哲', '张信哲.jpg', '张信哲，1967年3月26日生于台湾，歌手、演员、舞台剧团团长。1987年张信哲签约滚石唱片的子公司巨石音乐，1989年发行第一张专辑《说谎》。', '0', '2017-02-20 14:43:53');
INSERT INTO `tb_singer` VALUES ('38', '周杰伦', '周杰伦.jpg', '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，中国台湾流行乐男歌手、音乐人、演员、导演、编剧、监制、企业家等。', '0', '2017-02-20 14:44:44');
INSERT INTO `tb_singer` VALUES ('39', '敖犬', '敖犬.jpg', '庄濠全（Owodog Zhuang），1982年10月30日出生于台湾省台中市，华语流行男歌手、演员、主持人、台湾男子演唱组合LOLLIPOP F团长、舞蹈团体黑角舞团成员。', '0', '2017-02-20 19:47:03');
INSERT INTO `tb_singer` VALUES ('40', '周传雄', '周传雄.jpg', '周传雄，曾用艺名小刚。1969年6月7日生于台湾省台中市，台湾歌手、音乐制作人。', '0', '2017-02-20 19:50:47');
INSERT INTO `tb_singer` VALUES ('41', '张翰', '张翰.jpg', '张翰（Hans Zhang），1984年10月6日出生于黑龙江省齐齐哈尔市龙沙区，中国内地男演员，2007年毕业于中央戏剧学院表演系本科班。', '0', '2017-02-20 19:51:42');
INSERT INTO `tb_singer` VALUES ('42', '薛之谦', '薛之谦.jpg', '薛之谦，1983年7月17日出生于上海市，中国内地男歌手。', '0', '2017-02-20 19:52:51');
INSERT INTO `tb_singer` VALUES ('43', '小贱', '小贱.jpg', '小贱（谭冰尧），原名谭海波，1991年08月17日出生于广东清远英德，中国内地歌手。', '0', '2017-02-20 19:53:19');
INSERT INTO `tb_singer` VALUES ('44', '王凯', '王凯.jpg', '王凯，1982年8月18日出生于湖北武汉，中国内地男演员，毕业于中央戏剧学院03级表演班。', '0', '2017-02-20 19:53:46');
INSERT INTO `tb_singer` VALUES ('45', '汪苏泷', '汪苏泷.jpg', '汪苏泷，1989年9月17日出生于辽宁沈阳，内地男歌手。 毕业于沈阳音乐学院作曲系，2010出版首张个人专辑《慢慢懂》。', '0', '2017-02-20 19:54:17');
INSERT INTO `tb_singer` VALUES ('46', '刘畊宏', '刘畊宏.jpg', '刘畊宏1972年10月7日生于台湾高雄，华语流行男歌手、创作人、主持人和演员。', '0', '2017-02-20 19:55:17');
INSERT INTO `tb_singer` VALUES ('47', '李荣浩', '李荣浩.jpg', '李荣浩，1985年7月11日出生于安徽蚌埠，中国流行歌手、音乐制作人、吉他手。', '0', '2017-02-20 19:56:25');
INSERT INTO `tb_singer` VALUES ('48', '赖伟锋', '赖伟锋.jpg', '赖伟锋，1985年8月10日出生于广东佛山，中国内地歌手，前组合无级生成员，音乐制作人。', '0', '2017-02-20 19:57:17');
INSERT INTO `tb_singer` VALUES ('49', '胡歌', '胡歌.jpg', '胡歌，1982年9月20日出生于上海市徐汇区，中国内地演员、歌手、制片人。', '0', '2017-02-20 19:57:53');
INSERT INTO `tb_singer` VALUES ('50', 'A-Lin', 'A-Lin.jpg', '黄丽玲（A-Lin），1983年9月20日出生于台湾省台东市，台东阿美族原住民，中国台湾流行乐女歌手。', '0', '2017-02-20 19:59:35');
INSERT INTO `tb_singer` VALUES ('51', '本兮', '本兮.jpg', '本兮，原名马晓晨，1994年6月30日出生于新疆奎屯，中国内地女歌手。', '0', '2017-02-20 20:00:13');
INSERT INTO `tb_singer` VALUES ('52', '邓紫棋', '邓紫棋.jpg', '邓紫棋（G.E.M.），原名邓诗颖，1991年8月16日生于中国上海，4岁移居香港，中国香港创作型女歌手。', '0', '2017-02-20 20:00:43');
INSERT INTO `tb_singer` VALUES ('54', '李宇春', '李宇春.jpg', '李宇春（Chris Lee），1984年3月10日出生于成都，中国流行女歌手，词曲创作人，电影演员，演唱会导演。', '0', '2017-02-20 20:01:42');
INSERT INTO `tb_singer` VALUES ('55', '莫文蔚', '莫文蔚.jpg', '莫文蔚（Karen Joy Morris，艺名Karen Mok），混血儿，香港歌手和演员，是歌、影、视的三栖艺人。', '0', '2017-02-20 20:02:09');
INSERT INTO `tb_singer` VALUES ('56', '那英', '那英.jpg', '那英，1967年11月27日出生于中国辽宁省沈阳市，中国流行女歌手。', '0', '2017-02-20 20:02:31');
INSERT INTO `tb_singer` VALUES ('57', '曲婉婷', '曲婉婷.jpg', '曲婉婷，1983年10月10日出生于黑龙江省哈尔滨市，中国内地创作歌手。', '0', '2017-02-20 20:02:52');
INSERT INTO `tb_singer` VALUES ('58', '孙燕姿', '孙燕姿.jpg', '孙燕姿（Stefanie Sun），新加坡人，华语流行女歌手，以独特的嗓音和唱腔、扎实的音乐功底著称。', '0', '2017-02-20 20:03:19');
INSERT INTO `tb_singer` VALUES ('59', '田馥甄', '田馥甄.jpg', '田馥甄（Hebe），客家人，祖籍福建省漳州市，1983年3月30日出生于台湾省新竹县，中国台湾女歌手、演员，华语女子演唱团体S.H.E的成员之一。', '0', '2017-02-20 20:03:43');
INSERT INTO `tb_singer` VALUES ('61', '张碧晨', '张碧晨.jpg', '张碧晨，1989年9月10日出生于天津，华语流行女歌手。', '0', '2017-02-20 20:04:25');
INSERT INTO `tb_singer` VALUES ('62', '庄心妍', '庄心妍.jpg', '庄心妍（Ada），1993年1月31日出生于广东省汕尾市陆丰市，内地女歌手，致力音乐旗下艺人。', '0', '2017-02-20 20:05:07');
INSERT INTO `tb_singer` VALUES ('63', '王菲', '王菲.jpg', '王菲（Faye Wong），1969年8月8日出生于北京，中国流行乐女歌手、影视演员。', '0', '2017-02-20 20:10:55');
INSERT INTO `tb_singer` VALUES ('64', 'Beyond', 'Beyond.jpg', '八十年代初 黄家驹与叶世荣通过Tom Lee琴行老板的穿针引线下结识为好友，并发觉彼此都受英国摇滚乐的影响，音乐取向都一致，于是合组乐队，负责弹奏主音吉他的邓炜谦便把乐队之名命为“Beyond”', '0', '2017-02-20 20:13:43');
INSERT INTO `tb_singer` VALUES ('65', 'BY2', 'BY2.jpg', 'BY2，1992年3月23日出生于新加坡，来自姐姐白纬芬（Miko）和妹妹白纬玲（Yumi）组成的“白”氏双胞胎女子演唱组合。', '0', '2017-02-20 20:14:20');
INSERT INTO `tb_singer` VALUES ('66', 'TFboys', 'TFboys.jpg', 'TFBOYS是北京时代峰峻文化艺术发展有限公司于2013年推出的组合，由王俊凯、王源和易烊千玺3名成员组成。', '0', '2017-02-20 20:14:50');
INSERT INTO `tb_singer` VALUES ('67', '好妹妹乐队', '好妹妹乐队.jpg', '好妹妹乐队是由两个青年组成，分别是秦昊和张小厚，乐队组建于2010年4月，中国民谣、乡村乐队。', '0', '2017-02-20 20:15:21');
INSERT INTO `tb_singer` VALUES ('68', '筷子兄弟', '筷子兄弟.jpg', '筷子兄弟是由肖央与王太利组成集“编剧、导演、演员、音乐创作、歌手”于一身的复合型组合。', '0', '2017-02-20 20:15:45');
INSERT INTO `tb_singer` VALUES ('69', '萌萌哒乐团', '萌萌哒乐团.jpg', '萌萌哒天团是由“超级偶像”打造，音乐加电影于一体的大型原创少女偶像团体。', '0', '2017-02-20 20:16:19');
INSERT INTO `tb_singer` VALUES ('70', '南征北战', '南征北战.jpg', '南征北战组合，英文缩写NZBZ，成员共有三名：分别是汀洋（音乐制作人），赵辰龙（词人/混音师），尼成（录音师）。', '0', '2017-02-20 20:16:48');
INSERT INTO `tb_singer` VALUES ('71', '牛奶咖啡', '牛奶咖啡.jpg', '牛奶咖啡（milk coffee）是内地小清新组合 ，由富妍，格非2名成员组成。', '0', '2017-02-20 20:17:14');
INSERT INTO `tb_singer` VALUES ('72', '苏打绿', '苏打绿.jpg', '苏打绿（Sodagreen），中国台湾流行演唱团体，由吴青峰、史俊威、谢馨仪、龚钰祺、刘家凯、何景扬组成。', '0', '2017-02-20 20:17:41');
INSERT INTO `tb_singer` VALUES ('73', '逃跑计划', '逃跑计划.jpg', '逃跑计划乐队，又称Escape Plan乐队，中国流行摇滚乐队，乐队由毛川、马晓东、刚昂、红桃组成 。', '0', '2017-02-20 20:18:08');
INSERT INTO `tb_singer` VALUES ('74', 'Alan Walker', 'Alan Walker.jpg', '艾伦·奥拉夫·沃克（英语：Alan Olav Walker，1997年8月24日－），是一位生于英格兰北安普顿的挪威籍DJ和音乐制作人。', '0', '2017-02-20 21:25:30');
INSERT INTO `tb_singer` VALUES ('75', 'Bruno Mars', 'Bruno Mars.jpg', '布鲁诺·马尔斯（Bruno Mars），原名彼得·基恩·埃尔南德斯（Peter Gene Hernandez），是美国的创作型歌手、音乐制作人。', '0', '2017-02-20 21:26:24');
INSERT INTO `tb_singer` VALUES ('76', 'Charlie Puth', 'Charlie Puth.jpg', 'Charlie Puth，这位来自新泽西的年轻男孩，伯克利音乐学院科班出身，凭借深厚的音乐功底，干净悠扬的嗓音在美国音乐界引起广泛关注。', '0', '2017-02-20 21:26:46');
INSERT INTO `tb_singer` VALUES ('77', 'Eminem', 'Eminem.jpg', '埃米纳姆（Eminem），世界级说唱天王、音乐制作人及演员。美国十大现象级人物之一。', '0', '2017-02-20 21:27:10');
INSERT INTO `tb_singer` VALUES ('78', 'Flo Rida', 'Flo Rida.jpg', 'Flo Rida本名Tramar Dillard，生于1979年9月17号，出生地为美国佛罗里达，carol市。', '0', '2017-02-20 21:27:29');
INSERT INTO `tb_singer` VALUES ('79', 'Justin Bieber', 'Justin Bieber.jpg', '贾斯丁·德鲁·比伯（英语：Justin Drew Bieber ,1994年3月1日－），加拿大歌手。早期因为在YouTube翻唱其他人的歌曲而出名。', '0', '2017-02-20 21:27:51');
INSERT INTO `tb_singer` VALUES ('80', 'Tez Cadey', 'Tez Cadey.jpg', '来自法国巴黎的电子音乐制作人Tez Cadey，代表作《Walls - EP》、《 Para EP》、《 Juventi EP》等。', '0', '2017-02-20 21:28:13');
INSERT INTO `tb_singer` VALUES ('81', 'Wiz Khalifa', 'Wiz Khalifa.jpg', '卡梅伦·吉布里尔·托马斯（Cameron Jibril Thomaz），生于1987年9月8日，以其艺名维兹·卡利法（Wiz Khalifa）出名，是美国宾夕法尼亚州匹兹堡出身的说唱歌手。', '0', '2017-02-20 21:28:38');
INSERT INTO `tb_singer` VALUES ('82', 'Adele', 'Adele.jpg', 'Adele，英国著名流行女歌手，世界流行天后，格莱美奖宠儿，首位全英音乐奖评审团奖得主。', '0', '2017-02-20 21:29:05');
INSERT INTO `tb_singer` VALUES ('83', 'Avril Lavigne', 'Avril Lavigne.jpg', '艾薇儿 拉维尼（Avril Lavigne），加拿大著名流行女歌手、摇滚小天后、歌曲创作者及演员。', '0', '2017-02-20 21:29:24');
INSERT INTO `tb_singer` VALUES ('84', 'Carly Rae Jepsen', 'Carly Rae Jepsen.jpg', '卡莉·蕾·吉普森（英语：Carly Rae Jepsen，1985年11月21日－），加拿大歌手兼词曲作家。', '0', '2017-02-20 21:29:51');
INSERT INTO `tb_singer` VALUES ('85', 'Kelly Clarkson', 'Kelly Clarkson.jpg', '\"Kelly Clarkson是胜出葛莱美奖的美国流行音乐歌手。', '0', '2017-02-20 21:30:11');
INSERT INTO `tb_singer` VALUES ('86', 'Lenka', 'Lenka.jpg', '蕾恩卡 克莉帕克，1978年3月19日一出生于澳大利亚新南威尔士。早年出演过影视剧集，2004年加入Electronic-Rock 团体Decoder Ring，成为一名作曲家。', '0', '2017-02-20 21:30:30');
INSERT INTO `tb_singer` VALUES ('87', 'Rihanna', 'Rihanna.jpg', 'Rihanna来自加勒比岛国巴巴多斯，是欧美乐坛当红歌手、演员和时尚女星，在全球多个国家都享誉盛名。', '0', '2017-02-20 21:31:01');
INSERT INTO `tb_singer` VALUES ('88', 'Taylor Swift', 'Taylor Swift.jpg', '泰勒 斯威夫特（Taylor Swift），美国乡村音乐著名创作女歌手。', '0', '2017-02-20 21:31:21');
INSERT INTO `tb_singer` VALUES ('89', 'Fall Out Boy', 'Fall Out Boy.jpg', 'Fall Out Boy是来自芝加哥的一个乐队,组建于2001年,曾获格莱美提名。', '0', '2017-02-20 21:31:52');
INSERT INTO `tb_singer` VALUES ('90', 'Maroon 5', 'Maroon 5.jpg', '魔力红（英语：Maroon 5）是一个来自美国加利福尼亚州洛杉矶的流行摇滚乐队。', '0', '2017-02-20 21:32:15');
INSERT INTO `tb_singer` VALUES ('91', 'One Direction', 'One Direction.jpg', '一世代出道于2010年，成员有5位，包括奈尔·霍兰（Niall Horan）、哈利·斯泰尔（Harry Styles）、路易·汤姆林森（Louis Tomlinson）、连恩·佩恩（Liam Payne）、赞恩·马利克（Zayn Malik），其中赞恩·马利克于2015年3月25日退出。', '0', '2017-02-20 21:32:33');
INSERT INTO `tb_singer` VALUES ('93', 'OneRepublic', 'OneRepublic.jpg', 'OneRepublic（共和时代或称一体共和）是美国的一个流行摇滚乐队，曲风pop-rock/indie/alternative。乐队成立是2004年科罗拉多州，几个成员都是受Ryan Tedder所影响，贝斯手Meyers，吉他手Filkins、Drew Brown，鼓手Eddie Fischer。2006年OneRepublic的天使专辑打破哥伦比亚纪录，而Ryan Tedder说 \"\"我要让人们喜欢.我不想有人说,\'噢, 他有一个漂亮的声音。', '0', '2017-02-20 21:32:48');
INSERT INTO `tb_singer` VALUES ('94', 'Owl City', 'Owl City.jpg', '猫头鹰之城乐队（Owl City）是一支来自美国明尼苏达州的电子音乐乐队。乐队仅由一名成员组成：亚当 扬（Adam Young）。亚当 扬于2007年创建了该乐队，并且担任乐队的主唱、编曲、创作、混音合成工作。', '0', '2017-02-20 21:33:10');
INSERT INTO `tb_singer` VALUES ('95', 'The Chainsmokers', 'The Chainsmokers.jpg', 'The Chainsmokers，成立于2012年，是一个来自美国纽约的DJ组合，由成员亚历克斯·鲍尔(Alex Pall)和安德鲁·塔格特(Andrew Taggart) 组成。', '0', '2017-02-20 21:33:28');
INSERT INTO `tb_singer` VALUES ('96', 'DJ OKAWARI', 'DJ OKAWARI.jpg', 'Dj Okawari来自于日本静冈县，曲风以jazz-hiphop和chill-hop为主，有一种十分空灵自然的唯美感。', '0', '2017-02-20 21:48:12');
INSERT INTO `tb_singer` VALUES ('97', 'Piko-Taro', 'Piko-Taro.jpg', '中文名：Piko太郎外文名：古坂和仁别名：ピコ太郎国籍：日本出生地：千葉県生日：1973/07/17职业：日本搞笑艺人代表作：PPAP', '0', '2017-02-20 21:48:29');
INSERT INTO `tb_singer` VALUES ('99', '高梨康治', '高梨康治.jpg', '高梨康治，日本作曲家、编曲家、键盘演奏者；和风硬摇滚乐队“六三四Musashi”的成员之一。', '0', '2017-02-20 21:49:08');
INSERT INTO `tb_singer` VALUES ('100', '久石譲', '久石譲.jpg', '\"久石让（1950年12月6日－），日本著名音乐人、作曲家、歌手、钢琴家，出生于长野县中野市，国立音乐大学作曲科毕业。“久石让”这个名字的来源是他的偶像——美国黑人音乐家及制作人昆西·琼斯。', '0', '2017-02-20 21:49:31');
INSERT INTO `tb_singer` VALUES ('101', '澤野弘之', '澤野弘之.jpg', '日本作曲家，1980年9月12日出生于东京都，以电视剧、动画、电影、电影音乐为中心进行作曲和编曲工作，同时也为许多艺人写作曲子。', '0', '2017-02-20 21:49:49');
INSERT INTO `tb_singer` VALUES ('102', 'Aimer', 'Aimer.jpg', 'Aimer(エメ)，是一名日本女歌手，在2011年9月7日以单曲「六等星の夜/悲しみはオーロラに/TWINKLE TWINKLE LITTLE STAR」正式出道，隶属唱片公司是日本索尼音乐娱乐旗下的DefSTAR Records，2015年9月移籍到SME Records。', '0', '2017-02-20 21:50:12');
INSERT INTO `tb_singer` VALUES ('103', '倉木麻衣', '倉木麻衣.jpg', '仓木麻衣（Kuraki Mai），1982年10月28日生于日本千叶县船桥市，日本女歌手。', '0', '2017-02-20 21:50:31');
INSERT INTO `tb_singer` VALUES ('105', '鹿乃', '鹿乃.jpg', '鹿乃(かの)，Niconico动画上常见萌系唱见，由2010年开始投稿自己的翻唱作品，现有投稿作品60余，个人专辑6张，另外有一首原创vocaloid作品。', '0', '2017-02-20 21:51:13');
INSERT INTO `tb_singer` VALUES ('106', '茅野愛衣', '茅野愛衣.jpg', '茅野爱衣，日本女性声优，美容师，Pro?Fit事务所所属。主要代表作品及角色有：《我们仍未知道那天所看见的花的名字》本间芽衣子、《罪恶王冠》楪祈、 《冰菓》伊原摩耶花等。', '0', '2017-02-20 21:51:43');
INSERT INTO `tb_singer` VALUES ('107', '小野リサ', '小野リサ.jpg', '小野丽莎，日本爵士乐女歌手，首席Bossa Nova女王，1962年出生于巴西圣保罗，自小在良好的音乐氛围中成长。', '0', '2017-02-20 21:52:03');
INSERT INTO `tb_singer` VALUES ('108', 'GARNiDELiA', 'GARNiDELiA.jpg', 'Garnidelia组合是以Maria（音译：美依礼芽）和Toku-P来开展乐曲制作、企划、Live演出等活动的音乐组合。', '0', '2017-02-20 21:52:29');
INSERT INTO `tb_singer` VALUES ('109', 'moumoon', 'moumoon.jpg', 'moumoon是来自日本的一个流行乐队组合，由女主唱Yuka和男吉他手Masaki组合而成，乐队在2004年结成，在经历了两年地下音乐的洗礼后，于2007年加入大唱片厂牌avex trax社，并开始在J-Pop音乐圈子里展露头脚。', '0', '2017-02-20 21:52:47');
INSERT INTO `tb_singer` VALUES ('110', 'MYTH & ROID', 'MYTH & ROID.jpg', 'MYTH & ROID，日本男女二人组合，代表作《L.L.L》是MYTH & ROID为日本电视动画《OVERLORD》创作的专辑。', '0', '2017-02-20 21:53:05');
INSERT INTO `tb_singer` VALUES ('112', 'G-DRAGON', 'G-DRAGON.jpg', 'G-DRAGON(权志龙)，1988年8月18日出生于韩国首尔，韩国男歌手，男子演唱组合BIGBANG队长。', '0', '2017-02-20 21:35:16');
INSERT INTO `tb_singer` VALUES ('113', 'MC몽', 'MC몽.jpg', 'C?(MC梦)，本名申东泫，1979年9月4日出生于韩国首尔，韩国男歌手。', '0', '2017-02-20 21:35:33');
INSERT INTO `tb_singer` VALUES ('114', 'MINO', 'MINO.jpg', 'MINO(宋旻浩)，1993年3月30日出生于韩国，韩国男歌手、演员、主持人，男子演唱组合WINNER成员之一。', '0', '2017-02-20 21:35:50');
INSERT INTO `tb_singer` VALUES ('115', 'PSY', 'PSY.jpg', 'PSY，本名朴载相，又被称为鸟叔，1977年12月31日出生于韩国首尔，韩国歌手。', '0', '2017-02-20 21:36:11');
INSERT INTO `tb_singer` VALUES ('116', '매드 클라운', '매드 클라운.jpg', 'Mad Clown，原名为赵东林，1985年3月25日出生于韩国，美籍韩裔男歌手，毕业于韩国圣公会大学。', '0', '2017-02-20 21:36:40');
INSERT INTO `tb_singer` VALUES ('117', '이루마', '이루마.jpg', '李闰珉在韩国出生英国长大，曾就学于英国伦敦\'The Purcell School\' 特别音乐学校，后来毕业于 \'King\'s College of London University\' ，主修作曲。', '0', '2017-02-20 21:37:08');
INSERT INTO `tb_singer` VALUES ('118', '찬열', '찬열.jpg', '灿烈，本名朴灿烈，1992年11月27日出生于韩国首尔，韩国男子演唱组合EXO成员，歌手、演员。', '0', '2017-02-20 21:55:48');
INSERT INTO `tb_singer` VALUES ('119', '첸 (Chen)', '첸 (Chen).jpg', '本名为金钟大，1992年9月21日出身于韩国京畿道始兴市。', '0', '2017-02-20 21:38:18');
INSERT INTO `tb_singer` VALUES ('120', '케이윌 (K.Will)', '케이윌 (K.Will).jpg', '1981年12月30日出生于韩国首尔，韩国男歌手、演员。 2007年，推出首张个人音乐专辑《左胸》，从而正式出道。', '0', '2017-02-20 21:38:44');
INSERT INTO `tb_singer` VALUES ('121', '타이거 JK', '타이거 JK.jpg', '1974年7月29日出生的的韩国男歌手，韩国最著名的HipHop歌手之一，前音乐组合Drunken Tiger成员。', '0', '2017-02-20 21:39:15');
INSERT INTO `tb_singer` VALUES ('122', 'NS 윤지', 'NS 윤지.jpg', '金允智，艺名NS允智（NS Yoon-G），1988年9月6日出生于韩国首尔，韩国solo女歌手。', '0', '2017-02-20 21:39:41');
INSERT INTO `tb_singer` VALUES ('123', 'SARA', 'SARA.jpg', 'Sara，韩国The Color组合成员，著名女歌手，是中国天浩盛世音乐文化签约的歌手。', '0', '2017-02-20 21:40:02');
INSERT INTO `tb_singer` VALUES ('124', '린', '린.jpg', '本名为李世真，韩国女歌手，1981年出生，2001年以本名李世真发行1辑《My First Confession》，2002年后以艺名LYn出道，至今已经发行8张专辑和1张Remake专辑及多首合唱歌曲和OST，2010年并出版了个人散文图文书 《LOVELYn\'s MELODY BOOK》，是被认可的实力派女歌手。', '0', '2017-02-20 21:40:25');
INSERT INTO `tb_singer` VALUES ('125', '백지영', '백지영.jpg', '白智英，1976年3月25日出生于韩国首尔，韩国女歌手、演员。', '0', '2017-02-20 21:40:51');
INSERT INTO `tb_singer` VALUES ('126', '아이유', '아이유.jpg', '原名为李知恩。1993年5月16日出生于韩国首尔，韩国女歌手、演员、主持人。', '0', '2017-02-20 21:41:20');
INSERT INTO `tb_singer` VALUES ('127', '에일리', '에일리.jpg', '本名为李艺真，韩国女歌手、演员，1989年5月30日出生于美国科罗拉多州丹佛市。', '0', '2017-02-20 21:41:41');
INSERT INTO `tb_singer` VALUES ('128', '윤미래 (尹美莱)', '윤미래 (尹美莱).jpg', '1981年5月31日出生于美国德克萨斯州胡德堡，美韩混血，韩国女歌手。1997年以韩国四人组合UPTOWN成员之一出道，现为韩国组合MFBTY成员之一。', '0', '2017-02-20 21:42:11');
INSERT INTO `tb_singer` VALUES ('129', '하리', '하리.jpg', 'Hari荷莉，韩国女歌手，音译郑圣京，1990年生，出道3年。2013年3月，因《可爱颂》的小情歌急速爆红。2015年4月发行《可爱颂2015》。', '0', '2017-02-20 21:42:32');
INSERT INTO `tb_singer` VALUES ('130', '효린', '효린.jpg', '中文名为金孝静，1991年1月11日出生于韩国仁川，韩国女歌手、演员，组合SISTAR成员之一。', '0', '2017-02-20 21:42:55');
INSERT INTO `tb_singer` VALUES ('131', 'EXO', 'EXO.jpg', '是韩国SM娱乐有限公司于2012年4月8日正式推出的12人男子流行演唱团体。现以9名成员的形式展开活动，分别为金珉锡(XIU MIN)、金俊勉(SUHO)、张艺兴(LAY)、边伯贤(BAEKHYUN)、金钟大(CHEN)、朴灿烈(CHANYEOL)、都暻秀(D.O.)、金钟仁(KAI)、吴世勋(SEHUN)，其中张艺兴为中国籍成员，已退队成员有鹿晗(2014年10月)、吴亦凡(2014年5月)、黄子韬(2015年4月)。', '0', '2017-02-20 21:44:28');
INSERT INTO `tb_singer` VALUES ('132', 'BIGBANG', 'BIGBANG.jpg', 'BIGBANG，于2006年出道的韩国组合，由队长G-DRAGON、T.O.P、TAEYANG、DAESUNG、SEUNGRI五位成员组成。 2006年8月19日，BIGBANG在YG Family世界巡回演唱会首尔站上正式出道，并于同年12月22日发行首张正规专辑《BIGBANG Vol.1》。', '0', '2017-02-20 21:43:51');
INSERT INTO `tb_singer` VALUES ('133', 'T-ara', 'T-ara.jpg', 'T-ara，韩国Core Centens Media于2009年推出的女子流行演唱组合，由全宝蓝、李居丽、朴昭妍、咸恩静、朴孝敏、朴智妍6名成员组成。名称T-ara源自英文“Tiara”，指想成为歌谣界的“女王”。2009年7月29日，T-ara以6人组合正式出道 ；11月27日发布首张韩语正规专辑《Absolute First Album》。', '0', '2017-02-20 21:45:27');
INSERT INTO `tb_singer` VALUES ('134', '防弹少年团', '防弹少年团.jpg', '是韩国BigHit Entertainment旗下于2013年出道的男子演唱组合，由金南俊(Rap Monster)、金硕珍(Jin)、闵玧其(SUGA)、郑号锡(j-hope)、朴智旻(JIMIN)、金泰亨(V)、田柾国(Jung Kook)7名成员组成。 2013年6月12日，发行出道单曲《2 COOL 4 SKOOL》；6月13日，在Mnet M!Countdown以出道曲《No More Dream》正式出道。', '0', '2017-02-20 21:46:07');
INSERT INTO `tb_singer` VALUES ('135', 'WINNER', 'WINNER.jpg', 'WINNER，是韩国YG Entertainment于2014年推出的男子组合，五名成员包括姜昇润、金秦禹、李昇勋、宋旻浩、南太铉（已退队）。 2014年8月14日发行首张正规专辑《2014 S/S》；8月15日在YG Famliy演唱会上演唱《Empty》首次登台；8月17日在《SBS人气歌谣》完成出道舞台以及作为正式出道日；9月10日发行专辑《2014 S/S-Japan Collection-》在日本出道，11日开始日本巡演。', '0', '2017-02-20 21:45:47');
INSERT INTO `tb_singer` VALUES ('136', 'AOA', 'AOA.jpg', 'AOA，全称Ace Of Angels，韩国FNC Entertainment旗下女子组合，是该公司推出的首支女子组合。由七名全天使，申智珉、朴草娥、徐酉奈、申惠晶、权珉娥、金雪炫、金澯美，与一名半天使，徐有庆组成。官方粉丝名称经投票后选定为“Elvis”，粉丝名意义就像出道曲“Elvis”里歌词一样，无时无刻爱着粉丝们。', '0', '2017-02-20 21:43:31');
INSERT INTO `tb_singer` VALUES ('137', 'BLACKPINK', 'BLACKPINK.jpg', 'BLACKPINK，是YG娱乐于2016年推出的女子团体，共有JISOO、JENNIE、ROSé、LISA四名成员。BLACKPINK原定于2012年出道，官方也已释出练习影片并且公布其中两名成员身份，然而直到2014年仍旧尚未正式出道，直到2016年才正式透过官方公开了成员名单与团名。2016年6月29日，YG娱乐在接连四周公布四名成员之后，最终公布了新女团的团名为“BLACKPINK”。', '0', '2017-02-20 21:44:09');
INSERT INTO `tb_singer` VALUES ('138', 'iKON', 'iKON.jpg', 'iKON，是YG Entertainment于2015年9月15日推出的男子演唱组合，由金振焕、宋允亨、金知元(Bobby)、金韩彬(B.I)、具俊会、郑粲右、金东赫7名成员组成。2014年9月11日，出演YG Entertainment出道生存节目《MIX & MATCH》。', '0', '2017-02-20 21:44:54');
INSERT INTO `tb_singer` VALUES ('139', 'Cagnet', 'Cagnet.jpg', '中文名：日向大介外文名：Cagnet国 籍：日本民 族：和族主要成就：FILL ME - CAGNET。他们96年以<悠长假期>电视原声带而在日本音乐界声名大噪、备受瞩目的首席日剧配乐乐团“CAGNET”，由名制作人日向大介、成员meo、Phil Sista、Space Junkies所组成，其中日向大介与兄弟日向敏文号称日本双头配单大师，创造出无数脍炙人口的畅销作品。连<恋爱世代>的女主角松隆子，其唱片便由日向大介所制作。', '0', '2017-02-20 21:53:53');
INSERT INTO `tb_singer` VALUES ('140', 'Kehlani', 'Kehlani.jpg', 'Kehlani于1995年4月24日出生在美国加利福尼亚州的奥克兰。是一个R&B歌手，创作人。', '0', '2017-02-20 21:54:18');
INSERT INTO `tb_singer` VALUES ('141', 'Anthem Lights', 'Anthem Lights.jpg', 'Anthem Lights(国歌灯，也被称为“美国优质男团”)，原名Yellow Cavalier（黄色骑士），是一个来自于美国田纳西州纳什维尔的基督教乐队。', '0', '2017-02-20 21:54:42');
INSERT INTO `tb_singer` VALUES ('142', '张学友', '张学友.jpg', '张学友，1961年7月10日出生于香港，中国香港男歌手、演员，毕业于香港崇文英文书院。', '0', '2017-02-27 14:55:30');

-- ----------------------------
-- Table structure for `tb_singer_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_singer_type`;
CREATE TABLE `tb_singer_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `typeName` (`typeName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_singer_type
-- ----------------------------
INSERT INTO `tb_singer_type` VALUES ('14', '其他女歌手');
INSERT INTO `tb_singer_type` VALUES ('13', '其他男歌手');
INSERT INTO `tb_singer_type` VALUES ('15', '其他组合/乐队');
INSERT INTO `tb_singer_type` VALUES ('2', '华语女歌手');
INSERT INTO `tb_singer_type` VALUES ('1', '华语男歌手');
INSERT INTO `tb_singer_type` VALUES ('3', '华语组合/乐队');
INSERT INTO `tb_singer_type` VALUES ('8', '日本女歌手');
INSERT INTO `tb_singer_type` VALUES ('7', '日本男歌手');
INSERT INTO `tb_singer_type` VALUES ('9', '日本组合/乐队');
INSERT INTO `tb_singer_type` VALUES ('5', '欧美女歌手');
INSERT INTO `tb_singer_type` VALUES ('4', '欧美男歌手');
INSERT INTO `tb_singer_type` VALUES ('6', '欧美组合/乐队');
INSERT INTO `tb_singer_type` VALUES ('11', '韩国女歌手');
INSERT INTO `tb_singer_type` VALUES ('10', '韩国男歌手');
INSERT INTO `tb_singer_type` VALUES ('12', '韩国组合/乐队');

-- ----------------------------
-- Table structure for `tb_singer_type_rela`
-- ----------------------------
DROP TABLE IF EXISTS `tb_singer_type_rela`;
CREATE TABLE `tb_singer_type_rela` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `singerId` int(4) NOT NULL,
  `typeId` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `singerId` (`singerId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `tb_singer_type_rela_ibfk_1` FOREIGN KEY (`singerId`) REFERENCES `tb_singer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_singer_type_rela_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `tb_singer_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_singer_type_rela
-- ----------------------------
INSERT INTO `tb_singer_type_rela` VALUES ('18', '27', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('19', '28', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('20', '29', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('21', '30', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('22', '31', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('23', '32', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('25', '34', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('26', '35', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('27', '36', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('29', '38', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('30', '39', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('31', '40', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('32', '41', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('33', '42', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('34', '43', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('35', '44', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('36', '45', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('37', '46', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('38', '47', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('39', '48', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('40', '49', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('41', '50', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('42', '51', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('43', '52', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('45', '54', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('46', '55', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('47', '56', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('48', '57', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('49', '58', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('50', '59', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('52', '61', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('53', '62', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('54', '63', '2');
INSERT INTO `tb_singer_type_rela` VALUES ('55', '64', '1');
INSERT INTO `tb_singer_type_rela` VALUES ('56', '65', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('57', '66', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('58', '67', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('59', '68', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('60', '69', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('61', '70', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('62', '71', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('63', '72', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('64', '73', '3');
INSERT INTO `tb_singer_type_rela` VALUES ('65', '74', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('66', '75', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('67', '76', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('68', '77', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('69', '78', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('70', '79', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('71', '80', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('72', '81', '4');
INSERT INTO `tb_singer_type_rela` VALUES ('73', '82', '5');
INSERT INTO `tb_singer_type_rela` VALUES ('74', '83', '5');
INSERT INTO `tb_singer_type_rela` VALUES ('75', '84', '5');
INSERT INTO `tb_singer_type_rela` VALUES ('76', '85', '5');
INSERT INTO `tb_singer_type_rela` VALUES ('77', '86', '5');
INSERT INTO `tb_singer_type_rela` VALUES ('78', '87', '5');
INSERT INTO `tb_singer_type_rela` VALUES ('79', '88', '5');
INSERT INTO `tb_singer_type_rela` VALUES ('80', '89', '6');
INSERT INTO `tb_singer_type_rela` VALUES ('81', '90', '6');
INSERT INTO `tb_singer_type_rela` VALUES ('82', '91', '6');
INSERT INTO `tb_singer_type_rela` VALUES ('84', '93', '6');
INSERT INTO `tb_singer_type_rela` VALUES ('85', '94', '6');
INSERT INTO `tb_singer_type_rela` VALUES ('86', '95', '6');
INSERT INTO `tb_singer_type_rela` VALUES ('87', '96', '7');
INSERT INTO `tb_singer_type_rela` VALUES ('88', '97', '7');
INSERT INTO `tb_singer_type_rela` VALUES ('90', '99', '7');
INSERT INTO `tb_singer_type_rela` VALUES ('91', '100', '7');
INSERT INTO `tb_singer_type_rela` VALUES ('92', '101', '7');
INSERT INTO `tb_singer_type_rela` VALUES ('93', '102', '8');
INSERT INTO `tb_singer_type_rela` VALUES ('94', '103', '8');
INSERT INTO `tb_singer_type_rela` VALUES ('96', '105', '8');
INSERT INTO `tb_singer_type_rela` VALUES ('97', '106', '8');
INSERT INTO `tb_singer_type_rela` VALUES ('98', '107', '8');
INSERT INTO `tb_singer_type_rela` VALUES ('99', '108', '9');
INSERT INTO `tb_singer_type_rela` VALUES ('100', '109', '9');
INSERT INTO `tb_singer_type_rela` VALUES ('101', '110', '9');
INSERT INTO `tb_singer_type_rela` VALUES ('103', '112', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('104', '113', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('105', '114', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('106', '115', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('107', '116', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('108', '117', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('109', '118', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('110', '119', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('111', '120', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('112', '121', '10');
INSERT INTO `tb_singer_type_rela` VALUES ('113', '122', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('114', '123', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('115', '124', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('116', '125', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('117', '126', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('118', '127', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('119', '128', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('120', '129', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('121', '130', '11');
INSERT INTO `tb_singer_type_rela` VALUES ('122', '131', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('123', '132', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('124', '133', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('125', '134', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('126', '135', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('127', '136', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('128', '137', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('129', '138', '12');
INSERT INTO `tb_singer_type_rela` VALUES ('130', '139', '13');
INSERT INTO `tb_singer_type_rela` VALUES ('131', '140', '14');
INSERT INTO `tb_singer_type_rela` VALUES ('132', '141', '15');
INSERT INTO `tb_singer_type_rela` VALUES ('133', '142', '1');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `img` varchar(20) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `level` int(4) NOT NULL,
  `grade` int(4) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `playCount` int(4) NOT NULL,
  `lastLoginTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `lastLoginIp` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('4', 'libaoshen1', '202cb962ac59075b964b07152d234b70', 'libaoshen1.jpg', '18202710065', '0', '70', '490436248@qq.com', '22', '27', '2017-03-01 00:34:40', '0:0:0:0:0:0:0:1');
INSERT INTO `tb_user` VALUES ('5', 'wangzhi', '202cb962ac59075b964b07152d234b70', '0', '13112345678', '0', '10', 'wangzhi@hust.com', null, '29', '2017-02-28 22:17:59', '0:0:0:0:0:0:0:1');
INSERT INTO `tb_user` VALUES ('7', 'yaohaoyu', '202cb962ac59075b964b07152d234b70', 'yaohaoyu.jpg', '13695529171', '0', '0', 'yaohaoyu@hust.com', '13', '3', '2017-03-01 00:27:46', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for `tb_user_singer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_singer`;
CREATE TABLE `tb_user_singer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(4) NOT NULL,
  `singerId` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `singerId` (`singerId`),
  CONSTRAINT `tb_user_singer_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_user_singer_ibfk_2` FOREIGN KEY (`singerId`) REFERENCES `tb_singer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_singer
-- ----------------------------
INSERT INTO `tb_user_singer` VALUES ('1', '4', '43');
INSERT INTO `tb_user_singer` VALUES ('2', '4', '44');
INSERT INTO `tb_user_singer` VALUES ('3', '4', '27');
INSERT INTO `tb_user_singer` VALUES ('8', '5', '27');
