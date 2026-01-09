/*
 Navicat Premium Data Transfer

 Source Server         : 局域网mysql
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 192.168.31.90:3306
 Source Schema         : DJH_AgentFlowDB

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 09/01/2026 19:16:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理等级',
  `commission_balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金余额',
  `invite_count` int(11) NOT NULL DEFAULT 0 COMMENT '邀请人数',
  `hand_count` int(11) NOT NULL DEFAULT 0 COMMENT '手牌数',
  `assessment_start_time` datetime(0) NULL DEFAULT NULL COMMENT '考核开始时间',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间（逻辑删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent
-- ----------------------------

-- ----------------------------
-- Table structure for agent_level_config
-- ----------------------------
DROP TABLE IF EXISTS `agent_level_config`;
CREATE TABLE `agent_level_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1,初级代理，2、高级代理',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '等级值',
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理等级名称',
  `upgrade_condition` json NULL COMMENT '升级条件',
  `retain_condition` json NULL COMMENT '保级考核条件',
  `promotion_condition` json NULL COMMENT '晋升考核条件',
  `commission_config` json NULL COMMENT '提佣配置',
  `rebate_config` json NULL COMMENT '返佣配置',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间（逻辑删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_level_config
-- ----------------------------

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_casbin_rule`(`ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES (2, 'p', '888', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (5, 'p', '888', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (8, 'p', '888', '/api/deleteApisByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (11, 'p', '888', '/api/enterSyncApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (7, 'p', '888', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (4, 'p', '888', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (10, 'p', '888', '/api/getApiGroups', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (3, 'p', '888', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (12, 'p', '888', '/api/ignoreApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (9, 'p', '888', '/api/syncApi', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (6, 'p', '888', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (139, 'p', '888', '/attachmentCategory/addCategory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (140, 'p', '888', '/attachmentCategory/deleteCategory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (138, 'p', '888', '/attachmentCategory/getCategoryList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (13, 'p', '888', '/authority/copyAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (15, 'p', '888', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (16, 'p', '888', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (17, 'p', '888', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (18, 'p', '888', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (14, 'p', '888', '/authority/updateAuthority', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (107, 'p', '888', '/authorityBtn/canRemoveAuthorityBtn', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (106, 'p', '888', '/authorityBtn/getAuthorityBtn', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (105, 'p', '888', '/authorityBtn/setAuthorityBtn', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (74, 'p', '888', '/autoCode/addFunc', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (67, 'p', '888', '/autoCode/createPackage', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (71, 'p', '888', '/autoCode/createPlug', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (64, 'p', '888', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (70, 'p', '888', '/autoCode/delPackage', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (65, 'p', '888', '/autoCode/delSysHistory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (62, 'p', '888', '/autoCode/getColumn', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (58, 'p', '888', '/autoCode/getDB', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (59, 'p', '888', '/autoCode/getMeta', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (69, 'p', '888', '/autoCode/getPackage', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (66, 'p', '888', '/autoCode/getSysHistory', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (61, 'p', '888', '/autoCode/getTables', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (68, 'p', '888', '/autoCode/getTemplates', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (72, 'p', '888', '/autoCode/installPlugin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (75, 'p', '888', '/autoCode/mcp', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (77, 'p', '888', '/autoCode/mcpList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (76, 'p', '888', '/autoCode/mcpTest', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (60, 'p', '888', '/autoCode/preview', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (73, 'p', '888', '/autoCode/pubPlug', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (63, 'p', '888', '/autoCode/rollback', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (48, 'p', '888', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (47, 'p', '888', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (56, 'p', '888', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (53, 'p', '888', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (55, 'p', '888', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (54, 'p', '888', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (57, 'p', '888', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (100, 'p', '888', '/email/emailTest', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (101, 'p', '888', '/email/sendEmail', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (40, 'p', '888', '/fileUploadAndDownload/breakpointContinue', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (39, 'p', '888', '/fileUploadAndDownload/breakpointContinueFinish', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (43, 'p', '888', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (44, 'p', '888', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (38, 'p', '888', '/fileUploadAndDownload/findFile', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (45, 'p', '888', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (46, 'p', '888', '/fileUploadAndDownload/importURL', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (41, 'p', '888', '/fileUploadAndDownload/removeChunk', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (42, 'p', '888', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (125, 'p', '888', '/info/createInfo', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (126, 'p', '888', '/info/deleteInfo', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (127, 'p', '888', '/info/deleteInfoByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (129, 'p', '888', '/info/findInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (130, 'p', '888', '/info/getInfoList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (128, 'p', '888', '/info/updateInfo', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (49, 'p', '888', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (21, 'p', '888', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (23, 'p', '888', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (25, 'p', '888', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (27, 'p', '888', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (22, 'p', '888', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (19, 'p', '888', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (24, 'p', '888', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (20, 'p', '888', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (26, 'p', '888', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (103, 'p', '888', '/simpleUploader/checkFileMd5', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (104, 'p', '888', '/simpleUploader/mergeFileMd5', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (102, 'p', '888', '/simpleUploader/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (90, 'p', '888', '/sysDictionary/createSysDictionary', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (91, 'p', '888', '/sysDictionary/deleteSysDictionary', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (93, 'p', '888', '/sysDictionary/exportSysDictionary', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (87, 'p', '888', '/sysDictionary/findSysDictionary', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (89, 'p', '888', '/sysDictionary/getSysDictionaryList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (92, 'p', '888', '/sysDictionary/importSysDictionary', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (88, 'p', '888', '/sysDictionary/updateSysDictionary', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (80, 'p', '888', '/sysDictionaryDetail/createSysDictionaryDetail', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (82, 'p', '888', '/sysDictionaryDetail/deleteSysDictionaryDetail', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (78, 'p', '888', '/sysDictionaryDetail/findSysDictionaryDetail', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (85, 'p', '888', '/sysDictionaryDetail/getDictionaryDetailsByParent', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (86, 'p', '888', '/sysDictionaryDetail/getDictionaryPath', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (83, 'p', '888', '/sysDictionaryDetail/getDictionaryTreeList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (84, 'p', '888', '/sysDictionaryDetail/getDictionaryTreeListByType', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (81, 'p', '888', '/sysDictionaryDetail/getSysDictionaryDetailList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (79, 'p', '888', '/sysDictionaryDetail/updateSysDictionaryDetail', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (118, 'p', '888', '/sysError/createSysError', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (119, 'p', '888', '/sysError/deleteSysError', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (120, 'p', '888', '/sysError/deleteSysErrorByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (122, 'p', '888', '/sysError/findSysError', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (123, 'p', '888', '/sysError/getSysErrorList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (124, 'p', '888', '/sysError/getSysErrorSolution', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (121, 'p', '888', '/sysError/updateSysError', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (108, 'p', '888', '/sysExportTemplate/createSysExportTemplate', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (109, 'p', '888', '/sysExportTemplate/deleteSysExportTemplate', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (110, 'p', '888', '/sysExportTemplate/deleteSysExportTemplateByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (114, 'p', '888', '/sysExportTemplate/exportExcel', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (115, 'p', '888', '/sysExportTemplate/exportTemplate', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (112, 'p', '888', '/sysExportTemplate/findSysExportTemplate', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (113, 'p', '888', '/sysExportTemplate/getSysExportTemplateList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (117, 'p', '888', '/sysExportTemplate/importExcel', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (116, 'p', '888', '/sysExportTemplate/previewSQL', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (111, 'p', '888', '/sysExportTemplate/updateSysExportTemplate', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (96, 'p', '888', '/sysOperationRecord/createSysOperationRecord', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (98, 'p', '888', '/sysOperationRecord/deleteSysOperationRecord', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (99, 'p', '888', '/sysOperationRecord/deleteSysOperationRecordByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (94, 'p', '888', '/sysOperationRecord/findSysOperationRecord', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (97, 'p', '888', '/sysOperationRecord/getSysOperationRecordList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (95, 'p', '888', '/sysOperationRecord/updateSysOperationRecord', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (131, 'p', '888', '/sysParams/createSysParams', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (132, 'p', '888', '/sysParams/deleteSysParams', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (133, 'p', '888', '/sysParams/deleteSysParamsByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (135, 'p', '888', '/sysParams/findSysParams', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (137, 'p', '888', '/sysParams/getSysParam', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (136, 'p', '888', '/sysParams/getSysParamsList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (134, 'p', '888', '/sysParams/updateSysParams', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (52, 'p', '888', '/system/getServerInfo', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (50, 'p', '888', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (51, 'p', '888', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (146, 'p', '888', '/sysVersion/deleteSysVersion', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (147, 'p', '888', '/sysVersion/deleteSysVersionByIds', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (143, 'p', '888', '/sysVersion/downloadVersionJson', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (144, 'p', '888', '/sysVersion/exportVersion', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (141, 'p', '888', '/sysVersion/findSysVersion', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (142, 'p', '888', '/sysVersion/getSysVersionList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (145, 'p', '888', '/sysVersion/importVersion', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (1, 'p', '888', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (33, 'p', '888', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (32, 'p', '888', '/user/deleteUser', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (28, 'p', '888', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (31, 'p', '888', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (36, 'p', '888', '/user/resetPassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (30, 'p', '888', '/user/setSelfInfo', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (37, 'p', '888', '/user/setSelfSetting', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (35, 'p', '888', '/user/setUserAuthorities', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (34, 'p', '888', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (29, 'p', '888', '/user/setUserInfo', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (149, 'p', '8881', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (152, 'p', '8881', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (154, 'p', '8881', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (151, 'p', '8881', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (150, 'p', '8881', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (153, 'p', '8881', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (155, 'p', '8881', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (156, 'p', '8881', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (157, 'p', '8881', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (158, 'p', '8881', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (177, 'p', '8881', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (176, 'p', '8881', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (183, 'p', '8881', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (184, 'p', '8881', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (181, 'p', '8881', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (182, 'p', '8881', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (185, 'p', '8881', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (173, 'p', '8881', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (174, 'p', '8881', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (172, 'p', '8881', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (175, 'p', '8881', '/fileUploadAndDownload/importURL', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (171, 'p', '8881', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (178, 'p', '8881', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (161, 'p', '8881', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (163, 'p', '8881', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (165, 'p', '8881', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (167, 'p', '8881', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (162, 'p', '8881', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (159, 'p', '8881', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (164, 'p', '8881', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (160, 'p', '8881', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (166, 'p', '8881', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (179, 'p', '8881', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (180, 'p', '8881', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (148, 'p', '8881', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (168, 'p', '8881', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (186, 'p', '8881', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (169, 'p', '8881', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (170, 'p', '8881', '/user/setUserAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (188, 'p', '9528', '/api/createApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (191, 'p', '9528', '/api/deleteApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (193, 'p', '9528', '/api/getAllApis', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (190, 'p', '9528', '/api/getApiById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (189, 'p', '9528', '/api/getApiList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (192, 'p', '9528', '/api/updateApi', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (194, 'p', '9528', '/authority/createAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (195, 'p', '9528', '/authority/deleteAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (196, 'p', '9528', '/authority/getAuthorityList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (197, 'p', '9528', '/authority/setDataAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (225, 'p', '9528', '/autoCode/createTemp', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (216, 'p', '9528', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (215, 'p', '9528', '/casbin/updateCasbin', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (223, 'p', '9528', '/customer/customer', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (221, 'p', '9528', '/customer/customer', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (222, 'p', '9528', '/customer/customer', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (220, 'p', '9528', '/customer/customer', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (224, 'p', '9528', '/customer/customerList', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (212, 'p', '9528', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (213, 'p', '9528', '/fileUploadAndDownload/editFileName', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (211, 'p', '9528', '/fileUploadAndDownload/getFileList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (214, 'p', '9528', '/fileUploadAndDownload/importURL', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (210, 'p', '9528', '/fileUploadAndDownload/upload', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (217, 'p', '9528', '/jwt/jsonInBlacklist', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (200, 'p', '9528', '/menu/addBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (202, 'p', '9528', '/menu/addMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (204, 'p', '9528', '/menu/deleteBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (206, 'p', '9528', '/menu/getBaseMenuById', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (201, 'p', '9528', '/menu/getBaseMenuTree', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (198, 'p', '9528', '/menu/getMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (203, 'p', '9528', '/menu/getMenuAuthority', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (199, 'p', '9528', '/menu/getMenuList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (205, 'p', '9528', '/menu/updateBaseMenu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (218, 'p', '9528', '/system/getSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (219, 'p', '9528', '/system/setSystemConfig', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (187, 'p', '9528', '/user/admin_register', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (207, 'p', '9528', '/user/changePassword', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (226, 'p', '9528', '/user/getUserInfo', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (208, 'p', '9528', '/user/getUserList', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (209, 'p', '9528', '/user/setUserAuthority', 'POST', '', '', '');

-- ----------------------------
-- Table structure for exa_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `exa_attachment_category`;
CREATE TABLE `exa_attachment_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `pid` bigint(20) NULL DEFAULT 0 COMMENT '父节点ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_attachment_category_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_attachment_category
-- ----------------------------

-- ----------------------------
-- Table structure for exa_customers
-- ----------------------------
DROP TABLE IF EXISTS `exa_customers`;
CREATE TABLE `exa_customers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '管理角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_customers_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_customers
-- ----------------------------

-- ----------------------------
-- Table structure for exa_file_chunks
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_chunks`;
CREATE TABLE `exa_file_chunks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `exa_file_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `file_chunk_number` bigint(20) NULL DEFAULT NULL,
  `file_chunk_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_file_chunks_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_file_chunks
-- ----------------------------

-- ----------------------------
-- Table structure for exa_file_upload_and_downloads
-- ----------------------------
DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
CREATE TABLE `exa_file_upload_and_downloads`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `class_id` bigint(20) NULL DEFAULT 0 COMMENT '分类id',
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_file_upload_and_downloads_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_file_upload_and_downloads
-- ----------------------------
INSERT INTO `exa_file_upload_and_downloads` VALUES (1, '2026-01-06 18:07:06.889', '2026-01-06 18:07:06.889', NULL, '10.png', 0, 'https://qmplusimg.henrongyi.top/gvalogo.png', 'png', '158787308910.png');
INSERT INTO `exa_file_upload_and_downloads` VALUES (2, '2026-01-06 18:07:06.889', '2026-01-06 18:07:06.889', NULL, 'logo.png', 0, 'https://qmplusimg.henrongyi.top/1576554439myAvatar.png', 'png', '1587973709logo.png');

-- ----------------------------
-- Table structure for exa_files
-- ----------------------------
DROP TABLE IF EXISTS `exa_files`;
CREATE TABLE `exa_files`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_md5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `chunk_total` bigint(20) NULL DEFAULT NULL,
  `is_finish` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_exa_files_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exa_files
-- ----------------------------

-- ----------------------------
-- Table structure for gva_announcements_info
-- ----------------------------
DROP TABLE IF EXISTS `gva_announcements_info`;
CREATE TABLE `gva_announcements_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公告内容',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '发布者',
  `attachments` json NULL COMMENT '相关附件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_gva_announcements_info_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gva_announcements_info
-- ----------------------------

-- ----------------------------
-- Table structure for jwt_blacklists
-- ----------------------------
DROP TABLE IF EXISTS `jwt_blacklists`;
CREATE TABLE `jwt_blacklists`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `jwt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'jwt',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_jwt_blacklists_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jwt_blacklists
-- ----------------------------

-- ----------------------------
-- Table structure for sys_apis
-- ----------------------------
DROP TABLE IF EXISTS `sys_apis`;
CREATE TABLE `sys_apis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_apis_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_apis
-- ----------------------------
INSERT INTO `sys_apis` VALUES (1, '2026-01-06 17:31:21.177', '2026-01-06 17:31:21.177', NULL, '/info/createInfo', '新建公告', '公告', 'POST');
INSERT INTO `sys_apis` VALUES (2, '2026-01-06 17:31:21.240', '2026-01-06 17:31:21.240', NULL, '/info/deleteInfo', '删除公告', '公告', 'DELETE');
INSERT INTO `sys_apis` VALUES (3, '2026-01-06 17:31:21.346', '2026-01-06 17:31:21.346', NULL, '/info/deleteInfoByIds', '批量删除公告', '公告', 'DELETE');
INSERT INTO `sys_apis` VALUES (4, '2026-01-06 17:31:21.445', '2026-01-06 17:31:21.445', NULL, '/info/updateInfo', '更新公告', '公告', 'PUT');
INSERT INTO `sys_apis` VALUES (5, '2026-01-06 17:31:21.535', '2026-01-06 17:31:21.535', NULL, '/info/findInfo', '根据ID获取公告', '公告', 'GET');
INSERT INTO `sys_apis` VALUES (6, '2026-01-06 17:31:21.594', '2026-01-06 17:31:21.594', NULL, '/info/getInfoList', '获取公告列表', '公告', 'GET');
INSERT INTO `sys_apis` VALUES (7, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/jwt/jsonInBlacklist', 'jwt加入黑名单(退出，必选)', 'jwt', 'POST');
INSERT INTO `sys_apis` VALUES (8, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/deleteUser', '删除用户', '系统用户', 'DELETE');
INSERT INTO `sys_apis` VALUES (9, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/admin_register', '用户注册', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (10, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/getUserList', '获取用户列表', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (11, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/setUserInfo', '设置用户信息', '系统用户', 'PUT');
INSERT INTO `sys_apis` VALUES (12, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/setSelfInfo', '设置自身信息(必选)', '系统用户', 'PUT');
INSERT INTO `sys_apis` VALUES (13, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/getUserInfo', '获取自身信息(必选)', '系统用户', 'GET');
INSERT INTO `sys_apis` VALUES (14, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/setUserAuthorities', '设置权限组', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (15, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/changePassword', '修改密码（建议选择)', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (16, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/setUserAuthority', '修改用户角色(必选)', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (17, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/resetPassword', '重置用户密码', '系统用户', 'POST');
INSERT INTO `sys_apis` VALUES (18, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/user/setSelfSetting', '用户界面配置', '系统用户', 'PUT');
INSERT INTO `sys_apis` VALUES (19, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/createApi', '创建api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (20, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/deleteApi', '删除Api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (21, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/updateApi', '更新Api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (22, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/getApiList', '获取api列表', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (23, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/getAllApis', '获取所有api', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (24, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/getApiById', '获取api详细信息', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (25, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/deleteApisByIds', '批量删除api', 'api', 'DELETE');
INSERT INTO `sys_apis` VALUES (26, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/syncApi', '获取待同步API', 'api', 'GET');
INSERT INTO `sys_apis` VALUES (27, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/getApiGroups', '获取路由组', 'api', 'GET');
INSERT INTO `sys_apis` VALUES (28, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/enterSyncApi', '确认同步API', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (29, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/api/ignoreApi', '忽略API', 'api', 'POST');
INSERT INTO `sys_apis` VALUES (30, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authority/copyAuthority', '拷贝角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (31, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authority/createAuthority', '创建角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (32, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authority/deleteAuthority', '删除角色', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (33, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authority/updateAuthority', '更新角色信息', '角色', 'PUT');
INSERT INTO `sys_apis` VALUES (34, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authority/getAuthorityList', '获取角色列表', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (35, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authority/setDataAuthority', '设置角色资源权限', '角色', 'POST');
INSERT INTO `sys_apis` VALUES (36, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/casbin/updateCasbin', '更改角色api权限', 'casbin', 'POST');
INSERT INTO `sys_apis` VALUES (37, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/casbin/getPolicyPathByAuthorityId', '获取权限列表', 'casbin', 'POST');
INSERT INTO `sys_apis` VALUES (38, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/addBaseMenu', '新增菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (39, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/getMenu', '获取菜单树(必选)', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (40, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/deleteBaseMenu', '删除菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (41, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/updateBaseMenu', '更新菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (42, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/getBaseMenuById', '根据id获取菜单', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (43, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/getMenuList', '分页获取基础menu列表', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (44, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/getBaseMenuTree', '获取用户动态路由', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (45, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/getMenuAuthority', '获取指定角色menu', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (46, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/menu/addMenuAuthority', '增加menu和角色关联关系', '菜单', 'POST');
INSERT INTO `sys_apis` VALUES (47, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/findFile', '寻找目标文件（秒传）', '分片上传', 'GET');
INSERT INTO `sys_apis` VALUES (48, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/breakpointContinue', '断点续传', '分片上传', 'POST');
INSERT INTO `sys_apis` VALUES (49, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/breakpointContinueFinish', '断点续传完成', '分片上传', 'POST');
INSERT INTO `sys_apis` VALUES (50, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/removeChunk', '上传完成移除文件', '分片上传', 'POST');
INSERT INTO `sys_apis` VALUES (51, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/upload', '文件上传（建议选择）', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (52, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/deleteFile', '删除文件', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (53, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/editFileName', '文件名或者备注编辑', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (54, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/getFileList', '获取上传文件列表', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (55, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/fileUploadAndDownload/importURL', '导入URL', '文件上传与下载', 'POST');
INSERT INTO `sys_apis` VALUES (56, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/system/getServerInfo', '获取服务器信息', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (57, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/system/getSystemConfig', '获取配置文件内容', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (58, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/system/setSystemConfig', '设置配置文件内容', '系统服务', 'POST');
INSERT INTO `sys_apis` VALUES (59, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/customer/customer', '更新客户', '客户', 'PUT');
INSERT INTO `sys_apis` VALUES (60, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/customer/customer', '创建客户', '客户', 'POST');
INSERT INTO `sys_apis` VALUES (61, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/customer/customer', '删除客户', '客户', 'DELETE');
INSERT INTO `sys_apis` VALUES (62, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/customer/customer', '获取单一客户', '客户', 'GET');
INSERT INTO `sys_apis` VALUES (63, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/customer/customerList', '获取客户列表', '客户', 'GET');
INSERT INTO `sys_apis` VALUES (64, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/getDB', '获取所有数据库', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (65, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/getTables', '获取数据库表', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (66, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/createTemp', '自动化代码', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (67, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/preview', '预览自动化代码', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (68, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/getColumn', '获取所选table的所有字段', '代码生成器', 'GET');
INSERT INTO `sys_apis` VALUES (69, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/installPlugin', '安装插件', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (70, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/pubPlug', '打包插件', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (71, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/mcp', '自动生成 MCP Tool 模板', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (72, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/mcpTest', 'MCP Tool 测试', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (73, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/mcpList', '获取 MCP ToolList', '代码生成器', 'POST');
INSERT INTO `sys_apis` VALUES (74, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/createPackage', '配置模板', '模板配置', 'POST');
INSERT INTO `sys_apis` VALUES (75, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/getTemplates', '获取模板文件', '模板配置', 'GET');
INSERT INTO `sys_apis` VALUES (76, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/getPackage', '获取所有模板', '模板配置', 'POST');
INSERT INTO `sys_apis` VALUES (77, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/delPackage', '删除模板', '模板配置', 'POST');
INSERT INTO `sys_apis` VALUES (78, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/getMeta', '获取meta信息', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (79, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/rollback', '回滚自动生成代码', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (80, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/getSysHistory', '查询回滚记录', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (81, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/delSysHistory', '删除回滚记录', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (82, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/autoCode/addFunc', '增加模板方法', '代码生成器历史', 'POST');
INSERT INTO `sys_apis` VALUES (83, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/updateSysDictionaryDetail', '更新字典内容', '系统字典详情', 'PUT');
INSERT INTO `sys_apis` VALUES (84, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/createSysDictionaryDetail', '新增字典内容', '系统字典详情', 'POST');
INSERT INTO `sys_apis` VALUES (85, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/deleteSysDictionaryDetail', '删除字典内容', '系统字典详情', 'DELETE');
INSERT INTO `sys_apis` VALUES (86, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/findSysDictionaryDetail', '根据ID获取字典内容', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (87, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/getSysDictionaryDetailList', '获取字典内容列表', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (88, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/getDictionaryTreeList', '获取字典数列表', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (89, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/getDictionaryTreeListByType', '根据分类获取字典数列表', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (90, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/getDictionaryDetailsByParent', '根据父级ID获取字典详情', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (91, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionaryDetail/getDictionaryPath', '获取字典详情的完整路径', '系统字典详情', 'GET');
INSERT INTO `sys_apis` VALUES (92, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionary/createSysDictionary', '新增字典', '系统字典', 'POST');
INSERT INTO `sys_apis` VALUES (93, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionary/deleteSysDictionary', '删除字典', '系统字典', 'DELETE');
INSERT INTO `sys_apis` VALUES (94, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionary/updateSysDictionary', '更新字典', '系统字典', 'PUT');
INSERT INTO `sys_apis` VALUES (95, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionary/findSysDictionary', '根据ID获取字典（建议选择）', '系统字典', 'GET');
INSERT INTO `sys_apis` VALUES (96, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionary/getSysDictionaryList', '获取字典列表', '系统字典', 'GET');
INSERT INTO `sys_apis` VALUES (97, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionary/importSysDictionary', '导入字典JSON', '系统字典', 'POST');
INSERT INTO `sys_apis` VALUES (98, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysDictionary/exportSysDictionary', '导出字典JSON', '系统字典', 'GET');
INSERT INTO `sys_apis` VALUES (99, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysOperationRecord/createSysOperationRecord', '新增操作记录', '操作记录', 'POST');
INSERT INTO `sys_apis` VALUES (100, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysOperationRecord/findSysOperationRecord', '根据ID获取操作记录', '操作记录', 'GET');
INSERT INTO `sys_apis` VALUES (101, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysOperationRecord/getSysOperationRecordList', '获取操作记录列表', '操作记录', 'GET');
INSERT INTO `sys_apis` VALUES (102, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysOperationRecord/deleteSysOperationRecord', '删除操作记录', '操作记录', 'DELETE');
INSERT INTO `sys_apis` VALUES (103, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysOperationRecord/deleteSysOperationRecordByIds', '批量删除操作历史', '操作记录', 'DELETE');
INSERT INTO `sys_apis` VALUES (104, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/simpleUploader/upload', '插件版分片上传', '断点续传(插件版)', 'POST');
INSERT INTO `sys_apis` VALUES (105, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/simpleUploader/checkFileMd5', '文件完整度验证', '断点续传(插件版)', 'GET');
INSERT INTO `sys_apis` VALUES (106, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/simpleUploader/mergeFileMd5', '上传完成合并文件', '断点续传(插件版)', 'GET');
INSERT INTO `sys_apis` VALUES (107, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/email/emailTest', '发送测试邮件', 'email', 'POST');
INSERT INTO `sys_apis` VALUES (108, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/email/sendEmail', '发送邮件', 'email', 'POST');
INSERT INTO `sys_apis` VALUES (109, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authorityBtn/setAuthorityBtn', '设置按钮权限', '按钮权限', 'POST');
INSERT INTO `sys_apis` VALUES (110, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authorityBtn/getAuthorityBtn', '获取已有按钮权限', '按钮权限', 'POST');
INSERT INTO `sys_apis` VALUES (111, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/authorityBtn/canRemoveAuthorityBtn', '删除按钮', '按钮权限', 'POST');
INSERT INTO `sys_apis` VALUES (112, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/createSysExportTemplate', '新增导出模板', '导出模板', 'POST');
INSERT INTO `sys_apis` VALUES (113, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/deleteSysExportTemplate', '删除导出模板', '导出模板', 'DELETE');
INSERT INTO `sys_apis` VALUES (114, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/deleteSysExportTemplateByIds', '批量删除导出模板', '导出模板', 'DELETE');
INSERT INTO `sys_apis` VALUES (115, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/updateSysExportTemplate', '更新导出模板', '导出模板', 'PUT');
INSERT INTO `sys_apis` VALUES (116, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/findSysExportTemplate', '根据ID获取导出模板', '导出模板', 'GET');
INSERT INTO `sys_apis` VALUES (117, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/getSysExportTemplateList', '获取导出模板列表', '导出模板', 'GET');
INSERT INTO `sys_apis` VALUES (118, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/exportExcel', '导出Excel', '导出模板', 'GET');
INSERT INTO `sys_apis` VALUES (119, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/exportTemplate', '下载模板', '导出模板', 'GET');
INSERT INTO `sys_apis` VALUES (120, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/previewSQL', '预览SQL', '导出模板', 'GET');
INSERT INTO `sys_apis` VALUES (121, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysExportTemplate/importExcel', '导入Excel', '导出模板', 'POST');
INSERT INTO `sys_apis` VALUES (122, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysError/createSysError', '新建错误日志', '错误日志', 'POST');
INSERT INTO `sys_apis` VALUES (123, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysError/deleteSysError', '删除错误日志', '错误日志', 'DELETE');
INSERT INTO `sys_apis` VALUES (124, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysError/deleteSysErrorByIds', '批量删除错误日志', '错误日志', 'DELETE');
INSERT INTO `sys_apis` VALUES (125, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysError/updateSysError', '更新错误日志', '错误日志', 'PUT');
INSERT INTO `sys_apis` VALUES (126, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysError/findSysError', '根据ID获取错误日志', '错误日志', 'GET');
INSERT INTO `sys_apis` VALUES (127, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysError/getSysErrorList', '获取错误日志列表', '错误日志', 'GET');
INSERT INTO `sys_apis` VALUES (128, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysError/getSysErrorSolution', '触发错误处理(异步)', '错误日志', 'GET');
INSERT INTO `sys_apis` VALUES (129, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/info/createInfo', '新建公告', '公告', 'POST');
INSERT INTO `sys_apis` VALUES (130, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/info/deleteInfo', '删除公告', '公告', 'DELETE');
INSERT INTO `sys_apis` VALUES (131, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/info/deleteInfoByIds', '批量删除公告', '公告', 'DELETE');
INSERT INTO `sys_apis` VALUES (132, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/info/updateInfo', '更新公告', '公告', 'PUT');
INSERT INTO `sys_apis` VALUES (133, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/info/findInfo', '根据ID获取公告', '公告', 'GET');
INSERT INTO `sys_apis` VALUES (134, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/info/getInfoList', '获取公告列表', '公告', 'GET');
INSERT INTO `sys_apis` VALUES (135, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysParams/createSysParams', '新建参数', '参数管理', 'POST');
INSERT INTO `sys_apis` VALUES (136, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysParams/deleteSysParams', '删除参数', '参数管理', 'DELETE');
INSERT INTO `sys_apis` VALUES (137, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysParams/deleteSysParamsByIds', '批量删除参数', '参数管理', 'DELETE');
INSERT INTO `sys_apis` VALUES (138, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysParams/updateSysParams', '更新参数', '参数管理', 'PUT');
INSERT INTO `sys_apis` VALUES (139, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysParams/findSysParams', '根据ID获取参数', '参数管理', 'GET');
INSERT INTO `sys_apis` VALUES (140, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysParams/getSysParamsList', '获取参数列表', '参数管理', 'GET');
INSERT INTO `sys_apis` VALUES (141, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysParams/getSysParam', '获取参数列表', '参数管理', 'GET');
INSERT INTO `sys_apis` VALUES (142, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/attachmentCategory/getCategoryList', '分类列表', '媒体库分类', 'GET');
INSERT INTO `sys_apis` VALUES (143, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/attachmentCategory/addCategory', '添加/编辑分类', '媒体库分类', 'POST');
INSERT INTO `sys_apis` VALUES (144, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/attachmentCategory/deleteCategory', '删除分类', '媒体库分类', 'POST');
INSERT INTO `sys_apis` VALUES (145, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysVersion/findSysVersion', '获取单一版本', '版本控制', 'GET');
INSERT INTO `sys_apis` VALUES (146, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysVersion/getSysVersionList', '获取版本列表', '版本控制', 'GET');
INSERT INTO `sys_apis` VALUES (147, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysVersion/downloadVersionJson', '下载版本json', '版本控制', 'GET');
INSERT INTO `sys_apis` VALUES (148, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysVersion/exportVersion', '创建版本', '版本控制', 'POST');
INSERT INTO `sys_apis` VALUES (149, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysVersion/importVersion', '同步版本', '版本控制', 'POST');
INSERT INTO `sys_apis` VALUES (150, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysVersion/deleteSysVersion', '删除版本', '版本控制', 'DELETE');
INSERT INTO `sys_apis` VALUES (151, '2026-01-06 18:06:55.458', '2026-01-06 18:06:55.458', NULL, '/sysVersion/deleteSysVersionByIds', '批量删除版本', '版本控制', 'DELETE');

-- ----------------------------
-- Table structure for sys_authorities
-- ----------------------------
DROP TABLE IF EXISTS `sys_authorities`;
CREATE TABLE `sys_authorities`  (
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `authority_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `authority_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`) USING BTREE,
  UNIQUE INDEX `uni_sys_authorities_authority_id`(`authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9529 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authorities
-- ----------------------------
INSERT INTO `sys_authorities` VALUES ('2026-01-06 18:06:57.302', '2026-01-06 18:07:05.120', NULL, 888, '普通用户', 0, 'dashboard');
INSERT INTO `sys_authorities` VALUES ('2026-01-06 18:06:57.302', '2026-01-06 18:07:06.236', NULL, 8881, '普通用户子角色', 888, 'dashboard');
INSERT INTO `sys_authorities` VALUES ('2026-01-06 18:06:57.302', '2026-01-06 18:07:05.734', NULL, 9528, '测试角色', 0, 'dashboard');

-- ----------------------------
-- Table structure for sys_authority_btns
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_btns`;
CREATE TABLE `sys_authority_btns`  (
  `authority_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `sys_menu_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单ID',
  `sys_base_menu_btn_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单按钮ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authority_btns
-- ----------------------------

-- ----------------------------
-- Table structure for sys_authority_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority_menus`;
CREATE TABLE `sys_authority_menus`  (
  `sys_base_menu_id` bigint(20) UNSIGNED NOT NULL,
  `sys_authority_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`, `sys_authority_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authority_menus
-- ----------------------------
INSERT INTO `sys_authority_menus` VALUES (2, 888);
INSERT INTO `sys_authority_menus` VALUES (2, 8881);
INSERT INTO `sys_authority_menus` VALUES (2, 9528);
INSERT INTO `sys_authority_menus` VALUES (3, 888);
INSERT INTO `sys_authority_menus` VALUES (3, 8881);
INSERT INTO `sys_authority_menus` VALUES (3, 9528);
INSERT INTO `sys_authority_menus` VALUES (4, 888);
INSERT INTO `sys_authority_menus` VALUES (4, 8881);
INSERT INTO `sys_authority_menus` VALUES (5, 888);
INSERT INTO `sys_authority_menus` VALUES (5, 8881);
INSERT INTO `sys_authority_menus` VALUES (5, 9528);
INSERT INTO `sys_authority_menus` VALUES (6, 888);
INSERT INTO `sys_authority_menus` VALUES (6, 8881);
INSERT INTO `sys_authority_menus` VALUES (7, 888);
INSERT INTO `sys_authority_menus` VALUES (7, 8881);
INSERT INTO `sys_authority_menus` VALUES (8, 888);
INSERT INTO `sys_authority_menus` VALUES (8, 8881);
INSERT INTO `sys_authority_menus` VALUES (9, 888);
INSERT INTO `sys_authority_menus` VALUES (9, 8881);
INSERT INTO `sys_authority_menus` VALUES (9, 9528);
INSERT INTO `sys_authority_menus` VALUES (10, 888);
INSERT INTO `sys_authority_menus` VALUES (10, 8881);
INSERT INTO `sys_authority_menus` VALUES (11, 888);
INSERT INTO `sys_authority_menus` VALUES (12, 888);
INSERT INTO `sys_authority_menus` VALUES (13, 888);
INSERT INTO `sys_authority_menus` VALUES (14, 888);
INSERT INTO `sys_authority_menus` VALUES (15, 888);
INSERT INTO `sys_authority_menus` VALUES (16, 888);
INSERT INTO `sys_authority_menus` VALUES (17, 888);
INSERT INTO `sys_authority_menus` VALUES (18, 888);
INSERT INTO `sys_authority_menus` VALUES (18, 8881);
INSERT INTO `sys_authority_menus` VALUES (19, 888);
INSERT INTO `sys_authority_menus` VALUES (19, 8881);
INSERT INTO `sys_authority_menus` VALUES (20, 888);
INSERT INTO `sys_authority_menus` VALUES (20, 8881);
INSERT INTO `sys_authority_menus` VALUES (21, 888);
INSERT INTO `sys_authority_menus` VALUES (21, 8881);
INSERT INTO `sys_authority_menus` VALUES (22, 888);
INSERT INTO `sys_authority_menus` VALUES (22, 8881);
INSERT INTO `sys_authority_menus` VALUES (23, 888);
INSERT INTO `sys_authority_menus` VALUES (23, 8881);
INSERT INTO `sys_authority_menus` VALUES (24, 888);
INSERT INTO `sys_authority_menus` VALUES (24, 8881);
INSERT INTO `sys_authority_menus` VALUES (25, 888);
INSERT INTO `sys_authority_menus` VALUES (25, 8881);
INSERT INTO `sys_authority_menus` VALUES (26, 888);
INSERT INTO `sys_authority_menus` VALUES (26, 8881);
INSERT INTO `sys_authority_menus` VALUES (27, 888);
INSERT INTO `sys_authority_menus` VALUES (27, 8881);
INSERT INTO `sys_authority_menus` VALUES (28, 888);
INSERT INTO `sys_authority_menus` VALUES (28, 8881);
INSERT INTO `sys_authority_menus` VALUES (29, 888);
INSERT INTO `sys_authority_menus` VALUES (29, 8881);
INSERT INTO `sys_authority_menus` VALUES (30, 888);
INSERT INTO `sys_authority_menus` VALUES (30, 8881);
INSERT INTO `sys_authority_menus` VALUES (31, 888);
INSERT INTO `sys_authority_menus` VALUES (31, 8881);
INSERT INTO `sys_authority_menus` VALUES (32, 888);
INSERT INTO `sys_authority_menus` VALUES (32, 8881);
INSERT INTO `sys_authority_menus` VALUES (33, 888);
INSERT INTO `sys_authority_menus` VALUES (34, 888);
INSERT INTO `sys_authority_menus` VALUES (35, 888);
INSERT INTO `sys_authority_menus` VALUES (36, 888);
INSERT INTO `sys_authority_menus` VALUES (37, 888);

-- ----------------------------
-- Table structure for sys_auto_code_histories
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_code_histories`;
CREATE TABLE `sys_auto_code_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `package` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名/插件名',
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '前端传入的结构化信息',
  `struct_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结构体名称',
  `abbreviation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结构体名称缩写',
  `business_db` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务库',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Struct中文名称',
  `templates` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模板信息',
  `Injections` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注入路径',
  `flag` bigint(20) NULL DEFAULT NULL COMMENT '[0:创建,1:回滚]',
  `api_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api表注册内容',
  `menu_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单ID',
  `export_template_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '导出模板ID',
  `package_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '包ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_auto_code_histories_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auto_code_histories
-- ----------------------------

-- ----------------------------
-- Table structure for sys_auto_code_packages
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_code_packages`;
CREATE TABLE `sys_auto_code_packages`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示名',
  `template` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模版',
  `package_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包名',
  `module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_auto_code_packages_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auto_code_packages
-- ----------------------------

-- ----------------------------
-- Table structure for sys_base_menu_btns
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menu_btns`;
CREATE TABLE `sys_base_menu_btns`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sys_base_menu_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menu_btns_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_base_menu_btns
-- ----------------------------

-- ----------------------------
-- Table structure for sys_base_menu_parameters
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menu_parameters`;
CREATE TABLE `sys_base_menu_parameters`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `sys_base_menu_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址栏携带参数的值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menu_parameters_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_base_menu_parameters
-- ----------------------------

-- ----------------------------
-- Table structure for sys_base_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_menus`;
CREATE TABLE `sys_base_menus`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `menu_level` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) NULL DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint(20) NULL DEFAULT NULL COMMENT '排序标记',
  `active_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '高亮菜单',
  `keep_alive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存',
  `default_menu` tinyint(1) NULL DEFAULT NULL COMMENT '是否是基础路由（开发中）',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `close_tab` tinyint(1) NULL DEFAULT NULL COMMENT '自动关闭tab',
  `transition_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由切换动画',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_base_menus_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_base_menus
-- ----------------------------
INSERT INTO `sys_base_menus` VALUES (1, '2026-01-06 17:31:21.896', '2026-01-06 17:31:21.896', NULL, 0, 24, 'anInfo', 'anInfo', 0, 'plugin/announcement/view/info.vue', 5, '', 0, 0, '公告管理', 'box', 0, '');
INSERT INTO `sys_base_menus` VALUES (2, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'dashboard', 'dashboard', 0, 'view/dashboard/index.vue', 1, '', 0, 0, '仪表盘', 'odometer', 0, '');
INSERT INTO `sys_base_menus` VALUES (3, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'about', 'about', 0, 'view/about/index.vue', 9, '', 0, 0, '关于我们', 'info-filled', 0, '');
INSERT INTO `sys_base_menus` VALUES (4, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'admin', 'superAdmin', 0, 'view/superAdmin/index.vue', 3, '', 0, 0, '超级管理员', 'user', 0, '');
INSERT INTO `sys_base_menus` VALUES (5, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'person', 'person', 1, 'view/person/person.vue', 4, '', 0, 0, '个人信息', 'message', 0, '');
INSERT INTO `sys_base_menus` VALUES (6, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'example', 'example', 0, 'view/example/index.vue', 7, '', 0, 0, '示例文件', 'management', 0, '');
INSERT INTO `sys_base_menus` VALUES (7, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'systemTools', 'systemTools', 0, 'view/systemTools/index.vue', 5, '', 0, 0, '系统工具', 'tools', 0, '');
INSERT INTO `sys_base_menus` VALUES (8, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'https://www.gin-vue-admin.com', 'https://www.gin-vue-admin.com', 0, '/', 0, '', 0, 0, '官方网站', 'customer-gva', 0, '');
INSERT INTO `sys_base_menus` VALUES (9, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'state', 'state', 0, 'view/system/state.vue', 8, '', 0, 0, '服务器状态', 'cloudy', 0, '');
INSERT INTO `sys_base_menus` VALUES (10, '2026-01-06 18:07:02.395', '2026-01-06 18:07:02.395', NULL, 0, 0, 'plugin', 'plugin', 0, 'view/routerHolder.vue', 6, '', 0, 0, '插件系统', 'cherry', 0, '');
INSERT INTO `sys_base_menus` VALUES (11, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 4, 'authority', 'authority', 0, 'view/superAdmin/authority/authority.vue', 1, '', 0, 0, '角色管理', 'avatar', 0, '');
INSERT INTO `sys_base_menus` VALUES (12, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 4, 'menu', 'menu', 0, 'view/superAdmin/menu/menu.vue', 2, '', 1, 0, '菜单管理', 'tickets', 0, '');
INSERT INTO `sys_base_menus` VALUES (13, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 4, 'api', 'api', 0, 'view/superAdmin/api/api.vue', 3, '', 1, 0, 'api管理', 'platform', 0, '');
INSERT INTO `sys_base_menus` VALUES (14, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 4, 'user', 'user', 0, 'view/superAdmin/user/user.vue', 4, '', 0, 0, '用户管理', 'coordinate', 0, '');
INSERT INTO `sys_base_menus` VALUES (15, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 4, 'dictionary', 'dictionary', 0, 'view/superAdmin/dictionary/sysDictionary.vue', 5, '', 0, 0, '字典管理', 'notebook', 0, '');
INSERT INTO `sys_base_menus` VALUES (16, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 4, 'operation', 'operation', 0, 'view/superAdmin/operation/sysOperationRecord.vue', 6, '', 0, 0, '操作历史', 'pie-chart', 0, '');
INSERT INTO `sys_base_menus` VALUES (17, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 4, 'sysParams', 'sysParams', 0, 'view/superAdmin/params/sysParams.vue', 7, '', 0, 0, '参数管理', 'compass', 0, '');
INSERT INTO `sys_base_menus` VALUES (18, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 6, 'upload', 'upload', 0, 'view/example/upload/upload.vue', 5, '', 0, 0, '媒体库（上传下载）', 'upload', 0, '');
INSERT INTO `sys_base_menus` VALUES (19, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 6, 'breakpoint', 'breakpoint', 0, 'view/example/breakpoint/breakpoint.vue', 6, '', 0, 0, '断点续传', 'upload-filled', 0, '');
INSERT INTO `sys_base_menus` VALUES (20, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 6, 'customer', 'customer', 0, 'view/example/customer/customer.vue', 7, '', 0, 0, '客户列表（资源示例）', 'avatar', 0, '');
INSERT INTO `sys_base_menus` VALUES (21, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'autoCode', 'autoCode', 0, 'view/systemTools/autoCode/index.vue', 1, '', 1, 0, '代码生成器', 'cpu', 0, '');
INSERT INTO `sys_base_menus` VALUES (22, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'formCreate', 'formCreate', 0, 'view/systemTools/formCreate/index.vue', 3, '', 1, 0, '表单生成器', 'magic-stick', 0, '');
INSERT INTO `sys_base_menus` VALUES (23, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'system', 'system', 0, 'view/systemTools/system/system.vue', 4, '', 0, 0, '系统配置', 'operation', 0, '');
INSERT INTO `sys_base_menus` VALUES (24, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'autoCodeAdmin', 'autoCodeAdmin', 0, 'view/systemTools/autoCodeAdmin/index.vue', 2, '', 0, 0, '自动化代码管理', 'magic-stick', 0, '');
INSERT INTO `sys_base_menus` VALUES (25, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'autoCodeEdit/:id', 'autoCodeEdit', 1, 'view/systemTools/autoCode/index.vue', 0, '', 0, 0, '自动化代码-${id}', 'magic-stick', 0, '');
INSERT INTO `sys_base_menus` VALUES (26, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'autoPkg', 'autoPkg', 0, 'view/systemTools/autoPkg/autoPkg.vue', 0, '', 0, 0, '模板配置', 'folder', 0, '');
INSERT INTO `sys_base_menus` VALUES (27, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'exportTemplate', 'exportTemplate', 0, 'view/systemTools/exportTemplate/exportTemplate.vue', 5, '', 0, 0, '导出模板', 'reading', 0, '');
INSERT INTO `sys_base_menus` VALUES (28, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'picture', 'picture', 0, 'view/systemTools/autoCode/picture.vue', 6, '', 0, 0, 'AI页面绘制', 'picture-filled', 0, '');
INSERT INTO `sys_base_menus` VALUES (29, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'mcpTool', 'mcpTool', 0, 'view/systemTools/autoCode/mcp.vue', 7, '', 0, 0, 'Mcp Tools模板', 'magnet', 0, '');
INSERT INTO `sys_base_menus` VALUES (30, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'mcpTest', 'mcpTest', 0, 'view/systemTools/autoCode/mcpTest.vue', 7, '', 0, 0, 'Mcp Tools测试', 'partly-cloudy', 0, '');
INSERT INTO `sys_base_menus` VALUES (31, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'sysVersion', 'sysVersion', 0, 'view/systemTools/version/version.vue', 8, '', 0, 0, '版本管理', 'server', 0, '');
INSERT INTO `sys_base_menus` VALUES (32, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 7, 'sysError', 'sysError', 0, 'view/systemTools/sysError/sysError.vue', 9, '', 0, 0, '错误日志', 'warn', 0, '');
INSERT INTO `sys_base_menus` VALUES (33, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 10, 'https://plugin.gin-vue-admin.com/', 'https://plugin.gin-vue-admin.com/', 0, 'https://plugin.gin-vue-admin.com/', 0, '', 0, 0, '插件市场', 'shop', 0, '');
INSERT INTO `sys_base_menus` VALUES (34, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 10, 'installPlugin', 'installPlugin', 0, 'view/systemTools/installPlugin/index.vue', 1, '', 0, 0, '插件安装', 'box', 0, '');
INSERT INTO `sys_base_menus` VALUES (35, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 10, 'pubPlug', 'pubPlug', 0, 'view/systemTools/pubPlug/pubPlug.vue', 3, '', 0, 0, '打包插件', 'files', 0, '');
INSERT INTO `sys_base_menus` VALUES (36, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 10, 'plugin-email', 'plugin-email', 0, 'plugin/email/view/index.vue', 4, '', 0, 0, '邮件插件', 'message', 0, '');
INSERT INTO `sys_base_menus` VALUES (37, '2026-01-06 18:07:02.674', '2026-01-06 18:07:02.674', NULL, 1, 10, 'anInfo', 'anInfo', 0, 'plugin/announcement/view/info.vue', 5, '', 0, 0, '公告管理[示例]', 'scaleToOriginal', 0, '');

-- ----------------------------
-- Table structure for sys_data_authority_id
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_authority_id`;
CREATE TABLE `sys_data_authority_id`  (
  `sys_authority_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_authority_authority_id`, `data_authority_id_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_authority_id
-- ----------------------------
INSERT INTO `sys_data_authority_id` VALUES (888, 888);
INSERT INTO `sys_data_authority_id` VALUES (888, 8881);
INSERT INTO `sys_data_authority_id` VALUES (888, 9528);
INSERT INTO `sys_data_authority_id` VALUES (9528, 8881);
INSERT INTO `sys_data_authority_id` VALUES (9528, 9528);

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父级字典ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dictionaries_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES (1, '2026-01-06 18:06:58.783', '2026-01-06 18:06:59.137', NULL, '性别', 'gender', 1, '性别字典', NULL);
INSERT INTO `sys_dictionaries` VALUES (2, '2026-01-06 18:06:58.783', '2026-01-06 18:06:59.683', NULL, '数据库int类型', 'int', 1, 'int类型对应的数据库类型', NULL);
INSERT INTO `sys_dictionaries` VALUES (3, '2026-01-06 18:06:58.783', '2026-01-06 18:07:00.214', NULL, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型', NULL);
INSERT INTO `sys_dictionaries` VALUES (4, '2026-01-06 18:06:58.783', '2026-01-06 18:07:00.743', NULL, '数据库浮点型', 'float64', 1, '数据库浮点型', NULL);
INSERT INTO `sys_dictionaries` VALUES (5, '2026-01-06 18:06:58.783', '2026-01-06 18:07:01.284', NULL, '数据库字符串', 'string', 1, '数据库字符串', NULL);
INSERT INTO `sys_dictionaries` VALUES (6, '2026-01-06 18:06:58.783', '2026-01-06 18:07:01.845', NULL, '数据库bool类型', 'bool', 1, '数据库bool类型', NULL);

-- ----------------------------
-- Table structure for sys_dictionary_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_details`;
CREATE TABLE `sys_dictionary_details`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示值',
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `extend` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展值',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '启用状态',
  `sort` bigint(20) NULL DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '关联标记',
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父级字典详情ID',
  `level` bigint(20) NULL DEFAULT NULL COMMENT '层级深度',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dictionary_details_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary_details
-- ----------------------------
INSERT INTO `sys_dictionary_details` VALUES (1, '2026-01-06 18:06:59.225', '2026-01-06 18:06:59.225', NULL, '男', '1', '', 1, 1, 1, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (2, '2026-01-06 18:06:59.225', '2026-01-06 18:06:59.225', NULL, '女', '2', '', 1, 2, 1, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (3, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'smallint', '1', 'mysql', 1, 1, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (4, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'mediumint', '2', 'mysql', 1, 2, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (5, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'int', '3', 'mysql', 1, 3, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (6, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'bigint', '4', 'mysql', 1, 4, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (7, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'int2', '5', 'pgsql', 1, 5, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (8, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'int4', '6', 'pgsql', 1, 6, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (9, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'int6', '7', 'pgsql', 1, 7, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (10, '2026-01-06 18:06:59.794', '2026-01-06 18:06:59.794', NULL, 'int8', '8', 'pgsql', 1, 8, 2, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (11, '2026-01-06 18:07:00.336', '2026-01-06 18:07:00.336', NULL, 'date', '0', 'mysql', 1, 0, 3, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (12, '2026-01-06 18:07:00.336', '2026-01-06 18:07:00.336', NULL, 'time', '1', 'mysql', 1, 1, 3, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (13, '2026-01-06 18:07:00.336', '2026-01-06 18:07:00.336', NULL, 'year', '2', 'mysql', 1, 2, 3, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (14, '2026-01-06 18:07:00.336', '2026-01-06 18:07:00.336', NULL, 'datetime', '3', 'mysql', 1, 3, 3, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (15, '2026-01-06 18:07:00.336', '2026-01-06 18:07:00.336', NULL, 'timestamp', '5', 'mysql', 1, 5, 3, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (16, '2026-01-06 18:07:00.336', '2026-01-06 18:07:00.336', NULL, 'timestamptz', '6', 'pgsql', 1, 5, 3, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (17, '2026-01-06 18:07:00.875', '2026-01-06 18:07:00.875', NULL, 'float', '0', 'mysql', 1, 0, 4, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (18, '2026-01-06 18:07:00.875', '2026-01-06 18:07:00.875', NULL, 'double', '1', 'mysql', 1, 1, 4, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (19, '2026-01-06 18:07:00.875', '2026-01-06 18:07:00.875', NULL, 'decimal', '2', 'mysql', 1, 2, 4, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (20, '2026-01-06 18:07:00.875', '2026-01-06 18:07:00.875', NULL, 'numeric', '3', 'pgsql', 1, 3, 4, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (21, '2026-01-06 18:07:00.875', '2026-01-06 18:07:00.875', NULL, 'smallserial', '4', 'pgsql', 1, 4, 4, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (22, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'char', '0', 'mysql', 1, 0, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (23, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'varchar', '1', 'mysql', 1, 1, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (24, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'tinyblob', '2', 'mysql', 1, 2, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (25, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'tinytext', '3', 'mysql', 1, 3, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (26, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'text', '4', 'mysql', 1, 4, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (27, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'blob', '5', 'mysql', 1, 5, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (28, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'mediumblob', '6', 'mysql', 1, 6, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (29, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'mediumtext', '7', 'mysql', 1, 7, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (30, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'longblob', '8', 'mysql', 1, 8, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (31, '2026-01-06 18:07:01.383', '2026-01-06 18:07:01.383', NULL, 'longtext', '9', 'mysql', 1, 9, 5, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (32, '2026-01-06 18:07:01.934', '2026-01-06 18:07:01.934', NULL, 'tinyint', '1', 'mysql', 1, 0, 6, NULL, 0, '');
INSERT INTO `sys_dictionary_details` VALUES (33, '2026-01-06 18:07:01.934', '2026-01-06 18:07:01.934', NULL, 'bool', '2', 'pgsql', 1, 0, 6, NULL, 0, '');

-- ----------------------------
-- Table structure for sys_error
-- ----------------------------
DROP TABLE IF EXISTS `sys_error`;
CREATE TABLE `sys_error`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误来源',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误内容',
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志等级',
  `solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '解决方案',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '未处理' COMMENT '处理状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_error_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_error
-- ----------------------------
INSERT INTO `sys_error` VALUES (1, '2026-01-06 18:03:33.704', '2026-01-06 18:03:33.704', NULL, '后端', '登陆失败! 用户名不存在或者密码错误! | 错误: record not found \n 源文件:D:/project-jax/agent_flow_admin/server/api/v1/system/sys_user.go:60 \n 调用栈：github.com/flipped-aurora/gin-vue-admin/server/api/v1/system.(*BaseApi).Login\n	D:/project-jax/agent_flow_admin/server/api/v1/system/sys_user.go:60\ngithub.com/gin-gonic/gin.(*Context).Next\n	C:/Users/Administrator/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.LoggerWithConfig.func1\n	C:/Users/Administrator/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/logger.go:249\ngithub.com/gin-gonic/gin.(*Context).Next\n	C:/Users/Administrator/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/flipped-aurora/gin-vue-admin/server/middleware.GinRecovery.func1\n	D:/project-jax/agent_flow_admin/server/middleware/error.go:59\ngithub.com/gin-gonic/gin.(*Context).Next\n	C:/Users/Administrator/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/context.go:185\ngithub.com/gin-gonic/gin.(*Engine).handleHTTPRequest\n	C:/Users/Administrator/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:633\ngithub.com/gin-gonic/gin.(*Engine).ServeHTTP\n	C:/Users/Administrator/go/pkg/mod/github.com/gin-gonic/gin@v1.10.0/gin.go:589\nnet/http.serverHandler.ServeHTTP\n	C:/Users/Administrator/go/pkg/mod/golang.org/toolchain@v0.0.1-go1.25.5.windows-amd64/src/net/http/server.go:3340\nnet/http.(*conn).serve\n	C:/Users/Administrator/go/pkg/mod/golang.org/toolchain@v0.0.1-go1.25.5.windows-amd64/src/net/http/server.go:2109 \n 最终调用方法:D:/project-jax/agent_flow_admin/server/api/v1/system/sys_user.go:60 (Login lines 27-74)\n----- 产生日志的方法代码如下 -----\nfunc (b *BaseApi) Login(c *gin.Context) {\r\n	var l systemReq.Login\r\n	err := c.ShouldBindJSON(&l)\r\n	if err != nil {\r\n		response.FailWithMessage(err.Error(), c)\r\n		return\r\n	}\r\n	err = utils.Verify(l, utils.LoginVerify)\r\n	if err != nil {\r\n		response.FailWithMessage(err.Error(), c)\r\n		return\r\n	}\r\n\r\n	key := c.ClientIP()\r\n	// 判断验证码是否开启\r\n	openCaptcha := global.GVA_CONFIG.Captcha.OpenCaptcha               // 是否开启防爆次数\r\n	openCaptchaTimeOut := global.GVA_CONFIG.Captcha.OpenCaptchaTimeOut // 缓存超时时间\r\n	v, ok := global.BlackCache.Get(key)\r\n	if !ok {\r\n		global.BlackCache.Set(key, 1, time.Second*time.Duration(openCaptchaTimeOut))\r\n	}\r\n\r\n	var oc bool = openCaptcha == 0 || openCaptcha < interfaceToInt(v)\r\n	if oc && (l.Captcha == \"\" || l.CaptchaId == \"\" || !store.Verify(l.CaptchaId, l.Captcha, true)) {\r\n		// 验证码次数+1\r\n		global.BlackCache.Increment(key, 1)\r\n		response.FailWithMessage(\"验证码错误\", c)\r\n		return\r\n	}\r\n\r\n	u := &system.SysUser{Username: l.Username, Password: l.Password}\r\n	user, err := userService.Login(u)\r\n	if err != nil {\r\n		global.GVA_LOG.Error(\"登陆失败! 用户名不存在或者密码错误!\", zap.Error(err))\r\n		// 验证码次数+1\r\n		global.BlackCache.Increment(key, 1)\r\n		response.FailWithMessage(\"用户名不存在或者密码错误\", c)\r\n		return\r\n	}\r\n	if user.Enable != 1 {\r\n		global.GVA_LOG.Error(\"登陆失败! 用户被禁止登录!\")\r\n		// 验证码次数+1\r\n		global.BlackCache.Increment(key, 1)\r\n		response.FailWithMessage(\"用户被禁止登录\", c)\r\n		return\r\n	}\r\n	b.TokenNext(c, *user)\r\n}', 'error', NULL, '未处理');

-- ----------------------------
-- Table structure for sys_export_template_condition
-- ----------------------------
DROP TABLE IF EXISTS `sys_export_template_condition`;
CREATE TABLE `sys_export_template_condition`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `template_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板标识',
  `from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条件取的key',
  `column` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作为查询条件的字段',
  `operator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作符',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_export_template_condition_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_export_template_condition
-- ----------------------------

-- ----------------------------
-- Table structure for sys_export_template_join
-- ----------------------------
DROP TABLE IF EXISTS `sys_export_template_join`;
CREATE TABLE `sys_export_template_join`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `template_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板标识',
  `joins` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联',
  `table` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表',
  `on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联条件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_export_template_join_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_export_template_join
-- ----------------------------

-- ----------------------------
-- Table structure for sys_export_templates
-- ----------------------------
DROP TABLE IF EXISTS `sys_export_templates`;
CREATE TABLE `sys_export_templates`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `db_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名称',
  `template_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板标识',
  `template_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `limit` bigint(20) NULL DEFAULT NULL COMMENT '导出限制',
  `order` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_export_templates_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_export_templates
-- ----------------------------
INSERT INTO `sys_export_templates` VALUES (1, '2026-01-06 18:07:04.704', '2026-01-06 18:07:04.704', NULL, '', 'api', 'sys_apis', 'api', '{\n\"path\":\"路径\",\n\"method\":\"方法（大写）\",\n\"description\":\"方法介绍\",\n\"api_group\":\"方法分组\"\n}', NULL, '');

-- ----------------------------
-- Table structure for sys_ignore_apis
-- ----------------------------
DROP TABLE IF EXISTS `sys_ignore_apis`;
CREATE TABLE `sys_ignore_apis`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api路径',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_ignore_apis_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_ignore_apis
-- ----------------------------
INSERT INTO `sys_ignore_apis` VALUES (1, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/swagger/*any', 'GET');
INSERT INTO `sys_ignore_apis` VALUES (2, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/api/freshCasbin', 'GET');
INSERT INTO `sys_ignore_apis` VALUES (3, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/uploads/file/*filepath', 'GET');
INSERT INTO `sys_ignore_apis` VALUES (4, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/health', 'GET');
INSERT INTO `sys_ignore_apis` VALUES (5, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/uploads/file/*filepath', 'HEAD');
INSERT INTO `sys_ignore_apis` VALUES (6, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/autoCode/llmAuto', 'POST');
INSERT INTO `sys_ignore_apis` VALUES (7, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/system/reloadSystem', 'POST');
INSERT INTO `sys_ignore_apis` VALUES (8, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/base/login', 'POST');
INSERT INTO `sys_ignore_apis` VALUES (9, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/base/captcha', 'POST');
INSERT INTO `sys_ignore_apis` VALUES (10, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/init/initdb', 'POST');
INSERT INTO `sys_ignore_apis` VALUES (11, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/init/checkdb', 'POST');
INSERT INTO `sys_ignore_apis` VALUES (12, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/info/getInfoDataSource', 'GET');
INSERT INTO `sys_ignore_apis` VALUES (13, '2026-01-06 18:06:56.266', '2026-01-06 18:06:56.266', NULL, '/info/getInfoPublic', 'GET');

-- ----------------------------
-- Table structure for sys_operation_records
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_records`;
CREATE TABLE `sys_operation_records`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `status` bigint(20) NULL DEFAULT NULL COMMENT '请求状态',
  `latency` bigint(20) NULL DEFAULT NULL COMMENT '延迟',
  `agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '代理',
  `error_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求Body',
  `resp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应Body',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_operation_records_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_records
-- ----------------------------

-- ----------------------------
-- Table structure for sys_params
-- ----------------------------
DROP TABLE IF EXISTS `sys_params`;
CREATE TABLE `sys_params`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键',
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `desc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数说明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_params_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_params
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_authority`;
CREATE TABLE `sys_user_authority`  (
  `sys_user_id` bigint(20) UNSIGNED NOT NULL,
  `sys_authority_authority_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`, `sys_authority_authority_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_authority
-- ----------------------------
INSERT INTO `sys_user_authority` VALUES (1, 888);
INSERT INTO `sys_user_authority` VALUES (1, 8881);
INSERT INTO `sys_user_authority` VALUES (1, 9528);
INSERT INTO `sys_user_authority` VALUES (2, 888);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '系统用户' COMMENT '用户昵称',
  `header_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `authority_id` bigint(20) UNSIGNED NULL DEFAULT 888 COMMENT '用户角色ID',
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `enable` bigint(20) NULL DEFAULT 1 COMMENT '用户是否被冻结 1正常 2冻结',
  `origin_setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_users_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_users_uuid`(`uuid`) USING BTREE,
  INDEX `idx_sys_users_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, '2026-01-06 18:07:03.270', '2026-01-06 18:07:03.420', NULL, '2cbdc0ed-8738-4d60-9be2-28d51da7475a', 'admin', '$2a$10$Rbgp2.tQWkY1jY7///ugmuMuSry/K1gfF5eettrCC5O5yVpN10IJ.', 'Mr.奇淼', 'https://qmplusimg.henrongyi.top/gva_header.jpg', 888, '17611111111', '333333333@qq.com', 1, NULL);
INSERT INTO `sys_users` VALUES (2, '2026-01-06 18:07:03.270', '2026-01-06 18:07:03.962', NULL, '00161424-9ae7-42a0-8532-408df51bc20b', 'a303176530', '$2a$10$StdhaC/hapAOg4icHCAgUuI0gxodQD2u/1CHHOmBRmPPp8WW39cbq', '用户1', 'https://qmplusimg.henrongyi.top/1572075907logo.png', 9528, '17611111111', '333333333@qq.com', 1, NULL);

-- ----------------------------
-- Table structure for sys_versions
-- ----------------------------
DROP TABLE IF EXISTS `sys_versions`;
CREATE TABLE `sys_versions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `version_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `version_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本描述',
  `version_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '版本数据JSON',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_versions_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_versions
-- ----------------------------

-- ----------------------------
-- Table structure for user_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ancestor_id` int(11) NOT NULL DEFAULT 0 COMMENT '祖先id',
  `descendant_id` int(11) NOT NULL COMMENT '后代代理ID（下级代理，可为直接或间接下级）',
  `depth` int(11) NOT NULL DEFAULT 0 COMMENT '层级深度：0=自身，1=直接上下级，2+=间接上下级',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间（逻辑删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户邀请关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_relation
-- ----------------------------
INSERT INTO `user_relation` VALUES (1, 1, 1, 0, NULL, NULL, NULL);
INSERT INTO `user_relation` VALUES (8, 1, 2, 1, NULL, NULL, NULL);
INSERT INTO `user_relation` VALUES (9, 1, 3, 2, NULL, NULL, NULL);
INSERT INTO `user_relation` VALUES (10, 1, 4, 3, NULL, NULL, NULL);
INSERT INTO `user_relation` VALUES (11, 1, 5, 3, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
