
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for smt_build
-- ----------------------------
DROP TABLE IF EXISTS `smt_build`;
CREATE TABLE `smt_build`  (
  `build_id` bigint NOT NULL AUTO_INCREMENT COMMENT '楼栋id',
  `build_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '楼栋名称',
  `build_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '楼栋类型',
  PRIMARY KEY (`build_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '楼栋信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_build
-- ----------------------------


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
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`complain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投诉信息' ROW_FORMAT = DYNAMIC;

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
  `fee_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租赁类型',
  `unit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `price` decimal(30, 0) NULL DEFAULT NULL COMMENT '单价',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  PRIMARY KEY (`fee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收费信息' ROW_FORMAT = DYNAMIC;




DROP TABLE IF EXISTS `smt_fee_list`;
CREATE TABLE `smt_fee_list`  (
  `fee_list_id` bigint NOT NULL AUTO_INCREMENT COMMENT '收费记录id',
  `fee_id` bigint NOT NULL COMMENT '收费id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '费用标题',
  `amount` decimal(30, 0) NULL DEFAULT NULL COMMENT '费用',
  `pay_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`fee_list_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '费用清单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_fee_list
-- ----------------------------

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
  `display` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表显',
  PRIMARY KEY (`fee_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收费记录' ROW_FORMAT = DYNAMIC;

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
  `house_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '户型',
  PRIMARY KEY (`house_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房屋信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_house
-- ----------------------------
-- ----------------------------
-- Table structure for smt_owner
-- ----------------------------
DROP TABLE IF EXISTS `smt_owner`;
CREATE TABLE `smt_owner`  (
  `owner_id` bigint NOT NULL AUTO_INCREMENT COMMENT '业主ID',
  `owner_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业主姓名',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '业主邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '业主性别',
  PRIMARY KEY (`owner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业主' ROW_FORMAT = DYNAMIC;

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
  PRIMARY KEY (`owner_house_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业主房屋信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_owner_house
-- ----------------------------

-- ----------------------------
-- Table structure for smt_owner_parking_space
-- ----------------------------
DROP TABLE IF EXISTS `smt_owner_parking_space`;
CREATE TABLE `smt_owner_parking_space`  (
  `owner_parking_id` bigint NOT NULL AUTO_INCREMENT COMMENT '业主车位id',
  `parking_space_id` bigint NOT NULL COMMENT '车位id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  PRIMARY KEY (`owner_parking_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业主车位信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_owner_parking_space
-- ----------------------------

-- ----------------------------
-- Table structure for smt_parking_lot
-- ----------------------------
DROP TABLE IF EXISTS `smt_parking_lot`;
CREATE TABLE `smt_parking_lot`  (
  `parking_lot_id` bigint NOT NULL AUTO_INCREMENT COMMENT '停车场id',
  `parking_lot_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '停车场名称',
  `parking_lot_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '停车场类型',
  `total_space` int NULL DEFAULT NULL COMMENT '车位总数',

  PRIMARY KEY (`parking_lot_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '停车场信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_parking_lot
-- ----------------------------

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
  PRIMARY KEY (`parking_rent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位租赁信息' ROW_FORMAT = DYNAMIC;

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
  PRIMARY KEY (`parking_rent_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位租赁记录' ROW_FORMAT = DYNAMIC;

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
  `parking_space_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '车位类型',
  `parking_space_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '车位状态',
  `parking_lot_id` int NULL DEFAULT NULL COMMENT '停车场id',

  PRIMARY KEY (`parking_space_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_parking_space
-- ----------------------------

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
  PRIMARY KEY (`parking_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车位使用信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_parking_space_record

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

  PRIMARY KEY (`repair_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '维修信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_repair
-- ----------------------------
---------------------
-- Table structure for smt_unit
-- ----------------------------
DROP TABLE IF EXISTS `smt_unit`;
CREATE TABLE `smt_unit`  (
  `unit_id` bigint NOT NULL AUTO_INCREMENT COMMENT '单元id',
  `build_id` bigint NOT NULL COMMENT '楼栋id',
  `unit_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '单元名称',

  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '单元信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of smt_unit
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
