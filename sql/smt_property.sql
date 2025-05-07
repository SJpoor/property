/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : smt_property

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 09/03/2025 16:01:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'smt_build', '楼栋信息', NULL, NULL, 'SmtBuild', 'crud', '', 'com.ruoyi.system', 'system', 'build', '楼栋信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'smt_complain', '投诉信息', NULL, NULL, 'SmtComplain', 'crud', '', 'com.ruoyi.system', 'system', 'complain', '投诉信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'smt_fee', '收费信息', NULL, NULL, 'SmtFee', 'crud', '', 'com.ruoyi.system', 'system', 'fee', '收费信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'smt_fee_record', '收费记录', NULL, NULL, 'SmtFeeRecord', 'crud', '', 'com.ruoyi.system', 'system', 'record', '收费记录', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'smt_house', '房屋信息', NULL, NULL, 'SmtHouse', 'crud', '', 'com.ruoyi.system', 'system', 'house', '房屋信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'smt_owner_house', '业主房屋信息', NULL, NULL, 'SmtOwnerHouse', 'crud', '', 'com.ruoyi.system', 'system', 'house', '业主房屋信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'smt_owner_parking_space', '业主车位信息', NULL, NULL, 'SmtOwnerParkingSpace', 'crud', '', 'com.ruoyi.system', 'system', 'space', '业主车位信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'smt_parking_lot', '停车场信息', NULL, NULL, 'SmtParkingLot', 'crud', '', 'com.ruoyi.system', 'system', 'lot', '停车场信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'smt_parking_rent', '车位租赁信息', NULL, NULL, 'SmtParkingRent', 'crud', '', 'com.ruoyi.system', 'system', 'rent', '车位租赁信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'smt_parking_rent_record', '车位租赁记录', NULL, NULL, 'SmtParkingRentRecord', 'crud', '', 'com.ruoyi.system', 'system', 'record', '车位租赁记录', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'smt_parking_space', '车位信息', NULL, NULL, 'SmtParkingSpace', 'crud', '', 'com.ruoyi.system', 'system', 'space', '车位信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'smt_repair', '维修信息', NULL, NULL, 'SmtRepair', 'crud', '', 'com.ruoyi.system', 'system', 'repair', '维修信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 'smt_unit', '单元信息', NULL, NULL, 'SmtUnit', 'crud', '', 'com.ruoyi.system', 'system', 'unit', '单元信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-23 12:58:34', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'smt_owner', '业主', NULL, NULL, 'SmtOwner', 'crud', '', 'com.ruoyi.system', 'system', 'owner', '业主', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-26 18:00:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (16, 'sys_attr', '附件表', NULL, NULL, 'SysAttr', 'crud', '', 'com.ruoyi.system', 'system', 'attr', '附件', 'ruoyi', '0', '/', NULL, 'admin', '2025-02-27 02:52:03', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (17, 'smt_parking_space_record', '车位使用信息', NULL, NULL, 'SmtParkingSpaceRecord', 'crud', '', 'com.ruoyi.system', 'system', 'record', '车位使用信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-03-02 18:52:05', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (18, 'smt_fee_list', '费用清单', NULL, NULL, 'SmtFeeList', 'crud', '', 'com.ruoyi.system', 'system', 'list', '费用清单', 'ruoyi', '0', '/', NULL, 'admin', '2025-03-09 02:01:55', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'build_id', '楼栋id', 'bigint', 'Long', 'buildId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'build_name', '楼栋名称', 'varchar(30)', 'String', 'buildName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'build_type', '楼栋类型(数据字典:build_type 1:电梯房 2:普通房)', 'char(1)', 'String', 'buildType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 2, 'complain_id', '投诉id', 'bigint', 'Long', 'complainId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 2, 'title', '标题', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 2, 'content', '内容', 'varchar(500)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 2, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, 2, 'status', '状态（0未处理 1已处理）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 2, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, 3, 'fee_id', '收费id', 'bigint', 'Long', 'feeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, 3, 'fee_type', '租赁类型(数据字典:fee_type)', 'char(1)', 'String', 'feeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, 3, 'unit', '单位(数据字典:fee_unit)', 'char(1)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, 3, 'num', '数量', 'int', 'Long', 'num', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, 3, 'amount', '租金', 'decimal(30,0)', 'Long', 'amount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, 3, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, 3, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, 3, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, 3, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 4, 'fee_record_id', '收费记录id', 'bigint', 'Long', 'feeRecordId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 4, 'fee_id', '收费id', 'bigint', 'Long', 'feeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 4, 'owner_id', '业主id', 'bigint', 'Long', 'ownerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 4, 'amount', '费用', 'decimal(30,0)', 'Long', 'amount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 4, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 4, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 4, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 4, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, 5, 'house_id', '房屋id', 'bigint', 'Long', 'houseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, 5, 'build_id', '楼栋id', 'bigint', 'Long', 'buildId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, 5, 'unit_id', '单元id', 'bigint', 'Long', 'unitId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, 5, 'house_no', '房屋编号', 'varchar(30)', 'String', 'houseNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, 5, 'house_area', '房屋面积', 'decimal(20,4)', 'BigDecimal', 'houseArea', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, 5, 'house_type', '户型(数据字典:house_type)', 'char(1)', 'String', 'houseType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, 5, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, 5, 'use_status', '使用状态(数据字典:house_use_status)', 'char(1)', 'String', 'useStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, 5, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, 5, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, 5, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, 6, 'owner_house_id', '业主房屋id', 'bigint', 'Long', 'ownerHouseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 6, 'owner_id', '业主id', 'bigint', 'Long', 'ownerId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 6, 'house_id', '房屋id', 'bigint', 'Long', 'houseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 6, 'house_no', '房屋编号', 'varchar(30)', 'String', 'houseNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 6, 'house_area', '房屋面积', 'decimal(20,4)', 'BigDecimal', 'houseArea', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 6, 'house_type', '户型(数据字典:house_type)', 'char(1)', 'String', 'houseType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 6, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 6, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 6, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 6, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, 7, 'owner_house_id', '业主车位id', 'bigint', 'Long', 'ownerHouseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, 7, 'parking_space_id', '车位id', 'bigint', 'Long', 'parkingSpaceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, 7, 'plate_no', '车牌号', 'varchar(30)', 'String', 'plateNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, 7, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, 7, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 7, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, 7, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, 8, 'parking_lot_id', '停车场id', 'bigint', 'Long', 'parkingLotId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, 8, 'parking_lot_name', '停车场名称', 'varchar(30)', 'String', 'parkingLotName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, 8, 'total_space', '车位总数', 'decimal(10,2)', 'BigDecimal', 'totalSpace', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-23 12:58:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, 8, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, 8, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, 8, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, 8, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, 9, 'parking_rent_id', '车位租赁id', 'bigint', 'Long', 'parkingRentId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, 9, 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, 9, 'end_time', '结束时间', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, 9, 'rent_amount', '租金', 'decimal(30,0)', 'Long', 'rentAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, 9, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, 9, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, 9, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, 9, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, 9, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, 10, 'parking_rent_record_id', '车位租赁记录id', 'bigint', 'Long', 'parkingRentRecordId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, 10, 'parking_rent_id', '车位租赁id', 'bigint', 'Long', 'parkingRentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, 10, 'owner_id', '业主id', 'bigint', 'Long', 'ownerId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, 10, 'rent_days', '租赁天数', 'int', 'Long', 'rentDays', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, 10, 'rent_price', '租赁单价', 'decimal(10,2)', 'BigDecimal', 'rentPrice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, 10, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, 10, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, 10, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, 10, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, 10, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, 10, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, 11, 'parking_space_id', '车位id', 'bigint', 'Long', 'parkingSpaceId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, 11, 'parking_space_no', '车位编号', 'varchar(30)', 'String', 'parkingSpaceNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, 11, 'parking_space_status', '车位状态', 'char(1)', 'String', 'parkingSpaceStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, 11, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, 11, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, 11, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, 11, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, 11, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, 11, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, 11, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, 12, 'repair_id', '维修id', 'bigint', 'Long', 'repairId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, 12, 'title', '标题', 'varchar(50)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, 12, 'content', '内容', 'varchar(500)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, 12, 'address', '地址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, 12, 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, 12, 'status', '状态（0未处理 1已处理）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, 12, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, 12, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, 12, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, 12, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, 12, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, 12, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, 13, 'unit_id', '单元id', 'bigint', 'Long', 'unitId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, 13, 'build_id', '楼栋id', 'bigint', 'Long', 'buildId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, 13, 'unit_name', '单元名称', 'varchar(30)', 'String', 'unitName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, 13, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, 13, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, 13, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, 13, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, 13, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, 13, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, 13, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, 13, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-02-23 12:58:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (172, 15, 'owner_id', '业主ID', 'bigint', 'Long', 'ownerId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (173, 15, 'owner_name', '业主姓名', 'varchar(30)', 'String', 'ownerName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (174, 15, 'email', '业主邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (175, 15, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (176, 15, 'sex', '业主性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (177, 15, 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (178, 15, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (179, 15, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (180, 15, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (181, 15, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (182, 15, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (183, 15, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (184, 15, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2025-02-26 18:00:01', '', '2025-02-26 18:01:56');
INSERT INTO `gen_table_column` VALUES (185, 16, 'attr_id', '附件ID', 'bigint', 'Long', 'attrId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (186, 16, 'biz_id', '业务id', 'bigint', 'Long', 'bizId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (187, 16, 'attr_name', '附件原名称', 'varchar(30)', 'String', 'attrName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (188, 16, 'attr_new_name', '附件新名称', 'varchar(30)', 'String', 'attrNewName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (189, 16, 'attr_url', '附件地址', 'varchar(255)', 'String', 'attrUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (190, 16, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (191, 16, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (192, 16, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (193, 16, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (194, 16, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (195, 16, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (196, 16, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2025-02-27 02:52:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (197, 17, 'parking_record_id', '业主车位id', 'bigint', 'Long', 'parkingRecordId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (198, 17, 'parking_space_id', '车位id', 'bigint', 'Long', 'parkingSpaceId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (199, 17, 'owner_id', '业主id', 'bigint', 'Long', 'ownerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (200, 17, 'plate_no', '车牌号', 'varchar(30)', 'String', 'plateNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (201, 17, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (202, 17, 'drive_in_time', '驶入时间', 'datetime', 'Date', 'driveInTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (203, 17, 'drive_out_time', '驶出时间', 'datetime', 'Date', 'driveOutTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (204, 17, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (205, 17, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (206, 17, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (207, 17, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (208, 17, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (209, 17, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (210, 17, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-03-02 18:52:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (211, 18, 'fee_list_id', '收费记录id', 'bigint', 'Long', 'feeListId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (212, 18, 'fee_id', '收费id', 'bigint', 'Long', 'feeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (213, 18, 'owner_id', '业主id', 'bigint', 'Long', 'ownerId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (214, 18, 'title', '费用标题', 'varchar(10)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (215, 18, 'amount', '费用', 'decimal(30,0)', 'Long', 'amount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (216, 18, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (217, 18, 'pay_status', '状态（0未缴费 1已缴费）', 'char(1)', 'String', 'payStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (218, 18, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (219, 18, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (220, 18, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (221, 18, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (222, 18, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (223, 18, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');
INSERT INTO `gen_table_column` VALUES (224, 18, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2025-03-09 02:01:55', '', '2025-03-09 02:02:40');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for smt_build
-- ----------------------------
DROP TABLE IF EXISTS `smt_build`;
CREATE TABLE `smt_build`  (
  `build_id` bigint NOT NULL AUTO_INCREMENT COMMENT '楼栋id',
  `build_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '楼栋名称',
  `build_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '楼栋类型(数据字典:build_type 1:电梯房 2:普通房)',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`build_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '楼栋信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_build
-- ----------------------------
INSERT INTO `smt_build` VALUES (1, 'A栋', '1', 1, '0', NULL, '0', '', '2025-03-08 19:10:10', '', NULL);
INSERT INTO `smt_build` VALUES (2, 'B栋', '2', 2, '0', NULL, '0', '', '2025-03-08 19:10:36', '', NULL);
INSERT INTO `smt_build` VALUES (3, 'C栋', '1', 3, '0', NULL, '0', '', '2025-03-08 19:10:45', '', NULL);
INSERT INTO `smt_build` VALUES (4, 'D栋', '2', 4, '0', NULL, '0', '', '2025-03-08 19:10:57', '', NULL);

-- ----------------------------
-- Table structure for smt_complain
-- ----------------------------
DROP TABLE IF EXISTS `smt_complain`;
CREATE TABLE `smt_complain`  (
  `complain_id` bigint NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0未处理 1已处理）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`complain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投诉信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_complain
-- ----------------------------

-- ----------------------------
-- Table structure for smt_fee
-- ----------------------------
DROP TABLE IF EXISTS `smt_fee`;
CREATE TABLE `smt_fee`  (
  `fee_id` bigint NOT NULL AUTO_INCREMENT COMMENT '收费id',
  `fee_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收费名称',
  `fee_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租赁类型(数据字典:fee_type)',
  `unit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位(数据字典:fee_unit)',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `price` decimal(30, 0) NULL DEFAULT NULL COMMENT '单价',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`fee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收费信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_fee
-- ----------------------------
INSERT INTO `smt_fee` VALUES (1, '水费', '2', '1', 1, 5, 0, '0', NULL, '0', '', '2025-03-08 19:47:52', '', NULL);
INSERT INTO `smt_fee` VALUES (2, '电费', '1', '2', 1, 1, 0, '0', NULL, '0', '', '2025-03-08 19:48:05', '', NULL);
INSERT INTO `smt_fee` VALUES (3, '停车费', '3', '4', 1, 5, 0, '0', NULL, '0', '', '2025-03-08 19:48:25', '', NULL);
INSERT INTO `smt_fee` VALUES (4, '车位租赁费', '4', '3', 1, 30, 0, '0', NULL, '0', '', '2025-03-08 19:48:49', '', NULL);

-- ----------------------------
-- Table structure for smt_fee_list
-- ----------------------------
DROP TABLE IF EXISTS `smt_fee_list`;
CREATE TABLE `smt_fee_list`  (
  `fee_list_id` bigint NOT NULL AUTO_INCREMENT COMMENT '收费记录id',
  `fee_id` bigint NOT NULL COMMENT '收费id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '费用标题',
  `amount` decimal(30, 0) NULL DEFAULT NULL COMMENT '费用',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `pay_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0未缴费 1已缴费）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`fee_list_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '费用清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_fee_list
-- ----------------------------
INSERT INTO `smt_fee_list` VALUES (1, 3, 2, '【车位：F0002的停车费】', 0, 0, '1', '0', NULL, '0', 'admin', '2025-03-09 16:00:13', 'ry', NULL);

-- ----------------------------
-- Table structure for smt_fee_record
-- ----------------------------
DROP TABLE IF EXISTS `smt_fee_record`;
CREATE TABLE `smt_fee_record`  (
  `fee_record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '收费记录id',
  `fee_id` bigint NOT NULL COMMENT '收费id',
  `month` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属月份',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `amount` decimal(30, 0) NULL DEFAULT NULL COMMENT '费用',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `display` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表显',
  `fee_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0未缴费 1已缴费）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`fee_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收费记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_fee_record
-- ----------------------------

-- ----------------------------
-- Table structure for smt_house
-- ----------------------------
DROP TABLE IF EXISTS `smt_house`;
CREATE TABLE `smt_house`  (
  `house_id` bigint NOT NULL AUTO_INCREMENT COMMENT '房屋id',
  `build_id` bigint NOT NULL COMMENT '楼栋id',
  `unit_id` bigint NOT NULL COMMENT '单元id',
  `house_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '房屋编号',
  `house_area` decimal(20, 4) NULL DEFAULT NULL COMMENT '房屋面积',
  `house_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '户型(数据字典:house_type)',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `use_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '使用状态(数据字典:house_use_status)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`house_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房屋信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_house
-- ----------------------------
INSERT INTO `smt_house` VALUES (1, 1, 1, 'A-101', 110.0000, '3', 0, '0', '0', NULL, '0', '', '2025-03-08 19:30:33', '', NULL);
INSERT INTO `smt_house` VALUES (2, 1, 2, 'A-202', 120.0000, '4', 0, '0', '0', NULL, '0', '', '2025-03-08 19:30:54', '', NULL);
INSERT INTO `smt_house` VALUES (3, 2, 3, 'B-101', 120.0000, '4', 0, '0', '0', NULL, '0', '', '2025-03-08 19:31:10', '', NULL);
INSERT INTO `smt_house` VALUES (4, 3, 4, 'C-101', 140.0000, '4', 0, '0', '0', NULL, '0', '', '2025-03-08 19:31:26', '', NULL);
INSERT INTO `smt_house` VALUES (5, 4, 5, 'D-101', 130.0000, '3', 0, '0', '0', NULL, '0', '', '2025-03-08 19:31:41', '', NULL);

-- ----------------------------
-- Table structure for smt_owner
-- ----------------------------
DROP TABLE IF EXISTS `smt_owner`;
CREATE TABLE `smt_owner`  (
  `owner_id` bigint NOT NULL AUTO_INCREMENT COMMENT '业主ID',
  `owner_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业主姓名',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '业主邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '业主性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`owner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业主' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_owner
-- ----------------------------

-- ----------------------------
-- Table structure for smt_owner_house
-- ----------------------------
DROP TABLE IF EXISTS `smt_owner_house`;
CREATE TABLE `smt_owner_house`  (
  `owner_house_id` bigint NOT NULL AUTO_INCREMENT COMMENT '业主房屋id',
  `owner_id` bigint NOT NULL COMMENT '业主id',
  `house_id` bigint NOT NULL COMMENT '房屋id',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`owner_house_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业主房屋信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_owner_house
-- ----------------------------
INSERT INTO `smt_owner_house` VALUES (1, 2, 1, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_house` VALUES (2, 2, 3, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_house` VALUES (3, 2, 4, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_house` VALUES (4, 100, 2, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_house` VALUES (5, 100, 5, 0, '0', NULL, '0', '', NULL, '', NULL);

-- ----------------------------
-- Table structure for smt_owner_parking_space
-- ----------------------------
DROP TABLE IF EXISTS `smt_owner_parking_space`;
CREATE TABLE `smt_owner_parking_space`  (
  `owner_parking_id` bigint NOT NULL AUTO_INCREMENT COMMENT '业主车位id',
  `parking_space_id` bigint NOT NULL COMMENT '车位id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`owner_parking_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业主车位信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_owner_parking_space
-- ----------------------------
INSERT INTO `smt_owner_parking_space` VALUES (1, 1, 100, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_parking_space` VALUES (2, 7, 100, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_parking_space` VALUES (3, 13, 100, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_parking_space` VALUES (4, 2, 2, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_parking_space` VALUES (5, 8, 2, 0, '0', NULL, '0', '', NULL, '', NULL);
INSERT INTO `smt_owner_parking_space` VALUES (6, 15, 2, 0, '0', NULL, '0', '', NULL, '', NULL);

-- ----------------------------
-- Table structure for smt_parking_lot
-- ----------------------------
DROP TABLE IF EXISTS `smt_parking_lot`;
CREATE TABLE `smt_parking_lot`  (
  `parking_lot_id` bigint NOT NULL AUTO_INCREMENT COMMENT '停车场id',
  `parking_lot_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '停车场名称',
  `parking_lot_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '停车场类型(数据字典:parking_lot_type)',
  `total_space` int NULL DEFAULT NULL COMMENT '车位总数',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`parking_lot_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '停车场信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_parking_lot
-- ----------------------------
INSERT INTO `smt_parking_lot` VALUES (1, 'A-B01', '2', 500, 0, '0', NULL, '0', '', '2025-03-08 19:33:38', '', NULL);
INSERT INTO `smt_parking_lot` VALUES (2, 'A-C01', '2', 600, 0, '0', NULL, '0', '', '2025-03-08 19:33:54', '', NULL);
INSERT INTO `smt_parking_lot` VALUES (3, 'B-A01', '1', 450, 0, '0', NULL, '0', '', '2025-03-08 19:34:12', '', NULL);
INSERT INTO `smt_parking_lot` VALUES (4, 'C-A01', '1', 360, 0, '0', NULL, '0', '', '2025-03-08 19:34:24', '', NULL);

-- ----------------------------
-- Table structure for smt_parking_rent
-- ----------------------------
DROP TABLE IF EXISTS `smt_parking_rent`;
CREATE TABLE `smt_parking_rent`  (
  `parking_rent_id` bigint NOT NULL AUTO_INCREMENT COMMENT '车位租赁id',
  `parking_space_id` bigint NULL DEFAULT NULL COMMENT '车位id',
  `fee_id` bigint NULL DEFAULT NULL COMMENT '费用id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `rent_amount` decimal(30, 0) NULL DEFAULT NULL COMMENT '租金',
  `fee_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否生成费用(0:否 1是)',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`parking_rent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位租赁信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_parking_rent
-- ----------------------------

-- ----------------------------
-- Table structure for smt_parking_rent_record
-- ----------------------------
DROP TABLE IF EXISTS `smt_parking_rent_record`;
CREATE TABLE `smt_parking_rent_record`  (
  `parking_rent_record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '车位租赁记录id',
  `parking_rent_id` bigint NULL DEFAULT NULL COMMENT '车位租赁id',
  `owner_id` bigint NOT NULL COMMENT '业主id',
  `rent_days` int NULL DEFAULT NULL COMMENT '租赁天数',
  `rent_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '租赁单价',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`parking_rent_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位租赁记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_parking_rent_record
-- ----------------------------

-- ----------------------------
-- Table structure for smt_parking_space
-- ----------------------------
DROP TABLE IF EXISTS `smt_parking_space`;
CREATE TABLE `smt_parking_space`  (
  `parking_space_id` bigint NOT NULL AUTO_INCREMENT COMMENT '车位id',
  `parking_space_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车位编号',
  `parking_space_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '车位类型(数据字典:parking_space_type)',
  `parking_space_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '车位状态(0:空闲 1:占用)',
  `parking_lot_id` int NULL DEFAULT NULL COMMENT '停车场id',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0空闲 1占用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`parking_space_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_parking_space
-- ----------------------------
INSERT INTO `smt_parking_space` VALUES (1, 'F0001', '1', '0', 1, 0, '0', NULL, '0', '', '2025-03-08 19:36:16', '', NULL);
INSERT INTO `smt_parking_space` VALUES (2, 'F0002', '1', '0', 1, 0, '0', NULL, '0', '', '2025-03-08 19:36:29', '', NULL);
INSERT INTO `smt_parking_space` VALUES (3, 'F0003', '1', '0', 1, 0, '0', NULL, '0', '', '2025-03-08 19:36:38', '', NULL);
INSERT INTO `smt_parking_space` VALUES (4, 'X0001', '0', '0', 1, 0, '0', NULL, '0', '', '2025-03-08 19:37:40', '', NULL);
INSERT INTO `smt_parking_space` VALUES (5, 'X0002', '0', '0', 1, 0, '0', NULL, '0', '', '2025-03-08 19:37:49', '', NULL);
INSERT INTO `smt_parking_space` VALUES (6, 'X0003', '0', '0', 1, 0, '0', NULL, '0', '', '2025-03-08 19:37:58', '', NULL);
INSERT INTO `smt_parking_space` VALUES (7, 'F0001', '1', '0', 2, 0, '0', NULL, '0', '', '2025-03-08 19:38:08', '', NULL);
INSERT INTO `smt_parking_space` VALUES (8, 'F0002', '1', '0', 2, 0, '0', NULL, '0', '', '2025-03-08 19:38:18', '', NULL);
INSERT INTO `smt_parking_space` VALUES (9, 'F0003', '1', '0', 2, 0, '0', NULL, '0', '', '2025-03-08 19:38:27', '', NULL);
INSERT INTO `smt_parking_space` VALUES (10, 'X0001', '0', '0', 2, 0, '0', NULL, '0', '', '2025-03-08 19:38:40', '', NULL);
INSERT INTO `smt_parking_space` VALUES (11, 'X0002', '0', '0', 2, 0, '0', NULL, '0', '', '2025-03-08 19:38:48', '', NULL);
INSERT INTO `smt_parking_space` VALUES (12, 'X0003', '0', '0', 2, 0, '0', NULL, '0', '', '2025-03-08 19:38:57', '', NULL);
INSERT INTO `smt_parking_space` VALUES (13, 'F0001', '1', '0', 3, 0, '0', NULL, '0', '', '2025-03-08 19:39:06', '', NULL);
INSERT INTO `smt_parking_space` VALUES (14, 'F0002', '1', '0', 3, 0, '0', NULL, '0', '', '2025-03-08 19:39:15', '', NULL);
INSERT INTO `smt_parking_space` VALUES (15, 'F0003', '1', '0', 3, 0, '0', NULL, '0', '', '2025-03-08 19:39:23', '', NULL);
INSERT INTO `smt_parking_space` VALUES (16, 'X0001', '0', '0', 3, 0, '0', NULL, '0', '', '2025-03-08 19:39:30', '', NULL);
INSERT INTO `smt_parking_space` VALUES (17, 'X0002', '0', '0', 3, 0, '0', NULL, '0', '', '2025-03-08 19:39:39', '', NULL);
INSERT INTO `smt_parking_space` VALUES (18, 'X0003', '0', '0', 3, 0, '0', NULL, '0', '', '2025-03-08 19:39:48', '', NULL);
INSERT INTO `smt_parking_space` VALUES (19, 'F0001', '1', '0', 4, 0, '0', NULL, '0', '', '2025-03-08 19:39:58', '', NULL);
INSERT INTO `smt_parking_space` VALUES (20, 'F0002', '1', '0', 4, 0, '0', NULL, '0', '', '2025-03-08 19:40:06', '', NULL);
INSERT INTO `smt_parking_space` VALUES (21, '1111', '0', '0', 1, 0, '0', NULL, '0', '', '2025-03-09 13:40:15', '', NULL);

-- ----------------------------
-- Table structure for smt_parking_space_record
-- ----------------------------
DROP TABLE IF EXISTS `smt_parking_space_record`;
CREATE TABLE `smt_parking_space_record`  (
  `parking_record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '业主车位id',
  `parking_space_id` bigint NOT NULL COMMENT '车位id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `plate_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌号',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `drive_in_time` datetime NULL DEFAULT NULL COMMENT '驶入时间',
  `drive_out_time` datetime NULL DEFAULT NULL COMMENT '驶出时间',
  `fee_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否生成费用（0否 1是）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`parking_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位使用信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_parking_space_record
-- ----------------------------

-- ----------------------------
-- Table structure for smt_repair
-- ----------------------------
DROP TABLE IF EXISTS `smt_repair`;
CREATE TABLE `smt_repair`  (
  `repair_id` bigint NOT NULL AUTO_INCREMENT COMMENT '维修id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0未处理 1已处理）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '维修信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_repair
-- ----------------------------

-- ----------------------------
-- Table structure for smt_unit
-- ----------------------------
DROP TABLE IF EXISTS `smt_unit`;
CREATE TABLE `smt_unit`  (
  `unit_id` bigint NOT NULL AUTO_INCREMENT COMMENT '单元id',
  `build_id` bigint NOT NULL COMMENT '楼栋id',
  `unit_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '单元名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '单元信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smt_unit
-- ----------------------------
INSERT INTO `smt_unit` VALUES (1, 1, '一单元', 1, '0', '0', NULL, '', '2025-03-08 19:11:20', '', NULL);
INSERT INTO `smt_unit` VALUES (2, 1, '二单元', 2, '0', '0', NULL, '', '2025-03-08 19:11:27', '', NULL);
INSERT INTO `smt_unit` VALUES (3, 2, '一单元', 3, '0', '0', NULL, '', '2025-03-08 19:11:44', '', NULL);
INSERT INTO `smt_unit` VALUES (4, 3, '一单元', 1, '0', '0', NULL, '', '2025-03-08 19:11:57', '', NULL);
INSERT INTO `smt_unit` VALUES (5, 4, '一单元', 1, '0', '0', NULL, '', '2025-03-08 19:12:10', '', NULL);

-- ----------------------------
-- Table structure for sys_attr
-- ----------------------------
DROP TABLE IF EXISTS `sys_attr`;
CREATE TABLE `sys_attr`  (
  `attr_id` bigint NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `biz_id` bigint NULL DEFAULT NULL COMMENT '业务id',
  `attr_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件原名称',
  `attr_new_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '附件新名称',
  `attr_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '附件地址',
  `attr_text` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件文本',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`attr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_attr
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-02-23 00:49:58', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-02-23 00:49:58', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-02-23 00:49:58', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-02-23 00:49:58', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-02-23 00:49:58', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-02-23 00:49:58', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '电梯房', '1', 'build_type', NULL, 'default', 'N', '0', 'admin', '2025-02-23 18:54:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '普通房', '2', 'build_type', NULL, 'default', 'N', '0', 'admin', '2025-02-23 18:54:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, '吨', '1', 'fee_unit', NULL, 'default', 'N', '0', 'admin', '2025-02-23 19:06:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '度', '2', 'fee_unit', NULL, 'default', 'N', '0', 'admin', '2025-02-23 19:07:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '天', '3', 'fee_unit', NULL, 'default', 'N', '0', 'admin', '2025-02-23 19:07:30', 'admin', '2025-02-27 04:44:23', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '一居室', '1', 'house_type', NULL, 'default', 'N', '0', 'admin', '2025-02-23 20:27:01', '', NULL, '一居室');
INSERT INTO `sys_dict_data` VALUES (106, 2, '两居室', '2', 'house_type', NULL, 'default', 'N', '0', 'admin', '2025-02-23 20:27:25', '', NULL, '两居室');
INSERT INTO `sys_dict_data` VALUES (107, 3, '三居室', '3', 'house_type', NULL, 'default', 'N', '0', 'admin', '2025-02-23 20:27:38', '', NULL, '三居室');
INSERT INTO `sys_dict_data` VALUES (108, 4, '四居室及以上', '4', 'house_type', NULL, 'default', 'N', '0', 'admin', '2025-02-23 20:27:53', '', NULL, '四居室及以上');
INSERT INTO `sys_dict_data` VALUES (109, 1, '电费', '1', 'fee_type', NULL, 'default', 'N', '0', 'admin', '2025-02-24 19:53:32', '', NULL, '电费');
INSERT INTO `sys_dict_data` VALUES (110, 2, '水费', '2', 'fee_type', NULL, 'default', 'N', '0', 'admin', '2025-02-24 19:53:51', '', NULL, '水费');
INSERT INTO `sys_dict_data` VALUES (111, 3, '停车费', '3', 'fee_type', NULL, 'default', 'N', '0', 'admin', '2025-02-24 19:54:13', '', NULL, '停车费');
INSERT INTO `sys_dict_data` VALUES (112, 1, '未使用', '0', 'house_use_status', NULL, 'default', 'N', '0', 'admin', '2025-02-25 08:31:16', '', NULL, '未使用');
INSERT INTO `sys_dict_data` VALUES (113, 1, '已使用', '1', 'house_use_status', NULL, 'default', 'N', '0', 'admin', '2025-02-25 08:31:52', '', NULL, '已使用');
INSERT INTO `sys_dict_data` VALUES (114, 1, '地上', '1', 'parking_lot_type', NULL, 'default', 'N', '0', 'admin', '2025-02-25 08:41:26', '', NULL, '地上');
INSERT INTO `sys_dict_data` VALUES (115, 2, '地下', '2', 'parking_lot_type', NULL, 'default', 'N', '0', 'admin', '2025-02-25 08:41:37', '', NULL, '地下');
INSERT INTO `sys_dict_data` VALUES (116, 1, '未缴费', '0', 'pay_status', NULL, 'default', 'N', '0', 'admin', '2025-03-02 02:38:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 1, '已缴费', '1', 'pay_status', NULL, 'default', 'N', '0', 'admin', '2025-03-02 02:38:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 4, '时', '4', 'fee_unit', NULL, 'default', 'N', '0', 'admin', '2025-03-02 08:29:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 4, '租赁费', '4', 'fee_type', NULL, 'default', 'N', '0', 'admin', '2025-03-06 19:02:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 1, '空闲', '0', 'parking_space_status', NULL, 'default', 'N', '0', 'admin', '2025-03-07 16:23:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 2, '占用', '1', 'parking_space_status', NULL, 'default', 'N', '0', 'admin', '2025-03-07 16:23:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 1, '临时', '0', 'parking_space_type', NULL, 'default', 'N', '0', 'admin', '2025-03-08 00:45:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 2, '固定', '1', 'parking_space_type', NULL, 'default', 'N', '0', 'admin', '2025-03-08 00:45:24', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-02-23 00:49:58', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '楼栋类型', 'build_type', '0', 'admin', '2025-02-23 18:54:10', '', NULL, '楼栋类型');
INSERT INTO `sys_dict_type` VALUES (101, '收费单位', 'fee_unit', '0', 'admin', '2025-02-23 19:01:20', '', NULL, '收费单位');
INSERT INTO `sys_dict_type` VALUES (102, '户型', 'house_type', '0', 'admin', '2025-02-23 20:24:45', '', NULL, '户型');
INSERT INTO `sys_dict_type` VALUES (103, '房屋使用状态', 'house_use_status', '0', 'admin', '2025-02-23 20:33:32', '', NULL, '房屋使用状态');
INSERT INTO `sys_dict_type` VALUES (104, '费用类型', 'fee_type', '0', 'admin', '2025-02-24 19:52:56', '', NULL, '费用类型');
INSERT INTO `sys_dict_type` VALUES (105, '停车场类型', 'parking_lot_type', '0', 'admin', '2025-02-25 08:41:08', '', NULL, '停车场类型');
INSERT INTO `sys_dict_type` VALUES (106, '缴费状态', 'pay_status', '0', 'admin', '2025-03-02 02:37:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '车位状态', 'parking_space_status', '0', 'admin', '2025-03-07 16:22:58', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '车位类型', 'parking_space_type', '0', 'admin', '2025-03-08 00:44:55', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-02-23 00:49:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-02-23 00:49:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-02-23 00:49:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-23 09:38:01');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-23 12:37:17');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-23 16:49:50');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-23 18:53:46');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-23 20:24:19');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-02-24 19:52:29');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-24 19:52:33');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 08:30:41');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-25 22:28:14');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 22:28:17');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-25 23:03:15');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 23:03:19');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-25 23:51:04');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-25 23:51:09');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-26 00:02:11');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 00:02:16');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-26 00:11:26');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 00:11:30');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-26 11:50:57');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 11:51:06');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 12:40:36');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 14:51:45');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 15:46:38');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 16:51:01');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 17:44:19');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-26 20:18:25');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-27 02:48:21');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-27 03:46:39');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-27 03:47:13');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-27 04:41:54');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-27 04:41:58');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-27 05:05:11');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-27 05:05:15');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-27 05:47:54');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-27 05:48:41');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-27 05:48:45');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-01 00:49:17');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-01 22:04:57');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-02 00:01:00');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-02 08:14:31');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-02 18:35:00');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-06 18:57:17');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-07 14:14:51');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-07 15:08:14');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-07 15:08:21');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-07 20:06:04');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-07 20:28:44');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-07 20:38:48');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-07 20:38:55');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-07 20:41:59');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-07 20:42:04');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-08 00:43:41');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-08 09:48:27');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-08 09:53:59');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-08 09:54:05');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-08 19:04:36');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 00:54:28');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 02:24:34');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 02:24:39');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 02:49:27');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 02:49:31');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 03:22:43');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 03:54:26');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 04:45:55');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 04:58:50');
INSERT INTO `sys_logininfor` VALUES (165, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-09 04:58:58');
INSERT INTO `sys_logininfor` VALUES (166, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-09 04:59:19');
INSERT INTO `sys_logininfor` VALUES (167, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 04:59:23');
INSERT INTO `sys_logininfor` VALUES (168, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 05:02:58');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 05:03:02');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 05:05:30');
INSERT INTO `sys_logininfor` VALUES (171, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 05:05:38');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 05:06:05');
INSERT INTO `sys_logininfor` VALUES (173, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 05:07:23');
INSERT INTO `sys_logininfor` VALUES (174, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-09 05:07:31');
INSERT INTO `sys_logininfor` VALUES (175, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 05:07:39');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 08:43:59');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 10:17:55');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 10:18:31');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 10:30:30');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 10:30:33');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 10:38:22');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 10:38:25');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 10:38:30');
INSERT INTO `sys_logininfor` VALUES (184, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 10:38:44');
INSERT INTO `sys_logininfor` VALUES (185, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 11:01:32');
INSERT INTO `sys_logininfor` VALUES (186, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 11:01:38');
INSERT INTO `sys_logininfor` VALUES (187, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 11:01:45');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 11:01:49');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 11:24:13');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 11:24:18');
INSERT INTO `sys_logininfor` VALUES (191, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 11:24:25');
INSERT INTO `sys_logininfor` VALUES (192, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 11:32:37');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 11:32:40');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 11:32:45');
INSERT INTO `sys_logininfor` VALUES (195, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 11:32:54');
INSERT INTO `sys_logininfor` VALUES (196, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 11:52:36');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 11:53:05');
INSERT INTO `sys_logininfor` VALUES (198, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-03-09 12:18:08');
INSERT INTO `sys_logininfor` VALUES (199, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 12:18:15');
INSERT INTO `sys_logininfor` VALUES (200, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 12:22:47');
INSERT INTO `sys_logininfor` VALUES (201, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 12:23:00');
INSERT INTO `sys_logininfor` VALUES (202, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 12:25:12');
INSERT INTO `sys_logininfor` VALUES (203, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 12:25:19');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 12:26:13');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 13:11:14');
INSERT INTO `sys_logininfor` VALUES (206, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 13:12:47');
INSERT INTO `sys_logininfor` VALUES (207, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 13:16:49');
INSERT INTO `sys_logininfor` VALUES (208, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 13:16:59');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 13:36:55');
INSERT INTO `sys_logininfor` VALUES (210, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 13:46:46');
INSERT INTO `sys_logininfor` VALUES (211, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:21:50');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:25:14');
INSERT INTO `sys_logininfor` VALUES (213, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:25:24');
INSERT INTO `sys_logininfor` VALUES (214, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:32:01');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:32:09');
INSERT INTO `sys_logininfor` VALUES (216, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:33:51');
INSERT INTO `sys_logininfor` VALUES (217, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:33:58');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:34:03');
INSERT INTO `sys_logininfor` VALUES (219, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:34:12');
INSERT INTO `sys_logininfor` VALUES (220, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:35:13');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-09 15:35:23');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:35:26');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:35:44');
INSERT INTO `sys_logininfor` VALUES (224, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:35:52');
INSERT INTO `sys_logininfor` VALUES (225, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:35:56');
INSERT INTO `sys_logininfor` VALUES (226, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:36:02');
INSERT INTO `sys_logininfor` VALUES (227, 'owner-test', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:43:22');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:43:34');
INSERT INTO `sys_logininfor` VALUES (229, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-09 15:44:02');
INSERT INTO `sys_logininfor` VALUES (230, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 15:44:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2090 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-02-23 00:49:57', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-02-23 00:49:57', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-02-23 00:49:57', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-02-23 00:49:57', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-02-23 00:49:57', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-02-23 00:49:57', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-02-23 00:49:57', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-02-23 00:49:57', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-02-23 00:49:57', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-02-23 00:49:57', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-02-23 00:49:57', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-02-23 00:49:57', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-02-23 00:49:57', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-02-23 00:49:57', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-02-23 00:49:57', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-02-23 00:49:57', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-02-23 00:49:57', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-02-23 00:49:57', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-02-23 00:49:57', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-02-23 00:49:57', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-02-23 00:49:57', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-02-23 00:49:57', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-02-23 00:49:57', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '房屋管理', 0, 4, 'house', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'tree', 'admin', '2025-02-25 22:30:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '楼栋管理', 2000, 1, 'building', 'smart/build/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:build:list', 'chart', 'admin', '2025-02-25 22:31:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '单元管理', 2000, 2, 'unit', 'smart/unit/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:unit:list', 'component', 'admin', '2025-02-25 22:32:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '房屋列表', 2000, 3, 'house', 'smart/house/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:house:list', 'build', 'admin', '2025-02-25 22:33:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '车位消息管理', 0, 5, 'parkingSpace', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'email', 'admin', '2025-02-25 22:40:48', 'admin', '2025-02-26 12:48:36', '');
INSERT INTO `sys_menu` VALUES (2005, '车位管理', 2004, 1, 'parkingSpace', 'smart/parkingSpace/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:park:space:list', 'build', 'admin', '2025-02-25 22:42:51', 'admin', '2025-02-26 12:48:43', '');
INSERT INTO `sys_menu` VALUES (2006, '车位使用管理', 2004, 2, 'parkingUse', 'smart/parkingSpaceRecord/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:park:space:list', 'excel', 'admin', '2025-02-25 22:44:39', 'admin', '2025-03-07 15:08:04', '');
INSERT INTO `sys_menu` VALUES (2007, '业主房产信息管理', 0, 6, 'ownerHouseManage', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2025-02-25 22:45:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '业主列表', 2007, 1, 'owner', 'smart/owner/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:owner:list', 'nested', 'admin', '2025-02-25 22:46:51', 'admin', '2025-03-07 20:38:42', '');
INSERT INTO `sys_menu` VALUES (2009, '停车位管理', 0, 7, 'parkSpace', NULL, NULL, '', 1, 0, 'M', '1', '1', '', 'lock', 'admin', '2025-02-25 22:47:57', 'admin', '2025-03-08 09:53:39', '');
INSERT INTO `sys_menu` VALUES (2010, '停车位使用情况', 2009, 1, 'parkingSpaceUse', 'smart/ownerParkingSpace/index', NULL, '', 1, 0, 'C', '1', '1', 'smart:owner:park:space:list', 'component', 'admin', '2025-02-25 22:55:32', 'admin', '2025-03-08 09:53:47', '');
INSERT INTO `sys_menu` VALUES (2011, '车位租赁', 2004, 4, 'rent', 'smart/parkingRent/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:park:rent:list', 'edit', 'admin', '2025-02-25 22:56:47', 'admin', '2025-03-08 09:53:26', '');
INSERT INTO `sys_menu` VALUES (2012, '收费管理', 0, 6, 'money', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'money', 'admin', '2025-02-25 22:57:43', 'admin', '2025-02-27 04:41:50', '');
INSERT INTO `sys_menu` VALUES (2013, '费用类型管理', 2012, 1, 'fee', 'smart/fee/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:fee:list', 'user', 'admin', '2025-02-25 22:59:53', 'admin', '2025-03-09 02:49:18', '');
INSERT INTO `sys_menu` VALUES (2014, '维修管理', 0, 9, 'repairList', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'radio', 'admin', '2025-02-25 23:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '维修列表', 2014, 1, 'repair', 'smart/repair/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:repair:list', 'redis', 'admin', '2025-02-25 23:01:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '投诉管理', 0, 10, 'compainManage', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'form', 'admin', '2025-02-25 23:02:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '投诉列表', 2016, 1, 'complain', 'smart/complain/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:complain:list', 'log', 'admin', '2025-02-25 23:02:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '停车场管理', 2004, 0, 'parkingLot', 'smart/parkingLot/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:park:list', 'example', 'admin', '2025-02-26 00:11:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '水电费管理', 2012, 2, 'feeOrder', 'smart/feeRecord/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:fee:record:list', 'number', 'admin', '2025-02-27 05:05:05', 'admin', '2025-03-09 02:23:38', '');
INSERT INTO `sys_menu` VALUES (2020, '查询', 2001, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:build:query', '#', 'admin', '2025-03-02 03:46:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '新增', 2001, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:build:add', '#', 'admin', '2025-03-02 03:47:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '修改', 2001, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:build:edit', '#', 'admin', '2025-03-02 03:47:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '删除', 2001, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:build:remove', '#', 'admin', '2025-03-02 03:47:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '查询', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:unit:query', '#', 'admin', '2025-03-02 03:48:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '新增', 2002, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:unit:add', '#', 'admin', '2025-03-02 03:48:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '修改', 2002, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:unit:edit', '#', 'admin', '2025-03-02 03:48:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '删除', 2002, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:unit:remove', '#', 'admin', '2025-03-02 03:48:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '查询', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:house:query', '#', 'admin', '2025-03-02 03:49:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '新增', 2003, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:house:add', '#', 'admin', '2025-03-02 03:49:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '修改', 2003, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:house:edit', '#', 'admin', '2025-03-02 03:49:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '删除', 2003, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:house:remove', '#', 'admin', '2025-03-02 03:49:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '查询', 2018, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:query', '#', 'admin', '2025-03-02 03:50:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '新增', 2018, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:add', '#', 'admin', '2025-03-02 03:50:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '修改', 2018, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:remove', '#', 'admin', '2025-03-02 03:50:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '删除', 2018, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:remove', '#', 'admin', '2025-03-02 03:51:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '查询', 2005, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:space:query', '#', 'admin', '2025-03-02 03:51:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '新增', 2005, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:space:add', '#', 'admin', '2025-03-02 03:51:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '修改', 2005, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:space:edit', '#', 'admin', '2025-03-02 03:52:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '删除', 2005, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:space:remove', '#', 'admin', '2025-03-02 03:52:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '查询', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:query', '#', 'admin', '2025-03-02 03:52:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '新增', 2006, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:add', '#', 'admin', '2025-03-02 03:52:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '修改', 2006, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:edit', '#', 'admin', '2025-03-02 03:53:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '删除', 2006, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:remove', '#', 'admin', '2025-03-02 03:53:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '查询', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-03-02 03:54:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '新增', 2008, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-03-02 03:54:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '修改', 2008, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-03-02 03:54:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '删除', 2008, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-03-02 03:54:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '重置密码', 2008, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-03-02 03:56:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '分配房屋', 2008, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:assign:house', '#', 'admin', '2025-03-02 03:56:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '分配车位', 2008, 7, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:assign:space', '#', 'admin', '2025-03-02 03:56:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '退房', 2008, 8, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:return:house', '#', 'admin', '2025-03-02 03:57:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '退车位', 2008, 9, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:return:space', '#', 'admin', '2025-03-02 03:57:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '查询', 2013, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:query', '#', 'admin', '2025-03-02 03:57:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '新增', 2013, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:add', '#', 'admin', '2025-03-02 03:58:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '修改', 2013, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:edit', '#', 'admin', '2025-03-02 03:58:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '删除', 2013, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:remove', '#', 'admin', '2025-03-02 03:58:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '查询', 2019, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:record:query', '#', 'admin', '2025-03-02 03:58:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '新增', 2019, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:record:add', '#', 'admin', '2025-03-02 03:59:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '修改', 2019, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:record:edit', '#', 'admin', '2025-03-02 03:59:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '删除', 2019, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:record:remove', '#', 'admin', '2025-03-02 03:59:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '缴费', 2019, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:record:pay', '#', 'admin', '2025-03-02 03:59:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '查询', 2017, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:complain:query', '#', 'admin', '2025-03-02 04:01:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '新增', 2017, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:complain:add', '#', 'admin', '2025-03-02 04:01:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '修改', 2017, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:complain:edit', '#', 'admin', '2025-03-02 04:02:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '删除', 2017, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:complain:remove', '#', 'admin', '2025-03-02 04:02:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '查询', 2015, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:repair:query', '#', 'admin', '2025-03-02 04:02:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '新增', 2015, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:repair:add', '#', 'admin', '2025-03-02 04:02:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '修改', 2015, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:repair:edit', '#', 'admin', '2025-03-02 04:03:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '删除', 2015, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:repair:remove', '#', 'admin', '2025-03-02 04:03:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '查询', 2010, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:query', '#', 'admin', '2025-03-02 04:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '新增', 2010, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:add', '#', 'admin', '2025-03-02 04:04:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '修改', 2010, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:edit', '#', 'admin', '2025-03-02 04:04:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '删除', 2010, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:owner:park:space:remove', '#', 'admin', '2025-03-02 04:04:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '查询', 2011, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:rent:query', '#', 'admin', '2025-03-02 04:04:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '新增', 2011, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:rent:add', '#', 'admin', '2025-03-02 04:05:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '修改', 2011, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:rent:edit', '#', 'admin', '2025-03-02 04:05:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '删除', 2011, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:rent:remove', '#', 'admin', '2025-03-02 04:05:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '费用清单', 2012, 3, 'feeList', 'smart/feeList/index', NULL, '', 1, 0, 'C', '0', '0', 'smart:fee:list:list', 'documentation', 'admin', '2025-03-09 02:24:19', 'admin', '2025-03-09 02:24:27', '');
INSERT INTO `sys_menu` VALUES (2081, '查询', 2080, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:list:query', '#', 'admin', '2025-03-09 05:04:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '新增', 2080, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:list:add', '#', 'admin', '2025-03-09 05:04:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '修改', 2080, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:list:edit', '#', 'admin', '2025-03-09 05:04:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '删除', 2080, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:list:remove', '#', 'admin', '2025-03-09 05:04:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '缴费', 2080, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:fee:list:pay', '#', 'admin', '2025-03-09 05:05:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '用户查询', 2016, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:user:list', '#', 'admin', '2025-03-09 05:07:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '驶入', 2005, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:space:in', '#', 'admin', '2025-03-09 15:08:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '驶出', 2005, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:space:out', '#', 'admin', '2025-03-09 15:08:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '驶出', 2006, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'smart:park:space:record:out', '#', 'admin', '2025-03-09 15:33:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-02-23 00:49:58', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-02-23 00:49:58', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 546 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"smt_owner_parking_space,smt_owner_house,smt_fee,smt_fee_record,smt_build,smt_complain,smt_house,smt_parking_lot,smt_parking_rent,smt_parking_rent_record,smt_parking_space,smt_repair,smt_unit\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 12:58:34', 1161);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"smt_build,smt_complain,smt_fee,smt_fee_record,smt_house,smt_owner_house,smt_owner_parking_space,smt_parking_lot,smt_parking_rent,smt_parking_rent_record,smt_parking_space,smt_repair,smt_unit\"}', NULL, 0, NULL, '2025-02-23 12:58:52', 1725);
INSERT INTO `sys_oper_log` VALUES (102, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"楼栋类型\",\"dictType\":\"build_type\",\"params\":{},\"remark\":\"楼栋类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 18:54:10', 33);
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"电梯房\",\"dictSort\":1,\"dictType\":\"build_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 18:54:35', 29);
INSERT INTO `sys_oper_log` VALUES (104, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"普通房\",\"dictSort\":2,\"dictType\":\"build_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 18:54:49', 20);
INSERT INTO `sys_oper_log` VALUES (105, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"收费单位\",\"dictType\":\"fee_unit\",\"params\":{},\"remark\":\"收费单位\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 19:01:20', 18);
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"吨\",\"dictSort\":1,\"dictType\":\"fee_unit\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 19:06:58', 19);
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"度\",\"dictSort\":2,\"dictType\":\"fee_unit\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 19:07:10', 12);
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"元\",\"dictSort\":3,\"dictType\":\"fee_unit\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 19:07:30', 13);
INSERT INTO `sys_oper_log` VALUES (109, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"户型\",\"dictType\":\"house_type\",\"params\":{},\"remark\":\"户型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 20:24:45', 12);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"一居室\",\"dictSort\":1,\"dictType\":\"house_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"一居室\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 20:27:01', 15);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"两居室\",\"dictSort\":2,\"dictType\":\"house_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"两居室\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 20:27:25', 16);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"三居室\",\"dictSort\":3,\"dictType\":\"house_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"remark\":\"三居室\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 20:27:38', 14);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"四居室及以上\",\"dictSort\":4,\"dictType\":\"house_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"remark\":\"四居室及以上\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 20:27:53', 15);
INSERT INTO `sys_oper_log` VALUES (114, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"房屋使用状态\",\"dictType\":\"house_use_status\",\"params\":{},\"remark\":\"房屋使用状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-23 20:33:32', 12);
INSERT INTO `sys_oper_log` VALUES (115, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"费用类型\",\"dictType\":\"fee_type\",\"params\":{},\"remark\":\"费用类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 19:52:56', 28);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"电费\",\"dictSort\":1,\"dictType\":\"fee_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"电费\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 19:53:32', 15);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"水费\",\"dictSort\":2,\"dictType\":\"fee_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"水费\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 19:53:51', 13);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"停车费\",\"dictSort\":3,\"dictType\":\"fee_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"remark\":\"停车费\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-24 19:54:13', 16);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未使用\",\"dictSort\":1,\"dictType\":\"house_use_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"未使用\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 08:31:16', 26);
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已使用\",\"dictSort\":1,\"dictType\":\"house_use_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"已使用\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 08:31:53', 16);
INSERT INTO `sys_oper_log` VALUES (121, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"停车场类型\",\"dictType\":\"parking_lot_type\",\"params\":{},\"remark\":\"停车场类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 08:41:08', 24);
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"地上\",\"dictSort\":1,\"dictType\":\"parking_lot_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"地上\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 08:41:26', 25);
INSERT INTO `sys_oper_log` VALUES (123, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"地下\",\"dictSort\":2,\"dictType\":\"parking_lot_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"地下\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 08:41:37', 15);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房屋管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"house\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:30:10', 34);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/build/index\",\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"楼栋管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"building\",\"perms\":\"smart:build:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:31:35', 15);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/unit/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"单元管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"unit\",\"perms\":\"smart:unit:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:32:30', 23);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/house/index\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房屋列表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"house\",\"perms\":\"smart:house:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:33:12', 16);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"车位消息管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"parkingSpace\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:40:48', 23);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingSpace/index\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"车位列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"parkSpace\",\"perms\":\"smart:park:space:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:42:51', 26);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/ownerParkingSpace/index\",\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"车位使用情况\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"parkingUse\",\"perms\":\"smart:owner:park:space\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:44:39', 20);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业主房产信息管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"ownerHouseManage\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:45:51', 14);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/ownerHouse/index\",\"createBy\":\"admin\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业主房屋列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"ownerHouse\",\"perms\":\"smart:owner:house\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:46:51', 11);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"lock\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"停车位管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"parkSpace\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:47:57', 10);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/ownerParkingSpace/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"停车位使用情况\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"path\":\"parkingSpaceUse\",\"perms\":\"smart:owner:park:space:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:55:32', 11);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingRent/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"车位租赁\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"rent\",\"perms\":\"smart:park:rent:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:56:47', 12);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"收费管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"money\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:57:43', 9);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/fee/index\",\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"费用列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"feeList\",\"perms\":\"smart:fee:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 22:59:53', 23);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"radio\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"维修管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"repairList\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:00:53', 11);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/repair/index\",\"createBy\":\"admin\",\"icon\":\"redis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"维修列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2014,\"path\":\"repair\",\"perms\":\"smart:repair:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:01:35', 16);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"投诉管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"compainManage\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:02:01', 10);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/complain/index\",\"createBy\":\"admin\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"投诉列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"complain\",\"perms\":\"smart:complain:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:02:54', 10);
INSERT INTO `sys_oper_log` VALUES (142, '楼栋信息', 1, 'com.ruoyi.web.controller.smart.SmtBuildController.add()', 'POST', 1, 'admin', '研发部门', '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":1,\"buildName\":\"A栋\",\"buildType\":\"1\",\"createTime\":\"2025-02-25 23:13:49\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:13:50', 542);
INSERT INTO `sys_oper_log` VALUES (143, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtBuildController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/build/changeStatus', '127.0.0.1', '内网IP', '{\"buildId\":1,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:13:55', 13);
INSERT INTO `sys_oper_log` VALUES (144, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtBuildController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/build/changeStatus', '127.0.0.1', '内网IP', '{\"buildId\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:13:56', 7);
INSERT INTO `sys_oper_log` VALUES (145, '楼栋信息', 2, 'com.ruoyi.web.controller.smart.SmtBuildController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":1,\"buildName\":\"A栋\",\"buildType\":\"2\",\"createBy\":\"\",\"createTime\":\"2025-02-25 23:13:50\",\"delFlag\":\"0\",\"orderNum\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-02-25 23:15:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:15:34', 10);
INSERT INTO `sys_oper_log` VALUES (146, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', '研发部门', '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-02-25 23:17:59\",\"orderNum\":1,\"params\":{},\"unitId\":1,\"unitName\":\"一单元\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:17:59', 15);
INSERT INTO `sys_oper_log` VALUES (147, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-02-25 23:32:49\",\"houseArea\":120,\"houseId\":1,\"houseNo\":\"101\",\"params\":{},\"unitId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:32:49', 562);
INSERT INTO `sys_oper_log` VALUES (148, '房屋信息', 2, 'com.ruoyi.web.controller.smart.SmtHouseController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"build\":{\"buildId\":1,\"params\":{}},\"buildId\":1,\"createBy\":\"\",\"createTime\":\"2025-02-25 23:32:49\",\"delFlag\":\"0\",\"houseArea\":120,\"houseId\":1,\"houseNo\":\"101\",\"houseType\":\"4\",\"orderNum\":0,\"params\":{},\"status\":\"0\",\"unit\":{\"buildId\":1,\"params\":{},\"unitId\":1},\"unitId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-02-25 23:34:55\",\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:34:55', 28);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingSpace/index\",\"createTime\":\"2025-02-25 22:42:51\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"车位列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"park\",\"perms\":\"smart:park:space:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-25 23:51:00', 21);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingSpace/index\",\"createTime\":\"2025-02-25 22:42:51\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"车位列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"parkingSpace\",\"perms\":\"smart:park:space:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 00:02:01', 20);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingLot/index\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"停车场管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2004,\"path\":\"parkingLot\",\"perms\":\"smart:park:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 00:11:09', 24);
INSERT INTO `sys_oper_log` VALUES (152, '停车场信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingLotController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 00:13:03\",\"params\":{},\"parkingLotId\":1,\"parkingLotName\":\"A001\",\"parkingLotType\":\"1\",\"totalSpace\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 00:13:03', 17);
INSERT INTO `sys_oper_log` VALUES (153, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 00:42:05\",\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":1,\"parkingSpaceNo\":\"A-1001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 00:42:05', 419);
INSERT INTO `sys_oper_log` VALUES (154, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-02-26 00:51:39', 19);
INSERT INTO `sys_oper_log` VALUES (155, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-02-26 00:54:15', 6);
INSERT INTO `sys_oper_log` VALUES (156, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-02-26 00:54:22', 4);
INSERT INTO `sys_oper_log` VALUES (157, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-02-26 00:54:36', 6);
INSERT INTO `sys_oper_log` VALUES (158, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 00:59:31', 26);
INSERT INTO `sys_oper_log` VALUES (159, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceStatus\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 00:59:35', 11);
INSERT INTO `sys_oper_log` VALUES (160, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 01:14:20\",\"ownerId\":2,\"ownerParkingId\":1,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"闽C8888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 01:14:20', 37);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-25 22:40:48\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"车位管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"parkingSpace\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 12:48:16', 55);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-25 22:40:48\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"车位消息管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"parkingSpace\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 12:48:36', 13);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingSpace/index\",\"createTime\":\"2025-02-25 22:42:51\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"车位管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"parkingSpace\",\"perms\":\"smart:park:space:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 12:48:43', 15);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/ownerParkingSpace/index\",\"createTime\":\"2025-02-25 22:44:39\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"车位使用管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"parkingUse\",\"perms\":\"smart:owner:park:space\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 12:48:49', 20);
INSERT INTO `sys_oper_log` VALUES (165, '业主车位信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.remove()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/park/space/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 16:01:43', 7961);
INSERT INTO `sys_oper_log` VALUES (166, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 16:04:26\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"remark\":\"test\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerParkingSpaceMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_owner_parking_space          ( parking_space_id,              owner_id,                                                                 remark,                                       create_time )           values ( ?,              ?,                                                                 ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\n; Field \'plate_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value', '2025-02-26 16:04:26', 74);
INSERT INTO `sys_oper_log` VALUES (167, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 16:05:41\",\"ownerId\":2,\"ownerParkingId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"闽C8888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 16:05:41', 15);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/owner/index\",\"createTime\":\"2025-02-25 22:46:51\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"业主列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"ownerHouse\",\"perms\":\"smart:owner:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 17:48:54', 38);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"smt_owner\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 17:52:38', 172);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"smt_owner\"}', NULL, 0, NULL, '2025-02-26 17:52:46', 367);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/smt_owner', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 17:57:14', 94);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/smt_owner', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 17:57:16', 90);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"smt_owner\"}', NULL, 0, NULL, '2025-02-26 17:57:17', 153);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 17:59:56', 35);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"smt_owner\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 18:00:01', 91);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/smt_owner', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 18:00:11', 83);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"smt_owner\"}', NULL, 0, NULL, '2025-02-26 18:00:12', 286);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/smt_owner', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 18:01:56', 67);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"smt_owner\"}', NULL, 0, NULL, '2025-02-26 18:01:58', 91);
INSERT INTO `sys_oper_log` VALUES (180, '业主', 1, 'com.ruoyi.web.controller.smart.SmtOwnerController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 18:47:39\",\"email\":\"1111@qq.com\",\"ownerId\":1,\"ownerName\":\"张三\",\"params\":{},\"phonenumber\":\"18912345678\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 18:47:39', 544);
INSERT INTO `sys_oper_log` VALUES (181, '业主管理', 2, 'com.ruoyi.web.controller.smart.SmtOwnerController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/owner/changeStatus', '127.0.0.1', '内网IP', '{\"ownerId\":1,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 18:48:40', 12);
INSERT INTO `sys_oper_log` VALUES (182, '业主管理', 2, 'com.ruoyi.web.controller.smart.SmtOwnerController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/owner/changeStatus', '127.0.0.1', '内网IP', '{\"ownerId\":1,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 18:48:42', 8);
INSERT INTO `sys_oper_log` VALUES (183, '业主房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/house', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 20:23:32\",\"houseId\":1,\"ownerHouseId\":1,\"ownerId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 20:23:32', 31);
INSERT INTO `sys_oper_log` VALUES (184, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 20:36:34\",\"ownerId\":1,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerParkingSpaceMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_owner_parking_space          ( parking_space_id,              owner_id,                                                                                                        create_time )           values ( ?,              ?,                                                                                                        ? )\r\n### Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\n; Field \'plate_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value', '2025-02-26 20:36:34', 76);
INSERT INTO `sys_oper_log` VALUES (185, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 20:36:33\",\"ownerId\":1,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerParkingSpaceMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_owner_parking_space          ( parking_space_id,              owner_id,                                                                                                        create_time )           values ( ?,              ?,                                                                                                        ? )\r\n### Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\n; Field \'plate_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value', '2025-02-26 20:36:34', 687);
INSERT INTO `sys_oper_log` VALUES (186, '业主房屋信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.deleteOwnerHouse()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/house/deleteOwnerHouse', '127.0.0.1', '内网IP', '{\"houseId\":1,\"ownerId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 20:36:58', 23);
INSERT INTO `sys_oper_log` VALUES (187, '业主房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/house', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-26 20:37:03\",\"houseId\":1,\"ownerHouseId\":2,\"ownerId\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-26 20:37:03', 16);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_attr\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 02:52:03', 133);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_attr\"}', NULL, 0, NULL, '2025-02-27 02:52:11', 413);
INSERT INTO `sys_oper_log` VALUES (190, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":4,\"attrName\":\"1.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/02/27/1_20250227032250A001.jpg\",\"params\":{}},\"createTime\":\"2025-02-27 03:23:02\",\"ownerId\":1,\"ownerParkingId\":3,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"闽A8888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 03:23:02', 46);
INSERT INTO `sys_oper_log` VALUES (191, '业主车位信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.deleteOwnerParkingSpace()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/park/space/deleteOwnerParkingSpace', '127.0.0.1', '内网IP', '{\"ownerId\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-02-27 03:23:28', 5);
INSERT INTO `sys_oper_log` VALUES (192, '业主车位信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.deleteOwnerParkingSpace()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/park/space/deleteOwnerParkingSpace', '127.0.0.1', '内网IP', '{\"ownerId\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-02-27 03:29:08', 5);
INSERT INTO `sys_oper_log` VALUES (193, '业主车位信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.deleteOwnerParkingSpace()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/park/space/deleteOwnerParkingSpace', '127.0.0.1', '内网IP', '{\"ownerId\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-02-27 03:29:50', 6);
INSERT INTO `sys_oper_log` VALUES (194, '业主车位信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.deleteOwnerParkingSpace()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/park/space/deleteOwnerParkingSpace', '127.0.0.1', '内网IP', '{\"ownerId\":1,\"params\":{},\"parkingSpaceId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 03:30:37', 11);
INSERT INTO `sys_oper_log` VALUES (195, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":5,\"attrName\":\"1.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/02/27/1_20250227033051A002.jpg\",\"params\":{}},\"createTime\":\"2025-02-27 03:30:52\",\"ownerId\":1,\"ownerParkingId\":4,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"闽A8888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 03:30:52', 13);
INSERT INTO `sys_oper_log` VALUES (196, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 03:41:41', 39);
INSERT INTO `sys_oper_log` VALUES (197, '业主房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/house', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:20:06\",\"houseId\":1,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerHouseMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerHouseMapper.insertSmtOwnerHouse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_owner_house          ( house_id,                                                                              create_time )           values ( ?,                                                                              ? )\r\n### Cause: java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value\n; Field \'owner_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'owner_id\' doesn\'t have a default value', '2025-02-27 04:20:06', 324);
INSERT INTO `sys_oper_log` VALUES (198, '业主房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/house', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:21:24\",\"houseId\":1,\"ownerHouseId\":3,\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:21:24', 9);
INSERT INTO `sys_oper_log` VALUES (199, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:25:02\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerParkingSpaceMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_owner_parking_space          ( parking_space_id,              owner_id,                                                                                                        create_time )           values ( ?,              ?,                                                                                                        ? )\r\n### Cause: java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value\n; Field \'plate_no\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'plate_no\' doesn\'t have a default value', '2025-02-27 04:25:02', 354);
INSERT INTO `sys_oper_log` VALUES (200, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:25:17\",\"ownerId\":2,\"ownerParkingId\":5,\"params\":{},\"parkingSpaceId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:25:17', 12);
INSERT INTO `sys_oper_log` VALUES (201, '业主车位信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.deleteOwnerParkingSpace()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/park/space/deleteOwnerParkingSpace', '127.0.0.1', '内网IP', '{\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:25:22', 12);
INSERT INTO `sys_oper_log` VALUES (202, '业主房屋信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.deleteOwnerHouse()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/house/deleteOwnerHouse', '127.0.0.1', '内网IP', '{\"houseId\":1,\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:25:26', 17);
INSERT INTO `sys_oper_log` VALUES (203, '业主房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/house', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:25:31\",\"houseId\":1,\"ownerHouseId\":4,\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:25:31', 12);
INSERT INTO `sys_oper_log` VALUES (204, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:25:36\",\"ownerId\":2,\"ownerParkingId\":6,\"params\":{},\"parkingSpaceId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:25:36', 13);
INSERT INTO `sys_oper_log` VALUES (205, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":8,\"attrName\":\"1.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/02/27/1_20250227043810A003.jpg\",\"params\":{}},\"createTime\":\"2025-02-27 04:38:16\",\"ownerId\":2,\"ownerParkingId\":7,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"闽A8888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:38:16', 28);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-25 22:57:43\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"收费管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"money\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:41:50', 32);
INSERT INTO `sys_oper_log` VALUES (207, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:42:21\",\"feeId\":1,\"feeName\":\"水费\",\"feeType\":\"2\",\"num\":1,\"params\":{},\"price\":5,\"unit\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:42:21', 19);
INSERT INTO `sys_oper_log` VALUES (208, '收费信息', 2, 'com.ruoyi.web.controller.smart.SmtFeeController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-02-27 04:42:22\",\"delFlag\":\"0\",\"feeId\":1,\"feeName\":\"水费\",\"feeType\":\"2\",\"num\":1,\"orderNum\":0,\"params\":{},\"price\":5,\"status\":\"0\",\"unit\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-02-27 04:43:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:43:23', 10);
INSERT INTO `sys_oper_log` VALUES (209, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:43:35\",\"feeId\":2,\"feeName\":\"电费\",\"feeType\":\"1\",\"num\":1,\"params\":{},\"price\":1,\"unit\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:43:35', 12);
INSERT INTO `sys_oper_log` VALUES (210, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:44:06\",\"feeId\":3,\"feeName\":\"停车费\",\"feeType\":\"3\",\"num\":1,\"params\":{},\"price\":50,\"unit\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:44:06', 10);
INSERT INTO `sys_oper_log` VALUES (211, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-02-23 19:07:30\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"天\",\"dictSort\":3,\"dictType\":\"fee_unit\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:44:23', 12);
INSERT INTO `sys_oper_log` VALUES (212, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-27 04:59:05\",\"endTime\":\"2025-03-01\",\"feeId\":3,\"params\":{},\"parkingRentId\":1,\"parkingSpaceId\":1,\"rentAmount\":1400,\"startTime\":\"2025-02-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 04:59:05', 18);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/fee/index\",\"createTime\":\"2025-02-25 22:59:53\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"费用管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"feeList\",\"perms\":\"smart:fee:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 05:04:10', 11);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/feeRecord/index\",\"createBy\":\"admin\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"费用清单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"feeOrder\",\"perms\":\"smart:fee:record:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 05:05:05', 11);
INSERT INTO `sys_oper_log` VALUES (215, '车位租赁信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingRentController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-02-27 04:59:05\",\"delFlag\":\"0\",\"endTime\":\"2025-03-01\",\"fee\":{\"feeId\":3,\"params\":{}},\"feeId\":3,\"orderNum\":0,\"params\":{},\"parkingRentId\":1,\"parkingSpace\":{\"params\":{},\"parkingSpaceId\":1},\"parkingSpaceId\":1,\"rentAmount\":1400,\"startTime\":\"2025-02-01\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-02-27 05:15:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 05:15:25', 46);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/fee/index\",\"createTime\":\"2025-02-25 22:59:53\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"费用类型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"feeList\",\"perms\":\"smart:fee:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 05:48:25', 28);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/feeRecord/index\",\"createTime\":\"2025-02-27 05:05:05\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"费用管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"feeOrder\",\"perms\":\"smart:fee:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-27 05:48:36', 15);
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100\",\"userId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 00:01:23', 50);
INSERT INTO `sys_oper_log` VALUES (219, '业主车位信息', 2, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":9,\"attrName\":\"p3.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p3_20250302001846A001.jpg\",\"params\":{}},\"createBy\":\"\",\"createTime\":\"2025-02-27 04:38:17\",\"delFlag\":\"0\",\"orderNum\":0,\"ownerId\":2,\"ownerParkingId\":7,\"params\":{},\"parkingRent\":{\"params\":{},\"parkingSpaceId\":1},\"parkingSpace\":{\"params\":{},\"parkingSpaceId\":1},\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-02 00:20:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 00:20:20', 60);
INSERT INTO `sys_oper_log` VALUES (220, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":10,\"attrName\":\"p2.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p2_20250302004025A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 00:40:30\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'parking_space_id\' in where clause is ambiguous\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerParkingSpaceMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper.selectSmtOwnerParkingSpaceList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select             sops.owner_parking_id,             sops.parking_space_id,             sops.owner_id,             sops.plate_no,             sops.plate_url,             sops.order_num,             sops.status,             sops.remark,             sops.del_flag,             sops.create_by,             sops.create_time,             sops.update_by,             sops.update_time,             su.user_id,             su.user_name,             su.nick_name,             su.sex,             su.email,             su.phonenumber,             sps.parking_space_id,             sps.parking_space_no,             sps.parking_space_status,             spr.parking_rent_id,             spr.fee_id,             spr.start_time,             spr.end_time,             spr.rent_amount,             sa.attr_id,             sa.biz_id,             sa.attr_name,             sa.attr_new_name,             sa.attr_url         from smt_owner_parking_space sops         LEFT JOIN sys_user su on su.user_id = sops.owner_id         LEFT JOIN smt_parking_space sps on sps.parking_space_id = sops.parking_space_id         LEFT JOIN smt_parking_rent spr on spr.parking_space_id = sops.parking_space_id         LEFT JOIN sys_attr sa on sa.biz_id = sops.parking_space_id          WHERE  parking_space_id = ?              and owner_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'parking_space_id\' in where clause is ambiguous\n; Column \'parking_space_id\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraint', '2025-03-02 00:40:30', 65);
INSERT INTO `sys_oper_log` VALUES (221, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":11,\"attrName\":\"p2.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p2_20250302004418A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 00:44:24\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '', '2025-03-02 00:44:24', 19);
INSERT INTO `sys_oper_log` VALUES (222, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":11,\"attrName\":\"p2.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p2_20250302004418A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 00:45:15\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '', '2025-03-02 00:46:31', 75381);
INSERT INTO `sys_oper_log` VALUES (223, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":12,\"attrName\":\"p2.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p2_20250302005115A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 00:51:20\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '', '2025-03-02 00:51:20', 31);
INSERT INTO `sys_oper_log` VALUES (224, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":12,\"attrName\":\"p2.jpg\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p2_20250302005115A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 00:51:48\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '', '2025-03-02 00:52:07', 18837);
INSERT INTO `sys_oper_log` VALUES (225, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":16,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p1_20250302010528A004.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 01:05:45\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '', '2025-03-02 01:05:45', 29);
INSERT INTO `sys_oper_log` VALUES (226, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":16,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p1_20250302010528A004.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 01:06:35\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '该停车位已被占用！', '2025-03-02 01:06:52', 16681);
INSERT INTO `sys_oper_log` VALUES (227, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":16,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p1_20250302010528A004.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 01:06:57\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1}', NULL, 1, '该停车位已被占用！', '2025-03-02 01:06:57', 6);
INSERT INTO `sys_oper_log` VALUES (228, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":27,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p3_20250302015151A010.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 01:51:53\",\"ownerId\":2,\"ownerParkingId\":8,\"params\":{},\"parkingSpaceId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 01:51:53', 46);
INSERT INTO `sys_oper_log` VALUES (229, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":28,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p3_20250302015315A011.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 01:53:16\",\"ownerId\":2,\"ownerParkingId\":9,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 01:53:16', 28);
INSERT INTO `sys_oper_log` VALUES (230, '车位租赁信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingRentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/smart/park/rent/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 01:53:58', 13);
INSERT INTO `sys_oper_log` VALUES (231, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-02 01:54:35\",\"endTime\":\"2025-03-01\",\"feeId\":3,\"params\":{},\"parkingRentId\":2,\"parkingSpaceId\":1,\"rentAmount\":1400,\"startTime\":\"2025-02-01\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n            2,)\n            \n            1400,\n            \n            \n     \' at line 16\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtFeeRecordMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtFeeRecordMapper.insertSmtFeeRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_fee_record          ( fee_id,             owner_id,             rel_id,                          amount,                                                                                           start_time,             end_time )           values ( ?,             ?,)             ?,)                          ?,                                                                                           ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n            2,)\n            \n            1400,\n            \n            \n     \' at line 16\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n            2,)\n            \n            1400,\n            \n            \n     \' at line 16', '2025-03-02 01:54:35', 80);
INSERT INTO `sys_oper_log` VALUES (232, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-02 01:58:06\",\"endTime\":\"2025-03-01\",\"feeId\":3,\"params\":{},\"parkingRentId\":3,\"parkingSpaceId\":1,\"rentAmount\":1400,\"startTime\":\"2025-02-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 01:58:06', 205);
INSERT INTO `sys_oper_log` VALUES (233, '车位租赁信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingRentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/smart/park/rent/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 01:58:20', 11);
INSERT INTO `sys_oper_log` VALUES (234, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee/record', '127.0.0.1', '内网IP', '{\"amount\":100,\"createTime\":\"2025-03-02 02:27:05\",\"display\":\"20\",\"endTime\":\"2025-03-01\",\"feeId\":1,\"feeRecordId\":2,\"ownerId\":2,\"params\":{},\"startTime\":\"2025-02-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 02:27:05', 251);
INSERT INTO `sys_oper_log` VALUES (235, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"缴费状态\",\"dictType\":\"pay_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 02:37:42', 242);
INSERT INTO `sys_oper_log` VALUES (236, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未缴费\",\"dictSort\":1,\"dictType\":\"pay_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 02:38:06', 21);
INSERT INTO `sys_oper_log` VALUES (237, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已缴费\",\"dictSort\":1,\"dictType\":\"pay_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 02:38:15', 17);
INSERT INTO `sys_oper_log` VALUES (238, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 02:40:25', 69);
INSERT INTO `sys_oper_log` VALUES (239, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/fee/record/changeStatus', '127.0.0.1', '内网IP', '{\"feeRecordId\":2,\"params\":{},\"payStatus\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:12:44', 38);
INSERT INTO `sys_oper_log` VALUES (240, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/fee/record/changeStatus', '127.0.0.1', '内网IP', '{\"feeRecordId\":2,\"params\":{},\"payStatus\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:14:47', 6);
INSERT INTO `sys_oper_log` VALUES (241, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/fee/record/changeStatus', '127.0.0.1', '内网IP', '{\"feeRecordId\":2,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:15:25', 10);
INSERT INTO `sys_oper_log` VALUES (242, '维修信息', 1, 'com.ruoyi.web.controller.smart.SmtRepairController.add()', 'POST', 1, 'admin', '研发部门', '/smart/repair', '127.0.0.1', '内网IP', '{\"address\":\"test\",\"content\":\"<p>fsfs</p>\",\"createTime\":\"2025-03-02 03:20:02\",\"ownerId\":2,\"params\":{},\"phone\":\"18790456789\",\"repairId\":1,\"title\":\"23113\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:20:02', 43);
INSERT INTO `sys_oper_log` VALUES (243, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtRepairController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/repair/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"repairId\":1,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:34:37', 11);
INSERT INTO `sys_oper_log` VALUES (244, '投诉信息', 1, 'com.ruoyi.web.controller.smart.SmtComplainController.add()', 'POST', 1, 'admin', '研发部门', '/smart/complain', '127.0.0.1', '内网IP', '{\"content\":\"<p>test</p>\",\"createTime\":\"2025-03-02 03:35:36\",\"ownerId\":2,\"params\":{},\"title\":\"test\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'owner_id\' in \'class com.ruoyi.smart.domain.SmtComplain\'', '2025-03-02 03:35:36', 14);
INSERT INTO `sys_oper_log` VALUES (245, '投诉信息', 1, 'com.ruoyi.web.controller.smart.SmtComplainController.add()', 'POST', 1, 'admin', '研发部门', '/smart/complain', '127.0.0.1', '内网IP', '{\"complainId\":1,\"content\":\"<p>test</p>\",\"createTime\":\"2025-03-02 03:41:12\",\"ownerId\":2,\"params\":{},\"title\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:41:12', 145);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"smart:build:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:46:47', 279);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"smart:build:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:46:47', 277);
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:46:58', 29);
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"smart:build:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:47:08', 18);
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"smart:build:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:47:21', 17);
INSERT INTO `sys_oper_log` VALUES (251, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"smart:build:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:47:34', 20);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"smart:unit:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:48:21', 12);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"perms\":\"smart:unit:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:48:31', 10);
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"perms\":\"smart:unit:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:48:42', 19);
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"perms\":\"smart:unit:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:48:55', 19);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"smart:house:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:49:13', 14);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"perms\":\"smart:house:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:49:32', 18);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"perms\":\"smart:house:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:49:44', 14);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2003,\"perms\":\"smart:house:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:49:59', 17);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"perms\":\"smart:park:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:50:32', 17);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2018,\"perms\":\"smart:park:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:50:42', 11);
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2018,\"perms\":\"smart:park:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:50:54', 23);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2018,\"perms\":\"smart:park:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:51:05', 19);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"smart:park:space:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:51:35', 13);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"smart:park:space:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:51:35', 12);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2038', '127.0.0.1', '内网IP', '2038', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:51:40', 18);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2005,\"perms\":\"smart:park:space:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:51:52', 15);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2005,\"perms\":\"smart:park:space:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:52:03', 14);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2005,\"perms\":\"smart:park:space:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:52:14', 15);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"smart:owner:park:space:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:52:45', 12);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"perms\":\"smart:owner:park:space:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:52:58', 16);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"perms\":\"smart:owner:park:space:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:53:11', 11);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2006,\"perms\":\"smart:owner:park:space:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:53:24', 13);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:user:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:54:12', 13);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"perms\":\"system:user:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:54:26', 9);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"perms\":\"system:user:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:54:36', 12);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2008,\"perms\":\"system:user:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:54:50', 13);
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重置密码\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2008,\"perms\":\"system:user:resetPwd\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:56:01', 13);
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分配房屋\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2008,\"perms\":\"smart:owner:assign:house\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:56:26', 15);
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分配车位\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":2008,\"perms\":\"smart:owner:assign:space\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:56:48', 8);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"退房\",\"menuType\":\"F\",\"orderNum\":8,\"params\":{},\"parentId\":2008,\"perms\":\"smart:owner:return:house\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:57:04', 11);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"退车位\",\"menuType\":\"F\",\"orderNum\":9,\"params\":{},\"parentId\":2008,\"perms\":\"smart:owner:return:space\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:57:22', 9);
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2013,\"perms\":\"smart:fee:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:57:55', 11);
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2013,\"perms\":\"smart:fee:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:58:04', 13);
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2013,\"perms\":\"smart:fee:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:58:14', 13);
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2013,\"perms\":\"smart:fee:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:58:26', 12);
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"perms\":\"smart:fee:record:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:58:54', 16);
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"perms\":\"smart:fee:record:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:59:06', 12);
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2019,\"perms\":\"smart:fee:record:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:59:15', 12);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2019,\"perms\":\"smart:fee:record:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:59:28', 16);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"缴费\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2019,\"perms\":\"smart:fee:record:pay\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 03:59:48', 13);
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2017,\"perms\":\"smart:complain:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:01:50', 11);
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2017,\"perms\":\"smart:complain:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:01:59', 14);
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2017,\"perms\":\"smart:complain:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:02:10', 9);
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2017,\"perms\":\"smart:complain:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:02:20', 13);
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"perms\":\"smart:repair:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:02:43', 13);
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2015,\"perms\":\"smart:repair:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:02:58', 11);
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2015,\"perms\":\"smart:repair:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:03:11', 9);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2015,\"perms\":\"smart:repair:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:03:22', 11);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"perms\":\"smart:owner:park:space:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:03:57', 12);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"perms\":\"smart:owner:park:space:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:04:10', 10);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2010,\"perms\":\"smart:owner:park:space:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:04:19', 9);
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2010,\"perms\":\"smart:owner:park:space:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:04:33', 11);
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"perms\":\"smart:park:rent:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:04:56', 9);
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"perms\":\"smart:park:rent:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:05:07', 7);
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2011,\"perms\":\"smart:park:rent:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:05:18', 12);
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2011,\"perms\":\"smart:park:rent:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:05:29', 10);
INSERT INTO `sys_oper_log` VALUES (308, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-27 03:41:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2012,2019,2014,2015,2016,2017,2046,2059,2063,2068,2069,2070,2064,2065,2066],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:10:02', 55);
INSERT INTO `sys_oper_log` VALUES (309, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-02 04:20:40\",\"houseArea\":120,\"houseId\":2,\"houseNo\":\"102\",\"houseType\":\"4\",\"params\":{},\"unitId\":1,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 04:20:40', 52);
INSERT INTO `sys_oper_log` VALUES (310, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"时\",\"dictSort\":4,\"dictType\":\"fee_unit\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 08:29:07', 23);
INSERT INTO `sys_oper_log` VALUES (311, '业主车位信息', 3, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.remove()', 'DELETE', 1, 'admin', '研发部门', '/smart/owner/park/space/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 09:14:09', 17);
INSERT INTO `sys_oper_log` VALUES (312, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-02 09:35:41\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'parking_space_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerParkingSpaceMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_owner_parking_space          ( create_time )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'parking_space_id\' doesn\'t have a default value\n; Field \'parking_space_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'parking_space_id\' doesn\'t have a default value', '2025-03-02 09:35:41', 148);
INSERT INTO `sys_oper_log` VALUES (313, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":31,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p1_20250302093734A002.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 09:37:36\",\"ownerId\":2,\"params\":{},\"plateNo\":\"京A88888\"}', NULL, 1, '', '2025-03-02 09:37:36', 48);
INSERT INTO `sys_oper_log` VALUES (314, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":31,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p1_20250302093734A002.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 09:38:18\",\"ownerId\":2,\"params\":{},\"plateNo\":\"京A88888\"}', NULL, 1, '', '2025-03-02 09:38:38', 19533);
INSERT INTO `sys_oper_log` VALUES (315, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":32,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/02/p1_20250302094137A003.jpg\",\"params\":{}},\"createTime\":\"2025-03-02 09:41:40\",\"ownerId\":2,\"ownerParkingId\":10,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 09:41:40', 51);
INSERT INTO `sys_oper_log` VALUES (316, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-02 09:42:42\",\"houseArea\":120,\"houseId\":3,\"houseNo\":\"103\",\"houseType\":\"3\",\"params\":{},\"unitId\":1,\"useStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 09:42:42', 27);
INSERT INTO `sys_oper_log` VALUES (317, '业主房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/house', '127.0.0.1', '内网IP', '{\"houseIds\":[1,2,3],\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 10:13:52', 433);
INSERT INTO `sys_oper_log` VALUES (318, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"smt_parking_space_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-02 18:52:06', 153);
INSERT INTO `sys_oper_log` VALUES (319, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"smt_parking_space_record\"}', NULL, 0, NULL, '2025-03-02 18:52:19', 448);
INSERT INTO `sys_oper_log` VALUES (320, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"租赁费\",\"dictSort\":4,\"dictType\":\"fee_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 19:02:40', 28);
INSERT INTO `sys_oper_log` VALUES (321, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-06 19:03:40\",\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":50,\"unit\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 19:03:40', 19);
INSERT INTO `sys_oper_log` VALUES (322, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/record', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":36,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/07/p1_20250307144018A004.jpg\",\"params\":{}},\"createTime\":\"2025-03-07 14:40:25\",\"driveInTime\":\"2025-03-07 14:40:25\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"京A88888\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.smart.mapper.SmtParkingSpaceRecordMapper.insertSmtParkingSpaceRecord', '2025-03-07 14:40:25', 45);
INSERT INTO `sys_oper_log` VALUES (323, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":37,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/07/p3_20250307144406A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-07 14:44:13\",\"driveInTime\":\"2025-03-07 14:44:13\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.smart.mapper.SmtParkingSpaceRecordMapper.insertSmtParkingSpaceRecord', '2025-03-07 14:44:13', 68);
INSERT INTO `sys_oper_log` VALUES (324, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":38,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/07/p3_20250307145123A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-07 14:51:32\",\"driveInTime\":\"2025-03-07 14:51:32\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.smart.mapper.SmtParkingSpaceRecordMapper.insertSmtParkingSpaceRecord', '2025-03-07 14:52:46', 76932);
INSERT INTO `sys_oper_log` VALUES (325, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":38,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/07/p3_20250307145123A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-07 14:58:08\",\"driveInTime\":\"2025-03-07 14:58:08\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.smart.mapper.SmtParkingSpaceRecordMapper.insertSmtParkingSpaceRecord', '2025-03-07 14:58:24', 15209);
INSERT INTO `sys_oper_log` VALUES (326, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":38,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/07/p3_20250307145123A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-07 15:00:41\",\"driveInTime\":\"2025-03-07 15:00:41\",\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.smart.mapper.SmtParkingSpaceRecordMapper.insertSmtParkingSpaceRecord', '2025-03-07 15:03:19', 157534);
INSERT INTO `sys_oper_log` VALUES (327, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":38,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/07/p3_20250307145123A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-07 15:04:30\",\"driveInTime\":\"2025-03-07 15:04:30\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":2,\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 15:04:35', 4208);
INSERT INTO `sys_oper_log` VALUES (328, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"attr\":{\"attrId\":39,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/07/p1_20250307150549A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-07 15:05:55\",\"driveInTime\":\"2025-03-07 15:05:55\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":3,\"parkingSpaceId\":1,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 15:05:55', 30);
INSERT INTO `sys_oper_log` VALUES (329, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingSpaceRecord/index\",\"createTime\":\"2025-02-25 22:44:39\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"车位使用管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"parkingUse\",\"perms\":\"smart:park:space:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 15:08:05', 44);
INSERT INTO `sys_oper_log` VALUES (330, '车位使用信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"粤R888G8\",\"updateTime\":\"2025-03-07 15:38:40\"}', NULL, 1, '车牌:粤R888G8查无该车位：A-1001的使用记录！', '2025-03-07 15:38:40', 28);
INSERT INTO `sys_oper_log` VALUES (331, '车位使用信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"京A88888\",\"updateTime\":\"2025-03-07 15:38:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 15:38:56', 27);
INSERT INTO `sys_oper_log` VALUES (332, '业主房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/house', '127.0.0.1', '内网IP', '{\"houseIds\":[2,1],\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 15:48:13', 48);
INSERT INTO `sys_oper_log` VALUES (333, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"ownerId\":2,\"params\":{},\"parkingSpaceIds\":[1]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'parking_space_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtOwnerParkingSpaceMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_owner_parking_space          ( owner_id )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'parking_space_id\' doesn\'t have a default value\n; Field \'parking_space_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'parking_space_id\' doesn\'t have a default value', '2025-03-07 15:54:19', 310);
INSERT INTO `sys_oper_log` VALUES (334, '业主车位信息', 1, 'com.ruoyi.web.controller.smart.SmtOwnerParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/owner/park/space', '127.0.0.1', '内网IP', '{\"ownerId\":2,\"params\":{},\"parkingSpaceIds\":[1]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 15:56:17', 271);
INSERT INTO `sys_oper_log` VALUES (335, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100,2\",\"userId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 16:10:04', 34);
INSERT INTO `sys_oper_log` VALUES (336, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"车位状态\",\"dictType\":\"parking_space_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 16:22:58', 14);
INSERT INTO `sys_oper_log` VALUES (337, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空闲\",\"dictSort\":1,\"dictType\":\"parking_space_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 16:23:13', 14);
INSERT INTO `sys_oper_log` VALUES (338, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"占用\",\"dictSort\":2,\"dictType\":\"parking_space_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 16:23:25', 11);
INSERT INTO `sys_oper_log` VALUES (339, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,2,3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:20:54', 21);
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:21:57', 9);
INSERT INTO `sys_oper_log` VALUES (341, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3,2\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:22:28', 16);
INSERT INTO `sys_oper_log` VALUES (342, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:24:32', 14);
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:30:24', 14);
INSERT INTO `sys_oper_log` VALUES (344, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"3,2\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:31:12', 16);
INSERT INTO `sys_oper_log` VALUES (345, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"2,3,1\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:33:53', 12);
INSERT INTO `sys_oper_log` VALUES (346, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:35:08', 11);
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/owner/index\",\"createTime\":\"2025-02-25 22:46:51\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"业主列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"owner\",\"perms\":\"smart:owner:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:38:42', 24);
INSERT INTO `sys_oper_log` VALUES (348, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3,2\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:39:04', 15);
INSERT INTO `sys_oper_log` VALUES (349, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:41:47', 10);
INSERT INTO `sys_oper_log` VALUES (350, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3,2\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:44:31', 10);
INSERT INTO `sys_oper_log` VALUES (351, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:47:47', 11);
INSERT INTO `sys_oper_log` VALUES (352, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-07 20:48:09\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":2,\"parkingSpaceNo\":\"A001-01\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:48:09', 17);
INSERT INTO `sys_oper_log` VALUES (353, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-07 20:48:24\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":3,\"parkingSpaceNo\":\"A001-B\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:48:24', 6);
INSERT INTO `sys_oper_log` VALUES (354, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthParkingSpace()', 'PUT', 1, 'admin', '研发部门', '/system/user/authParkingSpace', '127.0.0.1', '内网IP', '{\"parkingSpaceIds\":\"1,2\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-07 20:48:40', 14);
INSERT INTO `sys_oper_log` VALUES (355, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"车位类型\",\"dictType\":\"parking_space_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 00:44:55', 11);
INSERT INTO `sys_oper_log` VALUES (356, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"临时\",\"dictSort\":1,\"dictType\":\"parking_space_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 00:45:17', 11);
INSERT INTO `sys_oper_log` VALUES (357, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"固定\",\"dictSort\":2,\"dictType\":\"parking_space_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 00:45:24', 9);
INSERT INTO `sys_oper_log` VALUES (358, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-08 01:24:45\",\"delFlag\":\"0\",\"flag\":false,\"orderNum\":0,\"params\":{},\"parkingLot\":{\"params\":{},\"parkingLotId\":1},\"parkingLotId\":1,\"parkingSpaceId\":4,\"parkingSpaceNo\":\"A-1001\",\"parkingSpaceStatus\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 01:24:45', 229);
INSERT INTO `sys_oper_log` VALUES (359, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100\",\"userId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:49:27', 63);
INSERT INTO `sys_oper_log` VALUES (360, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/parkingRent/index\",\"createTime\":\"2025-02-25 22:56:47\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"车位租赁\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2004,\"path\":\"rent\",\"perms\":\"smart:park:rent:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:53:26', 43);
INSERT INTO `sys_oper_log` VALUES (361, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-25 22:47:57\",\"icon\":\"lock\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"停车位管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"parkSpace\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:53:39', 19);
INSERT INTO `sys_oper_log` VALUES (362, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/ownerParkingSpace/index\",\"createTime\":\"2025-02-25 22:55:32\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"停车位使用情况\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"path\":\"parkingSpaceUse\",\"perms\":\"smart:owner:park:space:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:53:47', 21);
INSERT INTO `sys_oper_log` VALUES (363, '车位信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-02-26 00:42:05\",\"delFlag\":\"0\",\"flag\":false,\"orderNum\":0,\"params\":{},\"parkingLot\":{\"params\":{},\"parkingLotId\":1},\"parkingLotId\":1,\"parkingSpaceId\":1,\"parkingSpaceNo\":\"A-1001\",\"parkingSpaceStatus\":\"0\",\"parkingSpaceType\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-08 09:54:21\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:54:21', 39);
INSERT INTO `sys_oper_log` VALUES (364, '车位信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-07 20:48:10\",\"delFlag\":\"0\",\"flag\":false,\"orderNum\":0,\"params\":{},\"parkingLot\":{\"params\":{},\"parkingLotId\":1},\"parkingLotId\":1,\"parkingSpaceId\":2,\"parkingSpaceNo\":\"A001-01\",\"parkingSpaceStatus\":\"0\",\"parkingSpaceType\":\"0\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-08 09:54:29\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:54:29', 18);
INSERT INTO `sys_oper_log` VALUES (365, '车位信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-07 20:48:24\",\"delFlag\":\"0\",\"flag\":false,\"orderNum\":0,\"params\":{},\"parkingLot\":{\"params\":{},\"parkingLotId\":1},\"parkingLotId\":1,\"parkingSpaceId\":3,\"parkingSpaceNo\":\"A001-B\",\"parkingSpaceStatus\":\"0\",\"parkingSpaceType\":\"1\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-08 09:54:35\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:54:35', 13);
INSERT INTO `sys_oper_log` VALUES (366, '车位信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.edit()', 'PUT', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-08 01:24:46\",\"delFlag\":\"0\",\"flag\":false,\"orderNum\":0,\"params\":{},\"parkingLot\":{\"params\":{},\"parkingLotId\":1},\"parkingLotId\":1,\"parkingSpaceId\":4,\"parkingSpaceNo\":\"A-1001\",\"parkingSpaceStatus\":\"0\",\"parkingSpaceType\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-03-08 09:54:42\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 09:54:42', 10);
INSERT INTO `sys_oper_log` VALUES (367, '楼栋信息', 1, 'com.ruoyi.web.controller.smart.SmtBuildController.add()', 'POST', 1, 'admin', '研发部门', '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":1,\"buildName\":\"A栋\",\"buildType\":\"1\",\"createTime\":\"2025-03-08 19:10:09\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:10:09', 26);
INSERT INTO `sys_oper_log` VALUES (368, '楼栋信息', 1, 'com.ruoyi.web.controller.smart.SmtBuildController.add()', 'POST', 1, 'admin', '研发部门', '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":2,\"buildName\":\"B栋\",\"buildType\":\"2\",\"createTime\":\"2025-03-08 19:10:36\",\"orderNum\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:10:36', 13);
INSERT INTO `sys_oper_log` VALUES (369, '楼栋信息', 1, 'com.ruoyi.web.controller.smart.SmtBuildController.add()', 'POST', 1, 'admin', '研发部门', '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":3,\"buildName\":\"C栋\",\"buildType\":\"1\",\"createTime\":\"2025-03-08 19:10:44\",\"orderNum\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:10:45', 14);
INSERT INTO `sys_oper_log` VALUES (370, '楼栋信息', 1, 'com.ruoyi.web.controller.smart.SmtBuildController.add()', 'POST', 1, 'admin', '研发部门', '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":4,\"buildName\":\"D栋\",\"buildType\":\"2\",\"createTime\":\"2025-03-08 19:10:56\",\"orderNum\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:10:56', 10);
INSERT INTO `sys_oper_log` VALUES (371, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', '研发部门', '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-08 19:11:19\",\"orderNum\":1,\"params\":{},\"unitId\":1,\"unitName\":\"一单元\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:11:19', 22);
INSERT INTO `sys_oper_log` VALUES (372, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', '研发部门', '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-08 19:11:26\",\"orderNum\":2,\"params\":{},\"unitId\":2,\"unitName\":\"二单元\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:11:26', 9);
INSERT INTO `sys_oper_log` VALUES (373, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', '研发部门', '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":2,\"createTime\":\"2025-03-08 19:11:43\",\"orderNum\":3,\"params\":{},\"unitId\":3,\"unitName\":\"一单元\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:11:43', 8);
INSERT INTO `sys_oper_log` VALUES (374, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', '研发部门', '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":3,\"createTime\":\"2025-03-08 19:11:56\",\"orderNum\":1,\"params\":{},\"unitId\":4,\"unitName\":\"一单元\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:11:56', 28);
INSERT INTO `sys_oper_log` VALUES (375, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', '研发部门', '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":4,\"createTime\":\"2025-03-08 19:12:09\",\"orderNum\":1,\"params\":{},\"unitId\":5,\"unitName\":\"一单元\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:12:09', 8);
INSERT INTO `sys_oper_log` VALUES (376, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-08 19:30:32\",\"flag\":false,\"houseArea\":110,\"houseId\":1,\"houseNo\":\"A-101\",\"houseType\":\"3\",\"params\":{},\"unitId\":1,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:30:33', 325);
INSERT INTO `sys_oper_log` VALUES (377, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-08 19:30:54\",\"flag\":false,\"houseArea\":120,\"houseId\":2,\"houseNo\":\"A-202\",\"houseType\":\"4\",\"params\":{},\"unitId\":2,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:30:54', 9);
INSERT INTO `sys_oper_log` VALUES (378, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":2,\"createTime\":\"2025-03-08 19:31:10\",\"flag\":false,\"houseArea\":120,\"houseId\":3,\"houseNo\":\"B-101\",\"houseType\":\"4\",\"params\":{},\"unitId\":3,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:31:10', 10);
INSERT INTO `sys_oper_log` VALUES (379, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":3,\"createTime\":\"2025-03-08 19:31:25\",\"flag\":false,\"houseArea\":140,\"houseId\":4,\"houseNo\":\"C-101\",\"houseType\":\"4\",\"params\":{},\"unitId\":4,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:31:25', 10);
INSERT INTO `sys_oper_log` VALUES (380, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', '研发部门', '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":4,\"createTime\":\"2025-03-08 19:31:41\",\"flag\":false,\"houseArea\":130,\"houseId\":5,\"houseNo\":\"D-101\",\"houseType\":\"3\",\"params\":{},\"unitId\":5,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:31:41', 12);
INSERT INTO `sys_oper_log` VALUES (381, '停车场信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingLotController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:33:38\",\"params\":{},\"parkingLotId\":1,\"parkingLotName\":\"A-B01\",\"parkingLotType\":\"2\",\"totalSpace\":500}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:33:38', 16);
INSERT INTO `sys_oper_log` VALUES (382, '停车场信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingLotController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:33:53\",\"params\":{},\"parkingLotId\":2,\"parkingLotName\":\"A-C01\",\"parkingLotType\":\"2\",\"totalSpace\":600}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:33:53', 11);
INSERT INTO `sys_oper_log` VALUES (383, '停车场信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingLotController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:34:11\",\"params\":{},\"parkingLotId\":3,\"parkingLotName\":\"B-A01\",\"parkingLotType\":\"1\",\"totalSpace\":450}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:34:11', 9);
INSERT INTO `sys_oper_log` VALUES (384, '停车场信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingLotController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:34:24\",\"params\":{},\"parkingLotId\":4,\"parkingLotName\":\"C-A01\",\"parkingLotType\":\"1\",\"totalSpace\":360}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:34:24', 9);
INSERT INTO `sys_oper_log` VALUES (385, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:36:15\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":1,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:36:15', 22);
INSERT INTO `sys_oper_log` VALUES (386, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:36:29\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":2,\"parkingSpaceNo\":\"F0002\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:36:29', 9);
INSERT INTO `sys_oper_log` VALUES (387, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:36:38\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":3,\"parkingSpaceNo\":\"F0003\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:36:38', 10);
INSERT INTO `sys_oper_log` VALUES (388, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:37:39\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":4,\"parkingSpaceNo\":\"X0001\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:37:39', 12);
INSERT INTO `sys_oper_log` VALUES (389, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:37:49\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":5,\"parkingSpaceNo\":\"X0002\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:37:49', 8);
INSERT INTO `sys_oper_log` VALUES (390, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:37:57\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":6,\"parkingSpaceNo\":\"X0003\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:37:57', 12);
INSERT INTO `sys_oper_log` VALUES (391, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:38:07\",\"flag\":false,\"params\":{},\"parkingLotId\":2,\"parkingSpaceId\":7,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:38:07', 16);
INSERT INTO `sys_oper_log` VALUES (392, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:38:18\",\"flag\":false,\"params\":{},\"parkingLotId\":2,\"parkingSpaceId\":8,\"parkingSpaceNo\":\"F0002\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:38:18', 10);
INSERT INTO `sys_oper_log` VALUES (393, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:38:27\",\"flag\":false,\"params\":{},\"parkingLotId\":2,\"parkingSpaceId\":9,\"parkingSpaceNo\":\"F0003\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:38:27', 9);
INSERT INTO `sys_oper_log` VALUES (394, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:38:40\",\"flag\":false,\"params\":{},\"parkingLotId\":2,\"parkingSpaceId\":10,\"parkingSpaceNo\":\"X0001\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:38:40', 9);
INSERT INTO `sys_oper_log` VALUES (395, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:38:48\",\"flag\":false,\"params\":{},\"parkingLotId\":2,\"parkingSpaceId\":11,\"parkingSpaceNo\":\"X0002\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:38:48', 9);
INSERT INTO `sys_oper_log` VALUES (396, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:38:57\",\"flag\":false,\"params\":{},\"parkingLotId\":2,\"parkingSpaceId\":12,\"parkingSpaceNo\":\"X0003\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:38:57', 9);
INSERT INTO `sys_oper_log` VALUES (397, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:39:06\",\"flag\":false,\"params\":{},\"parkingLotId\":3,\"parkingSpaceId\":13,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:39:06', 8);
INSERT INTO `sys_oper_log` VALUES (398, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:39:14\",\"flag\":false,\"params\":{},\"parkingLotId\":3,\"parkingSpaceId\":14,\"parkingSpaceNo\":\"F0002\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:39:14', 8);
INSERT INTO `sys_oper_log` VALUES (399, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:39:22\",\"flag\":false,\"params\":{},\"parkingLotId\":3,\"parkingSpaceId\":15,\"parkingSpaceNo\":\"F0003\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:39:22', 8);
INSERT INTO `sys_oper_log` VALUES (400, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:39:30\",\"flag\":false,\"params\":{},\"parkingLotId\":3,\"parkingSpaceId\":16,\"parkingSpaceNo\":\"X0001\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:39:30', 14);
INSERT INTO `sys_oper_log` VALUES (401, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:39:38\",\"flag\":false,\"params\":{},\"parkingLotId\":3,\"parkingSpaceId\":17,\"parkingSpaceNo\":\"X0002\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:39:38', 8);
INSERT INTO `sys_oper_log` VALUES (402, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:39:47\",\"flag\":false,\"params\":{},\"parkingLotId\":3,\"parkingSpaceId\":18,\"parkingSpaceNo\":\"X0003\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:39:47', 7);
INSERT INTO `sys_oper_log` VALUES (403, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:39:58\",\"flag\":false,\"params\":{},\"parkingLotId\":4,\"parkingSpaceId\":19,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:39:58', 8);
INSERT INTO `sys_oper_log` VALUES (404, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:40:06\",\"flag\":false,\"params\":{},\"parkingLotId\":4,\"parkingSpaceId\":20,\"parkingSpaceNo\":\"F0002\",\"parkingSpaceType\":\"1\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:40:06', 8);
INSERT INTO `sys_oper_log` VALUES (405, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:47:51\",\"feeId\":1,\"feeName\":\"水费\",\"feeType\":\"2\",\"num\":1,\"params\":{},\"price\":5,\"unit\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:47:51', 18);
INSERT INTO `sys_oper_log` VALUES (406, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:48:04\",\"feeId\":2,\"feeName\":\"电费\",\"feeType\":\"1\",\"num\":1,\"params\":{},\"price\":1,\"unit\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:48:04', 10);
INSERT INTO `sys_oper_log` VALUES (407, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:48:24\",\"feeId\":3,\"feeName\":\"停车费\",\"feeType\":\"3\",\"num\":1,\"params\":{},\"price\":5,\"unit\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:48:24', 11);
INSERT INTO `sys_oper_log` VALUES (408, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-08 19:48:48\",\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":30,\"unit\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 19:48:49', 9);
INSERT INTO `sys_oper_log` VALUES (409, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthParkingSpace()', 'PUT', 1, 'admin', '研发部门', '/system/user/authParkingSpace', '127.0.0.1', '内网IP', '{\"parkingSpaceIds\":\"1,8,14\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 20:09:37', 139);
INSERT INTO `sys_oper_log` VALUES (410, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', '研发部门', '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3,4\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 20:09:50', 18);
INSERT INTO `sys_oper_log` VALUES (411, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 00:55:03\",\"endTime\":\"2025-03-31\",\"feeId\":4,\"params\":{},\"parkingRentId\":1,\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'plateNo\' in \'class com.ruoyi.smart.domain.SmtOwnerParkingSpace\'', '2025-03-09 00:55:03', 44);
INSERT INTO `sys_oper_log` VALUES (412, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 00:55:08\",\"endTime\":\"2025-03-31\",\"feeId\":4,\"params\":{},\"parkingRentId\":2,\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'plateNo\' in \'class com.ruoyi.smart.domain.SmtOwnerParkingSpace\'', '2025-03-09 00:55:08', 13);
INSERT INTO `sys_oper_log` VALUES (413, '车位租赁信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingRentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/smart/park/rent/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 01:00:33', 25);
INSERT INTO `sys_oper_log` VALUES (414, '车位租赁信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingRentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/smart/park/rent/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 01:00:35', 12);
INSERT INTO `sys_oper_log` VALUES (415, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 01:00:47\",\"endTime\":\"2025-03-31\",\"feeId\":4,\"params\":{},\"parkingRentId\":3,\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 01:00:47', 31);
INSERT INTO `sys_oper_log` VALUES (416, '车位租赁信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingRentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/smart/park/rent/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 01:08:20', 26);
INSERT INTO `sys_oper_log` VALUES (417, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 01:08:30\",\"endTime\":\"2025-03-31\",\"feeId\":4,\"ownerId\":2,\"params\":{},\"parkingRentId\":4,\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 01:08:30', 51);
INSERT INTO `sys_oper_log` VALUES (418, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"feeId\":4,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-03-09 01:33:32', 16);
INSERT INTO `sys_oper_log` VALUES (419, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"feeId\":4,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-03-09 01:46:04', 0);
INSERT INTO `sys_oper_log` VALUES (420, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 01:08:30\",\"delFlag\":\"0\",\"endTime\":\"2025-03-31\",\"fee\":{\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":30},\"feeId\":4,\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRentId\":4,\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\",\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-03-09 01:47:15', 12);
INSERT INTO `sys_oper_log` VALUES (421, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 01:08:30\",\"delFlag\":\"0\",\"endTime\":\"2025-03-31\",\"fee\":{\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":30},\"feeId\":4,\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRentId\":4,\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\",\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 01:53:58', 347);
INSERT INTO `sys_oper_log` VALUES (422, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/feeRecord/index\",\"createTime\":\"2025-02-27 05:05:05\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"费用清单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"feeOrder\",\"perms\":\"smart:fee:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 01:55:49', 38);
INSERT INTO `sys_oper_log` VALUES (423, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"smt_fee_list\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:01:55', 194);
INSERT INTO `sys_oper_log` VALUES (424, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/feeRecord/index\",\"createTime\":\"2025-02-27 05:05:05\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"费用管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"feeOrder\",\"perms\":\"smart:fee:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:02:13', 20);
INSERT INTO `sys_oper_log` VALUES (425, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/smt_fee_list', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:02:40', 94);
INSERT INTO `sys_oper_log` VALUES (426, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"smt_fee_list\"}', NULL, 0, NULL, '2025-03-09 02:02:42', 537);
INSERT INTO `sys_oper_log` VALUES (427, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 01:08:30\",\"delFlag\":\"0\",\"endTime\":\"2025-03-31\",\"fee\":{\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":30},\"feeId\":4,\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRentId\":4,\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\",\"status\":\"0\",\"updateBy\":\"\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'title\' at row 1\r\n### The error may exist in file [D:\\dev\\code\\ruoyi\\smart\\wy\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\smart\\SmtFeeListMapper.xml]\r\n### The error may involve com.ruoyi.smart.mapper.SmtFeeListMapper.insertSmtFeeList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into smt_fee_list          ( fee_id,             owner_id,             title,             amount )           values ( ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'title\' at row 1\n; Data truncation: Data too long for column \'title\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'title\' at row 1', '2025-03-09 02:21:46', 372);
INSERT INTO `sys_oper_log` VALUES (428, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', '研发部门', '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 01:08:30\",\"delFlag\":\"0\",\"endTime\":\"2025-03-31\",\"fee\":{\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":30},\"feeId\":4,\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRentId\":4,\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\",\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:22:06', 58);
INSERT INTO `sys_oper_log` VALUES (429, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/feeRecord/index\",\"createTime\":\"2025-02-27 05:05:05\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"水电费管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"feeOrder\",\"perms\":\"smart:fee:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:23:38', 27);
INSERT INTO `sys_oper_log` VALUES (430, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/smart/feeList/index\",\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"费用清单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2012,\"path\":\"feeList\",\"perms\":\"smart:fee:list:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:24:19', 27);
INSERT INTO `sys_oper_log` VALUES (431, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/feeList/index\",\"createTime\":\"2025-03-09 02:24:19\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"费用清单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2012,\"path\":\"feeList\",\"perms\":\"smart:fee:list:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:24:27', 18);
INSERT INTO `sys_oper_log` VALUES (432, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.add()', 'POST', 1, 'admin', '研发部门', '/smart/fee/record', '127.0.0.1', '内网IP', '{\"amount\":50,\"createTime\":\"2025-03-09 02:33:01\",\"display\":\"50\",\"feeId\":2,\"feeRecordId\":1,\"month\":\"2025-03\",\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:33:02', 299);
INSERT INTO `sys_oper_log` VALUES (433, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.addCommonFee()', 'POST', 1, 'admin', '研发部门', '/smart/fee/record/addCommonFee', '127.0.0.1', '内网IP', '{\"amount\":50,\"createBy\":\"\",\"createTime\":\"2025-03-09 02:33:02\",\"delFlag\":\"0\",\"display\":\"50\",\"fee\":{\"feeId\":2,\"feeName\":\"电费\",\"feeType\":\"1\",\"num\":1,\"params\":{},\"price\":1},\"feeId\":2,\"feeRecordId\":1,\"feeStatus\":\"0\",\"month\":\"2025-03\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:46:56', 179);
INSERT INTO `sys_oper_log` VALUES (434, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"smart/fee/index\",\"createTime\":\"2025-02-25 22:59:53\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"费用类型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"fee\",\"perms\":\"smart:fee:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:49:18', 21);
INSERT INTO `sys_oper_log` VALUES (435, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":2,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 02:55:44', 23);
INSERT INTO `sys_oper_log` VALUES (436, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-27 03:41:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2012,2014,2015,2016,2017,2046,2080,2068,2069,2070,2064,2065,2066],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:03:53', 88);
INSERT INTO `sys_oper_log` VALUES (437, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2080,\"perms\":\"smart:fee:list:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:04:19', 27);
INSERT INTO `sys_oper_log` VALUES (438, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2080,\"perms\":\"smart:fee:list:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:04:37', 26);
INSERT INTO `sys_oper_log` VALUES (439, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2080,\"perms\":\"smart:fee:list:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:04:46', 20);
INSERT INTO `sys_oper_log` VALUES (440, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2080,\"perms\":\"smart:fee:list:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:04:58', 23);
INSERT INTO `sys_oper_log` VALUES (441, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"缴费\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2080,\"perms\":\"smart:fee:list:pay\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:05:11', 20);
INSERT INTO `sys_oper_log` VALUES (442, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-27 03:41:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2012,2080,2014,2015,2016,2017,2046,2081,2085,2068,2069,2070,2064,2065,2066],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:05:26', 35);
INSERT INTO `sys_oper_log` VALUES (443, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户查询\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2016,\"perms\":\"system:user:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 05:07:14', 17);
INSERT INTO `sys_oper_log` VALUES (444, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"owner-test@qq.com\",\"nickName\":\"赵子龙\",\"params\":{},\"phonenumber\":\"18678456789\",\"postIds\":[],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"owner-test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 10:43:44', 147);
INSERT INTO `sys_oper_log` VALUES (445, '维修信息', 1, 'com.ruoyi.web.controller.smart.SmtRepairController.add()', 'POST', 1, 'admin', '研发部门', '/smart/repair', '127.0.0.1', '内网IP', '{\"address\":\"test\",\"content\":\"<p>test</p>\",\"createTime\":\"2025-03-09 11:33:55\",\"ownerId\":2,\"params\":{},\"phone\":\"tst\",\"remark\":\"test\",\"repairId\":1,\"title\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 11:33:55', 197);
INSERT INTO `sys_oper_log` VALUES (446, '投诉信息', 1, 'com.ruoyi.web.controller.smart.SmtComplainController.add()', 'POST', 1, 'ry', NULL, '/smart/complain', '127.0.0.1', '内网IP', '{\"complainId\":1,\"content\":\"<p>test</p>\",\"createTime\":\"2025-03-09 12:22:38\",\"ownerId\":2,\"params\":{},\"title\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 12:22:39', 207);
INSERT INTO `sys_oper_log` VALUES (447, '维修信息', 1, 'com.ruoyi.web.controller.smart.SmtRepairController.add()', 'POST', 1, 'owner-test', NULL, '/smart/repair', '127.0.0.1', '内网IP', '{\"address\":\"test\",\"content\":\"<p>test</p>\",\"createTime\":\"2025-03-09 12:24:55\",\"ownerId\":100,\"params\":{},\"phone\":\"test\",\"repairId\":2,\"title\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 12:24:55', 18);
INSERT INTO `sys_oper_log` VALUES (448, '投诉信息', 1, 'com.ruoyi.web.controller.smart.SmtComplainController.add()', 'POST', 1, 'owner-test', NULL, '/smart/complain', '127.0.0.1', '内网IP', '{\"complainId\":2,\"content\":\"<p>1231321</p>\",\"createTime\":\"2025-03-09 12:25:07\",\"ownerId\":100,\"params\":{},\"title\":\"tes\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 12:25:07', 12);
INSERT INTO `sys_oper_log` VALUES (449, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtRepairController.changeStatus()', 'PUT', 1, 'admin', NULL, '/smart/repair/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"repairId\":1,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 12:26:19', 11);
INSERT INTO `sys_oper_log` VALUES (450, '投诉管理', 2, 'com.ruoyi.web.controller.smart.SmtComplainController.changeStatus()', 'PUT', 1, 'admin', NULL, '/smart/complain/changeStatus', '127.0.0.1', '内网IP', '{\"complainId\":2,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 12:26:26', 11);
INSERT INTO `sys_oper_log` VALUES (451, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":true,\"attr\":{\"attrId\":1,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p1_20250309122923A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 12:29:27\",\"driveInTime\":\"2025-03-09 12:29:27\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":1,\"parkingSpaceId\":1,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 12:29:27', 77);
INSERT INTO `sys_oper_log` VALUES (452, '车位使用信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.edit()', 'PUT', 1, 'admin', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"ownerId\":2,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"京A88888\",\"updateTime\":\"2025-03-09 12:29:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 12:29:38', 51);
INSERT INTO `sys_oper_log` VALUES (453, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.addRecordFee()', 'POST', 1, 'admin', NULL, '/smart/park/space/record/addRecordFee', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"\",\"createTime\":\"2025-03-09 12:29:27\",\"delFlag\":\"0\",\"driveInTime\":\"2025-03-09 12:29:27\",\"driveOutTime\":\"2025-03-09 12:39:39\",\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRecordId\":1,\"parkingRent\":{\"endTime\":\"2025-03-31\",\"feeId\":4,\"params\":{},\"parkingRentId\":4,\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\"},\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":1,\"plateNo\":\"京A88888\",\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:12:17', 74);
INSERT INTO `sys_oper_log` VALUES (454, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":3,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:13:51', 46);
INSERT INTO `sys_oper_log` VALUES (455, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":4,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:13:57', 10);
INSERT INTO `sys_oper_log` VALUES (456, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-27 03:41:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2012,2080,2014,2015,2016,2017,2046,2051,2052,2081,2085,2068,2069,2070,2064,2065,2066],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:14:53', 60);
INSERT INTO `sys_oper_log` VALUES (457, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', NULL, '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-09 13:37:33\",\"flag\":false,\"houseArea\":110,\"houseId\":6,\"houseNo\":\"2202\",\"houseType\":\"4\",\"params\":{},\"unitId\":2,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:37:33', 20);
INSERT INTO `sys_oper_log` VALUES (458, '房屋信息', 2, 'com.ruoyi.web.controller.smart.SmtHouseController.edit()', 'PUT', 1, 'admin', NULL, '/smart/house', '127.0.0.1', '内网IP', '{\"build\":{\"buildId\":1,\"params\":{}},\"buildId\":2,\"createBy\":\"\",\"createTime\":\"2025-03-09 13:37:34\",\"delFlag\":\"0\",\"flag\":false,\"houseArea\":120,\"houseId\":6,\"houseNo\":\"1202\",\"houseType\":\"3\",\"orderNum\":0,\"params\":{},\"status\":\"0\",\"unit\":{\"buildId\":1,\"params\":{},\"unitId\":2},\"unitId\":3,\"updateBy\":\"\",\"updateTime\":\"2025-03-09 13:37:55\",\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:37:55', 18);
INSERT INTO `sys_oper_log` VALUES (459, '房屋信息', 3, 'com.ruoyi.web.controller.smart.SmtHouseController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/house/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:38:02', 10);
INSERT INTO `sys_oper_log` VALUES (460, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', NULL, '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-09 13:38:23\",\"orderNum\":3,\"params\":{},\"unitId\":6,\"unitName\":\"三单元\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:38:23', 9);
INSERT INTO `sys_oper_log` VALUES (461, '单元信息', 2, 'com.ruoyi.web.controller.smart.SmtUnitController.edit()', 'PUT', 1, 'admin', NULL, '/smart/unit', '127.0.0.1', '内网IP', '{\"build\":{\"buildId\":1,\"params\":{}},\"buildId\":1,\"createBy\":\"\",\"createTime\":\"2025-03-09 13:38:24\",\"delFlag\":\"0\",\"orderNum\":4,\"params\":{},\"status\":\"0\",\"unitId\":6,\"unitName\":\"六单元\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 13:38:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:38:38', 10);
INSERT INTO `sys_oper_log` VALUES (462, '单元信息', 3, 'com.ruoyi.web.controller.smart.SmtUnitController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/unit/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:38:44', 9);
INSERT INTO `sys_oper_log` VALUES (463, '楼栋信息', 1, 'com.ruoyi.web.controller.smart.SmtBuildController.add()', 'POST', 1, 'admin', NULL, '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":5,\"buildName\":\"E栋\",\"buildType\":\"1\",\"createTime\":\"2025-03-09 13:39:14\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:39:14', 7);
INSERT INTO `sys_oper_log` VALUES (464, '楼栋信息', 2, 'com.ruoyi.web.controller.smart.SmtBuildController.edit()', 'PUT', 1, 'admin', NULL, '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":5,\"buildName\":\"E栋1\",\"buildType\":\"2\",\"createBy\":\"\",\"createTime\":\"2025-03-09 13:39:15\",\"delFlag\":\"0\",\"orderNum\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 13:39:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:39:25', 7);
INSERT INTO `sys_oper_log` VALUES (465, '楼栋信息', 3, 'com.ruoyi.web.controller.smart.SmtBuildController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/build/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:39:33', 11);
INSERT INTO `sys_oper_log` VALUES (466, '停车场信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingLotController.add()', 'POST', 1, 'admin', NULL, '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 13:39:55\",\"params\":{},\"parkingLotId\":5,\"parkingLotName\":\"AA\",\"parkingLotType\":\"1\",\"totalSpace\":188}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:39:55', 14);
INSERT INTO `sys_oper_log` VALUES (467, '停车场信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingLotController.edit()', 'PUT', 1, 'admin', NULL, '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 13:39:55\",\"delFlag\":\"0\",\"orderNum\":0,\"params\":{},\"parkingLotId\":5,\"parkingLotName\":\"AA\",\"parkingLotType\":\"1\",\"status\":\"0\",\"totalSpace\":1881,\"updateBy\":\"\",\"updateTime\":\"2025-03-09 13:40:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:40:00', 12);
INSERT INTO `sys_oper_log` VALUES (468, '停车场信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingLotController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/park/lot/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:40:03', 9);
INSERT INTO `sys_oper_log` VALUES (469, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', NULL, '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 13:40:15\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":21,\"parkingSpaceNo\":\"1111\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:40:15', 17);
INSERT INTO `sys_oper_log` VALUES (470, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":true,\"attr\":{\"attrId\":4,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p1_20250309134144A002.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 13:41:50\",\"driveInTime\":\"2025-03-09 13:41:50\",\"ownerId\":100,\"params\":{},\"parkingRecordId\":2,\"parkingSpaceId\":1,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:41:50', 51);
INSERT INTO `sys_oper_log` VALUES (471, '车位使用信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.edit()', 'PUT', 1, 'admin', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"ownerId\":100,\"params\":{},\"parkingSpaceId\":1,\"plateNo\":\"京A88888\",\"updateTime\":\"2025-03-09 13:42:27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:42:27', 29);
INSERT INTO `sys_oper_log` VALUES (472, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.addRecordFee()', 'POST', 1, 'admin', NULL, '/smart/park/space/record/addRecordFee', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"\",\"createTime\":\"2025-03-09 13:41:50\",\"delFlag\":\"0\",\"driveInTime\":\"2025-03-09 13:41:50\",\"driveOutTime\":\"2025-03-09 13:42:28\",\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"owner-test@qq.com\",\"nickName\":\"赵子龙\",\"params\":{},\"phonenumber\":\"18678456789\",\"sex\":\"0\",\"userId\":100,\"userName\":\"owner-test\"},\"ownerId\":100,\"params\":{},\"parkingRecordId\":2,\"parkingRent\":{\"endTime\":\"2025-03-31\",\"feeId\":4,\"params\":{},\"parkingRentId\":4,\"parkingSpaceId\":1,\"rentAmount\":900,\"startTime\":\"2025-03-01\"},\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":1,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":1,\"plateNo\":\"京A88888\",\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:43:05', 40);
INSERT INTO `sys_oper_log` VALUES (473, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', NULL, '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 13:44:01\",\"endTime\":\"2025-03-31\",\"feeId\":4,\"ownerId\":2,\"params\":{},\"parkingRentId\":5,\"parkingSpaceId\":14,\"rentAmount\":900,\"startTime\":\"2025-03-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:44:01', 10);
INSERT INTO `sys_oper_log` VALUES (474, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', NULL, '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 13:44:02\",\"delFlag\":\"0\",\"endTime\":\"2025-03-31\",\"fee\":{\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":30},\"feeId\":4,\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRentId\":5,\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":14,\"parkingSpaceNo\":\"F0002\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":14,\"rentAmount\":900,\"startTime\":\"2025-03-01\",\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:44:19', 27);
INSERT INTO `sys_oper_log` VALUES (475, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', NULL, '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3,4,2\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:45:19', 18);
INSERT INTO `sys_oper_log` VALUES (476, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthParkingSpace()', 'PUT', 1, 'admin', NULL, '/system/user/authParkingSpace', '127.0.0.1', '内网IP', '{\"parkingSpaceIds\":\"1,8,14,7\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:45:31', 14);
INSERT INTO `sys_oper_log` VALUES (477, '收费信息', 1, 'com.ruoyi.web.controller.smart.SmtFeeController.add()', 'POST', 1, 'admin', NULL, '/smart/fee', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 13:45:49\",\"feeId\":5,\"feeName\":\"test\",\"feeType\":\"1\",\"num\":1,\"params\":{},\"price\":1,\"remark\":\"1\",\"unit\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:45:49', 10);
INSERT INTO `sys_oper_log` VALUES (478, '收费信息', 2, 'com.ruoyi.web.controller.smart.SmtFeeController.edit()', 'PUT', 1, 'admin', NULL, '/smart/fee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 13:45:49\",\"delFlag\":\"0\",\"feeId\":5,\"feeName\":\"test1\",\"feeType\":\"1\",\"num\":11,\"orderNum\":0,\"params\":{},\"price\":11,\"remark\":\"11\",\"status\":\"0\",\"unit\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 13:45:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:45:55', 11);
INSERT INTO `sys_oper_log` VALUES (479, '收费信息', 3, 'com.ruoyi.web.controller.smart.SmtFeeController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/fee/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:45:58', 7);
INSERT INTO `sys_oper_log` VALUES (480, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.add()', 'POST', 1, 'admin', NULL, '/smart/fee/record', '127.0.0.1', '内网IP', '{\"amount\":100,\"createTime\":\"2025-03-09 13:46:11\",\"display\":\"100\",\"feeId\":2,\"feeRecordId\":2,\"month\":\"2025-03\",\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:46:12', 15);
INSERT INTO `sys_oper_log` VALUES (481, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.addCommonFee()', 'POST', 1, 'admin', NULL, '/smart/fee/record/addCommonFee', '127.0.0.1', '内网IP', '{\"amount\":100,\"createBy\":\"\",\"createTime\":\"2025-03-09 13:46:12\",\"delFlag\":\"0\",\"display\":\"100\",\"fee\":{\"feeId\":2,\"feeName\":\"电费\",\"feeType\":\"1\",\"num\":1,\"params\":{},\"price\":1},\"feeId\":2,\"feeRecordId\":2,\"feeStatus\":\"0\",\"month\":\"2025-03\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:46:17', 25);
INSERT INTO `sys_oper_log` VALUES (482, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":5,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:47:23', 10);
INSERT INTO `sys_oper_log` VALUES (483, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":6,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:47:31', 9);
INSERT INTO `sys_oper_log` VALUES (484, '投诉信息', 1, 'com.ruoyi.web.controller.smart.SmtComplainController.add()', 'POST', 1, 'ry', NULL, '/smart/complain', '127.0.0.1', '内网IP', '{\"complainId\":3,\"content\":\"<p>tt</p>\",\"createTime\":\"2025-03-09 13:49:08\",\"ownerId\":2,\"params\":{},\"title\":\"tt\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:49:08', 13);
INSERT INTO `sys_oper_log` VALUES (485, '维修信息', 1, 'com.ruoyi.web.controller.smart.SmtRepairController.add()', 'POST', 1, 'ry', NULL, '/smart/repair', '127.0.0.1', '内网IP', '{\"address\":\"t\",\"content\":\"<p>t</p>\",\"createTime\":\"2025-03-09 13:49:18\",\"ownerId\":2,\"params\":{},\"phone\":\"t\",\"remark\":\"t\",\"repairId\":3,\"title\":\"t\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:49:18', 9);
INSERT INTO `sys_oper_log` VALUES (486, '维修信息', 1, 'com.ruoyi.web.controller.smart.SmtRepairController.add()', 'POST', 1, 'ry', NULL, '/smart/repair', '127.0.0.1', '内网IP', '{\"address\":\"1\",\"content\":\"<p>1</p>\",\"createTime\":\"2025-03-09 13:49:41\",\"ownerId\":2,\"params\":{},\"phone\":\"1\",\"remark\":\"1\",\"repairId\":4,\"title\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:49:41', 10);
INSERT INTO `sys_oper_log` VALUES (487, '投诉信息', 1, 'com.ruoyi.web.controller.smart.SmtComplainController.add()', 'POST', 1, 'ry', NULL, '/smart/complain', '127.0.0.1', '内网IP', '{\"complainId\":4,\"content\":\"<p>2</p>\",\"createTime\":\"2025-03-09 13:49:48\",\"ownerId\":2,\"params\":{},\"remark\":\"2\",\"title\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:49:48', 9);
INSERT INTO `sys_oper_log` VALUES (488, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtRepairController.changeStatus()', 'PUT', 1, 'admin', NULL, '/smart/repair/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"repairId\":4,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:49:55', 9);
INSERT INTO `sys_oper_log` VALUES (489, '投诉管理', 2, 'com.ruoyi.web.controller.smart.SmtComplainController.changeStatus()', 'PUT', 1, 'admin', NULL, '/smart/complain/changeStatus', '127.0.0.1', '内网IP', '{\"complainId\":4,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 13:50:02', 6);
INSERT INTO `sys_oper_log` VALUES (490, '楼栋信息', 1, 'com.ruoyi.web.controller.smart.SmtBuildController.add()', 'POST', 1, 'admin', NULL, '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":6,\"buildName\":\"x\",\"buildType\":\"1\",\"createTime\":\"2025-03-09 14:05:51\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:05:51', 222);
INSERT INTO `sys_oper_log` VALUES (491, '楼栋信息', 2, 'com.ruoyi.web.controller.smart.SmtBuildController.edit()', 'PUT', 1, 'admin', NULL, '/smart/build', '127.0.0.1', '内网IP', '{\"buildId\":6,\"buildName\":\"x1\",\"buildType\":\"2\",\"createBy\":\"\",\"createTime\":\"2025-03-09 14:05:51\",\"delFlag\":\"0\",\"orderNum\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:05:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:05:56', 12);
INSERT INTO `sys_oper_log` VALUES (492, '楼栋信息', 3, 'com.ruoyi.web.controller.smart.SmtBuildController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/build/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:05:59', 14);
INSERT INTO `sys_oper_log` VALUES (493, '单元信息', 1, 'com.ruoyi.web.controller.smart.SmtUnitController.add()', 'POST', 1, 'admin', NULL, '/smart/unit', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-09 14:06:21\",\"orderNum\":1,\"params\":{},\"unitId\":7,\"unitName\":\"li\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:06:21', 16);
INSERT INTO `sys_oper_log` VALUES (494, '单元信息', 2, 'com.ruoyi.web.controller.smart.SmtUnitController.edit()', 'PUT', 1, 'admin', NULL, '/smart/unit', '127.0.0.1', '内网IP', '{\"build\":{\"buildId\":1,\"params\":{}},\"buildId\":1,\"createBy\":\"\",\"createTime\":\"2025-03-09 14:06:21\",\"delFlag\":\"0\",\"orderNum\":1,\"params\":{},\"remark\":\"1\",\"status\":\"0\",\"unitId\":7,\"unitName\":\"li\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:06:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:06:30', 8);
INSERT INTO `sys_oper_log` VALUES (495, '单元信息', 2, 'com.ruoyi.web.controller.smart.SmtUnitController.edit()', 'PUT', 1, 'admin', NULL, '/smart/unit', '127.0.0.1', '内网IP', '{\"build\":{\"buildId\":1,\"params\":{}},\"buildId\":1,\"createBy\":\"\",\"createTime\":\"2025-03-09 14:06:21\",\"delFlag\":\"0\",\"orderNum\":1,\"params\":{},\"remark\":\"1\",\"status\":\"0\",\"unitId\":7,\"unitName\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:06:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:06:34', 8);
INSERT INTO `sys_oper_log` VALUES (496, '单元信息', 3, 'com.ruoyi.web.controller.smart.SmtUnitController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/unit/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:06:36', 9);
INSERT INTO `sys_oper_log` VALUES (497, '房屋信息', 1, 'com.ruoyi.web.controller.smart.SmtHouseController.add()', 'POST', 1, 'admin', NULL, '/smart/house', '127.0.0.1', '内网IP', '{\"buildId\":1,\"createTime\":\"2025-03-09 14:06:58\",\"flag\":false,\"houseArea\":120,\"houseId\":7,\"houseNo\":\"11122\",\"houseType\":\"1\",\"params\":{},\"unitId\":2,\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:06:58', 16);
INSERT INTO `sys_oper_log` VALUES (498, '房屋信息', 2, 'com.ruoyi.web.controller.smart.SmtHouseController.edit()', 'PUT', 1, 'admin', NULL, '/smart/house', '127.0.0.1', '内网IP', '{\"build\":{\"buildId\":1,\"params\":{}},\"buildId\":1,\"createBy\":\"\",\"createTime\":\"2025-03-09 14:06:58\",\"delFlag\":\"0\",\"flag\":false,\"houseArea\":120,\"houseId\":7,\"houseNo\":\"111\",\"houseType\":\"1\",\"orderNum\":0,\"params\":{},\"status\":\"0\",\"unit\":{\"buildId\":1,\"params\":{},\"unitId\":2},\"unitId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:07:05\",\"useStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:07:05', 9);
INSERT INTO `sys_oper_log` VALUES (499, '房屋信息', 3, 'com.ruoyi.web.controller.smart.SmtHouseController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/house/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:07:07', 6);
INSERT INTO `sys_oper_log` VALUES (500, '停车场信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingLotController.add()', 'POST', 1, 'admin', NULL, '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 14:07:39\",\"params\":{},\"parkingLotId\":6,\"parkingLotName\":\"t\",\"parkingLotType\":\"1\",\"totalSpace\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:07:39', 15);
INSERT INTO `sys_oper_log` VALUES (501, '停车场信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingLotController.edit()', 'PUT', 1, 'admin', NULL, '/smart/park/lot', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 14:07:39\",\"delFlag\":\"0\",\"orderNum\":0,\"params\":{},\"parkingLotId\":6,\"parkingLotName\":\"3\",\"parkingLotType\":\"2\",\"status\":\"0\",\"totalSpace\":111,\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:07:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:07:45', 9);
INSERT INTO `sys_oper_log` VALUES (502, '停车场信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingLotController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/park/lot/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:07:47', 6);
INSERT INTO `sys_oper_log` VALUES (503, '车位信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.add()', 'POST', 1, 'admin', NULL, '/smart/park/space', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 14:08:18\",\"flag\":false,\"params\":{},\"parkingLotId\":1,\"parkingSpaceId\":22,\"parkingSpaceNo\":\"111\",\"parkingSpaceType\":\"0\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:08:18', 12);
INSERT INTO `sys_oper_log` VALUES (504, '车位信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.edit()', 'PUT', 1, 'admin', NULL, '/smart/park/space', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 14:08:19\",\"delFlag\":\"0\",\"flag\":false,\"orderNum\":0,\"params\":{},\"parkingLot\":{\"params\":{},\"parkingLotId\":1},\"parkingLotId\":1,\"parkingSpaceId\":22,\"parkingSpaceNo\":\"1112\",\"parkingSpaceStatus\":\"0\",\"parkingSpaceType\":\"1\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:08:31\",\"useCount\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:08:31', 11);
INSERT INTO `sys_oper_log` VALUES (505, '车位信息', 3, 'com.ruoyi.web.controller.smart.SmtParkingSpaceController.remove()', 'DELETE', 1, 'admin', NULL, '/smart/park/space/22', '127.0.0.1', '内网IP', '[22]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:08:34', 6);
INSERT INTO `sys_oper_log` VALUES (506, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'admin', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":true,\"attr\":{\"attrId\":6,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p1_20250309140857A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 14:09:41\",\"driveInTime\":\"2025-03-09 14:09:41\",\"ownerId\":100,\"params\":{},\"parkingRecordId\":3,\"parkingSpaceId\":4,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:09:41', 51);
INSERT INTO `sys_oper_log` VALUES (507, '车位使用信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.edit()', 'PUT', 1, 'admin', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"ownerId\":100,\"params\":{},\"parkingSpaceId\":4,\"plateNo\":\"京A88888\",\"updateTime\":\"2025-03-09 14:10:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:10:00', 26);
INSERT INTO `sys_oper_log` VALUES (508, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.addRecordFee()', 'POST', 1, 'admin', NULL, '/smart/park/space/record/addRecordFee', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"\",\"createTime\":\"2025-03-09 14:09:42\",\"delFlag\":\"0\",\"driveInTime\":\"2025-03-09 14:09:42\",\"driveOutTime\":\"2025-03-09 15:10:01\",\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"owner-test@qq.com\",\"nickName\":\"赵子龙\",\"params\":{},\"phonenumber\":\"18678456789\",\"sex\":\"0\",\"userId\":100,\"userName\":\"owner-test\"},\"ownerId\":100,\"params\":{},\"parkingRecordId\":3,\"parkingRent\":{\"params\":{},\"parkingSpaceId\":4},\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":4,\"parkingSpaceNo\":\"X0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":4,\"plateNo\":\"京A88888\",\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:10:30', 41);
INSERT INTO `sys_oper_log` VALUES (509, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.add()', 'POST', 1, 'admin', NULL, '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-03-09 14:11:21\",\"endTime\":\"2025-03-31\",\"feeId\":4,\"ownerId\":2,\"params\":{},\"parkingRentId\":6,\"parkingSpaceId\":7,\"rentAmount\":900,\"startTime\":\"2025-03-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:11:21', 12);
INSERT INTO `sys_oper_log` VALUES (510, '车位租赁信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingRentController.edit()', 'PUT', 1, 'admin', NULL, '/smart/park/rent', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 14:11:22\",\"delFlag\":\"0\",\"endTime\":\"2025-03-31\",\"fee\":{\"feeId\":4,\"params\":{}},\"feeId\":4,\"feeStatus\":\"0\",\"orderNum\":0,\"ownerId\":2,\"params\":{},\"parkingRentId\":6,\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":7,\"useCount\":0},\"parkingSpaceId\":7,\"rentAmount\":899,\"startTime\":\"2025-03-01\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:11:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:11:43', 35);
INSERT INTO `sys_oper_log` VALUES (511, '车位租赁信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingRentController.addFee()', 'POST', 1, 'admin', NULL, '/smart/park/rent/addFee', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-03-09 14:11:22\",\"delFlag\":\"0\",\"endTime\":\"2025-03-31\",\"fee\":{\"feeId\":4,\"feeName\":\"车位租赁费\",\"feeType\":\"4\",\"num\":1,\"params\":{},\"price\":30},\"feeId\":4,\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRentId\":6,\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":7,\"parkingSpaceNo\":\"F0001\",\"parkingSpaceStatus\":\"0\",\"useCount\":0},\"parkingSpaceId\":7,\"rentAmount\":899,\"startTime\":\"2025-03-01\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 14:11:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:11:46', 27);
INSERT INTO `sys_oper_log` VALUES (512, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', NULL, '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,2,3,4,5\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:12:59', 15);
INSERT INTO `sys_oper_log` VALUES (513, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', NULL, '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,2,4,5\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:13:08', 11);
INSERT INTO `sys_oper_log` VALUES (514, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthParkingSpace()', 'PUT', 1, 'admin', NULL, '/system/user/authParkingSpace', '127.0.0.1', '内网IP', '{\"parkingSpaceIds\":\"1,7,8,14,3\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:13:15', 16);
INSERT INTO `sys_oper_log` VALUES (515, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":9,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:13:42', 13);
INSERT INTO `sys_oper_log` VALUES (516, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.add()', 'POST', 1, 'admin', NULL, '/smart/fee/record', '127.0.0.1', '内网IP', '{\"amount\":100,\"createTime\":\"2025-03-09 14:14:03\",\"display\":\"100\",\"feeId\":2,\"feeRecordId\":3,\"month\":\"2025-03\",\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:14:03', 17);
INSERT INTO `sys_oper_log` VALUES (517, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.add()', 'POST', 1, 'admin', NULL, '/smart/fee/record', '127.0.0.1', '内网IP', '{\"amount\":120,\"createTime\":\"2025-03-09 14:14:19\",\"display\":\"120\",\"feeId\":2,\"feeRecordId\":4,\"month\":\"2025-02\",\"ownerId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:14:19', 9);
INSERT INTO `sys_oper_log` VALUES (518, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.addCommonFee()', 'POST', 1, 'admin', NULL, '/smart/fee/record/addCommonFee', '127.0.0.1', '内网IP', '{\"amount\":100,\"createBy\":\"\",\"createTime\":\"2025-03-09 14:14:04\",\"delFlag\":\"0\",\"display\":\"100\",\"fee\":{\"feeId\":2,\"feeName\":\"电费\",\"feeType\":\"1\",\"num\":1,\"params\":{},\"price\":1},\"feeId\":2,\"feeRecordId\":3,\"feeStatus\":\"0\",\"month\":\"2025-03\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:14:23', 28);
INSERT INTO `sys_oper_log` VALUES (519, '收费记录', 1, 'com.ruoyi.web.controller.smart.SmtFeeRecordController.addCommonFee()', 'POST', 1, 'admin', NULL, '/smart/fee/record/addCommonFee', '127.0.0.1', '内网IP', '{\"amount\":120,\"createBy\":\"\",\"createTime\":\"2025-03-09 14:14:20\",\"delFlag\":\"0\",\"display\":\"120\",\"fee\":{\"feeId\":2,\"feeName\":\"电费\",\"feeType\":\"1\",\"num\":1,\"params\":{},\"price\":1},\"feeId\":2,\"feeRecordId\":4,\"feeStatus\":\"0\",\"month\":\"2025-02\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"status\":\"0\",\"updateBy\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:14:25', 25);
INSERT INTO `sys_oper_log` VALUES (520, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":11,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:14:40', 6);
INSERT INTO `sys_oper_log` VALUES (521, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":12,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:14:43', 6);
INSERT INTO `sys_oper_log` VALUES (522, '维修信息', 1, 'com.ruoyi.web.controller.smart.SmtRepairController.add()', 'POST', 1, 'ry', NULL, '/smart/repair', '127.0.0.1', '内网IP', '{\"address\":\"测试\",\"content\":\"<p>测试</p>\",\"createTime\":\"2025-03-09 14:14:57\",\"ownerId\":2,\"params\":{},\"phone\":\"测试\",\"repairId\":5,\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:14:57', 13);
INSERT INTO `sys_oper_log` VALUES (523, '投诉信息', 1, 'com.ruoyi.web.controller.smart.SmtComplainController.add()', 'POST', 1, 'ry', NULL, '/smart/complain', '127.0.0.1', '内网IP', '{\"complainId\":5,\"content\":\"<p>f</p>\",\"createTime\":\"2025-03-09 14:15:05\",\"ownerId\":2,\"params\":{},\"title\":\"teea\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:15:05', 9);
INSERT INTO `sys_oper_log` VALUES (524, '楼栋管理', 2, 'com.ruoyi.web.controller.smart.SmtRepairController.changeStatus()', 'PUT', 1, 'admin', NULL, '/smart/repair/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"repairId\":5,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:15:15', 5);
INSERT INTO `sys_oper_log` VALUES (525, '投诉管理', 2, 'com.ruoyi.web.controller.smart.SmtComplainController.changeStatus()', 'PUT', 1, 'admin', NULL, '/smart/complain/changeStatus', '127.0.0.1', '内网IP', '{\"complainId\":5,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:15:21', 12);
INSERT INTO `sys_oper_log` VALUES (526, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', NULL, '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"1,3,4\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:36:47', 142);
INSERT INTO `sys_oper_log` VALUES (527, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthHouse()', 'PUT', 1, 'admin', NULL, '/system/user/authHouse', '127.0.0.1', '内网IP', '{\"houseIds\":\"2,5\",\"ownerId\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:36:54', 14);
INSERT INTO `sys_oper_log` VALUES (528, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthParkingSpace()', 'PUT', 1, 'admin', NULL, '/system/user/authParkingSpace', '127.0.0.1', '内网IP', '{\"parkingSpaceIds\":\"1,7,13\",\"ownerId\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:37:10', 11);
INSERT INTO `sys_oper_log` VALUES (529, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthParkingSpace()', 'PUT', 1, 'admin', NULL, '/system/user/authParkingSpace', '127.0.0.1', '内网IP', '{\"parkingSpaceIds\":\"2,8,15\",\"ownerId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 14:37:26', 15);
INSERT INTO `sys_oper_log` VALUES (530, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"驶入\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2005,\"perms\":\"smart:park:space:in\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:08:26', 227);
INSERT INTO `sys_oper_log` VALUES (531, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"驶出\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2005,\"perms\":\"smart:park:space:out\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:08:45', 13);
INSERT INTO `sys_oper_log` VALUES (532, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-27 03:41:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005,2007,2008,2012,2080,2014,2015,2016,2017,2037,2087,2088,2046,2051,2052,2081,2085,2068,2069,2070,2064,2065,2066],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:09:10', 58);
INSERT INTO `sys_oper_log` VALUES (533, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'ry', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"attr\":{\"attrId\":8,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p1_20250309152315A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 15:24:46\",\"driveInTime\":\"2025-03-09 15:24:46\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":1,\"parkingSpaceId\":2,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:24:46', 222);
INSERT INTO `sys_oper_log` VALUES (534, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'owner-test', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"attr\":{\"attrId\":9,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p3_20250309152541A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 15:25:44\",\"driveInTime\":\"2025-03-09 15:25:44\",\"ownerId\":100,\"params\":{},\"parkingRecordId\":2,\"parkingSpaceId\":4,\"plateNo\":\"粤R888G8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:25:44', 24);
INSERT INTO `sys_oper_log` VALUES (535, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"驶出\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2006,\"perms\":\"smart:park:space:record:out\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:33:32', 18);
INSERT INTO `sys_oper_log` VALUES (536, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-27 03:41:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005,2006,2007,2008,2012,2080,2014,2015,2016,2017,2037,2087,2088,2042,2089,2046,2051,2052,2081,2085,2068,2069,2070,2064,2065,2066],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:33:45', 30);
INSERT INTO `sys_oper_log` VALUES (537, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-27 03:41:41\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2004,2005,2006,2007,2008,2012,2080,2014,2015,2016,2017,2037,2087,2042,2089,2046,2051,2052,2081,2085,2068,2069,2070,2064,2065,2066],\"params\":{},\"roleId\":100,\"roleKey\":\"owner\",\"roleName\":\"业主\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:35:41', 66);
INSERT INTO `sys_oper_log` VALUES (538, '车位使用信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.edit()', 'PUT', 1, 'ry', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"driveOutTime\":\"2025-03-09 15:40:38\",\"driveStatus\":\"0\",\"params\":{},\"parkingRecordId\":1,\"updateTime\":\"2025-03-09 15:40:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:40:39', 52);
INSERT INTO `sys_oper_log` VALUES (539, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'ry', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"attr\":{\"attrId\":1,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p1_20250309154245A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 15:42:49\",\"driveInTime\":\"2025-03-09 15:42:49\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":3,\"parkingSpaceId\":5,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:42:49', 50);
INSERT INTO `sys_oper_log` VALUES (540, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'ry', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"attr\":{\"attrId\":1,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p1_20250309154802A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 15:48:11\",\"driveInTime\":\"2025-03-09 15:48:11\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":11,\"parkingSpaceId\":2,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:48:59', 52830);
INSERT INTO `sys_oper_log` VALUES (541, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'ry', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"attr\":{\"attrId\":1,\"attrName\":\"p1.jpg\",\"attrText\":\"京A88888\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p1_20250309155107A001.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 15:51:11\",\"driveInTime\":\"2025-03-09 15:51:11\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":8,\"parkingSpaceId\":2,\"plateNo\":\"京A88888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:51:41', 30628);
INSERT INTO `sys_oper_log` VALUES (542, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.add()', 'POST', 1, 'ry', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"attr\":{\"attrId\":1,\"attrName\":\"p3.jpg\",\"attrText\":\"粤R888G8\",\"attrUrl\":\"/dev-api/profile/upload/2025/03/09/p3_20250309155547A002.jpg\",\"params\":{}},\"createTime\":\"2025-03-09 15:55:51\",\"driveInTime\":\"2025-03-09 15:55:51\",\"ownerId\":2,\"params\":{},\"parkingRecordId\":1,\"parkingSpaceId\":2,\"plateNo\":\"粤R888G8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:55:51', 30);
INSERT INTO `sys_oper_log` VALUES (543, '车位使用信息', 2, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.edit()', 'PUT', 1, 'ry', NULL, '/smart/park/space/record', '127.0.0.1', '内网IP', '{\"admin\":false,\"driveOutTime\":\"2025-03-09 15:55:57\",\"driveStatus\":\"0\",\"params\":{},\"parkingRecordId\":1,\"updateTime\":\"2025-03-09 15:55:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 15:55:57', 10);
INSERT INTO `sys_oper_log` VALUES (544, '车位使用信息', 1, 'com.ruoyi.web.controller.smart.SmtParkingSpaceRecordController.addRecordFee()', 'POST', 1, 'admin', NULL, '/smart/park/space/record/addRecordFee', '127.0.0.1', '内网IP', '{\"admin\":true,\"attr\":{\"attrId\":1,\"attrName\":\"p3.jpg\",\"attrNewName\":\"p3_20250309155547A002.jpg\",\"attrUrl\":\"/profile/upload/2025/03/09/p3_20250309155547A002.jpg\",\"bizId\":1,\"params\":{}},\"createBy\":\"admin\",\"createTime\":\"2025-03-09 15:55:52\",\"delFlag\":\"0\",\"driveInTime\":\"2025-03-09 15:55:52\",\"driveOutTime\":\"2025-03-09 15:55:58\",\"feeStatus\":\"0\",\"orderNum\":0,\"owner\":{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"userId\":2,\"userName\":\"ry\"},\"ownerId\":2,\"params\":{},\"parkingRecordId\":1,\"parkingRent\":{\"params\":{},\"parkingSpaceId\":2},\"parkingSpace\":{\"flag\":false,\"params\":{},\"parkingSpaceId\":2,\"parkingSpaceNo\":\"F0002\",\"parkingSpaceStatus\":\"1\",\"useCount\":0},\"parkingSpaceId\":2,\"plateNo\":\"粤R888G8\",\"status\":\"0\",\"updateBy\":\"\",\"updateTime\":\"2025-03-09 15:55:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 16:00:12', 53);
INSERT INTO `sys_oper_log` VALUES (545, '车位租赁管理', 2, 'com.ruoyi.web.controller.smart.SmtFeeListController.changeStatus()', 'PUT', 1, 'ry', NULL, '/smart/fee/list/changeStatus', '127.0.0.1', '内网IP', '{\"feeListId\":1,\"params\":{},\"payStatus\":\"1\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-09 16:00:23', 13);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-02-23 00:49:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-02-23 00:49:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-02-23 00:49:57', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '业主', 'owner', 3, '1', 1, 1, '0', '0', 'admin', '2025-02-27 03:41:41', 'admin', '2025-03-09 15:35:41', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2064);
INSERT INTO `sys_role_menu` VALUES (100, 2065);
INSERT INTO `sys_role_menu` VALUES (100, 2066);
INSERT INTO `sys_role_menu` VALUES (100, 2068);
INSERT INTO `sys_role_menu` VALUES (100, 2069);
INSERT INTO `sys_role_menu` VALUES (100, 2070);
INSERT INTO `sys_role_menu` VALUES (100, 2080);
INSERT INTO `sys_role_menu` VALUES (100, 2081);
INSERT INTO `sys_role_menu` VALUES (100, 2085);
INSERT INTO `sys_role_menu` VALUES (100, 2087);
INSERT INTO `sys_role_menu` VALUES (100, 2089);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '11' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-09 15:43:35', 'admin', '2025-02-23 00:49:57', '', '2025-03-09 15:43:34', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '11', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-09 15:44:11', 'admin', '2025-02-23 00:49:57', '', '2025-03-09 15:44:10', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'owner-test', '赵子龙', '11', 'owner-test@qq.com', '18678456789', '0', '', '$2a$10$hOQsnZgu7ILm6TLrqAHykuWGoF77tSpneeBKBSqTOigBvcH0uLYsa', '0', '0', '127.0.0.1', '2025-03-09 15:35:52', 'admin', '2025-03-09 10:43:44', '', '2025-03-09 15:35:52', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 100);
INSERT INTO `sys_user_role` VALUES (100, 100);

SET FOREIGN_KEY_CHECKS = 1;
