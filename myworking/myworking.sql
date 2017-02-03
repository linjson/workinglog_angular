/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50534
Source Host           : localhost:3306
Source Database       : myworking

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2015-09-11 15:58:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(1000) DEFAULT NULL,
  `modifytime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES ('1', 'livebos平台', '2015-04-15 20:07:49', '2015-04-15 20:07:54');
INSERT INTO `projects` VALUES ('2', 'test', '2015-04-15 20:11:45', '2015-04-15 20:11:49');

-- ----------------------------
-- Table structure for working
-- ----------------------------
DROP TABLE IF EXISTS `working`;
CREATE TABLE `working` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `worktime` decimal(10,1) DEFAULT NULL,
  `worktype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of working
-- ----------------------------
INSERT INTO `working` VALUES ('1', '1', '完成剩下10%的消息模块', '2015-04-13 20:10:23', '7.5', null);
INSERT INTO `working` VALUES ('2', '1', '项目代码进行测试,整合及接入百度推送', '2015-04-15 20:13:11', '7.5', null);
INSERT INTO `working` VALUES ('3', '1', '开发livebos,android平台的主页(50%)', '2015-04-15 20:11:36', '7.5', null);
INSERT INTO `working` VALUES ('6', '1', '开发livebos,android平台的主页(100%),并接入消息模块,已提交代码', '2015-04-16 08:13:46', '7.5', null);
INSERT INTO `working` VALUES ('7', '1', '修改主界面按钮变化', '2015-04-17 21:29:38', '7.5', null);
INSERT INTO `working` VALUES ('8', '1', '修改侧边栏及图片圆角', '2015-04-20 20:02:47', '7.5', null);
INSERT INTO `working` VALUES ('9', '1', '重新构建项目引入MAVEN,与googleannotation开发框架,maven已引入SVN,但androidannotation在编译时遇到点问题,未解决', '2015-04-21 08:05:45', '7.5', null);
INSERT INTO `working` VALUES ('10', '1', '已解决androidannotation开发框架的引入及配置gradle编译,开发新闻列表10%', '2015-04-22 08:06:43', '7.5', null);
INSERT INTO `working` VALUES ('11', '1', '完成新闻列表与发评论的功能', '2015-04-23 12:53:53', '7.5', null);
INSERT INTO `working` VALUES ('12', '1', '重新构建主界面,为适应不同模块的标题栏功能,将标题栏拆分到不同的界面中(100%)', '2015-04-24 10:02:13', '7.5', null);
INSERT INTO `working` VALUES ('13', '2', 'sdfsdf', '2010-01-01 00:00:00', '2.0', null);
INSERT INTO `working` VALUES ('16', '1', '完成动态消息列表70%', '2015-04-27 08:32:58', '7.5', null);
INSERT INTO `working` VALUES ('17', '1', '完成动态消息中展示评论列表及删除交互', '2015-04-28 19:20:38', '7.5', null);
INSERT INTO `working` VALUES ('18', '1', '实现表情输入与键盘输入的组件(10%)', '2015-04-28 09:16:39', '1.5', '赶工');
INSERT INTO `working` VALUES ('19', '1', '实现表情输入与键盘输入的组件(90%)', '2015-04-29 09:15:36', '7.5', null);
INSERT INTO `working` VALUES ('20', '1', '实现发动态功能(90%)', '2015-04-30 09:15:25', '7.5', null);
INSERT INTO `working` VALUES ('33', '2', 'ssss', '2015-05-01 00:00:00', '0.0', null);
INSERT INTO `working` VALUES ('35', '1', '解决表情输入与键盘输入的交互问题(100%)', '2015-04-29 00:00:00', '1.5', '赶工');
INSERT INTO `working` VALUES ('39', '1', '完成发动态的功能,解决fragment嵌套运用时,事件重复监听的问题', '2015-05-04 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('40', '1', '修改表情输入在fragment嵌套中使用的BUG,以修改自定义TOAST类,并修正涉及到的引用类', '2015-05-05 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('41', '1', '完成流程中心列表', '2015-05-07 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('42', '1', '处理fragment事件注册与注销的时机', '2015-05-06 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('43', '1', '启动流程功能完成90%', '2015-05-08 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('44', '1', '修改代码,及BUG', '2015-05-11 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('45', '1', '修改部分代码规范问题及完成动态消息原图显示的界面', '2015-05-12 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('55', '2', 'sd', '2015-05-13 00:00:00', '0.0', null);
INSERT INTO `working` VALUES ('56', '2', 'sdf', '2015-05-13 00:00:00', '0.0', null);
INSERT INTO `working` VALUES ('61', '1', '研究maven或是gradle打包成AAR格式 ,并在eclipse里的使用,但是失败,在android studio中尝试可使用', '2015-05-13 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('63', '2', null, '2015-05-13 00:00:00', '0.0', null);
INSERT INTO `working` VALUES ('68', '1', '调整标题栏组件', '2015-05-14 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('69', '1', '研究activity单例使用,调整对象操作组件(10%)', '2015-05-15 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('70', '1', '完成对象的操作组件', '2015-05-18 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('71', '1', '学习livebos 的基础组件及使用,替换下拉listview组件', '2015-05-19 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('72', '1', '优化低内存时,缓存消失的问题,及防止多进程application多次运行的问题', '2015-05-20 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('73', '1', '修改消息模块BUG', '2015-05-21 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('74', '1', '优化消息模块', '2015-05-22 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('75', '1', '优化推送UI响应', '2015-05-25 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('76', '1', '修改动态模块BUG', '2015-05-26 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('77', '1', '优化动态消息列表,修改TOAST显示位置', '2015-05-27 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('78', '1', '增加扫一扫显示WEB功能,修改下拉组件', '2015-05-28 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('79', '1', '添加消息自定义类型的显示', '2015-05-30 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('80', '1', '优化notify接口与message接口数据不对称问题', '2015-06-01 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('81', '1', '改进侧滑效果', '2015-06-02 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('82', '1', '完成手势密码锁', '2015-06-03 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('83', '1', '调整图片资源,修复swipelistview的BUG,但未解决', '2015-06-04 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('84', '1', '解决SWIPTLISTVIEW的BUG', '2015-06-05 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('85', '1', '修改流程处理状态,及混淆编译后进行测试', '2015-06-08 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('86', '1', '混淆编译测试', '2015-06-09 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('87', '1', '修改留言选择人BUG', '2015-06-10 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('88', '1', '修改态动消息模块表情发送BUG', '2015-06-11 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('89', '1', '添加对HTTPS请求的支持,及添加不自动提醒更新的功能', '2015-06-12 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('90', '1', '添加通知的声音与振动的控制选项', '2015-06-15 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('91', '1', '修改动态BUG,学习Ion,Volley等网络请求库', '2015-06-16 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('92', '1', '重构部分代码,学习皮肤切换', '2015-06-17 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('93', '1', '代码重构', '2015-06-18 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('94', '1', '解决livebos偶尔不能退出的问题,学习代码改善设计', '2015-06-19 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('95', '1', '增加两种皮肤切换', '2015-06-24 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('96', '1', '学习第三方写的动态表单实现', '2015-06-25 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('97', '1', '学习自定义recycleview.layoutmanager类', '2015-06-23 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('98', '1', '学习动态表单的数据结构', '2015-06-26 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('99', '1', '开发动态表单5%', '2015-06-29 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('100', '1', '开发动态表单10%', '2015-06-30 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('101', '1', '学习MPAndroidchart图表组件', '2015-07-01 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('102', '1', '学习MPAndroidchart源码', '2015-07-02 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('103', '1', '基于MPAndroidchart组件开发仪表盘图表', '2015-07-03 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('104', '1', '完成仪表盘80%', '2015-07-06 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('105', '1', '完成仪表盘，学习ionic+angularjs框架', '2015-07-07 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('106', '1', '学习Reactjs库', '2015-07-08 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('107', '1', '完成动态表单泛对象的显示', '2015-07-09 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('108', '1', '完成文件上传40%', '2015-07-10 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('109', '1', '完成单、多文件上传80%', '2015-07-13 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('110', '1', '完成单、多文件上传，颜色选择组件', '2015-07-14 00:00:00', '4.5', null);
INSERT INTO `working` VALUES ('111', '1', '完成图片上传', '2015-07-15 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('112', '1', '完成表单事件动作40%', '2015-07-16 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('113', '1', '完成表单事件动作', '2015-07-17 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('114', '1', '修改动态表单BUG，开发富文本控件20%', '2015-07-20 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('115', '1', '开发富文本控件40%', '2015-07-21 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('116', '1', '完成动态表单的数据集查询，开发HTML富文本60%', '2015-07-22 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('117', '1', '完成html富文本100%', '2015-07-23 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('118', '1', '由于html富文本的部分JS命令在webview上的兼容性上有问题,用crosswalk上做了尝试,结果是可以使用的,但包会比较大,参加公司培训', '2015-07-24 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('119', '1', '完成HTML富文本在livebos的使用，完成流程图与流程明细的显示', '2015-07-27 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('120', '1', '完成流程意见的组件50%', '2015-07-28 00:00:00', '3.5', null);
INSERT INTO `working` VALUES ('121', '1', '完成流程意见组件100%，开发流程审批人“动作“操作20%', '2015-07-29 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('122', '1', '完成流程审批人“动作“操作100%', '2015-07-30 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('123', '1', '完成流程“干预\",\"审批人\"的操作', '2015-07-31 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('124', '1', '修改动态表单的部分BUG', '2015-08-03 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('125', '1', '学习livebos studio如何配置移动端的应用项', '2015-08-04 00:00:00', '3.5', null);
INSERT INTO `working` VALUES ('126', '1', '优化表单的数据传递', '2015-08-05 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('127', '1', '修改扫一扫功能,学习使用livebos studio', '2015-08-06 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('128', '1', '学习使用livebos studio', '2015-08-07 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('129', '1', '开发地图组件20%', '2015-08-11 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('130', '1', '开发地图组件100%', '2015-08-12 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('131', '1', '测试livebos移动端,增加配置项(表单形式切换)', '2015-08-10 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('132', '1', '增加对象查看功能', '2015-08-14 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('133', '1', '学习使用livebos', '2015-08-13 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('134', '1', '尝试使用leakcanary第三方库测试内存泄露的问题', '2015-08-17 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('135', '1', '修改autofittext,flowlayout组件的BUG', '2015-08-21 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('136', '1', '为熟悉liveBOS移动端的配置,练习表单开发的流程(10%)', '2015-08-18 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('137', '1', '练习表单开发的流程(20%)', '2015-08-19 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('138', '1', '练习表单开发的流程(30%)', '2015-08-20 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('139', '1', '练习表单开发的流程(35%)', '2015-08-24 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('140', '1', '练习表单开发的流程(40%)', '2015-08-25 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('141', '1', '练习表单开发的流程(45%)', '2015-08-26 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('142', '1', '练习表单开发的流程(50%)', '2015-08-27 00:00:00', '7.5', null);
INSERT INTO `working` VALUES ('143', '1', '练习表单开发的流程(55%)', '2015-08-28 00:00:00', '7.5', null);
