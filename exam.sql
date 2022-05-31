/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1-本地库
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : yf_exam_lite

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 30/03/2022 20:23:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for el_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_exam`;
CREATE TABLE `el_exam` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '考试名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '考试描述',
  `open_type` int NOT NULL DEFAULT '1' COMMENT '1公开2部门3定员',
  `join_type` int NOT NULL COMMENT '组题方式1题库,2指定',
  `level` int NOT NULL DEFAULT '0' COMMENT '难度:0不限,1普通,2较难',
  `state` int NOT NULL DEFAULT '0' COMMENT '考试状态',
  `time_limit` tinyint NOT NULL DEFAULT '0' COMMENT '是否限时',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `total_score` int NOT NULL DEFAULT '0' COMMENT '总分数',
  `total_time` int NOT NULL DEFAULT '0' COMMENT '总时长（分钟）',
  `qualify_score` int NOT NULL DEFAULT '0' COMMENT '及格分数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `open_type` (`open_type`),
  KEY `level` (`level`),
  KEY `join_type` (`join_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程';

-- ----------------------------
-- Records of el_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `join_type`, `level`, `state`, `time_limit`, `start_time`, `end_time`, `create_time`, `update_time`, `total_score`, `total_time`, `qualify_score`) VALUES ('1356425140212076545', '演示考试', '演示考试信息', 1, 1, 0, 0, 0, '2021-02-24 00:00:00', '2021-03-18 00:00:00', '2021-02-02 10:12:09', '2021-02-02 10:12:09', 100, 30, 80);
COMMIT;

-- ----------------------------
-- Table structure for el_exam_depart
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_depart`;
CREATE TABLE `el_exam_depart` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL DEFAULT '' COMMENT '考试ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `exam_id` (`exam_id`),
  KEY `depart_id` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='考试部门';

-- ----------------------------
-- Records of el_exam_depart
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_exam_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_repo`;
CREATE TABLE `el_exam_repo` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(64) NOT NULL COMMENT '考试ID',
  `repo_id` varchar(64) NOT NULL COMMENT '题库ID',
  `radio_count` int NOT NULL DEFAULT '0' COMMENT '单选题数量',
  `radio_score` int NOT NULL DEFAULT '0' COMMENT '单选题分数',
  `multi_count` int NOT NULL DEFAULT '0' COMMENT '多选题数量',
  `multi_score` int NOT NULL DEFAULT '0' COMMENT '多选题分数',
  `judge_count` int NOT NULL DEFAULT '0' COMMENT '判断题数量',
  `judge_score` int NOT NULL DEFAULT '0' COMMENT '判断题分数',
  `saq_count` int NOT NULL DEFAULT '0' COMMENT '简答题数量',
  `saq_score` int NOT NULL DEFAULT '0' COMMENT '简答题分数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `exam_repo_id` (`exam_id`,`repo_id`),
  KEY `rule_id` (`exam_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='考试题库';

-- ----------------------------
-- Records of el_exam_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`) VALUES ('1461506152130015234', '1356425140212076545', '1265561101609795585', 6, 10, 2, 10, 2, 10, 0, 0);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`) VALUES ('1473853659543552001', '1473853659363196929', '1265561101609795585', 5, 20, 5, 20, 5, 20, 0, 0);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`) VALUES ('1473855269002854401', '1473855268990271490', '1265561101609795585', 5, 10, 2, 10, 0, 0, 0, 0);
INSERT INTO `el_exam_repo` (`id`, `exam_id`, `repo_id`, `radio_count`, `radio_score`, `multi_count`, `multi_score`, `judge_count`, `judge_score`, `saq_count`, `saq_score`) VALUES ('1473876640730759169', '1473876640705593346', '1265561101609795585', 11, 20, 0, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for el_paper
-- ----------------------------
DROP TABLE IF EXISTS `el_paper`;
CREATE TABLE `el_paper` (
  `id` varchar(64) NOT NULL COMMENT '试卷ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `exam_id` varchar(64) NOT NULL COMMENT '规则ID',
  `title` varchar(64) NOT NULL COMMENT '考试标题',
  `total_time` int NOT NULL DEFAULT '0' COMMENT '考试时长',
  `user_time` int NOT NULL DEFAULT '0' COMMENT '用户时长',
  `total_score` int NOT NULL DEFAULT '0' COMMENT '试卷总分',
  `qualify_score` int NOT NULL DEFAULT '0' COMMENT '及格分',
  `obj_score` int NOT NULL DEFAULT '0' COMMENT '客观分',
  `subj_score` int NOT NULL DEFAULT '0' COMMENT '主观分',
  `user_score` int NOT NULL COMMENT '用户得分',
  `has_saq` tinyint NOT NULL DEFAULT '0' COMMENT '是否包含简答题',
  `state` int NOT NULL DEFAULT '1' COMMENT '试卷状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `limit_time` datetime DEFAULT NULL COMMENT '截止时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷';

-- ----------------------------
-- Records of el_paper
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu`;
CREATE TABLE `el_paper_qu` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `qu_type` int NOT NULL COMMENT '题目类型',
  `answered` tinyint NOT NULL DEFAULT '0' COMMENT '是否已答',
  `answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '主观答案',
  `sort` int NOT NULL DEFAULT '0' COMMENT '问题排序',
  `score` int NOT NULL DEFAULT '0' COMMENT '单题分分值',
  `actual_score` int NOT NULL DEFAULT '0' COMMENT '实际得分(主观题)',
  `is_right` tinyint NOT NULL DEFAULT '0' COMMENT '是否答对',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷考题';

-- ----------------------------
-- Records of el_paper_qu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu_answer`;
CREATE TABLE `el_paper_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '自增ID',
  `paper_id` varchar(64) NOT NULL COMMENT '试卷ID',
  `answer_id` varchar(32) NOT NULL COMMENT '回答项ID',
  `qu_id` varchar(32) NOT NULL COMMENT '题目ID',
  `is_right` tinyint NOT NULL DEFAULT '0' COMMENT '是否正确项',
  `checked` tinyint NOT NULL DEFAULT '0' COMMENT '是否选中',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `abc` varchar(64) NOT NULL DEFAULT '' COMMENT '选项标签',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷考题备选答案';

-- ----------------------------
-- Records of el_paper_qu_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_qu`;
CREATE TABLE `el_qu` (
  `id` varchar(64) NOT NULL COMMENT '题目ID',
  `qu_type` int NOT NULL COMMENT '题目类型',
  `level` int NOT NULL DEFAULT '1' COMMENT '1普通,2较难',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '题目图片',
  `content` varchar(2000) NOT NULL COMMENT '题目内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题目备注',
  `analysis` varchar(2000) NOT NULL DEFAULT '' COMMENT '整题解析',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_type` (`qu_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问题题目';

-- ----------------------------
-- Records of el_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286856503755624449', 1, 2, '', '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', '2020-07-25 10:51:13', '2020-07-25 10:51:13', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286856786200055810', 1, 2, '', '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', '2020-07-25 10:52:21', '2020-07-25 10:52:21', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286856991045668865', 1, 2, '', '找出下列数字中多余的一个：', '2020-07-25 10:53:09', '2020-07-25 10:53:09', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286857269660700674', 1, 2, '', '五个答案中哪个是最好的类比？皮对于树相当于鳞对于', '2020-07-25 10:54:16', '2020-07-25 10:54:16', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286858556779352066', 1, 2, '', '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', '2020-07-25 10:59:23', '2020-07-25 10:59:23', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286858826460516353', 1, 2, '', '角对于元相当于小时对于', '2020-07-25 11:00:27', '2020-07-25 11:00:27', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286859119977910274', 1, 2, '', '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', '2020-07-25 11:01:37', '2020-07-25 11:01:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286859363650195458', 1, 2, '', '找出与众不同的一个：', '2020-07-25 11:02:35', '2020-07-25 11:02:35', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286859710305226754', 1, 2, '', '图中阴影部分占面积百分之几？', '2020-07-25 11:03:58', '2020-07-25 11:03:58', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1286860480865980417', 1, 2, 'http://localhost:8101/upload/file/2021/10/21/1451088569614499842.png', '数数有多少个三角形', '2020-07-25 11:07:02', '2020-07-25 11:07:02', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461505492353413121', 2, 1, '', '以下哪些是中国的特别行政区？', '2021-11-19 09:23:57', '2021-11-19 09:23:57', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461505751183912961', 2, 1, '', '中国东北三省是指（）', '2021-11-19 09:24:59', '2021-11-19 09:24:59', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461505894142570497', 3, 1, '', '咖啡的故乡是非洲吗？', '2021-11-19 09:25:33', '2021-11-19 09:25:33', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1461506028981055490', 3, 1, '', '世界上最长的山脉安第斯山脉', '2021-11-19 09:26:05', '2021-11-19 09:26:05', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936312235171842', 1, 1, '', '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', '2021-12-23 16:39:36', '2021-12-23 16:39:36', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936313120169985', 1, 1, '', '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', '2021-12-23 16:39:36', '2021-12-23 16:39:36', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936313631875073', 1, 1, '', '找出下列数字中多余的一个：', '2021-12-23 16:39:36', '2021-12-23 16:39:36', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936314080665601', 1, 1, '', '五个答案中哪个是最好的类比？皮对于树相当于鳞对于', '2021-12-23 16:39:36', '2021-12-23 16:39:36', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936314462347265', 1, 1, '', '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', '2021-12-23 16:39:36', '2021-12-23 16:39:36', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936314835640322', 1, 1, '', '角对于元相当于小时对于', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936315204739074', 1, 1, '', '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936315561254914', 1, 1, '', '找出与众不同的一个：', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936315888410626', 1, 1, '', '图中阴影部分占面积百分之几？', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936316202983425', 1, 1, '', '数数有多少个三角形', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936316525944833', 2, 1, '', '以下哪些是中国的特别行政区？', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936316857294850', 2, 1, '', '中国东北三省是指（）', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936317159284738', 3, 1, '', '咖啡的故乡是非洲吗？', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
INSERT INTO `el_qu` (`id`, `qu_type`, `level`, `image`, `content`, `create_time`, `update_time`, `remark`, `analysis`) VALUES ('1473936317431914497', 3, 1, '', '世界上最长的山脉安第斯山脉', '2021-12-23 16:39:37', '2021-12-23 16:39:37', '', '');
COMMIT;

-- ----------------------------
-- Table structure for el_qu_answer
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_answer`;
CREATE TABLE `el_qu_answer` (
  `id` varchar(64) NOT NULL COMMENT '答案ID',
  `qu_id` varchar(64) NOT NULL COMMENT '问题ID',
  `is_right` tinyint NOT NULL DEFAULT '0' COMMENT '是否正确',
  `image` varchar(500) NOT NULL DEFAULT '' COMMENT '选项图片',
  `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案内容',
  `analysis` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案分析',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='候选答案';

-- ----------------------------
-- Records of el_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503772401665', '1286856503755624449', 0, '', '73', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595970', '1286856503755624449', 0, '', '63', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595971', '1286856503755624449', 1, '', '53', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595972', '1286856503755624449', 0, '', '43', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856503776595973', '1286856503755624449', 0, '', '27', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786216833025', '1286856786200055810', 0, '', '侄子', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786216833026', '1286856786200055810', 0, '', '表兄', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786221027330', '1286856786200055810', 1, '', '叔叔', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786221027331', '1286856786200055810', 0, '', '母亲', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856786221027332', '1286856786200055810', 0, '', '哥哥', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991058251778', '1286856991045668865', 0, '', '4', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991058251779', '1286856991045668865', 0, '', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991058251780', '1286856991045668865', 0, '', '8', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446081', '1286856991045668865', 0, '', '10', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446082', '1286856991045668865', 1, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446083', '1286856991045668865', 0, '', '16', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446084', '1286856991045668865', 0, '', '19', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446085', '1286856991045668865', 0, '', '32', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286856991062446086', '1286856991045668865', 0, '', '36', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269673283585', '1286857269660700674', 0, '', '鳃', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269673283586', '1286857269660700674', 0, '', '大海', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269673283587', '1286857269660700674', 0, '', '渔夫', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269677477889', '1286857269660700674', 1, '', '鱼', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286857269677477890', '1286857269660700674', 0, '', '鳍', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323585', '1286858556779352066', 0, '', '25.6米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323586', '1286858556779352066', 0, '', '36米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323587', '1286858556779352066', 1, '', '51.2米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556800323588', '1286858556779352066', 0, '', '64.4米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858556804517889', '1286858556779352066', 0, '', '76.2米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826477293569', '1286858826460516353', 1, '', '分', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682178', '1286858826460516353', 0, '', '秒', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682179', '1286858826460516353', 0, '', '月', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682180', '1286858826460516353', 0, '', '日', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286858826485682181', '1286858826460516353', 0, '', '钟', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859119998881794', '1286859119977910274', 0, '', '8', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120003076098', '1286859119977910274', 0, '', '10', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120003076099', '1286859119977910274', 0, '', '12', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120003076100', '1286859119977910274', 1, '', '16', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859120007270402', '1286859119977910274', 0, '', '20', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363675361281', '1286859363650195458', 0, '', '南昌', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363675361282', '1286859363650195458', 0, '', '西安', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363679555586', '1286859363650195458', 0, '', '郑州', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363679555587', '1286859363650195458', 1, '', '哈尔滨', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859363679555588', '1286859363650195458', 0, '', '昆明', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710326198274', '1286859710305226754', 0, '', '20%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710330392578', '1286859710305226754', 1, '', '25% ', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710330392579', '1286859710305226754', 0, '', '30%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710330392580', '1286859710305226754', 0, '', '35%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286859710334586881', '1286859710305226754', 0, '', '40%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480878563329', '1286860480865980417', 0, 'http://localhost:8101/upload/file/2021/10/21/1451088637159571458.png', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480882757634', '1286860480865980417', 0, '', '7', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480882757635', '1286860480865980417', 0, 'http://localhost:8101/upload/file/2021/10/21/1451088685704445953.png', '9', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480882757636', '1286860480865980417', 1, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1286860480886951937', '1286860480865980417', 0, '', '13', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492391161858', '1461505492353413121', 1, '', '香港', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492395356161', '1461505492353413121', 1, '', '澳门', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492395356162', '1461505492353413121', 0, '', '珠海', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505492395356163', '1461505492353413121', 0, '', '重庆', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751196495873', '1461505751183912961', 1, '', '黑龙江省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751200690177', '1461505751183912961', 1, '', '吉林省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751200690178', '1461505751183912961', 1, '', '辽宁省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505751200690179', '1461505751183912961', 0, '', '河北省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505894155153409', '1461505894142570497', 1, '', '正确', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461505894159347714', '1461505894142570497', 0, '', '错误', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461506028993638401', '1461506028981055490', 1, '', '正确', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1461506028993638402', '1461506028981055490', 0, '', '错误', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936312381972481', '1473936312235171842', 0, '', '43', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936312386166785', '1473936312235171842', 0, '', '73', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936312390361090', '1473936312235171842', 1, '', '53', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936312390361091', '1473936312235171842', 0, '', '63', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936312390361092', '1473936312235171842', 0, '', '27', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313141141506', '1473936313120169985', 0, '', '哥哥', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313145335810', '1473936313120169985', 0, '', '表兄', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313145335811', '1473936313120169985', 0, '', '母亲', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313149530114', '1473936313120169985', 0, '', '侄子', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313149530115', '1473936313120169985', 1, '', '叔叔', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313657040897', '1473936313631875073', 0, '', '36', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313661235202', '1473936313631875073', 0, '', '16', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313661235203', '1473936313631875073', 0, '', '8', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313661235204', '1473936313631875073', 0, '', '32', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313661235205', '1473936313631875073', 1, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313661235206', '1473936313631875073', 0, '', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313665429506', '1473936313631875073', 0, '', '4', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313665429507', '1473936313631875073', 0, '', '19', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936313665429508', '1473936313631875073', 0, '', '10', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314097442818', '1473936314080665601', 0, '', '渔夫', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314101637121', '1473936314080665601', 0, '', '鳍', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314105831426', '1473936314080665601', 0, '', '大海', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314105831427', '1473936314080665601', 1, '', '鱼', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314105831428', '1473936314080665601', 0, '', '鳃', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314474930178', '1473936314462347265', 0, '', '25.6米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314479124482', '1473936314462347265', 0, '', '64.4米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314479124483', '1473936314462347265', 1, '', '51.2米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314479124484', '1473936314462347265', 0, '', '36米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314479124485', '1473936314462347265', 0, '', '76.2米', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314848223234', '1473936314835640322', 0, '', '钟', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314852417537', '1473936314835640322', 0, '', '秒', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314852417538', '1473936314835640322', 0, '', '日', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314852417539', '1473936314835640322', 1, '', '分', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936314852417540', '1473936314835640322', 0, '', '月', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315221516290', '1473936315204739074', 0, '', '12', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315221516291', '1473936315204739074', 0, '', '20', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315221516292', '1473936315204739074', 0, '', '10', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315221516293', '1473936315204739074', 0, '', '8', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315221516294', '1473936315204739074', 1, '', '16', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315578032129', '1473936315561254914', 1, '', '哈尔滨', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315578032130', '1473936315561254914', 0, '', '南昌', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315578032131', '1473936315561254914', 0, '', '郑州', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315578032132', '1473936315561254914', 0, '', '西安', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315578032133', '1473936315561254914', 0, '', '昆明', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315896799233', '1473936315888410626', 0, '', '40%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315896799234', '1473936315888410626', 1, '', '25% ', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315896799235', '1473936315888410626', 0, '', '35%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315896799236', '1473936315888410626', 0, '', '20%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936315900993538', '1473936315888410626', 0, '', '30%', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316211372033', '1473936316202983425', 0, '', '9', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316215566337', '1473936316202983425', 0, '', '7', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316215566338', '1473936316202983425', 0, '', '13', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316215566339', '1473936316202983425', 0, '', '5', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316215566340', '1473936316202983425', 1, '', '11', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316534333441', '1473936316525944833', 0, '', '重庆', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316538527746', '1473936316525944833', 1, '', '香港', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316538527747', '1473936316525944833', 0, '', '珠海', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316538527748', '1473936316525944833', 1, '', '澳门', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316869877761', '1473936316857294850', 1, '', '辽宁省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316869877762', '1473936316857294850', 1, '', '吉林省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316869877763', '1473936316857294850', 1, '', '黑龙江省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936316869877764', '1473936316857294850', 0, '', '河北省', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936317171867650', '1473936317159284738', 0, '', '错误', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936317171867651', '1473936317159284738', 1, '', '正确', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936317440303106', '1473936317431914497', 0, '', '错误', '');
INSERT INTO `el_qu_answer` (`id`, `qu_id`, `is_right`, `image`, `content`, `analysis`) VALUES ('1473936317440303107', '1473936317431914497', 1, '', '正确', '');
COMMIT;

-- ----------------------------
-- Table structure for el_qu_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_qu_repo`;
CREATE TABLE `el_qu_repo` (
  `id` varchar(64) NOT NULL,
  `qu_id` varchar(64) NOT NULL COMMENT '试题',
  `repo_id` varchar(64) NOT NULL COMMENT '归属题库',
  `qu_type` int NOT NULL DEFAULT '0' COMMENT '题目类型',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试题题库';

-- ----------------------------
-- Records of el_qu_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917208915591170', '1286863891812405250', '1265561101609795585', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917208940756993', '1286863586148306945', '1265561101609795585', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917208957534209', '1286862562465501185', '1265561101609795585', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209184026625', '1286856270095142913', '1265561101609795585', 1, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209213386754', '1286856130881998850', '1265561101609795585', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209234358274', '1286855888933572610', '1265561101609795585', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209255329794', '1286855625946517506', '1265561101609795585', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209284689922', '1286855293522759681', '1265561101609795585', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209305661441', '1286854982146019329', '1265561101609795585', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209330827266', '1286854691942125570', '1265561101609795585', 1, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209355993090', '1286854455957999617', '1265561101609795585', 1, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209381158913', '1286854225275473921', '1265561101609795585', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209406324738', '1286853998313295874', '1265561101609795585', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209431490561', '1286853734541905921', '1265561101609795585', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209452462081', '1286853481637957634', '1265561101609795585', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209473433601', '1286853276834287617', '1265561101609795585', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209502793729', '1286853081350361089', '1265561101609795585', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209519570946', '1286852847618576385', '1265561101609795585', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209540542465', '1286852596111331329', '1265561101609795585', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209565708290', '1286852328741228545', '1265561101609795585', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209586679809', '1286852069432578050', '1265561101609795585', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209607651329', '1286851474533470209', '1265561101609795585', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1286917209628622850', '1286851033166860289', '1265561101609795585', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732611425910786', '1288732611354607618', '1265561101609795585', 4, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732739364765698', '1288732739331211266', '1265561101609795585', 4, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732806037422082', '1288732805995479041', '1265561101609795585', 4, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732889676038145', '1288732889634095105', '1265561101609795585', 4, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1288732994294562818', '1288732994244231169', '1265561101609795585', 4, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289451760421343234', '1289451350763671554', '1289451674266144770', 1, 1);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289452450967359489', '1289452449356746754', '1289451674266144770', 1, 2);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289453571878326274', '1289453570242547714', '1289451674266144770', 1, 3);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289454236239302658', '1289454234880348161', '1289451674266144770', 4, 4);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289458747573964801', '1289458693232562177', '1289451674266144770', 1, 5);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289459007058776066', '1289459005381054465', '1289451674266144770', 1, 6);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289459196683259906', '1289459195177504769', '1289451674266144770', 1, 7);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289459624795869185', '1289459623126536193', '1289451674266144770', 1, 8);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289474376330809345', '1289474314263498754', '1289451674266144770', 1, 9);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289474557273083905', '1289474556119650305', '1289451674266144770', 4, 10);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1289475133708865537', '1289475132563820546', '1289451674266144770', 4, 11);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293151273635561474', '1293150420467990530', '1265561101609795585', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293317368904454145', '1293317368443080706', '1265561101609795585', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293318286790103041', '1293318285368233985', '1265561101609795585', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293318979924037633', '1293318978334396418', '1265561101609795585', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293319052326113281', '1293319052204478465', '1265561101609795585', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293321638768840706', '1293321638676566017', '1265561101609795585', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293324967540461570', '1293324967427215362', '1265561101609795585', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1293338978639941633', '1293338978321174529', '1265561101609795585', 2, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1302610176209121282', '1289475783523995650', '1265561101609795585', 4, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1304704900306857985', '1304704900113920001', '1265561101609795585', 4, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1316945876914327553', '1289471729733373953', '1289451674266144770', 1, 12);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1316945963988078594', '1289471480130342913', '1289451674266144770', 1, 13);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1316946023257788418', '1289471133567586305', '1289451674266144770', 1, 14);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127299303936001', '1289473900633821186', '1265561101609795585', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127879761956865', '1289473577370423297', '1265561101609795585', 3, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880076529666', '1289473379982282753', '1265561101609795585', 3, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880294633473', '1289473193486749697', '1265561101609795585', 3, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880567263233', '1289472863202086914', '1265561101609795585', 3, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880776978434', '1289453247356637186', '1265561101609795585', 3, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127880932167681', '1288732225914847234', '1265561101609795585', 3, 45);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950331121666', '1293347439817908225', '1265561101609795585', 2, 46);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950532448257', '1289458348364304385', '1265561101609795585', 2, 47);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950679248898', '1289452973904793602', '1265561101609795585', 2, 48);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127950838632449', '1288733204697628674', '1265561101609795585', 2, 49);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1318127951035764737', '1288731653644009473', '1265561101609795585', 2, 50);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416772810498049', '1356416772491730946', '1265561101609795585', 1, 51);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416773137653762', '1356416773066350594', '1265561101609795585', 1, 52);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416773603221505', '1356416773519335426', '1265561101609795585', 1, 53);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416773829713921', '1356416773770993666', '1265561101609795585', 1, 54);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774068789250', '1356416774014263298', '1265561101609795585', 1, 55);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774303670274', '1356416774240755713', '1265561101609795585', 1, 56);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774580494337', '1356416774530162690', '1265561101609795585', 1, 57);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416774844735489', '1356416774790209538', '1265561101609795585', 1, 58);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775125753857', '1356416775046062082', '1265561101609795585', 1, 59);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775360634881', '1356416775306108929', '1265561101609795585', 1, 60);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775561961473', '1356416775520018433', '1265561101609795585', 1, 61);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775729733633', '1356416775700373505', '1265561101609795585', 1, 62);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416775918477314', '1356416775889117185', '1265561101609795585', 1, 63);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776082055170', '1356416776048500737', '1265561101609795585', 1, 64);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776237244418', '1356416776199495682', '1265561101609795585', 1, 65);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776413405186', '1356416776375656450', '1265561101609795585', 1, 66);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776652480513', '1356416776602148865', '1265561101609795585', 1, 67);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416776937693185', '1356416776883167233', '1265561101609795585', 1, 68);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416777193545730', '1356416777151602690', '1265561101609795585', 1, 69);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416777482952705', '1356416777449398274', '1265561101609795585', 1, 70);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416777772359681', '1356416777713639425', '1265561101609795585', 1, 71);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778086932481', '1356416778040795137', '1265561101609795585', 1, 72);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778405699586', '1356416778346979329', '1265561101609795585', 1, 73);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778615414785', '1356416778586054658', '1265561101609795585', 1, 74);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416778829324289', '1356416778787381249', '1265561101609795585', 1, 75);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779034845186', '1356416779009679362', '1265561101609795585', 1, 76);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779219394561', '1356416779190034434', '1265561101609795585', 1, 77);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779529773058', '1356416779492024321', '1265561101609795585', 1, 78);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779731099649', '1356416779705933825', '1265561101609795585', 1, 79);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416779890483201', '1356416779865317378', '1265561101609795585', 1, 80);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780041478145', '1356416780016312322', '1265561101609795585', 1, 81);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780280553474', '1356416780242804738', '1265561101609795585', 1, 82);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780502851585', '1356416780469297153', '1265561101609795585', 1, 83);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780716761089', '1356416780687400962', '1265561101609795585', 2, 84);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416780947447809', '1356416780918087682', '1265561101609795585', 3, 85);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781182328834', '1356416781152968706', '1265561101609795585', 2, 86);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781350100993', '1356416781329129473', '1289451674266144770', 1, 15);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781404626946', '1356416781383655426', '1289451674266144770', 1, 16);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781484318722', '1356416781438181378', '1265561101609795585', 2, 87);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781639507969', '1356416781622730754', '1265561101609795585', 3, 88);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781782114306', '1356416781761142785', '1289451674266144770', 1, 17);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781845028866', '1356416781824057346', '1265561101609795585', 2, 89);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416781996023809', '1356416781975052290', '1289451674266144770', 1, 18);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782084104193', '1356416782046355458', '1289451674266144770', 1, 19);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782147018753', '1356416782126047233', '1289451674266144770', 1, 20);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782230904834', '1356416782201544706', '1289451674266144770', 1, 21);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782314790913', '1356416782285430786', '1289451674266144770', 1, 22);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782411259906', '1356416782365122561', '1289451674266144770', 1, 23);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782511923202', '1356416782478368769', '1289451674266144770', 1, 24);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782600003585', '1356416782570643458', '1265561101609795585', 3, 90);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416782847467521', '1356416782805524482', '1265561101609795585', 3, 91);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783157846018', '1356416783124291586', '1265561101609795585', 3, 92);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783413698561', '1356416783384338434', '1265561101609795585', 3, 93);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783648579585', '1356416783615025154', '1265561101609795585', 1, 94);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356416783912820738', '1356416783879266305', '1265561101609795585', 2, 95);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417334901796865', '1356417334570446849', '1265561101609795585', 1, 96);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417335518359554', '1356417335409307650', '1265561101609795585', 1, 97);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417336101367810', '1356417336055230465', '1265561101609795585', 1, 98);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417336508215298', '1356417336420134913', '1265561101609795585', 1, 99);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417336990560257', '1356417336927645698', '1265561101609795585', 1, 100);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417408000126978', '1356417407920435201', '1265561101609795585', 1, 101);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417408453111810', '1356417408386002946', '1265561101609795585', 1, 102);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417408826404866', '1356417408780267522', '1265561101609795585', 1, 103);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417409220669442', '1356417409178726401', '1265561101609795585', 1, 104);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417409522659330', '1356417409480716289', '1265561101609795585', 1, 105);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417409900146690', '1356417409845620737', '1265561101609795585', 1, 106);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417410298605569', '1356417410260856833', '1265561101609795585', 1, 107);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417410701258753', '1356417410621566978', '1265561101609795585', 1, 108);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417411024220162', '1356417410982277122', '1265561101609795585', 1, 109);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417411414290434', '1356417411372347394', '1265561101609795585', 1, 110);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417411770806273', '1356417411728863233', '1265561101609795585', 1, 111);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417412093767681', '1356417412060213250', '1265561101609795585', 1, 112);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417412416729089', '1356417412374786049', '1265561101609795585', 1, 113);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417412722913281', '1356417412680970242', '1265561101609795585', 1, 114);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413016514562', '1356417412987154434', '1265561101609795585', 1, 115);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413284950018', '1356417413234618370', '1265561101609795585', 1, 116);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413570162690', '1356417413536608257', '1265561101609795585', 1, 117);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417413826015233', '1356417413796655105', '1265561101609795585', 1, 118);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414052507649', '1356417414027341825', '1265561101609795585', 1, 119);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414299971585', '1356417414279000066', '1265561101609795585', 1, 120);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414534852610', '1356417414505492482', '1265561101609795585', 1, 121);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417414807482369', '1356417414769733633', '1265561101609795585', 1, 122);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415101083649', '1356417415059140609', '1265561101609795585', 1, 123);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415398879234', '1356417415369519106', '1265561101609795585', 1, 124);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415671508994', '1356417415625371649', '1265561101609795585', 1, 125);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417415914778626', '1356417415885418498', '1265561101609795585', 1, 126);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416141271042', '1356417416111910913', '1265561101609795585', 1, 127);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416388734977', '1356417416363569154', '1265561101609795585', 1, 128);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416648781825', '1356417416619421697', '1265561101609795585', 1, 129);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417416892051457', '1356417416871079938', '1265561101609795585', 1, 130);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417122738177', '1356417417097572354', '1265561101609795585', 1, 131);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417391173633', '1356417417361813505', '1265561101609795585', 1, 132);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417667997697', '1356417417630248961', '1265561101609795585', 1, 133);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417417944821762', '1356417417915461633', '1265561101609795585', 2, 134);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417418246811649', '1356417418217451521', '1265561101609795585', 3, 135);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417418582355969', '1356417418552995842', '1265561101609795585', 2, 136);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417418913705986', '1356417418871762946', '1289451674266144770', 1, 25);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419014369282', '1356417418985009154', '1289451674266144770', 1, 26);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419173752833', '1356417419110838274', '1265561101609795585', 2, 137);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419551240194', '1356417419505102850', '1265561101609795585', 3, 138);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417419970670593', '1356417419945504769', '1289451674266144770', 1, 27);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420100694018', '1356417420054556674', '1265561101609795585', 2, 139);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420402683905', '1356417420373323778', '1289451674266144770', 1, 28);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420520124417', '1356417420486569985', '1289451674266144770', 1, 29);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420604010497', '1356417420583038978', '1289451674266144770', 1, 30);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420704673794', '1356417420675313665', '1289451674266144770', 1, 31);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420801142785', '1356417420771782657', '1289451674266144770', 1, 32);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417420910194689', '1356417420872445954', '1289451674266144770', 1, 33);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421019246593', '1356417420994080769', '1289451674266144770', 1, 34);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421128298497', '1356417421094744065', '1265561101609795585', 3, 140);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421384151041', '1356417421367373826', '1265561101609795585', 3, 141);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417421681946626', '1356417421656780802', '1265561101609795585', 3, 142);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417422009102338', '1356417421983936513', '1265561101609795585', 3, 143);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417422269149186', '1356417422239789058', '1265561101609795585', 1, 144);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356417422541778945', '1356417422516613121', '1265561101609795585', 2, 145);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418022063009793', '1356418022004289538', '1265561101609795585', 1, 146);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418022377582594', '1356418022348222465', '1265561101609795585', 1, 147);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418022683766786', '1356418022658600961', '1265561101609795585', 1, 148);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418023031894017', '1356418022998339585', '1265561101609795585', 1, 149);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418023321300994', '1356418023291940865', '1265561101609795585', 1, 150);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418114866180097', '1356418114824237058', '1265561101609795585', 1, 151);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418115231084545', '1356418115201724418', '1265561101609795585', 1, 152);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418115549851650', '1356418115516297218', '1265561101609795585', 1, 153);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418115872813058', '1356418115830870018', '1265561101609795585', 1, 154);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418116162220033', '1356418116137054209', '1265561101609795585', 1, 155);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418116443238402', '1356418116409683970', '1265561101609795585', 1, 156);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418116749422593', '1356418116715868162', '1265561101609795585', 1, 157);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117084966914', '1356418117055606786', '1265561101609795585', 1, 158);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117361790977', '1356418117332430850', '1265561101609795585', 1, 159);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117630226433', '1356418117600866306', '1265561101609795585', 1, 160);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418117902856194', '1356418117877690369', '1265561101609795585', 1, 161);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418118183874561', '1356418118158708737', '1265561101609795585', 1, 162);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418118511030273', '1356418118481670145', '1265561101609795585', 1, 163);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418118821408769', '1356418118796242946', '1265561101609795585', 1, 164);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119094038529', '1356418119068872705', '1265561101609795585', 1, 165);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119354085377', '1356418119333113857', '1265561101609795585', 1, 166);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119639298050', '1356418119618326530', '1265561101609795585', 1, 167);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418119903539201', '1356418119878373378', '1265561101609795585', 1, 168);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120146808833', '1356418120125837313', '1265561101609795585', 1, 169);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120398467074', '1356418120381689858', '1265561101609795585', 1, 170);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120658513921', '1356418120637542401', '1265561101609795585', 1, 171);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418120977281025', '1356418120943726594', '1265561101609795585', 1, 172);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418121296048130', '1356418121241522177', '1265561101609795585', 1, 173);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418121639981057', '1356418121610620930', '1265561101609795585', 1, 174);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418121925193729', '1356418121908416514', '1265561101609795585', 1, 175);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418122239766529', '1356418122206212097', '1265561101609795585', 1, 176);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418122541756418', '1356418122516590594', '1265561101609795585', 1, 177);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418122868912130', '1356418122843746305', '1265561101609795585', 1, 178);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123175096321', '1356418123145736194', '1265561101609795585', 1, 179);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123456114689', '1356418123439337473', '1265561101609795585', 1, 180);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123741327361', '1356418123720355841', '1265561101609795585', 1, 181);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418123997179905', '1356418123980402689', '1265561101609795585', 1, 182);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418124282392577', '1356418124248838145', '1265561101609795585', 1, 183);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418124563410946', '1356418124546633730', '1265561101609795585', 2, 184);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418124827652097', '1356418124815069186', '1265561101609795585', 3, 185);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125125447681', '1356418125096087554', '1265561101609795585', 2, 186);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125440020482', '1356418125423243265', '1289451674266144770', 1, 35);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125515517954', '1356418125494546434', '1289451674266144770', 1, 36);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125599404034', '1356418125574238209', '1265561101609795585', 2, 187);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418125876228098', '1356418125859450881', '1265561101609795585', 3, 188);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126161440769', '1356418126140469250', '1289451674266144770', 1, 37);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126236938241', '1356418126220161026', '1265561101609795585', 2, 189);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126530539522', '1356418126513762306', '1289451674266144770', 1, 38);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126606036994', '1356418126589259777', '1289451674266144770', 1, 39);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126685728770', '1356418126668951554', '1289451674266144770', 1, 40);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126769614850', '1356418126752837633', '1289451674266144770', 1, 41);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126853500930', '1356418126832529410', '1289451674266144770', 1, 42);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418126945775618', '1356418126924804097', '1289451674266144770', 1, 43);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127029661698', '1356418127012884482', '1289451674266144770', 1, 44);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127142907905', '1356418127121936385', '1265561101609795585', 3, 190);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127428120578', '1356418127411343361', '1265561101609795585', 3, 191);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418127704944642', '1356418127688167426', '1265561101609795585', 3, 192);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418128040488962', '1356418128019517442', '1265561101609795585', 3, 193);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418128359256066', '1356418128329895937', '1265561101609795585', 1, 194);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356418128849989634', '1356418128829018114', '1265561101609795585', 2, 195);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424089304039425', '1286859710305226754', '1265561101609795585', 1, 196);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424089849298945', '1286859363650195458', '1265561101609795585', 1, 197);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424090415529985', '1286859119977910274', '1265561101609795585', 1, 198);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424091002732545', '1286858826460516353', '1265561101609795585', 1, 199);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424091942256641', '1286858556779352066', '1265561101609795585', 1, 200);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424092911140865', '1286857269660700674', '1265561101609795585', 1, 201);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424093372514305', '1286856991045668865', '1265561101609795585', 1, 202);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424093720641537', '1286856786200055810', '1265561101609795585', 1, 203);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1356424094295261186', '1286856503755624449', '1265561101609795585', 1, 204);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1451088692063010817', '1286860480865980417', '1265561101609795585', 1, 205);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461505492458270722', '1461505492353413121', '1265561101609795585', 2, 206);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461505751213273090', '1461505751183912961', '1265561101609795585', 2, 207);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461505894167736321', '1461505894142570497', '1265561101609795585', 3, 208);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1461506029002027009', '1461506028981055490', '1265561101609795585', 3, 209);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936312486830082', '1473936312235171842', '1265561101609795585', 1, 210);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936313170501634', '1473936313120169985', '1265561101609795585', 1, 211);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936313703178242', '1473936313631875073', '1265561101609795585', 1, 212);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936314126802945', '1473936314080665601', '1265561101609795585', 1, 213);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936314495901697', '1473936314462347265', '1265561101609795585', 1, 214);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936314869194754', '1473936314835640322', '1265561101609795585', 1, 215);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936315238293506', '1473936315204739074', '1265561101609795585', 1, 216);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936315590615041', '1473936315561254914', '1265561101609795585', 1, 217);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936315913576450', '1473936315888410626', '1265561101609795585', 1, 218);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936316228149249', '1473936316202983425', '1265561101609795585', 1, 219);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936316551110657', '1473936316525944833', '1265561101609795585', 2, 220);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936316886654978', '1473936316857294850', '1265561101609795585', 2, 221);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936317184450562', '1473936317159284738', '1265561101609795585', 3, 222);
INSERT INTO `el_qu_repo` (`id`, `qu_id`, `repo_id`, `qu_type`, `sort`) VALUES ('1473936317448691713', '1473936317431914497', '1265561101609795585', 3, 223);
COMMIT;

-- ----------------------------
-- Table structure for el_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_repo`;
CREATE TABLE `el_repo` (
  `id` varchar(64) NOT NULL COMMENT '题库ID',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '题库编号',
  `title` varchar(255) NOT NULL COMMENT '题库名称',
  `radio_count` int NOT NULL DEFAULT '0' COMMENT '单选数量',
  `multi_count` int NOT NULL DEFAULT '0' COMMENT '多选数量',
  `judge_count` int NOT NULL DEFAULT '0' COMMENT '判断数量',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题库备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='题库';

-- ----------------------------
-- Records of el_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_repo` (`id`, `code`, `title`, `radio_count`, `multi_count`, `judge_count`, `remark`, `create_time`, `update_time`) VALUES ('1265561101609795585', '新人入职培训题库', '演示题库', 163, 25, 28, '此题库为演示题库', '2020-05-27 16:30:54', '2020-05-27 16:30:54');
COMMIT;

-- ----------------------------
-- Table structure for el_user_book
-- ----------------------------
DROP TABLE IF EXISTS `el_user_book`;
CREATE TABLE `el_user_book` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `qu_id` varchar(64) NOT NULL COMMENT '题目ID',
  `create_time` datetime DEFAULT NULL COMMENT '加入时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近错误时间',
  `wrong_count` int NOT NULL COMMENT '错误时间',
  `title` varchar(1000) NOT NULL COMMENT '题目标题',
  `sort` int NOT NULL COMMENT '错题序号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `sort` (`sort`),
  KEY `exam_id` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='错题本';

-- ----------------------------
-- Records of el_user_book
-- ----------------------------
BEGIN;
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854537142273', '1356425140212076545', '10001', '1286856503755624449', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', 1);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854566502401', '1356425140212076545', '10001', '1286857269660700674', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '五个答案中哪个是最好的类比？皮对于树相当于鳞对于', 2);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854600056834', '1356425140212076545', '10001', '1286856991045668865', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 5, '找出下列数字中多余的一个：', 3);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854633611266', '1356425140212076545', '10001', '1286859363650195458', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 5, '找出与众不同的一个：', 4);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854662971393', '1356425140212076545', '10001', '1286859119977910274', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 4, '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', 5);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854700720130', '1356425140212076545', '10001', '1286858826460516353', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 5, '角对于元相当于小时对于', 6);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1356433854746857474', '1356425140212076545', '10001', '1286858556779352066', '2021-02-02 10:46:47', '2021-02-02 10:46:47', 3, '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', 7);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1451071866911580161', '1356425140212076545', '10001', '1286859710305226754', '2021-10-21 14:24:27', '2021-10-21 14:24:27', 3, '图中阴影部分占面积百分之几？', 8);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1451071866953523201', '1356425140212076545', '10001', '1286856786200055810', '2021-10-21 14:24:27', '2021-10-21 14:24:27', 4, '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', 9);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1451071866987077633', '1356425140212076545', '10001', '1286860480865980417', '2021-10-21 14:24:27', '2021-10-21 14:24:27', 3, '数数有多少个三角形', 10);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950365450241', '1356425140212076545', '1252125239901696002', '1286859710305226754', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '图中阴影部分占面积百分之几？', 1);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950394810369', '1356425140212076545', '1252125239901696002', '1286856503755624449', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', 2);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950419976194', '1356425140212076545', '1252125239901696002', '1286858556779352066', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', 3);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950440947714', '1356425140212076545', '1252125239901696002', '1286856786200055810', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', 4);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950461919233', '1356425140212076545', '1252125239901696002', '1286857269660700674', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '五个答案中哪个是最好的类比？皮对于树相当于鳞对于', 5);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950491279361', '1356425140212076545', '1252125239901696002', '1286858826460516353', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '角对于元相当于小时对于', 6);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950524833793', '1356425140212076545', '1252125239901696002', '1286859119977910274', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', 7);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950549999618', '1356425140212076545', '1252125239901696002', '1286859363650195458', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '找出与众不同的一个：', 8);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950570971138', '1356425140212076545', '1252125239901696002', '1286856991045668865', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 2, '找出下列数字中多余的一个：', 9);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461504950596136962', '1356425140212076545', '1252125239901696002', '1286860480865980417', '2021-11-19 09:21:48', '2021-11-19 09:21:48', 1, '数数有多少个三角形', 10);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461506451158724609', '1356425140212076545', '1252125239901696002', '1461505751183912961', '2021-11-19 09:27:46', '2021-11-19 09:27:46', 1, '中国东北三省是指（）', 11);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461506451175501826', '1356425140212076545', '1252125239901696002', '1461505492353413121', '2021-11-19 09:27:46', '2021-11-19 09:27:46', 1, '以下哪些是中国的特别行政区？', 12);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1461506451192279042', '1356425140212076545', '1252125239901696002', '1461505894142570497', '2021-11-19 09:27:46', '2021-11-19 09:27:46', 1, '咖啡的故乡是非洲吗？', 13);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144377499649', '1473853659363196929', '10001', '1286859363650195458', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '找出与众不同的一个：', 1);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144402665474', '1473853659363196929', '10001', '1286858826460516353', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '角对于元相当于小时对于', 2);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144427831297', '1473853659363196929', '10001', '1286859119977910274', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', 3);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144461385729', '1473853659363196929', '10001', '1286860480865980417', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '数数有多少个三角形', 4);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144503328770', '1473853659363196929', '10001', '1286856503755624449', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', 5);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144549466113', '1473853659363196929', '10001', '1461505492353413121', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '以下哪些是中国的特别行政区？', 6);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144591409154', '1473853659363196929', '10001', '1461505751183912961', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '中国东北三省是指（）', 7);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144834678785', '1473853659363196929', '10001', '1461505894142570497', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '咖啡的故乡是非洲吗？', 8);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855144872427522', '1473853659363196929', '10001', '1461506028981055490', '2021-12-23 11:17:04', '2021-12-23 11:17:04', 1, '世界上最长的山脉安第斯山脉', 9);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855808243548162', '1473855268990271490', '10001', '1286858826460516353', '2021-12-23 11:19:42', '2021-12-23 11:19:42', 1, '角对于元相当于小时对于', 1);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855808260325377', '1473855268990271490', '10001', '1286856786200055810', '2021-12-23 11:19:42', '2021-12-23 11:19:42', 1, '五个答案中哪个是最好的类比？女儿对于父亲相当于侄女对于', 2);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855808277102594', '1473855268990271490', '10001', '1286859363650195458', '2021-12-23 11:19:42', '2021-12-23 11:19:42', 1, '找出与众不同的一个：', 3);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855808293879810', '1473855268990271490', '10001', '1286856503755624449', '2021-12-23 11:19:42', '2021-12-23 11:19:42', 1, '汉期、赛斯、麦克、约翰逊共买苹果144个。汉期买的苹果比赛斯多10个，比麦克多26个，比约翰逊多32个。汉期买了多少个苹果？', 4);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855808314851330', '1473855268990271490', '10001', '1286859119977910274', '2021-12-23 11:19:42', '2021-12-23 11:19:42', 1, '如果把这个大立方体的六个面全部涂上黑色，然后按图中虚线把它切成36个小方块，两面有黑色的小方块有多少个？', 5);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855808335822849', '1473855268990271490', '10001', '1461505492353413121', '2021-12-23 11:19:42', '2021-12-23 11:19:42', 1, '以下哪些是中国的特别行政区？', 6);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1473855808356794369', '1473855268990271490', '10001', '1461505751183912961', '2021-12-23 11:19:42', '2021-12-23 11:19:42', 1, '中国东北三省是指（）', 7);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1474205874246512642', '1356425140212076545', '10001', '1473936313631875073', '2021-12-24 10:30:44', '2021-12-24 10:30:44', 1, '找出下列数字中多余的一个：', 11);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1474205874431062017', '1356425140212076545', '10001', '1473936314462347265', '2021-12-24 10:30:45', '2021-12-24 10:30:45', 1, '火车守车(车尾)长6.4米。机车的长度等于守车的长加上半节车厢的长。车厢长度等于守车长加上机车长。火车的机车、车厢、守车共长多少米？', 12);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1474205874489782273', '1356425140212076545', '10001', '1461505492353413121', '2021-12-24 10:30:45', '2021-12-24 10:30:45', 1, '以下哪些是中国的特别行政区？', 13);
INSERT INTO `el_user_book` (`id`, `exam_id`, `user_id`, `qu_id`, `create_time`, `update_time`, `wrong_count`, `title`, `sort`) VALUES ('1474205874565279746', '1356425140212076545', '10001', '1473936316857294850', '2021-12-24 10:30:45', '2021-12-24 10:30:45', 1, '中国东北三省是指（）', 14);
COMMIT;

-- ----------------------------
-- Table structure for el_user_exam
-- ----------------------------
DROP TABLE IF EXISTS `el_user_exam`;
CREATE TABLE `el_user_exam` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `exam_id` varchar(32) NOT NULL COMMENT '考试ID',
  `try_count` int NOT NULL DEFAULT '1' COMMENT '考试次数',
  `max_score` int NOT NULL DEFAULT '0' COMMENT '最高分数',
  `passed` tinyint NOT NULL DEFAULT '0' COMMENT '是否通过',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='考试记录';

-- ----------------------------
-- Records of el_user_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1356433854360981505', '10001', '1356425140212076545', 5, 30, 0, '2021-02-02 10:46:47', '2021-12-24 10:30:44');
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1461504950206066690', '1252125239901696002', '1356425140212076545', 2, 10, 0, '2021-11-19 09:21:48', '2021-11-19 09:27:46');
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1473855144230699009', '10001', '1473853659363196929', 1, 0, 0, '2021-12-23 11:17:04', '2021-12-23 11:17:04');
INSERT INTO `el_user_exam` (`id`, `user_id`, `exam_id`, `try_count`, `max_score`, `passed`, `create_time`, `update_time`) VALUES ('1473855808201605121', '10001', '1473855268990271490', 1, 0, 0, '2021-12-23 11:19:42', '2021-12-23 11:19:42');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `site_name` varchar(255) DEFAULT NULL COMMENT '系统名称',
  `front_logo` varchar(255) DEFAULT NULL COMMENT '前端LOGO',
  `back_logo` varchar(255) DEFAULT NULL COMMENT '后台LOGO',
  `copy_right` varchar(255) DEFAULT NULL COMMENT '版权信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT '' COMMENT '修改人',
  `data_flag` int DEFAULT '0' COMMENT '数据标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统设置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `site_name`, `front_logo`, `back_logo`, `copy_right`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1', '云帆考试系统', NULL, 'https://cdn.yfhl.net/yfhl/120*120.png', '&copy;北京云帆互联科技有限公司', '2020-12-03 16:51:30', '2020-12-03 16:51:30', '', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `dept_type` int NOT NULL DEFAULT '1' COMMENT '1公司2部门',
  `parent_id` varchar(32) NOT NULL COMMENT '所属上级',
  `dept_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `dept_code` varchar(255) NOT NULL DEFAULT '' COMMENT '部门编码',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门信息';

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
BEGIN;
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302853644578000898', 1, '0', '北京云帆互联科技有限公司', 'A01', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302855940200284161', 1, '1302855776496599041', '后端组', 'A01A01A01', 2);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302855994843676674', 1, '1302855776496599041', '前端组', 'A01A01A02', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856017283203073', 1, '1302855776496599041', '产品组', 'A01A01A03', 3);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856084475953154', 1, '1302855776496599041', '测试组', 'A01A01A05', 5);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856266567467010', 1, '1302855896415944705', '客户一组', 'A01A05A01', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1302856320602685442', 1, '1302855896415944705', '客服二组', 'A01A05A02', 2);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1318103313740320770', 1, '1302853644578000898', '技术部', 'A01A01', 1);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1318103339229106178', 1, '1302853644578000898', '人事部', 'A01A02', 2);
INSERT INTO `sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `sort`) VALUES ('1318103362494910465', 1, '1302853644578000898', '财务部', 'A01A03', 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `role_name`) VALUES ('sa', '超级管理员');
INSERT INTO `sys_role` (`id`, `role_name`) VALUES ('student', '学员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐',
  `role_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '角色列表',
  `depart_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `state` int NOT NULL DEFAULT '0' COMMENT '状态',
  `data_flag` int NOT NULL DEFAULT '0' COMMENT '0正常,1隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `user_name`, `real_name`, `password`, `salt`, `role_ids`, `depart_id`, `create_time`, `update_time`, `state`, `data_flag`) VALUES ('10001', 'admin', '超管A', '06681cd08837b21adf6b5ef9279d403d', 'XoFFuS', 'sa', '1318103313740320770', '2020-04-20 13:51:03', '2020-04-20 13:51:03', 0, 0);
INSERT INTO `sys_user` (`id`, `user_name`, `real_name`, `password`, `salt`, `role_ids`, `depart_id`, `create_time`, `update_time`, `state`, `data_flag`) VALUES ('1252125239901696002', 'person', '张三', '6dfdd6761a3e8319719f32abb9aeae9c', 'tZCjLq', 'student', '1318103339229106178', '2020-04-20 14:41:35', '2020-04-20 14:41:35', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1318103579445284865', '10001', 'sa');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1318128865264132097', '1252125239901696002', 'student');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1509135230810742786', '1509135230781382658', 'student');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
