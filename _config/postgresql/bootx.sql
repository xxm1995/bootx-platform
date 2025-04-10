/*
 Navicat Premium Data Transfer

 Source Server         : 京东云PG
 Source Server Type    : PostgreSQL
 Source Server Version : 160004 (160004)
 Source Host           : postgresql:5432
 Source Catalog        : bootx-platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160004 (160004)
 File Encoding         : 65001

 Date: 10/04/2025 15:47:34
*/


-- ----------------------------
-- Table structure for base_area
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_area";
CREATE TABLE "public"."base_area" (
  "code" char(6) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "city_code" char(4) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."base_area"."name" IS '区域名称';
COMMENT ON COLUMN "public"."base_area"."city_code" IS '城市编码';
COMMENT ON TABLE "public"."base_area" IS '县区表';

-- ----------------------------
-- Records of base_area
-- ----------------------------
INSERT INTO "public"."base_area" VALUES ('110101', '东城区', '1101');
INSERT INTO "public"."base_area" VALUES ('110102', '西城区', '1101');
INSERT INTO "public"."base_area" VALUES ('110105', '朝阳区', '1101');
INSERT INTO "public"."base_area" VALUES ('110106', '丰台区', '1101');
INSERT INTO "public"."base_area" VALUES ('110107', '石景山区', '1101');
INSERT INTO "public"."base_area" VALUES ('110108', '海淀区', '1101');
INSERT INTO "public"."base_area" VALUES ('110109', '门头沟区', '1101');
INSERT INTO "public"."base_area" VALUES ('110111', '房山区', '1101');
INSERT INTO "public"."base_area" VALUES ('110112', '通州区', '1101');
INSERT INTO "public"."base_area" VALUES ('110113', '顺义区', '1101');
INSERT INTO "public"."base_area" VALUES ('110114', '昌平区', '1101');
INSERT INTO "public"."base_area" VALUES ('110115', '大兴区', '1101');
INSERT INTO "public"."base_area" VALUES ('110116', '怀柔区', '1101');
INSERT INTO "public"."base_area" VALUES ('110117', '平谷区', '1101');
INSERT INTO "public"."base_area" VALUES ('110118', '密云区', '1101');
INSERT INTO "public"."base_area" VALUES ('110119', '延庆区', '1101');
INSERT INTO "public"."base_area" VALUES ('120101', '和平区', '1201');
INSERT INTO "public"."base_area" VALUES ('120102', '河东区', '1201');
INSERT INTO "public"."base_area" VALUES ('120103', '河西区', '1201');
INSERT INTO "public"."base_area" VALUES ('120104', '南开区', '1201');
INSERT INTO "public"."base_area" VALUES ('120105', '河北区', '1201');
INSERT INTO "public"."base_area" VALUES ('120106', '红桥区', '1201');
INSERT INTO "public"."base_area" VALUES ('120110', '东丽区', '1201');
INSERT INTO "public"."base_area" VALUES ('120111', '西青区', '1201');
INSERT INTO "public"."base_area" VALUES ('120112', '津南区', '1201');
INSERT INTO "public"."base_area" VALUES ('120113', '北辰区', '1201');
INSERT INTO "public"."base_area" VALUES ('120114', '武清区', '1201');
INSERT INTO "public"."base_area" VALUES ('120115', '宝坻区', '1201');
INSERT INTO "public"."base_area" VALUES ('120116', '滨海新区', '1201');
INSERT INTO "public"."base_area" VALUES ('120117', '宁河区', '1201');
INSERT INTO "public"."base_area" VALUES ('120118', '静海区', '1201');
INSERT INTO "public"."base_area" VALUES ('120119', '蓟州区', '1201');
INSERT INTO "public"."base_area" VALUES ('130102', '长安区', '1301');
INSERT INTO "public"."base_area" VALUES ('130104', '桥西区', '1301');
INSERT INTO "public"."base_area" VALUES ('130105', '新华区', '1301');
INSERT INTO "public"."base_area" VALUES ('130107', '井陉矿区', '1301');
INSERT INTO "public"."base_area" VALUES ('130108', '裕华区', '1301');
INSERT INTO "public"."base_area" VALUES ('130109', '藁城区', '1301');
INSERT INTO "public"."base_area" VALUES ('130110', '鹿泉区', '1301');
INSERT INTO "public"."base_area" VALUES ('130111', '栾城区', '1301');
INSERT INTO "public"."base_area" VALUES ('130121', '井陉县', '1301');
INSERT INTO "public"."base_area" VALUES ('130123', '正定县', '1301');
INSERT INTO "public"."base_area" VALUES ('130125', '行唐县', '1301');
INSERT INTO "public"."base_area" VALUES ('130126', '灵寿县', '1301');
INSERT INTO "public"."base_area" VALUES ('130127', '高邑县', '1301');
INSERT INTO "public"."base_area" VALUES ('130128', '深泽县', '1301');
INSERT INTO "public"."base_area" VALUES ('130129', '赞皇县', '1301');
INSERT INTO "public"."base_area" VALUES ('130130', '无极县', '1301');
INSERT INTO "public"."base_area" VALUES ('130131', '平山县', '1301');
INSERT INTO "public"."base_area" VALUES ('130132', '元氏县', '1301');
INSERT INTO "public"."base_area" VALUES ('130133', '赵县', '1301');
INSERT INTO "public"."base_area" VALUES ('130171', '石家庄高新技术产业开发区', '1301');
INSERT INTO "public"."base_area" VALUES ('130172', '石家庄循环化工园区', '1301');
INSERT INTO "public"."base_area" VALUES ('130181', '辛集市', '1301');
INSERT INTO "public"."base_area" VALUES ('130183', '晋州市', '1301');
INSERT INTO "public"."base_area" VALUES ('130184', '新乐市', '1301');
INSERT INTO "public"."base_area" VALUES ('130202', '路南区', '1302');
INSERT INTO "public"."base_area" VALUES ('130203', '路北区', '1302');
INSERT INTO "public"."base_area" VALUES ('130204', '古冶区', '1302');
INSERT INTO "public"."base_area" VALUES ('130205', '开平区', '1302');
INSERT INTO "public"."base_area" VALUES ('130207', '丰南区', '1302');
INSERT INTO "public"."base_area" VALUES ('130208', '丰润区', '1302');
INSERT INTO "public"."base_area" VALUES ('130209', '曹妃甸区', '1302');
INSERT INTO "public"."base_area" VALUES ('130224', '滦南县', '1302');
INSERT INTO "public"."base_area" VALUES ('130225', '乐亭县', '1302');
INSERT INTO "public"."base_area" VALUES ('130227', '迁西县', '1302');
INSERT INTO "public"."base_area" VALUES ('130229', '玉田县', '1302');
INSERT INTO "public"."base_area" VALUES ('130271', '河北唐山芦台经济开发区', '1302');
INSERT INTO "public"."base_area" VALUES ('130272', '唐山市汉沽管理区', '1302');
INSERT INTO "public"."base_area" VALUES ('130273', '唐山高新技术产业开发区', '1302');
INSERT INTO "public"."base_area" VALUES ('130274', '河北唐山海港经济开发区', '1302');
INSERT INTO "public"."base_area" VALUES ('130281', '遵化市', '1302');
INSERT INTO "public"."base_area" VALUES ('130283', '迁安市', '1302');
INSERT INTO "public"."base_area" VALUES ('130284', '滦州市', '1302');
INSERT INTO "public"."base_area" VALUES ('130302', '海港区', '1303');
INSERT INTO "public"."base_area" VALUES ('130303', '山海关区', '1303');
INSERT INTO "public"."base_area" VALUES ('130304', '北戴河区', '1303');
INSERT INTO "public"."base_area" VALUES ('130306', '抚宁区', '1303');
INSERT INTO "public"."base_area" VALUES ('130321', '青龙满族自治县', '1303');
INSERT INTO "public"."base_area" VALUES ('130322', '昌黎县', '1303');
INSERT INTO "public"."base_area" VALUES ('130324', '卢龙县', '1303');
INSERT INTO "public"."base_area" VALUES ('130371', '秦皇岛市经济技术开发区', '1303');
INSERT INTO "public"."base_area" VALUES ('130372', '北戴河新区', '1303');
INSERT INTO "public"."base_area" VALUES ('130402', '邯山区', '1304');
INSERT INTO "public"."base_area" VALUES ('130403', '丛台区', '1304');
INSERT INTO "public"."base_area" VALUES ('130404', '复兴区', '1304');
INSERT INTO "public"."base_area" VALUES ('130406', '峰峰矿区', '1304');
INSERT INTO "public"."base_area" VALUES ('130407', '肥乡区', '1304');
INSERT INTO "public"."base_area" VALUES ('130408', '永年区', '1304');
INSERT INTO "public"."base_area" VALUES ('130423', '临漳县', '1304');
INSERT INTO "public"."base_area" VALUES ('130424', '成安县', '1304');
INSERT INTO "public"."base_area" VALUES ('130425', '大名县', '1304');
INSERT INTO "public"."base_area" VALUES ('130426', '涉县', '1304');
INSERT INTO "public"."base_area" VALUES ('130427', '磁县', '1304');
INSERT INTO "public"."base_area" VALUES ('130430', '邱县', '1304');
INSERT INTO "public"."base_area" VALUES ('130431', '鸡泽县', '1304');
INSERT INTO "public"."base_area" VALUES ('130432', '广平县', '1304');
INSERT INTO "public"."base_area" VALUES ('130433', '馆陶县', '1304');
INSERT INTO "public"."base_area" VALUES ('130434', '魏县', '1304');
INSERT INTO "public"."base_area" VALUES ('130435', '曲周县', '1304');
INSERT INTO "public"."base_area" VALUES ('130471', '邯郸经济技术开发区', '1304');
INSERT INTO "public"."base_area" VALUES ('130473', '邯郸冀南新区', '1304');
INSERT INTO "public"."base_area" VALUES ('130481', '武安市', '1304');
INSERT INTO "public"."base_area" VALUES ('130502', '襄都区', '1305');
INSERT INTO "public"."base_area" VALUES ('130503', '信都区', '1305');
INSERT INTO "public"."base_area" VALUES ('130505', '任泽区', '1305');
INSERT INTO "public"."base_area" VALUES ('130506', '南和区', '1305');
INSERT INTO "public"."base_area" VALUES ('130522', '临城县', '1305');
INSERT INTO "public"."base_area" VALUES ('130523', '内丘县', '1305');
INSERT INTO "public"."base_area" VALUES ('130524', '柏乡县', '1305');
INSERT INTO "public"."base_area" VALUES ('130525', '隆尧县', '1305');
INSERT INTO "public"."base_area" VALUES ('130528', '宁晋县', '1305');
INSERT INTO "public"."base_area" VALUES ('130529', '巨鹿县', '1305');
INSERT INTO "public"."base_area" VALUES ('130530', '新河县', '1305');
INSERT INTO "public"."base_area" VALUES ('130531', '广宗县', '1305');
INSERT INTO "public"."base_area" VALUES ('130532', '平乡县', '1305');
INSERT INTO "public"."base_area" VALUES ('130533', '威县', '1305');
INSERT INTO "public"."base_area" VALUES ('130534', '清河县', '1305');
INSERT INTO "public"."base_area" VALUES ('130535', '临西县', '1305');
INSERT INTO "public"."base_area" VALUES ('130571', '河北邢台经济开发区', '1305');
INSERT INTO "public"."base_area" VALUES ('130581', '南宫市', '1305');
INSERT INTO "public"."base_area" VALUES ('130582', '沙河市', '1305');
INSERT INTO "public"."base_area" VALUES ('130602', '竞秀区', '1306');
INSERT INTO "public"."base_area" VALUES ('130606', '莲池区', '1306');
INSERT INTO "public"."base_area" VALUES ('130607', '满城区', '1306');
INSERT INTO "public"."base_area" VALUES ('130608', '清苑区', '1306');
INSERT INTO "public"."base_area" VALUES ('130609', '徐水区', '1306');
INSERT INTO "public"."base_area" VALUES ('130623', '涞水县', '1306');
INSERT INTO "public"."base_area" VALUES ('130624', '阜平县', '1306');
INSERT INTO "public"."base_area" VALUES ('130626', '定兴县', '1306');
INSERT INTO "public"."base_area" VALUES ('130627', '唐县', '1306');
INSERT INTO "public"."base_area" VALUES ('130628', '高阳县', '1306');
INSERT INTO "public"."base_area" VALUES ('130629', '容城县', '1306');
INSERT INTO "public"."base_area" VALUES ('130630', '涞源县', '1306');
INSERT INTO "public"."base_area" VALUES ('130631', '望都县', '1306');
INSERT INTO "public"."base_area" VALUES ('130632', '安新县', '1306');
INSERT INTO "public"."base_area" VALUES ('130633', '易县', '1306');
INSERT INTO "public"."base_area" VALUES ('130634', '曲阳县', '1306');
INSERT INTO "public"."base_area" VALUES ('130635', '蠡县', '1306');
INSERT INTO "public"."base_area" VALUES ('130636', '顺平县', '1306');
INSERT INTO "public"."base_area" VALUES ('130637', '博野县', '1306');
INSERT INTO "public"."base_area" VALUES ('130638', '雄县', '1306');
INSERT INTO "public"."base_area" VALUES ('130671', '保定高新技术产业开发区', '1306');
INSERT INTO "public"."base_area" VALUES ('130672', '保定白沟新城', '1306');
INSERT INTO "public"."base_area" VALUES ('130681', '涿州市', '1306');
INSERT INTO "public"."base_area" VALUES ('130682', '定州市', '1306');
INSERT INTO "public"."base_area" VALUES ('130683', '安国市', '1306');
INSERT INTO "public"."base_area" VALUES ('130684', '高碑店市', '1306');
INSERT INTO "public"."base_area" VALUES ('130702', '桥东区', '1307');
INSERT INTO "public"."base_area" VALUES ('130703', '桥西区', '1307');
INSERT INTO "public"."base_area" VALUES ('130705', '宣化区', '1307');
INSERT INTO "public"."base_area" VALUES ('130706', '下花园区', '1307');
INSERT INTO "public"."base_area" VALUES ('130708', '万全区', '1307');
INSERT INTO "public"."base_area" VALUES ('130709', '崇礼区', '1307');
INSERT INTO "public"."base_area" VALUES ('130722', '张北县', '1307');
INSERT INTO "public"."base_area" VALUES ('130723', '康保县', '1307');
INSERT INTO "public"."base_area" VALUES ('130724', '沽源县', '1307');
INSERT INTO "public"."base_area" VALUES ('130725', '尚义县', '1307');
INSERT INTO "public"."base_area" VALUES ('130726', '蔚县', '1307');
INSERT INTO "public"."base_area" VALUES ('130727', '阳原县', '1307');
INSERT INTO "public"."base_area" VALUES ('130728', '怀安县', '1307');
INSERT INTO "public"."base_area" VALUES ('130730', '怀来县', '1307');
INSERT INTO "public"."base_area" VALUES ('130731', '涿鹿县', '1307');
INSERT INTO "public"."base_area" VALUES ('130732', '赤城县', '1307');
INSERT INTO "public"."base_area" VALUES ('130771', '张家口经济开发区', '1307');
INSERT INTO "public"."base_area" VALUES ('130772', '张家口市察北管理区', '1307');
INSERT INTO "public"."base_area" VALUES ('130773', '张家口市塞北管理区', '1307');
INSERT INTO "public"."base_area" VALUES ('130802', '双桥区', '1308');
INSERT INTO "public"."base_area" VALUES ('130803', '双滦区', '1308');
INSERT INTO "public"."base_area" VALUES ('130804', '鹰手营子矿区', '1308');
INSERT INTO "public"."base_area" VALUES ('130821', '承德县', '1308');
INSERT INTO "public"."base_area" VALUES ('130822', '兴隆县', '1308');
INSERT INTO "public"."base_area" VALUES ('130824', '滦平县', '1308');
INSERT INTO "public"."base_area" VALUES ('130825', '隆化县', '1308');
INSERT INTO "public"."base_area" VALUES ('130826', '丰宁满族自治县', '1308');
INSERT INTO "public"."base_area" VALUES ('130827', '宽城满族自治县', '1308');
INSERT INTO "public"."base_area" VALUES ('130828', '围场满族蒙古族自治县', '1308');
INSERT INTO "public"."base_area" VALUES ('130871', '承德高新技术产业开发区', '1308');
INSERT INTO "public"."base_area" VALUES ('130881', '平泉市', '1308');
INSERT INTO "public"."base_area" VALUES ('130902', '新华区', '1309');
INSERT INTO "public"."base_area" VALUES ('130903', '运河区', '1309');
INSERT INTO "public"."base_area" VALUES ('130921', '沧县', '1309');
INSERT INTO "public"."base_area" VALUES ('130922', '青县', '1309');
INSERT INTO "public"."base_area" VALUES ('130923', '东光县', '1309');
INSERT INTO "public"."base_area" VALUES ('130924', '海兴县', '1309');
INSERT INTO "public"."base_area" VALUES ('130925', '盐山县', '1309');
INSERT INTO "public"."base_area" VALUES ('130926', '肃宁县', '1309');
INSERT INTO "public"."base_area" VALUES ('130927', '南皮县', '1309');
INSERT INTO "public"."base_area" VALUES ('130928', '吴桥县', '1309');
INSERT INTO "public"."base_area" VALUES ('130929', '献县', '1309');
INSERT INTO "public"."base_area" VALUES ('130930', '孟村回族自治县', '1309');
INSERT INTO "public"."base_area" VALUES ('130971', '河北沧州经济开发区', '1309');
INSERT INTO "public"."base_area" VALUES ('130972', '沧州高新技术产业开发区', '1309');
INSERT INTO "public"."base_area" VALUES ('130973', '沧州渤海新区', '1309');
INSERT INTO "public"."base_area" VALUES ('130981', '泊头市', '1309');
INSERT INTO "public"."base_area" VALUES ('130982', '任丘市', '1309');
INSERT INTO "public"."base_area" VALUES ('130983', '黄骅市', '1309');
INSERT INTO "public"."base_area" VALUES ('130984', '河间市', '1309');
INSERT INTO "public"."base_area" VALUES ('131002', '安次区', '1310');
INSERT INTO "public"."base_area" VALUES ('131003', '广阳区', '1310');
INSERT INTO "public"."base_area" VALUES ('131022', '固安县', '1310');
INSERT INTO "public"."base_area" VALUES ('131023', '永清县', '1310');
INSERT INTO "public"."base_area" VALUES ('131024', '香河县', '1310');
INSERT INTO "public"."base_area" VALUES ('131025', '大城县', '1310');
INSERT INTO "public"."base_area" VALUES ('131026', '文安县', '1310');
INSERT INTO "public"."base_area" VALUES ('131028', '大厂回族自治县', '1310');
INSERT INTO "public"."base_area" VALUES ('131071', '廊坊经济技术开发区', '1310');
INSERT INTO "public"."base_area" VALUES ('131081', '霸州市', '1310');
INSERT INTO "public"."base_area" VALUES ('131082', '三河市', '1310');
INSERT INTO "public"."base_area" VALUES ('131102', '桃城区', '1311');
INSERT INTO "public"."base_area" VALUES ('131103', '冀州区', '1311');
INSERT INTO "public"."base_area" VALUES ('131121', '枣强县', '1311');
INSERT INTO "public"."base_area" VALUES ('131122', '武邑县', '1311');
INSERT INTO "public"."base_area" VALUES ('131123', '武强县', '1311');
INSERT INTO "public"."base_area" VALUES ('131124', '饶阳县', '1311');
INSERT INTO "public"."base_area" VALUES ('131125', '安平县', '1311');
INSERT INTO "public"."base_area" VALUES ('131126', '故城县', '1311');
INSERT INTO "public"."base_area" VALUES ('131127', '景县', '1311');
INSERT INTO "public"."base_area" VALUES ('131128', '阜城县', '1311');
INSERT INTO "public"."base_area" VALUES ('131171', '河北衡水高新技术产业开发区', '1311');
INSERT INTO "public"."base_area" VALUES ('131172', '衡水滨湖新区', '1311');
INSERT INTO "public"."base_area" VALUES ('131182', '深州市', '1311');
INSERT INTO "public"."base_area" VALUES ('140105', '小店区', '1401');
INSERT INTO "public"."base_area" VALUES ('140106', '迎泽区', '1401');
INSERT INTO "public"."base_area" VALUES ('140107', '杏花岭区', '1401');
INSERT INTO "public"."base_area" VALUES ('140108', '尖草坪区', '1401');
INSERT INTO "public"."base_area" VALUES ('140109', '万柏林区', '1401');
INSERT INTO "public"."base_area" VALUES ('140110', '晋源区', '1401');
INSERT INTO "public"."base_area" VALUES ('140121', '清徐县', '1401');
INSERT INTO "public"."base_area" VALUES ('140122', '阳曲县', '1401');
INSERT INTO "public"."base_area" VALUES ('140123', '娄烦县', '1401');
INSERT INTO "public"."base_area" VALUES ('140171', '山西转型综合改革示范区', '1401');
INSERT INTO "public"."base_area" VALUES ('140181', '古交市', '1401');
INSERT INTO "public"."base_area" VALUES ('140212', '新荣区', '1402');
INSERT INTO "public"."base_area" VALUES ('140213', '平城区', '1402');
INSERT INTO "public"."base_area" VALUES ('140214', '云冈区', '1402');
INSERT INTO "public"."base_area" VALUES ('140215', '云州区', '1402');
INSERT INTO "public"."base_area" VALUES ('140221', '阳高县', '1402');
INSERT INTO "public"."base_area" VALUES ('140222', '天镇县', '1402');
INSERT INTO "public"."base_area" VALUES ('140223', '广灵县', '1402');
INSERT INTO "public"."base_area" VALUES ('140224', '灵丘县', '1402');
INSERT INTO "public"."base_area" VALUES ('140225', '浑源县', '1402');
INSERT INTO "public"."base_area" VALUES ('140226', '左云县', '1402');
INSERT INTO "public"."base_area" VALUES ('140271', '山西大同经济开发区', '1402');
INSERT INTO "public"."base_area" VALUES ('140302', '城区', '1403');
INSERT INTO "public"."base_area" VALUES ('140303', '矿区', '1403');
INSERT INTO "public"."base_area" VALUES ('140311', '郊区', '1403');
INSERT INTO "public"."base_area" VALUES ('140321', '平定县', '1403');
INSERT INTO "public"."base_area" VALUES ('140322', '盂县', '1403');
INSERT INTO "public"."base_area" VALUES ('140403', '潞州区', '1404');
INSERT INTO "public"."base_area" VALUES ('140404', '上党区', '1404');
INSERT INTO "public"."base_area" VALUES ('140405', '屯留区', '1404');
INSERT INTO "public"."base_area" VALUES ('140406', '潞城区', '1404');
INSERT INTO "public"."base_area" VALUES ('140423', '襄垣县', '1404');
INSERT INTO "public"."base_area" VALUES ('140425', '平顺县', '1404');
INSERT INTO "public"."base_area" VALUES ('140426', '黎城县', '1404');
INSERT INTO "public"."base_area" VALUES ('140427', '壶关县', '1404');
INSERT INTO "public"."base_area" VALUES ('140428', '长子县', '1404');
INSERT INTO "public"."base_area" VALUES ('140429', '武乡县', '1404');
INSERT INTO "public"."base_area" VALUES ('140430', '沁县', '1404');
INSERT INTO "public"."base_area" VALUES ('140431', '沁源县', '1404');
INSERT INTO "public"."base_area" VALUES ('140471', '山西长治高新技术产业园区', '1404');
INSERT INTO "public"."base_area" VALUES ('140502', '城区', '1405');
INSERT INTO "public"."base_area" VALUES ('140521', '沁水县', '1405');
INSERT INTO "public"."base_area" VALUES ('140522', '阳城县', '1405');
INSERT INTO "public"."base_area" VALUES ('140524', '陵川县', '1405');
INSERT INTO "public"."base_area" VALUES ('140525', '泽州县', '1405');
INSERT INTO "public"."base_area" VALUES ('140581', '高平市', '1405');
INSERT INTO "public"."base_area" VALUES ('140602', '朔城区', '1406');
INSERT INTO "public"."base_area" VALUES ('140603', '平鲁区', '1406');
INSERT INTO "public"."base_area" VALUES ('140621', '山阴县', '1406');
INSERT INTO "public"."base_area" VALUES ('140622', '应县', '1406');
INSERT INTO "public"."base_area" VALUES ('140623', '右玉县', '1406');
INSERT INTO "public"."base_area" VALUES ('140671', '山西朔州经济开发区', '1406');
INSERT INTO "public"."base_area" VALUES ('140681', '怀仁市', '1406');
INSERT INTO "public"."base_area" VALUES ('140702', '榆次区', '1407');
INSERT INTO "public"."base_area" VALUES ('140703', '太谷区', '1407');
INSERT INTO "public"."base_area" VALUES ('140721', '榆社县', '1407');
INSERT INTO "public"."base_area" VALUES ('140722', '左权县', '1407');
INSERT INTO "public"."base_area" VALUES ('140723', '和顺县', '1407');
INSERT INTO "public"."base_area" VALUES ('140724', '昔阳县', '1407');
INSERT INTO "public"."base_area" VALUES ('140725', '寿阳县', '1407');
INSERT INTO "public"."base_area" VALUES ('140727', '祁县', '1407');
INSERT INTO "public"."base_area" VALUES ('140728', '平遥县', '1407');
INSERT INTO "public"."base_area" VALUES ('140729', '灵石县', '1407');
INSERT INTO "public"."base_area" VALUES ('140781', '介休市', '1407');
INSERT INTO "public"."base_area" VALUES ('140802', '盐湖区', '1408');
INSERT INTO "public"."base_area" VALUES ('140821', '临猗县', '1408');
INSERT INTO "public"."base_area" VALUES ('140822', '万荣县', '1408');
INSERT INTO "public"."base_area" VALUES ('140823', '闻喜县', '1408');
INSERT INTO "public"."base_area" VALUES ('140824', '稷山县', '1408');
INSERT INTO "public"."base_area" VALUES ('140825', '新绛县', '1408');
INSERT INTO "public"."base_area" VALUES ('140826', '绛县', '1408');
INSERT INTO "public"."base_area" VALUES ('140827', '垣曲县', '1408');
INSERT INTO "public"."base_area" VALUES ('140828', '夏县', '1408');
INSERT INTO "public"."base_area" VALUES ('140829', '平陆县', '1408');
INSERT INTO "public"."base_area" VALUES ('140830', '芮城县', '1408');
INSERT INTO "public"."base_area" VALUES ('140881', '永济市', '1408');
INSERT INTO "public"."base_area" VALUES ('140882', '河津市', '1408');
INSERT INTO "public"."base_area" VALUES ('140902', '忻府区', '1409');
INSERT INTO "public"."base_area" VALUES ('140921', '定襄县', '1409');
INSERT INTO "public"."base_area" VALUES ('140922', '五台县', '1409');
INSERT INTO "public"."base_area" VALUES ('140923', '代县', '1409');
INSERT INTO "public"."base_area" VALUES ('140924', '繁峙县', '1409');
INSERT INTO "public"."base_area" VALUES ('140925', '宁武县', '1409');
INSERT INTO "public"."base_area" VALUES ('140926', '静乐县', '1409');
INSERT INTO "public"."base_area" VALUES ('140927', '神池县', '1409');
INSERT INTO "public"."base_area" VALUES ('140928', '五寨县', '1409');
INSERT INTO "public"."base_area" VALUES ('140929', '岢岚县', '1409');
INSERT INTO "public"."base_area" VALUES ('140930', '河曲县', '1409');
INSERT INTO "public"."base_area" VALUES ('140931', '保德县', '1409');
INSERT INTO "public"."base_area" VALUES ('140932', '偏关县', '1409');
INSERT INTO "public"."base_area" VALUES ('140971', '五台山风景名胜区', '1409');
INSERT INTO "public"."base_area" VALUES ('140981', '原平市', '1409');
INSERT INTO "public"."base_area" VALUES ('141002', '尧都区', '1410');
INSERT INTO "public"."base_area" VALUES ('141021', '曲沃县', '1410');
INSERT INTO "public"."base_area" VALUES ('141022', '翼城县', '1410');
INSERT INTO "public"."base_area" VALUES ('141023', '襄汾县', '1410');
INSERT INTO "public"."base_area" VALUES ('141024', '洪洞县', '1410');
INSERT INTO "public"."base_area" VALUES ('141025', '古县', '1410');
INSERT INTO "public"."base_area" VALUES ('141026', '安泽县', '1410');
INSERT INTO "public"."base_area" VALUES ('141027', '浮山县', '1410');
INSERT INTO "public"."base_area" VALUES ('141028', '吉县', '1410');
INSERT INTO "public"."base_area" VALUES ('141029', '乡宁县', '1410');
INSERT INTO "public"."base_area" VALUES ('141030', '大宁县', '1410');
INSERT INTO "public"."base_area" VALUES ('141031', '隰县', '1410');
INSERT INTO "public"."base_area" VALUES ('141032', '永和县', '1410');
INSERT INTO "public"."base_area" VALUES ('141033', '蒲县', '1410');
INSERT INTO "public"."base_area" VALUES ('141034', '汾西县', '1410');
INSERT INTO "public"."base_area" VALUES ('141081', '侯马市', '1410');
INSERT INTO "public"."base_area" VALUES ('141082', '霍州市', '1410');
INSERT INTO "public"."base_area" VALUES ('141102', '离石区', '1411');
INSERT INTO "public"."base_area" VALUES ('141121', '文水县', '1411');
INSERT INTO "public"."base_area" VALUES ('141122', '交城县', '1411');
INSERT INTO "public"."base_area" VALUES ('141123', '兴县', '1411');
INSERT INTO "public"."base_area" VALUES ('141124', '临县', '1411');
INSERT INTO "public"."base_area" VALUES ('141125', '柳林县', '1411');
INSERT INTO "public"."base_area" VALUES ('141126', '石楼县', '1411');
INSERT INTO "public"."base_area" VALUES ('141127', '岚县', '1411');
INSERT INTO "public"."base_area" VALUES ('141128', '方山县', '1411');
INSERT INTO "public"."base_area" VALUES ('141129', '中阳县', '1411');
INSERT INTO "public"."base_area" VALUES ('141130', '交口县', '1411');
INSERT INTO "public"."base_area" VALUES ('141181', '孝义市', '1411');
INSERT INTO "public"."base_area" VALUES ('141182', '汾阳市', '1411');
INSERT INTO "public"."base_area" VALUES ('150102', '新城区', '1501');
INSERT INTO "public"."base_area" VALUES ('150103', '回民区', '1501');
INSERT INTO "public"."base_area" VALUES ('150104', '玉泉区', '1501');
INSERT INTO "public"."base_area" VALUES ('150105', '赛罕区', '1501');
INSERT INTO "public"."base_area" VALUES ('150121', '土默特左旗', '1501');
INSERT INTO "public"."base_area" VALUES ('150122', '托克托县', '1501');
INSERT INTO "public"."base_area" VALUES ('150123', '和林格尔县', '1501');
INSERT INTO "public"."base_area" VALUES ('150124', '清水河县', '1501');
INSERT INTO "public"."base_area" VALUES ('150125', '武川县', '1501');
INSERT INTO "public"."base_area" VALUES ('150172', '呼和浩特经济技术开发区', '1501');
INSERT INTO "public"."base_area" VALUES ('150202', '东河区', '1502');
INSERT INTO "public"."base_area" VALUES ('150203', '昆都仑区', '1502');
INSERT INTO "public"."base_area" VALUES ('150204', '青山区', '1502');
INSERT INTO "public"."base_area" VALUES ('150205', '石拐区', '1502');
INSERT INTO "public"."base_area" VALUES ('150206', '白云鄂博矿区', '1502');
INSERT INTO "public"."base_area" VALUES ('150207', '九原区', '1502');
INSERT INTO "public"."base_area" VALUES ('150221', '土默特右旗', '1502');
INSERT INTO "public"."base_area" VALUES ('150222', '固阳县', '1502');
INSERT INTO "public"."base_area" VALUES ('150223', '达尔罕茂明安联合旗', '1502');
INSERT INTO "public"."base_area" VALUES ('150271', '包头稀土高新技术产业开发区', '1502');
INSERT INTO "public"."base_area" VALUES ('150302', '海勃湾区', '1503');
INSERT INTO "public"."base_area" VALUES ('150303', '海南区', '1503');
INSERT INTO "public"."base_area" VALUES ('150304', '乌达区', '1503');
INSERT INTO "public"."base_area" VALUES ('150402', '红山区', '1504');
INSERT INTO "public"."base_area" VALUES ('150403', '元宝山区', '1504');
INSERT INTO "public"."base_area" VALUES ('150404', '松山区', '1504');
INSERT INTO "public"."base_area" VALUES ('150421', '阿鲁科尔沁旗', '1504');
INSERT INTO "public"."base_area" VALUES ('150422', '巴林左旗', '1504');
INSERT INTO "public"."base_area" VALUES ('150423', '巴林右旗', '1504');
INSERT INTO "public"."base_area" VALUES ('150424', '林西县', '1504');
INSERT INTO "public"."base_area" VALUES ('150425', '克什克腾旗', '1504');
INSERT INTO "public"."base_area" VALUES ('150426', '翁牛特旗', '1504');
INSERT INTO "public"."base_area" VALUES ('150428', '喀喇沁旗', '1504');
INSERT INTO "public"."base_area" VALUES ('150429', '宁城县', '1504');
INSERT INTO "public"."base_area" VALUES ('150430', '敖汉旗', '1504');
INSERT INTO "public"."base_area" VALUES ('150502', '科尔沁区', '1505');
INSERT INTO "public"."base_area" VALUES ('150521', '科尔沁左翼中旗', '1505');
INSERT INTO "public"."base_area" VALUES ('150522', '科尔沁左翼后旗', '1505');
INSERT INTO "public"."base_area" VALUES ('150523', '开鲁县', '1505');
INSERT INTO "public"."base_area" VALUES ('150524', '库伦旗', '1505');
INSERT INTO "public"."base_area" VALUES ('150525', '奈曼旗', '1505');
INSERT INTO "public"."base_area" VALUES ('150526', '扎鲁特旗', '1505');
INSERT INTO "public"."base_area" VALUES ('150571', '通辽经济技术开发区', '1505');
INSERT INTO "public"."base_area" VALUES ('150581', '霍林郭勒市', '1505');
INSERT INTO "public"."base_area" VALUES ('150602', '东胜区', '1506');
INSERT INTO "public"."base_area" VALUES ('150603', '康巴什区', '1506');
INSERT INTO "public"."base_area" VALUES ('150621', '达拉特旗', '1506');
INSERT INTO "public"."base_area" VALUES ('150622', '准格尔旗', '1506');
INSERT INTO "public"."base_area" VALUES ('150623', '鄂托克前旗', '1506');
INSERT INTO "public"."base_area" VALUES ('150624', '鄂托克旗', '1506');
INSERT INTO "public"."base_area" VALUES ('150625', '杭锦旗', '1506');
INSERT INTO "public"."base_area" VALUES ('150626', '乌审旗', '1506');
INSERT INTO "public"."base_area" VALUES ('150627', '伊金霍洛旗', '1506');
INSERT INTO "public"."base_area" VALUES ('150702', '海拉尔区', '1507');
INSERT INTO "public"."base_area" VALUES ('150703', '扎赉诺尔区', '1507');
INSERT INTO "public"."base_area" VALUES ('150721', '阿荣旗', '1507');
INSERT INTO "public"."base_area" VALUES ('150722', '莫力达瓦达斡尔族自治旗', '1507');
INSERT INTO "public"."base_area" VALUES ('150723', '鄂伦春自治旗', '1507');
INSERT INTO "public"."base_area" VALUES ('150724', '鄂温克族自治旗', '1507');
INSERT INTO "public"."base_area" VALUES ('150725', '陈巴尔虎旗', '1507');
INSERT INTO "public"."base_area" VALUES ('150726', '新巴尔虎左旗', '1507');
INSERT INTO "public"."base_area" VALUES ('150727', '新巴尔虎右旗', '1507');
INSERT INTO "public"."base_area" VALUES ('150781', '满洲里市', '1507');
INSERT INTO "public"."base_area" VALUES ('150782', '牙克石市', '1507');
INSERT INTO "public"."base_area" VALUES ('150783', '扎兰屯市', '1507');
INSERT INTO "public"."base_area" VALUES ('150784', '额尔古纳市', '1507');
INSERT INTO "public"."base_area" VALUES ('150785', '根河市', '1507');
INSERT INTO "public"."base_area" VALUES ('150802', '临河区', '1508');
INSERT INTO "public"."base_area" VALUES ('150821', '五原县', '1508');
INSERT INTO "public"."base_area" VALUES ('150822', '磴口县', '1508');
INSERT INTO "public"."base_area" VALUES ('150823', '乌拉特前旗', '1508');
INSERT INTO "public"."base_area" VALUES ('150824', '乌拉特中旗', '1508');
INSERT INTO "public"."base_area" VALUES ('150825', '乌拉特后旗', '1508');
INSERT INTO "public"."base_area" VALUES ('150826', '杭锦后旗', '1508');
INSERT INTO "public"."base_area" VALUES ('150902', '集宁区', '1509');
INSERT INTO "public"."base_area" VALUES ('150921', '卓资县', '1509');
INSERT INTO "public"."base_area" VALUES ('150922', '化德县', '1509');
INSERT INTO "public"."base_area" VALUES ('150923', '商都县', '1509');
INSERT INTO "public"."base_area" VALUES ('150924', '兴和县', '1509');
INSERT INTO "public"."base_area" VALUES ('150925', '凉城县', '1509');
INSERT INTO "public"."base_area" VALUES ('150926', '察哈尔右翼前旗', '1509');
INSERT INTO "public"."base_area" VALUES ('150927', '察哈尔右翼中旗', '1509');
INSERT INTO "public"."base_area" VALUES ('150928', '察哈尔右翼后旗', '1509');
INSERT INTO "public"."base_area" VALUES ('150929', '四子王旗', '1509');
INSERT INTO "public"."base_area" VALUES ('150981', '丰镇市', '1509');
INSERT INTO "public"."base_area" VALUES ('152201', '乌兰浩特市', '1522');
INSERT INTO "public"."base_area" VALUES ('152202', '阿尔山市', '1522');
INSERT INTO "public"."base_area" VALUES ('152221', '科尔沁右翼前旗', '1522');
INSERT INTO "public"."base_area" VALUES ('152222', '科尔沁右翼中旗', '1522');
INSERT INTO "public"."base_area" VALUES ('152223', '扎赉特旗', '1522');
INSERT INTO "public"."base_area" VALUES ('152224', '突泉县', '1522');
INSERT INTO "public"."base_area" VALUES ('152501', '二连浩特市', '1525');
INSERT INTO "public"."base_area" VALUES ('152502', '锡林浩特市', '1525');
INSERT INTO "public"."base_area" VALUES ('152522', '阿巴嘎旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152523', '苏尼特左旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152524', '苏尼特右旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152525', '东乌珠穆沁旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152526', '西乌珠穆沁旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152527', '太仆寺旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152528', '镶黄旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152529', '正镶白旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152530', '正蓝旗', '1525');
INSERT INTO "public"."base_area" VALUES ('152531', '多伦县', '1525');
INSERT INTO "public"."base_area" VALUES ('152571', '乌拉盖管委会', '1525');
INSERT INTO "public"."base_area" VALUES ('152921', '阿拉善左旗', '1529');
INSERT INTO "public"."base_area" VALUES ('152922', '阿拉善右旗', '1529');
INSERT INTO "public"."base_area" VALUES ('152923', '额济纳旗', '1529');
INSERT INTO "public"."base_area" VALUES ('152971', '内蒙古阿拉善高新技术产业开发区', '1529');
INSERT INTO "public"."base_area" VALUES ('210102', '和平区', '2101');
INSERT INTO "public"."base_area" VALUES ('210103', '沈河区', '2101');
INSERT INTO "public"."base_area" VALUES ('210104', '大东区', '2101');
INSERT INTO "public"."base_area" VALUES ('210105', '皇姑区', '2101');
INSERT INTO "public"."base_area" VALUES ('210106', '铁西区', '2101');
INSERT INTO "public"."base_area" VALUES ('210111', '苏家屯区', '2101');
INSERT INTO "public"."base_area" VALUES ('210112', '浑南区', '2101');
INSERT INTO "public"."base_area" VALUES ('210113', '沈北新区', '2101');
INSERT INTO "public"."base_area" VALUES ('210114', '于洪区', '2101');
INSERT INTO "public"."base_area" VALUES ('210115', '辽中区', '2101');
INSERT INTO "public"."base_area" VALUES ('210123', '康平县', '2101');
INSERT INTO "public"."base_area" VALUES ('210124', '法库县', '2101');
INSERT INTO "public"."base_area" VALUES ('210181', '新民市', '2101');
INSERT INTO "public"."base_area" VALUES ('210202', '中山区', '2102');
INSERT INTO "public"."base_area" VALUES ('210203', '西岗区', '2102');
INSERT INTO "public"."base_area" VALUES ('210204', '沙河口区', '2102');
INSERT INTO "public"."base_area" VALUES ('210211', '甘井子区', '2102');
INSERT INTO "public"."base_area" VALUES ('210212', '旅顺口区', '2102');
INSERT INTO "public"."base_area" VALUES ('210213', '金州区', '2102');
INSERT INTO "public"."base_area" VALUES ('210214', '普兰店区', '2102');
INSERT INTO "public"."base_area" VALUES ('210224', '长海县', '2102');
INSERT INTO "public"."base_area" VALUES ('210281', '瓦房店市', '2102');
INSERT INTO "public"."base_area" VALUES ('210283', '庄河市', '2102');
INSERT INTO "public"."base_area" VALUES ('210302', '铁东区', '2103');
INSERT INTO "public"."base_area" VALUES ('210303', '铁西区', '2103');
INSERT INTO "public"."base_area" VALUES ('210304', '立山区', '2103');
INSERT INTO "public"."base_area" VALUES ('210311', '千山区', '2103');
INSERT INTO "public"."base_area" VALUES ('210321', '台安县', '2103');
INSERT INTO "public"."base_area" VALUES ('210323', '岫岩满族自治县', '2103');
INSERT INTO "public"."base_area" VALUES ('210381', '海城市', '2103');
INSERT INTO "public"."base_area" VALUES ('210402', '新抚区', '2104');
INSERT INTO "public"."base_area" VALUES ('210403', '东洲区', '2104');
INSERT INTO "public"."base_area" VALUES ('210404', '望花区', '2104');
INSERT INTO "public"."base_area" VALUES ('210411', '顺城区', '2104');
INSERT INTO "public"."base_area" VALUES ('210421', '抚顺县', '2104');
INSERT INTO "public"."base_area" VALUES ('210422', '新宾满族自治县', '2104');
INSERT INTO "public"."base_area" VALUES ('210423', '清原满族自治县', '2104');
INSERT INTO "public"."base_area" VALUES ('210502', '平山区', '2105');
INSERT INTO "public"."base_area" VALUES ('210503', '溪湖区', '2105');
INSERT INTO "public"."base_area" VALUES ('210504', '明山区', '2105');
INSERT INTO "public"."base_area" VALUES ('210505', '南芬区', '2105');
INSERT INTO "public"."base_area" VALUES ('210521', '本溪满族自治县', '2105');
INSERT INTO "public"."base_area" VALUES ('210522', '桓仁满族自治县', '2105');
INSERT INTO "public"."base_area" VALUES ('210602', '元宝区', '2106');
INSERT INTO "public"."base_area" VALUES ('210603', '振兴区', '2106');
INSERT INTO "public"."base_area" VALUES ('210604', '振安区', '2106');
INSERT INTO "public"."base_area" VALUES ('210624', '宽甸满族自治县', '2106');
INSERT INTO "public"."base_area" VALUES ('210681', '东港市', '2106');
INSERT INTO "public"."base_area" VALUES ('210682', '凤城市', '2106');
INSERT INTO "public"."base_area" VALUES ('210702', '古塔区', '2107');
INSERT INTO "public"."base_area" VALUES ('210703', '凌河区', '2107');
INSERT INTO "public"."base_area" VALUES ('210711', '太和区', '2107');
INSERT INTO "public"."base_area" VALUES ('210726', '黑山县', '2107');
INSERT INTO "public"."base_area" VALUES ('210727', '义县', '2107');
INSERT INTO "public"."base_area" VALUES ('210781', '凌海市', '2107');
INSERT INTO "public"."base_area" VALUES ('210782', '北镇市', '2107');
INSERT INTO "public"."base_area" VALUES ('210802', '站前区', '2108');
INSERT INTO "public"."base_area" VALUES ('210803', '西市区', '2108');
INSERT INTO "public"."base_area" VALUES ('210804', '鲅鱼圈区', '2108');
INSERT INTO "public"."base_area" VALUES ('210811', '老边区', '2108');
INSERT INTO "public"."base_area" VALUES ('210881', '盖州市', '2108');
INSERT INTO "public"."base_area" VALUES ('210882', '大石桥市', '2108');
INSERT INTO "public"."base_area" VALUES ('210902', '海州区', '2109');
INSERT INTO "public"."base_area" VALUES ('210903', '新邱区', '2109');
INSERT INTO "public"."base_area" VALUES ('210904', '太平区', '2109');
INSERT INTO "public"."base_area" VALUES ('210905', '清河门区', '2109');
INSERT INTO "public"."base_area" VALUES ('210911', '细河区', '2109');
INSERT INTO "public"."base_area" VALUES ('210921', '阜新蒙古族自治县', '2109');
INSERT INTO "public"."base_area" VALUES ('210922', '彰武县', '2109');
INSERT INTO "public"."base_area" VALUES ('211002', '白塔区', '2110');
INSERT INTO "public"."base_area" VALUES ('211003', '文圣区', '2110');
INSERT INTO "public"."base_area" VALUES ('211004', '宏伟区', '2110');
INSERT INTO "public"."base_area" VALUES ('211005', '弓长岭区', '2110');
INSERT INTO "public"."base_area" VALUES ('211011', '太子河区', '2110');
INSERT INTO "public"."base_area" VALUES ('211021', '辽阳县', '2110');
INSERT INTO "public"."base_area" VALUES ('211081', '灯塔市', '2110');
INSERT INTO "public"."base_area" VALUES ('211102', '双台子区', '2111');
INSERT INTO "public"."base_area" VALUES ('211103', '兴隆台区', '2111');
INSERT INTO "public"."base_area" VALUES ('211104', '大洼区', '2111');
INSERT INTO "public"."base_area" VALUES ('211122', '盘山县', '2111');
INSERT INTO "public"."base_area" VALUES ('211202', '银州区', '2112');
INSERT INTO "public"."base_area" VALUES ('211204', '清河区', '2112');
INSERT INTO "public"."base_area" VALUES ('211221', '铁岭县', '2112');
INSERT INTO "public"."base_area" VALUES ('211223', '西丰县', '2112');
INSERT INTO "public"."base_area" VALUES ('211224', '昌图县', '2112');
INSERT INTO "public"."base_area" VALUES ('211281', '调兵山市', '2112');
INSERT INTO "public"."base_area" VALUES ('211282', '开原市', '2112');
INSERT INTO "public"."base_area" VALUES ('211302', '双塔区', '2113');
INSERT INTO "public"."base_area" VALUES ('211303', '龙城区', '2113');
INSERT INTO "public"."base_area" VALUES ('211321', '朝阳县', '2113');
INSERT INTO "public"."base_area" VALUES ('211322', '建平县', '2113');
INSERT INTO "public"."base_area" VALUES ('211324', '喀喇沁左翼蒙古族自治县', '2113');
INSERT INTO "public"."base_area" VALUES ('211381', '北票市', '2113');
INSERT INTO "public"."base_area" VALUES ('211382', '凌源市', '2113');
INSERT INTO "public"."base_area" VALUES ('211402', '连山区', '2114');
INSERT INTO "public"."base_area" VALUES ('211403', '龙港区', '2114');
INSERT INTO "public"."base_area" VALUES ('211404', '南票区', '2114');
INSERT INTO "public"."base_area" VALUES ('211421', '绥中县', '2114');
INSERT INTO "public"."base_area" VALUES ('211422', '建昌县', '2114');
INSERT INTO "public"."base_area" VALUES ('211481', '兴城市', '2114');
INSERT INTO "public"."base_area" VALUES ('220102', '南关区', '2201');
INSERT INTO "public"."base_area" VALUES ('220103', '宽城区', '2201');
INSERT INTO "public"."base_area" VALUES ('220104', '朝阳区', '2201');
INSERT INTO "public"."base_area" VALUES ('220105', '二道区', '2201');
INSERT INTO "public"."base_area" VALUES ('220106', '绿园区', '2201');
INSERT INTO "public"."base_area" VALUES ('220112', '双阳区', '2201');
INSERT INTO "public"."base_area" VALUES ('220113', '九台区', '2201');
INSERT INTO "public"."base_area" VALUES ('220122', '农安县', '2201');
INSERT INTO "public"."base_area" VALUES ('220171', '长春经济技术开发区', '2201');
INSERT INTO "public"."base_area" VALUES ('220172', '长春净月高新技术产业开发区', '2201');
INSERT INTO "public"."base_area" VALUES ('220173', '长春高新技术产业开发区', '2201');
INSERT INTO "public"."base_area" VALUES ('220174', '长春汽车经济技术开发区', '2201');
INSERT INTO "public"."base_area" VALUES ('220182', '榆树市', '2201');
INSERT INTO "public"."base_area" VALUES ('220183', '德惠市', '2201');
INSERT INTO "public"."base_area" VALUES ('220184', '公主岭市', '2201');
INSERT INTO "public"."base_area" VALUES ('220202', '昌邑区', '2202');
INSERT INTO "public"."base_area" VALUES ('220203', '龙潭区', '2202');
INSERT INTO "public"."base_area" VALUES ('220204', '船营区', '2202');
INSERT INTO "public"."base_area" VALUES ('220211', '丰满区', '2202');
INSERT INTO "public"."base_area" VALUES ('220221', '永吉县', '2202');
INSERT INTO "public"."base_area" VALUES ('220271', '吉林经济开发区', '2202');
INSERT INTO "public"."base_area" VALUES ('220272', '吉林高新技术产业开发区', '2202');
INSERT INTO "public"."base_area" VALUES ('220273', '吉林中国新加坡食品区', '2202');
INSERT INTO "public"."base_area" VALUES ('220281', '蛟河市', '2202');
INSERT INTO "public"."base_area" VALUES ('220282', '桦甸市', '2202');
INSERT INTO "public"."base_area" VALUES ('220283', '舒兰市', '2202');
INSERT INTO "public"."base_area" VALUES ('220284', '磐石市', '2202');
INSERT INTO "public"."base_area" VALUES ('220302', '铁西区', '2203');
INSERT INTO "public"."base_area" VALUES ('220303', '铁东区', '2203');
INSERT INTO "public"."base_area" VALUES ('220322', '梨树县', '2203');
INSERT INTO "public"."base_area" VALUES ('220323', '伊通满族自治县', '2203');
INSERT INTO "public"."base_area" VALUES ('220382', '双辽市', '2203');
INSERT INTO "public"."base_area" VALUES ('220402', '龙山区', '2204');
INSERT INTO "public"."base_area" VALUES ('220403', '西安区', '2204');
INSERT INTO "public"."base_area" VALUES ('220421', '东丰县', '2204');
INSERT INTO "public"."base_area" VALUES ('220422', '东辽县', '2204');
INSERT INTO "public"."base_area" VALUES ('220502', '东昌区', '2205');
INSERT INTO "public"."base_area" VALUES ('220503', '二道江区', '2205');
INSERT INTO "public"."base_area" VALUES ('220521', '通化县', '2205');
INSERT INTO "public"."base_area" VALUES ('220523', '辉南县', '2205');
INSERT INTO "public"."base_area" VALUES ('220524', '柳河县', '2205');
INSERT INTO "public"."base_area" VALUES ('220581', '梅河口市', '2205');
INSERT INTO "public"."base_area" VALUES ('220582', '集安市', '2205');
INSERT INTO "public"."base_area" VALUES ('220602', '浑江区', '2206');
INSERT INTO "public"."base_area" VALUES ('220605', '江源区', '2206');
INSERT INTO "public"."base_area" VALUES ('220621', '抚松县', '2206');
INSERT INTO "public"."base_area" VALUES ('220622', '靖宇县', '2206');
INSERT INTO "public"."base_area" VALUES ('220623', '长白朝鲜族自治县', '2206');
INSERT INTO "public"."base_area" VALUES ('220681', '临江市', '2206');
INSERT INTO "public"."base_area" VALUES ('220702', '宁江区', '2207');
INSERT INTO "public"."base_area" VALUES ('220721', '前郭尔罗斯蒙古族自治县', '2207');
INSERT INTO "public"."base_area" VALUES ('220722', '长岭县', '2207');
INSERT INTO "public"."base_area" VALUES ('220723', '乾安县', '2207');
INSERT INTO "public"."base_area" VALUES ('220771', '吉林松原经济开发区', '2207');
INSERT INTO "public"."base_area" VALUES ('220781', '扶余市', '2207');
INSERT INTO "public"."base_area" VALUES ('220802', '洮北区', '2208');
INSERT INTO "public"."base_area" VALUES ('220821', '镇赉县', '2208');
INSERT INTO "public"."base_area" VALUES ('220822', '通榆县', '2208');
INSERT INTO "public"."base_area" VALUES ('220871', '吉林白城经济开发区', '2208');
INSERT INTO "public"."base_area" VALUES ('220881', '洮南市', '2208');
INSERT INTO "public"."base_area" VALUES ('220882', '大安市', '2208');
INSERT INTO "public"."base_area" VALUES ('222401', '延吉市', '2224');
INSERT INTO "public"."base_area" VALUES ('222402', '图们市', '2224');
INSERT INTO "public"."base_area" VALUES ('222403', '敦化市', '2224');
INSERT INTO "public"."base_area" VALUES ('222404', '珲春市', '2224');
INSERT INTO "public"."base_area" VALUES ('222405', '龙井市', '2224');
INSERT INTO "public"."base_area" VALUES ('222406', '和龙市', '2224');
INSERT INTO "public"."base_area" VALUES ('222424', '汪清县', '2224');
INSERT INTO "public"."base_area" VALUES ('222426', '安图县', '2224');
INSERT INTO "public"."base_area" VALUES ('230102', '道里区', '2301');
INSERT INTO "public"."base_area" VALUES ('230103', '南岗区', '2301');
INSERT INTO "public"."base_area" VALUES ('230104', '道外区', '2301');
INSERT INTO "public"."base_area" VALUES ('230108', '平房区', '2301');
INSERT INTO "public"."base_area" VALUES ('230109', '松北区', '2301');
INSERT INTO "public"."base_area" VALUES ('230110', '香坊区', '2301');
INSERT INTO "public"."base_area" VALUES ('230111', '呼兰区', '2301');
INSERT INTO "public"."base_area" VALUES ('230112', '阿城区', '2301');
INSERT INTO "public"."base_area" VALUES ('230113', '双城区', '2301');
INSERT INTO "public"."base_area" VALUES ('230123', '依兰县', '2301');
INSERT INTO "public"."base_area" VALUES ('230124', '方正县', '2301');
INSERT INTO "public"."base_area" VALUES ('230125', '宾县', '2301');
INSERT INTO "public"."base_area" VALUES ('230126', '巴彦县', '2301');
INSERT INTO "public"."base_area" VALUES ('230127', '木兰县', '2301');
INSERT INTO "public"."base_area" VALUES ('230128', '通河县', '2301');
INSERT INTO "public"."base_area" VALUES ('230129', '延寿县', '2301');
INSERT INTO "public"."base_area" VALUES ('230183', '尚志市', '2301');
INSERT INTO "public"."base_area" VALUES ('230184', '五常市', '2301');
INSERT INTO "public"."base_area" VALUES ('230202', '龙沙区', '2302');
INSERT INTO "public"."base_area" VALUES ('230203', '建华区', '2302');
INSERT INTO "public"."base_area" VALUES ('230204', '铁锋区', '2302');
INSERT INTO "public"."base_area" VALUES ('230205', '昂昂溪区', '2302');
INSERT INTO "public"."base_area" VALUES ('230206', '富拉尔基区', '2302');
INSERT INTO "public"."base_area" VALUES ('230207', '碾子山区', '2302');
INSERT INTO "public"."base_area" VALUES ('230208', '梅里斯达斡尔族区', '2302');
INSERT INTO "public"."base_area" VALUES ('230221', '龙江县', '2302');
INSERT INTO "public"."base_area" VALUES ('230223', '依安县', '2302');
INSERT INTO "public"."base_area" VALUES ('230224', '泰来县', '2302');
INSERT INTO "public"."base_area" VALUES ('230225', '甘南县', '2302');
INSERT INTO "public"."base_area" VALUES ('230227', '富裕县', '2302');
INSERT INTO "public"."base_area" VALUES ('230229', '克山县', '2302');
INSERT INTO "public"."base_area" VALUES ('230230', '克东县', '2302');
INSERT INTO "public"."base_area" VALUES ('230231', '拜泉县', '2302');
INSERT INTO "public"."base_area" VALUES ('230281', '讷河市', '2302');
INSERT INTO "public"."base_area" VALUES ('230302', '鸡冠区', '2303');
INSERT INTO "public"."base_area" VALUES ('230303', '恒山区', '2303');
INSERT INTO "public"."base_area" VALUES ('230304', '滴道区', '2303');
INSERT INTO "public"."base_area" VALUES ('230305', '梨树区', '2303');
INSERT INTO "public"."base_area" VALUES ('230306', '城子河区', '2303');
INSERT INTO "public"."base_area" VALUES ('230307', '麻山区', '2303');
INSERT INTO "public"."base_area" VALUES ('230321', '鸡东县', '2303');
INSERT INTO "public"."base_area" VALUES ('230381', '虎林市', '2303');
INSERT INTO "public"."base_area" VALUES ('230382', '密山市', '2303');
INSERT INTO "public"."base_area" VALUES ('230402', '向阳区', '2304');
INSERT INTO "public"."base_area" VALUES ('230403', '工农区', '2304');
INSERT INTO "public"."base_area" VALUES ('230404', '南山区', '2304');
INSERT INTO "public"."base_area" VALUES ('230405', '兴安区', '2304');
INSERT INTO "public"."base_area" VALUES ('230406', '东山区', '2304');
INSERT INTO "public"."base_area" VALUES ('230407', '兴山区', '2304');
INSERT INTO "public"."base_area" VALUES ('230421', '萝北县', '2304');
INSERT INTO "public"."base_area" VALUES ('230422', '绥滨县', '2304');
INSERT INTO "public"."base_area" VALUES ('230502', '尖山区', '2305');
INSERT INTO "public"."base_area" VALUES ('230503', '岭东区', '2305');
INSERT INTO "public"."base_area" VALUES ('230505', '四方台区', '2305');
INSERT INTO "public"."base_area" VALUES ('230506', '宝山区', '2305');
INSERT INTO "public"."base_area" VALUES ('230521', '集贤县', '2305');
INSERT INTO "public"."base_area" VALUES ('230522', '友谊县', '2305');
INSERT INTO "public"."base_area" VALUES ('230523', '宝清县', '2305');
INSERT INTO "public"."base_area" VALUES ('230524', '饶河县', '2305');
INSERT INTO "public"."base_area" VALUES ('230602', '萨尔图区', '2306');
INSERT INTO "public"."base_area" VALUES ('230603', '龙凤区', '2306');
INSERT INTO "public"."base_area" VALUES ('230604', '让胡路区', '2306');
INSERT INTO "public"."base_area" VALUES ('230605', '红岗区', '2306');
INSERT INTO "public"."base_area" VALUES ('230606', '大同区', '2306');
INSERT INTO "public"."base_area" VALUES ('230621', '肇州县', '2306');
INSERT INTO "public"."base_area" VALUES ('230622', '肇源县', '2306');
INSERT INTO "public"."base_area" VALUES ('230623', '林甸县', '2306');
INSERT INTO "public"."base_area" VALUES ('230624', '杜尔伯特蒙古族自治县', '2306');
INSERT INTO "public"."base_area" VALUES ('230671', '大庆高新技术产业开发区', '2306');
INSERT INTO "public"."base_area" VALUES ('230717', '伊美区', '2307');
INSERT INTO "public"."base_area" VALUES ('230718', '乌翠区', '2307');
INSERT INTO "public"."base_area" VALUES ('230719', '友好区', '2307');
INSERT INTO "public"."base_area" VALUES ('230722', '嘉荫县', '2307');
INSERT INTO "public"."base_area" VALUES ('230723', '汤旺县', '2307');
INSERT INTO "public"."base_area" VALUES ('230724', '丰林县', '2307');
INSERT INTO "public"."base_area" VALUES ('230725', '大箐山县', '2307');
INSERT INTO "public"."base_area" VALUES ('230726', '南岔县', '2307');
INSERT INTO "public"."base_area" VALUES ('230751', '金林区', '2307');
INSERT INTO "public"."base_area" VALUES ('230781', '铁力市', '2307');
INSERT INTO "public"."base_area" VALUES ('230803', '向阳区', '2308');
INSERT INTO "public"."base_area" VALUES ('230804', '前进区', '2308');
INSERT INTO "public"."base_area" VALUES ('230805', '东风区', '2308');
INSERT INTO "public"."base_area" VALUES ('230811', '郊区', '2308');
INSERT INTO "public"."base_area" VALUES ('230822', '桦南县', '2308');
INSERT INTO "public"."base_area" VALUES ('230826', '桦川县', '2308');
INSERT INTO "public"."base_area" VALUES ('230828', '汤原县', '2308');
INSERT INTO "public"."base_area" VALUES ('230881', '同江市', '2308');
INSERT INTO "public"."base_area" VALUES ('230882', '富锦市', '2308');
INSERT INTO "public"."base_area" VALUES ('230883', '抚远市', '2308');
INSERT INTO "public"."base_area" VALUES ('230902', '新兴区', '2309');
INSERT INTO "public"."base_area" VALUES ('230903', '桃山区', '2309');
INSERT INTO "public"."base_area" VALUES ('230904', '茄子河区', '2309');
INSERT INTO "public"."base_area" VALUES ('230921', '勃利县', '2309');
INSERT INTO "public"."base_area" VALUES ('231002', '东安区', '2310');
INSERT INTO "public"."base_area" VALUES ('231003', '阳明区', '2310');
INSERT INTO "public"."base_area" VALUES ('231004', '爱民区', '2310');
INSERT INTO "public"."base_area" VALUES ('231005', '西安区', '2310');
INSERT INTO "public"."base_area" VALUES ('231025', '林口县', '2310');
INSERT INTO "public"."base_area" VALUES ('231071', '牡丹江经济技术开发区', '2310');
INSERT INTO "public"."base_area" VALUES ('231081', '绥芬河市', '2310');
INSERT INTO "public"."base_area" VALUES ('231083', '海林市', '2310');
INSERT INTO "public"."base_area" VALUES ('231084', '宁安市', '2310');
INSERT INTO "public"."base_area" VALUES ('231085', '穆棱市', '2310');
INSERT INTO "public"."base_area" VALUES ('231086', '东宁市', '2310');
INSERT INTO "public"."base_area" VALUES ('231102', '爱辉区', '2311');
INSERT INTO "public"."base_area" VALUES ('231123', '逊克县', '2311');
INSERT INTO "public"."base_area" VALUES ('231124', '孙吴县', '2311');
INSERT INTO "public"."base_area" VALUES ('231181', '北安市', '2311');
INSERT INTO "public"."base_area" VALUES ('231182', '五大连池市', '2311');
INSERT INTO "public"."base_area" VALUES ('231183', '嫩江市', '2311');
INSERT INTO "public"."base_area" VALUES ('231202', '北林区', '2312');
INSERT INTO "public"."base_area" VALUES ('231221', '望奎县', '2312');
INSERT INTO "public"."base_area" VALUES ('231222', '兰西县', '2312');
INSERT INTO "public"."base_area" VALUES ('231223', '青冈县', '2312');
INSERT INTO "public"."base_area" VALUES ('231224', '庆安县', '2312');
INSERT INTO "public"."base_area" VALUES ('231225', '明水县', '2312');
INSERT INTO "public"."base_area" VALUES ('231226', '绥棱县', '2312');
INSERT INTO "public"."base_area" VALUES ('231281', '安达市', '2312');
INSERT INTO "public"."base_area" VALUES ('231282', '肇东市', '2312');
INSERT INTO "public"."base_area" VALUES ('231283', '海伦市', '2312');
INSERT INTO "public"."base_area" VALUES ('232701', '漠河市', '2327');
INSERT INTO "public"."base_area" VALUES ('232721', '呼玛县', '2327');
INSERT INTO "public"."base_area" VALUES ('232722', '塔河县', '2327');
INSERT INTO "public"."base_area" VALUES ('232761', '加格达奇区', '2327');
INSERT INTO "public"."base_area" VALUES ('232762', '松岭区', '2327');
INSERT INTO "public"."base_area" VALUES ('232763', '新林区', '2327');
INSERT INTO "public"."base_area" VALUES ('232764', '呼中区', '2327');
INSERT INTO "public"."base_area" VALUES ('310101', '黄浦区', '3101');
INSERT INTO "public"."base_area" VALUES ('310104', '徐汇区', '3101');
INSERT INTO "public"."base_area" VALUES ('310105', '长宁区', '3101');
INSERT INTO "public"."base_area" VALUES ('310106', '静安区', '3101');
INSERT INTO "public"."base_area" VALUES ('310107', '普陀区', '3101');
INSERT INTO "public"."base_area" VALUES ('310109', '虹口区', '3101');
INSERT INTO "public"."base_area" VALUES ('310110', '杨浦区', '3101');
INSERT INTO "public"."base_area" VALUES ('310112', '闵行区', '3101');
INSERT INTO "public"."base_area" VALUES ('310113', '宝山区', '3101');
INSERT INTO "public"."base_area" VALUES ('310114', '嘉定区', '3101');
INSERT INTO "public"."base_area" VALUES ('310115', '浦东新区', '3101');
INSERT INTO "public"."base_area" VALUES ('310116', '金山区', '3101');
INSERT INTO "public"."base_area" VALUES ('310117', '松江区', '3101');
INSERT INTO "public"."base_area" VALUES ('310118', '青浦区', '3101');
INSERT INTO "public"."base_area" VALUES ('310120', '奉贤区', '3101');
INSERT INTO "public"."base_area" VALUES ('310151', '崇明区', '3101');
INSERT INTO "public"."base_area" VALUES ('320102', '玄武区', '3201');
INSERT INTO "public"."base_area" VALUES ('320104', '秦淮区', '3201');
INSERT INTO "public"."base_area" VALUES ('320105', '建邺区', '3201');
INSERT INTO "public"."base_area" VALUES ('320106', '鼓楼区', '3201');
INSERT INTO "public"."base_area" VALUES ('320111', '浦口区', '3201');
INSERT INTO "public"."base_area" VALUES ('320113', '栖霞区', '3201');
INSERT INTO "public"."base_area" VALUES ('320114', '雨花台区', '3201');
INSERT INTO "public"."base_area" VALUES ('320115', '江宁区', '3201');
INSERT INTO "public"."base_area" VALUES ('320116', '六合区', '3201');
INSERT INTO "public"."base_area" VALUES ('320117', '溧水区', '3201');
INSERT INTO "public"."base_area" VALUES ('320118', '高淳区', '3201');
INSERT INTO "public"."base_area" VALUES ('320205', '锡山区', '3202');
INSERT INTO "public"."base_area" VALUES ('320206', '惠山区', '3202');
INSERT INTO "public"."base_area" VALUES ('320211', '滨湖区', '3202');
INSERT INTO "public"."base_area" VALUES ('320213', '梁溪区', '3202');
INSERT INTO "public"."base_area" VALUES ('320214', '新吴区', '3202');
INSERT INTO "public"."base_area" VALUES ('320281', '江阴市', '3202');
INSERT INTO "public"."base_area" VALUES ('320282', '宜兴市', '3202');
INSERT INTO "public"."base_area" VALUES ('320302', '鼓楼区', '3203');
INSERT INTO "public"."base_area" VALUES ('320303', '云龙区', '3203');
INSERT INTO "public"."base_area" VALUES ('320305', '贾汪区', '3203');
INSERT INTO "public"."base_area" VALUES ('320311', '泉山区', '3203');
INSERT INTO "public"."base_area" VALUES ('320312', '铜山区', '3203');
INSERT INTO "public"."base_area" VALUES ('320321', '丰县', '3203');
INSERT INTO "public"."base_area" VALUES ('320322', '沛县', '3203');
INSERT INTO "public"."base_area" VALUES ('320324', '睢宁县', '3203');
INSERT INTO "public"."base_area" VALUES ('320371', '徐州经济技术开发区', '3203');
INSERT INTO "public"."base_area" VALUES ('320381', '新沂市', '3203');
INSERT INTO "public"."base_area" VALUES ('320382', '邳州市', '3203');
INSERT INTO "public"."base_area" VALUES ('320402', '天宁区', '3204');
INSERT INTO "public"."base_area" VALUES ('320404', '钟楼区', '3204');
INSERT INTO "public"."base_area" VALUES ('320411', '新北区', '3204');
INSERT INTO "public"."base_area" VALUES ('320412', '武进区', '3204');
INSERT INTO "public"."base_area" VALUES ('320413', '金坛区', '3204');
INSERT INTO "public"."base_area" VALUES ('320481', '溧阳市', '3204');
INSERT INTO "public"."base_area" VALUES ('320505', '虎丘区', '3205');
INSERT INTO "public"."base_area" VALUES ('320506', '吴中区', '3205');
INSERT INTO "public"."base_area" VALUES ('320507', '相城区', '3205');
INSERT INTO "public"."base_area" VALUES ('320508', '姑苏区', '3205');
INSERT INTO "public"."base_area" VALUES ('320509', '吴江区', '3205');
INSERT INTO "public"."base_area" VALUES ('320571', '苏州工业园区', '3205');
INSERT INTO "public"."base_area" VALUES ('320581', '常熟市', '3205');
INSERT INTO "public"."base_area" VALUES ('320582', '张家港市', '3205');
INSERT INTO "public"."base_area" VALUES ('320583', '昆山市', '3205');
INSERT INTO "public"."base_area" VALUES ('320585', '太仓市', '3205');
INSERT INTO "public"."base_area" VALUES ('320612', '通州区', '3206');
INSERT INTO "public"."base_area" VALUES ('320613', '崇川区', '3206');
INSERT INTO "public"."base_area" VALUES ('320614', '海门区', '3206');
INSERT INTO "public"."base_area" VALUES ('320623', '如东县', '3206');
INSERT INTO "public"."base_area" VALUES ('320671', '南通经济技术开发区', '3206');
INSERT INTO "public"."base_area" VALUES ('320681', '启东市', '3206');
INSERT INTO "public"."base_area" VALUES ('320682', '如皋市', '3206');
INSERT INTO "public"."base_area" VALUES ('320685', '海安市', '3206');
INSERT INTO "public"."base_area" VALUES ('320703', '连云区', '3207');
INSERT INTO "public"."base_area" VALUES ('320706', '海州区', '3207');
INSERT INTO "public"."base_area" VALUES ('320707', '赣榆区', '3207');
INSERT INTO "public"."base_area" VALUES ('320722', '东海县', '3207');
INSERT INTO "public"."base_area" VALUES ('320723', '灌云县', '3207');
INSERT INTO "public"."base_area" VALUES ('320724', '灌南县', '3207');
INSERT INTO "public"."base_area" VALUES ('320771', '连云港经济技术开发区', '3207');
INSERT INTO "public"."base_area" VALUES ('320772', '连云港高新技术产业开发区', '3207');
INSERT INTO "public"."base_area" VALUES ('320803', '淮安区', '3208');
INSERT INTO "public"."base_area" VALUES ('320804', '淮阴区', '3208');
INSERT INTO "public"."base_area" VALUES ('320812', '清江浦区', '3208');
INSERT INTO "public"."base_area" VALUES ('320813', '洪泽区', '3208');
INSERT INTO "public"."base_area" VALUES ('320826', '涟水县', '3208');
INSERT INTO "public"."base_area" VALUES ('320830', '盱眙县', '3208');
INSERT INTO "public"."base_area" VALUES ('320831', '金湖县', '3208');
INSERT INTO "public"."base_area" VALUES ('320871', '淮安经济技术开发区', '3208');
INSERT INTO "public"."base_area" VALUES ('320902', '亭湖区', '3209');
INSERT INTO "public"."base_area" VALUES ('320903', '盐都区', '3209');
INSERT INTO "public"."base_area" VALUES ('320904', '大丰区', '3209');
INSERT INTO "public"."base_area" VALUES ('320921', '响水县', '3209');
INSERT INTO "public"."base_area" VALUES ('320922', '滨海县', '3209');
INSERT INTO "public"."base_area" VALUES ('320923', '阜宁县', '3209');
INSERT INTO "public"."base_area" VALUES ('320924', '射阳县', '3209');
INSERT INTO "public"."base_area" VALUES ('320925', '建湖县', '3209');
INSERT INTO "public"."base_area" VALUES ('320971', '盐城经济技术开发区', '3209');
INSERT INTO "public"."base_area" VALUES ('320981', '东台市', '3209');
INSERT INTO "public"."base_area" VALUES ('321002', '广陵区', '3210');
INSERT INTO "public"."base_area" VALUES ('321003', '邗江区', '3210');
INSERT INTO "public"."base_area" VALUES ('321012', '江都区', '3210');
INSERT INTO "public"."base_area" VALUES ('321023', '宝应县', '3210');
INSERT INTO "public"."base_area" VALUES ('321071', '扬州经济技术开发区', '3210');
INSERT INTO "public"."base_area" VALUES ('321081', '仪征市', '3210');
INSERT INTO "public"."base_area" VALUES ('321084', '高邮市', '3210');
INSERT INTO "public"."base_area" VALUES ('321102', '京口区', '3211');
INSERT INTO "public"."base_area" VALUES ('321111', '润州区', '3211');
INSERT INTO "public"."base_area" VALUES ('321112', '丹徒区', '3211');
INSERT INTO "public"."base_area" VALUES ('321171', '镇江新区', '3211');
INSERT INTO "public"."base_area" VALUES ('321181', '丹阳市', '3211');
INSERT INTO "public"."base_area" VALUES ('321182', '扬中市', '3211');
INSERT INTO "public"."base_area" VALUES ('321183', '句容市', '3211');
INSERT INTO "public"."base_area" VALUES ('321202', '海陵区', '3212');
INSERT INTO "public"."base_area" VALUES ('321203', '高港区', '3212');
INSERT INTO "public"."base_area" VALUES ('321204', '姜堰区', '3212');
INSERT INTO "public"."base_area" VALUES ('321271', '泰州医药高新技术产业开发区', '3212');
INSERT INTO "public"."base_area" VALUES ('321281', '兴化市', '3212');
INSERT INTO "public"."base_area" VALUES ('321282', '靖江市', '3212');
INSERT INTO "public"."base_area" VALUES ('321283', '泰兴市', '3212');
INSERT INTO "public"."base_area" VALUES ('321302', '宿城区', '3213');
INSERT INTO "public"."base_area" VALUES ('321311', '宿豫区', '3213');
INSERT INTO "public"."base_area" VALUES ('321322', '沭阳县', '3213');
INSERT INTO "public"."base_area" VALUES ('321323', '泗阳县', '3213');
INSERT INTO "public"."base_area" VALUES ('321324', '泗洪县', '3213');
INSERT INTO "public"."base_area" VALUES ('321371', '宿迁经济技术开发区', '3213');
INSERT INTO "public"."base_area" VALUES ('330102', '上城区', '3301');
INSERT INTO "public"."base_area" VALUES ('330105', '拱墅区', '3301');
INSERT INTO "public"."base_area" VALUES ('330106', '西湖区', '3301');
INSERT INTO "public"."base_area" VALUES ('330108', '滨江区', '3301');
INSERT INTO "public"."base_area" VALUES ('330109', '萧山区', '3301');
INSERT INTO "public"."base_area" VALUES ('330110', '余杭区', '3301');
INSERT INTO "public"."base_area" VALUES ('330111', '富阳区', '3301');
INSERT INTO "public"."base_area" VALUES ('330112', '临安区', '3301');
INSERT INTO "public"."base_area" VALUES ('330113', '临平区', '3301');
INSERT INTO "public"."base_area" VALUES ('330114', '钱塘区', '3301');
INSERT INTO "public"."base_area" VALUES ('330122', '桐庐县', '3301');
INSERT INTO "public"."base_area" VALUES ('330127', '淳安县', '3301');
INSERT INTO "public"."base_area" VALUES ('330182', '建德市', '3301');
INSERT INTO "public"."base_area" VALUES ('330203', '海曙区', '3302');
INSERT INTO "public"."base_area" VALUES ('330205', '江北区', '3302');
INSERT INTO "public"."base_area" VALUES ('330206', '北仑区', '3302');
INSERT INTO "public"."base_area" VALUES ('330211', '镇海区', '3302');
INSERT INTO "public"."base_area" VALUES ('330212', '鄞州区', '3302');
INSERT INTO "public"."base_area" VALUES ('330213', '奉化区', '3302');
INSERT INTO "public"."base_area" VALUES ('330225', '象山县', '3302');
INSERT INTO "public"."base_area" VALUES ('330226', '宁海县', '3302');
INSERT INTO "public"."base_area" VALUES ('330281', '余姚市', '3302');
INSERT INTO "public"."base_area" VALUES ('330282', '慈溪市', '3302');
INSERT INTO "public"."base_area" VALUES ('330302', '鹿城区', '3303');
INSERT INTO "public"."base_area" VALUES ('330303', '龙湾区', '3303');
INSERT INTO "public"."base_area" VALUES ('330304', '瓯海区', '3303');
INSERT INTO "public"."base_area" VALUES ('330305', '洞头区', '3303');
INSERT INTO "public"."base_area" VALUES ('330324', '永嘉县', '3303');
INSERT INTO "public"."base_area" VALUES ('330326', '平阳县', '3303');
INSERT INTO "public"."base_area" VALUES ('330327', '苍南县', '3303');
INSERT INTO "public"."base_area" VALUES ('330328', '文成县', '3303');
INSERT INTO "public"."base_area" VALUES ('330329', '泰顺县', '3303');
INSERT INTO "public"."base_area" VALUES ('330381', '瑞安市', '3303');
INSERT INTO "public"."base_area" VALUES ('330382', '乐清市', '3303');
INSERT INTO "public"."base_area" VALUES ('330383', '龙港市', '3303');
INSERT INTO "public"."base_area" VALUES ('330402', '南湖区', '3304');
INSERT INTO "public"."base_area" VALUES ('330411', '秀洲区', '3304');
INSERT INTO "public"."base_area" VALUES ('330421', '嘉善县', '3304');
INSERT INTO "public"."base_area" VALUES ('330424', '海盐县', '3304');
INSERT INTO "public"."base_area" VALUES ('330481', '海宁市', '3304');
INSERT INTO "public"."base_area" VALUES ('330482', '平湖市', '3304');
INSERT INTO "public"."base_area" VALUES ('330483', '桐乡市', '3304');
INSERT INTO "public"."base_area" VALUES ('330502', '吴兴区', '3305');
INSERT INTO "public"."base_area" VALUES ('330503', '南浔区', '3305');
INSERT INTO "public"."base_area" VALUES ('330521', '德清县', '3305');
INSERT INTO "public"."base_area" VALUES ('330522', '长兴县', '3305');
INSERT INTO "public"."base_area" VALUES ('330523', '安吉县', '3305');
INSERT INTO "public"."base_area" VALUES ('330602', '越城区', '3306');
INSERT INTO "public"."base_area" VALUES ('330603', '柯桥区', '3306');
INSERT INTO "public"."base_area" VALUES ('330604', '上虞区', '3306');
INSERT INTO "public"."base_area" VALUES ('330624', '新昌县', '3306');
INSERT INTO "public"."base_area" VALUES ('330681', '诸暨市', '3306');
INSERT INTO "public"."base_area" VALUES ('330683', '嵊州市', '3306');
INSERT INTO "public"."base_area" VALUES ('330702', '婺城区', '3307');
INSERT INTO "public"."base_area" VALUES ('330703', '金东区', '3307');
INSERT INTO "public"."base_area" VALUES ('330723', '武义县', '3307');
INSERT INTO "public"."base_area" VALUES ('330726', '浦江县', '3307');
INSERT INTO "public"."base_area" VALUES ('330727', '磐安县', '3307');
INSERT INTO "public"."base_area" VALUES ('330781', '兰溪市', '3307');
INSERT INTO "public"."base_area" VALUES ('330782', '义乌市', '3307');
INSERT INTO "public"."base_area" VALUES ('330783', '东阳市', '3307');
INSERT INTO "public"."base_area" VALUES ('330784', '永康市', '3307');
INSERT INTO "public"."base_area" VALUES ('330802', '柯城区', '3308');
INSERT INTO "public"."base_area" VALUES ('330803', '衢江区', '3308');
INSERT INTO "public"."base_area" VALUES ('330822', '常山县', '3308');
INSERT INTO "public"."base_area" VALUES ('330824', '开化县', '3308');
INSERT INTO "public"."base_area" VALUES ('330825', '龙游县', '3308');
INSERT INTO "public"."base_area" VALUES ('330881', '江山市', '3308');
INSERT INTO "public"."base_area" VALUES ('330902', '定海区', '3309');
INSERT INTO "public"."base_area" VALUES ('330903', '普陀区', '3309');
INSERT INTO "public"."base_area" VALUES ('330921', '岱山县', '3309');
INSERT INTO "public"."base_area" VALUES ('330922', '嵊泗县', '3309');
INSERT INTO "public"."base_area" VALUES ('331002', '椒江区', '3310');
INSERT INTO "public"."base_area" VALUES ('331003', '黄岩区', '3310');
INSERT INTO "public"."base_area" VALUES ('331004', '路桥区', '3310');
INSERT INTO "public"."base_area" VALUES ('331022', '三门县', '3310');
INSERT INTO "public"."base_area" VALUES ('331023', '天台县', '3310');
INSERT INTO "public"."base_area" VALUES ('331024', '仙居县', '3310');
INSERT INTO "public"."base_area" VALUES ('331081', '温岭市', '3310');
INSERT INTO "public"."base_area" VALUES ('331082', '临海市', '3310');
INSERT INTO "public"."base_area" VALUES ('331083', '玉环市', '3310');
INSERT INTO "public"."base_area" VALUES ('331102', '莲都区', '3311');
INSERT INTO "public"."base_area" VALUES ('331121', '青田县', '3311');
INSERT INTO "public"."base_area" VALUES ('331122', '缙云县', '3311');
INSERT INTO "public"."base_area" VALUES ('331123', '遂昌县', '3311');
INSERT INTO "public"."base_area" VALUES ('331124', '松阳县', '3311');
INSERT INTO "public"."base_area" VALUES ('331125', '云和县', '3311');
INSERT INTO "public"."base_area" VALUES ('331126', '庆元县', '3311');
INSERT INTO "public"."base_area" VALUES ('331127', '景宁畲族自治县', '3311');
INSERT INTO "public"."base_area" VALUES ('331181', '龙泉市', '3311');
INSERT INTO "public"."base_area" VALUES ('340102', '瑶海区', '3401');
INSERT INTO "public"."base_area" VALUES ('340103', '庐阳区', '3401');
INSERT INTO "public"."base_area" VALUES ('340104', '蜀山区', '3401');
INSERT INTO "public"."base_area" VALUES ('340111', '包河区', '3401');
INSERT INTO "public"."base_area" VALUES ('340121', '长丰县', '3401');
INSERT INTO "public"."base_area" VALUES ('340122', '肥东县', '3401');
INSERT INTO "public"."base_area" VALUES ('340123', '肥西县', '3401');
INSERT INTO "public"."base_area" VALUES ('340124', '庐江县', '3401');
INSERT INTO "public"."base_area" VALUES ('340171', '合肥高新技术产业开发区', '3401');
INSERT INTO "public"."base_area" VALUES ('340172', '合肥经济技术开发区', '3401');
INSERT INTO "public"."base_area" VALUES ('340173', '合肥新站高新技术产业开发区', '3401');
INSERT INTO "public"."base_area" VALUES ('340181', '巢湖市', '3401');
INSERT INTO "public"."base_area" VALUES ('340202', '镜湖区', '3402');
INSERT INTO "public"."base_area" VALUES ('340207', '鸠江区', '3402');
INSERT INTO "public"."base_area" VALUES ('340209', '弋江区', '3402');
INSERT INTO "public"."base_area" VALUES ('340210', '湾沚区', '3402');
INSERT INTO "public"."base_area" VALUES ('340212', '繁昌区', '3402');
INSERT INTO "public"."base_area" VALUES ('340223', '南陵县', '3402');
INSERT INTO "public"."base_area" VALUES ('340271', '芜湖经济技术开发区', '3402');
INSERT INTO "public"."base_area" VALUES ('340272', '安徽芜湖三山经济开发区', '3402');
INSERT INTO "public"."base_area" VALUES ('340281', '无为市', '3402');
INSERT INTO "public"."base_area" VALUES ('340302', '龙子湖区', '3403');
INSERT INTO "public"."base_area" VALUES ('340303', '蚌山区', '3403');
INSERT INTO "public"."base_area" VALUES ('340304', '禹会区', '3403');
INSERT INTO "public"."base_area" VALUES ('340311', '淮上区', '3403');
INSERT INTO "public"."base_area" VALUES ('340321', '怀远县', '3403');
INSERT INTO "public"."base_area" VALUES ('340322', '五河县', '3403');
INSERT INTO "public"."base_area" VALUES ('340323', '固镇县', '3403');
INSERT INTO "public"."base_area" VALUES ('340371', '蚌埠市高新技术开发区', '3403');
INSERT INTO "public"."base_area" VALUES ('340372', '蚌埠市经济开发区', '3403');
INSERT INTO "public"."base_area" VALUES ('340402', '大通区', '3404');
INSERT INTO "public"."base_area" VALUES ('340403', '田家庵区', '3404');
INSERT INTO "public"."base_area" VALUES ('340404', '谢家集区', '3404');
INSERT INTO "public"."base_area" VALUES ('340405', '八公山区', '3404');
INSERT INTO "public"."base_area" VALUES ('340406', '潘集区', '3404');
INSERT INTO "public"."base_area" VALUES ('340421', '凤台县', '3404');
INSERT INTO "public"."base_area" VALUES ('340422', '寿县', '3404');
INSERT INTO "public"."base_area" VALUES ('340503', '花山区', '3405');
INSERT INTO "public"."base_area" VALUES ('340504', '雨山区', '3405');
INSERT INTO "public"."base_area" VALUES ('340506', '博望区', '3405');
INSERT INTO "public"."base_area" VALUES ('340521', '当涂县', '3405');
INSERT INTO "public"."base_area" VALUES ('340522', '含山县', '3405');
INSERT INTO "public"."base_area" VALUES ('340523', '和县', '3405');
INSERT INTO "public"."base_area" VALUES ('340602', '杜集区', '3406');
INSERT INTO "public"."base_area" VALUES ('340603', '相山区', '3406');
INSERT INTO "public"."base_area" VALUES ('340604', '烈山区', '3406');
INSERT INTO "public"."base_area" VALUES ('340621', '濉溪县', '3406');
INSERT INTO "public"."base_area" VALUES ('340705', '铜官区', '3407');
INSERT INTO "public"."base_area" VALUES ('340706', '义安区', '3407');
INSERT INTO "public"."base_area" VALUES ('340711', '郊区', '3407');
INSERT INTO "public"."base_area" VALUES ('340722', '枞阳县', '3407');
INSERT INTO "public"."base_area" VALUES ('340802', '迎江区', '3408');
INSERT INTO "public"."base_area" VALUES ('340803', '大观区', '3408');
INSERT INTO "public"."base_area" VALUES ('340811', '宜秀区', '3408');
INSERT INTO "public"."base_area" VALUES ('340822', '怀宁县', '3408');
INSERT INTO "public"."base_area" VALUES ('340825', '太湖县', '3408');
INSERT INTO "public"."base_area" VALUES ('340826', '宿松县', '3408');
INSERT INTO "public"."base_area" VALUES ('340827', '望江县', '3408');
INSERT INTO "public"."base_area" VALUES ('340828', '岳西县', '3408');
INSERT INTO "public"."base_area" VALUES ('340871', '安徽安庆经济开发区', '3408');
INSERT INTO "public"."base_area" VALUES ('340881', '桐城市', '3408');
INSERT INTO "public"."base_area" VALUES ('340882', '潜山市', '3408');
INSERT INTO "public"."base_area" VALUES ('341002', '屯溪区', '3410');
INSERT INTO "public"."base_area" VALUES ('341003', '黄山区', '3410');
INSERT INTO "public"."base_area" VALUES ('341004', '徽州区', '3410');
INSERT INTO "public"."base_area" VALUES ('341021', '歙县', '3410');
INSERT INTO "public"."base_area" VALUES ('341022', '休宁县', '3410');
INSERT INTO "public"."base_area" VALUES ('341023', '黟县', '3410');
INSERT INTO "public"."base_area" VALUES ('341024', '祁门县', '3410');
INSERT INTO "public"."base_area" VALUES ('341102', '琅琊区', '3411');
INSERT INTO "public"."base_area" VALUES ('341103', '南谯区', '3411');
INSERT INTO "public"."base_area" VALUES ('341122', '来安县', '3411');
INSERT INTO "public"."base_area" VALUES ('341124', '全椒县', '3411');
INSERT INTO "public"."base_area" VALUES ('341125', '定远县', '3411');
INSERT INTO "public"."base_area" VALUES ('341126', '凤阳县', '3411');
INSERT INTO "public"."base_area" VALUES ('341171', '中新苏滁高新技术产业开发区', '3411');
INSERT INTO "public"."base_area" VALUES ('341172', '滁州经济技术开发区', '3411');
INSERT INTO "public"."base_area" VALUES ('341181', '天长市', '3411');
INSERT INTO "public"."base_area" VALUES ('341182', '明光市', '3411');
INSERT INTO "public"."base_area" VALUES ('341202', '颍州区', '3412');
INSERT INTO "public"."base_area" VALUES ('341203', '颍东区', '3412');
INSERT INTO "public"."base_area" VALUES ('341204', '颍泉区', '3412');
INSERT INTO "public"."base_area" VALUES ('341221', '临泉县', '3412');
INSERT INTO "public"."base_area" VALUES ('341222', '太和县', '3412');
INSERT INTO "public"."base_area" VALUES ('341225', '阜南县', '3412');
INSERT INTO "public"."base_area" VALUES ('341226', '颍上县', '3412');
INSERT INTO "public"."base_area" VALUES ('341271', '阜阳合肥现代产业园区', '3412');
INSERT INTO "public"."base_area" VALUES ('341272', '阜阳经济技术开发区', '3412');
INSERT INTO "public"."base_area" VALUES ('341282', '界首市', '3412');
INSERT INTO "public"."base_area" VALUES ('341302', '埇桥区', '3413');
INSERT INTO "public"."base_area" VALUES ('341321', '砀山县', '3413');
INSERT INTO "public"."base_area" VALUES ('341322', '萧县', '3413');
INSERT INTO "public"."base_area" VALUES ('341323', '灵璧县', '3413');
INSERT INTO "public"."base_area" VALUES ('341324', '泗县', '3413');
INSERT INTO "public"."base_area" VALUES ('341371', '宿州马鞍山现代产业园区', '3413');
INSERT INTO "public"."base_area" VALUES ('341372', '宿州经济技术开发区', '3413');
INSERT INTO "public"."base_area" VALUES ('341502', '金安区', '3415');
INSERT INTO "public"."base_area" VALUES ('341503', '裕安区', '3415');
INSERT INTO "public"."base_area" VALUES ('341504', '叶集区', '3415');
INSERT INTO "public"."base_area" VALUES ('341522', '霍邱县', '3415');
INSERT INTO "public"."base_area" VALUES ('341523', '舒城县', '3415');
INSERT INTO "public"."base_area" VALUES ('341524', '金寨县', '3415');
INSERT INTO "public"."base_area" VALUES ('341525', '霍山县', '3415');
INSERT INTO "public"."base_area" VALUES ('341602', '谯城区', '3416');
INSERT INTO "public"."base_area" VALUES ('341621', '涡阳县', '3416');
INSERT INTO "public"."base_area" VALUES ('341622', '蒙城县', '3416');
INSERT INTO "public"."base_area" VALUES ('341623', '利辛县', '3416');
INSERT INTO "public"."base_area" VALUES ('341702', '贵池区', '3417');
INSERT INTO "public"."base_area" VALUES ('341721', '东至县', '3417');
INSERT INTO "public"."base_area" VALUES ('341722', '石台县', '3417');
INSERT INTO "public"."base_area" VALUES ('341723', '青阳县', '3417');
INSERT INTO "public"."base_area" VALUES ('341802', '宣州区', '3418');
INSERT INTO "public"."base_area" VALUES ('341821', '郎溪县', '3418');
INSERT INTO "public"."base_area" VALUES ('341823', '泾县', '3418');
INSERT INTO "public"."base_area" VALUES ('341824', '绩溪县', '3418');
INSERT INTO "public"."base_area" VALUES ('341825', '旌德县', '3418');
INSERT INTO "public"."base_area" VALUES ('341871', '宣城市经济开发区', '3418');
INSERT INTO "public"."base_area" VALUES ('341881', '宁国市', '3418');
INSERT INTO "public"."base_area" VALUES ('341882', '广德市', '3418');
INSERT INTO "public"."base_area" VALUES ('350102', '鼓楼区', '3501');
INSERT INTO "public"."base_area" VALUES ('350103', '台江区', '3501');
INSERT INTO "public"."base_area" VALUES ('350104', '仓山区', '3501');
INSERT INTO "public"."base_area" VALUES ('350105', '马尾区', '3501');
INSERT INTO "public"."base_area" VALUES ('350111', '晋安区', '3501');
INSERT INTO "public"."base_area" VALUES ('350112', '长乐区', '3501');
INSERT INTO "public"."base_area" VALUES ('350121', '闽侯县', '3501');
INSERT INTO "public"."base_area" VALUES ('350122', '连江县', '3501');
INSERT INTO "public"."base_area" VALUES ('350123', '罗源县', '3501');
INSERT INTO "public"."base_area" VALUES ('350124', '闽清县', '3501');
INSERT INTO "public"."base_area" VALUES ('350125', '永泰县', '3501');
INSERT INTO "public"."base_area" VALUES ('350128', '平潭县', '3501');
INSERT INTO "public"."base_area" VALUES ('350181', '福清市', '3501');
INSERT INTO "public"."base_area" VALUES ('350203', '思明区', '3502');
INSERT INTO "public"."base_area" VALUES ('350205', '海沧区', '3502');
INSERT INTO "public"."base_area" VALUES ('350206', '湖里区', '3502');
INSERT INTO "public"."base_area" VALUES ('350211', '集美区', '3502');
INSERT INTO "public"."base_area" VALUES ('350212', '同安区', '3502');
INSERT INTO "public"."base_area" VALUES ('350213', '翔安区', '3502');
INSERT INTO "public"."base_area" VALUES ('350302', '城厢区', '3503');
INSERT INTO "public"."base_area" VALUES ('350303', '涵江区', '3503');
INSERT INTO "public"."base_area" VALUES ('350304', '荔城区', '3503');
INSERT INTO "public"."base_area" VALUES ('350305', '秀屿区', '3503');
INSERT INTO "public"."base_area" VALUES ('350322', '仙游县', '3503');
INSERT INTO "public"."base_area" VALUES ('350404', '三元区', '3504');
INSERT INTO "public"."base_area" VALUES ('350405', '沙县区', '3504');
INSERT INTO "public"."base_area" VALUES ('350421', '明溪县', '3504');
INSERT INTO "public"."base_area" VALUES ('350423', '清流县', '3504');
INSERT INTO "public"."base_area" VALUES ('350424', '宁化县', '3504');
INSERT INTO "public"."base_area" VALUES ('350425', '大田县', '3504');
INSERT INTO "public"."base_area" VALUES ('350426', '尤溪县', '3504');
INSERT INTO "public"."base_area" VALUES ('350428', '将乐县', '3504');
INSERT INTO "public"."base_area" VALUES ('350429', '泰宁县', '3504');
INSERT INTO "public"."base_area" VALUES ('350430', '建宁县', '3504');
INSERT INTO "public"."base_area" VALUES ('350481', '永安市', '3504');
INSERT INTO "public"."base_area" VALUES ('350502', '鲤城区', '3505');
INSERT INTO "public"."base_area" VALUES ('350503', '丰泽区', '3505');
INSERT INTO "public"."base_area" VALUES ('350504', '洛江区', '3505');
INSERT INTO "public"."base_area" VALUES ('350505', '泉港区', '3505');
INSERT INTO "public"."base_area" VALUES ('350521', '惠安县', '3505');
INSERT INTO "public"."base_area" VALUES ('350524', '安溪县', '3505');
INSERT INTO "public"."base_area" VALUES ('350525', '永春县', '3505');
INSERT INTO "public"."base_area" VALUES ('350526', '德化县', '3505');
INSERT INTO "public"."base_area" VALUES ('350527', '金门县', '3505');
INSERT INTO "public"."base_area" VALUES ('350581', '石狮市', '3505');
INSERT INTO "public"."base_area" VALUES ('350582', '晋江市', '3505');
INSERT INTO "public"."base_area" VALUES ('350583', '南安市', '3505');
INSERT INTO "public"."base_area" VALUES ('350602', '芗城区', '3506');
INSERT INTO "public"."base_area" VALUES ('350603', '龙文区', '3506');
INSERT INTO "public"."base_area" VALUES ('350604', '龙海区', '3506');
INSERT INTO "public"."base_area" VALUES ('350605', '长泰区', '3506');
INSERT INTO "public"."base_area" VALUES ('350622', '云霄县', '3506');
INSERT INTO "public"."base_area" VALUES ('350623', '漳浦县', '3506');
INSERT INTO "public"."base_area" VALUES ('350624', '诏安县', '3506');
INSERT INTO "public"."base_area" VALUES ('350626', '东山县', '3506');
INSERT INTO "public"."base_area" VALUES ('350627', '南靖县', '3506');
INSERT INTO "public"."base_area" VALUES ('350628', '平和县', '3506');
INSERT INTO "public"."base_area" VALUES ('350629', '华安县', '3506');
INSERT INTO "public"."base_area" VALUES ('350702', '延平区', '3507');
INSERT INTO "public"."base_area" VALUES ('350703', '建阳区', '3507');
INSERT INTO "public"."base_area" VALUES ('350721', '顺昌县', '3507');
INSERT INTO "public"."base_area" VALUES ('350722', '浦城县', '3507');
INSERT INTO "public"."base_area" VALUES ('350723', '光泽县', '3507');
INSERT INTO "public"."base_area" VALUES ('350724', '松溪县', '3507');
INSERT INTO "public"."base_area" VALUES ('350725', '政和县', '3507');
INSERT INTO "public"."base_area" VALUES ('350781', '邵武市', '3507');
INSERT INTO "public"."base_area" VALUES ('350782', '武夷山市', '3507');
INSERT INTO "public"."base_area" VALUES ('350783', '建瓯市', '3507');
INSERT INTO "public"."base_area" VALUES ('350802', '新罗区', '3508');
INSERT INTO "public"."base_area" VALUES ('350803', '永定区', '3508');
INSERT INTO "public"."base_area" VALUES ('350821', '长汀县', '3508');
INSERT INTO "public"."base_area" VALUES ('350823', '上杭县', '3508');
INSERT INTO "public"."base_area" VALUES ('350824', '武平县', '3508');
INSERT INTO "public"."base_area" VALUES ('350825', '连城县', '3508');
INSERT INTO "public"."base_area" VALUES ('350881', '漳平市', '3508');
INSERT INTO "public"."base_area" VALUES ('350902', '蕉城区', '3509');
INSERT INTO "public"."base_area" VALUES ('350921', '霞浦县', '3509');
INSERT INTO "public"."base_area" VALUES ('350922', '古田县', '3509');
INSERT INTO "public"."base_area" VALUES ('350923', '屏南县', '3509');
INSERT INTO "public"."base_area" VALUES ('350924', '寿宁县', '3509');
INSERT INTO "public"."base_area" VALUES ('350925', '周宁县', '3509');
INSERT INTO "public"."base_area" VALUES ('350926', '柘荣县', '3509');
INSERT INTO "public"."base_area" VALUES ('350981', '福安市', '3509');
INSERT INTO "public"."base_area" VALUES ('350982', '福鼎市', '3509');
INSERT INTO "public"."base_area" VALUES ('360102', '东湖区', '3601');
INSERT INTO "public"."base_area" VALUES ('360103', '西湖区', '3601');
INSERT INTO "public"."base_area" VALUES ('360104', '青云谱区', '3601');
INSERT INTO "public"."base_area" VALUES ('360111', '青山湖区', '3601');
INSERT INTO "public"."base_area" VALUES ('360112', '新建区', '3601');
INSERT INTO "public"."base_area" VALUES ('360113', '红谷滩区', '3601');
INSERT INTO "public"."base_area" VALUES ('360121', '南昌县', '3601');
INSERT INTO "public"."base_area" VALUES ('360123', '安义县', '3601');
INSERT INTO "public"."base_area" VALUES ('360124', '进贤县', '3601');
INSERT INTO "public"."base_area" VALUES ('360202', '昌江区', '3602');
INSERT INTO "public"."base_area" VALUES ('360203', '珠山区', '3602');
INSERT INTO "public"."base_area" VALUES ('360222', '浮梁县', '3602');
INSERT INTO "public"."base_area" VALUES ('360281', '乐平市', '3602');
INSERT INTO "public"."base_area" VALUES ('360302', '安源区', '3603');
INSERT INTO "public"."base_area" VALUES ('360313', '湘东区', '3603');
INSERT INTO "public"."base_area" VALUES ('360321', '莲花县', '3603');
INSERT INTO "public"."base_area" VALUES ('360322', '上栗县', '3603');
INSERT INTO "public"."base_area" VALUES ('360323', '芦溪县', '3603');
INSERT INTO "public"."base_area" VALUES ('360402', '濂溪区', '3604');
INSERT INTO "public"."base_area" VALUES ('360403', '浔阳区', '3604');
INSERT INTO "public"."base_area" VALUES ('360404', '柴桑区', '3604');
INSERT INTO "public"."base_area" VALUES ('360423', '武宁县', '3604');
INSERT INTO "public"."base_area" VALUES ('360424', '修水县', '3604');
INSERT INTO "public"."base_area" VALUES ('360425', '永修县', '3604');
INSERT INTO "public"."base_area" VALUES ('360426', '德安县', '3604');
INSERT INTO "public"."base_area" VALUES ('360428', '都昌县', '3604');
INSERT INTO "public"."base_area" VALUES ('360429', '湖口县', '3604');
INSERT INTO "public"."base_area" VALUES ('360430', '彭泽县', '3604');
INSERT INTO "public"."base_area" VALUES ('360481', '瑞昌市', '3604');
INSERT INTO "public"."base_area" VALUES ('360482', '共青城市', '3604');
INSERT INTO "public"."base_area" VALUES ('360483', '庐山市', '3604');
INSERT INTO "public"."base_area" VALUES ('360502', '渝水区', '3605');
INSERT INTO "public"."base_area" VALUES ('360521', '分宜县', '3605');
INSERT INTO "public"."base_area" VALUES ('360602', '月湖区', '3606');
INSERT INTO "public"."base_area" VALUES ('360603', '余江区', '3606');
INSERT INTO "public"."base_area" VALUES ('360681', '贵溪市', '3606');
INSERT INTO "public"."base_area" VALUES ('360702', '章贡区', '3607');
INSERT INTO "public"."base_area" VALUES ('360703', '南康区', '3607');
INSERT INTO "public"."base_area" VALUES ('360704', '赣县区', '3607');
INSERT INTO "public"."base_area" VALUES ('360722', '信丰县', '3607');
INSERT INTO "public"."base_area" VALUES ('360723', '大余县', '3607');
INSERT INTO "public"."base_area" VALUES ('360724', '上犹县', '3607');
INSERT INTO "public"."base_area" VALUES ('360725', '崇义县', '3607');
INSERT INTO "public"."base_area" VALUES ('360726', '安远县', '3607');
INSERT INTO "public"."base_area" VALUES ('360728', '定南县', '3607');
INSERT INTO "public"."base_area" VALUES ('360729', '全南县', '3607');
INSERT INTO "public"."base_area" VALUES ('360730', '宁都县', '3607');
INSERT INTO "public"."base_area" VALUES ('360731', '于都县', '3607');
INSERT INTO "public"."base_area" VALUES ('360732', '兴国县', '3607');
INSERT INTO "public"."base_area" VALUES ('360733', '会昌县', '3607');
INSERT INTO "public"."base_area" VALUES ('360734', '寻乌县', '3607');
INSERT INTO "public"."base_area" VALUES ('360735', '石城县', '3607');
INSERT INTO "public"."base_area" VALUES ('360781', '瑞金市', '3607');
INSERT INTO "public"."base_area" VALUES ('360783', '龙南市', '3607');
INSERT INTO "public"."base_area" VALUES ('360802', '吉州区', '3608');
INSERT INTO "public"."base_area" VALUES ('360803', '青原区', '3608');
INSERT INTO "public"."base_area" VALUES ('360821', '吉安县', '3608');
INSERT INTO "public"."base_area" VALUES ('360822', '吉水县', '3608');
INSERT INTO "public"."base_area" VALUES ('360823', '峡江县', '3608');
INSERT INTO "public"."base_area" VALUES ('360824', '新干县', '3608');
INSERT INTO "public"."base_area" VALUES ('360825', '永丰县', '3608');
INSERT INTO "public"."base_area" VALUES ('360826', '泰和县', '3608');
INSERT INTO "public"."base_area" VALUES ('360827', '遂川县', '3608');
INSERT INTO "public"."base_area" VALUES ('360828', '万安县', '3608');
INSERT INTO "public"."base_area" VALUES ('360829', '安福县', '3608');
INSERT INTO "public"."base_area" VALUES ('360830', '永新县', '3608');
INSERT INTO "public"."base_area" VALUES ('360881', '井冈山市', '3608');
INSERT INTO "public"."base_area" VALUES ('360902', '袁州区', '3609');
INSERT INTO "public"."base_area" VALUES ('360921', '奉新县', '3609');
INSERT INTO "public"."base_area" VALUES ('360922', '万载县', '3609');
INSERT INTO "public"."base_area" VALUES ('360923', '上高县', '3609');
INSERT INTO "public"."base_area" VALUES ('360924', '宜丰县', '3609');
INSERT INTO "public"."base_area" VALUES ('360925', '靖安县', '3609');
INSERT INTO "public"."base_area" VALUES ('360926', '铜鼓县', '3609');
INSERT INTO "public"."base_area" VALUES ('360981', '丰城市', '3609');
INSERT INTO "public"."base_area" VALUES ('360982', '樟树市', '3609');
INSERT INTO "public"."base_area" VALUES ('360983', '高安市', '3609');
INSERT INTO "public"."base_area" VALUES ('361002', '临川区', '3610');
INSERT INTO "public"."base_area" VALUES ('361003', '东乡区', '3610');
INSERT INTO "public"."base_area" VALUES ('361021', '南城县', '3610');
INSERT INTO "public"."base_area" VALUES ('361022', '黎川县', '3610');
INSERT INTO "public"."base_area" VALUES ('361023', '南丰县', '3610');
INSERT INTO "public"."base_area" VALUES ('361024', '崇仁县', '3610');
INSERT INTO "public"."base_area" VALUES ('361025', '乐安县', '3610');
INSERT INTO "public"."base_area" VALUES ('361026', '宜黄县', '3610');
INSERT INTO "public"."base_area" VALUES ('361027', '金溪县', '3610');
INSERT INTO "public"."base_area" VALUES ('361028', '资溪县', '3610');
INSERT INTO "public"."base_area" VALUES ('361030', '广昌县', '3610');
INSERT INTO "public"."base_area" VALUES ('361102', '信州区', '3611');
INSERT INTO "public"."base_area" VALUES ('361103', '广丰区', '3611');
INSERT INTO "public"."base_area" VALUES ('361104', '广信区', '3611');
INSERT INTO "public"."base_area" VALUES ('361123', '玉山县', '3611');
INSERT INTO "public"."base_area" VALUES ('361124', '铅山县', '3611');
INSERT INTO "public"."base_area" VALUES ('361125', '横峰县', '3611');
INSERT INTO "public"."base_area" VALUES ('361126', '弋阳县', '3611');
INSERT INTO "public"."base_area" VALUES ('361127', '余干县', '3611');
INSERT INTO "public"."base_area" VALUES ('361128', '鄱阳县', '3611');
INSERT INTO "public"."base_area" VALUES ('361129', '万年县', '3611');
INSERT INTO "public"."base_area" VALUES ('361130', '婺源县', '3611');
INSERT INTO "public"."base_area" VALUES ('361181', '德兴市', '3611');
INSERT INTO "public"."base_area" VALUES ('370102', '历下区', '3701');
INSERT INTO "public"."base_area" VALUES ('370103', '市中区', '3701');
INSERT INTO "public"."base_area" VALUES ('370104', '槐荫区', '3701');
INSERT INTO "public"."base_area" VALUES ('370105', '天桥区', '3701');
INSERT INTO "public"."base_area" VALUES ('370112', '历城区', '3701');
INSERT INTO "public"."base_area" VALUES ('370113', '长清区', '3701');
INSERT INTO "public"."base_area" VALUES ('370114', '章丘区', '3701');
INSERT INTO "public"."base_area" VALUES ('370115', '济阳区', '3701');
INSERT INTO "public"."base_area" VALUES ('370116', '莱芜区', '3701');
INSERT INTO "public"."base_area" VALUES ('370117', '钢城区', '3701');
INSERT INTO "public"."base_area" VALUES ('370124', '平阴县', '3701');
INSERT INTO "public"."base_area" VALUES ('370126', '商河县', '3701');
INSERT INTO "public"."base_area" VALUES ('370171', '济南高新技术产业开发区', '3701');
INSERT INTO "public"."base_area" VALUES ('370202', '市南区', '3702');
INSERT INTO "public"."base_area" VALUES ('370203', '市北区', '3702');
INSERT INTO "public"."base_area" VALUES ('370211', '黄岛区', '3702');
INSERT INTO "public"."base_area" VALUES ('370212', '崂山区', '3702');
INSERT INTO "public"."base_area" VALUES ('370213', '李沧区', '3702');
INSERT INTO "public"."base_area" VALUES ('370214', '城阳区', '3702');
INSERT INTO "public"."base_area" VALUES ('370215', '即墨区', '3702');
INSERT INTO "public"."base_area" VALUES ('370271', '青岛高新技术产业开发区', '3702');
INSERT INTO "public"."base_area" VALUES ('370281', '胶州市', '3702');
INSERT INTO "public"."base_area" VALUES ('370283', '平度市', '3702');
INSERT INTO "public"."base_area" VALUES ('370285', '莱西市', '3702');
INSERT INTO "public"."base_area" VALUES ('370302', '淄川区', '3703');
INSERT INTO "public"."base_area" VALUES ('370303', '张店区', '3703');
INSERT INTO "public"."base_area" VALUES ('370304', '博山区', '3703');
INSERT INTO "public"."base_area" VALUES ('370305', '临淄区', '3703');
INSERT INTO "public"."base_area" VALUES ('370306', '周村区', '3703');
INSERT INTO "public"."base_area" VALUES ('370321', '桓台县', '3703');
INSERT INTO "public"."base_area" VALUES ('370322', '高青县', '3703');
INSERT INTO "public"."base_area" VALUES ('370323', '沂源县', '3703');
INSERT INTO "public"."base_area" VALUES ('370402', '市中区', '3704');
INSERT INTO "public"."base_area" VALUES ('370403', '薛城区', '3704');
INSERT INTO "public"."base_area" VALUES ('370404', '峄城区', '3704');
INSERT INTO "public"."base_area" VALUES ('370405', '台儿庄区', '3704');
INSERT INTO "public"."base_area" VALUES ('370406', '山亭区', '3704');
INSERT INTO "public"."base_area" VALUES ('370481', '滕州市', '3704');
INSERT INTO "public"."base_area" VALUES ('370502', '东营区', '3705');
INSERT INTO "public"."base_area" VALUES ('370503', '河口区', '3705');
INSERT INTO "public"."base_area" VALUES ('370505', '垦利区', '3705');
INSERT INTO "public"."base_area" VALUES ('370522', '利津县', '3705');
INSERT INTO "public"."base_area" VALUES ('370523', '广饶县', '3705');
INSERT INTO "public"."base_area" VALUES ('370571', '东营经济技术开发区', '3705');
INSERT INTO "public"."base_area" VALUES ('370572', '东营港经济开发区', '3705');
INSERT INTO "public"."base_area" VALUES ('370602', '芝罘区', '3706');
INSERT INTO "public"."base_area" VALUES ('370611', '福山区', '3706');
INSERT INTO "public"."base_area" VALUES ('370612', '牟平区', '3706');
INSERT INTO "public"."base_area" VALUES ('370613', '莱山区', '3706');
INSERT INTO "public"."base_area" VALUES ('370614', '蓬莱区', '3706');
INSERT INTO "public"."base_area" VALUES ('370671', '烟台高新技术产业开发区', '3706');
INSERT INTO "public"."base_area" VALUES ('370672', '烟台经济技术开发区', '3706');
INSERT INTO "public"."base_area" VALUES ('370681', '龙口市', '3706');
INSERT INTO "public"."base_area" VALUES ('370682', '莱阳市', '3706');
INSERT INTO "public"."base_area" VALUES ('370683', '莱州市', '3706');
INSERT INTO "public"."base_area" VALUES ('370685', '招远市', '3706');
INSERT INTO "public"."base_area" VALUES ('370686', '栖霞市', '3706');
INSERT INTO "public"."base_area" VALUES ('370687', '海阳市', '3706');
INSERT INTO "public"."base_area" VALUES ('370702', '潍城区', '3707');
INSERT INTO "public"."base_area" VALUES ('370703', '寒亭区', '3707');
INSERT INTO "public"."base_area" VALUES ('370704', '坊子区', '3707');
INSERT INTO "public"."base_area" VALUES ('370705', '奎文区', '3707');
INSERT INTO "public"."base_area" VALUES ('370724', '临朐县', '3707');
INSERT INTO "public"."base_area" VALUES ('370725', '昌乐县', '3707');
INSERT INTO "public"."base_area" VALUES ('370772', '潍坊滨海经济技术开发区', '3707');
INSERT INTO "public"."base_area" VALUES ('370781', '青州市', '3707');
INSERT INTO "public"."base_area" VALUES ('370782', '诸城市', '3707');
INSERT INTO "public"."base_area" VALUES ('370783', '寿光市', '3707');
INSERT INTO "public"."base_area" VALUES ('370784', '安丘市', '3707');
INSERT INTO "public"."base_area" VALUES ('370785', '高密市', '3707');
INSERT INTO "public"."base_area" VALUES ('370786', '昌邑市', '3707');
INSERT INTO "public"."base_area" VALUES ('370811', '任城区', '3708');
INSERT INTO "public"."base_area" VALUES ('370812', '兖州区', '3708');
INSERT INTO "public"."base_area" VALUES ('370826', '微山县', '3708');
INSERT INTO "public"."base_area" VALUES ('370827', '鱼台县', '3708');
INSERT INTO "public"."base_area" VALUES ('370828', '金乡县', '3708');
INSERT INTO "public"."base_area" VALUES ('370829', '嘉祥县', '3708');
INSERT INTO "public"."base_area" VALUES ('370830', '汶上县', '3708');
INSERT INTO "public"."base_area" VALUES ('370831', '泗水县', '3708');
INSERT INTO "public"."base_area" VALUES ('370832', '梁山县', '3708');
INSERT INTO "public"."base_area" VALUES ('370871', '济宁高新技术产业开发区', '3708');
INSERT INTO "public"."base_area" VALUES ('370881', '曲阜市', '3708');
INSERT INTO "public"."base_area" VALUES ('370883', '邹城市', '3708');
INSERT INTO "public"."base_area" VALUES ('370902', '泰山区', '3709');
INSERT INTO "public"."base_area" VALUES ('370911', '岱岳区', '3709');
INSERT INTO "public"."base_area" VALUES ('370921', '宁阳县', '3709');
INSERT INTO "public"."base_area" VALUES ('370923', '东平县', '3709');
INSERT INTO "public"."base_area" VALUES ('370982', '新泰市', '3709');
INSERT INTO "public"."base_area" VALUES ('370983', '肥城市', '3709');
INSERT INTO "public"."base_area" VALUES ('371002', '环翠区', '3710');
INSERT INTO "public"."base_area" VALUES ('371003', '文登区', '3710');
INSERT INTO "public"."base_area" VALUES ('371071', '威海火炬高技术产业开发区', '3710');
INSERT INTO "public"."base_area" VALUES ('371072', '威海经济技术开发区', '3710');
INSERT INTO "public"."base_area" VALUES ('371073', '威海临港经济技术开发区', '3710');
INSERT INTO "public"."base_area" VALUES ('371082', '荣成市', '3710');
INSERT INTO "public"."base_area" VALUES ('371083', '乳山市', '3710');
INSERT INTO "public"."base_area" VALUES ('371102', '东港区', '3711');
INSERT INTO "public"."base_area" VALUES ('371103', '岚山区', '3711');
INSERT INTO "public"."base_area" VALUES ('371121', '五莲县', '3711');
INSERT INTO "public"."base_area" VALUES ('371122', '莒县', '3711');
INSERT INTO "public"."base_area" VALUES ('371171', '日照经济技术开发区', '3711');
INSERT INTO "public"."base_area" VALUES ('371302', '兰山区', '3713');
INSERT INTO "public"."base_area" VALUES ('371311', '罗庄区', '3713');
INSERT INTO "public"."base_area" VALUES ('371312', '河东区', '3713');
INSERT INTO "public"."base_area" VALUES ('371321', '沂南县', '3713');
INSERT INTO "public"."base_area" VALUES ('371322', '郯城县', '3713');
INSERT INTO "public"."base_area" VALUES ('371323', '沂水县', '3713');
INSERT INTO "public"."base_area" VALUES ('371324', '兰陵县', '3713');
INSERT INTO "public"."base_area" VALUES ('371325', '费县', '3713');
INSERT INTO "public"."base_area" VALUES ('371326', '平邑县', '3713');
INSERT INTO "public"."base_area" VALUES ('371327', '莒南县', '3713');
INSERT INTO "public"."base_area" VALUES ('371328', '蒙阴县', '3713');
INSERT INTO "public"."base_area" VALUES ('371329', '临沭县', '3713');
INSERT INTO "public"."base_area" VALUES ('371371', '临沂高新技术产业开发区', '3713');
INSERT INTO "public"."base_area" VALUES ('371402', '德城区', '3714');
INSERT INTO "public"."base_area" VALUES ('371403', '陵城区', '3714');
INSERT INTO "public"."base_area" VALUES ('371422', '宁津县', '3714');
INSERT INTO "public"."base_area" VALUES ('371423', '庆云县', '3714');
INSERT INTO "public"."base_area" VALUES ('371424', '临邑县', '3714');
INSERT INTO "public"."base_area" VALUES ('371425', '齐河县', '3714');
INSERT INTO "public"."base_area" VALUES ('371426', '平原县', '3714');
INSERT INTO "public"."base_area" VALUES ('371427', '夏津县', '3714');
INSERT INTO "public"."base_area" VALUES ('371428', '武城县', '3714');
INSERT INTO "public"."base_area" VALUES ('371471', '德州天衢新区', '3714');
INSERT INTO "public"."base_area" VALUES ('371481', '乐陵市', '3714');
INSERT INTO "public"."base_area" VALUES ('371482', '禹城市', '3714');
INSERT INTO "public"."base_area" VALUES ('371502', '东昌府区', '3715');
INSERT INTO "public"."base_area" VALUES ('371503', '茌平区', '3715');
INSERT INTO "public"."base_area" VALUES ('371521', '阳谷县', '3715');
INSERT INTO "public"."base_area" VALUES ('371522', '莘县', '3715');
INSERT INTO "public"."base_area" VALUES ('371524', '东阿县', '3715');
INSERT INTO "public"."base_area" VALUES ('371525', '冠县', '3715');
INSERT INTO "public"."base_area" VALUES ('371526', '高唐县', '3715');
INSERT INTO "public"."base_area" VALUES ('371581', '临清市', '3715');
INSERT INTO "public"."base_area" VALUES ('371602', '滨城区', '3716');
INSERT INTO "public"."base_area" VALUES ('371603', '沾化区', '3716');
INSERT INTO "public"."base_area" VALUES ('371621', '惠民县', '3716');
INSERT INTO "public"."base_area" VALUES ('371622', '阳信县', '3716');
INSERT INTO "public"."base_area" VALUES ('371623', '无棣县', '3716');
INSERT INTO "public"."base_area" VALUES ('371625', '博兴县', '3716');
INSERT INTO "public"."base_area" VALUES ('371681', '邹平市', '3716');
INSERT INTO "public"."base_area" VALUES ('371702', '牡丹区', '3717');
INSERT INTO "public"."base_area" VALUES ('371703', '定陶区', '3717');
INSERT INTO "public"."base_area" VALUES ('371721', '曹县', '3717');
INSERT INTO "public"."base_area" VALUES ('371722', '单县', '3717');
INSERT INTO "public"."base_area" VALUES ('371723', '成武县', '3717');
INSERT INTO "public"."base_area" VALUES ('371724', '巨野县', '3717');
INSERT INTO "public"."base_area" VALUES ('371725', '郓城县', '3717');
INSERT INTO "public"."base_area" VALUES ('371726', '鄄城县', '3717');
INSERT INTO "public"."base_area" VALUES ('371728', '东明县', '3717');
INSERT INTO "public"."base_area" VALUES ('371771', '菏泽经济技术开发区', '3717');
INSERT INTO "public"."base_area" VALUES ('371772', '菏泽高新技术开发区', '3717');
INSERT INTO "public"."base_area" VALUES ('410102', '中原区', '4101');
INSERT INTO "public"."base_area" VALUES ('410103', '二七区', '4101');
INSERT INTO "public"."base_area" VALUES ('410104', '管城回族区', '4101');
INSERT INTO "public"."base_area" VALUES ('410105', '金水区', '4101');
INSERT INTO "public"."base_area" VALUES ('410106', '上街区', '4101');
INSERT INTO "public"."base_area" VALUES ('410108', '惠济区', '4101');
INSERT INTO "public"."base_area" VALUES ('410122', '中牟县', '4101');
INSERT INTO "public"."base_area" VALUES ('410171', '郑州经济技术开发区', '4101');
INSERT INTO "public"."base_area" VALUES ('410172', '郑州高新技术产业开发区', '4101');
INSERT INTO "public"."base_area" VALUES ('410173', '郑州航空港经济综合实验区', '4101');
INSERT INTO "public"."base_area" VALUES ('410181', '巩义市', '4101');
INSERT INTO "public"."base_area" VALUES ('410182', '荥阳市', '4101');
INSERT INTO "public"."base_area" VALUES ('410183', '新密市', '4101');
INSERT INTO "public"."base_area" VALUES ('410184', '新郑市', '4101');
INSERT INTO "public"."base_area" VALUES ('410185', '登封市', '4101');
INSERT INTO "public"."base_area" VALUES ('410202', '龙亭区', '4102');
INSERT INTO "public"."base_area" VALUES ('410203', '顺河回族区', '4102');
INSERT INTO "public"."base_area" VALUES ('410204', '鼓楼区', '4102');
INSERT INTO "public"."base_area" VALUES ('410205', '禹王台区', '4102');
INSERT INTO "public"."base_area" VALUES ('410212', '祥符区', '4102');
INSERT INTO "public"."base_area" VALUES ('410221', '杞县', '4102');
INSERT INTO "public"."base_area" VALUES ('410222', '通许县', '4102');
INSERT INTO "public"."base_area" VALUES ('410223', '尉氏县', '4102');
INSERT INTO "public"."base_area" VALUES ('410225', '兰考县', '4102');
INSERT INTO "public"."base_area" VALUES ('410302', '老城区', '4103');
INSERT INTO "public"."base_area" VALUES ('410303', '西工区', '4103');
INSERT INTO "public"."base_area" VALUES ('410304', '瀍河回族区', '4103');
INSERT INTO "public"."base_area" VALUES ('410305', '涧西区', '4103');
INSERT INTO "public"."base_area" VALUES ('410307', '偃师区', '4103');
INSERT INTO "public"."base_area" VALUES ('410308', '孟津区', '4103');
INSERT INTO "public"."base_area" VALUES ('410311', '洛龙区', '4103');
INSERT INTO "public"."base_area" VALUES ('410323', '新安县', '4103');
INSERT INTO "public"."base_area" VALUES ('410324', '栾川县', '4103');
INSERT INTO "public"."base_area" VALUES ('410325', '嵩县', '4103');
INSERT INTO "public"."base_area" VALUES ('410326', '汝阳县', '4103');
INSERT INTO "public"."base_area" VALUES ('410327', '宜阳县', '4103');
INSERT INTO "public"."base_area" VALUES ('410328', '洛宁县', '4103');
INSERT INTO "public"."base_area" VALUES ('410329', '伊川县', '4103');
INSERT INTO "public"."base_area" VALUES ('410371', '洛阳高新技术产业开发区', '4103');
INSERT INTO "public"."base_area" VALUES ('410402', '新华区', '4104');
INSERT INTO "public"."base_area" VALUES ('410403', '卫东区', '4104');
INSERT INTO "public"."base_area" VALUES ('410404', '石龙区', '4104');
INSERT INTO "public"."base_area" VALUES ('410411', '湛河区', '4104');
INSERT INTO "public"."base_area" VALUES ('410421', '宝丰县', '4104');
INSERT INTO "public"."base_area" VALUES ('410422', '叶县', '4104');
INSERT INTO "public"."base_area" VALUES ('410423', '鲁山县', '4104');
INSERT INTO "public"."base_area" VALUES ('410425', '郏县', '4104');
INSERT INTO "public"."base_area" VALUES ('410471', '平顶山高新技术产业开发区', '4104');
INSERT INTO "public"."base_area" VALUES ('410472', '平顶山市城乡一体化示范区', '4104');
INSERT INTO "public"."base_area" VALUES ('410481', '舞钢市', '4104');
INSERT INTO "public"."base_area" VALUES ('410482', '汝州市', '4104');
INSERT INTO "public"."base_area" VALUES ('410502', '文峰区', '4105');
INSERT INTO "public"."base_area" VALUES ('410503', '北关区', '4105');
INSERT INTO "public"."base_area" VALUES ('410505', '殷都区', '4105');
INSERT INTO "public"."base_area" VALUES ('410506', '龙安区', '4105');
INSERT INTO "public"."base_area" VALUES ('410522', '安阳县', '4105');
INSERT INTO "public"."base_area" VALUES ('410523', '汤阴县', '4105');
INSERT INTO "public"."base_area" VALUES ('410526', '滑县', '4105');
INSERT INTO "public"."base_area" VALUES ('410527', '内黄县', '4105');
INSERT INTO "public"."base_area" VALUES ('410571', '安阳高新技术产业开发区', '4105');
INSERT INTO "public"."base_area" VALUES ('410581', '林州市', '4105');
INSERT INTO "public"."base_area" VALUES ('410602', '鹤山区', '4106');
INSERT INTO "public"."base_area" VALUES ('410603', '山城区', '4106');
INSERT INTO "public"."base_area" VALUES ('410611', '淇滨区', '4106');
INSERT INTO "public"."base_area" VALUES ('410621', '浚县', '4106');
INSERT INTO "public"."base_area" VALUES ('410622', '淇县', '4106');
INSERT INTO "public"."base_area" VALUES ('410671', '鹤壁经济技术开发区', '4106');
INSERT INTO "public"."base_area" VALUES ('410702', '红旗区', '4107');
INSERT INTO "public"."base_area" VALUES ('410703', '卫滨区', '4107');
INSERT INTO "public"."base_area" VALUES ('410704', '凤泉区', '4107');
INSERT INTO "public"."base_area" VALUES ('410711', '牧野区', '4107');
INSERT INTO "public"."base_area" VALUES ('410721', '新乡县', '4107');
INSERT INTO "public"."base_area" VALUES ('410724', '获嘉县', '4107');
INSERT INTO "public"."base_area" VALUES ('410725', '原阳县', '4107');
INSERT INTO "public"."base_area" VALUES ('410726', '延津县', '4107');
INSERT INTO "public"."base_area" VALUES ('410727', '封丘县', '4107');
INSERT INTO "public"."base_area" VALUES ('410771', '新乡高新技术产业开发区', '4107');
INSERT INTO "public"."base_area" VALUES ('410772', '新乡经济技术开发区', '4107');
INSERT INTO "public"."base_area" VALUES ('410773', '新乡市平原城乡一体化示范区', '4107');
INSERT INTO "public"."base_area" VALUES ('410781', '卫辉市', '4107');
INSERT INTO "public"."base_area" VALUES ('410782', '辉县市', '4107');
INSERT INTO "public"."base_area" VALUES ('410783', '长垣市', '4107');
INSERT INTO "public"."base_area" VALUES ('410802', '解放区', '4108');
INSERT INTO "public"."base_area" VALUES ('410803', '中站区', '4108');
INSERT INTO "public"."base_area" VALUES ('410804', '马村区', '4108');
INSERT INTO "public"."base_area" VALUES ('410811', '山阳区', '4108');
INSERT INTO "public"."base_area" VALUES ('410821', '修武县', '4108');
INSERT INTO "public"."base_area" VALUES ('410822', '博爱县', '4108');
INSERT INTO "public"."base_area" VALUES ('410823', '武陟县', '4108');
INSERT INTO "public"."base_area" VALUES ('410825', '温县', '4108');
INSERT INTO "public"."base_area" VALUES ('410871', '焦作城乡一体化示范区', '4108');
INSERT INTO "public"."base_area" VALUES ('410882', '沁阳市', '4108');
INSERT INTO "public"."base_area" VALUES ('410883', '孟州市', '4108');
INSERT INTO "public"."base_area" VALUES ('410902', '华龙区', '4109');
INSERT INTO "public"."base_area" VALUES ('410922', '清丰县', '4109');
INSERT INTO "public"."base_area" VALUES ('410923', '南乐县', '4109');
INSERT INTO "public"."base_area" VALUES ('410926', '范县', '4109');
INSERT INTO "public"."base_area" VALUES ('410927', '台前县', '4109');
INSERT INTO "public"."base_area" VALUES ('410928', '濮阳县', '4109');
INSERT INTO "public"."base_area" VALUES ('410971', '河南濮阳工业园区', '4109');
INSERT INTO "public"."base_area" VALUES ('410972', '濮阳经济技术开发区', '4109');
INSERT INTO "public"."base_area" VALUES ('411002', '魏都区', '4110');
INSERT INTO "public"."base_area" VALUES ('411003', '建安区', '4110');
INSERT INTO "public"."base_area" VALUES ('411024', '鄢陵县', '4110');
INSERT INTO "public"."base_area" VALUES ('411025', '襄城县', '4110');
INSERT INTO "public"."base_area" VALUES ('411071', '许昌经济技术开发区', '4110');
INSERT INTO "public"."base_area" VALUES ('411081', '禹州市', '4110');
INSERT INTO "public"."base_area" VALUES ('411082', '长葛市', '4110');
INSERT INTO "public"."base_area" VALUES ('411102', '源汇区', '4111');
INSERT INTO "public"."base_area" VALUES ('411103', '郾城区', '4111');
INSERT INTO "public"."base_area" VALUES ('411104', '召陵区', '4111');
INSERT INTO "public"."base_area" VALUES ('411121', '舞阳县', '4111');
INSERT INTO "public"."base_area" VALUES ('411122', '临颍县', '4111');
INSERT INTO "public"."base_area" VALUES ('411171', '漯河经济技术开发区', '4111');
INSERT INTO "public"."base_area" VALUES ('411202', '湖滨区', '4112');
INSERT INTO "public"."base_area" VALUES ('411203', '陕州区', '4112');
INSERT INTO "public"."base_area" VALUES ('411221', '渑池县', '4112');
INSERT INTO "public"."base_area" VALUES ('411224', '卢氏县', '4112');
INSERT INTO "public"."base_area" VALUES ('411271', '河南三门峡经济开发区', '4112');
INSERT INTO "public"."base_area" VALUES ('411281', '义马市', '4112');
INSERT INTO "public"."base_area" VALUES ('411282', '灵宝市', '4112');
INSERT INTO "public"."base_area" VALUES ('411302', '宛城区', '4113');
INSERT INTO "public"."base_area" VALUES ('411303', '卧龙区', '4113');
INSERT INTO "public"."base_area" VALUES ('411321', '南召县', '4113');
INSERT INTO "public"."base_area" VALUES ('411322', '方城县', '4113');
INSERT INTO "public"."base_area" VALUES ('411323', '西峡县', '4113');
INSERT INTO "public"."base_area" VALUES ('411324', '镇平县', '4113');
INSERT INTO "public"."base_area" VALUES ('411325', '内乡县', '4113');
INSERT INTO "public"."base_area" VALUES ('411326', '淅川县', '4113');
INSERT INTO "public"."base_area" VALUES ('411327', '社旗县', '4113');
INSERT INTO "public"."base_area" VALUES ('411328', '唐河县', '4113');
INSERT INTO "public"."base_area" VALUES ('411329', '新野县', '4113');
INSERT INTO "public"."base_area" VALUES ('411330', '桐柏县', '4113');
INSERT INTO "public"."base_area" VALUES ('411371', '南阳高新技术产业开发区', '4113');
INSERT INTO "public"."base_area" VALUES ('411372', '南阳市城乡一体化示范区', '4113');
INSERT INTO "public"."base_area" VALUES ('411381', '邓州市', '4113');
INSERT INTO "public"."base_area" VALUES ('411402', '梁园区', '4114');
INSERT INTO "public"."base_area" VALUES ('411403', '睢阳区', '4114');
INSERT INTO "public"."base_area" VALUES ('411421', '民权县', '4114');
INSERT INTO "public"."base_area" VALUES ('411422', '睢县', '4114');
INSERT INTO "public"."base_area" VALUES ('411423', '宁陵县', '4114');
INSERT INTO "public"."base_area" VALUES ('411424', '柘城县', '4114');
INSERT INTO "public"."base_area" VALUES ('411425', '虞城县', '4114');
INSERT INTO "public"."base_area" VALUES ('411426', '夏邑县', '4114');
INSERT INTO "public"."base_area" VALUES ('411471', '豫东综合物流产业聚集区', '4114');
INSERT INTO "public"."base_area" VALUES ('411472', '河南商丘经济开发区', '4114');
INSERT INTO "public"."base_area" VALUES ('411481', '永城市', '4114');
INSERT INTO "public"."base_area" VALUES ('411502', '浉河区', '4115');
INSERT INTO "public"."base_area" VALUES ('411503', '平桥区', '4115');
INSERT INTO "public"."base_area" VALUES ('411521', '罗山县', '4115');
INSERT INTO "public"."base_area" VALUES ('411522', '光山县', '4115');
INSERT INTO "public"."base_area" VALUES ('411523', '新县', '4115');
INSERT INTO "public"."base_area" VALUES ('411524', '商城县', '4115');
INSERT INTO "public"."base_area" VALUES ('411525', '固始县', '4115');
INSERT INTO "public"."base_area" VALUES ('411526', '潢川县', '4115');
INSERT INTO "public"."base_area" VALUES ('411527', '淮滨县', '4115');
INSERT INTO "public"."base_area" VALUES ('411528', '息县', '4115');
INSERT INTO "public"."base_area" VALUES ('411571', '信阳高新技术产业开发区', '4115');
INSERT INTO "public"."base_area" VALUES ('411602', '川汇区', '4116');
INSERT INTO "public"."base_area" VALUES ('411603', '淮阳区', '4116');
INSERT INTO "public"."base_area" VALUES ('411621', '扶沟县', '4116');
INSERT INTO "public"."base_area" VALUES ('411622', '西华县', '4116');
INSERT INTO "public"."base_area" VALUES ('411623', '商水县', '4116');
INSERT INTO "public"."base_area" VALUES ('411624', '沈丘县', '4116');
INSERT INTO "public"."base_area" VALUES ('411625', '郸城县', '4116');
INSERT INTO "public"."base_area" VALUES ('411627', '太康县', '4116');
INSERT INTO "public"."base_area" VALUES ('411628', '鹿邑县', '4116');
INSERT INTO "public"."base_area" VALUES ('411671', '河南周口经济开发区', '4116');
INSERT INTO "public"."base_area" VALUES ('411681', '项城市', '4116');
INSERT INTO "public"."base_area" VALUES ('411702', '驿城区', '4117');
INSERT INTO "public"."base_area" VALUES ('411721', '西平县', '4117');
INSERT INTO "public"."base_area" VALUES ('411722', '上蔡县', '4117');
INSERT INTO "public"."base_area" VALUES ('411723', '平舆县', '4117');
INSERT INTO "public"."base_area" VALUES ('411724', '正阳县', '4117');
INSERT INTO "public"."base_area" VALUES ('411725', '确山县', '4117');
INSERT INTO "public"."base_area" VALUES ('411726', '泌阳县', '4117');
INSERT INTO "public"."base_area" VALUES ('411727', '汝南县', '4117');
INSERT INTO "public"."base_area" VALUES ('411728', '遂平县', '4117');
INSERT INTO "public"."base_area" VALUES ('411729', '新蔡县', '4117');
INSERT INTO "public"."base_area" VALUES ('411771', '河南驻马店经济开发区', '4117');
INSERT INTO "public"."base_area" VALUES ('419001', '济源市', '4190');
INSERT INTO "public"."base_area" VALUES ('420102', '江岸区', '4201');
INSERT INTO "public"."base_area" VALUES ('420103', '江汉区', '4201');
INSERT INTO "public"."base_area" VALUES ('420104', '硚口区', '4201');
INSERT INTO "public"."base_area" VALUES ('420105', '汉阳区', '4201');
INSERT INTO "public"."base_area" VALUES ('420106', '武昌区', '4201');
INSERT INTO "public"."base_area" VALUES ('420107', '青山区', '4201');
INSERT INTO "public"."base_area" VALUES ('420111', '洪山区', '4201');
INSERT INTO "public"."base_area" VALUES ('420112', '东西湖区', '4201');
INSERT INTO "public"."base_area" VALUES ('420113', '汉南区', '4201');
INSERT INTO "public"."base_area" VALUES ('420114', '蔡甸区', '4201');
INSERT INTO "public"."base_area" VALUES ('420115', '江夏区', '4201');
INSERT INTO "public"."base_area" VALUES ('420116', '黄陂区', '4201');
INSERT INTO "public"."base_area" VALUES ('420117', '新洲区', '4201');
INSERT INTO "public"."base_area" VALUES ('420202', '黄石港区', '4202');
INSERT INTO "public"."base_area" VALUES ('420203', '西塞山区', '4202');
INSERT INTO "public"."base_area" VALUES ('420204', '下陆区', '4202');
INSERT INTO "public"."base_area" VALUES ('420205', '铁山区', '4202');
INSERT INTO "public"."base_area" VALUES ('420222', '阳新县', '4202');
INSERT INTO "public"."base_area" VALUES ('420281', '大冶市', '4202');
INSERT INTO "public"."base_area" VALUES ('420302', '茅箭区', '4203');
INSERT INTO "public"."base_area" VALUES ('420303', '张湾区', '4203');
INSERT INTO "public"."base_area" VALUES ('420304', '郧阳区', '4203');
INSERT INTO "public"."base_area" VALUES ('420322', '郧西县', '4203');
INSERT INTO "public"."base_area" VALUES ('420323', '竹山县', '4203');
INSERT INTO "public"."base_area" VALUES ('420324', '竹溪县', '4203');
INSERT INTO "public"."base_area" VALUES ('420325', '房县', '4203');
INSERT INTO "public"."base_area" VALUES ('420381', '丹江口市', '4203');
INSERT INTO "public"."base_area" VALUES ('420502', '西陵区', '4205');
INSERT INTO "public"."base_area" VALUES ('420503', '伍家岗区', '4205');
INSERT INTO "public"."base_area" VALUES ('420504', '点军区', '4205');
INSERT INTO "public"."base_area" VALUES ('420505', '猇亭区', '4205');
INSERT INTO "public"."base_area" VALUES ('420506', '夷陵区', '4205');
INSERT INTO "public"."base_area" VALUES ('420525', '远安县', '4205');
INSERT INTO "public"."base_area" VALUES ('420526', '兴山县', '4205');
INSERT INTO "public"."base_area" VALUES ('420527', '秭归县', '4205');
INSERT INTO "public"."base_area" VALUES ('420528', '长阳土家族自治县', '4205');
INSERT INTO "public"."base_area" VALUES ('420529', '五峰土家族自治县', '4205');
INSERT INTO "public"."base_area" VALUES ('420581', '宜都市', '4205');
INSERT INTO "public"."base_area" VALUES ('420582', '当阳市', '4205');
INSERT INTO "public"."base_area" VALUES ('420583', '枝江市', '4205');
INSERT INTO "public"."base_area" VALUES ('420602', '襄城区', '4206');
INSERT INTO "public"."base_area" VALUES ('420606', '樊城区', '4206');
INSERT INTO "public"."base_area" VALUES ('420607', '襄州区', '4206');
INSERT INTO "public"."base_area" VALUES ('420624', '南漳县', '4206');
INSERT INTO "public"."base_area" VALUES ('420625', '谷城县', '4206');
INSERT INTO "public"."base_area" VALUES ('420626', '保康县', '4206');
INSERT INTO "public"."base_area" VALUES ('420682', '老河口市', '4206');
INSERT INTO "public"."base_area" VALUES ('420683', '枣阳市', '4206');
INSERT INTO "public"."base_area" VALUES ('420684', '宜城市', '4206');
INSERT INTO "public"."base_area" VALUES ('420702', '梁子湖区', '4207');
INSERT INTO "public"."base_area" VALUES ('420703', '华容区', '4207');
INSERT INTO "public"."base_area" VALUES ('420704', '鄂城区', '4207');
INSERT INTO "public"."base_area" VALUES ('420802', '东宝区', '4208');
INSERT INTO "public"."base_area" VALUES ('420804', '掇刀区', '4208');
INSERT INTO "public"."base_area" VALUES ('420822', '沙洋县', '4208');
INSERT INTO "public"."base_area" VALUES ('420881', '钟祥市', '4208');
INSERT INTO "public"."base_area" VALUES ('420882', '京山市', '4208');
INSERT INTO "public"."base_area" VALUES ('420902', '孝南区', '4209');
INSERT INTO "public"."base_area" VALUES ('420921', '孝昌县', '4209');
INSERT INTO "public"."base_area" VALUES ('420922', '大悟县', '4209');
INSERT INTO "public"."base_area" VALUES ('420923', '云梦县', '4209');
INSERT INTO "public"."base_area" VALUES ('420981', '应城市', '4209');
INSERT INTO "public"."base_area" VALUES ('420982', '安陆市', '4209');
INSERT INTO "public"."base_area" VALUES ('420984', '汉川市', '4209');
INSERT INTO "public"."base_area" VALUES ('421002', '沙市区', '4210');
INSERT INTO "public"."base_area" VALUES ('421003', '荆州区', '4210');
INSERT INTO "public"."base_area" VALUES ('421022', '公安县', '4210');
INSERT INTO "public"."base_area" VALUES ('421024', '江陵县', '4210');
INSERT INTO "public"."base_area" VALUES ('421071', '荆州经济技术开发区', '4210');
INSERT INTO "public"."base_area" VALUES ('421081', '石首市', '4210');
INSERT INTO "public"."base_area" VALUES ('421083', '洪湖市', '4210');
INSERT INTO "public"."base_area" VALUES ('421087', '松滋市', '4210');
INSERT INTO "public"."base_area" VALUES ('421088', '监利市', '4210');
INSERT INTO "public"."base_area" VALUES ('421102', '黄州区', '4211');
INSERT INTO "public"."base_area" VALUES ('421121', '团风县', '4211');
INSERT INTO "public"."base_area" VALUES ('421122', '红安县', '4211');
INSERT INTO "public"."base_area" VALUES ('421123', '罗田县', '4211');
INSERT INTO "public"."base_area" VALUES ('421124', '英山县', '4211');
INSERT INTO "public"."base_area" VALUES ('421125', '浠水县', '4211');
INSERT INTO "public"."base_area" VALUES ('421126', '蕲春县', '4211');
INSERT INTO "public"."base_area" VALUES ('421127', '黄梅县', '4211');
INSERT INTO "public"."base_area" VALUES ('421171', '龙感湖管理区', '4211');
INSERT INTO "public"."base_area" VALUES ('421181', '麻城市', '4211');
INSERT INTO "public"."base_area" VALUES ('421182', '武穴市', '4211');
INSERT INTO "public"."base_area" VALUES ('421202', '咸安区', '4212');
INSERT INTO "public"."base_area" VALUES ('421221', '嘉鱼县', '4212');
INSERT INTO "public"."base_area" VALUES ('421222', '通城县', '4212');
INSERT INTO "public"."base_area" VALUES ('421223', '崇阳县', '4212');
INSERT INTO "public"."base_area" VALUES ('421224', '通山县', '4212');
INSERT INTO "public"."base_area" VALUES ('421281', '赤壁市', '4212');
INSERT INTO "public"."base_area" VALUES ('421303', '曾都区', '4213');
INSERT INTO "public"."base_area" VALUES ('421321', '随县', '4213');
INSERT INTO "public"."base_area" VALUES ('421381', '广水市', '4213');
INSERT INTO "public"."base_area" VALUES ('422801', '恩施市', '4228');
INSERT INTO "public"."base_area" VALUES ('422802', '利川市', '4228');
INSERT INTO "public"."base_area" VALUES ('422822', '建始县', '4228');
INSERT INTO "public"."base_area" VALUES ('422823', '巴东县', '4228');
INSERT INTO "public"."base_area" VALUES ('422825', '宣恩县', '4228');
INSERT INTO "public"."base_area" VALUES ('422826', '咸丰县', '4228');
INSERT INTO "public"."base_area" VALUES ('422827', '来凤县', '4228');
INSERT INTO "public"."base_area" VALUES ('422828', '鹤峰县', '4228');
INSERT INTO "public"."base_area" VALUES ('429004', '仙桃市', '4290');
INSERT INTO "public"."base_area" VALUES ('429005', '潜江市', '4290');
INSERT INTO "public"."base_area" VALUES ('429006', '天门市', '4290');
INSERT INTO "public"."base_area" VALUES ('429021', '神农架林区', '4290');
INSERT INTO "public"."base_area" VALUES ('430102', '芙蓉区', '4301');
INSERT INTO "public"."base_area" VALUES ('430103', '天心区', '4301');
INSERT INTO "public"."base_area" VALUES ('430104', '岳麓区', '4301');
INSERT INTO "public"."base_area" VALUES ('430105', '开福区', '4301');
INSERT INTO "public"."base_area" VALUES ('430111', '雨花区', '4301');
INSERT INTO "public"."base_area" VALUES ('430112', '望城区', '4301');
INSERT INTO "public"."base_area" VALUES ('430121', '长沙县', '4301');
INSERT INTO "public"."base_area" VALUES ('430181', '浏阳市', '4301');
INSERT INTO "public"."base_area" VALUES ('430182', '宁乡市', '4301');
INSERT INTO "public"."base_area" VALUES ('430202', '荷塘区', '4302');
INSERT INTO "public"."base_area" VALUES ('430203', '芦淞区', '4302');
INSERT INTO "public"."base_area" VALUES ('430204', '石峰区', '4302');
INSERT INTO "public"."base_area" VALUES ('430211', '天元区', '4302');
INSERT INTO "public"."base_area" VALUES ('430212', '渌口区', '4302');
INSERT INTO "public"."base_area" VALUES ('430223', '攸县', '4302');
INSERT INTO "public"."base_area" VALUES ('430224', '茶陵县', '4302');
INSERT INTO "public"."base_area" VALUES ('430225', '炎陵县', '4302');
INSERT INTO "public"."base_area" VALUES ('430281', '醴陵市', '4302');
INSERT INTO "public"."base_area" VALUES ('430302', '雨湖区', '4303');
INSERT INTO "public"."base_area" VALUES ('430304', '岳塘区', '4303');
INSERT INTO "public"."base_area" VALUES ('430321', '湘潭县', '4303');
INSERT INTO "public"."base_area" VALUES ('430371', '湖南湘潭高新技术产业园区', '4303');
INSERT INTO "public"."base_area" VALUES ('430372', '湘潭昭山示范区', '4303');
INSERT INTO "public"."base_area" VALUES ('430373', '湘潭九华示范区', '4303');
INSERT INTO "public"."base_area" VALUES ('430381', '湘乡市', '4303');
INSERT INTO "public"."base_area" VALUES ('430382', '韶山市', '4303');
INSERT INTO "public"."base_area" VALUES ('430405', '珠晖区', '4304');
INSERT INTO "public"."base_area" VALUES ('430406', '雁峰区', '4304');
INSERT INTO "public"."base_area" VALUES ('430407', '石鼓区', '4304');
INSERT INTO "public"."base_area" VALUES ('430408', '蒸湘区', '4304');
INSERT INTO "public"."base_area" VALUES ('430412', '南岳区', '4304');
INSERT INTO "public"."base_area" VALUES ('430421', '衡阳县', '4304');
INSERT INTO "public"."base_area" VALUES ('430422', '衡南县', '4304');
INSERT INTO "public"."base_area" VALUES ('430423', '衡山县', '4304');
INSERT INTO "public"."base_area" VALUES ('430424', '衡东县', '4304');
INSERT INTO "public"."base_area" VALUES ('430426', '祁东县', '4304');
INSERT INTO "public"."base_area" VALUES ('430471', '衡阳综合保税区', '4304');
INSERT INTO "public"."base_area" VALUES ('430472', '湖南衡阳高新技术产业园区', '4304');
INSERT INTO "public"."base_area" VALUES ('430473', '湖南衡阳松木经济开发区', '4304');
INSERT INTO "public"."base_area" VALUES ('430481', '耒阳市', '4304');
INSERT INTO "public"."base_area" VALUES ('430482', '常宁市', '4304');
INSERT INTO "public"."base_area" VALUES ('430502', '双清区', '4305');
INSERT INTO "public"."base_area" VALUES ('430503', '大祥区', '4305');
INSERT INTO "public"."base_area" VALUES ('430511', '北塔区', '4305');
INSERT INTO "public"."base_area" VALUES ('430522', '新邵县', '4305');
INSERT INTO "public"."base_area" VALUES ('430523', '邵阳县', '4305');
INSERT INTO "public"."base_area" VALUES ('430524', '隆回县', '4305');
INSERT INTO "public"."base_area" VALUES ('430525', '洞口县', '4305');
INSERT INTO "public"."base_area" VALUES ('430527', '绥宁县', '4305');
INSERT INTO "public"."base_area" VALUES ('430528', '新宁县', '4305');
INSERT INTO "public"."base_area" VALUES ('430529', '城步苗族自治县', '4305');
INSERT INTO "public"."base_area" VALUES ('430581', '武冈市', '4305');
INSERT INTO "public"."base_area" VALUES ('430582', '邵东市', '4305');
INSERT INTO "public"."base_area" VALUES ('430602', '岳阳楼区', '4306');
INSERT INTO "public"."base_area" VALUES ('430603', '云溪区', '4306');
INSERT INTO "public"."base_area" VALUES ('430611', '君山区', '4306');
INSERT INTO "public"."base_area" VALUES ('430621', '岳阳县', '4306');
INSERT INTO "public"."base_area" VALUES ('430623', '华容县', '4306');
INSERT INTO "public"."base_area" VALUES ('430624', '湘阴县', '4306');
INSERT INTO "public"."base_area" VALUES ('430626', '平江县', '4306');
INSERT INTO "public"."base_area" VALUES ('430671', '岳阳市屈原管理区', '4306');
INSERT INTO "public"."base_area" VALUES ('430681', '汨罗市', '4306');
INSERT INTO "public"."base_area" VALUES ('430682', '临湘市', '4306');
INSERT INTO "public"."base_area" VALUES ('430702', '武陵区', '4307');
INSERT INTO "public"."base_area" VALUES ('430703', '鼎城区', '4307');
INSERT INTO "public"."base_area" VALUES ('430721', '安乡县', '4307');
INSERT INTO "public"."base_area" VALUES ('430722', '汉寿县', '4307');
INSERT INTO "public"."base_area" VALUES ('430723', '澧县', '4307');
INSERT INTO "public"."base_area" VALUES ('430724', '临澧县', '4307');
INSERT INTO "public"."base_area" VALUES ('430725', '桃源县', '4307');
INSERT INTO "public"."base_area" VALUES ('430726', '石门县', '4307');
INSERT INTO "public"."base_area" VALUES ('430771', '常德市西洞庭管理区', '4307');
INSERT INTO "public"."base_area" VALUES ('430781', '津市市', '4307');
INSERT INTO "public"."base_area" VALUES ('430802', '永定区', '4308');
INSERT INTO "public"."base_area" VALUES ('430811', '武陵源区', '4308');
INSERT INTO "public"."base_area" VALUES ('430821', '慈利县', '4308');
INSERT INTO "public"."base_area" VALUES ('430822', '桑植县', '4308');
INSERT INTO "public"."base_area" VALUES ('430902', '资阳区', '4309');
INSERT INTO "public"."base_area" VALUES ('430903', '赫山区', '4309');
INSERT INTO "public"."base_area" VALUES ('430921', '南县', '4309');
INSERT INTO "public"."base_area" VALUES ('430922', '桃江县', '4309');
INSERT INTO "public"."base_area" VALUES ('430923', '安化县', '4309');
INSERT INTO "public"."base_area" VALUES ('430971', '益阳市大通湖管理区', '4309');
INSERT INTO "public"."base_area" VALUES ('430972', '湖南益阳高新技术产业园区', '4309');
INSERT INTO "public"."base_area" VALUES ('430981', '沅江市', '4309');
INSERT INTO "public"."base_area" VALUES ('431002', '北湖区', '4310');
INSERT INTO "public"."base_area" VALUES ('431003', '苏仙区', '4310');
INSERT INTO "public"."base_area" VALUES ('431021', '桂阳县', '4310');
INSERT INTO "public"."base_area" VALUES ('431022', '宜章县', '4310');
INSERT INTO "public"."base_area" VALUES ('431023', '永兴县', '4310');
INSERT INTO "public"."base_area" VALUES ('431024', '嘉禾县', '4310');
INSERT INTO "public"."base_area" VALUES ('431025', '临武县', '4310');
INSERT INTO "public"."base_area" VALUES ('431026', '汝城县', '4310');
INSERT INTO "public"."base_area" VALUES ('431027', '桂东县', '4310');
INSERT INTO "public"."base_area" VALUES ('431028', '安仁县', '4310');
INSERT INTO "public"."base_area" VALUES ('431081', '资兴市', '4310');
INSERT INTO "public"."base_area" VALUES ('431102', '零陵区', '4311');
INSERT INTO "public"."base_area" VALUES ('431103', '冷水滩区', '4311');
INSERT INTO "public"."base_area" VALUES ('431122', '东安县', '4311');
INSERT INTO "public"."base_area" VALUES ('431123', '双牌县', '4311');
INSERT INTO "public"."base_area" VALUES ('431124', '道县', '4311');
INSERT INTO "public"."base_area" VALUES ('431125', '江永县', '4311');
INSERT INTO "public"."base_area" VALUES ('431126', '宁远县', '4311');
INSERT INTO "public"."base_area" VALUES ('431127', '蓝山县', '4311');
INSERT INTO "public"."base_area" VALUES ('431128', '新田县', '4311');
INSERT INTO "public"."base_area" VALUES ('431129', '江华瑶族自治县', '4311');
INSERT INTO "public"."base_area" VALUES ('431171', '永州经济技术开发区', '4311');
INSERT INTO "public"."base_area" VALUES ('431173', '永州市回龙圩管理区', '4311');
INSERT INTO "public"."base_area" VALUES ('431181', '祁阳市', '4311');
INSERT INTO "public"."base_area" VALUES ('431202', '鹤城区', '4312');
INSERT INTO "public"."base_area" VALUES ('431221', '中方县', '4312');
INSERT INTO "public"."base_area" VALUES ('431222', '沅陵县', '4312');
INSERT INTO "public"."base_area" VALUES ('431223', '辰溪县', '4312');
INSERT INTO "public"."base_area" VALUES ('431224', '溆浦县', '4312');
INSERT INTO "public"."base_area" VALUES ('431225', '会同县', '4312');
INSERT INTO "public"."base_area" VALUES ('431226', '麻阳苗族自治县', '4312');
INSERT INTO "public"."base_area" VALUES ('431227', '新晃侗族自治县', '4312');
INSERT INTO "public"."base_area" VALUES ('431228', '芷江侗族自治县', '4312');
INSERT INTO "public"."base_area" VALUES ('431229', '靖州苗族侗族自治县', '4312');
INSERT INTO "public"."base_area" VALUES ('431230', '通道侗族自治县', '4312');
INSERT INTO "public"."base_area" VALUES ('431271', '怀化市洪江管理区', '4312');
INSERT INTO "public"."base_area" VALUES ('431281', '洪江市', '4312');
INSERT INTO "public"."base_area" VALUES ('431302', '娄星区', '4313');
INSERT INTO "public"."base_area" VALUES ('431321', '双峰县', '4313');
INSERT INTO "public"."base_area" VALUES ('431322', '新化县', '4313');
INSERT INTO "public"."base_area" VALUES ('431381', '冷水江市', '4313');
INSERT INTO "public"."base_area" VALUES ('431382', '涟源市', '4313');
INSERT INTO "public"."base_area" VALUES ('433101', '吉首市', '4331');
INSERT INTO "public"."base_area" VALUES ('433122', '泸溪县', '4331');
INSERT INTO "public"."base_area" VALUES ('433123', '凤凰县', '4331');
INSERT INTO "public"."base_area" VALUES ('433124', '花垣县', '4331');
INSERT INTO "public"."base_area" VALUES ('433125', '保靖县', '4331');
INSERT INTO "public"."base_area" VALUES ('433126', '古丈县', '4331');
INSERT INTO "public"."base_area" VALUES ('433127', '永顺县', '4331');
INSERT INTO "public"."base_area" VALUES ('433130', '龙山县', '4331');
INSERT INTO "public"."base_area" VALUES ('440103', '荔湾区', '4401');
INSERT INTO "public"."base_area" VALUES ('440104', '越秀区', '4401');
INSERT INTO "public"."base_area" VALUES ('440105', '海珠区', '4401');
INSERT INTO "public"."base_area" VALUES ('440106', '天河区', '4401');
INSERT INTO "public"."base_area" VALUES ('440111', '白云区', '4401');
INSERT INTO "public"."base_area" VALUES ('440112', '黄埔区', '4401');
INSERT INTO "public"."base_area" VALUES ('440113', '番禺区', '4401');
INSERT INTO "public"."base_area" VALUES ('440114', '花都区', '4401');
INSERT INTO "public"."base_area" VALUES ('440115', '南沙区', '4401');
INSERT INTO "public"."base_area" VALUES ('440117', '从化区', '4401');
INSERT INTO "public"."base_area" VALUES ('440118', '增城区', '4401');
INSERT INTO "public"."base_area" VALUES ('440203', '武江区', '4402');
INSERT INTO "public"."base_area" VALUES ('440204', '浈江区', '4402');
INSERT INTO "public"."base_area" VALUES ('440205', '曲江区', '4402');
INSERT INTO "public"."base_area" VALUES ('440222', '始兴县', '4402');
INSERT INTO "public"."base_area" VALUES ('440224', '仁化县', '4402');
INSERT INTO "public"."base_area" VALUES ('440229', '翁源县', '4402');
INSERT INTO "public"."base_area" VALUES ('440232', '乳源瑶族自治县', '4402');
INSERT INTO "public"."base_area" VALUES ('440233', '新丰县', '4402');
INSERT INTO "public"."base_area" VALUES ('440281', '乐昌市', '4402');
INSERT INTO "public"."base_area" VALUES ('440282', '南雄市', '4402');
INSERT INTO "public"."base_area" VALUES ('440303', '罗湖区', '4403');
INSERT INTO "public"."base_area" VALUES ('440304', '福田区', '4403');
INSERT INTO "public"."base_area" VALUES ('440305', '南山区', '4403');
INSERT INTO "public"."base_area" VALUES ('440306', '宝安区', '4403');
INSERT INTO "public"."base_area" VALUES ('440307', '龙岗区', '4403');
INSERT INTO "public"."base_area" VALUES ('440308', '盐田区', '4403');
INSERT INTO "public"."base_area" VALUES ('440309', '龙华区', '4403');
INSERT INTO "public"."base_area" VALUES ('440310', '坪山区', '4403');
INSERT INTO "public"."base_area" VALUES ('440311', '光明区', '4403');
INSERT INTO "public"."base_area" VALUES ('440402', '香洲区', '4404');
INSERT INTO "public"."base_area" VALUES ('440403', '斗门区', '4404');
INSERT INTO "public"."base_area" VALUES ('440404', '金湾区', '4404');
INSERT INTO "public"."base_area" VALUES ('440507', '龙湖区', '4405');
INSERT INTO "public"."base_area" VALUES ('440511', '金平区', '4405');
INSERT INTO "public"."base_area" VALUES ('440512', '濠江区', '4405');
INSERT INTO "public"."base_area" VALUES ('440513', '潮阳区', '4405');
INSERT INTO "public"."base_area" VALUES ('440514', '潮南区', '4405');
INSERT INTO "public"."base_area" VALUES ('440515', '澄海区', '4405');
INSERT INTO "public"."base_area" VALUES ('440523', '南澳县', '4405');
INSERT INTO "public"."base_area" VALUES ('440604', '禅城区', '4406');
INSERT INTO "public"."base_area" VALUES ('440605', '南海区', '4406');
INSERT INTO "public"."base_area" VALUES ('440606', '顺德区', '4406');
INSERT INTO "public"."base_area" VALUES ('440607', '三水区', '4406');
INSERT INTO "public"."base_area" VALUES ('440608', '高明区', '4406');
INSERT INTO "public"."base_area" VALUES ('440703', '蓬江区', '4407');
INSERT INTO "public"."base_area" VALUES ('440704', '江海区', '4407');
INSERT INTO "public"."base_area" VALUES ('440705', '新会区', '4407');
INSERT INTO "public"."base_area" VALUES ('440781', '台山市', '4407');
INSERT INTO "public"."base_area" VALUES ('440783', '开平市', '4407');
INSERT INTO "public"."base_area" VALUES ('440784', '鹤山市', '4407');
INSERT INTO "public"."base_area" VALUES ('440785', '恩平市', '4407');
INSERT INTO "public"."base_area" VALUES ('440802', '赤坎区', '4408');
INSERT INTO "public"."base_area" VALUES ('440803', '霞山区', '4408');
INSERT INTO "public"."base_area" VALUES ('440804', '坡头区', '4408');
INSERT INTO "public"."base_area" VALUES ('440811', '麻章区', '4408');
INSERT INTO "public"."base_area" VALUES ('440823', '遂溪县', '4408');
INSERT INTO "public"."base_area" VALUES ('440825', '徐闻县', '4408');
INSERT INTO "public"."base_area" VALUES ('440881', '廉江市', '4408');
INSERT INTO "public"."base_area" VALUES ('440882', '雷州市', '4408');
INSERT INTO "public"."base_area" VALUES ('440883', '吴川市', '4408');
INSERT INTO "public"."base_area" VALUES ('440902', '茂南区', '4409');
INSERT INTO "public"."base_area" VALUES ('440904', '电白区', '4409');
INSERT INTO "public"."base_area" VALUES ('440981', '高州市', '4409');
INSERT INTO "public"."base_area" VALUES ('440982', '化州市', '4409');
INSERT INTO "public"."base_area" VALUES ('440983', '信宜市', '4409');
INSERT INTO "public"."base_area" VALUES ('441202', '端州区', '4412');
INSERT INTO "public"."base_area" VALUES ('441203', '鼎湖区', '4412');
INSERT INTO "public"."base_area" VALUES ('441204', '高要区', '4412');
INSERT INTO "public"."base_area" VALUES ('441223', '广宁县', '4412');
INSERT INTO "public"."base_area" VALUES ('441224', '怀集县', '4412');
INSERT INTO "public"."base_area" VALUES ('441225', '封开县', '4412');
INSERT INTO "public"."base_area" VALUES ('441226', '德庆县', '4412');
INSERT INTO "public"."base_area" VALUES ('441284', '四会市', '4412');
INSERT INTO "public"."base_area" VALUES ('441302', '惠城区', '4413');
INSERT INTO "public"."base_area" VALUES ('441303', '惠阳区', '4413');
INSERT INTO "public"."base_area" VALUES ('441322', '博罗县', '4413');
INSERT INTO "public"."base_area" VALUES ('441323', '惠东县', '4413');
INSERT INTO "public"."base_area" VALUES ('441324', '龙门县', '4413');
INSERT INTO "public"."base_area" VALUES ('441402', '梅江区', '4414');
INSERT INTO "public"."base_area" VALUES ('441403', '梅县区', '4414');
INSERT INTO "public"."base_area" VALUES ('441422', '大埔县', '4414');
INSERT INTO "public"."base_area" VALUES ('441423', '丰顺县', '4414');
INSERT INTO "public"."base_area" VALUES ('441424', '五华县', '4414');
INSERT INTO "public"."base_area" VALUES ('441426', '平远县', '4414');
INSERT INTO "public"."base_area" VALUES ('441427', '蕉岭县', '4414');
INSERT INTO "public"."base_area" VALUES ('441481', '兴宁市', '4414');
INSERT INTO "public"."base_area" VALUES ('441502', '城区', '4415');
INSERT INTO "public"."base_area" VALUES ('441521', '海丰县', '4415');
INSERT INTO "public"."base_area" VALUES ('441523', '陆河县', '4415');
INSERT INTO "public"."base_area" VALUES ('441581', '陆丰市', '4415');
INSERT INTO "public"."base_area" VALUES ('441602', '源城区', '4416');
INSERT INTO "public"."base_area" VALUES ('441621', '紫金县', '4416');
INSERT INTO "public"."base_area" VALUES ('441622', '龙川县', '4416');
INSERT INTO "public"."base_area" VALUES ('441623', '连平县', '4416');
INSERT INTO "public"."base_area" VALUES ('441624', '和平县', '4416');
INSERT INTO "public"."base_area" VALUES ('441625', '东源县', '4416');
INSERT INTO "public"."base_area" VALUES ('441702', '江城区', '4417');
INSERT INTO "public"."base_area" VALUES ('441704', '阳东区', '4417');
INSERT INTO "public"."base_area" VALUES ('441721', '阳西县', '4417');
INSERT INTO "public"."base_area" VALUES ('441781', '阳春市', '4417');
INSERT INTO "public"."base_area" VALUES ('441802', '清城区', '4418');
INSERT INTO "public"."base_area" VALUES ('441803', '清新区', '4418');
INSERT INTO "public"."base_area" VALUES ('441821', '佛冈县', '4418');
INSERT INTO "public"."base_area" VALUES ('441823', '阳山县', '4418');
INSERT INTO "public"."base_area" VALUES ('441825', '连山壮族瑶族自治县', '4418');
INSERT INTO "public"."base_area" VALUES ('441826', '连南瑶族自治县', '4418');
INSERT INTO "public"."base_area" VALUES ('441881', '英德市', '4418');
INSERT INTO "public"."base_area" VALUES ('441882', '连州市', '4418');
INSERT INTO "public"."base_area" VALUES ('441900', '东莞市', '4419');
INSERT INTO "public"."base_area" VALUES ('442000', '中山市', '4420');
INSERT INTO "public"."base_area" VALUES ('445102', '湘桥区', '4451');
INSERT INTO "public"."base_area" VALUES ('445103', '潮安区', '4451');
INSERT INTO "public"."base_area" VALUES ('445122', '饶平县', '4451');
INSERT INTO "public"."base_area" VALUES ('445202', '榕城区', '4452');
INSERT INTO "public"."base_area" VALUES ('445203', '揭东区', '4452');
INSERT INTO "public"."base_area" VALUES ('445222', '揭西县', '4452');
INSERT INTO "public"."base_area" VALUES ('445224', '惠来县', '4452');
INSERT INTO "public"."base_area" VALUES ('445281', '普宁市', '4452');
INSERT INTO "public"."base_area" VALUES ('445302', '云城区', '4453');
INSERT INTO "public"."base_area" VALUES ('445303', '云安区', '4453');
INSERT INTO "public"."base_area" VALUES ('445321', '新兴县', '4453');
INSERT INTO "public"."base_area" VALUES ('445322', '郁南县', '4453');
INSERT INTO "public"."base_area" VALUES ('445381', '罗定市', '4453');
INSERT INTO "public"."base_area" VALUES ('450102', '兴宁区', '4501');
INSERT INTO "public"."base_area" VALUES ('450103', '青秀区', '4501');
INSERT INTO "public"."base_area" VALUES ('450105', '江南区', '4501');
INSERT INTO "public"."base_area" VALUES ('450107', '西乡塘区', '4501');
INSERT INTO "public"."base_area" VALUES ('450108', '良庆区', '4501');
INSERT INTO "public"."base_area" VALUES ('450109', '邕宁区', '4501');
INSERT INTO "public"."base_area" VALUES ('450110', '武鸣区', '4501');
INSERT INTO "public"."base_area" VALUES ('450123', '隆安县', '4501');
INSERT INTO "public"."base_area" VALUES ('450124', '马山县', '4501');
INSERT INTO "public"."base_area" VALUES ('450125', '上林县', '4501');
INSERT INTO "public"."base_area" VALUES ('450126', '宾阳县', '4501');
INSERT INTO "public"."base_area" VALUES ('450181', '横州市', '4501');
INSERT INTO "public"."base_area" VALUES ('450202', '城中区', '4502');
INSERT INTO "public"."base_area" VALUES ('450203', '鱼峰区', '4502');
INSERT INTO "public"."base_area" VALUES ('450204', '柳南区', '4502');
INSERT INTO "public"."base_area" VALUES ('450205', '柳北区', '4502');
INSERT INTO "public"."base_area" VALUES ('450206', '柳江区', '4502');
INSERT INTO "public"."base_area" VALUES ('450222', '柳城县', '4502');
INSERT INTO "public"."base_area" VALUES ('450223', '鹿寨县', '4502');
INSERT INTO "public"."base_area" VALUES ('450224', '融安县', '4502');
INSERT INTO "public"."base_area" VALUES ('450225', '融水苗族自治县', '4502');
INSERT INTO "public"."base_area" VALUES ('450226', '三江侗族自治县', '4502');
INSERT INTO "public"."base_area" VALUES ('450302', '秀峰区', '4503');
INSERT INTO "public"."base_area" VALUES ('450303', '叠彩区', '4503');
INSERT INTO "public"."base_area" VALUES ('450304', '象山区', '4503');
INSERT INTO "public"."base_area" VALUES ('450305', '七星区', '4503');
INSERT INTO "public"."base_area" VALUES ('450311', '雁山区', '4503');
INSERT INTO "public"."base_area" VALUES ('450312', '临桂区', '4503');
INSERT INTO "public"."base_area" VALUES ('450321', '阳朔县', '4503');
INSERT INTO "public"."base_area" VALUES ('450323', '灵川县', '4503');
INSERT INTO "public"."base_area" VALUES ('450324', '全州县', '4503');
INSERT INTO "public"."base_area" VALUES ('450325', '兴安县', '4503');
INSERT INTO "public"."base_area" VALUES ('450326', '永福县', '4503');
INSERT INTO "public"."base_area" VALUES ('450327', '灌阳县', '4503');
INSERT INTO "public"."base_area" VALUES ('450328', '龙胜各族自治县', '4503');
INSERT INTO "public"."base_area" VALUES ('450329', '资源县', '4503');
INSERT INTO "public"."base_area" VALUES ('450330', '平乐县', '4503');
INSERT INTO "public"."base_area" VALUES ('450332', '恭城瑶族自治县', '4503');
INSERT INTO "public"."base_area" VALUES ('450381', '荔浦市', '4503');
INSERT INTO "public"."base_area" VALUES ('450403', '万秀区', '4504');
INSERT INTO "public"."base_area" VALUES ('450405', '长洲区', '4504');
INSERT INTO "public"."base_area" VALUES ('450406', '龙圩区', '4504');
INSERT INTO "public"."base_area" VALUES ('450421', '苍梧县', '4504');
INSERT INTO "public"."base_area" VALUES ('450422', '藤县', '4504');
INSERT INTO "public"."base_area" VALUES ('450423', '蒙山县', '4504');
INSERT INTO "public"."base_area" VALUES ('450481', '岑溪市', '4504');
INSERT INTO "public"."base_area" VALUES ('450502', '海城区', '4505');
INSERT INTO "public"."base_area" VALUES ('450503', '银海区', '4505');
INSERT INTO "public"."base_area" VALUES ('450512', '铁山港区', '4505');
INSERT INTO "public"."base_area" VALUES ('450521', '合浦县', '4505');
INSERT INTO "public"."base_area" VALUES ('450602', '港口区', '4506');
INSERT INTO "public"."base_area" VALUES ('450603', '防城区', '4506');
INSERT INTO "public"."base_area" VALUES ('450621', '上思县', '4506');
INSERT INTO "public"."base_area" VALUES ('450681', '东兴市', '4506');
INSERT INTO "public"."base_area" VALUES ('450702', '钦南区', '4507');
INSERT INTO "public"."base_area" VALUES ('450703', '钦北区', '4507');
INSERT INTO "public"."base_area" VALUES ('450721', '灵山县', '4507');
INSERT INTO "public"."base_area" VALUES ('450722', '浦北县', '4507');
INSERT INTO "public"."base_area" VALUES ('450802', '港北区', '4508');
INSERT INTO "public"."base_area" VALUES ('450803', '港南区', '4508');
INSERT INTO "public"."base_area" VALUES ('450804', '覃塘区', '4508');
INSERT INTO "public"."base_area" VALUES ('450821', '平南县', '4508');
INSERT INTO "public"."base_area" VALUES ('450881', '桂平市', '4508');
INSERT INTO "public"."base_area" VALUES ('450902', '玉州区', '4509');
INSERT INTO "public"."base_area" VALUES ('450903', '福绵区', '4509');
INSERT INTO "public"."base_area" VALUES ('450921', '容县', '4509');
INSERT INTO "public"."base_area" VALUES ('450922', '陆川县', '4509');
INSERT INTO "public"."base_area" VALUES ('450923', '博白县', '4509');
INSERT INTO "public"."base_area" VALUES ('450924', '兴业县', '4509');
INSERT INTO "public"."base_area" VALUES ('450981', '北流市', '4509');
INSERT INTO "public"."base_area" VALUES ('451002', '右江区', '4510');
INSERT INTO "public"."base_area" VALUES ('451003', '田阳区', '4510');
INSERT INTO "public"."base_area" VALUES ('451022', '田东县', '4510');
INSERT INTO "public"."base_area" VALUES ('451024', '德保县', '4510');
INSERT INTO "public"."base_area" VALUES ('451026', '那坡县', '4510');
INSERT INTO "public"."base_area" VALUES ('451027', '凌云县', '4510');
INSERT INTO "public"."base_area" VALUES ('451028', '乐业县', '4510');
INSERT INTO "public"."base_area" VALUES ('451029', '田林县', '4510');
INSERT INTO "public"."base_area" VALUES ('451030', '西林县', '4510');
INSERT INTO "public"."base_area" VALUES ('451031', '隆林各族自治县', '4510');
INSERT INTO "public"."base_area" VALUES ('451081', '靖西市', '4510');
INSERT INTO "public"."base_area" VALUES ('451082', '平果市', '4510');
INSERT INTO "public"."base_area" VALUES ('451102', '八步区', '4511');
INSERT INTO "public"."base_area" VALUES ('451103', '平桂区', '4511');
INSERT INTO "public"."base_area" VALUES ('451121', '昭平县', '4511');
INSERT INTO "public"."base_area" VALUES ('451122', '钟山县', '4511');
INSERT INTO "public"."base_area" VALUES ('451123', '富川瑶族自治县', '4511');
INSERT INTO "public"."base_area" VALUES ('451202', '金城江区', '4512');
INSERT INTO "public"."base_area" VALUES ('451203', '宜州区', '4512');
INSERT INTO "public"."base_area" VALUES ('451221', '南丹县', '4512');
INSERT INTO "public"."base_area" VALUES ('451222', '天峨县', '4512');
INSERT INTO "public"."base_area" VALUES ('451223', '凤山县', '4512');
INSERT INTO "public"."base_area" VALUES ('451224', '东兰县', '4512');
INSERT INTO "public"."base_area" VALUES ('451225', '罗城仫佬族自治县', '4512');
INSERT INTO "public"."base_area" VALUES ('451226', '环江毛南族自治县', '4512');
INSERT INTO "public"."base_area" VALUES ('451227', '巴马瑶族自治县', '4512');
INSERT INTO "public"."base_area" VALUES ('451228', '都安瑶族自治县', '4512');
INSERT INTO "public"."base_area" VALUES ('451229', '大化瑶族自治县', '4512');
INSERT INTO "public"."base_area" VALUES ('451302', '兴宾区', '4513');
INSERT INTO "public"."base_area" VALUES ('451321', '忻城县', '4513');
INSERT INTO "public"."base_area" VALUES ('451322', '象州县', '4513');
INSERT INTO "public"."base_area" VALUES ('451323', '武宣县', '4513');
INSERT INTO "public"."base_area" VALUES ('451324', '金秀瑶族自治县', '4513');
INSERT INTO "public"."base_area" VALUES ('451381', '合山市', '4513');
INSERT INTO "public"."base_area" VALUES ('451402', '江州区', '4514');
INSERT INTO "public"."base_area" VALUES ('451421', '扶绥县', '4514');
INSERT INTO "public"."base_area" VALUES ('451422', '宁明县', '4514');
INSERT INTO "public"."base_area" VALUES ('451423', '龙州县', '4514');
INSERT INTO "public"."base_area" VALUES ('451424', '大新县', '4514');
INSERT INTO "public"."base_area" VALUES ('451425', '天等县', '4514');
INSERT INTO "public"."base_area" VALUES ('451481', '凭祥市', '4514');
INSERT INTO "public"."base_area" VALUES ('460105', '秀英区', '4601');
INSERT INTO "public"."base_area" VALUES ('460106', '龙华区', '4601');
INSERT INTO "public"."base_area" VALUES ('460107', '琼山区', '4601');
INSERT INTO "public"."base_area" VALUES ('460108', '美兰区', '4601');
INSERT INTO "public"."base_area" VALUES ('460202', '海棠区', '4602');
INSERT INTO "public"."base_area" VALUES ('460203', '吉阳区', '4602');
INSERT INTO "public"."base_area" VALUES ('460204', '天涯区', '4602');
INSERT INTO "public"."base_area" VALUES ('460205', '崖州区', '4602');
INSERT INTO "public"."base_area" VALUES ('460321', '西沙群岛', '4603');
INSERT INTO "public"."base_area" VALUES ('460322', '南沙群岛', '4603');
INSERT INTO "public"."base_area" VALUES ('460323', '中沙群岛的岛礁及其海域', '4603');
INSERT INTO "public"."base_area" VALUES ('460400', '儋州市', '4604');
INSERT INTO "public"."base_area" VALUES ('469001', '五指山市', '4690');
INSERT INTO "public"."base_area" VALUES ('469002', '琼海市', '4690');
INSERT INTO "public"."base_area" VALUES ('469005', '文昌市', '4690');
INSERT INTO "public"."base_area" VALUES ('469006', '万宁市', '4690');
INSERT INTO "public"."base_area" VALUES ('469007', '东方市', '4690');
INSERT INTO "public"."base_area" VALUES ('469021', '定安县', '4690');
INSERT INTO "public"."base_area" VALUES ('469022', '屯昌县', '4690');
INSERT INTO "public"."base_area" VALUES ('469023', '澄迈县', '4690');
INSERT INTO "public"."base_area" VALUES ('469024', '临高县', '4690');
INSERT INTO "public"."base_area" VALUES ('469025', '白沙黎族自治县', '4690');
INSERT INTO "public"."base_area" VALUES ('469026', '昌江黎族自治县', '4690');
INSERT INTO "public"."base_area" VALUES ('469027', '乐东黎族自治县', '4690');
INSERT INTO "public"."base_area" VALUES ('469028', '陵水黎族自治县', '4690');
INSERT INTO "public"."base_area" VALUES ('469029', '保亭黎族苗族自治县', '4690');
INSERT INTO "public"."base_area" VALUES ('469030', '琼中黎族苗族自治县', '4690');
INSERT INTO "public"."base_area" VALUES ('500101', '万州区', '5001');
INSERT INTO "public"."base_area" VALUES ('500102', '涪陵区', '5001');
INSERT INTO "public"."base_area" VALUES ('500103', '渝中区', '5001');
INSERT INTO "public"."base_area" VALUES ('500104', '大渡口区', '5001');
INSERT INTO "public"."base_area" VALUES ('500105', '江北区', '5001');
INSERT INTO "public"."base_area" VALUES ('500106', '沙坪坝区', '5001');
INSERT INTO "public"."base_area" VALUES ('500107', '九龙坡区', '5001');
INSERT INTO "public"."base_area" VALUES ('500108', '南岸区', '5001');
INSERT INTO "public"."base_area" VALUES ('500109', '北碚区', '5001');
INSERT INTO "public"."base_area" VALUES ('500110', '綦江区', '5001');
INSERT INTO "public"."base_area" VALUES ('500111', '大足区', '5001');
INSERT INTO "public"."base_area" VALUES ('500112', '渝北区', '5001');
INSERT INTO "public"."base_area" VALUES ('500113', '巴南区', '5001');
INSERT INTO "public"."base_area" VALUES ('500114', '黔江区', '5001');
INSERT INTO "public"."base_area" VALUES ('500115', '长寿区', '5001');
INSERT INTO "public"."base_area" VALUES ('500116', '江津区', '5001');
INSERT INTO "public"."base_area" VALUES ('500117', '合川区', '5001');
INSERT INTO "public"."base_area" VALUES ('500118', '永川区', '5001');
INSERT INTO "public"."base_area" VALUES ('500119', '南川区', '5001');
INSERT INTO "public"."base_area" VALUES ('500120', '璧山区', '5001');
INSERT INTO "public"."base_area" VALUES ('500151', '铜梁区', '5001');
INSERT INTO "public"."base_area" VALUES ('500152', '潼南区', '5001');
INSERT INTO "public"."base_area" VALUES ('500153', '荣昌区', '5001');
INSERT INTO "public"."base_area" VALUES ('500154', '开州区', '5001');
INSERT INTO "public"."base_area" VALUES ('500155', '梁平区', '5001');
INSERT INTO "public"."base_area" VALUES ('500156', '武隆区', '5001');
INSERT INTO "public"."base_area" VALUES ('500229', '城口县', '5002');
INSERT INTO "public"."base_area" VALUES ('500230', '丰都县', '5002');
INSERT INTO "public"."base_area" VALUES ('500231', '垫江县', '5002');
INSERT INTO "public"."base_area" VALUES ('500233', '忠县', '5002');
INSERT INTO "public"."base_area" VALUES ('500235', '云阳县', '5002');
INSERT INTO "public"."base_area" VALUES ('500236', '奉节县', '5002');
INSERT INTO "public"."base_area" VALUES ('500237', '巫山县', '5002');
INSERT INTO "public"."base_area" VALUES ('500238', '巫溪县', '5002');
INSERT INTO "public"."base_area" VALUES ('500240', '石柱土家族自治县', '5002');
INSERT INTO "public"."base_area" VALUES ('500241', '秀山土家族苗族自治县', '5002');
INSERT INTO "public"."base_area" VALUES ('500242', '酉阳土家族苗族自治县', '5002');
INSERT INTO "public"."base_area" VALUES ('500243', '彭水苗族土家族自治县', '5002');
INSERT INTO "public"."base_area" VALUES ('510104', '锦江区', '5101');
INSERT INTO "public"."base_area" VALUES ('510105', '青羊区', '5101');
INSERT INTO "public"."base_area" VALUES ('510106', '金牛区', '5101');
INSERT INTO "public"."base_area" VALUES ('510107', '武侯区', '5101');
INSERT INTO "public"."base_area" VALUES ('510108', '成华区', '5101');
INSERT INTO "public"."base_area" VALUES ('510112', '龙泉驿区', '5101');
INSERT INTO "public"."base_area" VALUES ('510113', '青白江区', '5101');
INSERT INTO "public"."base_area" VALUES ('510114', '新都区', '5101');
INSERT INTO "public"."base_area" VALUES ('510115', '温江区', '5101');
INSERT INTO "public"."base_area" VALUES ('510116', '双流区', '5101');
INSERT INTO "public"."base_area" VALUES ('510117', '郫都区', '5101');
INSERT INTO "public"."base_area" VALUES ('510118', '新津区', '5101');
INSERT INTO "public"."base_area" VALUES ('510121', '金堂县', '5101');
INSERT INTO "public"."base_area" VALUES ('510129', '大邑县', '5101');
INSERT INTO "public"."base_area" VALUES ('510131', '蒲江县', '5101');
INSERT INTO "public"."base_area" VALUES ('510181', '都江堰市', '5101');
INSERT INTO "public"."base_area" VALUES ('510182', '彭州市', '5101');
INSERT INTO "public"."base_area" VALUES ('510183', '邛崃市', '5101');
INSERT INTO "public"."base_area" VALUES ('510184', '崇州市', '5101');
INSERT INTO "public"."base_area" VALUES ('510185', '简阳市', '5101');
INSERT INTO "public"."base_area" VALUES ('510302', '自流井区', '5103');
INSERT INTO "public"."base_area" VALUES ('510303', '贡井区', '5103');
INSERT INTO "public"."base_area" VALUES ('510304', '大安区', '5103');
INSERT INTO "public"."base_area" VALUES ('510311', '沿滩区', '5103');
INSERT INTO "public"."base_area" VALUES ('510321', '荣县', '5103');
INSERT INTO "public"."base_area" VALUES ('510322', '富顺县', '5103');
INSERT INTO "public"."base_area" VALUES ('510402', '东区', '5104');
INSERT INTO "public"."base_area" VALUES ('510403', '西区', '5104');
INSERT INTO "public"."base_area" VALUES ('510411', '仁和区', '5104');
INSERT INTO "public"."base_area" VALUES ('510421', '米易县', '5104');
INSERT INTO "public"."base_area" VALUES ('510422', '盐边县', '5104');
INSERT INTO "public"."base_area" VALUES ('510502', '江阳区', '5105');
INSERT INTO "public"."base_area" VALUES ('510503', '纳溪区', '5105');
INSERT INTO "public"."base_area" VALUES ('510504', '龙马潭区', '5105');
INSERT INTO "public"."base_area" VALUES ('510521', '泸县', '5105');
INSERT INTO "public"."base_area" VALUES ('510522', '合江县', '5105');
INSERT INTO "public"."base_area" VALUES ('510524', '叙永县', '5105');
INSERT INTO "public"."base_area" VALUES ('510525', '古蔺县', '5105');
INSERT INTO "public"."base_area" VALUES ('510603', '旌阳区', '5106');
INSERT INTO "public"."base_area" VALUES ('510604', '罗江区', '5106');
INSERT INTO "public"."base_area" VALUES ('510623', '中江县', '5106');
INSERT INTO "public"."base_area" VALUES ('510681', '广汉市', '5106');
INSERT INTO "public"."base_area" VALUES ('510682', '什邡市', '5106');
INSERT INTO "public"."base_area" VALUES ('510683', '绵竹市', '5106');
INSERT INTO "public"."base_area" VALUES ('510703', '涪城区', '5107');
INSERT INTO "public"."base_area" VALUES ('510704', '游仙区', '5107');
INSERT INTO "public"."base_area" VALUES ('510705', '安州区', '5107');
INSERT INTO "public"."base_area" VALUES ('510722', '三台县', '5107');
INSERT INTO "public"."base_area" VALUES ('510723', '盐亭县', '5107');
INSERT INTO "public"."base_area" VALUES ('510725', '梓潼县', '5107');
INSERT INTO "public"."base_area" VALUES ('510726', '北川羌族自治县', '5107');
INSERT INTO "public"."base_area" VALUES ('510727', '平武县', '5107');
INSERT INTO "public"."base_area" VALUES ('510781', '江油市', '5107');
INSERT INTO "public"."base_area" VALUES ('510802', '利州区', '5108');
INSERT INTO "public"."base_area" VALUES ('510811', '昭化区', '5108');
INSERT INTO "public"."base_area" VALUES ('510812', '朝天区', '5108');
INSERT INTO "public"."base_area" VALUES ('510821', '旺苍县', '5108');
INSERT INTO "public"."base_area" VALUES ('510822', '青川县', '5108');
INSERT INTO "public"."base_area" VALUES ('510823', '剑阁县', '5108');
INSERT INTO "public"."base_area" VALUES ('510824', '苍溪县', '5108');
INSERT INTO "public"."base_area" VALUES ('510903', '船山区', '5109');
INSERT INTO "public"."base_area" VALUES ('510904', '安居区', '5109');
INSERT INTO "public"."base_area" VALUES ('510921', '蓬溪县', '5109');
INSERT INTO "public"."base_area" VALUES ('510923', '大英县', '5109');
INSERT INTO "public"."base_area" VALUES ('510981', '射洪市', '5109');
INSERT INTO "public"."base_area" VALUES ('511002', '市中区', '5110');
INSERT INTO "public"."base_area" VALUES ('511011', '东兴区', '5110');
INSERT INTO "public"."base_area" VALUES ('511024', '威远县', '5110');
INSERT INTO "public"."base_area" VALUES ('511025', '资中县', '5110');
INSERT INTO "public"."base_area" VALUES ('511083', '隆昌市', '5110');
INSERT INTO "public"."base_area" VALUES ('511102', '市中区', '5111');
INSERT INTO "public"."base_area" VALUES ('511111', '沙湾区', '5111');
INSERT INTO "public"."base_area" VALUES ('511112', '五通桥区', '5111');
INSERT INTO "public"."base_area" VALUES ('511113', '金口河区', '5111');
INSERT INTO "public"."base_area" VALUES ('511123', '犍为县', '5111');
INSERT INTO "public"."base_area" VALUES ('511124', '井研县', '5111');
INSERT INTO "public"."base_area" VALUES ('511126', '夹江县', '5111');
INSERT INTO "public"."base_area" VALUES ('511129', '沐川县', '5111');
INSERT INTO "public"."base_area" VALUES ('511132', '峨边彝族自治县', '5111');
INSERT INTO "public"."base_area" VALUES ('511133', '马边彝族自治县', '5111');
INSERT INTO "public"."base_area" VALUES ('511181', '峨眉山市', '5111');
INSERT INTO "public"."base_area" VALUES ('511302', '顺庆区', '5113');
INSERT INTO "public"."base_area" VALUES ('511303', '高坪区', '5113');
INSERT INTO "public"."base_area" VALUES ('511304', '嘉陵区', '5113');
INSERT INTO "public"."base_area" VALUES ('511321', '南部县', '5113');
INSERT INTO "public"."base_area" VALUES ('511322', '营山县', '5113');
INSERT INTO "public"."base_area" VALUES ('511323', '蓬安县', '5113');
INSERT INTO "public"."base_area" VALUES ('511324', '仪陇县', '5113');
INSERT INTO "public"."base_area" VALUES ('511325', '西充县', '5113');
INSERT INTO "public"."base_area" VALUES ('511381', '阆中市', '5113');
INSERT INTO "public"."base_area" VALUES ('511402', '东坡区', '5114');
INSERT INTO "public"."base_area" VALUES ('511403', '彭山区', '5114');
INSERT INTO "public"."base_area" VALUES ('511421', '仁寿县', '5114');
INSERT INTO "public"."base_area" VALUES ('511423', '洪雅县', '5114');
INSERT INTO "public"."base_area" VALUES ('511424', '丹棱县', '5114');
INSERT INTO "public"."base_area" VALUES ('511425', '青神县', '5114');
INSERT INTO "public"."base_area" VALUES ('511502', '翠屏区', '5115');
INSERT INTO "public"."base_area" VALUES ('511503', '南溪区', '5115');
INSERT INTO "public"."base_area" VALUES ('511504', '叙州区', '5115');
INSERT INTO "public"."base_area" VALUES ('511523', '江安县', '5115');
INSERT INTO "public"."base_area" VALUES ('511524', '长宁县', '5115');
INSERT INTO "public"."base_area" VALUES ('511525', '高县', '5115');
INSERT INTO "public"."base_area" VALUES ('511526', '珙县', '5115');
INSERT INTO "public"."base_area" VALUES ('511527', '筠连县', '5115');
INSERT INTO "public"."base_area" VALUES ('511528', '兴文县', '5115');
INSERT INTO "public"."base_area" VALUES ('511529', '屏山县', '5115');
INSERT INTO "public"."base_area" VALUES ('511602', '广安区', '5116');
INSERT INTO "public"."base_area" VALUES ('511603', '前锋区', '5116');
INSERT INTO "public"."base_area" VALUES ('511621', '岳池县', '5116');
INSERT INTO "public"."base_area" VALUES ('511622', '武胜县', '5116');
INSERT INTO "public"."base_area" VALUES ('511623', '邻水县', '5116');
INSERT INTO "public"."base_area" VALUES ('511681', '华蓥市', '5116');
INSERT INTO "public"."base_area" VALUES ('511702', '通川区', '5117');
INSERT INTO "public"."base_area" VALUES ('511703', '达川区', '5117');
INSERT INTO "public"."base_area" VALUES ('511722', '宣汉县', '5117');
INSERT INTO "public"."base_area" VALUES ('511723', '开江县', '5117');
INSERT INTO "public"."base_area" VALUES ('511724', '大竹县', '5117');
INSERT INTO "public"."base_area" VALUES ('511725', '渠县', '5117');
INSERT INTO "public"."base_area" VALUES ('511781', '万源市', '5117');
INSERT INTO "public"."base_area" VALUES ('511802', '雨城区', '5118');
INSERT INTO "public"."base_area" VALUES ('511803', '名山区', '5118');
INSERT INTO "public"."base_area" VALUES ('511822', '荥经县', '5118');
INSERT INTO "public"."base_area" VALUES ('511823', '汉源县', '5118');
INSERT INTO "public"."base_area" VALUES ('511824', '石棉县', '5118');
INSERT INTO "public"."base_area" VALUES ('511825', '天全县', '5118');
INSERT INTO "public"."base_area" VALUES ('511826', '芦山县', '5118');
INSERT INTO "public"."base_area" VALUES ('511827', '宝兴县', '5118');
INSERT INTO "public"."base_area" VALUES ('511902', '巴州区', '5119');
INSERT INTO "public"."base_area" VALUES ('511903', '恩阳区', '5119');
INSERT INTO "public"."base_area" VALUES ('511921', '通江县', '5119');
INSERT INTO "public"."base_area" VALUES ('511922', '南江县', '5119');
INSERT INTO "public"."base_area" VALUES ('511923', '平昌县', '5119');
INSERT INTO "public"."base_area" VALUES ('512002', '雁江区', '5120');
INSERT INTO "public"."base_area" VALUES ('512021', '安岳县', '5120');
INSERT INTO "public"."base_area" VALUES ('512022', '乐至县', '5120');
INSERT INTO "public"."base_area" VALUES ('513201', '马尔康市', '5132');
INSERT INTO "public"."base_area" VALUES ('513221', '汶川县', '5132');
INSERT INTO "public"."base_area" VALUES ('513222', '理县', '5132');
INSERT INTO "public"."base_area" VALUES ('513223', '茂县', '5132');
INSERT INTO "public"."base_area" VALUES ('513224', '松潘县', '5132');
INSERT INTO "public"."base_area" VALUES ('513225', '九寨沟县', '5132');
INSERT INTO "public"."base_area" VALUES ('513226', '金川县', '5132');
INSERT INTO "public"."base_area" VALUES ('513227', '小金县', '5132');
INSERT INTO "public"."base_area" VALUES ('513228', '黑水县', '5132');
INSERT INTO "public"."base_area" VALUES ('513230', '壤塘县', '5132');
INSERT INTO "public"."base_area" VALUES ('513231', '阿坝县', '5132');
INSERT INTO "public"."base_area" VALUES ('513232', '若尔盖县', '5132');
INSERT INTO "public"."base_area" VALUES ('513233', '红原县', '5132');
INSERT INTO "public"."base_area" VALUES ('513301', '康定市', '5133');
INSERT INTO "public"."base_area" VALUES ('513322', '泸定县', '5133');
INSERT INTO "public"."base_area" VALUES ('513323', '丹巴县', '5133');
INSERT INTO "public"."base_area" VALUES ('513324', '九龙县', '5133');
INSERT INTO "public"."base_area" VALUES ('513325', '雅江县', '5133');
INSERT INTO "public"."base_area" VALUES ('513326', '道孚县', '5133');
INSERT INTO "public"."base_area" VALUES ('513327', '炉霍县', '5133');
INSERT INTO "public"."base_area" VALUES ('513328', '甘孜县', '5133');
INSERT INTO "public"."base_area" VALUES ('513329', '新龙县', '5133');
INSERT INTO "public"."base_area" VALUES ('513330', '德格县', '5133');
INSERT INTO "public"."base_area" VALUES ('513331', '白玉县', '5133');
INSERT INTO "public"."base_area" VALUES ('513332', '石渠县', '5133');
INSERT INTO "public"."base_area" VALUES ('513333', '色达县', '5133');
INSERT INTO "public"."base_area" VALUES ('513334', '理塘县', '5133');
INSERT INTO "public"."base_area" VALUES ('513335', '巴塘县', '5133');
INSERT INTO "public"."base_area" VALUES ('513336', '乡城县', '5133');
INSERT INTO "public"."base_area" VALUES ('513337', '稻城县', '5133');
INSERT INTO "public"."base_area" VALUES ('513338', '得荣县', '5133');
INSERT INTO "public"."base_area" VALUES ('513401', '西昌市', '5134');
INSERT INTO "public"."base_area" VALUES ('513402', '会理市', '5134');
INSERT INTO "public"."base_area" VALUES ('513422', '木里藏族自治县', '5134');
INSERT INTO "public"."base_area" VALUES ('513423', '盐源县', '5134');
INSERT INTO "public"."base_area" VALUES ('513424', '德昌县', '5134');
INSERT INTO "public"."base_area" VALUES ('513426', '会东县', '5134');
INSERT INTO "public"."base_area" VALUES ('513427', '宁南县', '5134');
INSERT INTO "public"."base_area" VALUES ('513428', '普格县', '5134');
INSERT INTO "public"."base_area" VALUES ('513429', '布拖县', '5134');
INSERT INTO "public"."base_area" VALUES ('513430', '金阳县', '5134');
INSERT INTO "public"."base_area" VALUES ('513431', '昭觉县', '5134');
INSERT INTO "public"."base_area" VALUES ('513432', '喜德县', '5134');
INSERT INTO "public"."base_area" VALUES ('513433', '冕宁县', '5134');
INSERT INTO "public"."base_area" VALUES ('513434', '越西县', '5134');
INSERT INTO "public"."base_area" VALUES ('513435', '甘洛县', '5134');
INSERT INTO "public"."base_area" VALUES ('513436', '美姑县', '5134');
INSERT INTO "public"."base_area" VALUES ('513437', '雷波县', '5134');
INSERT INTO "public"."base_area" VALUES ('520102', '南明区', '5201');
INSERT INTO "public"."base_area" VALUES ('520103', '云岩区', '5201');
INSERT INTO "public"."base_area" VALUES ('520111', '花溪区', '5201');
INSERT INTO "public"."base_area" VALUES ('520112', '乌当区', '5201');
INSERT INTO "public"."base_area" VALUES ('520113', '白云区', '5201');
INSERT INTO "public"."base_area" VALUES ('520115', '观山湖区', '5201');
INSERT INTO "public"."base_area" VALUES ('520121', '开阳县', '5201');
INSERT INTO "public"."base_area" VALUES ('520122', '息烽县', '5201');
INSERT INTO "public"."base_area" VALUES ('520123', '修文县', '5201');
INSERT INTO "public"."base_area" VALUES ('520181', '清镇市', '5201');
INSERT INTO "public"."base_area" VALUES ('520201', '钟山区', '5202');
INSERT INTO "public"."base_area" VALUES ('520203', '六枝特区', '5202');
INSERT INTO "public"."base_area" VALUES ('520204', '水城区', '5202');
INSERT INTO "public"."base_area" VALUES ('520281', '盘州市', '5202');
INSERT INTO "public"."base_area" VALUES ('520302', '红花岗区', '5203');
INSERT INTO "public"."base_area" VALUES ('520303', '汇川区', '5203');
INSERT INTO "public"."base_area" VALUES ('520304', '播州区', '5203');
INSERT INTO "public"."base_area" VALUES ('520322', '桐梓县', '5203');
INSERT INTO "public"."base_area" VALUES ('520323', '绥阳县', '5203');
INSERT INTO "public"."base_area" VALUES ('520324', '正安县', '5203');
INSERT INTO "public"."base_area" VALUES ('520325', '道真仡佬族苗族自治县', '5203');
INSERT INTO "public"."base_area" VALUES ('520326', '务川仡佬族苗族自治县', '5203');
INSERT INTO "public"."base_area" VALUES ('520327', '凤冈县', '5203');
INSERT INTO "public"."base_area" VALUES ('520328', '湄潭县', '5203');
INSERT INTO "public"."base_area" VALUES ('520329', '余庆县', '5203');
INSERT INTO "public"."base_area" VALUES ('520330', '习水县', '5203');
INSERT INTO "public"."base_area" VALUES ('520381', '赤水市', '5203');
INSERT INTO "public"."base_area" VALUES ('520382', '仁怀市', '5203');
INSERT INTO "public"."base_area" VALUES ('520402', '西秀区', '5204');
INSERT INTO "public"."base_area" VALUES ('520403', '平坝区', '5204');
INSERT INTO "public"."base_area" VALUES ('520422', '普定县', '5204');
INSERT INTO "public"."base_area" VALUES ('520423', '镇宁布依族苗族自治县', '5204');
INSERT INTO "public"."base_area" VALUES ('520424', '关岭布依族苗族自治县', '5204');
INSERT INTO "public"."base_area" VALUES ('520425', '紫云苗族布依族自治县', '5204');
INSERT INTO "public"."base_area" VALUES ('520502', '七星关区', '5205');
INSERT INTO "public"."base_area" VALUES ('520521', '大方县', '5205');
INSERT INTO "public"."base_area" VALUES ('520523', '金沙县', '5205');
INSERT INTO "public"."base_area" VALUES ('520524', '织金县', '5205');
INSERT INTO "public"."base_area" VALUES ('520525', '纳雍县', '5205');
INSERT INTO "public"."base_area" VALUES ('520526', '威宁彝族回族苗族自治县', '5205');
INSERT INTO "public"."base_area" VALUES ('520527', '赫章县', '5205');
INSERT INTO "public"."base_area" VALUES ('520581', '黔西市', '5205');
INSERT INTO "public"."base_area" VALUES ('520602', '碧江区', '5206');
INSERT INTO "public"."base_area" VALUES ('520603', '万山区', '5206');
INSERT INTO "public"."base_area" VALUES ('520621', '江口县', '5206');
INSERT INTO "public"."base_area" VALUES ('520622', '玉屏侗族自治县', '5206');
INSERT INTO "public"."base_area" VALUES ('520623', '石阡县', '5206');
INSERT INTO "public"."base_area" VALUES ('520624', '思南县', '5206');
INSERT INTO "public"."base_area" VALUES ('520625', '印江土家族苗族自治县', '5206');
INSERT INTO "public"."base_area" VALUES ('520626', '德江县', '5206');
INSERT INTO "public"."base_area" VALUES ('520627', '沿河土家族自治县', '5206');
INSERT INTO "public"."base_area" VALUES ('520628', '松桃苗族自治县', '5206');
INSERT INTO "public"."base_area" VALUES ('522301', '兴义市', '5223');
INSERT INTO "public"."base_area" VALUES ('522302', '兴仁市', '5223');
INSERT INTO "public"."base_area" VALUES ('522323', '普安县', '5223');
INSERT INTO "public"."base_area" VALUES ('522324', '晴隆县', '5223');
INSERT INTO "public"."base_area" VALUES ('522325', '贞丰县', '5223');
INSERT INTO "public"."base_area" VALUES ('522326', '望谟县', '5223');
INSERT INTO "public"."base_area" VALUES ('522327', '册亨县', '5223');
INSERT INTO "public"."base_area" VALUES ('522328', '安龙县', '5223');
INSERT INTO "public"."base_area" VALUES ('522601', '凯里市', '5226');
INSERT INTO "public"."base_area" VALUES ('522622', '黄平县', '5226');
INSERT INTO "public"."base_area" VALUES ('522623', '施秉县', '5226');
INSERT INTO "public"."base_area" VALUES ('522624', '三穗县', '5226');
INSERT INTO "public"."base_area" VALUES ('522625', '镇远县', '5226');
INSERT INTO "public"."base_area" VALUES ('522626', '岑巩县', '5226');
INSERT INTO "public"."base_area" VALUES ('522627', '天柱县', '5226');
INSERT INTO "public"."base_area" VALUES ('522628', '锦屏县', '5226');
INSERT INTO "public"."base_area" VALUES ('522629', '剑河县', '5226');
INSERT INTO "public"."base_area" VALUES ('522630', '台江县', '5226');
INSERT INTO "public"."base_area" VALUES ('522631', '黎平县', '5226');
INSERT INTO "public"."base_area" VALUES ('522632', '榕江县', '5226');
INSERT INTO "public"."base_area" VALUES ('522633', '从江县', '5226');
INSERT INTO "public"."base_area" VALUES ('522634', '雷山县', '5226');
INSERT INTO "public"."base_area" VALUES ('522635', '麻江县', '5226');
INSERT INTO "public"."base_area" VALUES ('522636', '丹寨县', '5226');
INSERT INTO "public"."base_area" VALUES ('522701', '都匀市', '5227');
INSERT INTO "public"."base_area" VALUES ('522702', '福泉市', '5227');
INSERT INTO "public"."base_area" VALUES ('522722', '荔波县', '5227');
INSERT INTO "public"."base_area" VALUES ('522723', '贵定县', '5227');
INSERT INTO "public"."base_area" VALUES ('522725', '瓮安县', '5227');
INSERT INTO "public"."base_area" VALUES ('522726', '独山县', '5227');
INSERT INTO "public"."base_area" VALUES ('522727', '平塘县', '5227');
INSERT INTO "public"."base_area" VALUES ('522728', '罗甸县', '5227');
INSERT INTO "public"."base_area" VALUES ('522729', '长顺县', '5227');
INSERT INTO "public"."base_area" VALUES ('522730', '龙里县', '5227');
INSERT INTO "public"."base_area" VALUES ('522731', '惠水县', '5227');
INSERT INTO "public"."base_area" VALUES ('522732', '三都水族自治县', '5227');
INSERT INTO "public"."base_area" VALUES ('530102', '五华区', '5301');
INSERT INTO "public"."base_area" VALUES ('530103', '盘龙区', '5301');
INSERT INTO "public"."base_area" VALUES ('530111', '官渡区', '5301');
INSERT INTO "public"."base_area" VALUES ('530112', '西山区', '5301');
INSERT INTO "public"."base_area" VALUES ('530113', '东川区', '5301');
INSERT INTO "public"."base_area" VALUES ('530114', '呈贡区', '5301');
INSERT INTO "public"."base_area" VALUES ('530115', '晋宁区', '5301');
INSERT INTO "public"."base_area" VALUES ('530124', '富民县', '5301');
INSERT INTO "public"."base_area" VALUES ('530125', '宜良县', '5301');
INSERT INTO "public"."base_area" VALUES ('530126', '石林彝族自治县', '5301');
INSERT INTO "public"."base_area" VALUES ('530127', '嵩明县', '5301');
INSERT INTO "public"."base_area" VALUES ('530128', '禄劝彝族苗族自治县', '5301');
INSERT INTO "public"."base_area" VALUES ('530129', '寻甸回族彝族自治县', '5301');
INSERT INTO "public"."base_area" VALUES ('530181', '安宁市', '5301');
INSERT INTO "public"."base_area" VALUES ('530302', '麒麟区', '5303');
INSERT INTO "public"."base_area" VALUES ('530303', '沾益区', '5303');
INSERT INTO "public"."base_area" VALUES ('530304', '马龙区', '5303');
INSERT INTO "public"."base_area" VALUES ('530322', '陆良县', '5303');
INSERT INTO "public"."base_area" VALUES ('530323', '师宗县', '5303');
INSERT INTO "public"."base_area" VALUES ('530324', '罗平县', '5303');
INSERT INTO "public"."base_area" VALUES ('530325', '富源县', '5303');
INSERT INTO "public"."base_area" VALUES ('530326', '会泽县', '5303');
INSERT INTO "public"."base_area" VALUES ('530381', '宣威市', '5303');
INSERT INTO "public"."base_area" VALUES ('530402', '红塔区', '5304');
INSERT INTO "public"."base_area" VALUES ('530403', '江川区', '5304');
INSERT INTO "public"."base_area" VALUES ('530423', '通海县', '5304');
INSERT INTO "public"."base_area" VALUES ('530424', '华宁县', '5304');
INSERT INTO "public"."base_area" VALUES ('530425', '易门县', '5304');
INSERT INTO "public"."base_area" VALUES ('530426', '峨山彝族自治县', '5304');
INSERT INTO "public"."base_area" VALUES ('530427', '新平彝族傣族自治县', '5304');
INSERT INTO "public"."base_area" VALUES ('530428', '元江哈尼族彝族傣族自治县', '5304');
INSERT INTO "public"."base_area" VALUES ('530481', '澄江市', '5304');
INSERT INTO "public"."base_area" VALUES ('530502', '隆阳区', '5305');
INSERT INTO "public"."base_area" VALUES ('530521', '施甸县', '5305');
INSERT INTO "public"."base_area" VALUES ('530523', '龙陵县', '5305');
INSERT INTO "public"."base_area" VALUES ('530524', '昌宁县', '5305');
INSERT INTO "public"."base_area" VALUES ('530581', '腾冲市', '5305');
INSERT INTO "public"."base_area" VALUES ('530602', '昭阳区', '5306');
INSERT INTO "public"."base_area" VALUES ('530621', '鲁甸县', '5306');
INSERT INTO "public"."base_area" VALUES ('530622', '巧家县', '5306');
INSERT INTO "public"."base_area" VALUES ('530623', '盐津县', '5306');
INSERT INTO "public"."base_area" VALUES ('530624', '大关县', '5306');
INSERT INTO "public"."base_area" VALUES ('530625', '永善县', '5306');
INSERT INTO "public"."base_area" VALUES ('530626', '绥江县', '5306');
INSERT INTO "public"."base_area" VALUES ('530627', '镇雄县', '5306');
INSERT INTO "public"."base_area" VALUES ('530628', '彝良县', '5306');
INSERT INTO "public"."base_area" VALUES ('530629', '威信县', '5306');
INSERT INTO "public"."base_area" VALUES ('530681', '水富市', '5306');
INSERT INTO "public"."base_area" VALUES ('530702', '古城区', '5307');
INSERT INTO "public"."base_area" VALUES ('530721', '玉龙纳西族自治县', '5307');
INSERT INTO "public"."base_area" VALUES ('530722', '永胜县', '5307');
INSERT INTO "public"."base_area" VALUES ('530723', '华坪县', '5307');
INSERT INTO "public"."base_area" VALUES ('530724', '宁蒗彝族自治县', '5307');
INSERT INTO "public"."base_area" VALUES ('530802', '思茅区', '5308');
INSERT INTO "public"."base_area" VALUES ('530821', '宁洱哈尼族彝族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530822', '墨江哈尼族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530823', '景东彝族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530824', '景谷傣族彝族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530826', '江城哈尼族彝族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530827', '孟连傣族拉祜族佤族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530828', '澜沧拉祜族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530829', '西盟佤族自治县', '5308');
INSERT INTO "public"."base_area" VALUES ('530902', '临翔区', '5309');
INSERT INTO "public"."base_area" VALUES ('530921', '凤庆县', '5309');
INSERT INTO "public"."base_area" VALUES ('530922', '云县', '5309');
INSERT INTO "public"."base_area" VALUES ('530923', '永德县', '5309');
INSERT INTO "public"."base_area" VALUES ('530924', '镇康县', '5309');
INSERT INTO "public"."base_area" VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '5309');
INSERT INTO "public"."base_area" VALUES ('530926', '耿马傣族佤族自治县', '5309');
INSERT INTO "public"."base_area" VALUES ('530927', '沧源佤族自治县', '5309');
INSERT INTO "public"."base_area" VALUES ('532301', '楚雄市', '5323');
INSERT INTO "public"."base_area" VALUES ('532302', '禄丰市', '5323');
INSERT INTO "public"."base_area" VALUES ('532322', '双柏县', '5323');
INSERT INTO "public"."base_area" VALUES ('532323', '牟定县', '5323');
INSERT INTO "public"."base_area" VALUES ('532324', '南华县', '5323');
INSERT INTO "public"."base_area" VALUES ('532325', '姚安县', '5323');
INSERT INTO "public"."base_area" VALUES ('532326', '大姚县', '5323');
INSERT INTO "public"."base_area" VALUES ('532327', '永仁县', '5323');
INSERT INTO "public"."base_area" VALUES ('532328', '元谋县', '5323');
INSERT INTO "public"."base_area" VALUES ('532329', '武定县', '5323');
INSERT INTO "public"."base_area" VALUES ('532501', '个旧市', '5325');
INSERT INTO "public"."base_area" VALUES ('532502', '开远市', '5325');
INSERT INTO "public"."base_area" VALUES ('532503', '蒙自市', '5325');
INSERT INTO "public"."base_area" VALUES ('532504', '弥勒市', '5325');
INSERT INTO "public"."base_area" VALUES ('532523', '屏边苗族自治县', '5325');
INSERT INTO "public"."base_area" VALUES ('532524', '建水县', '5325');
INSERT INTO "public"."base_area" VALUES ('532525', '石屏县', '5325');
INSERT INTO "public"."base_area" VALUES ('532527', '泸西县', '5325');
INSERT INTO "public"."base_area" VALUES ('532528', '元阳县', '5325');
INSERT INTO "public"."base_area" VALUES ('532529', '红河县', '5325');
INSERT INTO "public"."base_area" VALUES ('532530', '金平苗族瑶族傣族自治县', '5325');
INSERT INTO "public"."base_area" VALUES ('532531', '绿春县', '5325');
INSERT INTO "public"."base_area" VALUES ('532532', '河口瑶族自治县', '5325');
INSERT INTO "public"."base_area" VALUES ('532601', '文山市', '5326');
INSERT INTO "public"."base_area" VALUES ('532622', '砚山县', '5326');
INSERT INTO "public"."base_area" VALUES ('532623', '西畴县', '5326');
INSERT INTO "public"."base_area" VALUES ('532624', '麻栗坡县', '5326');
INSERT INTO "public"."base_area" VALUES ('532625', '马关县', '5326');
INSERT INTO "public"."base_area" VALUES ('532626', '丘北县', '5326');
INSERT INTO "public"."base_area" VALUES ('532627', '广南县', '5326');
INSERT INTO "public"."base_area" VALUES ('532628', '富宁县', '5326');
INSERT INTO "public"."base_area" VALUES ('532801', '景洪市', '5328');
INSERT INTO "public"."base_area" VALUES ('532822', '勐海县', '5328');
INSERT INTO "public"."base_area" VALUES ('532823', '勐腊县', '5328');
INSERT INTO "public"."base_area" VALUES ('532901', '大理市', '5329');
INSERT INTO "public"."base_area" VALUES ('532922', '漾濞彝族自治县', '5329');
INSERT INTO "public"."base_area" VALUES ('532923', '祥云县', '5329');
INSERT INTO "public"."base_area" VALUES ('532924', '宾川县', '5329');
INSERT INTO "public"."base_area" VALUES ('532925', '弥渡县', '5329');
INSERT INTO "public"."base_area" VALUES ('532926', '南涧彝族自治县', '5329');
INSERT INTO "public"."base_area" VALUES ('532927', '巍山彝族回族自治县', '5329');
INSERT INTO "public"."base_area" VALUES ('532928', '永平县', '5329');
INSERT INTO "public"."base_area" VALUES ('532929', '云龙县', '5329');
INSERT INTO "public"."base_area" VALUES ('532930', '洱源县', '5329');
INSERT INTO "public"."base_area" VALUES ('532931', '剑川县', '5329');
INSERT INTO "public"."base_area" VALUES ('532932', '鹤庆县', '5329');
INSERT INTO "public"."base_area" VALUES ('533102', '瑞丽市', '5331');
INSERT INTO "public"."base_area" VALUES ('533103', '芒市', '5331');
INSERT INTO "public"."base_area" VALUES ('533122', '梁河县', '5331');
INSERT INTO "public"."base_area" VALUES ('533123', '盈江县', '5331');
INSERT INTO "public"."base_area" VALUES ('533124', '陇川县', '5331');
INSERT INTO "public"."base_area" VALUES ('533301', '泸水市', '5333');
INSERT INTO "public"."base_area" VALUES ('533323', '福贡县', '5333');
INSERT INTO "public"."base_area" VALUES ('533324', '贡山独龙族怒族自治县', '5333');
INSERT INTO "public"."base_area" VALUES ('533325', '兰坪白族普米族自治县', '5333');
INSERT INTO "public"."base_area" VALUES ('533401', '香格里拉市', '5334');
INSERT INTO "public"."base_area" VALUES ('533422', '德钦县', '5334');
INSERT INTO "public"."base_area" VALUES ('533423', '维西傈僳族自治县', '5334');
INSERT INTO "public"."base_area" VALUES ('540102', '城关区', '5401');
INSERT INTO "public"."base_area" VALUES ('540103', '堆龙德庆区', '5401');
INSERT INTO "public"."base_area" VALUES ('540104', '达孜区', '5401');
INSERT INTO "public"."base_area" VALUES ('540121', '林周县', '5401');
INSERT INTO "public"."base_area" VALUES ('540122', '当雄县', '5401');
INSERT INTO "public"."base_area" VALUES ('540123', '尼木县', '5401');
INSERT INTO "public"."base_area" VALUES ('540124', '曲水县', '5401');
INSERT INTO "public"."base_area" VALUES ('540127', '墨竹工卡县', '5401');
INSERT INTO "public"."base_area" VALUES ('540171', '格尔木藏青工业园区', '5401');
INSERT INTO "public"."base_area" VALUES ('540172', '拉萨经济技术开发区', '5401');
INSERT INTO "public"."base_area" VALUES ('540173', '西藏文化旅游创意园区', '5401');
INSERT INTO "public"."base_area" VALUES ('540174', '达孜工业园区', '5401');
INSERT INTO "public"."base_area" VALUES ('540202', '桑珠孜区', '5402');
INSERT INTO "public"."base_area" VALUES ('540221', '南木林县', '5402');
INSERT INTO "public"."base_area" VALUES ('540222', '江孜县', '5402');
INSERT INTO "public"."base_area" VALUES ('540223', '定日县', '5402');
INSERT INTO "public"."base_area" VALUES ('540224', '萨迦县', '5402');
INSERT INTO "public"."base_area" VALUES ('540225', '拉孜县', '5402');
INSERT INTO "public"."base_area" VALUES ('540226', '昂仁县', '5402');
INSERT INTO "public"."base_area" VALUES ('540227', '谢通门县', '5402');
INSERT INTO "public"."base_area" VALUES ('540228', '白朗县', '5402');
INSERT INTO "public"."base_area" VALUES ('540229', '仁布县', '5402');
INSERT INTO "public"."base_area" VALUES ('540230', '康马县', '5402');
INSERT INTO "public"."base_area" VALUES ('540231', '定结县', '5402');
INSERT INTO "public"."base_area" VALUES ('540232', '仲巴县', '5402');
INSERT INTO "public"."base_area" VALUES ('540233', '亚东县', '5402');
INSERT INTO "public"."base_area" VALUES ('540234', '吉隆县', '5402');
INSERT INTO "public"."base_area" VALUES ('540235', '聂拉木县', '5402');
INSERT INTO "public"."base_area" VALUES ('540236', '萨嘎县', '5402');
INSERT INTO "public"."base_area" VALUES ('540237', '岗巴县', '5402');
INSERT INTO "public"."base_area" VALUES ('540302', '卡若区', '5403');
INSERT INTO "public"."base_area" VALUES ('540321', '江达县', '5403');
INSERT INTO "public"."base_area" VALUES ('540322', '贡觉县', '5403');
INSERT INTO "public"."base_area" VALUES ('540323', '类乌齐县', '5403');
INSERT INTO "public"."base_area" VALUES ('540324', '丁青县', '5403');
INSERT INTO "public"."base_area" VALUES ('540325', '察雅县', '5403');
INSERT INTO "public"."base_area" VALUES ('540326', '八宿县', '5403');
INSERT INTO "public"."base_area" VALUES ('540327', '左贡县', '5403');
INSERT INTO "public"."base_area" VALUES ('540328', '芒康县', '5403');
INSERT INTO "public"."base_area" VALUES ('540329', '洛隆县', '5403');
INSERT INTO "public"."base_area" VALUES ('540330', '边坝县', '5403');
INSERT INTO "public"."base_area" VALUES ('540402', '巴宜区', '5404');
INSERT INTO "public"."base_area" VALUES ('540421', '工布江达县', '5404');
INSERT INTO "public"."base_area" VALUES ('540422', '米林县', '5404');
INSERT INTO "public"."base_area" VALUES ('540423', '墨脱县', '5404');
INSERT INTO "public"."base_area" VALUES ('540424', '波密县', '5404');
INSERT INTO "public"."base_area" VALUES ('540425', '察隅县', '5404');
INSERT INTO "public"."base_area" VALUES ('540426', '朗县', '5404');
INSERT INTO "public"."base_area" VALUES ('540502', '乃东区', '5405');
INSERT INTO "public"."base_area" VALUES ('540521', '扎囊县', '5405');
INSERT INTO "public"."base_area" VALUES ('540522', '贡嘎县', '5405');
INSERT INTO "public"."base_area" VALUES ('540523', '桑日县', '5405');
INSERT INTO "public"."base_area" VALUES ('540524', '琼结县', '5405');
INSERT INTO "public"."base_area" VALUES ('540525', '曲松县', '5405');
INSERT INTO "public"."base_area" VALUES ('540526', '措美县', '5405');
INSERT INTO "public"."base_area" VALUES ('540527', '洛扎县', '5405');
INSERT INTO "public"."base_area" VALUES ('540528', '加查县', '5405');
INSERT INTO "public"."base_area" VALUES ('540529', '隆子县', '5405');
INSERT INTO "public"."base_area" VALUES ('540530', '错那县', '5405');
INSERT INTO "public"."base_area" VALUES ('540531', '浪卡子县', '5405');
INSERT INTO "public"."base_area" VALUES ('540602', '色尼区', '5406');
INSERT INTO "public"."base_area" VALUES ('540621', '嘉黎县', '5406');
INSERT INTO "public"."base_area" VALUES ('540622', '比如县', '5406');
INSERT INTO "public"."base_area" VALUES ('540623', '聂荣县', '5406');
INSERT INTO "public"."base_area" VALUES ('540624', '安多县', '5406');
INSERT INTO "public"."base_area" VALUES ('540625', '申扎县', '5406');
INSERT INTO "public"."base_area" VALUES ('540626', '索县', '5406');
INSERT INTO "public"."base_area" VALUES ('540627', '班戈县', '5406');
INSERT INTO "public"."base_area" VALUES ('540628', '巴青县', '5406');
INSERT INTO "public"."base_area" VALUES ('540629', '尼玛县', '5406');
INSERT INTO "public"."base_area" VALUES ('540630', '双湖县', '5406');
INSERT INTO "public"."base_area" VALUES ('542521', '普兰县', '5425');
INSERT INTO "public"."base_area" VALUES ('542522', '札达县', '5425');
INSERT INTO "public"."base_area" VALUES ('542523', '噶尔县', '5425');
INSERT INTO "public"."base_area" VALUES ('542524', '日土县', '5425');
INSERT INTO "public"."base_area" VALUES ('542525', '革吉县', '5425');
INSERT INTO "public"."base_area" VALUES ('542526', '改则县', '5425');
INSERT INTO "public"."base_area" VALUES ('542527', '措勤县', '5425');
INSERT INTO "public"."base_area" VALUES ('610102', '新城区', '6101');
INSERT INTO "public"."base_area" VALUES ('610103', '碑林区', '6101');
INSERT INTO "public"."base_area" VALUES ('610104', '莲湖区', '6101');
INSERT INTO "public"."base_area" VALUES ('610111', '灞桥区', '6101');
INSERT INTO "public"."base_area" VALUES ('610112', '未央区', '6101');
INSERT INTO "public"."base_area" VALUES ('610113', '雁塔区', '6101');
INSERT INTO "public"."base_area" VALUES ('610114', '阎良区', '6101');
INSERT INTO "public"."base_area" VALUES ('610115', '临潼区', '6101');
INSERT INTO "public"."base_area" VALUES ('610116', '长安区', '6101');
INSERT INTO "public"."base_area" VALUES ('610117', '高陵区', '6101');
INSERT INTO "public"."base_area" VALUES ('610118', '鄠邑区', '6101');
INSERT INTO "public"."base_area" VALUES ('610122', '蓝田县', '6101');
INSERT INTO "public"."base_area" VALUES ('610124', '周至县', '6101');
INSERT INTO "public"."base_area" VALUES ('610202', '王益区', '6102');
INSERT INTO "public"."base_area" VALUES ('610203', '印台区', '6102');
INSERT INTO "public"."base_area" VALUES ('610204', '耀州区', '6102');
INSERT INTO "public"."base_area" VALUES ('610222', '宜君县', '6102');
INSERT INTO "public"."base_area" VALUES ('610302', '渭滨区', '6103');
INSERT INTO "public"."base_area" VALUES ('610303', '金台区', '6103');
INSERT INTO "public"."base_area" VALUES ('610304', '陈仓区', '6103');
INSERT INTO "public"."base_area" VALUES ('610305', '凤翔区', '6103');
INSERT INTO "public"."base_area" VALUES ('610323', '岐山县', '6103');
INSERT INTO "public"."base_area" VALUES ('610324', '扶风县', '6103');
INSERT INTO "public"."base_area" VALUES ('610326', '眉县', '6103');
INSERT INTO "public"."base_area" VALUES ('610327', '陇县', '6103');
INSERT INTO "public"."base_area" VALUES ('610328', '千阳县', '6103');
INSERT INTO "public"."base_area" VALUES ('610329', '麟游县', '6103');
INSERT INTO "public"."base_area" VALUES ('610330', '凤县', '6103');
INSERT INTO "public"."base_area" VALUES ('610331', '太白县', '6103');
INSERT INTO "public"."base_area" VALUES ('610402', '秦都区', '6104');
INSERT INTO "public"."base_area" VALUES ('610403', '杨陵区', '6104');
INSERT INTO "public"."base_area" VALUES ('610404', '渭城区', '6104');
INSERT INTO "public"."base_area" VALUES ('610422', '三原县', '6104');
INSERT INTO "public"."base_area" VALUES ('610423', '泾阳县', '6104');
INSERT INTO "public"."base_area" VALUES ('610424', '乾县', '6104');
INSERT INTO "public"."base_area" VALUES ('610425', '礼泉县', '6104');
INSERT INTO "public"."base_area" VALUES ('610426', '永寿县', '6104');
INSERT INTO "public"."base_area" VALUES ('610428', '长武县', '6104');
INSERT INTO "public"."base_area" VALUES ('610429', '旬邑县', '6104');
INSERT INTO "public"."base_area" VALUES ('610430', '淳化县', '6104');
INSERT INTO "public"."base_area" VALUES ('610431', '武功县', '6104');
INSERT INTO "public"."base_area" VALUES ('610481', '兴平市', '6104');
INSERT INTO "public"."base_area" VALUES ('610482', '彬州市', '6104');
INSERT INTO "public"."base_area" VALUES ('610502', '临渭区', '6105');
INSERT INTO "public"."base_area" VALUES ('610503', '华州区', '6105');
INSERT INTO "public"."base_area" VALUES ('610522', '潼关县', '6105');
INSERT INTO "public"."base_area" VALUES ('610523', '大荔县', '6105');
INSERT INTO "public"."base_area" VALUES ('610524', '合阳县', '6105');
INSERT INTO "public"."base_area" VALUES ('610525', '澄城县', '6105');
INSERT INTO "public"."base_area" VALUES ('610526', '蒲城县', '6105');
INSERT INTO "public"."base_area" VALUES ('610527', '白水县', '6105');
INSERT INTO "public"."base_area" VALUES ('610528', '富平县', '6105');
INSERT INTO "public"."base_area" VALUES ('610581', '韩城市', '6105');
INSERT INTO "public"."base_area" VALUES ('610582', '华阴市', '6105');
INSERT INTO "public"."base_area" VALUES ('610602', '宝塔区', '6106');
INSERT INTO "public"."base_area" VALUES ('610603', '安塞区', '6106');
INSERT INTO "public"."base_area" VALUES ('610621', '延长县', '6106');
INSERT INTO "public"."base_area" VALUES ('610622', '延川县', '6106');
INSERT INTO "public"."base_area" VALUES ('610625', '志丹县', '6106');
INSERT INTO "public"."base_area" VALUES ('610626', '吴起县', '6106');
INSERT INTO "public"."base_area" VALUES ('610627', '甘泉县', '6106');
INSERT INTO "public"."base_area" VALUES ('610628', '富县', '6106');
INSERT INTO "public"."base_area" VALUES ('610629', '洛川县', '6106');
INSERT INTO "public"."base_area" VALUES ('610630', '宜川县', '6106');
INSERT INTO "public"."base_area" VALUES ('610631', '黄龙县', '6106');
INSERT INTO "public"."base_area" VALUES ('610632', '黄陵县', '6106');
INSERT INTO "public"."base_area" VALUES ('610681', '子长市', '6106');
INSERT INTO "public"."base_area" VALUES ('610702', '汉台区', '6107');
INSERT INTO "public"."base_area" VALUES ('610703', '南郑区', '6107');
INSERT INTO "public"."base_area" VALUES ('610722', '城固县', '6107');
INSERT INTO "public"."base_area" VALUES ('610723', '洋县', '6107');
INSERT INTO "public"."base_area" VALUES ('610724', '西乡县', '6107');
INSERT INTO "public"."base_area" VALUES ('610725', '勉县', '6107');
INSERT INTO "public"."base_area" VALUES ('610726', '宁强县', '6107');
INSERT INTO "public"."base_area" VALUES ('610727', '略阳县', '6107');
INSERT INTO "public"."base_area" VALUES ('610728', '镇巴县', '6107');
INSERT INTO "public"."base_area" VALUES ('610729', '留坝县', '6107');
INSERT INTO "public"."base_area" VALUES ('610730', '佛坪县', '6107');
INSERT INTO "public"."base_area" VALUES ('610802', '榆阳区', '6108');
INSERT INTO "public"."base_area" VALUES ('610803', '横山区', '6108');
INSERT INTO "public"."base_area" VALUES ('610822', '府谷县', '6108');
INSERT INTO "public"."base_area" VALUES ('610824', '靖边县', '6108');
INSERT INTO "public"."base_area" VALUES ('610825', '定边县', '6108');
INSERT INTO "public"."base_area" VALUES ('610826', '绥德县', '6108');
INSERT INTO "public"."base_area" VALUES ('610827', '米脂县', '6108');
INSERT INTO "public"."base_area" VALUES ('610828', '佳县', '6108');
INSERT INTO "public"."base_area" VALUES ('610829', '吴堡县', '6108');
INSERT INTO "public"."base_area" VALUES ('610830', '清涧县', '6108');
INSERT INTO "public"."base_area" VALUES ('610831', '子洲县', '6108');
INSERT INTO "public"."base_area" VALUES ('610881', '神木市', '6108');
INSERT INTO "public"."base_area" VALUES ('610902', '汉滨区', '6109');
INSERT INTO "public"."base_area" VALUES ('610921', '汉阴县', '6109');
INSERT INTO "public"."base_area" VALUES ('610922', '石泉县', '6109');
INSERT INTO "public"."base_area" VALUES ('610923', '宁陕县', '6109');
INSERT INTO "public"."base_area" VALUES ('610924', '紫阳县', '6109');
INSERT INTO "public"."base_area" VALUES ('610925', '岚皋县', '6109');
INSERT INTO "public"."base_area" VALUES ('610926', '平利县', '6109');
INSERT INTO "public"."base_area" VALUES ('610927', '镇坪县', '6109');
INSERT INTO "public"."base_area" VALUES ('610929', '白河县', '6109');
INSERT INTO "public"."base_area" VALUES ('610981', '旬阳市', '6109');
INSERT INTO "public"."base_area" VALUES ('611002', '商州区', '6110');
INSERT INTO "public"."base_area" VALUES ('611021', '洛南县', '6110');
INSERT INTO "public"."base_area" VALUES ('611022', '丹凤县', '6110');
INSERT INTO "public"."base_area" VALUES ('611023', '商南县', '6110');
INSERT INTO "public"."base_area" VALUES ('611024', '山阳县', '6110');
INSERT INTO "public"."base_area" VALUES ('611025', '镇安县', '6110');
INSERT INTO "public"."base_area" VALUES ('611026', '柞水县', '6110');
INSERT INTO "public"."base_area" VALUES ('620102', '城关区', '6201');
INSERT INTO "public"."base_area" VALUES ('620103', '七里河区', '6201');
INSERT INTO "public"."base_area" VALUES ('620104', '西固区', '6201');
INSERT INTO "public"."base_area" VALUES ('620105', '安宁区', '6201');
INSERT INTO "public"."base_area" VALUES ('620111', '红古区', '6201');
INSERT INTO "public"."base_area" VALUES ('620121', '永登县', '6201');
INSERT INTO "public"."base_area" VALUES ('620122', '皋兰县', '6201');
INSERT INTO "public"."base_area" VALUES ('620123', '榆中县', '6201');
INSERT INTO "public"."base_area" VALUES ('620171', '兰州新区', '6201');
INSERT INTO "public"."base_area" VALUES ('620201', '嘉峪关市', '6202');
INSERT INTO "public"."base_area" VALUES ('620302', '金川区', '6203');
INSERT INTO "public"."base_area" VALUES ('620321', '永昌县', '6203');
INSERT INTO "public"."base_area" VALUES ('620402', '白银区', '6204');
INSERT INTO "public"."base_area" VALUES ('620403', '平川区', '6204');
INSERT INTO "public"."base_area" VALUES ('620421', '靖远县', '6204');
INSERT INTO "public"."base_area" VALUES ('620422', '会宁县', '6204');
INSERT INTO "public"."base_area" VALUES ('620423', '景泰县', '6204');
INSERT INTO "public"."base_area" VALUES ('620502', '秦州区', '6205');
INSERT INTO "public"."base_area" VALUES ('620503', '麦积区', '6205');
INSERT INTO "public"."base_area" VALUES ('620521', '清水县', '6205');
INSERT INTO "public"."base_area" VALUES ('620522', '秦安县', '6205');
INSERT INTO "public"."base_area" VALUES ('620523', '甘谷县', '6205');
INSERT INTO "public"."base_area" VALUES ('620524', '武山县', '6205');
INSERT INTO "public"."base_area" VALUES ('620525', '张家川回族自治县', '6205');
INSERT INTO "public"."base_area" VALUES ('620602', '凉州区', '6206');
INSERT INTO "public"."base_area" VALUES ('620621', '民勤县', '6206');
INSERT INTO "public"."base_area" VALUES ('620622', '古浪县', '6206');
INSERT INTO "public"."base_area" VALUES ('620623', '天祝藏族自治县', '6206');
INSERT INTO "public"."base_area" VALUES ('620702', '甘州区', '6207');
INSERT INTO "public"."base_area" VALUES ('620721', '肃南裕固族自治县', '6207');
INSERT INTO "public"."base_area" VALUES ('620722', '民乐县', '6207');
INSERT INTO "public"."base_area" VALUES ('620723', '临泽县', '6207');
INSERT INTO "public"."base_area" VALUES ('620724', '高台县', '6207');
INSERT INTO "public"."base_area" VALUES ('620725', '山丹县', '6207');
INSERT INTO "public"."base_area" VALUES ('620802', '崆峒区', '6208');
INSERT INTO "public"."base_area" VALUES ('620821', '泾川县', '6208');
INSERT INTO "public"."base_area" VALUES ('620822', '灵台县', '6208');
INSERT INTO "public"."base_area" VALUES ('620823', '崇信县', '6208');
INSERT INTO "public"."base_area" VALUES ('620825', '庄浪县', '6208');
INSERT INTO "public"."base_area" VALUES ('620826', '静宁县', '6208');
INSERT INTO "public"."base_area" VALUES ('620881', '华亭市', '6208');
INSERT INTO "public"."base_area" VALUES ('620902', '肃州区', '6209');
INSERT INTO "public"."base_area" VALUES ('620921', '金塔县', '6209');
INSERT INTO "public"."base_area" VALUES ('620922', '瓜州县', '6209');
INSERT INTO "public"."base_area" VALUES ('620923', '肃北蒙古族自治县', '6209');
INSERT INTO "public"."base_area" VALUES ('620924', '阿克塞哈萨克族自治县', '6209');
INSERT INTO "public"."base_area" VALUES ('620981', '玉门市', '6209');
INSERT INTO "public"."base_area" VALUES ('620982', '敦煌市', '6209');
INSERT INTO "public"."base_area" VALUES ('621002', '西峰区', '6210');
INSERT INTO "public"."base_area" VALUES ('621021', '庆城县', '6210');
INSERT INTO "public"."base_area" VALUES ('621022', '环县', '6210');
INSERT INTO "public"."base_area" VALUES ('621023', '华池县', '6210');
INSERT INTO "public"."base_area" VALUES ('621024', '合水县', '6210');
INSERT INTO "public"."base_area" VALUES ('621025', '正宁县', '6210');
INSERT INTO "public"."base_area" VALUES ('621026', '宁县', '6210');
INSERT INTO "public"."base_area" VALUES ('621027', '镇原县', '6210');
INSERT INTO "public"."base_area" VALUES ('621102', '安定区', '6211');
INSERT INTO "public"."base_area" VALUES ('621121', '通渭县', '6211');
INSERT INTO "public"."base_area" VALUES ('621122', '陇西县', '6211');
INSERT INTO "public"."base_area" VALUES ('621123', '渭源县', '6211');
INSERT INTO "public"."base_area" VALUES ('621124', '临洮县', '6211');
INSERT INTO "public"."base_area" VALUES ('621125', '漳县', '6211');
INSERT INTO "public"."base_area" VALUES ('621126', '岷县', '6211');
INSERT INTO "public"."base_area" VALUES ('621202', '武都区', '6212');
INSERT INTO "public"."base_area" VALUES ('621221', '成县', '6212');
INSERT INTO "public"."base_area" VALUES ('621222', '文县', '6212');
INSERT INTO "public"."base_area" VALUES ('621223', '宕昌县', '6212');
INSERT INTO "public"."base_area" VALUES ('621224', '康县', '6212');
INSERT INTO "public"."base_area" VALUES ('621225', '西和县', '6212');
INSERT INTO "public"."base_area" VALUES ('621226', '礼县', '6212');
INSERT INTO "public"."base_area" VALUES ('621227', '徽县', '6212');
INSERT INTO "public"."base_area" VALUES ('621228', '两当县', '6212');
INSERT INTO "public"."base_area" VALUES ('622901', '临夏市', '6229');
INSERT INTO "public"."base_area" VALUES ('622921', '临夏县', '6229');
INSERT INTO "public"."base_area" VALUES ('622922', '康乐县', '6229');
INSERT INTO "public"."base_area" VALUES ('622923', '永靖县', '6229');
INSERT INTO "public"."base_area" VALUES ('622924', '广河县', '6229');
INSERT INTO "public"."base_area" VALUES ('622925', '和政县', '6229');
INSERT INTO "public"."base_area" VALUES ('622926', '东乡族自治县', '6229');
INSERT INTO "public"."base_area" VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '6229');
INSERT INTO "public"."base_area" VALUES ('623001', '合作市', '6230');
INSERT INTO "public"."base_area" VALUES ('623021', '临潭县', '6230');
INSERT INTO "public"."base_area" VALUES ('623022', '卓尼县', '6230');
INSERT INTO "public"."base_area" VALUES ('623023', '舟曲县', '6230');
INSERT INTO "public"."base_area" VALUES ('623024', '迭部县', '6230');
INSERT INTO "public"."base_area" VALUES ('623025', '玛曲县', '6230');
INSERT INTO "public"."base_area" VALUES ('623026', '碌曲县', '6230');
INSERT INTO "public"."base_area" VALUES ('623027', '夏河县', '6230');
INSERT INTO "public"."base_area" VALUES ('630102', '城东区', '6301');
INSERT INTO "public"."base_area" VALUES ('630103', '城中区', '6301');
INSERT INTO "public"."base_area" VALUES ('630104', '城西区', '6301');
INSERT INTO "public"."base_area" VALUES ('630105', '城北区', '6301');
INSERT INTO "public"."base_area" VALUES ('630106', '湟中区', '6301');
INSERT INTO "public"."base_area" VALUES ('630121', '大通回族土族自治县', '6301');
INSERT INTO "public"."base_area" VALUES ('630123', '湟源县', '6301');
INSERT INTO "public"."base_area" VALUES ('630202', '乐都区', '6302');
INSERT INTO "public"."base_area" VALUES ('630203', '平安区', '6302');
INSERT INTO "public"."base_area" VALUES ('630222', '民和回族土族自治县', '6302');
INSERT INTO "public"."base_area" VALUES ('630223', '互助土族自治县', '6302');
INSERT INTO "public"."base_area" VALUES ('630224', '化隆回族自治县', '6302');
INSERT INTO "public"."base_area" VALUES ('630225', '循化撒拉族自治县', '6302');
INSERT INTO "public"."base_area" VALUES ('632221', '门源回族自治县', '6322');
INSERT INTO "public"."base_area" VALUES ('632222', '祁连县', '6322');
INSERT INTO "public"."base_area" VALUES ('632223', '海晏县', '6322');
INSERT INTO "public"."base_area" VALUES ('632224', '刚察县', '6322');
INSERT INTO "public"."base_area" VALUES ('632301', '同仁市', '6323');
INSERT INTO "public"."base_area" VALUES ('632322', '尖扎县', '6323');
INSERT INTO "public"."base_area" VALUES ('632323', '泽库县', '6323');
INSERT INTO "public"."base_area" VALUES ('632324', '河南蒙古族自治县', '6323');
INSERT INTO "public"."base_area" VALUES ('632521', '共和县', '6325');
INSERT INTO "public"."base_area" VALUES ('632522', '同德县', '6325');
INSERT INTO "public"."base_area" VALUES ('632523', '贵德县', '6325');
INSERT INTO "public"."base_area" VALUES ('632524', '兴海县', '6325');
INSERT INTO "public"."base_area" VALUES ('632525', '贵南县', '6325');
INSERT INTO "public"."base_area" VALUES ('632621', '玛沁县', '6326');
INSERT INTO "public"."base_area" VALUES ('632622', '班玛县', '6326');
INSERT INTO "public"."base_area" VALUES ('632623', '甘德县', '6326');
INSERT INTO "public"."base_area" VALUES ('632624', '达日县', '6326');
INSERT INTO "public"."base_area" VALUES ('632625', '久治县', '6326');
INSERT INTO "public"."base_area" VALUES ('632626', '玛多县', '6326');
INSERT INTO "public"."base_area" VALUES ('632701', '玉树市', '6327');
INSERT INTO "public"."base_area" VALUES ('632722', '杂多县', '6327');
INSERT INTO "public"."base_area" VALUES ('632723', '称多县', '6327');
INSERT INTO "public"."base_area" VALUES ('632724', '治多县', '6327');
INSERT INTO "public"."base_area" VALUES ('632725', '囊谦县', '6327');
INSERT INTO "public"."base_area" VALUES ('632726', '曲麻莱县', '6327');
INSERT INTO "public"."base_area" VALUES ('632801', '格尔木市', '6328');
INSERT INTO "public"."base_area" VALUES ('632802', '德令哈市', '6328');
INSERT INTO "public"."base_area" VALUES ('632803', '茫崖市', '6328');
INSERT INTO "public"."base_area" VALUES ('632821', '乌兰县', '6328');
INSERT INTO "public"."base_area" VALUES ('632822', '都兰县', '6328');
INSERT INTO "public"."base_area" VALUES ('632823', '天峻县', '6328');
INSERT INTO "public"."base_area" VALUES ('632857', '大柴旦行政委员会', '6328');
INSERT INTO "public"."base_area" VALUES ('640104', '兴庆区', '6401');
INSERT INTO "public"."base_area" VALUES ('640105', '西夏区', '6401');
INSERT INTO "public"."base_area" VALUES ('640106', '金凤区', '6401');
INSERT INTO "public"."base_area" VALUES ('640121', '永宁县', '6401');
INSERT INTO "public"."base_area" VALUES ('640122', '贺兰县', '6401');
INSERT INTO "public"."base_area" VALUES ('640181', '灵武市', '6401');
INSERT INTO "public"."base_area" VALUES ('640202', '大武口区', '6402');
INSERT INTO "public"."base_area" VALUES ('640205', '惠农区', '6402');
INSERT INTO "public"."base_area" VALUES ('640221', '平罗县', '6402');
INSERT INTO "public"."base_area" VALUES ('640302', '利通区', '6403');
INSERT INTO "public"."base_area" VALUES ('640303', '红寺堡区', '6403');
INSERT INTO "public"."base_area" VALUES ('640323', '盐池县', '6403');
INSERT INTO "public"."base_area" VALUES ('640324', '同心县', '6403');
INSERT INTO "public"."base_area" VALUES ('640381', '青铜峡市', '6403');
INSERT INTO "public"."base_area" VALUES ('640402', '原州区', '6404');
INSERT INTO "public"."base_area" VALUES ('640422', '西吉县', '6404');
INSERT INTO "public"."base_area" VALUES ('640423', '隆德县', '6404');
INSERT INTO "public"."base_area" VALUES ('640424', '泾源县', '6404');
INSERT INTO "public"."base_area" VALUES ('640425', '彭阳县', '6404');
INSERT INTO "public"."base_area" VALUES ('640502', '沙坡头区', '6405');
INSERT INTO "public"."base_area" VALUES ('640521', '中宁县', '6405');
INSERT INTO "public"."base_area" VALUES ('640522', '海原县', '6405');
INSERT INTO "public"."base_area" VALUES ('650102', '天山区', '6501');
INSERT INTO "public"."base_area" VALUES ('650103', '沙依巴克区', '6501');
INSERT INTO "public"."base_area" VALUES ('650104', '新市区', '6501');
INSERT INTO "public"."base_area" VALUES ('650105', '水磨沟区', '6501');
INSERT INTO "public"."base_area" VALUES ('650106', '头屯河区', '6501');
INSERT INTO "public"."base_area" VALUES ('650107', '达坂城区', '6501');
INSERT INTO "public"."base_area" VALUES ('650109', '米东区', '6501');
INSERT INTO "public"."base_area" VALUES ('650121', '乌鲁木齐县', '6501');
INSERT INTO "public"."base_area" VALUES ('650202', '独山子区', '6502');
INSERT INTO "public"."base_area" VALUES ('650203', '克拉玛依区', '6502');
INSERT INTO "public"."base_area" VALUES ('650204', '白碱滩区', '6502');
INSERT INTO "public"."base_area" VALUES ('650205', '乌尔禾区', '6502');
INSERT INTO "public"."base_area" VALUES ('650402', '高昌区', '6504');
INSERT INTO "public"."base_area" VALUES ('650421', '鄯善县', '6504');
INSERT INTO "public"."base_area" VALUES ('650422', '托克逊县', '6504');
INSERT INTO "public"."base_area" VALUES ('650502', '伊州区', '6505');
INSERT INTO "public"."base_area" VALUES ('650521', '巴里坤哈萨克自治县', '6505');
INSERT INTO "public"."base_area" VALUES ('650522', '伊吾县', '6505');
INSERT INTO "public"."base_area" VALUES ('652301', '昌吉市', '6523');
INSERT INTO "public"."base_area" VALUES ('652302', '阜康市', '6523');
INSERT INTO "public"."base_area" VALUES ('652323', '呼图壁县', '6523');
INSERT INTO "public"."base_area" VALUES ('652324', '玛纳斯县', '6523');
INSERT INTO "public"."base_area" VALUES ('652325', '奇台县', '6523');
INSERT INTO "public"."base_area" VALUES ('652327', '吉木萨尔县', '6523');
INSERT INTO "public"."base_area" VALUES ('652328', '木垒哈萨克自治县', '6523');
INSERT INTO "public"."base_area" VALUES ('652701', '博乐市', '6527');
INSERT INTO "public"."base_area" VALUES ('652702', '阿拉山口市', '6527');
INSERT INTO "public"."base_area" VALUES ('652722', '精河县', '6527');
INSERT INTO "public"."base_area" VALUES ('652723', '温泉县', '6527');
INSERT INTO "public"."base_area" VALUES ('652801', '库尔勒市', '6528');
INSERT INTO "public"."base_area" VALUES ('652822', '轮台县', '6528');
INSERT INTO "public"."base_area" VALUES ('652823', '尉犁县', '6528');
INSERT INTO "public"."base_area" VALUES ('652824', '若羌县', '6528');
INSERT INTO "public"."base_area" VALUES ('652825', '且末县', '6528');
INSERT INTO "public"."base_area" VALUES ('652826', '焉耆回族自治县', '6528');
INSERT INTO "public"."base_area" VALUES ('652827', '和静县', '6528');
INSERT INTO "public"."base_area" VALUES ('652828', '和硕县', '6528');
INSERT INTO "public"."base_area" VALUES ('652829', '博湖县', '6528');
INSERT INTO "public"."base_area" VALUES ('652871', '库尔勒经济技术开发区', '6528');
INSERT INTO "public"."base_area" VALUES ('652901', '阿克苏市', '6529');
INSERT INTO "public"."base_area" VALUES ('652902', '库车市', '6529');
INSERT INTO "public"."base_area" VALUES ('652922', '温宿县', '6529');
INSERT INTO "public"."base_area" VALUES ('652924', '沙雅县', '6529');
INSERT INTO "public"."base_area" VALUES ('652925', '新和县', '6529');
INSERT INTO "public"."base_area" VALUES ('652926', '拜城县', '6529');
INSERT INTO "public"."base_area" VALUES ('652927', '乌什县', '6529');
INSERT INTO "public"."base_area" VALUES ('652928', '阿瓦提县', '6529');
INSERT INTO "public"."base_area" VALUES ('652929', '柯坪县', '6529');
INSERT INTO "public"."base_area" VALUES ('653001', '阿图什市', '6530');
INSERT INTO "public"."base_area" VALUES ('653022', '阿克陶县', '6530');
INSERT INTO "public"."base_area" VALUES ('653023', '阿合奇县', '6530');
INSERT INTO "public"."base_area" VALUES ('653024', '乌恰县', '6530');
INSERT INTO "public"."base_area" VALUES ('653101', '喀什市', '6531');
INSERT INTO "public"."base_area" VALUES ('653121', '疏附县', '6531');
INSERT INTO "public"."base_area" VALUES ('653122', '疏勒县', '6531');
INSERT INTO "public"."base_area" VALUES ('653123', '英吉沙县', '6531');
INSERT INTO "public"."base_area" VALUES ('653124', '泽普县', '6531');
INSERT INTO "public"."base_area" VALUES ('653125', '莎车县', '6531');
INSERT INTO "public"."base_area" VALUES ('653126', '叶城县', '6531');
INSERT INTO "public"."base_area" VALUES ('653127', '麦盖提县', '6531');
INSERT INTO "public"."base_area" VALUES ('653128', '岳普湖县', '6531');
INSERT INTO "public"."base_area" VALUES ('653129', '伽师县', '6531');
INSERT INTO "public"."base_area" VALUES ('653130', '巴楚县', '6531');
INSERT INTO "public"."base_area" VALUES ('653131', '塔什库尔干塔吉克自治县', '6531');
INSERT INTO "public"."base_area" VALUES ('653201', '和田市', '6532');
INSERT INTO "public"."base_area" VALUES ('653221', '和田县', '6532');
INSERT INTO "public"."base_area" VALUES ('653222', '墨玉县', '6532');
INSERT INTO "public"."base_area" VALUES ('653223', '皮山县', '6532');
INSERT INTO "public"."base_area" VALUES ('653224', '洛浦县', '6532');
INSERT INTO "public"."base_area" VALUES ('653225', '策勒县', '6532');
INSERT INTO "public"."base_area" VALUES ('653226', '于田县', '6532');
INSERT INTO "public"."base_area" VALUES ('653227', '民丰县', '6532');
INSERT INTO "public"."base_area" VALUES ('654002', '伊宁市', '6540');
INSERT INTO "public"."base_area" VALUES ('654003', '奎屯市', '6540');
INSERT INTO "public"."base_area" VALUES ('654004', '霍尔果斯市', '6540');
INSERT INTO "public"."base_area" VALUES ('654021', '伊宁县', '6540');
INSERT INTO "public"."base_area" VALUES ('654022', '察布查尔锡伯自治县', '6540');
INSERT INTO "public"."base_area" VALUES ('654023', '霍城县', '6540');
INSERT INTO "public"."base_area" VALUES ('654024', '巩留县', '6540');
INSERT INTO "public"."base_area" VALUES ('654025', '新源县', '6540');
INSERT INTO "public"."base_area" VALUES ('654026', '昭苏县', '6540');
INSERT INTO "public"."base_area" VALUES ('654027', '特克斯县', '6540');
INSERT INTO "public"."base_area" VALUES ('654028', '尼勒克县', '6540');
INSERT INTO "public"."base_area" VALUES ('654201', '塔城市', '6542');
INSERT INTO "public"."base_area" VALUES ('654202', '乌苏市', '6542');
INSERT INTO "public"."base_area" VALUES ('654203', '沙湾市', '6542');
INSERT INTO "public"."base_area" VALUES ('654221', '额敏县', '6542');
INSERT INTO "public"."base_area" VALUES ('654224', '托里县', '6542');
INSERT INTO "public"."base_area" VALUES ('654225', '裕民县', '6542');
INSERT INTO "public"."base_area" VALUES ('654226', '和布克赛尔蒙古自治县', '6542');
INSERT INTO "public"."base_area" VALUES ('654301', '阿勒泰市', '6543');
INSERT INTO "public"."base_area" VALUES ('654321', '布尔津县', '6543');
INSERT INTO "public"."base_area" VALUES ('654322', '富蕴县', '6543');
INSERT INTO "public"."base_area" VALUES ('654323', '福海县', '6543');
INSERT INTO "public"."base_area" VALUES ('654324', '哈巴河县', '6543');
INSERT INTO "public"."base_area" VALUES ('654325', '青河县', '6543');
INSERT INTO "public"."base_area" VALUES ('654326', '吉木乃县', '6543');
INSERT INTO "public"."base_area" VALUES ('659001', '石河子市', '6590');
INSERT INTO "public"."base_area" VALUES ('659002', '阿拉尔市', '6590');
INSERT INTO "public"."base_area" VALUES ('659003', '图木舒克市', '6590');
INSERT INTO "public"."base_area" VALUES ('659004', '五家渠市', '6590');
INSERT INTO "public"."base_area" VALUES ('659005', '北屯市', '6590');
INSERT INTO "public"."base_area" VALUES ('659006', '铁门关市', '6590');
INSERT INTO "public"."base_area" VALUES ('659007', '双河市', '6590');
INSERT INTO "public"."base_area" VALUES ('659008', '可克达拉市', '6590');
INSERT INTO "public"."base_area" VALUES ('659009', '昆玉市', '6590');
INSERT INTO "public"."base_area" VALUES ('659010', '胡杨河市', '6590');
INSERT INTO "public"."base_area" VALUES ('659011', '新星市', '6590');

-- ----------------------------
-- Table structure for base_black_china_word
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_black_china_word";
CREATE TABLE "public"."base_black_china_word" (
  "id" int8 NOT NULL,
  "word" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "enable" bool,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "white" bool
)
;
COMMENT ON COLUMN "public"."base_black_china_word"."id" IS '主键';
COMMENT ON COLUMN "public"."base_black_china_word"."word" IS '敏感词';
COMMENT ON COLUMN "public"."base_black_china_word"."type" IS '分类';
COMMENT ON COLUMN "public"."base_black_china_word"."description" IS '描述';
COMMENT ON COLUMN "public"."base_black_china_word"."enable" IS '是否启用';
COMMENT ON COLUMN "public"."base_black_china_word"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."base_black_china_word"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."base_black_china_word"."last_modifier" IS '最后修者ID';
COMMENT ON COLUMN "public"."base_black_china_word"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."base_black_china_word"."version" IS '乐观锁';
COMMENT ON COLUMN "public"."base_black_china_word"."white" IS '白名单';
COMMENT ON TABLE "public"."base_black_china_word" IS '敏感词';

-- ----------------------------
-- Records of base_black_china_word
-- ----------------------------

-- ----------------------------
-- Table structure for base_city
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_city";
CREATE TABLE "public"."base_city" (
  "code" char(4) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "province_code" char(2) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."base_city"."code" IS '城市编码';
COMMENT ON COLUMN "public"."base_city"."name" IS '城市名称';
COMMENT ON COLUMN "public"."base_city"."province_code" IS '省份编码';
COMMENT ON TABLE "public"."base_city" IS '城市表';

-- ----------------------------
-- Records of base_city
-- ----------------------------
INSERT INTO "public"."base_city" VALUES ('1101', '市辖区', '11');
INSERT INTO "public"."base_city" VALUES ('1201', '市辖区', '12');
INSERT INTO "public"."base_city" VALUES ('1301', '石家庄市', '13');
INSERT INTO "public"."base_city" VALUES ('1302', '唐山市', '13');
INSERT INTO "public"."base_city" VALUES ('1303', '秦皇岛市', '13');
INSERT INTO "public"."base_city" VALUES ('1304', '邯郸市', '13');
INSERT INTO "public"."base_city" VALUES ('1305', '邢台市', '13');
INSERT INTO "public"."base_city" VALUES ('1306', '保定市', '13');
INSERT INTO "public"."base_city" VALUES ('1307', '张家口市', '13');
INSERT INTO "public"."base_city" VALUES ('1308', '承德市', '13');
INSERT INTO "public"."base_city" VALUES ('1309', '沧州市', '13');
INSERT INTO "public"."base_city" VALUES ('1310', '廊坊市', '13');
INSERT INTO "public"."base_city" VALUES ('1311', '衡水市', '13');
INSERT INTO "public"."base_city" VALUES ('1401', '太原市', '14');
INSERT INTO "public"."base_city" VALUES ('1402', '大同市', '14');
INSERT INTO "public"."base_city" VALUES ('1403', '阳泉市', '14');
INSERT INTO "public"."base_city" VALUES ('1404', '长治市', '14');
INSERT INTO "public"."base_city" VALUES ('1405', '晋城市', '14');
INSERT INTO "public"."base_city" VALUES ('1406', '朔州市', '14');
INSERT INTO "public"."base_city" VALUES ('1407', '晋中市', '14');
INSERT INTO "public"."base_city" VALUES ('1408', '运城市', '14');
INSERT INTO "public"."base_city" VALUES ('1409', '忻州市', '14');
INSERT INTO "public"."base_city" VALUES ('1410', '临汾市', '14');
INSERT INTO "public"."base_city" VALUES ('1411', '吕梁市', '14');
INSERT INTO "public"."base_city" VALUES ('1501', '呼和浩特市', '15');
INSERT INTO "public"."base_city" VALUES ('1502', '包头市', '15');
INSERT INTO "public"."base_city" VALUES ('1503', '乌海市', '15');
INSERT INTO "public"."base_city" VALUES ('1504', '赤峰市', '15');
INSERT INTO "public"."base_city" VALUES ('1505', '通辽市', '15');
INSERT INTO "public"."base_city" VALUES ('1506', '鄂尔多斯市', '15');
INSERT INTO "public"."base_city" VALUES ('1507', '呼伦贝尔市', '15');
INSERT INTO "public"."base_city" VALUES ('1508', '巴彦淖尔市', '15');
INSERT INTO "public"."base_city" VALUES ('1509', '乌兰察布市', '15');
INSERT INTO "public"."base_city" VALUES ('1522', '兴安盟', '15');
INSERT INTO "public"."base_city" VALUES ('1525', '锡林郭勒盟', '15');
INSERT INTO "public"."base_city" VALUES ('1529', '阿拉善盟', '15');
INSERT INTO "public"."base_city" VALUES ('2101', '沈阳市', '21');
INSERT INTO "public"."base_city" VALUES ('2102', '大连市', '21');
INSERT INTO "public"."base_city" VALUES ('2103', '鞍山市', '21');
INSERT INTO "public"."base_city" VALUES ('2104', '抚顺市', '21');
INSERT INTO "public"."base_city" VALUES ('2105', '本溪市', '21');
INSERT INTO "public"."base_city" VALUES ('2106', '丹东市', '21');
INSERT INTO "public"."base_city" VALUES ('2107', '锦州市', '21');
INSERT INTO "public"."base_city" VALUES ('2108', '营口市', '21');
INSERT INTO "public"."base_city" VALUES ('2109', '阜新市', '21');
INSERT INTO "public"."base_city" VALUES ('2110', '辽阳市', '21');
INSERT INTO "public"."base_city" VALUES ('2111', '盘锦市', '21');
INSERT INTO "public"."base_city" VALUES ('2112', '铁岭市', '21');
INSERT INTO "public"."base_city" VALUES ('2113', '朝阳市', '21');
INSERT INTO "public"."base_city" VALUES ('2114', '葫芦岛市', '21');
INSERT INTO "public"."base_city" VALUES ('2201', '长春市', '22');
INSERT INTO "public"."base_city" VALUES ('2202', '吉林市', '22');
INSERT INTO "public"."base_city" VALUES ('2203', '四平市', '22');
INSERT INTO "public"."base_city" VALUES ('2204', '辽源市', '22');
INSERT INTO "public"."base_city" VALUES ('2205', '通化市', '22');
INSERT INTO "public"."base_city" VALUES ('2206', '白山市', '22');
INSERT INTO "public"."base_city" VALUES ('2207', '松原市', '22');
INSERT INTO "public"."base_city" VALUES ('2208', '白城市', '22');
INSERT INTO "public"."base_city" VALUES ('2224', '延边朝鲜族自治州', '22');
INSERT INTO "public"."base_city" VALUES ('2301', '哈尔滨市', '23');
INSERT INTO "public"."base_city" VALUES ('2302', '齐齐哈尔市', '23');
INSERT INTO "public"."base_city" VALUES ('2303', '鸡西市', '23');
INSERT INTO "public"."base_city" VALUES ('2304', '鹤岗市', '23');
INSERT INTO "public"."base_city" VALUES ('2305', '双鸭山市', '23');
INSERT INTO "public"."base_city" VALUES ('2306', '大庆市', '23');
INSERT INTO "public"."base_city" VALUES ('2307', '伊春市', '23');
INSERT INTO "public"."base_city" VALUES ('2308', '佳木斯市', '23');
INSERT INTO "public"."base_city" VALUES ('2309', '七台河市', '23');
INSERT INTO "public"."base_city" VALUES ('2310', '牡丹江市', '23');
INSERT INTO "public"."base_city" VALUES ('2311', '黑河市', '23');
INSERT INTO "public"."base_city" VALUES ('2312', '绥化市', '23');
INSERT INTO "public"."base_city" VALUES ('2327', '大兴安岭地区', '23');
INSERT INTO "public"."base_city" VALUES ('3101', '市辖区', '31');
INSERT INTO "public"."base_city" VALUES ('3201', '南京市', '32');
INSERT INTO "public"."base_city" VALUES ('3202', '无锡市', '32');
INSERT INTO "public"."base_city" VALUES ('3203', '徐州市', '32');
INSERT INTO "public"."base_city" VALUES ('3204', '常州市', '32');
INSERT INTO "public"."base_city" VALUES ('3205', '苏州市', '32');
INSERT INTO "public"."base_city" VALUES ('3206', '南通市', '32');
INSERT INTO "public"."base_city" VALUES ('3207', '连云港市', '32');
INSERT INTO "public"."base_city" VALUES ('3208', '淮安市', '32');
INSERT INTO "public"."base_city" VALUES ('3209', '盐城市', '32');
INSERT INTO "public"."base_city" VALUES ('3210', '扬州市', '32');
INSERT INTO "public"."base_city" VALUES ('3211', '镇江市', '32');
INSERT INTO "public"."base_city" VALUES ('3212', '泰州市', '32');
INSERT INTO "public"."base_city" VALUES ('3213', '宿迁市', '32');
INSERT INTO "public"."base_city" VALUES ('3301', '杭州市', '33');
INSERT INTO "public"."base_city" VALUES ('3302', '宁波市', '33');
INSERT INTO "public"."base_city" VALUES ('3303', '温州市', '33');
INSERT INTO "public"."base_city" VALUES ('3304', '嘉兴市', '33');
INSERT INTO "public"."base_city" VALUES ('3305', '湖州市', '33');
INSERT INTO "public"."base_city" VALUES ('3306', '绍兴市', '33');
INSERT INTO "public"."base_city" VALUES ('3307', '金华市', '33');
INSERT INTO "public"."base_city" VALUES ('3308', '衢州市', '33');
INSERT INTO "public"."base_city" VALUES ('3309', '舟山市', '33');
INSERT INTO "public"."base_city" VALUES ('3310', '台州市', '33');
INSERT INTO "public"."base_city" VALUES ('3311', '丽水市', '33');
INSERT INTO "public"."base_city" VALUES ('3401', '合肥市', '34');
INSERT INTO "public"."base_city" VALUES ('3402', '芜湖市', '34');
INSERT INTO "public"."base_city" VALUES ('3403', '蚌埠市', '34');
INSERT INTO "public"."base_city" VALUES ('3404', '淮南市', '34');
INSERT INTO "public"."base_city" VALUES ('3405', '马鞍山市', '34');
INSERT INTO "public"."base_city" VALUES ('3406', '淮北市', '34');
INSERT INTO "public"."base_city" VALUES ('3407', '铜陵市', '34');
INSERT INTO "public"."base_city" VALUES ('3408', '安庆市', '34');
INSERT INTO "public"."base_city" VALUES ('3410', '黄山市', '34');
INSERT INTO "public"."base_city" VALUES ('3411', '滁州市', '34');
INSERT INTO "public"."base_city" VALUES ('3412', '阜阳市', '34');
INSERT INTO "public"."base_city" VALUES ('3413', '宿州市', '34');
INSERT INTO "public"."base_city" VALUES ('3415', '六安市', '34');
INSERT INTO "public"."base_city" VALUES ('3416', '亳州市', '34');
INSERT INTO "public"."base_city" VALUES ('3417', '池州市', '34');
INSERT INTO "public"."base_city" VALUES ('3418', '宣城市', '34');
INSERT INTO "public"."base_city" VALUES ('3501', '福州市', '35');
INSERT INTO "public"."base_city" VALUES ('3502', '厦门市', '35');
INSERT INTO "public"."base_city" VALUES ('3503', '莆田市', '35');
INSERT INTO "public"."base_city" VALUES ('3504', '三明市', '35');
INSERT INTO "public"."base_city" VALUES ('3505', '泉州市', '35');
INSERT INTO "public"."base_city" VALUES ('3506', '漳州市', '35');
INSERT INTO "public"."base_city" VALUES ('3507', '南平市', '35');
INSERT INTO "public"."base_city" VALUES ('3508', '龙岩市', '35');
INSERT INTO "public"."base_city" VALUES ('3509', '宁德市', '35');
INSERT INTO "public"."base_city" VALUES ('3601', '南昌市', '36');
INSERT INTO "public"."base_city" VALUES ('3602', '景德镇市', '36');
INSERT INTO "public"."base_city" VALUES ('3603', '萍乡市', '36');
INSERT INTO "public"."base_city" VALUES ('3604', '九江市', '36');
INSERT INTO "public"."base_city" VALUES ('3605', '新余市', '36');
INSERT INTO "public"."base_city" VALUES ('3606', '鹰潭市', '36');
INSERT INTO "public"."base_city" VALUES ('3607', '赣州市', '36');
INSERT INTO "public"."base_city" VALUES ('3608', '吉安市', '36');
INSERT INTO "public"."base_city" VALUES ('3609', '宜春市', '36');
INSERT INTO "public"."base_city" VALUES ('3610', '抚州市', '36');
INSERT INTO "public"."base_city" VALUES ('3611', '上饶市', '36');
INSERT INTO "public"."base_city" VALUES ('3701', '济南市', '37');
INSERT INTO "public"."base_city" VALUES ('3702', '青岛市', '37');
INSERT INTO "public"."base_city" VALUES ('3703', '淄博市', '37');
INSERT INTO "public"."base_city" VALUES ('3704', '枣庄市', '37');
INSERT INTO "public"."base_city" VALUES ('3705', '东营市', '37');
INSERT INTO "public"."base_city" VALUES ('3706', '烟台市', '37');
INSERT INTO "public"."base_city" VALUES ('3707', '潍坊市', '37');
INSERT INTO "public"."base_city" VALUES ('3708', '济宁市', '37');
INSERT INTO "public"."base_city" VALUES ('3709', '泰安市', '37');
INSERT INTO "public"."base_city" VALUES ('3710', '威海市', '37');
INSERT INTO "public"."base_city" VALUES ('3711', '日照市', '37');
INSERT INTO "public"."base_city" VALUES ('3713', '临沂市', '37');
INSERT INTO "public"."base_city" VALUES ('3714', '德州市', '37');
INSERT INTO "public"."base_city" VALUES ('3715', '聊城市', '37');
INSERT INTO "public"."base_city" VALUES ('3716', '滨州市', '37');
INSERT INTO "public"."base_city" VALUES ('3717', '菏泽市', '37');
INSERT INTO "public"."base_city" VALUES ('4101', '郑州市', '41');
INSERT INTO "public"."base_city" VALUES ('4102', '开封市', '41');
INSERT INTO "public"."base_city" VALUES ('4103', '洛阳市', '41');
INSERT INTO "public"."base_city" VALUES ('4104', '平顶山市', '41');
INSERT INTO "public"."base_city" VALUES ('4105', '安阳市', '41');
INSERT INTO "public"."base_city" VALUES ('4106', '鹤壁市', '41');
INSERT INTO "public"."base_city" VALUES ('4107', '新乡市', '41');
INSERT INTO "public"."base_city" VALUES ('4108', '焦作市', '41');
INSERT INTO "public"."base_city" VALUES ('4109', '濮阳市', '41');
INSERT INTO "public"."base_city" VALUES ('4110', '许昌市', '41');
INSERT INTO "public"."base_city" VALUES ('4111', '漯河市', '41');
INSERT INTO "public"."base_city" VALUES ('4112', '三门峡市', '41');
INSERT INTO "public"."base_city" VALUES ('4113', '南阳市', '41');
INSERT INTO "public"."base_city" VALUES ('4114', '商丘市', '41');
INSERT INTO "public"."base_city" VALUES ('4115', '信阳市', '41');
INSERT INTO "public"."base_city" VALUES ('4116', '周口市', '41');
INSERT INTO "public"."base_city" VALUES ('4117', '驻马店市', '41');
INSERT INTO "public"."base_city" VALUES ('4190', '省直辖县级行政区划', '41');
INSERT INTO "public"."base_city" VALUES ('4201', '武汉市', '42');
INSERT INTO "public"."base_city" VALUES ('4202', '黄石市', '42');
INSERT INTO "public"."base_city" VALUES ('4203', '十堰市', '42');
INSERT INTO "public"."base_city" VALUES ('4205', '宜昌市', '42');
INSERT INTO "public"."base_city" VALUES ('4206', '襄阳市', '42');
INSERT INTO "public"."base_city" VALUES ('4207', '鄂州市', '42');
INSERT INTO "public"."base_city" VALUES ('4208', '荆门市', '42');
INSERT INTO "public"."base_city" VALUES ('4209', '孝感市', '42');
INSERT INTO "public"."base_city" VALUES ('4210', '荆州市', '42');
INSERT INTO "public"."base_city" VALUES ('4211', '黄冈市', '42');
INSERT INTO "public"."base_city" VALUES ('4212', '咸宁市', '42');
INSERT INTO "public"."base_city" VALUES ('4213', '随州市', '42');
INSERT INTO "public"."base_city" VALUES ('4228', '恩施土家族苗族自治州', '42');
INSERT INTO "public"."base_city" VALUES ('4290', '省直辖县级行政区划', '42');
INSERT INTO "public"."base_city" VALUES ('4301', '长沙市', '43');
INSERT INTO "public"."base_city" VALUES ('4302', '株洲市', '43');
INSERT INTO "public"."base_city" VALUES ('4303', '湘潭市', '43');
INSERT INTO "public"."base_city" VALUES ('4304', '衡阳市', '43');
INSERT INTO "public"."base_city" VALUES ('4305', '邵阳市', '43');
INSERT INTO "public"."base_city" VALUES ('4306', '岳阳市', '43');
INSERT INTO "public"."base_city" VALUES ('4307', '常德市', '43');
INSERT INTO "public"."base_city" VALUES ('4308', '张家界市', '43');
INSERT INTO "public"."base_city" VALUES ('4309', '益阳市', '43');
INSERT INTO "public"."base_city" VALUES ('4310', '郴州市', '43');
INSERT INTO "public"."base_city" VALUES ('4311', '永州市', '43');
INSERT INTO "public"."base_city" VALUES ('4312', '怀化市', '43');
INSERT INTO "public"."base_city" VALUES ('4313', '娄底市', '43');
INSERT INTO "public"."base_city" VALUES ('4331', '湘西土家族苗族自治州', '43');
INSERT INTO "public"."base_city" VALUES ('4401', '广州市', '44');
INSERT INTO "public"."base_city" VALUES ('4402', '韶关市', '44');
INSERT INTO "public"."base_city" VALUES ('4403', '深圳市', '44');
INSERT INTO "public"."base_city" VALUES ('4404', '珠海市', '44');
INSERT INTO "public"."base_city" VALUES ('4405', '汕头市', '44');
INSERT INTO "public"."base_city" VALUES ('4406', '佛山市', '44');
INSERT INTO "public"."base_city" VALUES ('4407', '江门市', '44');
INSERT INTO "public"."base_city" VALUES ('4408', '湛江市', '44');
INSERT INTO "public"."base_city" VALUES ('4409', '茂名市', '44');
INSERT INTO "public"."base_city" VALUES ('4412', '肇庆市', '44');
INSERT INTO "public"."base_city" VALUES ('4413', '惠州市', '44');
INSERT INTO "public"."base_city" VALUES ('4414', '梅州市', '44');
INSERT INTO "public"."base_city" VALUES ('4415', '汕尾市', '44');
INSERT INTO "public"."base_city" VALUES ('4416', '河源市', '44');
INSERT INTO "public"."base_city" VALUES ('4417', '阳江市', '44');
INSERT INTO "public"."base_city" VALUES ('4418', '清远市', '44');
INSERT INTO "public"."base_city" VALUES ('4419', '东莞市', '44');
INSERT INTO "public"."base_city" VALUES ('4420', '中山市', '44');
INSERT INTO "public"."base_city" VALUES ('4451', '潮州市', '44');
INSERT INTO "public"."base_city" VALUES ('4452', '揭阳市', '44');
INSERT INTO "public"."base_city" VALUES ('4453', '云浮市', '44');
INSERT INTO "public"."base_city" VALUES ('4501', '南宁市', '45');
INSERT INTO "public"."base_city" VALUES ('4502', '柳州市', '45');
INSERT INTO "public"."base_city" VALUES ('4503', '桂林市', '45');
INSERT INTO "public"."base_city" VALUES ('4504', '梧州市', '45');
INSERT INTO "public"."base_city" VALUES ('4505', '北海市', '45');
INSERT INTO "public"."base_city" VALUES ('4506', '防城港市', '45');
INSERT INTO "public"."base_city" VALUES ('4507', '钦州市', '45');
INSERT INTO "public"."base_city" VALUES ('4508', '贵港市', '45');
INSERT INTO "public"."base_city" VALUES ('4509', '玉林市', '45');
INSERT INTO "public"."base_city" VALUES ('4510', '百色市', '45');
INSERT INTO "public"."base_city" VALUES ('4511', '贺州市', '45');
INSERT INTO "public"."base_city" VALUES ('4512', '河池市', '45');
INSERT INTO "public"."base_city" VALUES ('4513', '来宾市', '45');
INSERT INTO "public"."base_city" VALUES ('4514', '崇左市', '45');
INSERT INTO "public"."base_city" VALUES ('4601', '海口市', '46');
INSERT INTO "public"."base_city" VALUES ('4602', '三亚市', '46');
INSERT INTO "public"."base_city" VALUES ('4603', '三沙市', '46');
INSERT INTO "public"."base_city" VALUES ('4604', '儋州市', '46');
INSERT INTO "public"."base_city" VALUES ('4690', '省直辖县级行政区划', '46');
INSERT INTO "public"."base_city" VALUES ('5001', '市辖区', '50');
INSERT INTO "public"."base_city" VALUES ('5002', '县', '50');
INSERT INTO "public"."base_city" VALUES ('5101', '成都市', '51');
INSERT INTO "public"."base_city" VALUES ('5103', '自贡市', '51');
INSERT INTO "public"."base_city" VALUES ('5104', '攀枝花市', '51');
INSERT INTO "public"."base_city" VALUES ('5105', '泸州市', '51');
INSERT INTO "public"."base_city" VALUES ('5106', '德阳市', '51');
INSERT INTO "public"."base_city" VALUES ('5107', '绵阳市', '51');
INSERT INTO "public"."base_city" VALUES ('5108', '广元市', '51');
INSERT INTO "public"."base_city" VALUES ('5109', '遂宁市', '51');
INSERT INTO "public"."base_city" VALUES ('5110', '内江市', '51');
INSERT INTO "public"."base_city" VALUES ('5111', '乐山市', '51');
INSERT INTO "public"."base_city" VALUES ('5113', '南充市', '51');
INSERT INTO "public"."base_city" VALUES ('5114', '眉山市', '51');
INSERT INTO "public"."base_city" VALUES ('5115', '宜宾市', '51');
INSERT INTO "public"."base_city" VALUES ('5116', '广安市', '51');
INSERT INTO "public"."base_city" VALUES ('5117', '达州市', '51');
INSERT INTO "public"."base_city" VALUES ('5118', '雅安市', '51');
INSERT INTO "public"."base_city" VALUES ('5119', '巴中市', '51');
INSERT INTO "public"."base_city" VALUES ('5120', '资阳市', '51');
INSERT INTO "public"."base_city" VALUES ('5132', '阿坝藏族羌族自治州', '51');
INSERT INTO "public"."base_city" VALUES ('5133', '甘孜藏族自治州', '51');
INSERT INTO "public"."base_city" VALUES ('5134', '凉山彝族自治州', '51');
INSERT INTO "public"."base_city" VALUES ('5201', '贵阳市', '52');
INSERT INTO "public"."base_city" VALUES ('5202', '六盘水市', '52');
INSERT INTO "public"."base_city" VALUES ('5203', '遵义市', '52');
INSERT INTO "public"."base_city" VALUES ('5204', '安顺市', '52');
INSERT INTO "public"."base_city" VALUES ('5205', '毕节市', '52');
INSERT INTO "public"."base_city" VALUES ('5206', '铜仁市', '52');
INSERT INTO "public"."base_city" VALUES ('5223', '黔西南布依族苗族自治州', '52');
INSERT INTO "public"."base_city" VALUES ('5226', '黔东南苗族侗族自治州', '52');
INSERT INTO "public"."base_city" VALUES ('5227', '黔南布依族苗族自治州', '52');
INSERT INTO "public"."base_city" VALUES ('5301', '昆明市', '53');
INSERT INTO "public"."base_city" VALUES ('5303', '曲靖市', '53');
INSERT INTO "public"."base_city" VALUES ('5304', '玉溪市', '53');
INSERT INTO "public"."base_city" VALUES ('5305', '保山市', '53');
INSERT INTO "public"."base_city" VALUES ('5306', '昭通市', '53');
INSERT INTO "public"."base_city" VALUES ('5307', '丽江市', '53');
INSERT INTO "public"."base_city" VALUES ('5308', '普洱市', '53');
INSERT INTO "public"."base_city" VALUES ('5309', '临沧市', '53');
INSERT INTO "public"."base_city" VALUES ('5323', '楚雄彝族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5325', '红河哈尼族彝族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5326', '文山壮族苗族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5328', '西双版纳傣族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5329', '大理白族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5331', '德宏傣族景颇族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5333', '怒江傈僳族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5334', '迪庆藏族自治州', '53');
INSERT INTO "public"."base_city" VALUES ('5401', '拉萨市', '54');
INSERT INTO "public"."base_city" VALUES ('5402', '日喀则市', '54');
INSERT INTO "public"."base_city" VALUES ('5403', '昌都市', '54');
INSERT INTO "public"."base_city" VALUES ('5404', '林芝市', '54');
INSERT INTO "public"."base_city" VALUES ('5405', '山南市', '54');
INSERT INTO "public"."base_city" VALUES ('5406', '那曲市', '54');
INSERT INTO "public"."base_city" VALUES ('5425', '阿里地区', '54');
INSERT INTO "public"."base_city" VALUES ('6101', '西安市', '61');
INSERT INTO "public"."base_city" VALUES ('6102', '铜川市', '61');
INSERT INTO "public"."base_city" VALUES ('6103', '宝鸡市', '61');
INSERT INTO "public"."base_city" VALUES ('6104', '咸阳市', '61');
INSERT INTO "public"."base_city" VALUES ('6105', '渭南市', '61');
INSERT INTO "public"."base_city" VALUES ('6106', '延安市', '61');
INSERT INTO "public"."base_city" VALUES ('6107', '汉中市', '61');
INSERT INTO "public"."base_city" VALUES ('6108', '榆林市', '61');
INSERT INTO "public"."base_city" VALUES ('6109', '安康市', '61');
INSERT INTO "public"."base_city" VALUES ('6110', '商洛市', '61');
INSERT INTO "public"."base_city" VALUES ('6201', '兰州市', '62');
INSERT INTO "public"."base_city" VALUES ('6202', '嘉峪关市', '62');
INSERT INTO "public"."base_city" VALUES ('6203', '金昌市', '62');
INSERT INTO "public"."base_city" VALUES ('6204', '白银市', '62');
INSERT INTO "public"."base_city" VALUES ('6205', '天水市', '62');
INSERT INTO "public"."base_city" VALUES ('6206', '武威市', '62');
INSERT INTO "public"."base_city" VALUES ('6207', '张掖市', '62');
INSERT INTO "public"."base_city" VALUES ('6208', '平凉市', '62');
INSERT INTO "public"."base_city" VALUES ('6209', '酒泉市', '62');
INSERT INTO "public"."base_city" VALUES ('6210', '庆阳市', '62');
INSERT INTO "public"."base_city" VALUES ('6211', '定西市', '62');
INSERT INTO "public"."base_city" VALUES ('6212', '陇南市', '62');
INSERT INTO "public"."base_city" VALUES ('6229', '临夏回族自治州', '62');
INSERT INTO "public"."base_city" VALUES ('6230', '甘南藏族自治州', '62');
INSERT INTO "public"."base_city" VALUES ('6301', '西宁市', '63');
INSERT INTO "public"."base_city" VALUES ('6302', '海东市', '63');
INSERT INTO "public"."base_city" VALUES ('6322', '海北藏族自治州', '63');
INSERT INTO "public"."base_city" VALUES ('6323', '黄南藏族自治州', '63');
INSERT INTO "public"."base_city" VALUES ('6325', '海南藏族自治州', '63');
INSERT INTO "public"."base_city" VALUES ('6326', '果洛藏族自治州', '63');
INSERT INTO "public"."base_city" VALUES ('6327', '玉树藏族自治州', '63');
INSERT INTO "public"."base_city" VALUES ('6328', '海西蒙古族藏族自治州', '63');
INSERT INTO "public"."base_city" VALUES ('6401', '银川市', '64');
INSERT INTO "public"."base_city" VALUES ('6402', '石嘴山市', '64');
INSERT INTO "public"."base_city" VALUES ('6403', '吴忠市', '64');
INSERT INTO "public"."base_city" VALUES ('6404', '固原市', '64');
INSERT INTO "public"."base_city" VALUES ('6405', '中卫市', '64');
INSERT INTO "public"."base_city" VALUES ('6501', '乌鲁木齐市', '65');
INSERT INTO "public"."base_city" VALUES ('6502', '克拉玛依市', '65');
INSERT INTO "public"."base_city" VALUES ('6504', '吐鲁番市', '65');
INSERT INTO "public"."base_city" VALUES ('6505', '哈密市', '65');
INSERT INTO "public"."base_city" VALUES ('6523', '昌吉回族自治州', '65');
INSERT INTO "public"."base_city" VALUES ('6527', '博尔塔拉蒙古自治州', '65');
INSERT INTO "public"."base_city" VALUES ('6528', '巴音郭楞蒙古自治州', '65');
INSERT INTO "public"."base_city" VALUES ('6529', '阿克苏地区', '65');
INSERT INTO "public"."base_city" VALUES ('6530', '克孜勒苏柯尔克孜自治州', '65');
INSERT INTO "public"."base_city" VALUES ('6531', '喀什地区', '65');
INSERT INTO "public"."base_city" VALUES ('6532', '和田地区', '65');
INSERT INTO "public"."base_city" VALUES ('6540', '伊犁哈萨克自治州', '65');
INSERT INTO "public"."base_city" VALUES ('6542', '塔城地区', '65');
INSERT INTO "public"."base_city" VALUES ('6543', '阿勒泰地区', '65');
INSERT INTO "public"."base_city" VALUES ('6590', '自治区直辖县级行政区划', '65');

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_dict";
CREATE TABLE "public"."base_dict" (
  "id" int8 NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "group_tag" varchar(50) COLLATE "pg_catalog"."default",
  "code" varchar(50) COLLATE "pg_catalog"."default",
  "remark" varchar(50) COLLATE "pg_catalog"."default",
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "enable" bool,
  "deleted" bool NOT NULL
)
;
COMMENT ON COLUMN "public"."base_dict"."id" IS '主键';
COMMENT ON COLUMN "public"."base_dict"."name" IS '名称';
COMMENT ON COLUMN "public"."base_dict"."group_tag" IS '分类标签';
COMMENT ON COLUMN "public"."base_dict"."code" IS '编码';
COMMENT ON COLUMN "public"."base_dict"."remark" IS '备注';
COMMENT ON COLUMN "public"."base_dict"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."base_dict"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."base_dict"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."base_dict"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."base_dict"."version" IS '版本号';
COMMENT ON COLUMN "public"."base_dict"."enable" IS '是否启用';
COMMENT ON COLUMN "public"."base_dict"."deleted" IS '删除标志';
COMMENT ON TABLE "public"."base_dict" IS '字典表';

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO "public"."base_dict" VALUES (1810495414609829888, '123', '支付', '123', '', 0, '2024-07-09 10:05:18.884695', 1811365615815487488, '2024-08-14 19:48:05.212961', 0, 't', 't');
INSERT INTO "public"."base_dict" VALUES (1823688893108133888, '支付订单关闭类型', '支付', 'close_type', '', 1811365615815487488, '2024-08-14 19:51:29.275426', 1811365615815487488, '2024-08-14 19:51:29.277016', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823688398549360640, '支付通道', '支付', 'channel', '', 1811365615815487488, '2024-08-14 19:49:31.363417', 1811365615815487488, '2024-08-14 19:56:44.841238', 1, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823696159936946176, '证件类型', '基础信息', 'id_type', '', 1811365615815487488, '2024-08-14 20:20:21.822676', 1811365615815487488, '2024-08-14 20:20:21.824229', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823708720229117952, '签名方式', '支付', 'sign_type', '', 1811365615815487488, '2024-08-14 21:10:16.430774', 1811365615815487488, '2024-08-14 21:10:16.433984', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823928239337771008, '商户状态', '支付', 'merchant_status', '', 1811365615815487488, '2024-08-15 11:42:33.863751', 1811365615815487488, '2024-08-15 11:42:33.865868', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823928536063807488, '商户应用状态', '支付', 'mch_app_status', '', 1811365615815487488, '2024-08-15 11:43:44.608309', 1811365615815487488, '2024-08-15 11:43:44.60988', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823969170598400000, '客户通知内容类型', '支付', 'notify_content_type', '', 1811365615815487488, '2024-08-15 14:25:12.636886', 1811365615815487488, '2024-08-15 15:48:34.51576', 2, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823969966421446656, '商户消息通知类型', '支付', 'merchant_notify_type', '', 1811365615815487488, '2024-08-15 14:28:22.375016', 1811365615815487488, '2024-08-15 15:48:43.031616', 1, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1823991280205041664, '业务操作类型', '审计日志', 'log_business_type', '', 0, '2024-08-15 15:53:03.977005', 0, '2024-08-15 15:53:03.978035', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1824277928167870464, '支付订单的退款状态', '支付', 'pay_refund_status', '', 1811365615815487488, '2024-08-16 10:52:06.177341', 1811365615815487488, '2024-08-16 10:52:06.179417', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1824285303885008896, '支付方式', '支付', 'pay_method', '', 1811365615815487488, '2024-08-16 11:21:24.685429', 1811365615815487488, '2024-08-16 11:21:24.686997', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1824050661785407488, '支付订单状态', '支付', 'pay_status', '', 0, '2024-08-15 19:49:01.649012', 1811365615815487488, '2024-08-16 11:24:05.396307', 1, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1824277760341184512, '支付订单分账状态', '支付', 'pay_alloc_status', '支付订单的分账状态', 1811365615815487488, '2024-08-16 10:51:26.166066', 1811365615815487488, '2024-08-16 14:42:42.689952', 1, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1824287281285435392, '退款状态枚举', '支付', 'refund_status', '', 1811365615815487488, '2024-08-16 11:29:16.134278', 1811365615815487488, '2024-08-16 15:03:53.495862', 7, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1824342698652971008, '交易流水记录类型', '支付', 'trade_flow_type', '', 1811365615815487488, '2024-08-16 15:09:28.666504', 1811365615815487488, '2024-08-16 15:09:34.017606', 1, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1824791500966486016, '交易类型', '支付', 'trade_type', '', 1811365615815487488, '2024-08-17 20:52:51.47629', 1811365615815487488, '2024-08-17 20:52:51.532979', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1825134996013670400, '转账状态', '支付', 'transfer_status', '', 1811365615815487488, '2024-08-18 19:37:47.076212', 1811365615815487488, '2024-08-18 19:37:47.137228', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1825135068277334016, '转账接收方类型', '支付', 'transfer_payee_type', '', 1811365615815487488, '2024-08-18 19:38:04.304349', 1811365615815487488, '2024-08-18 19:38:04.306948', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1825174702763966464, '支付回调处理状态', '支付', 'callback_status', '', 1811365615815487488, '2024-08-18 22:15:33.902812', 1811365615815487488, '2024-08-18 22:15:33.90384', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1825408039604842496, '消息发送类型', '支付', 'notice_send_type', '', 1811365615815487488, '2024-08-19 13:42:45.740594', 1811365615815487488, '2024-08-19 13:42:45.742689', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1826059944274382848, '对账差异类型', '支付', 'reconcile_discrepancy_type', '', 1811365615815487488, '2024-08-21 08:53:11.927052', 1811365615815487488, '2024-08-21 08:53:11.931319', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1826061072412135424, '对账结果', '支付', 'reconcile_result', '', 1811365615815487488, '2024-08-21 08:57:40.895007', 1811365615815487488, '2024-08-21 08:57:40.897049', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1826143914542350336, '交易状态', '支付', 'trade_status', '', 1811365615815487488, '2024-08-21 14:26:52.000272', 1811365615815487488, '2024-08-21 14:26:52.005675', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1840650057641713664, '收银台类型', '支付', 'cashier_type', '', 1811365615815487488, '2024-09-30 15:09:06.025286', 1811365615815487488, '2024-09-30 15:09:06.026292', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1856210887078592512, '服务商进件类型', '支付', 'isv_apply_type', '', 1811365615815487488, '2024-11-12 13:42:16.868901', 1811365615815487488, '2024-11-12 13:42:16.868901', 0, 't', 'f');
INSERT INTO "public"."base_dict" VALUES (1856269612988506112, '服务商进件状态', '支付', 'isv_apply_status', '', 1811365615815487488, '2024-11-12 17:35:38.217929', 1811365615815487488, '2024-11-12 17:35:38.218929', 0, 't', 'f');

-- ----------------------------
-- Table structure for base_dict_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_dict_item";
CREATE TABLE "public"."base_dict_item" (
  "id" int8 NOT NULL,
  "dict_id" int8 NOT NULL,
  "dict_code" varchar(50) COLLATE "pg_catalog"."default",
  "code" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "sort_no" int4,
  "enable" bool,
  "remark" varchar(50) COLLATE "pg_catalog"."default",
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL
)
;
COMMENT ON COLUMN "public"."base_dict_item"."id" IS '主键';
COMMENT ON COLUMN "public"."base_dict_item"."dict_id" IS '字典ID';
COMMENT ON COLUMN "public"."base_dict_item"."dict_code" IS '字典编码';
COMMENT ON COLUMN "public"."base_dict_item"."code" IS '字典项编码';
COMMENT ON COLUMN "public"."base_dict_item"."name" IS '名称';
COMMENT ON COLUMN "public"."base_dict_item"."sort_no" IS '字典项排序';
COMMENT ON COLUMN "public"."base_dict_item"."enable" IS '是否启用';
COMMENT ON COLUMN "public"."base_dict_item"."remark" IS '备注';
COMMENT ON COLUMN "public"."base_dict_item"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."base_dict_item"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."base_dict_item"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."base_dict_item"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."base_dict_item"."version" IS '版本号';
COMMENT ON COLUMN "public"."base_dict_item"."deleted" IS '删除标志';
COMMENT ON TABLE "public"."base_dict_item" IS '字典项';

-- ----------------------------
-- Records of base_dict_item
-- ----------------------------
INSERT INTO "public"."base_dict_item" VALUES (1810550427952537600, 1810495414609829888, '123', 'ignore', '忽略', 0, 't', '', 0, '2024-07-09 13:43:55.081435', 1811365615815487488, '2024-08-14 19:48:01.827254', 1, 't');
INSERT INTO "public"."base_dict_item" VALUES (1824050515865571328, 1823688398549360640, 'channel', 'pay_status', '支付状态', 0, 't', '', 0, '2024-08-15 19:48:26.861144', 0, '2024-08-15 19:48:32.569552', 0, 't');
INSERT INTO "public"."base_dict_item" VALUES (1823688758965903360, 1823688398549360640, 'channel', 'union_pay', '云闪付', 5, 't', '', 1811365615815487488, '2024-08-14 19:50:57.293338', 1811365615815487488, '2024-08-14 19:50:57.294914', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823696988228100096, 1823696159936946176, 'id_type', 'IDCard', '身份证', 1, 't', '', 1811365615815487488, '2024-08-14 20:23:39.302492', 1811365615815487488, '2024-08-14 20:23:39.304061', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823697045249662976, 1823696159936946176, 'id_type', 'passport', '护照', 2, 't', '', 1811365615815487488, '2024-08-14 20:23:52.897578', 1811365615815487488, '2024-08-14 20:23:52.89914', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823697185523965952, 1823696159936946176, 'id_type', 'ForeignGreenCard', '外国人绿卡', 4, 't', '', 1811365615815487488, '2024-08-14 20:24:26.341242', 1811365615815487488, '2024-08-14 20:24:26.342281', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823697128431099904, 1823696159936946176, 'id_type', 'MilitaryID', '军人证', 3, 't', '', 1811365615815487488, '2024-08-14 20:24:12.729636', 1811365615815487488, '2024-08-14 20:24:33.016577', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823709978780364800, 1823708720229117952, 'sign_type', 'hmac_sha256', 'HMAC_SHA256', 1, 't', '', 1811365615815487488, '2024-08-14 21:15:16.491026', 1811365615815487488, '2024-08-14 21:15:16.493648', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823710019247009792, 1823708720229117952, 'sign_type', 'md5', 'MD5', 2, 't', '', 1811365615815487488, '2024-08-14 21:15:26.139263', 1811365615815487488, '2024-08-14 21:15:26.140825', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823710059575242752, 1823708720229117952, 'sign_type', 'sm3', 'SM3', 3, 't', '', 1811365615815487488, '2024-08-14 21:15:35.754963', 1811365615815487488, '2024-08-14 21:15:35.756536', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823928285231845376, 1823928239337771008, 'merchant_status', 'enable', '启用', 1, 't', '', 1811365615815487488, '2024-08-15 11:42:44.805431', 1811365615815487488, '2024-08-15 11:42:44.807006', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823928325820125184, 1823928239337771008, 'merchant_status', 'disabled', '禁用', 2, 't', '', 1811365615815487488, '2024-08-15 11:42:54.482892', 1811365615815487488, '2024-08-15 11:42:54.484445', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823928584776454144, 1823928536063807488, 'mch_app_status', 'enable', '启用', 1, 't', '', 1811365615815487488, '2024-08-15 11:43:56.222637', 1811365615815487488, '2024-08-15 11:43:56.2242', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823928622999146496, 1823928536063807488, 'mch_app_status', 'disabled', '禁用', 2, 't', '', 1811365615815487488, '2024-08-15 11:44:05.335689', 1811365615815487488, '2024-08-15 11:44:05.337294', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823969227796123648, 1823969170598400000, 'notify_content_type', 'pay', '支付订单变动通知', 1, 't', '', 1811365615815487488, '2024-08-15 14:25:26.273922', 1811365615815487488, '2024-08-15 14:25:26.276032', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823969260352311296, 1823969170598400000, 'notify_content_type', 'refund', '退款订单变动通知', 2, 't', '', 1811365615815487488, '2024-08-15 14:25:34.035515', 1811365615815487488, '2024-08-15 14:25:34.037117', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823969294699466752, 1823969170598400000, 'notify_content_type', 'transfer', '转账订单变动通知', 3, 't', '', 1811365615815487488, '2024-08-15 14:25:42.224889', 1811365615815487488, '2024-08-15 14:25:42.226456', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823970069660045312, 1823969966421446656, 'merchant_notify_type', 'none', '不启用', 0, 't', '', 1811365615815487488, '2024-08-15 14:28:46.98963', 1811365615815487488, '2024-08-15 14:28:46.991208', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823970114547486720, 1823969966421446656, 'merchant_notify_type', 'http', 'HTTP', 1, 't', '', 1811365615815487488, '2024-08-15 14:28:57.6917', 1811365615815487488, '2024-08-15 14:28:57.692751', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823970397553954816, 1823969966421446656, 'merchant_notify_type', 'websocket', 'WebSocket', 2, 't', '', 1811365615815487488, '2024-08-15 14:30:05.165149', 1811365615815487488, '2024-08-15 14:30:05.166201', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823970441921302528, 1823969966421446656, 'merchant_notify_type', 'mq', '消息队列', 3, 'f', '', 1811365615815487488, '2024-08-15 14:30:15.74388', 1811365615815487488, '2024-08-15 15:41:11.358752', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823991809660424192, 1823991280205041664, 'log_business_type', 'add', '新增', 1, 't', '', 0, '2024-08-15 15:55:10.209099', 0, '2024-08-15 15:55:10.210152', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992621597986816, 1823991280205041664, 'log_business_type', 'update', '修改', 2, 't', '', 0, '2024-08-15 15:58:23.790857', 0, '2024-08-15 15:58:34.534328', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992712492748800, 1823991280205041664, 'log_business_type', 'delete', '删除', 3, 't', '', 0, '2024-08-15 15:58:45.461362', 0, '2024-08-15 15:58:45.462464', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992755463393280, 1823991280205041664, 'log_business_type', 'grant', '授权', 4, 't', '', 0, '2024-08-15 15:58:55.70643', 0, '2024-08-15 15:58:55.707474', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992808680722432, 1823991280205041664, 'log_business_type', 'export', '导出', 5, 't', '', 0, '2024-08-15 15:59:08.394231', 0, '2024-08-15 15:59:08.395306', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992851131273216, 1823991280205041664, 'log_business_type', 'import', '导入', 6, 't', '', 0, '2024-08-15 15:59:18.515719', 0, '2024-08-15 15:59:18.516751', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992894504570880, 1823991280205041664, 'log_business_type', 'force', '强退', 7, 't', '', 0, '2024-08-15 15:59:28.856243', 0, '2024-08-15 15:59:28.857426', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992935814270976, 1823991280205041664, 'log_business_type', 'clean', '清空数据', 8, 't', '', 0, '2024-08-15 15:59:38.705444', 0, '2024-08-15 15:59:38.706503', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823992995331444736, 1823991280205041664, 'log_business_type', 'other', '其它', 9, 't', '', 0, '2024-08-15 15:59:52.895664', 0, '2024-08-15 15:59:52.896179', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823688680352063488, 1823688398549360640, 'channel', 'wechat_pay', '微信支付(直连)', 3, 't', '', 1811365615815487488, '2024-08-14 19:50:38.551335', 0, '2024-08-15 19:46:22.364663', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824277977388027904, 1824277928167870464, 'pay_refund_status', 'no_refund', '未退款', 1, 't', '', 1811365615815487488, '2024-08-16 10:52:17.912141', 1811365615815487488, '2024-08-16 10:52:17.913687', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824278014436315136, 1824277928167870464, 'pay_refund_status', 'refunding', '退款中', 2, 't', '', 1811365615815487488, '2024-08-16 10:52:26.745134', 1811365615815487488, '2024-08-16 10:52:26.746691', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824278055448219648, 1824277928167870464, 'pay_refund_status', 'partial_refund', '部分退款', 3, 't', '', 1811365615815487488, '2024-08-16 10:52:36.523227', 1811365615815487488, '2024-08-16 10:52:36.525303', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824278092886577152, 1824277928167870464, 'pay_refund_status', 'refunded', '全部退款', 4, 't', '', 1811365615815487488, '2024-08-16 10:52:45.44961', 1811365615815487488, '2024-08-16 10:52:45.451171', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824285613860851712, 1824285303885008896, 'pay_method', 'wap', 'wap支付', 1, 't', '', 1811365615815487488, '2024-08-16 11:22:38.589166', 1811365615815487488, '2024-08-16 11:22:38.591274', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824285656248487936, 1824285303885008896, 'pay_method', 'app', '应用支付', 2, 't', '', 1811365615815487488, '2024-08-16 11:22:48.695658', 1811365615815487488, '2024-08-16 11:22:48.696706', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824285688691429376, 1824285303885008896, 'pay_method', 'web', 'web支付', 3, 't', '', 1811365615815487488, '2024-08-16 11:22:56.430664', 1811365615815487488, '2024-08-16 11:22:56.431781', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824285724460453888, 1824285303885008896, 'pay_method', 'qrcode', '扫码支付', 4, 't', '', 1811365615815487488, '2024-08-16 11:23:04.958598', 1811365615815487488, '2024-08-16 11:23:04.95963', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824285781570097152, 1824285303885008896, 'pay_method', 'barcode', '付款码', 5, 't', '', 1811365615815487488, '2024-08-16 11:23:18.575096', 1811365615815487488, '2024-08-16 11:23:18.576136', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824050709768245248, 1824050661785407488, 'pay_status', 'progress', '支付中', 1, 't', '', 0, '2024-08-15 19:49:13.08964', 0, '2024-08-15 19:49:13.090167', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824050788306587648, 1824050661785407488, 'pay_status', 'close', '支付关闭', 3, 't', '', 0, '2024-08-15 19:49:31.814754', 0, '2024-08-15 19:49:31.815791', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824050865460809728, 1824050661785407488, 'pay_status', 'cancel', '支付撤销', 4, 't', '', 0, '2024-08-15 19:49:50.209986', 0, '2024-08-15 19:49:50.211016', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824287549255323648, 1824287281285435392, 'refund_status', 'close', '退款关闭', 3, 't', '', 1811365615815487488, '2024-08-16 11:30:20.023606', 1811365615815487488, '2024-08-16 11:30:20.025187', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824050750083895296, 1824050661785407488, 'pay_status', 'success', '支付成功', 2, 't', '', 0, '2024-08-15 19:49:22.701746', 1811365615815487488, '2024-08-16 11:24:17.998592', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824050900651020288, 1824050661785407488, 'pay_status', 'fail', '支付失败', 5, 't', '', 0, '2024-08-15 19:49:58.599133', 1811365615815487488, '2024-08-16 11:24:23.458659', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824050942044606464, 1824050661785407488, 'pay_status', 'timeout', '支付超时', 6, 't', '', 0, '2024-08-15 19:50:08.468537', 1811365615815487488, '2024-08-16 11:24:46.91709', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824277802141618176, 1824277760341184512, 'pay_alloc_status', 'waiting', '待分账', 0, 't', '', 1811365615815487488, '2024-08-16 10:51:36.130124', 1811365615815487488, '2024-08-16 10:51:36.132199', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824287582604234752, 1824287281285435392, 'refund_status', 'fail', '退款失败', 4, 't', '', 1811365615815487488, '2024-08-16 11:30:27.975006', 1811365615815487488, '2024-08-16 11:30:27.976048', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824277833028472832, 1824277760341184512, 'pay_alloc_status', 'allocation', '已分账', 1, 't', '', 1811365615815487488, '2024-08-16 10:51:43.494007', 1811365615815487488, '2024-08-16 10:51:43.49503', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824342766219014144, 1824342698652971008, 'trade_flow_type', 'pay', '支付', 1, 't', '', 1811365615815487488, '2024-08-16 15:09:44.773758', 1811365615815487488, '2024-08-16 15:09:44.775326', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824355204762988544, 1824342698652971008, 'trade_flow_type', 'refund', '退款', 2, 't', '', 1811365615815487488, '2024-08-16 15:59:10.355171', 1811365615815487488, '2024-08-16 15:59:10.357981', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824355244650819584, 1824342698652971008, 'trade_flow_type', 'transfer', '转账', 3, 't', '', 1811365615815487488, '2024-08-16 15:59:19.863146', 1811365615815487488, '2024-08-16 15:59:19.864715', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824287473090957312, 1824287281285435392, 'refund_status', 'progress', '退款中', 1, 't', '', 1811365615815487488, '2024-08-16 11:30:01.864717', 1811365615815487488, '2024-08-16 14:41:25.615219', 3, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824287508851593216, 1824287281285435392, 'refund_status', 'success', '退款成功', 2, 't', '', 1811365615815487488, '2024-08-16 11:30:10.390503', 1811365615815487488, '2024-08-16 14:42:12.062594', 2, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824791684567949312, 1824791500966486016, 'trade_type', 'pay', '支付', 1, 't', '', 1811365615815487488, '2024-08-17 20:53:35.248127', 1811365615815487488, '2024-08-17 20:53:35.250234', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824791718273376256, 1824791500966486016, 'trade_type', 'refund', '退款', 2, 't', '', 1811365615815487488, '2024-08-17 20:53:43.284373', 1811365615815487488, '2024-08-17 20:53:43.286467', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824791757586587648, 1824791500966486016, 'trade_type', 'transfer', '转账', 3, 't', '', 1811365615815487488, '2024-08-17 20:53:52.657076', 1811365615815487488, '2024-08-17 20:53:52.658634', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825135534352588800, 1825134996013670400, 'transfer_status', 'progress', '转账中', 1, 't', '', 1811365615815487488, '2024-08-18 19:39:55.425814', 1811365615815487488, '2024-08-18 19:39:55.426857', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825135567118491648, 1825134996013670400, 'transfer_status', 'success', '转账成功', 2, 't', '', 1811365615815487488, '2024-08-18 19:40:03.237571', 1811365615815487488, '2024-08-18 19:40:03.23965', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823688520268062720, 1823688398549360640, 'channel', 'ali_pay', '支付宝(直连)', 1, 't', '', 1811365615815487488, '2024-08-14 19:50:00.383209', 1811365615815487488, '2024-10-14 17:47:31.402133', 2, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823688722165080064, 1823688398549360640, 'channel', 'wechat_pay_isv', '微信支付(服务商)', 4, 't', '', 1811365615815487488, '2024-08-14 19:50:48.519498', 1811365615815487488, '2024-10-14 15:14:47.96673', 3, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825135606624641024, 1825134996013670400, 'transfer_status', 'close', '转账关闭', 3, 't', '', 1811365615815487488, '2024-08-18 19:40:12.656436', 1811365615815487488, '2024-08-18 19:40:12.658005', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825135653311438848, 1825134996013670400, 'transfer_status', 'fail', '转账失败', 4, 't', '', 1811365615815487488, '2024-08-18 19:40:23.787206', 1811365615815487488, '2024-08-18 19:40:23.788928', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825174775472226304, 1825174702763966464, 'callback_status', 'success', '成功', 1, 't', '', 1811365615815487488, '2024-08-18 22:15:51.237972', 1811365615815487488, '2024-08-18 22:15:51.239535', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825174809592889344, 1825174702763966464, 'callback_status', 'fail', '失败', 2, 't', '', 1811365615815487488, '2024-08-18 22:15:59.372735', 1811365615815487488, '2024-08-18 22:15:59.374281', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825174854148980736, 1825174702763966464, 'callback_status', 'ignore', '忽略', 3, 't', '', 1811365615815487488, '2024-08-18 22:16:09.995547', 1811365615815487488, '2024-08-18 22:16:09.997194', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825174898629574656, 1825174702763966464, 'callback_status', 'exception', '异常', 4, 't', '', 1811365615815487488, '2024-08-18 22:16:20.600541', 1811365615815487488, '2024-08-18 22:16:20.602111', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825174939188494336, 1825174702763966464, 'callback_status', 'not_found', '未找到', 5, 't', '', 1811365615815487488, '2024-08-18 22:16:30.270155', 1811365615815487488, '2024-08-18 22:16:30.271194', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825349495736041472, 1823688893108133888, 'close_type', 'close', '关闭', 1, 't', '', 1811365615815487488, '2024-08-19 09:50:07.795169', 1811365615815487488, '2024-08-19 09:50:07.800044', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825349620168458240, 1823688893108133888, 'close_type', 'cancel', '撤销', 2, 't', '', 1811365615815487488, '2024-08-19 09:50:37.461827', 1811365615815487488, '2024-08-19 09:50:37.463384', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825408094978043904, 1825408039604842496, 'notice_send_type', 'auto', '自动发送', 0, 't', '', 1811365615815487488, '2024-08-19 13:42:58.942888', 1811365615815487488, '2024-08-19 13:42:58.944443', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825408129895624704, 1825408039604842496, 'notice_send_type', 'manual', '手动发送', 1, 't', '', 1811365615815487488, '2024-08-19 13:43:07.267986', 1811365615815487488, '2024-08-19 13:43:07.269622', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826059984439037952, 1826059944274382848, 'reconcile_discrepancy_type', 'consistent', '一致', 1, 't', '', 1811365615815487488, '2024-08-21 08:53:21.501721', 1811365615815487488, '2024-08-21 08:53:21.503286', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826060020057067520, 1826059944274382848, 'reconcile_discrepancy_type', 'local_not_exists', '本地订单不存在', 2, 't', '', 1811365615815487488, '2024-08-21 08:53:29.993418', 1811365615815487488, '2024-08-21 08:53:29.995625', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826060059160563712, 1826059944274382848, 'reconcile_discrepancy_type', 'remote_not_exists', '远程订单不存在', 3, 't', '', 1811365615815487488, '2024-08-21 08:53:39.317457', 1811365615815487488, '2024-08-21 08:53:39.319039', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826061121699401728, 1826061072412135424, 'reconcile_result', 'consistent', '一致', 1, 't', '', 1811365615815487488, '2024-08-21 08:57:52.645403', 1811365615815487488, '2024-08-21 08:57:52.647474', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826061151613177856, 1826061072412135424, 'reconcile_result', 'inconsistent', '不一致', 0, 't', '', 1811365615815487488, '2024-08-21 08:57:59.777037', 1811365615815487488, '2024-08-21 08:57:59.779755', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826143984713056256, 1826143914542350336, 'trade_status', 'success', '成功', 1, 't', '', 1811365615815487488, '2024-08-21 14:27:08.727788', 1811365615815487488, '2024-08-21 14:27:08.730433', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826144018259099648, 1826143914542350336, 'trade_status', 'fail', '失败', 2, 't', '', 1811365615815487488, '2024-08-21 14:27:16.725384', 1811365615815487488, '2024-08-21 14:27:16.728032', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826144059224866816, 1826143914542350336, 'trade_status', 'closed', '关闭', 3, 't', '', 1811365615815487488, '2024-08-21 14:27:26.492306', 1811365615815487488, '2024-08-21 14:27:26.494438', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826144095107137536, 1826143914542350336, 'trade_status', 'revoked', '撤销', 4, 't', '', 1811365615815487488, '2024-08-21 14:27:35.047073', 1811365615815487488, '2024-08-21 14:27:35.049164', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826060094858285056, 1826059944274382848, 'reconcile_discrepancy_type', 'not_match', '订单信息不一致', 4, 't', '', 1811365615815487488, '2024-08-21 08:53:47.827207', 1811365615815487488, '2024-08-21 15:04:30.959401', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826521714671509504, 1826143914542350336, 'trade_status', 'progress', '执行中', 0, 't', '', 1811365615815487488, '2024-08-22 15:28:06.569615', 1811365615815487488, '2024-08-22 15:28:06.575032', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1826523501021388800, 1826143914542350336, 'trade_status', 'exception', '异常', 5, 't', '', 1811365615815487488, '2024-08-22 15:35:12.466889', 1811365615815487488, '2024-08-22 15:35:12.469054', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825171620147658752, 1825135068277334016, 'transfer_payee_type', 'wx_personal', 'OpenId(微信)', 1, 't', '', 1811365615815487488, '2024-08-18 22:03:18.9509', 1811365615815487488, '2024-09-18 18:37:27.985193', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825171693782859776, 1825135068277334016, 'transfer_payee_type', 'ali_open_id', 'OpenId(支付宝)', 3, 't', '', 1811365615815487488, '2024-08-18 22:03:36.505827', 1811365615815487488, '2024-09-18 18:37:42.940575', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825171656562606080, 1825135068277334016, 'transfer_payee_type', 'ali_user_id', '用户ID(支付宝)', 2, 't', '', 1811365615815487488, '2024-08-18 22:03:27.631478', 1811365615815487488, '2024-09-18 18:37:46.236105', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1825171779002728448, 1825135068277334016, 'transfer_payee_type', 'ali_login_name', '账号(支付宝)', 4, 't', '', 1811365615815487488, '2024-08-18 22:03:56.823151', 1811365615815487488, '2024-09-18 18:37:49.954338', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1840650104185905152, 1840650057641713664, 'cashier_type', 'wechat_pay', '微信收银台', 1, 't', '', 1811365615815487488, '2024-09-30 15:09:17.120403', 1811365615815487488, '2024-09-30 15:09:17.120403', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1840650136427520000, 1840650057641713664, 'cashier_type', 'alipay', '支付宝收银台', 2, 't', '', 1811365615815487488, '2024-09-30 15:09:24.807694', 1811365615815487488, '2024-09-30 15:09:24.807694', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1824285824247140352, 1824285303885008896, 'pay_method', 'jsapi', 'JSAPI', 6, 't', '', 1811365615815487488, '2024-08-16 11:23:28.74936', 1811365615815487488, '2024-09-30 15:52:13.571528', 1, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1823688577201545216, 1823688398549360640, 'channel', 'alipay_isv', '支付宝(服务商)', 2, 't', '', 1811365615815487488, '2024-08-14 19:50:13.957732', 1811365615815487488, '2024-10-14 17:47:28.448343', 3, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1856211046487310336, 1856210887078592512, 'isv_apply_type', 'face_to_face', '当面付', 0, 't', '', 1811365615815487488, '2024-11-12 13:42:54.873669', 1811365615815487488, '2024-11-12 13:42:54.873669', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1856211079995604992, 1856210887078592512, 'isv_apply_type', 'app', 'APP', 0, 't', '', 1811365615815487488, '2024-11-12 13:43:02.862935', 1811365615815487488, '2024-11-12 13:43:02.862935', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1856211121552769024, 1856210887078592512, 'isv_apply_type', 'jsapi', 'JSAPI', 0, 't', '', 1811365615815487488, '2024-11-12 13:43:12.770731', 1811365615815487488, '2024-11-12 13:43:12.770731', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1856211163747467264, 1856210887078592512, 'isv_apply_type', 'pay_auth', '预授权支付', 0, 't', '', 1811365615815487488, '2024-11-12 13:43:22.830023', 1811365615815487488, '2024-11-12 13:43:22.830023', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1856211190205136896, 1856210887078592512, 'isv_apply_type', 'wap', '手机网站支付', 0, 't', '', 1811365615815487488, '2024-11-12 13:43:29.138683', 1811365615815487488, '2024-11-12 13:43:29.138683', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1856211218642518016, 1856210887078592512, 'isv_apply_type', 'web', '电脑网站支付', 0, 't', '', 1811365615815487488, '2024-11-12 13:43:35.918305', 1811365615815487488, '2024-11-12 13:43:35.918305', 0, 'f');
INSERT INTO "public"."base_dict_item" VALUES (1856211246559805440, 1856210887078592512, 'isv_apply_type', 'order_code', '订单码支付', 0, 't', '', 1811365615815487488, '2024-11-12 13:43:42.57445', 1811365615815487488, '2024-11-12 13:43:42.57445', 0, 'f');

-- ----------------------------
-- Table structure for base_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_param";
CREATE TABLE "public"."base_param" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "key" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(20) COLLATE "pg_catalog"."default",
  "enable" bool NOT NULL,
  "internal" bool NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."base_param"."id" IS '主键';
COMMENT ON COLUMN "public"."base_param"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."base_param"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."base_param"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."base_param"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."base_param"."version" IS '版本号';
COMMENT ON COLUMN "public"."base_param"."deleted" IS '删除标志';
COMMENT ON COLUMN "public"."base_param"."name" IS '参数名称';
COMMENT ON COLUMN "public"."base_param"."key" IS '参数键名';
COMMENT ON COLUMN "public"."base_param"."value" IS '参数值';
COMMENT ON COLUMN "public"."base_param"."type" IS '参数类型';
COMMENT ON COLUMN "public"."base_param"."enable" IS '启用状态';
COMMENT ON COLUMN "public"."base_param"."internal" IS '内置参数';
COMMENT ON COLUMN "public"."base_param"."remark" IS '备注';
COMMENT ON TABLE "public"."base_param" IS '系统参数';

-- ----------------------------
-- Records of base_param
-- ----------------------------
INSERT INTO "public"."base_param" VALUES (1811338448851234812, 0, '2024-07-11 17:55:13.904818', 0, '2024-07-11 17:55:13.904818', 0, 'f', 'cs', 'cs', 'cs', NULL, 't', 'f', '124123123123123');

-- ----------------------------
-- Table structure for base_province
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_province";
CREATE TABLE "public"."base_province" (
  "code" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(30) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."base_province"."code" IS '省份编码';
COMMENT ON COLUMN "public"."base_province"."name" IS '省份名称';
COMMENT ON TABLE "public"."base_province" IS '省份表';

-- ----------------------------
-- Records of base_province
-- ----------------------------
INSERT INTO "public"."base_province" VALUES ('11', '北京市');
INSERT INTO "public"."base_province" VALUES ('12', '天津市');
INSERT INTO "public"."base_province" VALUES ('13', '河北省');
INSERT INTO "public"."base_province" VALUES ('14', '山西省');
INSERT INTO "public"."base_province" VALUES ('15', '内蒙古自治区');
INSERT INTO "public"."base_province" VALUES ('21', '辽宁省');
INSERT INTO "public"."base_province" VALUES ('22', '吉林省');
INSERT INTO "public"."base_province" VALUES ('23', '黑龙江省');
INSERT INTO "public"."base_province" VALUES ('31', '上海市');
INSERT INTO "public"."base_province" VALUES ('32', '江苏省');
INSERT INTO "public"."base_province" VALUES ('33', '浙江省');
INSERT INTO "public"."base_province" VALUES ('34', '安徽省');
INSERT INTO "public"."base_province" VALUES ('35', '福建省');
INSERT INTO "public"."base_province" VALUES ('36', '江西省');
INSERT INTO "public"."base_province" VALUES ('37', '山东省');
INSERT INTO "public"."base_province" VALUES ('41', '河南省');
INSERT INTO "public"."base_province" VALUES ('42', '湖北省');
INSERT INTO "public"."base_province" VALUES ('43', '湖南省');
INSERT INTO "public"."base_province" VALUES ('44', '广东省');
INSERT INTO "public"."base_province" VALUES ('45', '广西壮族自治区');
INSERT INTO "public"."base_province" VALUES ('46', '海南省');
INSERT INTO "public"."base_province" VALUES ('50', '重庆市');
INSERT INTO "public"."base_province" VALUES ('51', '四川省');
INSERT INTO "public"."base_province" VALUES ('52', '贵州省');
INSERT INTO "public"."base_province" VALUES ('53', '云南省');
INSERT INTO "public"."base_province" VALUES ('54', '西藏自治区');
INSERT INTO "public"."base_province" VALUES ('61', '陕西省');
INSERT INTO "public"."base_province" VALUES ('62', '甘肃省');
INSERT INTO "public"."base_province" VALUES ('63', '青海省');
INSERT INTO "public"."base_province" VALUES ('64', '宁夏回族自治区');
INSERT INTO "public"."base_province" VALUES ('65', '新疆维吾尔自治区');

-- ----------------------------
-- Table structure for base_street
-- ----------------------------
DROP TABLE IF EXISTS "public"."base_street";
CREATE TABLE "public"."base_street" (
  "code" char(9) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "area_code" char(6) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."base_street"."code" IS '编码';
COMMENT ON COLUMN "public"."base_street"."name" IS '街道名称';
COMMENT ON COLUMN "public"."base_street"."area_code" IS '县区编码';
COMMENT ON TABLE "public"."base_street" IS '街道表';

-- ----------------------------
-- Records of base_street
-- ----------------------------

-- ----------------------------
-- Table structure for iam_client
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_client";
CREATE TABLE "public"."iam_client" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "internal" bool NOT NULL,
  "remark" varchar(250) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."iam_client"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_client"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."iam_client"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."iam_client"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."iam_client"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."iam_client"."version" IS '版本号';
COMMENT ON COLUMN "public"."iam_client"."deleted" IS '删除标志';
COMMENT ON COLUMN "public"."iam_client"."code" IS '编码';
COMMENT ON COLUMN "public"."iam_client"."name" IS '名称';
COMMENT ON COLUMN "public"."iam_client"."internal" IS '是否系统内置';
COMMENT ON COLUMN "public"."iam_client"."remark" IS '备注';
COMMENT ON TABLE "public"."iam_client" IS '认证终端';

-- ----------------------------
-- Records of iam_client
-- ----------------------------
INSERT INTO "public"."iam_client" VALUES (1810614511481892864, 0, '2024-07-09 17:58:33.786446', 0, '2024-07-09 17:58:33.788447', 0, 'f', 'dax-pay-admin', '运营管理端', 't', NULL);
INSERT INTO "public"."iam_client" VALUES (1826818975183966208, 1811365615815487488, '2024-08-23 11:09:18.99642', 1811365615815487488, '2024-08-23 11:09:18.999084', 0, 'f', 'dax-pay-merchant', '商户端', 't', NULL);
INSERT INTO "public"."iam_client" VALUES (1851454654182580224, 1811365615815487488, '2024-10-30 10:42:42.58036', 1811365615815487488, '2024-10-30 10:42:42.581237', 0, 'f', 'dax-pay-isv', '服务商', 't', NULL);

-- ----------------------------
-- Table structure for iam_perm_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_perm_code";
CREATE TABLE "public"."iam_perm_code" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL,
  "pid" int8,
  "code" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "remark" varchar(300) COLLATE "pg_catalog"."default",
  "leaf" bool NOT NULL
)
;
COMMENT ON COLUMN "public"."iam_perm_code"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_perm_code"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."iam_perm_code"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."iam_perm_code"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."iam_perm_code"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."iam_perm_code"."version" IS '版本号';
COMMENT ON COLUMN "public"."iam_perm_code"."deleted" IS '删除标志';
COMMENT ON COLUMN "public"."iam_perm_code"."pid" IS '父ID';
COMMENT ON COLUMN "public"."iam_perm_code"."code" IS '权限码';
COMMENT ON COLUMN "public"."iam_perm_code"."name" IS '名称';
COMMENT ON COLUMN "public"."iam_perm_code"."remark" IS '备注';
COMMENT ON COLUMN "public"."iam_perm_code"."leaf" IS '是否为叶子结点';
COMMENT ON TABLE "public"."iam_perm_code" IS '权限码';

-- ----------------------------
-- Records of iam_perm_code
-- ----------------------------
INSERT INTO "public"."iam_perm_code" VALUES (1810962083576745984, 0, '2024-07-10 16:59:41.432418', 0, '2024-07-10 17:39:34.517162', 1, 'f', NULL, NULL, 'cc', NULL, 'f');
INSERT INTO "public"."iam_perm_code" VALUES (1810975352005840896, 0, '2024-07-10 17:52:24.870443', 0, '2024-07-10 17:52:24.870443', 0, 'f', 1810962083576745984, NULL, '测试2', '', 'f');
INSERT INTO "public"."iam_perm_code" VALUES (1810975149316100096, 0, '2024-07-10 17:51:36.545715', 0, '2024-07-10 20:20:13.130451', 1, 'f', 1810975352005840896, 'ignore', '12333', '', 't');
INSERT INTO "public"."iam_perm_code" VALUES (1812465200591761408, 1811365615815487488, '2024-07-14 20:32:32.45592', 1811365615815487488, '2024-07-14 20:32:32.459183', 0, 'f', 1810975352005840896, '123', '测试情况', '3333', 't');

-- ----------------------------
-- Table structure for iam_perm_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_perm_menu";
CREATE TABLE "public"."iam_perm_menu" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL,
  "pid" int8,
  "client_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(100) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "hidden" bool NOT NULL,
  "hide_children_menu" bool NOT NULL,
  "component" varchar(300) COLLATE "pg_catalog"."default",
  "path" varchar(300) COLLATE "pg_catalog"."default",
  "redirect" varchar(300) COLLATE "pg_catalog"."default",
  "sort_no" float4,
  "root" bool NOT NULL,
  "keep_alive" bool,
  "target_outside" bool,
  "full_screen" bool,
  "remark" varchar(200) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."iam_perm_menu"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_perm_menu"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."iam_perm_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."iam_perm_menu"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."iam_perm_menu"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."iam_perm_menu"."version" IS '版本号';
COMMENT ON COLUMN "public"."iam_perm_menu"."deleted" IS '删除标志';
COMMENT ON COLUMN "public"."iam_perm_menu"."pid" IS '父id';
COMMENT ON COLUMN "public"."iam_perm_menu"."client_code" IS '关联终端code';
COMMENT ON COLUMN "public"."iam_perm_menu"."title" IS '菜单标题';
COMMENT ON COLUMN "public"."iam_perm_menu"."name" IS '路由名称';
COMMENT ON COLUMN "public"."iam_perm_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."iam_perm_menu"."hidden" IS '是否隐藏';
COMMENT ON COLUMN "public"."iam_perm_menu"."hide_children_menu" IS '是否隐藏子菜单';
COMMENT ON COLUMN "public"."iam_perm_menu"."component" IS '组件';
COMMENT ON COLUMN "public"."iam_perm_menu"."path" IS '访问路径';
COMMENT ON COLUMN "public"."iam_perm_menu"."redirect" IS '菜单跳转地址(重定向)';
COMMENT ON COLUMN "public"."iam_perm_menu"."sort_no" IS '菜单排序';
COMMENT ON COLUMN "public"."iam_perm_menu"."root" IS '是否是一级菜单';
COMMENT ON COLUMN "public"."iam_perm_menu"."keep_alive" IS '是否缓存页面';
COMMENT ON COLUMN "public"."iam_perm_menu"."target_outside" IS '是否为外部打开';
COMMENT ON COLUMN "public"."iam_perm_menu"."full_screen" IS '是否全屏打开';
COMMENT ON COLUMN "public"."iam_perm_menu"."remark" IS '描述';
COMMENT ON TABLE "public"."iam_perm_menu" IS '菜单权限';

-- ----------------------------
-- Records of iam_perm_menu
-- ----------------------------
INSERT INTO "public"."iam_perm_menu" VALUES (1810909511121862656, 0, '2024-07-10 13:30:47.186592', 0, '2024-07-10 13:48:12.256695', 6, 'f', 1810864706127790080, 'bootx-platform', '权限管理', 'Permission', '', 'f', 'f', 'Layout', '/system/permission', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810914501286580224, 0, '2024-07-10 13:50:36.93111', 0, '2024-07-10 13:50:36.93111', 0, 'f', 1810909511121862656, 'bootx-platform', '请求权限', 'PermPathList', '', 'f', 'f', 'iam/perm/path/PermPathList', '/system/permission/path', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810915172140339200, 0, '2024-07-10 13:53:16.872895', 0, '2024-07-10 13:53:53.635198', 1, 'f', 1810909511121862656, 'bootx-platform', '权限码', 'PermCodeList', '', 'f', 'f', 'iam/perm/code/PermCodeList', '/system/permission/code', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1811336128809766912, 0, '2024-07-11 17:46:00.76599', 0, '2024-07-11 17:46:36.625626', 1, 'f', 1810910433264762880, 'bootx-platform', '系统参数', 'SystemParamList', '', 'f', 'f', '/baseapi/param/SystemParamList', '/system/config/param', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1811283778967441408, 0, '2024-07-11 14:17:59.588051', 0, '2024-07-11 17:47:27.793518', 1, 'f', 1810910433264762880, 'bootx-platform', '终端管理', 'ClientList', '', 'f', 'f', '/iam/client/ClientList', '/system/config/client', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1811283512855629824, 0, '2024-07-11 14:16:56.144236', 0, '2024-07-11 17:47:35.591847', 1, 'f', 1810910433264762880, 'bootx-platform', '数据字典', 'DictList', '', 'f', 'f', '/baseapi/dict/DictList', '/system/config/dict', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1811360392644521984, 0, '2024-07-11 19:22:25.715575', 0, '2024-07-11 19:22:25.718122', 0, 'f', 1810909853691641856, 'bootx-platform', '用户管理', 'UserList', '', 'f', 'f', '/iam/user/UserList', '/system/user/info', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1811667984159715328, 1811365615815487488, '2024-07-12 15:44:41.247497', 1811365615815487488, '2024-07-12 15:44:41.252052', 0, 'f', 1810864706127790080, 'bootx-platform', '审计日志', 'SystemLog', '', 'f', 'f', 'Layout', '/system/log', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1811671741266243584, 1811365615815487488, '2024-07-12 15:59:37.00905', 1811365615815487488, '2024-07-12 15:59:37.011126', 0, 'f', 1811667984159715328, 'bootx-platform', '登录日志', 'LoginLogList', '', 'f', 'f', '/baseapi/log/login/LoginLogList', '/system/log/login', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1811672495767007232, 1811365615815487488, '2024-07-12 16:02:36.895766', 1811365615815487488, '2024-07-12 16:35:41.627109', 1, 'f', 1811667984159715328, 'bootx-platform', '操作日志', 'OperateLogList', '', 'f', 'f', '/baseapi/log/operate/OperateLogList', '/system/log/operate', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810871795650891776, 0, '2024-07-10 11:00:55.113616', 0, '2024-07-10 11:13:07.675214', 7, 'f', 1810864706127790080, 'bootx-platform', '菜单管理', 'MenuList', '', 'f', 'f', '/iam/perm/menu/MenuList', '/system/menu', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810909853691641856, 0, '2024-07-10 13:32:08.855417', 0, '2024-07-10 13:35:45.759284', 1, 'f', 1810864706127790080, 'bootx-platform', '用户信息', 'UserAuth', '', 'f', 'f', 'Layout', '/system/user', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810910433264762880, 0, '2024-07-10 13:34:27.036666', 0, '2024-07-10 13:35:56.758501', 1, 'f', 1810864706127790080, 'bootx-platform', '系统配置', 'SystemConfig', '', 'f', 'f', 'Layout', '/system/config', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810911232921423872, 0, '2024-07-10 13:37:37.692104', 0, '2024-07-10 13:37:37.693108', 0, 'f', 1810909511121862656, 'bootx-platform', '角色管理', 'RoleList', '', 'f', 'f', 'iam/role/RoleList.vue', '/system/permission/role', '', 0, 'f', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810878374534152192, 0, '2024-07-10 11:27:03.641433', 1811365615815487488, '2024-07-13 21:16:24.212477', 5, 't', NULL, 'bootx-platform', '测试Iframe', 'Iframe', '', 't', 'f', 'Iframe', '/Iframe', 'https://www.antdv.com/components/overview-cn', 0, 't', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1810864706127790080, 0, '2024-07-10 10:32:44.838967', 1811365615815487488, '2024-07-13 21:17:09.975339', 5, 'f', NULL, 'bootx-platform', '系统管理', 'System', 'ant-design:setting-outlined', 'f', 'f', 'Layout', '/system', '', 0, 't', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1812115247342874624, 1811365615815487488, '2024-07-13 21:21:57.096469', 1811365615815487488, '2024-07-13 21:25:06.069746', 4, 'f', NULL, 'bootx-platform', '关于', '', 'ant-design:info-circle-outlined', 'f', 'f', 'Layout', '/about', '/about/index', 0, 't', 't', 'f', 'f', NULL);
INSERT INTO "public"."iam_perm_menu" VALUES (1856162201900429312, 1811365615815487488, '2024-11-12 10:28:49.417797', 1811365615815487488, '2024-11-12 10:28:49.419797', 0, 'f', 1810910433264762880, 'bootx-platform', '行政区划', 'ChinaRegion', '', 'f', 'f', '/baseapi/region/ChinaRegion', '/system/config/region', '', 0, 'f', 't', 'f', 'f', NULL);

-- ----------------------------
-- Table structure for iam_perm_path
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_perm_path";
CREATE TABLE "public"."iam_perm_path" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "parent_code" varchar(50) COLLATE "pg_catalog"."default",
  "client_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "leaf" bool NOT NULL,
  "path" varchar(200) COLLATE "pg_catalog"."default",
  "method" varchar(10) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."iam_perm_path"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_perm_path"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."iam_perm_path"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."iam_perm_path"."parent_code" IS '上级编码';
COMMENT ON COLUMN "public"."iam_perm_path"."client_code" IS '终端编码';
COMMENT ON COLUMN "public"."iam_perm_path"."code" IS '标识编码(模块、分组标识)';
COMMENT ON COLUMN "public"."iam_perm_path"."name" IS '名称(请求路径、模块、分组名称)';
COMMENT ON COLUMN "public"."iam_perm_path"."leaf" IS '叶子节点';
COMMENT ON COLUMN "public"."iam_perm_path"."path" IS '请求路径';
COMMENT ON COLUMN "public"."iam_perm_path"."method" IS '请求类型, 为全大写单词';
COMMENT ON TABLE "public"."iam_perm_path" IS '请求权限(url)';

-- ----------------------------
-- Records of iam_perm_path
-- ----------------------------
INSERT INTO "public"."iam_perm_path" VALUES (1828961024557547520, 1811365615815487488, '2024-08-29 09:01:03.364073', 'merchant', 'dax-pay-admin', '', '新增商户应用', 't', '/mch/app/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024586907648, 1811365615815487488, '2024-08-29 09:01:03.371075', 'upms', 'dax-pay-admin', '', '指定角色下的请求权限树(分配时用)', 't', '/role/path/treeByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024586907649, 1811365615815487488, '2024-08-29 09:01:03.371075', 'upms', 'dax-pay-admin', '', '根据用户ID获取到角色id集合', 't', '/user/role/findRoleIdsByUser', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024591101952, 1811365615815487488, '2024-08-29 09:01:03.372076', 'TradeSync', 'dax-pay-admin', '', '分页查询', 't', '/record/sync/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024595296256, 1811365615815487488, '2024-08-29 09:01:03.373208', 'role', 'dax-pay-admin', '', '角色下拉框', 't', '/role/dropdown', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024591101953, 1811365615815487488, '2024-08-29 09:01:03.372076', 'loginLog', 'dax-pay-admin', '', '登录日志分页', 't', '/log/login/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024595296258, 1811365615815487488, '2024-08-29 09:01:03.373712', 'upms', 'dax-pay-admin', '', '根据用户ID获取到角色集合', 't', '/user/role/findRolesByUser', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024595296257, 1811365615815487488, '2024-08-29 09:01:03.373712', 'RefundOrder', 'dax-pay-admin', '', '根据ID查询', 't', '/order/refund/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024599490560, 1811365615815487488, '2024-08-29 09:01:03.37472', 'AlipayConfig', 'dax-pay-admin', '', '获取配置', 't', '/alipay/config/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024603684864, 1811365615815487488, '2024-08-29 09:01:03.375719', 'dict', 'dax-pay-admin', '', '字典编码是否被使用', 't', '/dict/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024607879169, 1811365615815487488, '2024-08-29 09:01:03.376719', 'dict', 'dax-pay-admin', '', '添加字典项', 't', '/dict/item/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024607879168, 1811365615815487488, '2024-08-29 09:01:03.376719', 'operateLog', 'dax-pay-admin', '', '获取日志分页', 't', '/log/operate/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024607879170, 1811365615815487488, '2024-08-29 09:01:03.376719', 'MerchantNotify', 'dax-pay-admin', '', '发送订阅消息', 't', '/merchant/notice/notify/send', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024612073472, 1811365615815487488, '2024-08-29 09:01:03.377719', 'RefundOrder', 'dax-pay-admin', '', '查询金额汇总', 't', '/order/refund/getTotalAmount', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024616267777, 1811365615815487488, '2024-08-29 09:01:03.37872', 'perm', 'dax-pay-admin', '', '权限码目录树', 't', '/perm/code/catalogTree', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024616267776, 1811365615815487488, '2024-08-29 09:01:03.37872', 'RefundOrder', 'dax-pay-admin', '', '退款订单分页查询', 't', '/order/refund/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024612073473, 1811365615815487488, '2024-08-29 09:01:03.377719', 'dict', 'dax-pay-admin', '', '编码是否被使用(不包含自己)', 't', '/dict/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024616267778, 1811365615815487488, '2024-08-29 09:01:03.37872', 'role', 'dax-pay-admin', '', '名称是否被使用(不包含自己)', 't', '/role/existsByNameNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024620462080, 1811365615815487488, '2024-08-29 09:01:03.379719', 'PayOrder', 'dax-pay-admin', '', '关闭支付订单', 't', '/order/pay/close', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024620462081, 1811365615815487488, '2024-08-29 09:01:03.379719', 'dict', 'dax-pay-admin', '', '获取全部字典项', 't', '/dict/item/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024620462082, 1811365615815487488, '2024-08-29 09:01:03.379719', 'perm', 'dax-pay-admin', '', '编码是否被使用', 't', '/perm/code/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828969940737589248, 1811365615815487488, '2024-08-29 09:36:29.149339', 'TradeCallback', 'dax-pay-admin', '', '分页查询', 't', '/record/callback/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024620462083, 1811365615815487488, '2024-08-29 09:01:03.379719', 'ReconcileStatement', 'dax-pay-admin', '', '手动触发交易对账单比对', 't', '/reconcile/statement/compare', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024624656384, 1811365615815487488, '2024-08-29 09:01:03.380721', 'ReconcileDiscrepancy', 'dax-pay-admin', '', '对账差异记录分页', 't', '/reconcile/discrepancy/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024628850688, 1811365615815487488, '2024-08-29 09:01:03.381719', 'loginLog', 'dax-pay-admin', '', '清除指定天数之前的登录日志', 't', '/log/login/deleteByDay', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024624656385, 1811365615815487488, '2024-08-29 09:01:03.380721', 'TransferOrder', 'dax-pay-admin', '', '根据转账号查询', 't', '/order/transfer/findByTransferNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024628850689, 1811365615815487488, '2024-08-29 09:01:03.381719', 'MerchantCallback', 'dax-pay-admin', '', '任务详情', 't', '/merchant/notice/callback/task/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024628850690, 1811365615815487488, '2024-08-29 09:01:03.381719', 'TradeFlow', 'dax-pay-admin', '', '查询各类金额汇总', 't', '/record/flow/summary', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024633044992, 1811365615815487488, '2024-08-29 09:01:03.382718', 'MerchantNotify', 'dax-pay-admin', '', '任务详情', 't', '/merchant/notice/notify/task/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024633044993, 1811365615815487488, '2024-08-29 09:01:03.382718', 'params', 'dax-pay-admin', '', '获取单条', 't', '/system/param/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024637239296, 1811365615815487488, '2024-08-29 09:01:03.38372', 'client', 'dax-pay-admin', '', '编码是否被使用(不包含自己)', 't', '/client/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024641433600, 1811365615815487488, '2024-08-29 09:01:03.384719', 'AlipayConfig', 'dax-pay-admin', '', '新增或更新', 't', '/alipay/config/saveOrUpdate', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024645627904, 1811365615815487488, '2024-08-29 09:01:03.38572', 'user', 'dax-pay-admin', '', '修改用户', 't', '/user/admin/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024649822209, 1811365615815487488, '2024-08-29 09:01:03.386721', 'RefundOrder', 'dax-pay-admin', '', '发起退款', 't', '/order/refund/create', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024649822208, 1811365615815487488, '2024-08-29 09:01:03.386721', 'file', 'dax-pay-admin', '', '更新文件存储平台地址', 't', '/file/platform/updateUrl', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024649822210, 1811365615815487488, '2024-08-29 09:01:03.386721', 'upms', 'dax-pay-admin', '', '保存请求权限关系', 't', '/role/menu/save', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024654016513, 1811365615815487488, '2024-08-29 09:01:03.387719', 'upms', 'dax-pay-admin', '', '指定角色下的菜单权限树(分配时用)', 't', '/role/menu/treeByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024654016512, 1811365615815487488, '2024-08-29 09:01:03.387719', 'params', 'dax-pay-admin', '', '分页', 't', '/system/param/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024654016515, 1811365615815487488, '2024-08-29 09:01:03.387719', 'CloseRecord', 'dax-pay-admin', '', '查询单条', 't', '/record/close/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024654016514, 1811365615815487488, '2024-08-29 09:01:03.387719', 'user', 'dax-pay-admin', '', '根据用户id查询用户 ', 't', '/user/admin/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024658210816, 1811365615815487488, '2024-08-29 09:01:03.38872', 'ReconcileStatement', 'dax-pay-admin', '', '手动创建对账订单', 't', '/reconcile/statement/create', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024662405120, 1811365615815487488, '2024-08-29 09:01:03.389413', 'merchant', 'dax-pay-admin', '', '删除商户', 't', '/merchant/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024662405121, 1811365615815487488, '2024-08-29 09:01:03.38992', 'upms', 'dax-pay-admin', '', '指定角色下的请求权限树(分配时用)', 't', '/role/code/treeByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024662405122, 1811365615815487488, '2024-08-29 09:01:03.38992', 'dict', 'dax-pay-admin', '', '查询全部字典', 't', '/dict/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024662405123, 1811365615815487488, '2024-08-29 09:01:03.38992', 'role', 'dax-pay-admin', '', '查询所有的角色', 't', '/role/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024666599425, 1811365615815487488, '2024-08-29 09:01:03.390925', 'user', 'dax-pay-admin', '', '批量解锁用户', 't', '/user/admin/unlockBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024666599424, 1811365615815487488, '2024-08-29 09:01:03.390925', 'MerchantCallback', 'dax-pay-admin', '', '发送记录分页', 't', '/merchant/notice/callback/record/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024666599426, 1811365615815487488, '2024-08-29 09:01:03.390925', 'PayOrder', 'dax-pay-admin', '', '撤销支付订单', 't', '/order/pay/cancel', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024670793728, 1811365615815487488, '2024-08-29 09:01:03.391926', 'dict', 'dax-pay-admin', '', '删除字典项', 't', '/dict/item/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024666599427, 1811365615815487488, '2024-08-29 09:01:03.390925', 'PayOrder', 'dax-pay-admin', '', '查询订单详情', 't', '/order/pay/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828969940817281024, 1811365615815487488, '2024-08-29 09:36:29.166338', 'TradeCallback', 'dax-pay-admin', '', '查询单条', 't', '/record/callback/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024670793729, 1811365615815487488, '2024-08-29 09:01:03.391926', 'params', 'dax-pay-admin', '', '更新', 't', '/system/param/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024674988032, 1811365615815487488, '2024-08-29 09:01:03.392928', 'ReconcileStatement', 'dax-pay-admin', '', '手动上传交易对账单文件', 't', '/reconcile/statement/upload', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024670793730, 1811365615815487488, '2024-08-29 09:01:03.391926', 'perm', 'dax-pay-admin', '', '编码是否被使用(不包含自己)', 't', '/perm/code/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024679182337, 1811365615815487488, '2024-08-29 09:01:03.393927', 'perm', 'dax-pay-admin', '', '根据id查询菜单', 't', '/perm/menu/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024679182336, 1811365615815487488, '2024-08-29 09:01:03.393927', 'client', 'dax-pay-admin', '', '查询所有终端', 't', '/client/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024674988033, 1811365615815487488, '2024-08-29 09:01:03.393927', 'PayOrder', 'dax-pay-admin', '', '根据订单号查询详情', 't', '/order/pay/findByOrderNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024679182338, 1811365615815487488, '2024-08-29 09:01:03.393927', 'ReconcileStatement', 'dax-pay-admin', '', '手动触发对账文件下载', 't', '/reconcile/statement/downAndSave', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024683376640, 1811365615815487488, '2024-08-29 09:01:03.394926', 'params', 'dax-pay-admin', '', '添加', 't', '/system/param/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024683376641, 1811365615815487488, '2024-08-29 09:01:03.394926', 'upms', 'dax-pay-admin', '', '给用户分配角色', 't', '/user/role/saveAssign', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024687570945, 1811365615815487488, '2024-08-29 09:01:03.395927', 'upms', 'dax-pay-admin', '', '给用户分配角色(批量)', 't', '/user/role/saveAssignBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828994191385427968, 1811365615815487488, '2024-08-29 11:12:50.954916', 'merchant', 'dax-pay-merchant', '', '获取商户信息', 't', '/merchant/get', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024687570944, 1811365615815487488, '2024-08-29 09:01:03.395927', 'user', 'dax-pay-admin', '', '重置密码', 't', '/user/admin/restartPassword', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024687570946, 1811365615815487488, '2024-08-29 09:01:03.395927', 'loginLog', 'dax-pay-admin', '', '获取登录日志', 't', '/log/login/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024691765251, 1811365615815487488, '2024-08-29 09:01:03.396928', 'RefundOrder', 'dax-pay-admin', '', '根据商户退款号查询', 't', '/order/refund/findByRefundNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024691765250, 1811365615815487488, '2024-08-29 09:01:03.396928', 'role', 'dax-pay-admin', '', '编码是否被使用', 't', '/role/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024691765249, 1811365615815487488, '2024-08-29 09:01:03.396928', 'user', 'dax-pay-admin', '', '封禁用户', 't', '/user/admin/ban', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024691765248, 1811365615815487488, '2024-08-29 09:01:03.396928', 'PayOrder', 'dax-pay-admin', '', '分页查询', 't', '/order/pay/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024695959552, 1811365615815487488, '2024-08-29 09:01:03.397927', 'TransferOrder', 'dax-pay-admin', '', '转账关闭', 't', '/order/transfer/close', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024695959553, 1811365615815487488, '2024-08-29 09:01:03.397927', 'ReconcileStatement', 'dax-pay-admin', '', '对账单分页', 't', '/reconcile/statement/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024695959554, 1811365615815487488, '2024-08-29 09:01:03.397927', 'params', 'dax-pay-admin', '', '删除', 't', '/system/param/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024700153856, 1811365615815487488, '2024-08-29 09:01:03.398927', 'merchant', 'dax-pay-admin', '', '创建商户管理员', 't', '/merchant/createAdmin', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024700153857, 1811365615815487488, '2024-08-29 09:01:03.398927', 'merchant', 'dax-pay-admin', '', '删除商户应用', 't', '/mch/app/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024700153858, 1811365615815487488, '2024-08-29 09:01:03.398927', 'PayOrder', 'dax-pay-admin', '', '同步支付订单状态', 't', '/order/pay/sync', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024704348160, 1811365615815487488, '2024-08-29 09:01:03.399927', 'merchant', 'dax-pay-admin', '', '商户下拉列表', 't', '/merchant/dropdown', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024704348162, 1811365615815487488, '2024-08-29 09:01:03.399927', 'user', 'dax-pay-admin', '', '用户分页', 't', '/user/admin/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024704348161, 1811365615815487488, '2024-08-29 09:01:03.399927', 'WechatPayConfig', 'dax-pay-admin', '', '获取配置', 't', '/wechat/pay/config/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024708542464, 1811365615815487488, '2024-08-29 09:01:03.400927', 'TradeSync', 'dax-pay-admin', '', '查询单条', 't', '/record/sync/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024704348163, 1811365615815487488, '2024-08-29 09:01:03.399927', 'dict', 'dax-pay-admin', '', '根据主键删除字典', 't', '/dict/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024708542465, 1811365615815487488, '2024-08-29 09:01:03.400927', 'TransferOrder', 'dax-pay-admin', '', '分页查询', 't', '/order/transfer/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024708542466, 1811365615815487488, '2024-08-29 09:01:03.400927', 'TradeFlow', 'dax-pay-admin', '', '查询单条', 't', '/record/flow/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024708542467, 1811365615815487488, '2024-08-29 09:01:03.400927', 'dict', 'dax-pay-admin', '', '根据主键获取字典', 't', '/dict/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024712736768, 1811365615815487488, '2024-08-29 09:01:03.401926', 'user', 'dax-pay-admin', '', '解锁用户', 't', '/user/admin/unlock', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024712736770, 1811365615815487488, '2024-08-29 09:01:03.401926', 'dict', 'dax-pay-admin', '', '添加字典项', 't', '/dict/item/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024712736769, 1811365615815487488, '2024-08-29 09:01:03.401926', 'role', 'dax-pay-admin', '', '编码是否被使用(不包含自己)', 't', '/role/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024716931073, 1811365615815487488, '2024-08-29 09:01:03.40293', 'perm', 'dax-pay-admin', '', '权限码详情', 't', '/perm/code/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024716931072, 1811365615815487488, '2024-08-29 09:01:03.40293', 'MerchantCallback', 'dax-pay-admin', '', '发送记录详情', 't', '/merchant/notice/callback/record/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024712736772, 1811365615815487488, '2024-08-29 09:01:03.401926', 'merchant', 'dax-pay-admin', '', '根据id查询商户', 't', '/merchant/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024712736771, 1811365615815487488, '2024-08-29 09:01:03.401926', 'dict', 'dax-pay-admin', '', '更新字典', 't', '/dict/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024716931075, 1811365615815487488, '2024-08-29 09:01:03.40293', 'upms', 'dax-pay-admin', '', '查询当前角色已经选择的菜单id', 't', '/role/menu/findIdsByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024716931074, 1811365615815487488, '2024-08-29 09:01:03.40293', 'CloseRecord', 'dax-pay-admin', '', '分页查询', 't', '/record/close/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024721125376, 1811365615815487488, '2024-08-29 09:01:03.403928', 'role', 'dax-pay-admin', '', '通过ID查询角色', 't', '/role/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024721125377, 1811365615815487488, '2024-08-29 09:01:03.403928', 'user', 'dax-pay-admin', '', '添加用户', 't', '/user/admin/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024721125378, 1811365615815487488, '2024-08-29 09:01:03.403928', 'merchant', 'dax-pay-admin', '', '根据商户号查询商户应用下拉列表', 't', '/mch/app/dropdown', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024721125379, 1811365615815487488, '2024-08-29 09:01:03.403928', 'TransferOrder', 'dax-pay-admin', '', '查询单条', 't', '/order/transfer/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024725319680, 1811365615815487488, '2024-08-29 09:01:03.404928', 'MerchantNotify', 'dax-pay-admin', '', '发送记录分页', 't', '/merchant/notice/notify/record/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024725319681, 1811365615815487488, '2024-08-29 09:01:03.404928', 'MerchantNotifyConfig', 'dax-pay-admin', '', '商户消息订阅配置', 't', '/merchant/notify/config/subscribe', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024725319682, 1811365615815487488, '2024-08-29 09:01:03.404928', 'merchant', 'dax-pay-admin', '', '根据id查询商户应用', 't', '/mch/app/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024725319683, 1811365615815487488, '2024-08-29 09:01:03.404928', 'client', 'dax-pay-admin', '', '通过ID查询终端', 't', '/client/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024725319684, 1811365615815487488, '2024-08-29 09:01:03.404928', 'upms', 'dax-pay-admin', '', '查询当前角色已经选择的请求路径', 't', '/role/path/findIdsByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024729513984, 1811365615815487488, '2024-08-29 09:01:03.40593', 'RefundOrder', 'dax-pay-admin', '', '退款同步', 't', '/order/refund/sync', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024729513985, 1811365615815487488, '2024-08-29 09:01:03.40593', 'TransferOrder', 'dax-pay-admin', '', '查询金额汇总', 't', '/order/transfer/getTotalAmount', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024729513987, 1811365615815487488, '2024-08-29 09:01:03.40593', 'TransferOrder', 'dax-pay-admin', '', '转账重试', 't', '/order/transfer/retry', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024729513986, 1811365615815487488, '2024-08-29 09:01:03.40593', 'PayOrder', 'dax-pay-admin', '', '查询金额汇总', 't', '/order/pay/getTotalAmount', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024733708288, 1811365615815487488, '2024-08-29 09:01:03.40693', 'operateLog', 'dax-pay-admin', '', '操作日志分页', 't', '/log/operate/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024733708289, 1811365615815487488, '2024-08-29 09:01:03.40693', 'ReconcileStatement', 'dax-pay-admin', '', '查询对账单', 't', '/reconcile/statement/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024733708290, 1811365615815487488, '2024-08-29 09:01:03.40693', 'RefundOrder', 'dax-pay-admin', '', '退款重试', 't', '/order/refund/retry', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024733708291, 1811365615815487488, '2024-08-29 09:01:03.40693', 'PayConst', 'dax-pay-admin', '', '支付方式分页', 't', '/const/method/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024737902593, 1811365615815487488, '2024-08-29 09:01:03.407929', 'client', 'dax-pay-admin', '', '分页查询终端', 't', '/client/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024737902592, 1811365615815487488, '2024-08-29 09:01:03.407929', 'role', 'dax-pay-admin', '', '名称是否被使用', 't', '/role/existsByName', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024737902594, 1811365615815487488, '2024-08-29 09:01:03.407929', 'perm', 'dax-pay-admin', '', '获取请求权限详情', 't', '/perm/path/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024742096897, 1811365615815487488, '2024-08-29 09:01:03.408928', 'MerchantCallback', 'dax-pay-admin', '', '任务分页', 't', '/merchant/notice/callback/task/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024742096896, 1811365615815487488, '2024-08-29 09:01:03.408928', 'merchant', 'dax-pay-admin', '', '修改商户', 't', '/merchant/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024746291200, 1811365615815487488, '2024-08-29 09:01:03.409929', 'PayConst', 'dax-pay-admin', '', '支付开放接口分页', 't', '/const/api/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024746291201, 1811365615815487488, '2024-08-29 09:01:03.409929', 'PayConst', 'dax-pay-admin', '', '支付通道分页', 't', '/const/channel/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024746291202, 1811365615815487488, '2024-08-29 09:01:03.409929', 'dict', 'dax-pay-admin', '', '查询字典项', 't', '/dict/item/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024750485505, 1811365615815487488, '2024-08-29 09:01:03.410932', 'perm', 'dax-pay-admin', '', '请求权限树', 't', '/perm/path/tree', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024750485504, 1811365615815487488, '2024-08-29 09:01:03.410932', 'upms', 'dax-pay-admin', '', '保存请求权限关系', 't', '/role/code/save', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024758874112, 1811365615815487488, '2024-08-29 09:01:03.412928', 'WechatPayConfig', 'dax-pay-admin', '', '新增或更新', 't', '/wechat/pay/config/saveOrUpdate', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024763068416, 1811365615815487488, '2024-08-29 09:01:03.413926', 'user', 'dax-pay-admin', '', '批量封禁用户', 't', '/user/admin/banBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024763068417, 1811365615815487488, '2024-08-29 09:01:03.413926', 'channelConfig', 'dax-pay-admin', '', '根据应用AppId查询配置列表', 't', '/channel/config/findAllByAppId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024763068418, 1811365615815487488, '2024-08-29 09:01:03.413926', 'dict', 'dax-pay-admin', '', '查询字典项列表', 't', '/dict/item/findByDictionaryId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024763068419, 1811365615815487488, '2024-08-29 09:01:03.413926', 'TransferOrder', 'dax-pay-admin', '', '根据商户转账号查询', 't', '/order/transfer/findByBizTransferNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024767262721, 1811365615815487488, '2024-08-29 09:01:03.414926', 'dict', 'dax-pay-admin', '', '字典项编码是否被使用', 't', '/dict/item/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024767262720, 1811365615815487488, '2024-08-29 09:01:03.414926', 'params', 'dax-pay-admin', '', '判断编码是否存在(不包含自己)', 't', '/system/param/existsByKeyNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432083783680, 1811365615815487488, '2024-08-29 09:10:37.365874', 'merchant', 'dax-pay-merchant', '', '重置密码', 't', '/merchant/user/restartPassword', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432121532416, 1811365615815487488, '2024-08-29 09:10:37.372877', 'operateLog', 'dax-pay-merchant', '', '清除指定天数的操作日志', 't', '/log/operate/deleteByDay', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024767262723, 1811365615815487488, '2024-08-29 09:01:03.414926', 'file', 'dax-pay-admin', '', '设置默认存储平台地址', 't', '/file/platform/setDefault', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024767262722, 1811365615815487488, '2024-08-29 09:01:03.414926', 'dict', 'dax-pay-admin', '', '字典项编码是否被使用(不包含自己)', 't', '/dict/item/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024767262724, 1811365615815487488, '2024-08-29 09:01:03.414926', 'dict', 'dax-pay-admin', '', '字典项分页', 't', '/dict/item/pageByDictionaryId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024771457025, 1811365615815487488, '2024-08-29 09:01:03.415926', 'merchant', 'dax-pay-admin', '', '新增商户', 't', '/merchant/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024771457024, 1811365615815487488, '2024-08-29 09:01:03.415926', 'TransferOrder', 'dax-pay-admin', '', '转账同步', 't', '/order/transfer/sync', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024771457026, 1811365615815487488, '2024-08-29 09:01:03.415926', 'TradeFlow', 'dax-pay-admin', '', '分页查询', 't', '/record/flow/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024775651328, 1811365615815487488, '2024-08-29 09:01:03.416926', 'MerchantNotify', 'dax-pay-admin', '', '发送记录详情', 't', '/merchant/notice/notify/record/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024775651329, 1811365615815487488, '2024-08-29 09:01:03.416926', 'upms', 'dax-pay-admin', '', '保存角色请求权限关联关系', 't', '/role/path/save', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024775651330, 1811365615815487488, '2024-08-29 09:01:03.416926', 'upms', 'dax-pay-admin', '', '查询当前角色已经选择的菜单id', 't', '/role/code/findIdsByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024775651331, 1811365615815487488, '2024-08-29 09:01:03.416926', 'user', 'dax-pay-admin', '', '批量重置密码', 't', '/user/admin/restartPasswordBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432121532417, 1811365615815487488, '2024-08-29 09:10:37.372877', 'dict', 'dax-pay-merchant', '', '添加字典', 't', '/dict/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432125726720, 1811365615815487488, '2024-08-29 09:10:37.373875', 'PayConst', 'dax-pay-merchant', '', '商户订阅通知类型分页', 't', '/const/merchant/notify/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432125726721, 1811365615815487488, '2024-08-29 09:10:37.374876', 'MerchantCallback', 'dax-pay-merchant', '', '发送回调消息', 't', '/merchant/notice/callback/send', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432129921025, 1811365615815487488, '2024-08-29 09:10:37.374876', 'merchant', 'dax-pay-merchant', '', '商户应用分页', 't', '/mch/app/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432129921024, 1811365615815487488, '2024-08-29 09:10:37.374876', 'RefundOrder', 'dax-pay-merchant', '', '退款关闭', 't', '/order/refund/close', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432134115328, 1811365615815487488, '2024-08-29 09:10:37.375873', 'dict', 'dax-pay-merchant', '', '字典分页', 't', '/dict/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432134115330, 1811365615815487488, '2024-08-29 09:10:37.375873', 'client', 'dax-pay-merchant', '', '编码是否被使用', 't', '/client/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432134115329, 1811365615815487488, '2024-08-29 09:10:37.375873', 'MerchantNotifyConfig', 'dax-pay-merchant', '', '查询列表', 't', '/merchant/notify/config/findAllByAppId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828970327381241856, 1811365615815487488, '2024-08-29 09:38:01.331238', 'TradeCallback', 'dax-pay-merchant', '', '分页查询', 't', '/record/callback/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432176058369, 1811365615815487488, '2024-08-29 09:10:37.385873', 'ReconcileStatement', 'dax-pay-merchant', '', '手动触发交易对账单比对', 't', '/reconcile/statement/compare', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432176058370, 1811365615815487488, '2024-08-29 09:10:37.385873', 'ReconcileDiscrepancy', 'dax-pay-merchant', '', '对账差异记录分页', 't', '/reconcile/discrepancy/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432180252673, 1811365615815487488, '2024-08-29 09:10:37.386873', 'loginLog', 'dax-pay-merchant', '', '清除指定天数之前的登录日志', 't', '/log/login/deleteByDay', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432180252672, 1811365615815487488, '2024-08-29 09:10:37.386873', 'TransferOrder', 'dax-pay-merchant', '', '根据转账号查询', 't', '/order/transfer/findByTransferNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432180252674, 1811365615815487488, '2024-08-29 09:10:37.386873', 'MerchantCallback', 'dax-pay-merchant', '', '任务详情', 't', '/merchant/notice/callback/task/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432184446976, 1811365615815487488, '2024-08-29 09:10:37.387873', 'TradeFlow', 'dax-pay-merchant', '', '查询各类金额汇总', 't', '/record/flow/summary', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432184446977, 1811365615815487488, '2024-08-29 09:10:37.387873', 'MerchantNotify', 'dax-pay-merchant', '', '任务详情', 't', '/merchant/notice/notify/task/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432184446978, 1811365615815487488, '2024-08-29 09:10:37.387873', 'params', 'dax-pay-merchant', '', '获取单条', 't', '/system/param/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432184446979, 1811365615815487488, '2024-08-29 09:10:37.387873', 'client', 'dax-pay-merchant', '', '编码是否被使用(不包含自己)', 't', '/client/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432188641280, 1811365615815487488, '2024-08-29 09:10:37.388874', 'AlipayConfig', 'dax-pay-merchant', '', '新增或更新', 't', '/alipay/config/saveOrUpdate', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432192835584, 1811365615815487488, '2024-08-29 09:10:37.389875', 'user', 'dax-pay-merchant', '', '修改用户', 't', '/user/admin/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432197029889, 1811365615815487488, '2024-08-29 09:10:37.390874', 'RefundOrder', 'dax-pay-merchant', '', '发起退款', 't', '/order/refund/create', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432197029888, 1811365615815487488, '2024-08-29 09:10:37.390874', 'file', 'dax-pay-merchant', '', '更新文件存储平台地址', 't', '/file/platform/updateUrl', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432197029890, 1811365615815487488, '2024-08-29 09:10:37.390874', 'upms', 'dax-pay-merchant', '', '保存请求权限关系', 't', '/role/menu/save', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432201224193, 1811365615815487488, '2024-08-29 09:10:37.391873', 'upms', 'dax-pay-merchant', '', '指定角色下的菜单权限树(分配时用)', 't', '/role/menu/treeByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432201224192, 1811365615815487488, '2024-08-29 09:10:37.391873', 'params', 'dax-pay-merchant', '', '分页', 't', '/system/param/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432201224194, 1811365615815487488, '2024-08-29 09:10:37.391873', 'merchant', 'dax-pay-merchant', '', '用户列表', 't', '/merchant/user/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432205418497, 1811365615815487488, '2024-08-29 09:10:37.392874', 'CloseRecord', 'dax-pay-merchant', '', '查询单条', 't', '/record/close/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432205418496, 1811365615815487488, '2024-08-29 09:10:37.392874', 'user', 'dax-pay-merchant', '', '根据用户id查询用户 ', 't', '/user/admin/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432205418498, 1811365615815487488, '2024-08-29 09:10:37.392874', 'ReconcileStatement', 'dax-pay-merchant', '', '手动创建对账订单', 't', '/reconcile/statement/create', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432205418499, 1811365615815487488, '2024-08-29 09:10:37.392874', 'upms', 'dax-pay-merchant', '', '指定角色下的请求权限树(分配时用)', 't', '/role/code/treeByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432205418500, 1811365615815487488, '2024-08-29 09:10:37.392874', 'dict', 'dax-pay-merchant', '', '查询全部字典', 't', '/dict/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432209612800, 1811365615815487488, '2024-08-29 09:10:37.393874', 'role', 'dax-pay-merchant', '', '查询所有的角色', 't', '/role/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432209612802, 1811365615815487488, '2024-08-29 09:10:37.393874', 'MerchantCallback', 'dax-pay-merchant', '', '发送记录分页', 't', '/merchant/notice/callback/record/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432209612801, 1811365615815487488, '2024-08-29 09:10:37.393874', 'user', 'dax-pay-merchant', '', '批量解锁用户', 't', '/user/admin/unlockBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432209612803, 1811365615815487488, '2024-08-29 09:10:37.393874', 'PayOrder', 'dax-pay-merchant', '', '撤销支付订单', 't', '/order/pay/cancel', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432213807105, 1811365615815487488, '2024-08-29 09:10:37.394873', 'PayOrder', 'dax-pay-merchant', '', '查询订单详情', 't', '/order/pay/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432213807104, 1811365615815487488, '2024-08-29 09:10:37.394873', 'dict', 'dax-pay-merchant', '', '删除字典项', 't', '/dict/item/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828970327444156416, 1811365615815487488, '2024-08-29 09:38:01.345238', 'TradeCallback', 'dax-pay-merchant', '', '查询单条', 't', '/record/callback/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432213807106, 1811365615815487488, '2024-08-29 09:10:37.394873', 'params', 'dax-pay-merchant', '', '更新', 't', '/system/param/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432259944450, 1811365615815487488, '2024-08-29 09:10:37.405874', 'dict', 'dax-pay-merchant', '', '更新字典', 't', '/dict/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432259944449, 1811365615815487488, '2024-08-29 09:10:37.405874', 'MerchantCallback', 'dax-pay-merchant', '', '发送记录详情', 't', '/merchant/notice/callback/record/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432259944448, 1811365615815487488, '2024-08-29 09:10:37.405874', 'perm', 'dax-pay-merchant', '', '权限码详情', 't', '/perm/code/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432259944452, 1811365615815487488, '2024-08-29 09:10:37.405874', 'upms', 'dax-pay-merchant', '', '查询当前角色已经选择的菜单id', 't', '/role/menu/findIdsByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432259944451, 1811365615815487488, '2024-08-29 09:10:37.405874', 'CloseRecord', 'dax-pay-merchant', '', '分页查询', 't', '/record/close/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432264138753, 1811365615815487488, '2024-08-29 09:10:37.406874', 'merchant', 'dax-pay-merchant', '', '批量重置密码', 't', '/merchant/user/restartPasswordBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432264138752, 1811365615815487488, '2024-08-29 09:10:37.406874', 'role', 'dax-pay-merchant', '', '通过ID查询角色', 't', '/role/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432264138754, 1811365615815487488, '2024-08-29 09:10:37.406874', 'user', 'dax-pay-merchant', '', '添加用户', 't', '/user/admin/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432264138755, 1811365615815487488, '2024-08-29 09:10:37.406874', 'merchant', 'dax-pay-merchant', '', '根据商户号查询商户应用下拉列表', 't', '/mch/app/dropdown', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432268333057, 1811365615815487488, '2024-08-29 09:10:37.407873', 'merchant', 'dax-pay-merchant', '', '添加用户', 't', '/merchant/user/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432268333056, 1811365615815487488, '2024-08-29 09:10:37.407873', 'merchant', 'dax-pay-merchant', '', '根据用户id查询商户号', 't', '/merchant/user/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432268333058, 1811365615815487488, '2024-08-29 09:10:37.407873', 'TransferOrder', 'dax-pay-merchant', '', '查询单条', 't', '/order/transfer/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432268333059, 1811365615815487488, '2024-08-29 09:10:37.407873', 'MerchantNotify', 'dax-pay-merchant', '', '发送记录分页', 't', '/merchant/notice/notify/record/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432268333060, 1811365615815487488, '2024-08-29 09:10:37.407873', 'MerchantNotifyConfig', 'dax-pay-merchant', '', '商户消息订阅配置', 't', '/merchant/notify/config/subscribe', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432272527361, 1811365615815487488, '2024-08-29 09:10:37.408875', 'merchant', 'dax-pay-merchant', '', '根据id查询商户应用', 't', '/mch/app/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432272527360, 1811365615815487488, '2024-08-29 09:10:37.408875', 'merchant', 'dax-pay-merchant', '', '分配角色', 't', '/merchant/user/assignRole', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432272527362, 1811365615815487488, '2024-08-29 09:10:37.408875', 'client', 'dax-pay-merchant', '', '通过ID查询终端', 't', '/client/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432272527363, 1811365615815487488, '2024-08-29 09:10:37.409874', 'upms', 'dax-pay-merchant', '', '查询当前角色已经选择的请求路径', 't', '/role/path/findIdsByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432276721664, 1811365615815487488, '2024-08-29 09:10:37.409874', 'RefundOrder', 'dax-pay-merchant', '', '退款同步', 't', '/order/refund/sync', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432276721665, 1811365615815487488, '2024-08-29 09:10:37.409874', 'TransferOrder', 'dax-pay-merchant', '', '查询金额汇总', 't', '/order/transfer/getTotalAmount', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432280915968, 1811365615815487488, '2024-08-29 09:10:37.410873', 'merchant', 'dax-pay-merchant', '', '修改用户', 't', '/merchant/user/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432276721667, 1811365615815487488, '2024-08-29 09:10:37.409874', 'TransferOrder', 'dax-pay-merchant', '', '转账重试', 't', '/order/transfer/retry', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432276721666, 1811365615815487488, '2024-08-29 09:10:37.409874', 'PayOrder', 'dax-pay-merchant', '', '查询金额汇总', 't', '/order/pay/getTotalAmount', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432280915969, 1811365615815487488, '2024-08-29 09:10:37.410873', 'operateLog', 'dax-pay-merchant', '', '操作日志分页', 't', '/log/operate/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432280915970, 1811365615815487488, '2024-08-29 09:10:37.410873', 'ReconcileStatement', 'dax-pay-merchant', '', '查询对账单', 't', '/reconcile/statement/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432280915971, 1811365615815487488, '2024-08-29 09:10:37.410873', 'RefundOrder', 'dax-pay-merchant', '', '退款重试', 't', '/order/refund/retry', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432280915972, 1811365615815487488, '2024-08-29 09:10:37.410873', 'PayConst', 'dax-pay-merchant', '', '支付方式分页', 't', '/const/method/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432289304577, 1811365615815487488, '2024-08-29 09:10:37.412875', 'role', 'dax-pay-merchant', '', '名称是否被使用', 't', '/role/existsByName', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432289304576, 1811365615815487488, '2024-08-29 09:10:37.412875', 'merchant', 'dax-pay-merchant', '', '根据用户ID获取到角色id集合', 't', '/merchant/user/findRoleIdsByUser', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432285110272, 1811365615815487488, '2024-08-29 09:10:37.411873', 'client', 'dax-pay-merchant', '', '分页查询终端', 't', '/client/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432293498880, 1811365615815487488, '2024-08-29 09:10:37.413878', 'perm', 'dax-pay-merchant', '', '获取请求权限详情', 't', '/perm/path/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432297693184, 1811365615815487488, '2024-08-29 09:10:37.414875', 'MerchantCallback', 'dax-pay-merchant', '', '任务分页', 't', '/merchant/notice/callback/task/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432293498881, 1811365615815487488, '2024-08-29 09:10:37.414875', 'merchant', 'dax-pay-merchant', '', '修改商户信息', 't', '/merchant/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432297693185, 1811365615815487488, '2024-08-29 09:10:37.414875', 'PayConst', 'dax-pay-merchant', '', '支付开放接口分页', 't', '/const/api/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432301887488, 1811365615815487488, '2024-08-29 09:10:37.415874', 'PayConst', 'dax-pay-merchant', '', '支付通道分页', 't', '/const/channel/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432310276096, 1811365615815487488, '2024-08-29 09:10:37.417876', 'dict', 'dax-pay-merchant', '', '查询字典项', 't', '/dict/item/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432314470401, 1811365615815487488, '2024-08-29 09:10:37.418874', 'upms', 'dax-pay-merchant', '', '保存请求权限关系', 't', '/role/code/save', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432314470400, 1811365615815487488, '2024-08-29 09:10:37.418874', 'perm', 'dax-pay-merchant', '', '请求权限树', 't', '/perm/path/tree', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432314470402, 1811365615815487488, '2024-08-29 09:10:37.418874', 'WechatPayConfig', 'dax-pay-merchant', '', '新增或更新', 't', '/wechat/pay/config/saveOrUpdate', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432318664704, 1811365615815487488, '2024-08-29 09:10:37.419874', 'user', 'dax-pay-merchant', '', '批量封禁用户', 't', '/user/admin/banBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432318664705, 1811365615815487488, '2024-08-29 09:10:37.419874', 'channelConfig', 'dax-pay-merchant', '', '根据应用AppId查询配置列表', 't', '/channel/config/findAllByAppId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432318664706, 1811365615815487488, '2024-08-29 09:10:37.419874', 'dict', 'dax-pay-merchant', '', '查询字典项列表', 't', '/dict/item/findByDictionaryId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432318664707, 1811365615815487488, '2024-08-29 09:10:37.419874', 'TransferOrder', 'dax-pay-merchant', '', '根据商户转账号查询', 't', '/order/transfer/findByBizTransferNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432322859008, 1811365615815487488, '2024-08-29 09:10:37.420875', 'params', 'dax-pay-merchant', '', '判断编码是否存在(不包含自己)', 't', '/system/param/existsByKeyNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432318664708, 1811365615815487488, '2024-08-29 09:10:37.419874', 'dict', 'dax-pay-merchant', '', '字典项编码是否被使用', 't', '/dict/item/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828994192224288768, 1811365615815487488, '2024-08-29 11:12:51.152186', NULL, 'dax-pay-merchant', 'reconcile', '对账服务', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192236871680, 1811365615815487488, '2024-08-29 11:12:51.15588', NULL, 'dax-pay-merchant', 'TradeOrder', '交易订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192241065984, 1811365615815487488, '2024-08-29 11:12:51.156955', NULL, 'dax-pay-merchant', 'PayConfig', '支付配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192245260288, 1811365615815487488, '2024-08-29 11:12:51.157489', NULL, 'dax-pay-merchant', 'alipay', '支付宝支付', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192249454592, 1811365615815487488, '2024-08-29 11:12:51.158129', NULL, 'dax-pay-merchant', 'starter', 'starter模块', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192249454593, 1811365615815487488, '2024-08-29 11:12:51.158635', NULL, 'dax-pay-merchant', 'iam', '身份识别与访问管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192253648896, 1811365615815487488, '2024-08-29 11:12:51.159174', NULL, 'dax-pay-merchant', 'baseapi', '基础API', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192253648897, 1811365615815487488, '2024-08-29 11:12:51.159174', NULL, 'dax-pay-merchant', 'wechatPay', '微信支付', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192253648898, 1811365615815487488, '2024-08-29 11:12:51.159709', NULL, 'dax-pay-merchant', 'TradeRecord', '交易记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192257843200, 1811365615815487488, '2024-08-29 11:12:51.160247', NULL, 'dax-pay-merchant', 'MerchantNotice', '商户通知', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192257843201, 1811365615815487488, '2024-08-29 11:12:51.160779', 'PayConfig', 'dax-pay-merchant', 'PayConst', '支付常量', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192274620416, 1811365615815487488, '2024-08-29 11:12:51.164715', 'iam', 'dax-pay-merchant', 'role', '角色管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192278814720, 1811365615815487488, '2024-08-29 11:12:51.165724', 'iam', 'dax-pay-merchant', 'perm', '权限管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192278814721, 1811365615815487488, '2024-08-29 11:12:51.165724', 'TradeOrder', 'dax-pay-merchant', 'PayOrder', '支付订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192278814722, 1811365615815487488, '2024-08-29 11:12:51.165724', 'starter', 'dax-pay-merchant', 'loginLog', '登录日志', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192283009024, 1811365615815487488, '2024-08-29 11:12:51.166723', 'starter', 'dax-pay-merchant', 'file', '文件存储管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192283009025, 1811365615815487488, '2024-08-29 11:12:51.166723', 'MerchantNotice', 'dax-pay-merchant', 'MerchantCallback', '商户回调通知', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192283009026, 1811365615815487488, '2024-08-29 11:12:51.166723', 'iam', 'dax-pay-merchant', 'client', '终端管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192287203328, 1811365615815487488, '2024-08-29 11:12:51.167722', 'baseapi', 'dax-pay-merchant', 'dict', '字典管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192287203329, 1811365615815487488, '2024-08-29 11:12:51.167722', 'reconcile', 'dax-pay-merchant', 'ReconcileDiscrepancy', '对账差异记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192287203330, 1811365615815487488, '2024-08-29 11:12:51.167722', 'PayConfig', 'dax-pay-merchant', 'MerchantNotifyConfig', '商户通知配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192291397632, 1811365615815487488, '2024-08-29 11:12:51.168722', 'starter', 'dax-pay-merchant', 'operateLog', '操作日志', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192291397633, 1811365615815487488, '2024-08-29 11:12:51.168722', 'TradeRecord', 'dax-pay-merchant', 'TradeFlow', '交易流水记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192291397634, 1811365615815487488, '2024-08-29 11:12:51.168722', 'TradeOrder', 'dax-pay-merchant', 'RefundOrder', '退款订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192291397635, 1811365615815487488, '2024-08-29 11:12:51.168722', 'reconcile', 'dax-pay-merchant', 'ReconcileStatement', '对账单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192295591936, 1811365615815487488, '2024-08-29 11:12:51.169722', 'TradeRecord', 'dax-pay-merchant', 'TradeCallback', '交易回调记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192295591937, 1811365615815487488, '2024-08-29 11:12:51.169722', 'alipay', 'dax-pay-merchant', 'AlipayConfig', '支付宝配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192295591938, 1811365615815487488, '2024-08-29 11:12:51.169722', 'TradeRecord', 'dax-pay-merchant', 'CloseRecord', '支付关闭记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192299786240, 1811365615815487488, '2024-08-29 11:12:51.170723', 'wechatPay', 'dax-pay-merchant', 'WechatPayConfig', '微信支付配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192299786241, 1811365615815487488, '2024-08-29 11:12:51.170723', 'PayConfig', 'dax-pay-merchant', 'merchant', '商户配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192299786242, 1811365615815487488, '2024-08-29 11:12:51.170723', 'MerchantNotice', 'dax-pay-merchant', 'MerchantNotify', '商户订阅通知', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192303980544, 1811365615815487488, '2024-08-29 11:12:51.171722', 'baseapi', 'dax-pay-merchant', 'params', '系统参数', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192303980545, 1811365615815487488, '2024-08-29 11:12:51.171722', 'TradeRecord', 'dax-pay-merchant', 'TradeSync', '交易同步记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192303980546, 1811365615815487488, '2024-08-29 11:12:51.171722', 'TradeOrder', 'dax-pay-merchant', 'TransferOrder', '转账订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192308174848, 1811365615815487488, '2024-08-29 11:12:51.172722', 'PayConfig', 'dax-pay-merchant', 'channelConfig', '通道配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192308174849, 1811365615815487488, '2024-08-29 11:12:51.172722', 'iam', 'dax-pay-merchant', 'upms', '权限分配管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828994192312369152, 1811365615815487488, '2024-08-29 11:12:51.17323', 'iam', 'dax-pay-merchant', 'user', '用户管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828961024465272832, 1811365615815487488, '2024-08-29 09:01:03.345073', 'operateLog', 'dax-pay-admin', '', '清除指定天数的操作日志', 't', '/log/operate/deleteByDay', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024561741824, 1811365615815487488, '2024-08-29 09:01:03.365074', 'dict', 'dax-pay-admin', '', '添加字典', 't', '/dict/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024565936128, 1811365615815487488, '2024-08-29 09:01:03.366077', 'PayConst', 'dax-pay-admin', '', '商户订阅通知类型分页', 't', '/const/merchant/notify/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024570130432, 1811365615815487488, '2024-08-29 09:01:03.367075', 'MerchantCallback', 'dax-pay-admin', '', '发送回调消息', 't', '/merchant/notice/callback/send', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024574324736, 1811365615815487488, '2024-08-29 09:01:03.368075', 'RefundOrder', 'dax-pay-admin', '', '退款关闭', 't', '/order/refund/close', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024570130433, 1811365615815487488, '2024-08-29 09:01:03.367075', 'merchant', 'dax-pay-admin', '', '商户应用分页', 't', '/mch/app/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024578519040, 1811365615815487488, '2024-08-29 09:01:03.369077', 'dict', 'dax-pay-admin', '', '字典分页', 't', '/dict/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024578519041, 1811365615815487488, '2024-08-29 09:01:03.369077', 'merchant', 'dax-pay-admin', '', '商户分页', 't', '/merchant/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024582713344, 1811365615815487488, '2024-08-29 09:01:03.370074', 'client', 'dax-pay-admin', '', '编码是否被使用', 't', '/client/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024578519042, 1811365615815487488, '2024-08-29 09:01:03.369077', 'MerchantNotifyConfig', 'dax-pay-admin', '', '查询列表', 't', '/merchant/notify/config/findAllByAppId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024582713346, 1811365615815487488, '2024-08-29 09:01:03.370074', 'params', 'dax-pay-admin', '', '判断编码是否存在', 't', '/system/param/existsByKey', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024582713345, 1811365615815487488, '2024-08-29 09:01:03.370074', 'MerchantNotify', 'dax-pay-admin', '', '任务分页', 't', '/merchant/notice/notify/task/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024779845633, 1811365615815487488, '2024-08-29 09:01:03.417928', 'merchant', 'dax-pay-admin', '', '修改商户应用', 't', '/mch/app/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828961024779845632, 1811365615815487488, '2024-08-29 09:01:03.417928', 'ReconcileDiscrepancy', 'dax-pay-admin', '', '查询对账差异记录', 't', '/reconcile/discrepancy/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828970205423337472, 1811365615815487488, '2024-08-29 09:37:32.253966', NULL, 'dax-pay-admin', 'reconcile', '对账服务', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205435920384, 1811365615815487488, '2024-08-29 09:37:32.25658', NULL, 'dax-pay-admin', 'TradeOrder', '交易订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205435920385, 1811365615815487488, '2024-08-29 09:37:32.25658', NULL, 'dax-pay-admin', 'PayConfig', '支付配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205440114688, 1811365615815487488, '2024-08-29 09:37:32.257101', NULL, 'dax-pay-admin', 'alipay', '支付宝支付', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205440114689, 1811365615815487488, '2024-08-29 09:37:32.257618', NULL, 'dax-pay-admin', 'starter', 'starter模块', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205440114690, 1811365615815487488, '2024-08-29 09:37:32.257618', NULL, 'dax-pay-admin', 'iam', '身份识别与访问管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205444308992, 1811365615815487488, '2024-08-29 09:37:32.25814', NULL, 'dax-pay-admin', 'baseapi', '基础API', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205444308993, 1811365615815487488, '2024-08-29 09:37:32.25814', NULL, 'dax-pay-admin', 'wechatPay', '微信支付', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205444308994, 1811365615815487488, '2024-08-29 09:37:32.25814', NULL, 'dax-pay-admin', 'TradeRecord', '交易记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205444308995, 1811365615815487488, '2024-08-29 09:37:32.25814', NULL, 'dax-pay-admin', 'MerchantNotice', '商户通知', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205444308996, 1811365615815487488, '2024-08-29 09:37:32.258662', 'PayConfig', 'dax-pay-admin', 'PayConst', '支付常量', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205456891904, 1811365615815487488, '2024-08-29 09:37:32.261274', 'iam', 'dax-pay-admin', 'role', '角色管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205456891905, 1811365615815487488, '2024-08-29 09:37:32.261274', 'iam', 'dax-pay-admin', 'perm', '权限管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205456891906, 1811365615815487488, '2024-08-29 09:37:32.261805', 'TradeOrder', 'dax-pay-admin', 'PayOrder', '支付订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205456891907, 1811365615815487488, '2024-08-29 09:37:32.261805', 'starter', 'dax-pay-admin', 'loginLog', '登录日志', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205456891908, 1811365615815487488, '2024-08-29 09:37:32.261805', 'starter', 'dax-pay-admin', 'file', '文件存储管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205456891909, 1811365615815487488, '2024-08-29 09:37:32.261805', 'MerchantNotice', 'dax-pay-admin', 'MerchantCallback', '商户回调通知', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205456891910, 1811365615815487488, '2024-08-29 09:37:32.261805', 'iam', 'dax-pay-admin', 'client', '终端管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205461086208, 1811365615815487488, '2024-08-29 09:37:32.262346', 'baseapi', 'dax-pay-admin', 'dict', '字典管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205461086209, 1811365615815487488, '2024-08-29 09:37:32.262346', 'reconcile', 'dax-pay-admin', 'ReconcileDiscrepancy', '对账差异记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205461086210, 1811365615815487488, '2024-08-29 09:37:32.262346', 'PayConfig', 'dax-pay-admin', 'MerchantNotifyConfig', '商户通知配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205461086211, 1811365615815487488, '2024-08-29 09:37:32.262346', 'starter', 'dax-pay-admin', 'operateLog', '操作日志', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205461086212, 1811365615815487488, '2024-08-29 09:37:32.262862', 'TradeRecord', 'dax-pay-admin', 'TradeFlow', '交易流水记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205461086213, 1811365615815487488, '2024-08-29 09:37:32.262862', 'TradeOrder', 'dax-pay-admin', 'RefundOrder', '退款订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205465280512, 1811365615815487488, '2024-08-29 09:37:32.263105', 'reconcile', 'dax-pay-admin', 'ReconcileStatement', '对账单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205465280513, 1811365615815487488, '2024-08-29 09:37:32.263105', 'TradeRecord', 'dax-pay-admin', 'TradeCallback', '交易回调记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205465280514, 1811365615815487488, '2024-08-29 09:37:32.263105', 'alipay', 'dax-pay-admin', 'AlipayConfig', '支付宝配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205465280515, 1811365615815487488, '2024-08-29 09:37:32.263613', 'TradeRecord', 'dax-pay-admin', 'CloseRecord', '支付关闭记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205465280516, 1811365615815487488, '2024-08-29 09:37:32.263613', 'wechatPay', 'dax-pay-admin', 'WechatPayConfig', '微信支付配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205465280517, 1811365615815487488, '2024-08-29 09:37:32.263613', 'PayConfig', 'dax-pay-admin', 'merchant', '商户配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205465280518, 1811365615815487488, '2024-08-29 09:37:32.263613', 'MerchantNotice', 'dax-pay-admin', 'MerchantNotify', '商户订阅通知', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205469474816, 1811365615815487488, '2024-08-29 09:37:32.264137', 'baseapi', 'dax-pay-admin', 'params', '系统参数', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205469474817, 1811365615815487488, '2024-08-29 09:37:32.264137', 'TradeRecord', 'dax-pay-admin', 'TradeSync', '交易同步记录', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205469474818, 1811365615815487488, '2024-08-29 09:37:32.264137', 'TradeOrder', 'dax-pay-admin', 'TransferOrder', '转账订单', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205469474819, 1811365615815487488, '2024-08-29 09:37:32.264137', 'PayConfig', 'dax-pay-admin', 'channelConfig', '通道配置', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205469474820, 1811365615815487488, '2024-08-29 09:37:32.264137', 'iam', 'dax-pay-admin', 'upms', '权限分配管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828970205469474821, 1811365615815487488, '2024-08-29 09:37:32.264137', 'iam', 'dax-pay-admin', 'user', '用户管理', 'f', NULL, NULL);
INSERT INTO "public"."iam_perm_path" VALUES (1828963432138309632, 1811365615815487488, '2024-08-29 09:10:37.376874', 'params', 'dax-pay-merchant', '', '判断编码是否存在', 't', '/system/param/existsByKey', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432134115331, 1811365615815487488, '2024-08-29 09:10:37.375873', 'MerchantNotify', 'dax-pay-merchant', '', '任务分页', 't', '/merchant/notice/notify/task/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432138309633, 1811365615815487488, '2024-08-29 09:10:37.376874', 'upms', 'dax-pay-merchant', '', '指定角色下的请求权限树(分配时用)', 't', '/role/path/treeByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432138309634, 1811365615815487488, '2024-08-29 09:10:37.376874', 'upms', 'dax-pay-merchant', '', '根据用户ID获取到角色id集合', 't', '/user/role/findRoleIdsByUser', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432142503936, 1811365615815487488, '2024-08-29 09:10:37.377873', 'TradeSync', 'dax-pay-merchant', '', '分页查询', 't', '/record/sync/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432142503938, 1811365615815487488, '2024-08-29 09:10:37.377873', 'loginLog', 'dax-pay-merchant', '', '登录日志分页', 't', '/log/login/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432142503937, 1811365615815487488, '2024-08-29 09:10:37.377873', 'role', 'dax-pay-merchant', '', '角色下拉框', 't', '/role/dropdown', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432150892544, 1811365615815487488, '2024-08-29 09:10:37.379876', 'RefundOrder', 'dax-pay-merchant', '', '根据ID查询', 't', '/order/refund/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432146698240, 1811365615815487488, '2024-08-29 09:10:37.378873', 'upms', 'dax-pay-merchant', '', '根据用户ID获取到角色集合', 't', '/user/role/findRolesByUser', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432150892545, 1811365615815487488, '2024-08-29 09:10:37.379876', 'AlipayConfig', 'dax-pay-merchant', '', '获取配置', 't', '/alipay/config/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432155086848, 1811365615815487488, '2024-08-29 09:10:37.380873', 'dict', 'dax-pay-merchant', '', '字典编码是否被使用', 't', '/dict/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432159281153, 1811365615815487488, '2024-08-29 09:10:37.38188', 'dict', 'dax-pay-merchant', '', '添加字典项', 't', '/dict/item/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432159281152, 1811365615815487488, '2024-08-29 09:10:37.38188', 'operateLog', 'dax-pay-merchant', '', '获取日志分页', 't', '/log/operate/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432163475456, 1811365615815487488, '2024-08-29 09:10:37.382874', 'MerchantNotify', 'dax-pay-merchant', '', '发送订阅消息', 't', '/merchant/notice/notify/send', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432163475457, 1811365615815487488, '2024-08-29 09:10:37.382874', 'RefundOrder', 'dax-pay-merchant', '', '查询金额汇总', 't', '/order/refund/getTotalAmount', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432167669761, 1811365615815487488, '2024-08-29 09:10:37.383876', 'RefundOrder', 'dax-pay-merchant', '', '退款订单分页查询', 't', '/order/refund/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432167669760, 1811365615815487488, '2024-08-29 09:10:37.383876', 'perm', 'dax-pay-merchant', '', '权限码目录树', 't', '/perm/code/catalogTree', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432163475458, 1811365615815487488, '2024-08-29 09:10:37.382874', 'dict', 'dax-pay-merchant', '', '编码是否被使用(不包含自己)', 't', '/dict/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432171864064, 1811365615815487488, '2024-08-29 09:10:37.384874', 'role', 'dax-pay-merchant', '', '名称是否被使用(不包含自己)', 't', '/role/existsByNameNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432171864065, 1811365615815487488, '2024-08-29 09:10:37.384874', 'PayOrder', 'dax-pay-merchant', '', '关闭支付订单', 't', '/order/pay/close', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432171864066, 1811365615815487488, '2024-08-29 09:10:37.384874', 'dict', 'dax-pay-merchant', '', '获取全部字典项', 't', '/dict/item/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432176058368, 1811365615815487488, '2024-08-29 09:10:37.385873', 'perm', 'dax-pay-merchant', '', '编码是否被使用', 't', '/perm/code/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432322859009, 1811365615815487488, '2024-08-29 09:10:37.420875', 'merchant', 'dax-pay-merchant', '', '根据用户ID获取到角色集合', 't', '/merchant/user/findRolesByUser', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432322859011, 1811365615815487488, '2024-08-29 09:10:37.420875', 'dict', 'dax-pay-merchant', '', '字典项编码是否被使用(不包含自己)', 't', '/dict/item/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432322859010, 1811365615815487488, '2024-08-29 09:10:37.420875', 'file', 'dax-pay-merchant', '', '设置默认存储平台地址', 't', '/file/platform/setDefault', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432322859012, 1811365615815487488, '2024-08-29 09:10:37.420875', 'dict', 'dax-pay-merchant', '', '字典项分页', 't', '/dict/item/pageByDictionaryId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432322859013, 1811365615815487488, '2024-08-29 09:10:37.420875', 'TransferOrder', 'dax-pay-merchant', '', '转账同步', 't', '/order/transfer/sync', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432327053312, 1811365615815487488, '2024-08-29 09:10:37.421873', 'TradeFlow', 'dax-pay-merchant', '', '分页查询', 't', '/record/flow/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432327053313, 1811365615815487488, '2024-08-29 09:10:37.421873', 'MerchantNotify', 'dax-pay-merchant', '', '发送记录详情', 't', '/merchant/notice/notify/record/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432327053314, 1811365615815487488, '2024-08-29 09:10:37.421873', 'upms', 'dax-pay-merchant', '', '保存角色请求权限关联关系', 't', '/role/path/save', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432327053315, 1811365615815487488, '2024-08-29 09:10:37.421873', 'upms', 'dax-pay-merchant', '', '查询当前角色已经选择的菜单id', 't', '/role/code/findIdsByRole', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432327053316, 1811365615815487488, '2024-08-29 09:10:37.421873', 'user', 'dax-pay-merchant', '', '批量重置密码', 't', '/user/admin/restartPasswordBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432331247617, 1811365615815487488, '2024-08-29 09:10:37.422873', 'ReconcileDiscrepancy', 'dax-pay-merchant', '', '查询对账差异记录', 't', '/reconcile/discrepancy/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432331247616, 1811365615815487488, '2024-08-29 09:10:37.422873', 'merchant', 'dax-pay-merchant', '', '修改商户应用', 't', '/mch/app/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432222195712, 1811365615815487488, '2024-08-29 09:10:37.396878', 'perm', 'dax-pay-merchant', '', '编码是否被使用(不包含自己)', 't', '/perm/code/existsByCodeNotId', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432218001408, 1811365615815487488, '2024-08-29 09:10:37.395874', 'ReconcileStatement', 'dax-pay-merchant', '', '手动上传交易对账单文件', 't', '/reconcile/statement/upload', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432226390017, 1811365615815487488, '2024-08-29 09:10:37.397873', 'perm', 'dax-pay-merchant', '', '根据id查询菜单', 't', '/perm/menu/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432226390016, 1811365615815487488, '2024-08-29 09:10:37.397873', 'client', 'dax-pay-merchant', '', '查询所有终端', 't', '/client/findAll', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432222195713, 1811365615815487488, '2024-08-29 09:10:37.396878', 'PayOrder', 'dax-pay-merchant', '', '根据订单号查询详情', 't', '/order/pay/findByOrderNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432226390018, 1811365615815487488, '2024-08-29 09:10:37.397873', 'ReconcileStatement', 'dax-pay-merchant', '', '手动触发对账文件下载', 't', '/reconcile/statement/downAndSave', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432226390019, 1811365615815487488, '2024-08-29 09:10:37.397873', 'params', 'dax-pay-merchant', '', '添加', 't', '/system/param/add', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432230584320, 1811365615815487488, '2024-08-29 09:10:37.398873', 'upms', 'dax-pay-merchant', '', '给用户分配角色', 't', '/user/role/saveAssign', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432230584322, 1811365615815487488, '2024-08-29 09:10:37.398873', 'user', 'dax-pay-merchant', '', '重置密码', 't', '/user/admin/restartPassword', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432230584321, 1811365615815487488, '2024-08-29 09:10:37.398873', 'upms', 'dax-pay-merchant', '', '给用户分配角色(批量)', 't', '/user/role/saveAssignBatch', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432234778624, 1811365615815487488, '2024-08-29 09:10:37.399874', 'loginLog', 'dax-pay-merchant', '', '获取登录日志', 't', '/log/login/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432238972928, 1811365615815487488, '2024-08-29 09:10:37.400875', 'role', 'dax-pay-merchant', '', '编码是否被使用', 't', '/role/existsByCode', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432234778627, 1811365615815487488, '2024-08-29 09:10:37.399874', 'PayOrder', 'dax-pay-merchant', '', '分页查询', 't', '/order/pay/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432234778626, 1811365615815487488, '2024-08-29 09:10:37.399874', 'RefundOrder', 'dax-pay-merchant', '', '根据商户退款号查询', 't', '/order/refund/findByRefundNo', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432234778625, 1811365615815487488, '2024-08-29 09:10:37.399874', 'user', 'dax-pay-merchant', '', '封禁用户', 't', '/user/admin/ban', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432238972929, 1811365615815487488, '2024-08-29 09:10:37.400875', 'TransferOrder', 'dax-pay-merchant', '', '转账关闭', 't', '/order/transfer/close', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432238972930, 1811365615815487488, '2024-08-29 09:10:37.400875', 'ReconcileStatement', 'dax-pay-merchant', '', '对账单分页', 't', '/reconcile/statement/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432243167232, 1811365615815487488, '2024-08-29 09:10:37.401873', 'params', 'dax-pay-merchant', '', '删除', 't', '/system/param/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432243167233, 1811365615815487488, '2024-08-29 09:10:37.401873', 'merchant', 'dax-pay-merchant', '', '删除商户应用', 't', '/mch/app/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432243167234, 1811365615815487488, '2024-08-29 09:10:37.401873', 'PayOrder', 'dax-pay-merchant', '', '同步支付订单状态', 't', '/order/pay/sync', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432243167235, 1811365615815487488, '2024-08-29 09:10:37.401873', 'merchant', 'dax-pay-merchant', '', '商户下拉列表', 't', '/merchant/dropdown', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432247361537, 1811365615815487488, '2024-08-29 09:10:37.402873', 'user', 'dax-pay-merchant', '', '用户分页', 't', '/user/admin/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432247361536, 1811365615815487488, '2024-08-29 09:10:37.402873', 'WechatPayConfig', 'dax-pay-merchant', '', '获取配置', 't', '/wechat/pay/config/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432251555840, 1811365615815487488, '2024-08-29 09:10:37.403874', 'dict', 'dax-pay-merchant', '', '根据主键删除字典', 't', '/dict/delete', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432247361538, 1811365615815487488, '2024-08-29 09:10:37.403874', 'TradeSync', 'dax-pay-merchant', '', '查询单条', 't', '/record/sync/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432251555841, 1811365615815487488, '2024-08-29 09:10:37.403874', 'TransferOrder', 'dax-pay-merchant', '', '分页查询', 't', '/order/transfer/page', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432251555842, 1811365615815487488, '2024-08-29 09:10:37.403874', 'TradeFlow', 'dax-pay-merchant', '', '查询单条', 't', '/record/flow/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432255750144, 1811365615815487488, '2024-08-29 09:10:37.404874', 'dict', 'dax-pay-merchant', '', '根据主键获取字典', 't', '/dict/findById', 'GET');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432255750145, 1811365615815487488, '2024-08-29 09:10:37.404874', 'user', 'dax-pay-merchant', '', '解锁用户', 't', '/user/admin/unlock', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432255750147, 1811365615815487488, '2024-08-29 09:10:37.404874', 'dict', 'dax-pay-merchant', '', '添加字典项', 't', '/dict/item/update', 'POST');
INSERT INTO "public"."iam_perm_path" VALUES (1828963432255750146, 1811365615815487488, '2024-08-29 09:10:37.404874', 'role', 'dax-pay-merchant', '', '编码是否被使用(不包含自己)', 't', '/role/existsByCodeNotId', 'GET');

-- ----------------------------
-- Table structure for iam_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_role";
CREATE TABLE "public"."iam_role" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL,
  "pid" int8,
  "code" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "internal" bool,
  "remark" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."iam_role"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_role"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."iam_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."iam_role"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."iam_role"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."iam_role"."version" IS '版本号';
COMMENT ON COLUMN "public"."iam_role"."deleted" IS '删除标志';
COMMENT ON COLUMN "public"."iam_role"."pid" IS '父级Id';
COMMENT ON COLUMN "public"."iam_role"."code" IS '编码';
COMMENT ON COLUMN "public"."iam_role"."name" IS '名称';
COMMENT ON COLUMN "public"."iam_role"."internal" IS '是否系统内置';
COMMENT ON COLUMN "public"."iam_role"."remark" IS '备注';
COMMENT ON TABLE "public"."iam_role" IS '角色';

-- ----------------------------
-- Records of iam_role
-- ----------------------------
INSERT INTO "public"."iam_role" VALUES (1810203792869191680, 0, '2024-07-08 14:46:30.838451', 0, '2024-07-08 14:46:30.838451', 0, 'f', NULL, 'admin', '管理员', 'f', '');
INSERT INTO "public"."iam_role" VALUES (1810205411434328064, 0, '2024-07-08 14:52:56.733609', 0, '2024-07-08 14:52:56.73413', 0, 'f', 1810203792869191680, 'test', '测试角色', 'f', '');
INSERT INTO "public"."iam_role" VALUES (1810208169436672000, 0, '2024-07-08 15:03:54.292843', 0, '2024-07-08 15:03:54.292843', 0, 'f', 1810205411434328064, 'test2', '测试三级角色', 'f', '');
INSERT INTO "public"."iam_role" VALUES (1810593423368630272, 0, '2024-07-09 16:34:45.989417', 0, '2024-07-09 16:34:45.992422', 0, 'f', NULL, 'cancel', '忽略分账', 'f', '12333');
INSERT INTO "public"."iam_role" VALUES (1810593451453689856, 0, '2024-07-09 16:34:52.683651', 0, '2024-07-09 16:34:52.68418', 0, 'f', 1810593423368630272, '1123', '3322', 'f', '2223');
INSERT INTO "public"."iam_role" VALUES (1826818640033910784, 1811365615815487488, '2024-08-23 11:07:59.093723', 1811365615815487488, '2024-08-23 11:07:59.096792', 0, 'f', NULL, 'merchant_admin', '商户系统管理员', 't', '商户系统的管理员');
INSERT INTO "public"."iam_role" VALUES (1828680591068422144, 1827910922934001664, '2024-08-28 14:26:42.813', 1827910922934001664, '2024-08-28 14:26:42.814504', 0, 'f', 1826818640033910784, 'cs1', '商户子管理员', 'f', '');
INSERT INTO "public"."iam_role" VALUES (1851499232814161920, 1811365615815487488, '2024-10-30 13:39:50.952637', 1811365615815487488, '2024-10-30 13:39:50.952637', 0, 'f', NULL, 'isv_admin', '服务商管理员', 'f', '');

-- ----------------------------
-- Table structure for iam_role_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_role_code";
CREATE TABLE "public"."iam_role_code" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "code_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."iam_role_code"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_role_code"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."iam_role_code"."code_id" IS '权限码';
COMMENT ON TABLE "public"."iam_role_code" IS '角色权限码关联关系';

-- ----------------------------
-- Records of iam_role_code
-- ----------------------------
INSERT INTO "public"."iam_role_code" VALUES (1812476422410076160, 1810203792869191680, 1810975149316100096);
INSERT INTO "public"."iam_role_code" VALUES (1812476422632374272, 1810208169436672000, 1812476422410076160);
INSERT INTO "public"."iam_role_code" VALUES (1812476422649151488, 1810205411434328064, 1812476422410076160);

-- ----------------------------
-- Table structure for iam_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_role_menu";
CREATE TABLE "public"."iam_role_menu" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "client_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "menu_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."iam_role_menu"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_role_menu"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."iam_role_menu"."client_code" IS '终端编码';
COMMENT ON COLUMN "public"."iam_role_menu"."menu_id" IS '菜单id';
COMMENT ON TABLE "public"."iam_role_menu" IS '角色菜单关联关系';

-- ----------------------------
-- Records of iam_role_menu
-- ----------------------------
INSERT INTO "public"."iam_role_menu" VALUES (1810924664856924160, 1810203792869191680, 'dax-pay-admin', 1810910433264762880);
INSERT INTO "public"."iam_role_menu" VALUES (1810924664974364672, 1810208169436672000, 'dax-pay-admin', 1810910433264762880);
INSERT INTO "public"."iam_role_menu" VALUES (1810924664974364673, 1810205411434328064, 'dax-pay-admin', 1810910433264762880);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727792455680, 1810203792869191680, 'dax-pay-admin', 1810909853691641856);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727800844288, 1810203792869191680, 'dax-pay-admin', 1810871795650891776);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727800844289, 1810203792869191680, 'dax-pay-admin', 1810915172140339200);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727846981632, 1810208169436672000, 'dax-pay-admin', 1810909853691641856);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727851175936, 1810205411434328064, 'dax-pay-admin', 1810909853691641856);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727851175937, 1810208169436672000, 'dax-pay-admin', 1810871795650891776);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727851175938, 1810205411434328064, 'dax-pay-admin', 1810871795650891776);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727851175939, 1810208169436672000, 'dax-pay-admin', 1810915172140339200);
INSERT INTO "public"."iam_role_menu" VALUES (1810924727851175940, 1810205411434328064, 'dax-pay-admin', 1810915172140339200);
INSERT INTO "public"."iam_role_menu" VALUES (1812414613556809728, 1810203792869191680, 'dax-pay-admin', 1810909511121862656);
INSERT INTO "public"."iam_role_menu" VALUES (1812414613561004032, 1810203792869191680, 'dax-pay-admin', 1810911232921423872);
INSERT INTO "public"."iam_role_menu" VALUES (1812414613561004033, 1810203792869191680, 'dax-pay-admin', 1810914501286580224);
INSERT INTO "public"."iam_role_menu" VALUES (1812414613561004034, 1810203792869191680, 'dax-pay-admin', 1810864706127790080);
INSERT INTO "public"."iam_role_menu" VALUES (1812417516254257152, 1810205411434328064, 'dax-pay-admin', 1810864706127790080);
INSERT INTO "public"."iam_role_menu" VALUES (1812417516333948928, 1810208169436672000, 'dax-pay-admin', 1810864706127790080);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335394439168, 1810203792869191680, 'dax-pay-admin', 1812115247342874624);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335398633472, 1810203792869191680, 'dax-pay-admin', 1812115119471128576);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335398633473, 1810203792869191680, 'dax-pay-admin', 1812114959231938560);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335398633474, 1810203792869191680, 'dax-pay-admin', 1812114725651148800);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335398633475, 1810203792869191680, 'dax-pay-admin', 1812114603047448576);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335402827776, 1810203792869191680, 'dax-pay-admin', 1816064154722365440);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335402827777, 1810203792869191680, 'dax-pay-admin', 1816064344661422080);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335402827778, 1810203792869191680, 'dax-pay-admin', 1816064593371066368);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335402827779, 1810203792869191680, 'dax-pay-admin', 1812114347454951424);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335457353728, 1810208169436672000, 'dax-pay-admin', 1812115247342874624);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548032, 1810205411434328064, 'dax-pay-admin', 1812115247342874624);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548033, 1810208169436672000, 'dax-pay-admin', 1812115119471128576);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548034, 1810205411434328064, 'dax-pay-admin', 1812115119471128576);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548035, 1810208169436672000, 'dax-pay-admin', 1812114959231938560);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548036, 1810205411434328064, 'dax-pay-admin', 1812114959231938560);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548037, 1810208169436672000, 'dax-pay-admin', 1812114725651148800);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548038, 1810205411434328064, 'dax-pay-admin', 1812114725651148800);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548039, 1810208169436672000, 'dax-pay-admin', 1812114603047448576);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548040, 1810205411434328064, 'dax-pay-admin', 1812114603047448576);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548041, 1810208169436672000, 'dax-pay-admin', 1816064154722365440);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548042, 1810205411434328064, 'dax-pay-admin', 1816064154722365440);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335461548043, 1810208169436672000, 'dax-pay-admin', 1816064344661422080);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335465742336, 1810205411434328064, 'dax-pay-admin', 1816064344661422080);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335465742337, 1810208169436672000, 'dax-pay-admin', 1816064593371066368);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335465742338, 1810205411434328064, 'dax-pay-admin', 1816064593371066368);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335465742339, 1810208169436672000, 'dax-pay-admin', 1812114347454951424);
INSERT INTO "public"."iam_role_menu" VALUES (1818534335465742340, 1810205411434328064, 'dax-pay-admin', 1812114347454951424);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421458694144, 1826818640033910784, 'dax-pay-merchant', 1828321321655308288);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082752, 1826818640033910784, 'dax-pay-merchant', 1828329089900580864);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082753, 1826818640033910784, 'dax-pay-merchant', 1828329206313488384);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082754, 1826818640033910784, 'dax-pay-merchant', 1828329559561965568);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082755, 1826818640033910784, 'dax-pay-merchant', 1828343958704066560);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082756, 1826818640033910784, 'dax-pay-merchant', 1828345367428173824);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082757, 1826818640033910784, 'dax-pay-merchant', 1828345482972860416);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082758, 1826818640033910784, 'dax-pay-merchant', 1828345668885385216);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082759, 1826818640033910784, 'dax-pay-merchant', 1828345770836332544);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421467082760, 1826818640033910784, 'dax-pay-merchant', 1828344228972433408);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277056, 1826818640033910784, 'dax-pay-merchant', 1828390931998035968);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277057, 1826818640033910784, 'dax-pay-merchant', 1828391048989757440);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277058, 1826818640033910784, 'dax-pay-merchant', 1828329734523162624);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277059, 1826818640033910784, 'dax-pay-merchant', 1828391238714904576);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277060, 1826818640033910784, 'dax-pay-merchant', 1828391326023536640);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277061, 1826818640033910784, 'dax-pay-merchant', 1828391418604408832);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277062, 1826818640033910784, 'dax-pay-merchant', 1828329876961726464);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277063, 1826818640033910784, 'dax-pay-merchant', 1828391587492253696);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277064, 1826818640033910784, 'dax-pay-merchant', 1828391677497823232);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277065, 1826818640033910784, 'dax-pay-merchant', 1828391753905459200);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277066, 1826818640033910784, 'dax-pay-merchant', 1828391841390252032);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277067, 1826818640033910784, 'dax-pay-merchant', 1828330011066208256);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277068, 1826818640033910784, 'dax-pay-merchant', 1828392143598243840);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277069, 1826818640033910784, 'dax-pay-merchant', 1828392258849329152);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421471277070, 1826818640033910784, 'dax-pay-merchant', 1828330460724957184);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421475471360, 1826818640033910784, 'dax-pay-merchant', 1828393198436339712);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421475471361, 1826818640033910784, 'dax-pay-merchant', 1828393240358408192);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421475471362, 1826818640033910784, 'dax-pay-merchant', 1828393290560032768);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421475471363, 1826818640033910784, 'dax-pay-merchant', 1828392553994113024);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421475471364, 1826818640033910784, 'dax-pay-merchant', 1828393047642722304);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421475471365, 1826818640033910784, 'dax-pay-merchant', 1828393120791384064);
INSERT INTO "public"."iam_role_menu" VALUES (1828397421475471366, 1826818640033910784, 'dax-pay-merchant', 1828392717093818368);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764760367104, 1828680591068422144, 'dax-pay-merchant', 1828329734523162624);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755712, 1828680591068422144, 'dax-pay-merchant', 1828329876961726464);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755713, 1828680591068422144, 'dax-pay-merchant', 1828330011066208256);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755714, 1828680591068422144, 'dax-pay-merchant', 1828330460724957184);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755715, 1828680591068422144, 'dax-pay-merchant', 1828392553994113024);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755716, 1828680591068422144, 'dax-pay-merchant', 1828391238714904576);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755717, 1828680591068422144, 'dax-pay-merchant', 1828391326023536640);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755718, 1828680591068422144, 'dax-pay-merchant', 1828391418604408832);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755719, 1828680591068422144, 'dax-pay-merchant', 1828391587492253696);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755720, 1828680591068422144, 'dax-pay-merchant', 1828391677497823232);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755721, 1828680591068422144, 'dax-pay-merchant', 1828391753905459200);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755722, 1828680591068422144, 'dax-pay-merchant', 1828391841390252032);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755723, 1828680591068422144, 'dax-pay-merchant', 1828392143598243840);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764768755724, 1828680591068422144, 'dax-pay-merchant', 1828392258849329152);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764772950016, 1828680591068422144, 'dax-pay-merchant', 1828393198436339712);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764772950017, 1828680591068422144, 'dax-pay-merchant', 1828393240358408192);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764772950018, 1828680591068422144, 'dax-pay-merchant', 1828393290560032768);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764772950019, 1828680591068422144, 'dax-pay-merchant', 1828393047642722304);
INSERT INTO "public"."iam_role_menu" VALUES (1828966764772950020, 1828680591068422144, 'dax-pay-merchant', 1828393120791384064);

-- ----------------------------
-- Table structure for iam_role_path
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_role_path";
CREATE TABLE "public"."iam_role_path" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "client_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "path_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."iam_role_path"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_role_path"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."iam_role_path"."client_code" IS '终端编码';
COMMENT ON COLUMN "public"."iam_role_path"."path_id" IS '请求资源id';
COMMENT ON TABLE "public"."iam_role_path" IS '角色路径关联关系';

-- ----------------------------
-- Records of iam_role_path
-- ----------------------------
INSERT INTO "public"."iam_role_path" VALUES (1812412556422664192, 1810203792869191680, 'dax-pay-admin', 1812403022538891268);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858496, 1810203792869191680, 'dax-pay-admin', 1812403022530502656);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858497, 1810203792869191680, 'dax-pay-admin', 1812403022522114048);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858498, 1810203792869191680, 'dax-pay-admin', 1812403022509531136);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858499, 1810203792869191680, 'dax-pay-admin', 1812403022496948224);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858500, 1810203792869191680, 'dax-pay-admin', 1812403022484365314);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858501, 1810203792869191680, 'dax-pay-admin', 1812403022467588097);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858502, 1810203792869191680, 'dax-pay-admin', 1812403022467588096);
INSERT INTO "public"."iam_role_path" VALUES (1812412556426858503, 1810203792869191680, 'dax-pay-admin', 1812403022463393795);
INSERT INTO "public"."iam_role_path" VALUES (1812412556431052800, 1810203792869191680, 'dax-pay-admin', 1812403022463393793);
INSERT INTO "public"."iam_role_path" VALUES (1812412556431052801, 1810203792869191680, 'dax-pay-admin', 1812403022522114051);
INSERT INTO "public"."iam_role_path" VALUES (1818534440075878400, 1810203792869191680, 'dax-pay-admin', 1818534058532626432);
INSERT INTO "public"."iam_role_path" VALUES (1818534440084267008, 1810203792869191680, 'dax-pay-admin', 1813211536312123404);
INSERT INTO "public"."iam_role_path" VALUES (1818534440084267009, 1810203792869191680, 'dax-pay-admin', 1813211536312123403);
INSERT INTO "public"."iam_role_path" VALUES (1818534440084267010, 1810203792869191680, 'dax-pay-admin', 1813211536312123399);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461312, 1810203792869191680, 'dax-pay-admin', 1813211536312123400);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461313, 1810203792869191680, 'dax-pay-admin', 1813211536312123395);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461314, 1810203792869191680, 'dax-pay-admin', 1813211536312123398);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461315, 1810203792869191680, 'dax-pay-admin', 1813211536312123396);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461316, 1810203792869191680, 'dax-pay-admin', 1813211536312123392);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461317, 1810203792869191680, 'dax-pay-admin', 1813211536312123397);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461318, 1810203792869191680, 'dax-pay-admin', 1813211536312123394);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461319, 1810203792869191680, 'dax-pay-admin', 1813211536240820224);
INSERT INTO "public"."iam_role_path" VALUES (1818534440088461320, 1810203792869191680, 'dax-pay-admin', 1812403022538891269);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655616, 1810203792869191680, 'dax-pay-admin', 1812403022538891265);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655617, 1810203792869191680, 'dax-pay-admin', 1812403022534696960);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655618, 1810203792869191680, 'dax-pay-admin', 1812403022522114050);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655619, 1810203792869191680, 'dax-pay-admin', 1812403022517919745);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655620, 1810203792869191680, 'dax-pay-admin', 1812403022509531139);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655621, 1810203792869191680, 'dax-pay-admin', 1812403022509531137);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655622, 1810203792869191680, 'dax-pay-admin', 1812403022501142530);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655623, 1810203792869191680, 'dax-pay-admin', 1812403022488559616);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655624, 1810203792869191680, 'dax-pay-admin', 1812403022484365315);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655625, 1810203792869191680, 'dax-pay-admin', 1812403022475976706);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655626, 1810203792869191680, 'dax-pay-admin', 1812403022475976705);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655627, 1810203792869191680, 'dax-pay-admin', 1812403022387896320);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655628, 1810203792869191680, 'dax-pay-admin', 1812403022538891266);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655629, 1810203792869191680, 'dax-pay-admin', 1812403022526308353);
INSERT INTO "public"."iam_role_path" VALUES (1818534440092655630, 1810203792869191680, 'dax-pay-admin', 1812403022522114049);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849920, 1810203792869191680, 'dax-pay-admin', 1812403022509531140);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849921, 1810203792869191680, 'dax-pay-admin', 1812403022505336836);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849922, 1810203792869191680, 'dax-pay-admin', 1812403022488559618);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849923, 1810203792869191680, 'dax-pay-admin', 1812403022480171008);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849924, 1810203792869191680, 'dax-pay-admin', 1812403022467588098);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849925, 1810203792869191680, 'dax-pay-admin', 1812403022463393792);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849926, 1810203792869191680, 'dax-pay-admin', 1812403022459199488);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849927, 1810203792869191680, 'dax-pay-admin', 1812403022538891264);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849928, 1810203792869191680, 'dax-pay-admin', 1812403022505336834);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849929, 1810203792869191680, 'dax-pay-admin', 1812403022505336833);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849930, 1810203792869191680, 'dax-pay-admin', 1812403022501142529);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849931, 1810203792869191680, 'dax-pay-admin', 1812403022471782400);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849932, 1810203792869191680, 'dax-pay-admin', 1812403022534696961);
INSERT INTO "public"."iam_role_path" VALUES (1818534440096849933, 1810203792869191680, 'dax-pay-admin', 1812403022530502658);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044224, 1810203792869191680, 'dax-pay-admin', 1812403022517919744);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044225, 1810203792869191680, 'dax-pay-admin', 1812403022505336837);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044226, 1810203792869191680, 'dax-pay-admin', 1812403022501142531);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044227, 1810203792869191680, 'dax-pay-admin', 1812403022488559619);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044228, 1810203792869191680, 'dax-pay-admin', 1812403022484365313);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044229, 1810203792869191680, 'dax-pay-admin', 1812403022526308352);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044230, 1810203792869191680, 'dax-pay-admin', 1812403022505336835);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044231, 1810203792869191680, 'dax-pay-admin', 1812403022501142528);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044232, 1810203792869191680, 'dax-pay-admin', 1812403022488559617);
INSERT INTO "public"."iam_role_path" VALUES (1818534440101044233, 1810203792869191680, 'dax-pay-admin', 1812403022484365312);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238528, 1810203792869191680, 'dax-pay-admin', 1812403022480171009);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238529, 1810203792869191680, 'dax-pay-admin', 1812403022459199489);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238530, 1810203792869191680, 'dax-pay-admin', 1812403022538891267);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238531, 1810203792869191680, 'dax-pay-admin', 1812403022530502657);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238532, 1810203792869191680, 'dax-pay-admin', 1812403022526308355);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238533, 1810203792869191680, 'dax-pay-admin', 1812403022509531138);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238534, 1810203792869191680, 'dax-pay-admin', 1812403022505336832);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238535, 1810203792869191680, 'dax-pay-admin', 1812403022475976704);
INSERT INTO "public"."iam_role_path" VALUES (1818534440105238536, 1810203792869191680, 'dax-pay-admin', 1812403022463393794);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432832, 1810203792869191680, 'dax-pay-admin', 1812403022526308354);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432833, 1810203792869191680, 'dax-pay-admin', 1812403022471782401);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432834, 1810203792869191680, 'dax-pay-admin', 1810211210151882755);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432835, 1810203792869191680, 'dax-pay-admin', 1810211210151882754);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432836, 1810203792869191680, 'dax-pay-admin', 1810211210151882753);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432837, 1810203792869191680, 'dax-pay-admin', 1810211210151882752);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432838, 1810203792869191680, 'dax-pay-admin', 1810211210147688453);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432839, 1810203792869191680, 'dax-pay-admin', 1810211210147688452);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432840, 1810203792869191680, 'dax-pay-admin', 1810211210147688451);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432841, 1810203792869191680, 'dax-pay-admin', 1810211210147688449);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432842, 1810203792869191680, 'dax-pay-admin', 1810211210147688448);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432843, 1810203792869191680, 'dax-pay-admin', 1810211210143494148);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432844, 1810203792869191680, 'dax-pay-admin', 1810211210143494147);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432845, 1810203792869191680, 'dax-pay-admin', 1810211210143494146);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432846, 1810203792869191680, 'dax-pay-admin', 1810211210143494145);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432847, 1810203792869191680, 'dax-pay-admin', 1810211210143494144);
INSERT INTO "public"."iam_role_path" VALUES (1818534440109432848, 1810203792869191680, 'dax-pay-admin', 1810211210139299840);
INSERT INTO "public"."iam_role_path" VALUES (1818534440113627136, 1810203792869191680, 'dax-pay-admin', 1810211210126716928);
INSERT INTO "public"."iam_role_path" VALUES (1818534440155570176, 1810208169436672000, 'dax-pay-admin', 1818534058532626432);
INSERT INTO "public"."iam_role_path" VALUES (1818534440155570177, 1810205411434328064, 'dax-pay-admin', 1818534058532626432);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764480, 1810208169436672000, 'dax-pay-admin', 1813211536312123404);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764481, 1810205411434328064, 'dax-pay-admin', 1813211536312123404);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764482, 1810208169436672000, 'dax-pay-admin', 1813211536312123403);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764483, 1810205411434328064, 'dax-pay-admin', 1813211536312123403);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764484, 1810208169436672000, 'dax-pay-admin', 1813211536312123399);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764485, 1810205411434328064, 'dax-pay-admin', 1813211536312123399);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764486, 1810208169436672000, 'dax-pay-admin', 1813211536312123400);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764487, 1810205411434328064, 'dax-pay-admin', 1813211536312123400);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764488, 1810208169436672000, 'dax-pay-admin', 1813211536312123395);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764489, 1810205411434328064, 'dax-pay-admin', 1813211536312123395);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764490, 1810208169436672000, 'dax-pay-admin', 1813211536312123398);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764491, 1810205411434328064, 'dax-pay-admin', 1813211536312123398);
INSERT INTO "public"."iam_role_path" VALUES (1818534440159764492, 1810208169436672000, 'dax-pay-admin', 1813211536312123396);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958784, 1810205411434328064, 'dax-pay-admin', 1813211536312123396);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958785, 1810208169436672000, 'dax-pay-admin', 1813211536312123392);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958786, 1810205411434328064, 'dax-pay-admin', 1813211536312123392);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958787, 1810208169436672000, 'dax-pay-admin', 1813211536312123397);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958788, 1810205411434328064, 'dax-pay-admin', 1813211536312123397);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958789, 1810208169436672000, 'dax-pay-admin', 1813211536312123394);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958790, 1810205411434328064, 'dax-pay-admin', 1813211536312123394);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958791, 1810208169436672000, 'dax-pay-admin', 1813211536240820224);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958792, 1810205411434328064, 'dax-pay-admin', 1813211536240820224);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958793, 1810208169436672000, 'dax-pay-admin', 1812403022538891269);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958794, 1810205411434328064, 'dax-pay-admin', 1812403022538891269);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958795, 1810208169436672000, 'dax-pay-admin', 1812403022538891265);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958796, 1810205411434328064, 'dax-pay-admin', 1812403022538891265);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958797, 1810208169436672000, 'dax-pay-admin', 1812403022534696960);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958798, 1810205411434328064, 'dax-pay-admin', 1812403022534696960);
INSERT INTO "public"."iam_role_path" VALUES (1818534440163958799, 1810208169436672000, 'dax-pay-admin', 1812403022522114050);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153088, 1810205411434328064, 'dax-pay-admin', 1812403022522114050);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153089, 1810208169436672000, 'dax-pay-admin', 1812403022517919745);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153090, 1810205411434328064, 'dax-pay-admin', 1812403022517919745);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153091, 1810208169436672000, 'dax-pay-admin', 1812403022509531139);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153092, 1810205411434328064, 'dax-pay-admin', 1812403022509531139);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153093, 1810208169436672000, 'dax-pay-admin', 1812403022509531137);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153094, 1810205411434328064, 'dax-pay-admin', 1812403022509531137);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153095, 1810208169436672000, 'dax-pay-admin', 1812403022501142530);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153096, 1810205411434328064, 'dax-pay-admin', 1812403022501142530);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153097, 1810208169436672000, 'dax-pay-admin', 1812403022488559616);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153098, 1810205411434328064, 'dax-pay-admin', 1812403022488559616);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153099, 1810208169436672000, 'dax-pay-admin', 1812403022484365315);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153100, 1810205411434328064, 'dax-pay-admin', 1812403022484365315);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153101, 1810208169436672000, 'dax-pay-admin', 1812403022475976706);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153102, 1810205411434328064, 'dax-pay-admin', 1812403022475976706);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153103, 1810208169436672000, 'dax-pay-admin', 1812403022475976705);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153104, 1810205411434328064, 'dax-pay-admin', 1812403022475976705);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153105, 1810208169436672000, 'dax-pay-admin', 1812403022387896320);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153106, 1810205411434328064, 'dax-pay-admin', 1812403022387896320);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153107, 1810208169436672000, 'dax-pay-admin', 1812403022538891266);
INSERT INTO "public"."iam_role_path" VALUES (1818534440168153108, 1810205411434328064, 'dax-pay-admin', 1812403022538891266);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347392, 1810208169436672000, 'dax-pay-admin', 1812403022526308353);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347393, 1810205411434328064, 'dax-pay-admin', 1812403022526308353);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347394, 1810208169436672000, 'dax-pay-admin', 1812403022522114049);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347395, 1810205411434328064, 'dax-pay-admin', 1812403022522114049);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347396, 1810208169436672000, 'dax-pay-admin', 1812403022509531140);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347397, 1810205411434328064, 'dax-pay-admin', 1812403022509531140);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347398, 1810208169436672000, 'dax-pay-admin', 1812403022505336836);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347399, 1810205411434328064, 'dax-pay-admin', 1812403022505336836);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347400, 1810208169436672000, 'dax-pay-admin', 1812403022488559618);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347401, 1810205411434328064, 'dax-pay-admin', 1812403022488559618);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347402, 1810208169436672000, 'dax-pay-admin', 1812403022480171008);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347403, 1810205411434328064, 'dax-pay-admin', 1812403022480171008);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347404, 1810208169436672000, 'dax-pay-admin', 1812403022467588098);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347405, 1810205411434328064, 'dax-pay-admin', 1812403022467588098);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347406, 1810208169436672000, 'dax-pay-admin', 1812403022463393792);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347407, 1810205411434328064, 'dax-pay-admin', 1812403022463393792);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347408, 1810208169436672000, 'dax-pay-admin', 1812403022459199488);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347409, 1810205411434328064, 'dax-pay-admin', 1812403022459199488);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347410, 1810208169436672000, 'dax-pay-admin', 1812403022538891264);
INSERT INTO "public"."iam_role_path" VALUES (1818534440172347411, 1810205411434328064, 'dax-pay-admin', 1812403022538891264);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541696, 1810208169436672000, 'dax-pay-admin', 1812403022505336834);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541697, 1810205411434328064, 'dax-pay-admin', 1812403022505336834);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541698, 1810208169436672000, 'dax-pay-admin', 1812403022505336833);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541699, 1810205411434328064, 'dax-pay-admin', 1812403022505336833);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541700, 1810208169436672000, 'dax-pay-admin', 1812403022501142529);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541701, 1810205411434328064, 'dax-pay-admin', 1812403022501142529);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541702, 1810208169436672000, 'dax-pay-admin', 1812403022471782400);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541703, 1810205411434328064, 'dax-pay-admin', 1812403022471782400);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541704, 1810208169436672000, 'dax-pay-admin', 1812403022534696961);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541705, 1810205411434328064, 'dax-pay-admin', 1812403022534696961);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541706, 1810208169436672000, 'dax-pay-admin', 1812403022530502658);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541707, 1810205411434328064, 'dax-pay-admin', 1812403022530502658);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541708, 1810208169436672000, 'dax-pay-admin', 1812403022517919744);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541709, 1810205411434328064, 'dax-pay-admin', 1812403022517919744);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541710, 1810208169436672000, 'dax-pay-admin', 1812403022505336837);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541711, 1810205411434328064, 'dax-pay-admin', 1812403022505336837);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541712, 1810208169436672000, 'dax-pay-admin', 1812403022501142531);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541713, 1810205411434328064, 'dax-pay-admin', 1812403022501142531);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541714, 1810208169436672000, 'dax-pay-admin', 1812403022488559619);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541715, 1810205411434328064, 'dax-pay-admin', 1812403022488559619);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541716, 1810208169436672000, 'dax-pay-admin', 1812403022484365313);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541717, 1810205411434328064, 'dax-pay-admin', 1812403022484365313);
INSERT INTO "public"."iam_role_path" VALUES (1818534440176541718, 1810208169436672000, 'dax-pay-admin', 1812403022526308352);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736000, 1810205411434328064, 'dax-pay-admin', 1812403022526308352);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736001, 1810208169436672000, 'dax-pay-admin', 1812403022505336835);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736002, 1810205411434328064, 'dax-pay-admin', 1812403022505336835);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736003, 1810208169436672000, 'dax-pay-admin', 1812403022501142528);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736004, 1810205411434328064, 'dax-pay-admin', 1812403022501142528);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736005, 1810208169436672000, 'dax-pay-admin', 1812403022488559617);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736006, 1810205411434328064, 'dax-pay-admin', 1812403022488559617);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736007, 1810208169436672000, 'dax-pay-admin', 1812403022484365312);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736008, 1810205411434328064, 'dax-pay-admin', 1812403022484365312);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736009, 1810208169436672000, 'dax-pay-admin', 1812403022480171009);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736010, 1810205411434328064, 'dax-pay-admin', 1812403022480171009);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736011, 1810208169436672000, 'dax-pay-admin', 1812403022459199489);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736012, 1810205411434328064, 'dax-pay-admin', 1812403022459199489);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736013, 1810208169436672000, 'dax-pay-admin', 1812403022538891267);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736014, 1810205411434328064, 'dax-pay-admin', 1812403022538891267);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736015, 1810208169436672000, 'dax-pay-admin', 1812403022530502657);
INSERT INTO "public"."iam_role_path" VALUES (1818534440180736016, 1810205411434328064, 'dax-pay-admin', 1812403022530502657);
INSERT INTO "public"."iam_role_path" VALUES (1818534440184930304, 1810208169436672000, 'dax-pay-admin', 1812403022526308355);
INSERT INTO "public"."iam_role_path" VALUES (1818534440184930305, 1810205411434328064, 'dax-pay-admin', 1812403022526308355);
INSERT INTO "public"."iam_role_path" VALUES (1818534440184930306, 1810208169436672000, 'dax-pay-admin', 1812403022509531138);
INSERT INTO "public"."iam_role_path" VALUES (1818534440184930307, 1810205411434328064, 'dax-pay-admin', 1812403022509531138);
INSERT INTO "public"."iam_role_path" VALUES (1818534440184930308, 1810208169436672000, 'dax-pay-admin', 1812403022505336832);
INSERT INTO "public"."iam_role_path" VALUES (1818534440184930309, 1810205411434328064, 'dax-pay-admin', 1812403022505336832);
INSERT INTO "public"."iam_role_path" VALUES (1818534440184930310, 1810208169436672000, 'dax-pay-admin', 1812403022475976704);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124608, 1810205411434328064, 'dax-pay-admin', 1812403022475976704);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124609, 1810208169436672000, 'dax-pay-admin', 1812403022463393794);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124610, 1810205411434328064, 'dax-pay-admin', 1812403022463393794);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124611, 1810208169436672000, 'dax-pay-admin', 1812403022526308354);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124612, 1810205411434328064, 'dax-pay-admin', 1812403022526308354);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124613, 1810208169436672000, 'dax-pay-admin', 1812403022471782401);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124614, 1810205411434328064, 'dax-pay-admin', 1812403022471782401);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124615, 1810208169436672000, 'dax-pay-admin', 1810211210151882755);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124616, 1810205411434328064, 'dax-pay-admin', 1810211210151882755);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124617, 1810208169436672000, 'dax-pay-admin', 1810211210151882754);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124618, 1810205411434328064, 'dax-pay-admin', 1810211210151882754);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124619, 1810208169436672000, 'dax-pay-admin', 1810211210151882753);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124620, 1810205411434328064, 'dax-pay-admin', 1810211210151882753);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124621, 1810208169436672000, 'dax-pay-admin', 1810211210151882752);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124622, 1810205411434328064, 'dax-pay-admin', 1810211210151882752);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124623, 1810208169436672000, 'dax-pay-admin', 1810211210147688453);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124624, 1810205411434328064, 'dax-pay-admin', 1810211210147688453);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124625, 1810208169436672000, 'dax-pay-admin', 1810211210147688452);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124626, 1810205411434328064, 'dax-pay-admin', 1810211210147688452);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124627, 1810208169436672000, 'dax-pay-admin', 1810211210147688451);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124628, 1810205411434328064, 'dax-pay-admin', 1810211210147688451);
INSERT INTO "public"."iam_role_path" VALUES (1818534440189124629, 1810208169436672000, 'dax-pay-admin', 1810211210147688449);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318912, 1810205411434328064, 'dax-pay-admin', 1810211210147688449);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318913, 1810208169436672000, 'dax-pay-admin', 1810211210147688448);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318914, 1810205411434328064, 'dax-pay-admin', 1810211210147688448);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318915, 1810208169436672000, 'dax-pay-admin', 1810211210143494148);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318916, 1810205411434328064, 'dax-pay-admin', 1810211210143494148);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318917, 1810208169436672000, 'dax-pay-admin', 1810211210143494147);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318918, 1810205411434328064, 'dax-pay-admin', 1810211210143494147);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318919, 1810208169436672000, 'dax-pay-admin', 1810211210143494146);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318920, 1810205411434328064, 'dax-pay-admin', 1810211210143494146);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318921, 1810208169436672000, 'dax-pay-admin', 1810211210143494145);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318922, 1810205411434328064, 'dax-pay-admin', 1810211210143494145);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318923, 1810208169436672000, 'dax-pay-admin', 1810211210143494144);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318924, 1810205411434328064, 'dax-pay-admin', 1810211210143494144);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318925, 1810208169436672000, 'dax-pay-admin', 1810211210139299840);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318926, 1810205411434328064, 'dax-pay-admin', 1810211210139299840);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318927, 1810208169436672000, 'dax-pay-admin', 1810211210126716928);
INSERT INTO "public"."iam_role_path" VALUES (1818534440193318928, 1810205411434328064, 'dax-pay-admin', 1810211210126716928);
INSERT INTO "public"."iam_role_path" VALUES (1828967634235392000, 1826818640033910784, 'dax-pay-merchant', 1828963432331247617);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586304, 1826818640033910784, 'dax-pay-merchant', 1828963432176058370);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586305, 1826818640033910784, 'dax-pay-merchant', 1828963432280915970);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586306, 1826818640033910784, 'dax-pay-merchant', 1828963432238972930);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586307, 1826818640033910784, 'dax-pay-merchant', 1828963432226390018);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586308, 1826818640033910784, 'dax-pay-merchant', 1828963432218001408);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586309, 1826818640033910784, 'dax-pay-merchant', 1828963432205418498);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586310, 1826818640033910784, 'dax-pay-merchant', 1828963432176058369);
INSERT INTO "public"."iam_role_path" VALUES (1828967634239586311, 1826818640033910784, 'dax-pay-merchant', 1828963432331247616);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780608, 1826818640033910784, 'dax-pay-merchant', 1828963432322859009);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780610, 1826818640033910784, 'dax-pay-merchant', 1828963432293498881);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780611, 1826818640033910784, 'dax-pay-merchant', 1828963432289304576);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780612, 1826818640033910784, 'dax-pay-merchant', 1828963432280915968);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780613, 1826818640033910784, 'dax-pay-merchant', 1828963432272527361);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780614, 1826818640033910784, 'dax-pay-merchant', 1828963432272527360);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780615, 1826818640033910784, 'dax-pay-merchant', 1828963432268333057);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780616, 1826818640033910784, 'dax-pay-merchant', 1828963432268333056);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780617, 1826818640033910784, 'dax-pay-merchant', 1828963432264138755);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780618, 1826818640033910784, 'dax-pay-merchant', 1828963432264138753);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780619, 1826818640033910784, 'dax-pay-merchant', 1828963432243167235);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780620, 1826818640033910784, 'dax-pay-merchant', 1828963432243167233);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780621, 1826818640033910784, 'dax-pay-merchant', 1828963432201224194);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780622, 1826818640033910784, 'dax-pay-merchant', 1828963432129921025);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780623, 1826818640033910784, 'dax-pay-merchant', 1828963432083783680);
INSERT INTO "public"."iam_role_path" VALUES (1828967634243780624, 1826818640033910784, 'dax-pay-merchant', 1828963432318664705);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974912, 1826818640033910784, 'dax-pay-merchant', 1828963432301887488);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974913, 1826818640033910784, 'dax-pay-merchant', 1828963432297693185);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974914, 1826818640033910784, 'dax-pay-merchant', 1828963432280915972);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974915, 1826818640033910784, 'dax-pay-merchant', 1828963432125726720);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974916, 1826818640033910784, 'dax-pay-merchant', 1828963432268333060);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974917, 1826818640033910784, 'dax-pay-merchant', 1828963432134115329);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974918, 1826818640033910784, 'dax-pay-merchant', 1828963432322859013);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974919, 1826818640033910784, 'dax-pay-merchant', 1828963432318664707);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974920, 1826818640033910784, 'dax-pay-merchant', 1828963432276721667);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974921, 1826818640033910784, 'dax-pay-merchant', 1828963432276721665);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974922, 1826818640033910784, 'dax-pay-merchant', 1828963432268333058);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974923, 1826818640033910784, 'dax-pay-merchant', 1828963432251555841);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974924, 1826818640033910784, 'dax-pay-merchant', 1828963432238972929);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974925, 1826818640033910784, 'dax-pay-merchant', 1828963432180252672);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974926, 1826818640033910784, 'dax-pay-merchant', 1828963432280915971);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974927, 1826818640033910784, 'dax-pay-merchant', 1828963432276721664);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974928, 1826818640033910784, 'dax-pay-merchant', 1828963432234778626);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974929, 1826818640033910784, 'dax-pay-merchant', 1828963432197029889);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974930, 1826818640033910784, 'dax-pay-merchant', 1828963432167669761);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974931, 1826818640033910784, 'dax-pay-merchant', 1828963432163475457);
INSERT INTO "public"."iam_role_path" VALUES (1828967634247974932, 1826818640033910784, 'dax-pay-merchant', 1828963432150892544);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169216, 1826818640033910784, 'dax-pay-merchant', 1828963432129921024);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169217, 1826818640033910784, 'dax-pay-merchant', 1828963432276721666);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169218, 1826818640033910784, 'dax-pay-merchant', 1828963432243167234);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169219, 1826818640033910784, 'dax-pay-merchant', 1828963432234778627);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169220, 1826818640033910784, 'dax-pay-merchant', 1828963432222195713);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169221, 1826818640033910784, 'dax-pay-merchant', 1828963432213807105);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169222, 1826818640033910784, 'dax-pay-merchant', 1828963432209612803);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169223, 1826818640033910784, 'dax-pay-merchant', 1828963432171864065);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169224, 1826818640033910784, 'dax-pay-merchant', 1828963432314470402);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169225, 1826818640033910784, 'dax-pay-merchant', 1828963432247361536);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169226, 1826818640033910784, 'dax-pay-merchant', 1828963432327053313);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169227, 1826818640033910784, 'dax-pay-merchant', 1828963432268333059);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169228, 1826818640033910784, 'dax-pay-merchant', 1828963432184446977);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169229, 1826818640033910784, 'dax-pay-merchant', 1828963432163475456);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169230, 1826818640033910784, 'dax-pay-merchant', 1828963432134115331);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169231, 1826818640033910784, 'dax-pay-merchant', 1828963432297693184);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169232, 1826818640033910784, 'dax-pay-merchant', 1828963432259944449);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169233, 1826818640033910784, 'dax-pay-merchant', 1828963432209612802);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169234, 1826818640033910784, 'dax-pay-merchant', 1828963432180252674);
INSERT INTO "public"."iam_role_path" VALUES (1828967634252169235, 1826818640033910784, 'dax-pay-merchant', 1828963432125726721);
INSERT INTO "public"."iam_role_path" VALUES (1828967634302500864, 1828680591068422144, 'dax-pay-merchant', 1828963432331247617);
INSERT INTO "public"."iam_role_path" VALUES (1828967634302500865, 1828680591068422144, 'dax-pay-merchant', 1828963432176058370);
INSERT INTO "public"."iam_role_path" VALUES (1828967634302500866, 1828680591068422144, 'dax-pay-merchant', 1828963432280915970);
INSERT INTO "public"."iam_role_path" VALUES (1828967634302500867, 1828680591068422144, 'dax-pay-merchant', 1828963432238972930);
INSERT INTO "public"."iam_role_path" VALUES (1828967634302500868, 1828680591068422144, 'dax-pay-merchant', 1828963432226390018);
INSERT INTO "public"."iam_role_path" VALUES (1828967634302500869, 1828680591068422144, 'dax-pay-merchant', 1828963432218001408);
INSERT INTO "public"."iam_role_path" VALUES (1828967634302500870, 1828680591068422144, 'dax-pay-merchant', 1828963432205418498);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695168, 1828680591068422144, 'dax-pay-merchant', 1828963432176058369);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695169, 1828680591068422144, 'dax-pay-merchant', 1828963432331247616);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695170, 1828680591068422144, 'dax-pay-merchant', 1828963432322859009);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695172, 1828680591068422144, 'dax-pay-merchant', 1828963432293498881);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695173, 1828680591068422144, 'dax-pay-merchant', 1828963432289304576);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695174, 1828680591068422144, 'dax-pay-merchant', 1828963432280915968);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695175, 1828680591068422144, 'dax-pay-merchant', 1828963432272527361);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695176, 1828680591068422144, 'dax-pay-merchant', 1828963432272527360);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695177, 1828680591068422144, 'dax-pay-merchant', 1828963432268333057);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695178, 1828680591068422144, 'dax-pay-merchant', 1828963432268333056);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695179, 1828680591068422144, 'dax-pay-merchant', 1828963432264138755);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695180, 1828680591068422144, 'dax-pay-merchant', 1828963432264138753);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695181, 1828680591068422144, 'dax-pay-merchant', 1828963432243167235);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695182, 1828680591068422144, 'dax-pay-merchant', 1828963432243167233);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695183, 1828680591068422144, 'dax-pay-merchant', 1828963432201224194);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695184, 1828680591068422144, 'dax-pay-merchant', 1828963432129921025);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695185, 1828680591068422144, 'dax-pay-merchant', 1828963432083783680);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695186, 1828680591068422144, 'dax-pay-merchant', 1828963432318664705);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695187, 1828680591068422144, 'dax-pay-merchant', 1828963432301887488);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695188, 1828680591068422144, 'dax-pay-merchant', 1828963432297693185);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695189, 1828680591068422144, 'dax-pay-merchant', 1828963432280915972);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695190, 1828680591068422144, 'dax-pay-merchant', 1828963432125726720);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695191, 1828680591068422144, 'dax-pay-merchant', 1828963432268333060);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695192, 1828680591068422144, 'dax-pay-merchant', 1828963432134115329);
INSERT INTO "public"."iam_role_path" VALUES (1828967634306695193, 1828680591068422144, 'dax-pay-merchant', 1828963432322859013);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889472, 1828680591068422144, 'dax-pay-merchant', 1828963432318664707);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889473, 1828680591068422144, 'dax-pay-merchant', 1828963432276721667);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889474, 1828680591068422144, 'dax-pay-merchant', 1828963432276721665);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889475, 1828680591068422144, 'dax-pay-merchant', 1828963432268333058);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889476, 1828680591068422144, 'dax-pay-merchant', 1828963432251555841);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889477, 1828680591068422144, 'dax-pay-merchant', 1828963432238972929);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889478, 1828680591068422144, 'dax-pay-merchant', 1828963432180252672);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889479, 1828680591068422144, 'dax-pay-merchant', 1828963432280915971);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889480, 1828680591068422144, 'dax-pay-merchant', 1828963432276721664);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889481, 1828680591068422144, 'dax-pay-merchant', 1828963432234778626);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889482, 1828680591068422144, 'dax-pay-merchant', 1828963432197029889);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889483, 1828680591068422144, 'dax-pay-merchant', 1828963432167669761);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889484, 1828680591068422144, 'dax-pay-merchant', 1828963432163475457);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889485, 1828680591068422144, 'dax-pay-merchant', 1828963432150892544);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889486, 1828680591068422144, 'dax-pay-merchant', 1828963432129921024);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889487, 1828680591068422144, 'dax-pay-merchant', 1828963432276721666);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889488, 1828680591068422144, 'dax-pay-merchant', 1828963432243167234);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889489, 1828680591068422144, 'dax-pay-merchant', 1828963432234778627);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889490, 1828680591068422144, 'dax-pay-merchant', 1828963432222195713);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889491, 1828680591068422144, 'dax-pay-merchant', 1828963432213807105);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889492, 1828680591068422144, 'dax-pay-merchant', 1828963432209612803);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889493, 1828680591068422144, 'dax-pay-merchant', 1828963432171864065);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889494, 1828680591068422144, 'dax-pay-merchant', 1828963432314470402);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889495, 1828680591068422144, 'dax-pay-merchant', 1828963432247361536);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889496, 1828680591068422144, 'dax-pay-merchant', 1828963432327053313);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889497, 1828680591068422144, 'dax-pay-merchant', 1828963432268333059);
INSERT INTO "public"."iam_role_path" VALUES (1828967634310889498, 1828680591068422144, 'dax-pay-merchant', 1828963432184446977);
INSERT INTO "public"."iam_role_path" VALUES (1828967634315083776, 1828680591068422144, 'dax-pay-merchant', 1828963432163475456);
INSERT INTO "public"."iam_role_path" VALUES (1828967634315083777, 1828680591068422144, 'dax-pay-merchant', 1828963432134115331);
INSERT INTO "public"."iam_role_path" VALUES (1828967634315083778, 1828680591068422144, 'dax-pay-merchant', 1828963432297693184);
INSERT INTO "public"."iam_role_path" VALUES (1828967634315083779, 1828680591068422144, 'dax-pay-merchant', 1828963432259944449);
INSERT INTO "public"."iam_role_path" VALUES (1828967634315083780, 1828680591068422144, 'dax-pay-merchant', 1828963432209612802);
INSERT INTO "public"."iam_role_path" VALUES (1828967634315083781, 1828680591068422144, 'dax-pay-merchant', 1828963432180252674);
INSERT INTO "public"."iam_role_path" VALUES (1828967634315083782, 1828680591068422144, 'dax-pay-merchant', 1828963432125726721);
INSERT INTO "public"."iam_role_path" VALUES (1828994365302243328, 1826818640033910784, 'dax-pay-merchant', 1828994191385427968);
INSERT INTO "public"."iam_role_path" VALUES (1828994365373546496, 1828680591068422144, 'dax-pay-merchant', 1828994191385427968);
INSERT INTO "public"."iam_role_path" VALUES (1828970420981329920, 1826818640033910784, 'dax-pay-merchant', 1828970327444156416);
INSERT INTO "public"."iam_role_path" VALUES (1828970420989718528, 1826818640033910784, 'dax-pay-merchant', 1828970327381241856);
INSERT INTO "public"."iam_role_path" VALUES (1828970420989718529, 1826818640033910784, 'dax-pay-merchant', 1828963432327053312);
INSERT INTO "public"."iam_role_path" VALUES (1828970420989718530, 1826818640033910784, 'dax-pay-merchant', 1828963432251555842);
INSERT INTO "public"."iam_role_path" VALUES (1828970420989718531, 1826818640033910784, 'dax-pay-merchant', 1828963432184446976);
INSERT INTO "public"."iam_role_path" VALUES (1828970420989718532, 1826818640033910784, 'dax-pay-merchant', 1828963432259944451);
INSERT INTO "public"."iam_role_path" VALUES (1828970420993912832, 1826818640033910784, 'dax-pay-merchant', 1828963432205418497);
INSERT INTO "public"."iam_role_path" VALUES (1828970420993912833, 1826818640033910784, 'dax-pay-merchant', 1828963432247361538);
INSERT INTO "public"."iam_role_path" VALUES (1828970420993912834, 1826818640033910784, 'dax-pay-merchant', 1828963432142503936);
INSERT INTO "public"."iam_role_path" VALUES (1828970421061021696, 1828680591068422144, 'dax-pay-merchant', 1828970327444156416);
INSERT INTO "public"."iam_role_path" VALUES (1828970421065216000, 1828680591068422144, 'dax-pay-merchant', 1828970327381241856);
INSERT INTO "public"."iam_role_path" VALUES (1828970421065216001, 1828680591068422144, 'dax-pay-merchant', 1828963432327053312);
INSERT INTO "public"."iam_role_path" VALUES (1828970421065216002, 1828680591068422144, 'dax-pay-merchant', 1828963432251555842);
INSERT INTO "public"."iam_role_path" VALUES (1828970421065216003, 1828680591068422144, 'dax-pay-merchant', 1828963432184446976);
INSERT INTO "public"."iam_role_path" VALUES (1828970421069410304, 1828680591068422144, 'dax-pay-merchant', 1828963432259944451);
INSERT INTO "public"."iam_role_path" VALUES (1828970421069410305, 1828680591068422144, 'dax-pay-merchant', 1828963432205418497);
INSERT INTO "public"."iam_role_path" VALUES (1828970421069410306, 1828680591068422144, 'dax-pay-merchant', 1828963432247361538);
INSERT INTO "public"."iam_role_path" VALUES (1828970421069410307, 1828680591068422144, 'dax-pay-merchant', 1828963432142503936);
INSERT INTO "public"."iam_role_path" VALUES (1829093606880305152, 1826818640033910784, 'dax-pay-merchant', 1828963432327053315);
INSERT INTO "public"."iam_role_path" VALUES (1829093606947414016, 1826818640033910784, 'dax-pay-merchant', 1828963432327053314);
INSERT INTO "public"."iam_role_path" VALUES (1829093606947414017, 1826818640033910784, 'dax-pay-merchant', 1828963432314470401);
INSERT INTO "public"."iam_role_path" VALUES (1829093606947414018, 1826818640033910784, 'dax-pay-merchant', 1828963432272527363);
INSERT INTO "public"."iam_role_path" VALUES (1829093606947414019, 1826818640033910784, 'dax-pay-merchant', 1828963432259944452);
INSERT INTO "public"."iam_role_path" VALUES (1829093606951608320, 1826818640033910784, 'dax-pay-merchant', 1828963432230584321);
INSERT INTO "public"."iam_role_path" VALUES (1829093606951608321, 1826818640033910784, 'dax-pay-merchant', 1828963432230584320);
INSERT INTO "public"."iam_role_path" VALUES (1829093606955802624, 1826818640033910784, 'dax-pay-merchant', 1828963432205418499);
INSERT INTO "public"."iam_role_path" VALUES (1829093606955802625, 1826818640033910784, 'dax-pay-merchant', 1828963432201224193);
INSERT INTO "public"."iam_role_path" VALUES (1829093606955802626, 1826818640033910784, 'dax-pay-merchant', 1828963432197029890);
INSERT INTO "public"."iam_role_path" VALUES (1829093606964191232, 1826818640033910784, 'dax-pay-merchant', 1828963432146698240);
INSERT INTO "public"."iam_role_path" VALUES (1829093606964191233, 1826818640033910784, 'dax-pay-merchant', 1828963432138309634);
INSERT INTO "public"."iam_role_path" VALUES (1829093606964191234, 1826818640033910784, 'dax-pay-merchant', 1828963432138309633);
INSERT INTO "public"."iam_role_path" VALUES (1829093606968385536, 1826818640033910784, 'dax-pay-merchant', 1828963432289304577);
INSERT INTO "public"."iam_role_path" VALUES (1829093606968385537, 1826818640033910784, 'dax-pay-merchant', 1828963432264138752);
INSERT INTO "public"."iam_role_path" VALUES (1829093606968385538, 1826818640033910784, 'dax-pay-merchant', 1828963432255750146);
INSERT INTO "public"."iam_role_path" VALUES (1829093606972579840, 1826818640033910784, 'dax-pay-merchant', 1828963432238972928);
INSERT INTO "public"."iam_role_path" VALUES (1829093606972579841, 1826818640033910784, 'dax-pay-merchant', 1828963432209612800);
INSERT INTO "public"."iam_role_path" VALUES (1829093606976774144, 1826818640033910784, 'dax-pay-merchant', 1828963432171864064);
INSERT INTO "public"."iam_role_path" VALUES (1829093606976774145, 1826818640033910784, 'dax-pay-merchant', 1828963432142503937);
INSERT INTO "public"."iam_role_path" VALUES (1829093977921019904, 1826818640033910784, 'dax-pay-merchant', 1828963432226390016);
INSERT INTO "public"."iam_role_path" VALUES (1829093977929408512, 1826818640033910784, 'dax-pay-merchant', 1828963432272527362);
INSERT INTO "public"."iam_role_path" VALUES (1829093977929408513, 1826818640033910784, 'dax-pay-merchant', 1828963432285110272);
INSERT INTO "public"."iam_role_path" VALUES (1829093977933602816, 1826818640033910784, 'dax-pay-merchant', 1828963432184446979);
INSERT INTO "public"."iam_role_path" VALUES (1829093977933602817, 1826818640033910784, 'dax-pay-merchant', 1828963432134115330);
INSERT INTO "public"."iam_role_path" VALUES (1829093977933602818, 1826818640033910784, 'dax-pay-merchant', 1828963432314470400);
INSERT INTO "public"."iam_role_path" VALUES (1829093977937797120, 1826818640033910784, 'dax-pay-merchant', 1828963432293498880);
INSERT INTO "public"."iam_role_path" VALUES (1829093977937797121, 1826818640033910784, 'dax-pay-merchant', 1828963432259944448);
INSERT INTO "public"."iam_role_path" VALUES (1829093977941991424, 1826818640033910784, 'dax-pay-merchant', 1828963432226390017);
INSERT INTO "public"."iam_role_path" VALUES (1829093977941991425, 1826818640033910784, 'dax-pay-merchant', 1828963432222195712);
INSERT INTO "public"."iam_role_path" VALUES (1829093977941991426, 1826818640033910784, 'dax-pay-merchant', 1828963432176058368);
INSERT INTO "public"."iam_role_path" VALUES (1828967540362674176, 1826818640033910784, 'dax-pay-merchant', 1828963432188641280);
INSERT INTO "public"."iam_role_path" VALUES (1828967540371062784, 1826818640033910784, 'dax-pay-merchant', 1828963432150892545);
INSERT INTO "public"."iam_role_path" VALUES (1828967540408811520, 1828680591068422144, 'dax-pay-merchant', 1828963432188641280);
INSERT INTO "public"."iam_role_path" VALUES (1828967540413005824, 1828680591068422144, 'dax-pay-merchant', 1828963432150892545);
INSERT INTO "public"."iam_role_path" VALUES (1829093977941991427, 1826818640033910784, 'dax-pay-merchant', 1828963432167669760);
INSERT INTO "public"."iam_role_path" VALUES (1829093977996517376, 1828680591068422144, 'dax-pay-merchant', 1828963432226390016);
INSERT INTO "public"."iam_role_path" VALUES (1829093978000711680, 1828680591068422144, 'dax-pay-merchant', 1828963432272527362);
INSERT INTO "public"."iam_role_path" VALUES (1829093978000711681, 1828680591068422144, 'dax-pay-merchant', 1828963432285110272);
INSERT INTO "public"."iam_role_path" VALUES (1829093978000711682, 1828680591068422144, 'dax-pay-merchant', 1828963432184446979);
INSERT INTO "public"."iam_role_path" VALUES (1829093978000711683, 1828680591068422144, 'dax-pay-merchant', 1828963432134115330);
INSERT INTO "public"."iam_role_path" VALUES (1829093978004905984, 1828680591068422144, 'dax-pay-merchant', 1828963432314470400);
INSERT INTO "public"."iam_role_path" VALUES (1829093978004905985, 1828680591068422144, 'dax-pay-merchant', 1828963432293498880);
INSERT INTO "public"."iam_role_path" VALUES (1829093978004905986, 1828680591068422144, 'dax-pay-merchant', 1828963432259944448);
INSERT INTO "public"."iam_role_path" VALUES (1829093978004905987, 1828680591068422144, 'dax-pay-merchant', 1828963432226390017);
INSERT INTO "public"."iam_role_path" VALUES (1829093978004905988, 1828680591068422144, 'dax-pay-merchant', 1828963432222195712);
INSERT INTO "public"."iam_role_path" VALUES (1829093978009100288, 1828680591068422144, 'dax-pay-merchant', 1828963432176058368);
INSERT INTO "public"."iam_role_path" VALUES (1829093978009100289, 1828680591068422144, 'dax-pay-merchant', 1828963432167669760);

-- ----------------------------
-- Table structure for iam_user_expand_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_user_expand_info";
CREATE TABLE "public"."iam_user_expand_info" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL,
  "sex" varchar(10) COLLATE "pg_catalog"."default",
  "avatar" varchar(300) COLLATE "pg_catalog"."default",
  "birthday" date,
  "last_login_time" timestamp(0),
  "register_time" timestamp(6),
  "current_login_time" timestamp(6),
  "initial_password" bool,
  "expire_password" bool,
  "last_change_password_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."iam_user_expand_info"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_user_expand_info"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."iam_user_expand_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."iam_user_expand_info"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."iam_user_expand_info"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."iam_user_expand_info"."version" IS '版本号';
COMMENT ON COLUMN "public"."iam_user_expand_info"."deleted" IS '删除标志';
COMMENT ON COLUMN "public"."iam_user_expand_info"."sex" IS '性别';
COMMENT ON COLUMN "public"."iam_user_expand_info"."avatar" IS '头像图片url';
COMMENT ON COLUMN "public"."iam_user_expand_info"."birthday" IS '生日';
COMMENT ON COLUMN "public"."iam_user_expand_info"."last_login_time" IS '上次登录时间';
COMMENT ON COLUMN "public"."iam_user_expand_info"."register_time" IS '注册时间';
COMMENT ON COLUMN "public"."iam_user_expand_info"."current_login_time" IS '本次登录时间';
COMMENT ON COLUMN "public"."iam_user_expand_info"."initial_password" IS '是否初始密码';
COMMENT ON COLUMN "public"."iam_user_expand_info"."expire_password" IS '密码是否过期';
COMMENT ON COLUMN "public"."iam_user_expand_info"."last_change_password_time" IS '上次修改密码时间';
COMMENT ON TABLE "public"."iam_user_expand_info" IS '用户扩展信息';

-- ----------------------------
-- Records of iam_user_expand_info
-- ----------------------------
INSERT INTO "public"."iam_user_expand_info" VALUES (1811365615815487488, 0, '2024-07-11 19:43:11.023201', 0, '2024-07-11 19:43:11.023201', 0, 'f', NULL, NULL, NULL, NULL, '2024-07-11 19:43:11.021597', NULL, 'f', 'f', NULL);
INSERT INTO "public"."iam_user_expand_info" VALUES (1811689994080333824, 1811365615815487488, '2024-07-12 17:12:08.833139', 1811365615815487488, '2024-07-12 17:12:08.833139', 0, 'f', NULL, NULL, NULL, NULL, '2024-07-12 17:12:08.829981', NULL, 'f', 'f', NULL);
INSERT INTO "public"."iam_user_expand_info" VALUES (1811690440006152192, 1811365615815487488, '2024-07-12 17:13:55.143576', 1811365615815487488, '2024-07-12 17:13:55.143576', 0, 'f', NULL, NULL, NULL, NULL, '2024-07-12 17:13:55.143064', NULL, 'f', 'f', NULL);
INSERT INTO "public"."iam_user_expand_info" VALUES (1827910922934001664, 1811365615815487488, '2024-08-26 11:28:19.816539', 1811365615815487488, '2024-08-26 11:28:19.816539', 0, 'f', NULL, NULL, NULL, NULL, '2024-08-26 11:28:19.814256', NULL, 'f', 'f', NULL);
INSERT INTO "public"."iam_user_expand_info" VALUES (1828624347955830784, 1827910922934001664, '2024-08-28 10:43:13.449201', 1827910922934001664, '2024-08-28 10:43:13.449201', 0, 'f', NULL, NULL, NULL, NULL, '2024-08-28 10:43:13.446981', NULL, 'f', 'f', NULL);
INSERT INTO "public"."iam_user_expand_info" VALUES (1851499412418453504, 1811365615815487488, '2024-10-30 13:40:33.777289', 1811365615815487488, '2024-10-30 13:40:33.777289', 0, 'f', NULL, NULL, NULL, NULL, '2024-10-30 13:40:33.776255', NULL, 'f', 'f', NULL);
INSERT INTO "public"."iam_user_expand_info" VALUES (1851584290367442944, 1811365615815487488, '2024-10-30 19:17:50.2588', 1811365615815487488, '2024-10-30 19:17:50.2588', 0, 'f', NULL, NULL, NULL, NULL, '2024-10-30 19:17:50.257758', NULL, 'f', 'f', NULL);
INSERT INTO "public"."iam_user_expand_info" VALUES (1851587325521006592, 1811365615815487488, '2024-10-30 19:29:53.893066', 1811365615815487488, '2024-10-30 19:29:53.893066', 0, 'f', NULL, NULL, NULL, NULL, '2024-10-30 19:29:53.893066', NULL, 'f', 'f', NULL);

-- ----------------------------
-- Table structure for iam_user_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_user_info";
CREATE TABLE "public"."iam_user_info" (
  "id" int8 NOT NULL,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL,
  "deleted" bool NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "account" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(120) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "administrator" bool NOT NULL,
  "status" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."iam_user_info"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_user_info"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."iam_user_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."iam_user_info"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."iam_user_info"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."iam_user_info"."version" IS '版本号';
COMMENT ON COLUMN "public"."iam_user_info"."deleted" IS '删除标志';
COMMENT ON COLUMN "public"."iam_user_info"."name" IS '名称';
COMMENT ON COLUMN "public"."iam_user_info"."account" IS '账号';
COMMENT ON COLUMN "public"."iam_user_info"."password" IS '密码';
COMMENT ON COLUMN "public"."iam_user_info"."phone" IS '手机号';
COMMENT ON COLUMN "public"."iam_user_info"."email" IS '邮箱';
COMMENT ON COLUMN "public"."iam_user_info"."administrator" IS '是否管理员';
COMMENT ON COLUMN "public"."iam_user_info"."status" IS '账号状态';
COMMENT ON TABLE "public"."iam_user_info" IS '用户核心信息';

-- ----------------------------
-- Records of iam_user_info
-- ----------------------------
INSERT INTO "public"."iam_user_info" VALUES (1811365615815487488, 0, '2024-07-11 19:43:11.013754', 0, '2024-07-11 19:43:32.925167', 1, 'f', '超级管理员', 'bootx', '$2a$10$knt/I7FYX9YpWYfjv4ChhuOhiYGf3/fCvrHxm51pis.OnNPBDvSeC', '13333333333', 'bootx@bootx.cn', 't', 'normal');
INSERT INTO "public"."iam_user_info" VALUES (1811689994080333824, 1811365615815487488, '2024-07-12 17:12:08.819164', 1811365615815487488, '2024-07-12 17:12:08.822', 0, 'f', 'daxpay管理员', 'daxpayadmin', '$2a$10$g0z/HDjLW5H78ngJwNh76uBxkoLwiDpJZKSXT4uq7.H.w84nhnRUq', '', '', 'f', 'normal');
INSERT INTO "public"."iam_user_info" VALUES (1811690440006152192, 1811365615815487488, '2024-07-12 17:13:55.135004', 1811365615815487488, '2024-07-13 21:04:07.901484', 1, 'f', 'daxpay', 'daxpay', '$2a$10$gnZOm7R1kPXAfE/Blis1jOFd7yf8.ts9o5aHvqk4Pe9Kv01KEO3/K', '', '', 'f', 'normal');
INSERT INTO "public"."iam_user_info" VALUES (1827910922934001664, 1811365615815487488, '2024-08-26 11:28:19.629255', 1811365615815487488, '2024-08-26 11:28:19.793112', 0, 'f', '一杯广播', 'ybgn', '$2a$10$7wOKvdcW2k3WsMzg/fUAqu/Y..9Jb7fxXIeBKlQOuoK0peqP111Lq', '', '', 'f', 'normal');
INSERT INTO "public"."iam_user_info" VALUES (1828624347955830784, 1827910922934001664, '2024-08-28 10:43:13.410201', 1827910922934001664, '2024-08-28 10:43:13.410201', 0, 'f', 'ybgn001', 'ybgn001', '$2a$10$1D9GkCe7YhFqjZMzBluQ6.YOk09Re1pykFT0shRNFjnrVLhgn3GG.', '', '', 'f', 'normal');
INSERT INTO "public"."iam_user_info" VALUES (1851499412418453504, 1811365615815487488, '2024-10-30 13:40:33.77363', 1811365615815487488, '2024-10-30 13:40:33.77363', 0, 'f', '测试服务商', 'csisv', '$2a$10$B4hBdiuc1SQKgzJltwon/etS.yqmXZZS2Jij2H93j119dmlnPRXuW', '', '', 'f', 'normal');
INSERT INTO "public"."iam_user_info" VALUES (1851584290367442944, 1811365615815487488, '2024-10-30 19:17:50.253277', 1811365615815487488, '2024-10-30 19:17:50.253277', 0, 'f', '支付通道', 'daxpay111', '$2a$10$u1VqqsEOywnhQTrbyAFtBexmiSQZ32k7gpvcLbuwk2A3tpoarHA8S', '', '', 'f', 'normal');
INSERT INTO "public"."iam_user_info" VALUES (1851587325521006592, 1811365615815487488, '2024-10-30 19:29:53.890227', 1811365615815487488, '2024-10-30 19:29:53.890227', 0, 'f', '123', 'bootx1231', '$2a$10$ZGtSjmFP7ajbDSrTJLUku.9x4bANTbKk7eolIzTX90Ox9XS6M3g0C', '', '', 'f', 'normal');

-- ----------------------------
-- Table structure for iam_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."iam_user_role";
CREATE TABLE "public"."iam_user_role" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."iam_user_role"."id" IS '主键';
COMMENT ON COLUMN "public"."iam_user_role"."user_id" IS '用户';
COMMENT ON COLUMN "public"."iam_user_role"."role_id" IS '角色';
COMMENT ON TABLE "public"."iam_user_role" IS '用户角色关联关系';

-- ----------------------------
-- Records of iam_user_role
-- ----------------------------
INSERT INTO "public"."iam_user_role" VALUES (1812414360145350656, 1811690440006152192, 1810205411434328064);
INSERT INTO "public"."iam_user_role" VALUES (1818534592677240832, 1811689994080333824, 1810203792869191680);
INSERT INTO "public"."iam_user_role" VALUES (1827910923944828928, 1827910922934001664, 1826818640033910784);
INSERT INTO "public"."iam_user_role" VALUES (1828966173665492992, 1828624347955830784, 1828680591068422144);
INSERT INTO "public"."iam_user_role" VALUES (1851499412615585792, 1851499412418453504, 1851499232814161920);
INSERT INTO "public"."iam_user_role" VALUES (1851584290560380928, 1851584290367442944, 1851499232814161920);
INSERT INTO "public"."iam_user_role" VALUES (1851587325571338240, 1851587325521006592, 1826818640033910784);

-- ----------------------------
-- Table structure for starter_audit_login_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."starter_audit_login_log";
CREATE TABLE "public"."starter_audit_login_log" (
  "id" int8 NOT NULL,
  "user_id" int8,
  "account" varchar(100) COLLATE "pg_catalog"."default",
  "login" bool,
  "client" varchar(20) COLLATE "pg_catalog"."default",
  "login_type" varchar(20) COLLATE "pg_catalog"."default",
  "ip" varchar(80) COLLATE "pg_catalog"."default",
  "login_location" varchar(100) COLLATE "pg_catalog"."default",
  "browser" varchar(200) COLLATE "pg_catalog"."default",
  "os" varchar(100) COLLATE "pg_catalog"."default",
  "msg" text COLLATE "pg_catalog"."default",
  "login_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."starter_audit_login_log"."id" IS '主键';
COMMENT ON COLUMN "public"."starter_audit_login_log"."user_id" IS '用户账号ID';
COMMENT ON COLUMN "public"."starter_audit_login_log"."account" IS '用户名称';
COMMENT ON COLUMN "public"."starter_audit_login_log"."login" IS '登录成功状态';
COMMENT ON COLUMN "public"."starter_audit_login_log"."client" IS '登录终端';
COMMENT ON COLUMN "public"."starter_audit_login_log"."login_type" IS '登录方式';
COMMENT ON COLUMN "public"."starter_audit_login_log"."ip" IS '登录IP地址';
COMMENT ON COLUMN "public"."starter_audit_login_log"."login_location" IS '登录地点';
COMMENT ON COLUMN "public"."starter_audit_login_log"."browser" IS '浏览器类型';
COMMENT ON COLUMN "public"."starter_audit_login_log"."os" IS '操作系统';
COMMENT ON COLUMN "public"."starter_audit_login_log"."msg" IS '提示消息';
COMMENT ON COLUMN "public"."starter_audit_login_log"."login_time" IS '访问时间';
COMMENT ON TABLE "public"."starter_audit_login_log" IS '登录日志';

-- ----------------------------
-- Records of starter_audit_login_log
-- ----------------------------
INSERT INTO "public"."starter_audit_login_log" VALUES (1823990493995339776, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 127.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-15 15:49:56.526642');
INSERT INTO "public"."starter_audit_login_log" VALUES (1824327580149923840, 1811690440006152192, 'daxpay', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 127.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-16 14:09:24.122528');
INSERT INTO "public"."starter_audit_login_log" VALUES (1824335434651029504, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 127.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-16 14:40:36.782239');
INSERT INTO "public"."starter_audit_login_log" VALUES (1824722481005592576, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 127.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-17 16:18:35.822914');
INSERT INTO "public"."starter_audit_login_log" VALUES (1827908386709643264, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 127.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-26 11:18:14.926648');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828393910532644864, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-27 19:27:32.830951');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828394542312267776, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-27 19:30:03.471589');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828396875838509056, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-27 19:39:19.823465');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828397027588427776, 1827910922934001664, 'ybgn', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-27 19:39:56.008226');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828397148912820224, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-27 19:40:24.933764');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828397240990375936, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-27 19:40:46.886934');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828397451435384832, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-27 19:41:37.060836');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828697263850508288, 1828624347955830784, 'ybgn001', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:32:57.88385');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828697322897920000, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:33:11.988077');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828697488254148608, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:33:51.302287');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828697684157505536, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:34:38.119564');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828697809311342592, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:35:07.958562');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828697984213819392, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:35:49.659182');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828698008284930048, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:35:55.397514');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828702187627782144, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 15:52:31.814814');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828704385619279872, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 16:01:15.854518');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828710395142496256, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 16:25:08.639955');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828719500519387136, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 17:01:19.526453');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828719670426447872, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 17:02:00.055112');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828735201116221440, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-28 18:03:42.84443');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828963392531496960, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:10:27.914404');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828964902397116416, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:16:27.910376');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828964907769954304, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:16:29.193545');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828965116482715648, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:17:18.954508');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828966057718087680, 1828624347955830784, 'ybgn001', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:21:03.363082');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828966470051725312, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:22:41.670918');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828966800701292544, 1828624347955830784, 'ybgn001', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:24:00.503995');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828970002276454400, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:36:43.804762');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828970456263815168, 1828624347955830784, 'ybgn001', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 09:38:32.051354');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828985320709419008, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 10:37:36.017571');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828994129347477504, 1811365615815487488, 'bootx', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 11:12:36.144981');
INSERT INTO "public"."starter_audit_login_log" VALUES (1828994401905934336, 1827910922934001664, 'ybgn', 't', 'dax-pay-merchant', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-08-29 11:13:41.143599');
INSERT INTO "public"."starter_audit_login_log" VALUES (1830868896564637696, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-09-03 15:22:15.484607');
INSERT INTO "public"."starter_audit_login_log" VALUES (1834154978433425408, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-09-12 16:59:58.453226');
INSERT INTO "public"."starter_audit_login_log" VALUES (1836248507712372736, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-09-18 11:38:54.721');
INSERT INTO "public"."starter_audit_login_log" VALUES (1837024926470053888, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-09-20 15:04:07.354498');
INSERT INTO "public"."starter_audit_login_log" VALUES (1837037354226360320, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-09-20 15:53:30.406778');
INSERT INTO "public"."starter_audit_login_log" VALUES (1837380001029357568, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 128.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-09-21 14:35:03.760353');
INSERT INTO "public"."starter_audit_login_log" VALUES (1840658291656019968, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 129.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-09-30 15:41:49.15139');
INSERT INTO "public"."starter_audit_login_log" VALUES (1845722021146255360, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 129.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-10-14 15:03:16.344095');
INSERT INTO "public"."starter_audit_login_log" VALUES (1845746070303834112, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 129.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-10-14 16:38:50.109366');
INSERT INTO "public"."starter_audit_login_log" VALUES (1851454447566970880, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 130.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-10-30 10:41:53.30678');
INSERT INTO "public"."starter_audit_login_log" VALUES (1854333486044528640, 1811365615815487488, 'bootx', 't', 'dax-pay-admin', 'password', '0:0:0:0:0:0:0:1', '未知', 'MSEdge 130.0.0.0', 'Windows 10 or Windows Server 2016', NULL, '2024-11-07 09:22:09.567259');

-- ----------------------------
-- Table structure for starter_audit_operate_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."starter_audit_operate_log";
CREATE TABLE "public"."starter_audit_operate_log" (
  "id" int8 NOT NULL,
  "title" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "operate_id" int8,
  "account" varchar(100) COLLATE "pg_catalog"."default",
  "business_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "method" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "request_method" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "operate_url" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "operate_ip" varchar(80) COLLATE "pg_catalog"."default",
  "operate_location" varchar(50) COLLATE "pg_catalog"."default",
  "operate_param" text COLLATE "pg_catalog"."default",
  "operate_return" text COLLATE "pg_catalog"."default",
  "success" bool,
  "error_msg" text COLLATE "pg_catalog"."default",
  "operate_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."starter_audit_operate_log"."id" IS '主键';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."title" IS '操作模块';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."operate_id" IS '操作人员id';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."account" IS '操作人员账号';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."business_type" IS '业务类型';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."method" IS '请求方法';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."request_method" IS '请求方式';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."operate_url" IS '请求url';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."operate_ip" IS '操作ip';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."operate_location" IS '操作地点';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."operate_param" IS '请求参数';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."operate_return" IS '返回参数';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."success" IS '操作状态';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."error_msg" IS '错误消息';
COMMENT ON COLUMN "public"."starter_audit_operate_log"."operate_time" IS '操作时间';
COMMENT ON TABLE "public"."starter_audit_operate_log" IS '操作日志';

-- ----------------------------
-- Records of starter_audit_operate_log
-- ----------------------------
INSERT INTO "public"."starter_audit_operate_log" VALUES (1812110800621465600, '批量重置密码', 1811365615815487488, 'bootx', 'update', 'cn.bootx.platform.iam.controller.user.UserAdminController#restartPasswordBatch', 'POST', '/user/admin/restartPasswordBatch', '0:0:0:0:0:0:0:1', '未知', '[{"userIds":["1811690440006152192"],"newPassword":"123456"}]', NULL, 't', NULL, '2024-07-13 21:04:08.011076');

-- ----------------------------
-- Table structure for starter_file_platform
-- ----------------------------
DROP TABLE IF EXISTS "public"."starter_file_platform";
CREATE TABLE "public"."starter_file_platform" (
  "id" int8 NOT NULL,
  "type" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(200) COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default",
  "default_platform" bool,
  "creator" int8,
  "create_time" timestamp(6),
  "last_modifier" int8,
  "last_modified_time" timestamp(6),
  "version" int4 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."starter_file_platform"."id" IS '文件id';
COMMENT ON COLUMN "public"."starter_file_platform"."type" IS '平台类型';
COMMENT ON COLUMN "public"."starter_file_platform"."name" IS '名称';
COMMENT ON COLUMN "public"."starter_file_platform"."url" IS '访问地址';
COMMENT ON COLUMN "public"."starter_file_platform"."default_platform" IS '默认存储平台';
COMMENT ON COLUMN "public"."starter_file_platform"."creator" IS '创建者ID';
COMMENT ON COLUMN "public"."starter_file_platform"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."starter_file_platform"."last_modifier" IS '最后修改ID';
COMMENT ON COLUMN "public"."starter_file_platform"."last_modified_time" IS '最后修改时间';
COMMENT ON COLUMN "public"."starter_file_platform"."version" IS '版本号';
COMMENT ON TABLE "public"."starter_file_platform" IS '文件存储平台';

-- ----------------------------
-- Records of starter_file_platform
-- ----------------------------
INSERT INTO "public"."starter_file_platform" VALUES (1000, 'local', '本地存储', 'http://127.0.0.1:9999', 'f', 1811365615815487488, '2024-08-13 12:32:37', 1811365615815487488, '2024-08-13 11:14:49.335313', 0);
INSERT INTO "public"."starter_file_platform" VALUES (2000, 'minio', 'minio存储', 'http://127.0.0.1:9002/daxpay', 't', 1811365615815487488, '2024-08-13 12:32:40', 1811365615815487488, '2024-08-13 11:59:16.24726', 3);

-- ----------------------------
-- Table structure for starter_file_upload_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."starter_file_upload_info";
CREATE TABLE "public"."starter_file_upload_info" (
  "id" int8 NOT NULL,
  "url" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "size" int8,
  "filename" varchar(256) COLLATE "pg_catalog"."default",
  "original_filename" varchar(256) COLLATE "pg_catalog"."default",
  "base_path" varchar(256) COLLATE "pg_catalog"."default",
  "path" varchar(256) COLLATE "pg_catalog"."default",
  "ext" varchar(32) COLLATE "pg_catalog"."default",
  "content_type" varchar(128) COLLATE "pg_catalog"."default",
  "platform" varchar(32) COLLATE "pg_catalog"."default",
  "th_url" varchar(512) COLLATE "pg_catalog"."default",
  "th_filename" varchar(256) COLLATE "pg_catalog"."default",
  "th_size" int8,
  "th_content_type" varchar(128) COLLATE "pg_catalog"."default",
  "object_id" varchar(32) COLLATE "pg_catalog"."default",
  "object_type" varchar(32) COLLATE "pg_catalog"."default",
  "metadata" text COLLATE "pg_catalog"."default",
  "user_metadata" text COLLATE "pg_catalog"."default",
  "th_metadata" text COLLATE "pg_catalog"."default",
  "th_user_metadata" text COLLATE "pg_catalog"."default",
  "attr" text COLLATE "pg_catalog"."default",
  "file_acl" varchar(32) COLLATE "pg_catalog"."default",
  "th_file_acl" varchar(32) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."starter_file_upload_info"."id" IS '文件id';
COMMENT ON COLUMN "public"."starter_file_upload_info"."url" IS '文件访问地址';
COMMENT ON COLUMN "public"."starter_file_upload_info"."size" IS '文件大小，单位字节';
COMMENT ON COLUMN "public"."starter_file_upload_info"."filename" IS '文件名称';
COMMENT ON COLUMN "public"."starter_file_upload_info"."original_filename" IS '原始文件名';
COMMENT ON COLUMN "public"."starter_file_upload_info"."base_path" IS '基础存储路径';
COMMENT ON COLUMN "public"."starter_file_upload_info"."path" IS '存储路径';
COMMENT ON COLUMN "public"."starter_file_upload_info"."ext" IS '文件扩展名';
COMMENT ON COLUMN "public"."starter_file_upload_info"."content_type" IS 'MIME类型';
COMMENT ON COLUMN "public"."starter_file_upload_info"."platform" IS '存储平台';
COMMENT ON COLUMN "public"."starter_file_upload_info"."th_url" IS '缩略图访问路径';
COMMENT ON COLUMN "public"."starter_file_upload_info"."th_filename" IS '缩略图名称';
COMMENT ON COLUMN "public"."starter_file_upload_info"."th_size" IS '缩略图大小，单位字节';
COMMENT ON COLUMN "public"."starter_file_upload_info"."th_content_type" IS '缩略图MIME类型';
COMMENT ON COLUMN "public"."starter_file_upload_info"."object_id" IS '文件所属对象id';
COMMENT ON COLUMN "public"."starter_file_upload_info"."object_type" IS '文件所属对象类型，例如用户头像，评价图片';
COMMENT ON COLUMN "public"."starter_file_upload_info"."metadata" IS '文件元数据';
COMMENT ON COLUMN "public"."starter_file_upload_info"."user_metadata" IS '文件用户元数据';
COMMENT ON COLUMN "public"."starter_file_upload_info"."th_metadata" IS '缩略图元数据';
COMMENT ON COLUMN "public"."starter_file_upload_info"."th_user_metadata" IS '缩略图用户元数据';
COMMENT ON COLUMN "public"."starter_file_upload_info"."attr" IS '附加属性';
COMMENT ON COLUMN "public"."starter_file_upload_info"."file_acl" IS '文件ACL';
COMMENT ON COLUMN "public"."starter_file_upload_info"."th_file_acl" IS '缩略图文件ACL';
COMMENT ON COLUMN "public"."starter_file_upload_info"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."starter_file_upload_info" IS '文件记录表';

-- ----------------------------
-- Records of starter_file_upload_info
-- ----------------------------
INSERT INTO "public"."starter_file_upload_info" VALUES (1821097013954715648, '/file/66b32c610d41ab408c70e774.png', 216374, '66b32c610d41ab408c70e774.png', '微信截图_20240514205633.png', '/file/', '', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-07 08:12:17.079');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822969544408014848, 'file/66b9fc4fa1fa0bba28d38189.png', 321611, '66b9fc4fa1fa0bba28d38189.png', '微信截图_20240514202144.png', 'file/', '', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:13:03.035');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822969908121280512, 'file/aaa/66b9fca5a1fa0bba28d3818a.png', 321611, '66b9fca5a1fa0bba28d3818a.png', '微信截图_20240514202144.png', 'file/', 'aaa/', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:14:29.892');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971444570333184, 'file/2024/08/1266b9fe14a1fa0bba28d3818b.png', 321611, '66b9fe14a1fa0bba28d3818b.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:36.211');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971456683483136, 'file/2024/08/1266b9fe17a1fa0bba28d3818c.png', 321611, '66b9fe17a1fa0bba28d3818c.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:39.098');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971459174899712, 'file/2024/08/1266b9fe17a1fa0bba28d3818d.png', 321611, '66b9fe17a1fa0bba28d3818d.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:39.693');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971462438068224, 'file/2024/08/1266b9fe18a1fa0bba28d3818e.png', 321611, '66b9fe18a1fa0bba28d3818e.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:40.471');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971464799461376, 'file/2024/08/1266b9fe19a1fa0bba28d3818f.png', 321611, '66b9fe19a1fa0bba28d3818f.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:41.034');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971465835454464, 'file/2024/08/1266b9fe19a1fa0bba28d38190.png', 321611, '66b9fe19a1fa0bba28d38190.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:41.28');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971466686898176, 'file/2024/08/1266b9fe19a1fa0bba28d38191.png', 321611, '66b9fe19a1fa0bba28d38191.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:41.484');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971467467038720, 'file/2024/08/1266b9fe19a1fa0bba28d38192.png', 321611, '66b9fe19a1fa0bba28d38192.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:20:41.671');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971667761831936, 'file/2024/08/1266b9fe49a1fa0bba28d38193.png', 321611, '66b9fe49a1fa0bba28d38193.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:21:29.424');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822971796644405248, 'file/2024/08/1266b9fe68a1fa0bba28d38194.png', 321611, '66b9fe68a1fa0bba28d38194.png', '微信截图_20240514202144.png', 'file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:22:00.149');
INSERT INTO "public"."starter_file_upload_info" VALUES (1822976328996659200, '/file/2024/08/1266ba02a0a1faf26c0c033991.png', 216374, '66ba02a0a1faf26c0c033991.png', '微信截图_20240514205633.png', '/file/', '2024/08/12', 'png', 'image/png', 'local', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 12:40:00.707');
INSERT INTO "public"."starter_file_upload_info" VALUES (1823203227169546240, '/file//2024/08/13/66bad5f061236ef74fc35d2f.png', 822076, '66bad5f061236ef74fc35d2f.png', '微信截图_20240514202014.png', '/file/', '/2024/08/13/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 03:41:36.828');
INSERT INTO "public"."starter_file_upload_info" VALUES (1823204644156456960, '/file/2024/08/13/66bad7426123c55acd645891.png', 209410, '66bad7426123c55acd645891.png', 'QQ图片20240531181517.png', '/file/', '2024/08/13/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 03:47:14.767');
INSERT INTO "public"."starter_file_upload_info" VALUES (1823210440613294080, '/file/2024/08/13/66badca8612381f3dab8b659.sql', 484222, '66badca8612381f3dab8b659.sql', 'dax-pay.sql', '/file/', '2024/08/13/', 'sql', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 04:10:16.775');
INSERT INTO "public"."starter_file_upload_info" VALUES (1824779093602971648, '/file/2024/08/17/66c09194fb5fa7f335dbd1e7.jpg', 107464, '66c09194fb5fa7f335dbd1e7.jpg', '微信图片_20220522132928.jpg', '/file/', '2024/08/17/', 'jpg', 'image/jpeg', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-17 12:03:32.838');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825718211879563264, '/file/66c3fc341f35f424dba37510.csv', 775, '66c3fc341f35f424dba37510.csv', '交易对账单-支付宝-20240818.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 02:15:16.078');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825718295480430592, '/file/66c3fc481f35f424dba37511.csv', 775, '66c3fc481f35f424dba37511.csv', '交易对账单-支付宝-20240818.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 02:15:36.48');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825720111223992320, '/file/66c3fdf91f35f424dba37512.csv', 775, '66c3fdf91f35f424dba37512.csv', '交易对账单-支付宝-20240818.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 02:22:49.392');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825753217356218368, '/file/2024/08/20/66c41cce1f352f391eadba3e.xlsx', 9614, '66c41cce1f352f391eadba3e.xlsx', '消息订阅.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 04:34:22.055');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825753283894657024, '/file/2024/08/20/66c41cde1f352f391eadba3f.xlsx', 9614, '66c41cde1f352f391eadba3f.xlsx', '消息订阅.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 04:34:38.355');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825793692494667776, '/file/2024/08/20/66c442801f35438ca96741b3.xlsx', 9627, '66c442801f35438ca96741b3.xlsx', '消息订阅.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 07:15:12.039');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825795353548103680, '/file/2024/08/20/66c4440c1f35438ca96741b4.png', 56704, '66c4440c1f35438ca96741b4.png', 'DD94AFCB-E1EA-403a-A5BB-606CF977034C.png', '/file/', '2024/08/20/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 07:21:48.536');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825795565142351872, '/file/2024/08/20/66c4443e1f35438ca96741b5.png', 56704, '66c4443e1f35438ca96741b5.png', 'DD94AFCB-E1EA-403a-A5BB-606CF977034C.png', '/file/', '2024/08/20/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 07:22:38.992');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825795861373460480, '/file/2024/08/20/66c444851f35438ca96741b6.png', 56704, '66c444851f35438ca96741b6.png', 'DD94AFCB-E1EA-403a-A5BB-606CF977034C.png', '/file/', '2024/08/20/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 07:23:49.53');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825796076641959936, '/file/2024/08/20/66c444b21f35453b8057d0fb.png', 56704, '66c444b21f35453b8057d0fb.png', 'DD94AFCB-E1EA-403a-A5BB-606CF977034C.png', '/file/', '2024/08/20/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 07:24:18.784');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825799359162990592, '/file/2024/08/20/66c447c71f35453b8057d0fc.xlsx', 9614, '66c447c71f35453b8057d0fc.xlsx', '消息订阅.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:37:43.593469');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825799570165841920, '/file/66c447f91f35453b8057d0fd.csv', 775, '66c447f91f35453b8057d0fd.csv', '交易对账单-支付宝-20240816.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:38:33.899827');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825799577078054912, '/file/2024/08/20/66c447fb1f35453b8057d0fe.xlsx', 9614, '66c447fb1f35453b8057d0fe.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:38:35.546999');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825799590139117568, '/file/66c447fe1f35453b8057d0ff.csv', 1189, '66c447fe1f35453b8057d0ff.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:38:38.662392');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825799613258121216, '/file/2024/08/20/66c448041f35453b8057d100.xlsx', 9614, '66c448041f35453b8057d100.xlsx', '消息订阅.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 15:38:44.173717');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825808183974379520, '/file/2024/08/20/66c44ffc1f35fa1c978ea54c.xlsx', 9613, '66c44ffc1f35fa1c978ea54c.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:12:47.587103');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825808183991156736, '/file/2024/08/20/66c44ffc1f35fa1c978ea54d.xlsx', 9612, '66c44ffc1f35fa1c978ea54d.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:12:47.588101');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825808257634746368, '/file/2024/08/20/66c450111f35fa1c978ea54e.xlsx', 9613, '66c450111f35fa1c978ea54e.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:13:05.154672');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826528037253439488, '/file/66c6ee69c76387d97684a0d3.csv', 4873, '66c6ee69c76387d97684a0d3.csv', '交易对账单-微信-20240821.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 15:53:13.985807');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825808277838708736, '/file/2024/08/20/66c450151f35fa1c978ea54f.xlsx', 9613, '66c450151f35fa1c978ea54f.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:13:09.971531');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825813275939119104, '/file/66c454bd1f35808c73fcb4f9.csv', 775, '66c454bd1f35808c73fcb4f9.csv', '交易对账单-支付宝-20240816.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:33:01.603346');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825816007903223808, '/file/66c457481f35808c73fcb4fa.csv', 1189, '66c457481f35808c73fcb4fa.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 16:43:52.960613');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825820562539880448, '/file/66c45b861f35808c73fcb4fb.csv', 1189, '66c45b861f35808c73fcb4fb.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:01:58.872311');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825820967122440192, '/file/66c45be61f3570ed83b5deda.csv', 1189, '66c45be61f3570ed83b5deda.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:03:35.323328');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825821293732888576, '/file/66c45c341f35156de355269c.csv', 1189, '66c45c341f35156de355269c.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:04:53.19356');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825821723045068800, '/file/66c45c9b1f35156de355269d.csv', 1189, '66c45c9b1f35156de355269d.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:06:35.557476');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825821752279367680, '/file/2024/08/20/66c45ca21f35156de355269e.xlsx', 9786, '66c45ca21f35156de355269e.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:06:42.527505');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825830633537777664, '/file/2024/08/20/66c464e71f35b610eeff97b1.xlsx', 9795, '66c464e71f35b610eeff97b1.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:41:59.981496');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825831496863911936, '/file/66c465b51f3576080962d6c3.csv', 1189, '66c465b51f3576080962d6c3.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:45:25.809379');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825834316396695552, '/file/2024/08/20/66c468551f3576080962d6c4.xlsx', 9796, '66c468551f3576080962d6c4.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:56:38.046761');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825834800268382208, '/file/2024/08/20/66c468c91f3576080962d6c5.xlsx', 9796, '66c468c91f3576080962d6c5.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 17:58:33.411027');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825835210064465920, '/file/2024/08/20/66c4692a1f3576080962d6c6.xlsx', 9795, '66c4692a1f3576080962d6c6.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 18:00:11.113848');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825843546990252032, '/file/66c470ee1f3576080962d6c7.csv', 1189, '66c470ee1f3576080962d6c7.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 18:33:18.791522');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825844129692323840, '/file/2024/08/20/66c471791f3576080962d6c8.xlsx', 9811, '66c471791f3576080962d6c8.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 18:35:37.719031');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825844629024182272, '/file/66c471f01f35aed981cc6a59.csv', 1189, '66c471f01f35aed981cc6a59.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 18:37:36.758077');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825844842937880576, '/file/2024/08/20/66c472231f35aed981cc6a5a.xlsx', 9819, '66c472231f35aed981cc6a5a.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 18:38:27.770051');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825847210479955968, '/file/66c474571f357b60c1a2b78a.csv', 1189, '66c474571f357b60c1a2b78a.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 18:47:52.223284');
INSERT INTO "public"."starter_file_upload_info" VALUES (1825847359704903680, '/file/2024/08/20/66c4747b1f357b60c1a2b78b.xlsx', 9840, '66c4747b1f357b60c1a2b78b.xlsx', '测试对账.xlsx', '/file/', '2024/08/20/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-20 18:48:27.813444');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826097618230136832, '/file/66c55d8d0d41b292dd16e301.csv', 1189, '66c55d8d0d41b292dd16e301.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 11:22:54.093713');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826097630125182976, '/file/2024/08/21/66c55d900d41b292dd16e302.xlsx', 9823, '66c55d900d41b292dd16e302.xlsx', '测试对账.xlsx', '/file/', '2024/08/21/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 11:22:56.932144');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826104071162494976, '/file/66c563900d413c77079c09f3.csv', 1189, '66c563900d413c77079c09f3.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 11:48:32.583252');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826104244588576768, '/file/2024/08/21/66c563b90d413c77079c09f4.xlsx', 9823, '66c563b90d413c77079c09f4.xlsx', '外部交易明细.xlsx', '/file/', '2024/08/21/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 11:49:13.942925');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826108050550398976, '/file/66c567440d41d39e503adbf7.csv', 1189, '66c567440d41d39e503adbf7.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 12:04:21.352012');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826108060998410240, '/file/2024/08/21/66c567470d41d39e503adbf8.xlsx', 9823, '66c567470d41d39e503adbf8.xlsx', '外部交易明细.xlsx', '/file/', '2024/08/21/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 12:04:23.846222');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826144377513820160, '/file/66c589190d41534805a9a0c5.csv', 1189, '66c589190d41534805a9a0c5.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 14:28:42.375373');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826144389043961856, '/file/2024/08/21/66c5891d0d41534805a9a0c6.xlsx', 9819, '66c5891d0d41534805a9a0c6.xlsx', '测试对账.xlsx', '/file/', '2024/08/21/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-21 14:28:45.126552');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826454887404781568, '/file/66c6aa49c763a99769caae79.xlsx', 2564, '66c6aa49c763a99769caae79.xlsx', '交易对账单-微信-20240820.xlsx', '/file/', '', 'xlsx', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:02:33.686962');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826454907948482560, '/file/2024/08/22/66c6aa4ec763a99769caae7a.xlsx', 9620, '66c6aa4ec763a99769caae7a.xlsx', '测试对账.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:02:38.603264');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826455432215511040, '/file/66c6aacbc763a99769caae7b.xlsx', 2564, '66c6aacbc763a99769caae7b.xlsx', '交易对账单-微信-20240820.xlsx', '/file/', '', 'xlsx', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:04:43.594394');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826455601317265408, '/file/66c6aaf3c763a99769caae7c.xlsx', 4873, '66c6aaf3c763a99769caae7c.xlsx', '交易对账单-微信-20240821.xlsx', '/file/', '', 'xlsx', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:05:23.911901');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826455623035371520, '/file/2024/08/22/66c6aaf8c763a99769caae7d.xlsx', 9619, '66c6aaf8c763a99769caae7d.xlsx', '测试对账.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:05:29.093238');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826455963705131008, '/file/66c6ab4ac763a99769caae7e.xlsx', 2564, '66c6ab4ac763a99769caae7e.xlsx', '交易对账单-微信-20240820.xlsx', '/file/', '', 'xlsx', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:06:50.312192');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826456479956758528, '/file/66c6abc4c7633375f8725b9b.xlsx', 4873, '66c6abc4c7633375f8725b9b.xlsx', '交易对账单-微信-20240821.xlsx', '/file/', '', 'xlsx', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:08:53.391935');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826456537934622720, '/file/2024/08/22/66c6abd3c7633375f8725b9c.xlsx', 10486, '66c6abd3c7633375f8725b9c.xlsx', '测试对账.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 11:09:07.222795');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826528050088009728, '/file/2024/08/22/66c6ee6dc76387d97684a0d4.xlsx', 10587, '66c6ee6dc76387d97684a0d4.xlsx', '订阅消息.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 15:53:17.048532');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826532233684037632, '/file/66c6f252c76353f70eacf1de.csv', 4873, '66c6f252c76353f70eacf1de.csv', '交易对账单-微信-20240821.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:09:54.492768');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826532244555673600, '/file/2024/08/22/66c6f254c76353f70eacf1df.xlsx', 10587, '66c6f254c76353f70eacf1df.xlsx', '外部交易明细.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:09:57.086142');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826534025192910848, '/file/66c6f3fdc76353f70eacf1e0.csv', 4873, '66c6f3fdc76353f70eacf1e0.csv', '交易对账单-微信-20240821.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:17:01.624309');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826534549581574144, '/file/66c6f47ac76353f70eacf1e1.csv', 4873, '66c6f47ac76353f70eacf1e1.csv', '交易对账单-微信-20240821.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:19:06.648517');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826535790386720768, '/file/66c6f5a2c76353f70eacf1e2.csv', 4873, '66c6f5a2c76353f70eacf1e2.csv', '交易对账单-微信-20240821.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:24:02.478931');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826535798624333824, '/file/2024/08/22/66c6f5a4c76353f70eacf1e3.xlsx', 10599, '66c6f5a4c76353f70eacf1e3.xlsx', '测试对账.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 16:24:04.442922');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826547489412079616, '/file/66c70087c763e807cbf7de4c.csv', 641, '66c70087c763e807cbf7de4c.csv', '交易对账单-支付宝-20240821.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 17:10:31.742535');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826547501512646656, '/file/2024/08/22/66c7008ac763e807cbf7de4d.xlsx', 9769, '66c7008ac763e807cbf7de4d.xlsx', '外部交易明细.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 17:10:34.629401');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826548693462540288, '/file/66c701a6c763e807cbf7de4e.csv', 4873, '66c701a6c763e807cbf7de4e.csv', '交易对账单-微信-20240821.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 17:15:18.81236');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826548700915818496, '/file/2024/08/22/66c701a8c763e807cbf7de4f.xlsx', 10859, '66c701a8c763e807cbf7de4f.xlsx', '测试对账.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 17:15:20.589063');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826550241479413760, '/file/66c70317c763d39942d0f55c.csv', 1189, '66c70317c763d39942d0f55c.csv', '交易对账单-支付宝-20240819.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 17:21:27.886652');
INSERT INTO "public"."starter_file_upload_info" VALUES (1826550253630312448, '/file/2024/08/22/66c7031ac763d39942d0f55d.xlsx', 9951, '66c7031ac763d39942d0f55d.xlsx', '测试对账.xlsx', '/file/', '2024/08/22/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-22 17:21:30.785225');
INSERT INTO "public"."starter_file_upload_info" VALUES (1829092824449552384, '/file/66d0430e2725ea0e6dd63e99.csv', 975, '66d0430e2725ea0e6dd63e99.csv', '交易对账单-支付宝-20240825.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 17:44:46.899974');
INSERT INTO "public"."starter_file_upload_info" VALUES (1829092838819237888, '/file/2024/08/29/66d043122725ea0e6dd63e9a.xlsx', 9879, '66d043122725ea0e6dd63e9a.xlsx', '分账单.xlsx', '/file/', '2024/08/29/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-29 17:44:50.332586');
INSERT INTO "public"."starter_file_upload_info" VALUES (1829376511166722048, '/file/66d14b42e537e3f57615df0e.csv', 773, '66d14b42e537e3f57615df0e.csv', '交易对账单-支付宝-20240829.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-30 12:32:03.082505');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432967571877888, '/file/66d523299b65f788a54f4345.csv', 588, '66d523299b65f788a54f4345.csv', '交易对账单-支付宝-20240901.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:01.924318');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432971883622400, '/file/2024/09/02/66d5232a9b65f788a54f4346.xlsx', 9725, '66d5232a9b65f788a54f4346.xlsx', '【2024-09-01】 - 测试应用2 - 支付宝(直连商户).xlsx', '/file/', '2024/09/02/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:02.953727');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432978368016384, '/file/66d5232c9b65f788a54f4347.csv', 1152, '66d5232c9b65f788a54f4347.csv', '交易对账单-微信-20240901.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:04.500493');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432979357872128, '/file/2024/09/02/66d5232c9b65f788a54f4348.xlsx', 9964, '66d5232c9b65f788a54f4348.xlsx', '【2024-09-01】 - 正式测试环境 - 微信支付(直连商户).xlsx', '/file/', '2024/09/02/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:04.736091');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432980876210176, '/file/66d5232d9b65f788a54f4349.csv', 588, '66d5232d9b65f788a54f4349.csv', '交易对账单-支付宝-20240901.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:05.097887');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432981224337408, '/file/2024/09/02/66d5232d9b65f788a54f434a.xlsx', 9725, '66d5232d9b65f788a54f434a.xlsx', '【2024-09-01】 - 正式测试环境 - 支付宝(直连商户).xlsx', '/file/', '2024/09/02/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:05.180424');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432989017354240, '/file/66d5232f9b65f788a54f434b.csv', 773, '66d5232f9b65f788a54f434b.csv', '交易对账单-支付宝-20240901.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:07.0389');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830432989638111232, '/file/2024/09/02/66d5232f9b65f788a54f434c.xlsx', 9726, '66d5232f9b65f788a54f434c.xlsx', '【2024-09-01】 - 秘钥测试账户(支付宝沙箱) - 支付宝(直连商户).xlsx', '/file/', '2024/09/02/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-02 10:30:07.187076');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795357480173568, '/file/66d674a91f358abb94988653.csv', 775, '66d674a91f358abb94988653.csv', '交易对账单-支付宝-20240902.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:02.410984');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795361926135808, '/file/2024/09/03/66d674ab1f358abb94988654.xlsx', 10927, '66d674ab1f358abb94988654.xlsx', '【2024-09-02】 - 测试应用2 - 支付宝(直连商户).xlsx', '/file/', '2024/09/03/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:03.47317');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795369018703872, '/file/66d674ad1f358abb94988655.csv', 1148, '66d674ad1f358abb94988655.csv', '交易对账单-微信-20240902.csv', '/file/', '', 'csv', 'text/plain', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:05.163827');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795369673015296, '/file/2024/09/03/66d674ad1f358abb94988656.xlsx', 9965, '66d674ad1f358abb94988656.xlsx', '【2024-09-02】 - 正式测试环境 - 微信支付(直连商户).xlsx', '/file/', '2024/09/03/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:05.320186');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795372088934400, '/file/66d674ad1f358abb94988657.csv', 775, '66d674ad1f358abb94988657.csv', '交易对账单-支付宝-20240902.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:05.896053');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795373271728128, '/file/2024/09/03/66d674ae1f358abb94988658.xlsx', 10926, '66d674ae1f358abb94988658.xlsx', '【2024-09-02】 - 正式测试环境 - 支付宝(直连商户).xlsx', '/file/', '2024/09/03/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:06.178188');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795379219251200, '/file/66d674af1f358abb94988659.csv', 773, '66d674af1f358abb94988659.csv', '交易对账单-支付宝-20240902.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:07.596269');
INSERT INTO "public"."starter_file_upload_info" VALUES (1830795379978420224, '/file/2024/09/03/66d674af1f358abb9498865a.xlsx', 10927, '66d674af1f358abb9498865a.xlsx', '【2024-09-02】 - 秘钥测试账户(支付宝沙箱) - 支付宝(直连商户).xlsx', '/file/', '2024/09/03/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-03 10:30:07.777158');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831233989211004928, '/file/66d80d2b0d4141300044fc44.csv', 775, '66d80d2b0d4141300044fc44.csv', '交易对账单-支付宝-20240903.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 15:33:00.365017');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831233993724076032, '/file/2024/09/04/66d80d2d0d4141300044fc45.xlsx', 9726, '66d80d2d0d4141300044fc45.xlsx', '【2024-09-03】-M1723635576766-M7934041241299655-支付宝(直连商户).xlsx', '/file/', '2024/09/04/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 15:33:01.443352');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831234003706519552, '/file/66d80d2f0d4141300044fc46.csv', 775, '66d80d2f0d4141300044fc46.csv', '交易对账单-支付宝-20240903.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 15:33:03.822384');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831234004142727168, '/file/2024/09/04/66d80d2f0d4141300044fc47.xlsx', 9726, '66d80d2f0d4141300044fc47.xlsx', '【2024-09-03】-M1723635576766-M8207639754663343-支付宝(直连商户).xlsx', '/file/', '2024/09/04/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 15:33:03.926613');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831234013055623168, '/file/66d80d320d4141300044fc48.csv', 773, '66d80d320d4141300044fc48.csv', '交易对账单-支付宝-20240903.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 15:33:06.051702');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831234013588299776, '/file/2024/09/04/66d80d320d4141300044fc49.xlsx', 9726, '66d80d320d4141300044fc49.xlsx', '【2024-09-03】-M1723635576766-M8088873888246277-支付宝(直连商户).xlsx', '/file/', '2024/09/04/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 15:33:06.179445');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831245328214020096, '/file/66d817bb0d4118c2cf4a8e72.csv', 773, '66d817bb0d4118c2cf4a8e72.csv', '交易对账单-支付宝-20240903.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 16:18:03.788286');
INSERT INTO "public"."starter_file_upload_info" VALUES (1831245352838778880, '/file/2024/09/04/66d817c10d4118c2cf4a8e73.xlsx', 9726, '66d817c10d4118c2cf4a8e73.xlsx', '【2024-09-03】-M1723635576766-M7189826551600486-支付宝(直连商户).xlsx', '/file/', '2024/09/04/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04 16:18:09.666814');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767893975228416, '/file/66f375aac76333160bc4e4ca.csv', 773, '66f375aac76333160bc4e4ca.csv', '交易对账单-支付宝-20240924.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:03.234173');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767897783656448, '/file/2024/09/25/66f375acc76333160bc4e4cb.xlsx', 9725, '66f375acc76333160bc4e4cb.xlsx', '【2024-09-24】M1723635576766-M7189826551600486-支付宝(直连商户).xlsx', '/file/', '2024/09/25/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:04.143105');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767901315260416, '/file/66f375acc76333160bc4e4cc.csv', 588, '66f375acc76333160bc4e4cc.csv', '交易对账单-支付宝-20240924.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:04.986');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767901684359168, '/file/2024/09/25/66f375adc76333160bc4e4cd.xlsx', 9725, '66f375adc76333160bc4e4cd.xlsx', '【2024-09-24】M1723635576766-M7934041241299655-支付宝(直连商户).xlsx', '/file/', '2024/09/25/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:05.074329');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767906600083456, '/file/66f375aec76333160bc4e4ce.csv', 588, '66f375aec76333160bc4e4ce.csv', '交易对账单-支付宝-20240924.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:06.246034');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767907405389824, '/file/2024/09/25/66f375aec76333160bc4e4cf.xlsx', 9726, '66f375aec76333160bc4e4cf.xlsx', '【2024-09-24】M1723635576766-M8207639754663343-支付宝(直连商户).xlsx', '/file/', '2024/09/25/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:06.438419');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767913310969856, '/file/66f375afc76333160bc4e4d0.csv', 773, '66f375afc76333160bc4e4d0.csv', '交易对账单-支付宝-20240924.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:07.845724');
INSERT INTO "public"."starter_file_upload_info" VALUES (1838767913768148992, '/file/2024/09/25/66f375afc76333160bc4e4d1.xlsx', 9726, '66f375afc76333160bc4e4d1.xlsx', '【2024-09-24】M1723635576766-M8088873888246277-支付宝(直连商户).xlsx', '/file/', '2024/09/25/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-25 10:30:07.955428');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130282750988288, '/file/66f4c72ba2e5db5ec8f6d8c4.csv', 773, '66f4c72ba2e5db5ec8f6d8c4.csv', '交易对账单-支付宝-20240925.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:03.451004');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130286337118208, '/file/2024/09/26/66f4c72ca2e5db5ec8f6d8c5.xlsx', 9726, '66f4c72ca2e5db5ec8f6d8c5.xlsx', '【2024-09-25】M1723635576766-M7189826551600486-支付宝(直连商户).xlsx', '/file/', '2024/09/26/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:04.308822');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130289847750656, '/file/66f4c72da2e5db5ec8f6d8c6.csv', 588, '66f4c72da2e5db5ec8f6d8c6.csv', '交易对账单-支付宝-20240925.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:05.144483');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130290191683584, '/file/2024/09/26/66f4c72da2e5db5ec8f6d8c7.xlsx', 9725, '66f4c72da2e5db5ec8f6d8c7.xlsx', '【2024-09-25】M1723635576766-M7934041241299655-支付宝(直连商户).xlsx', '/file/', '2024/09/26/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:05.22687');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130295765913600, '/file/66f4c72ea2e5db5ec8f6d8c8.csv', 588, '66f4c72ea2e5db5ec8f6d8c8.csv', '交易对账单-支付宝-20240925.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:06.55616');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130296114040832, '/file/2024/09/26/66f4c72ea2e5db5ec8f6d8c9.xlsx', 9725, '66f4c72ea2e5db5ec8f6d8c9.xlsx', '【2024-09-25】M1723635576766-M8207639754663343-支付宝(直连商户).xlsx', '/file/', '2024/09/26/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:06.639039');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130304922079232, '/file/66f4c730a2e5db5ec8f6d8ca.csv', 773, '66f4c730a2e5db5ec8f6d8ca.csv', '交易对账单-支付宝-20240925.csv', '/file/', '', 'csv', 'application/octet-stream', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:08.739167');
INSERT INTO "public"."starter_file_upload_info" VALUES (1839130305433784320, '/file/2024/09/26/66f4c730a2e5db5ec8f6d8cb.xlsx', 9725, '66f4c730a2e5db5ec8f6d8cb.xlsx', '【2024-09-25】M1723635576766-M8088873888246277-支付宝(直连商户).xlsx', '/file/', '2024/09/26/', 'xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-26 10:30:08.861025');
INSERT INTO "public"."starter_file_upload_info" VALUES (1856215115868160000, '/file/2024/11/12/6732eea8e6f627f732e6a7b3.png', 579636, '6732eea8e6f627f732e6a7b3.png', '微信截图_20241022100804.png', '/file/', '2024/11/12/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-12 13:59:05.083601');
INSERT INTO "public"."starter_file_upload_info" VALUES (1856215123845726208, '/file/2024/11/12/6732eeaae6f627f732e6a7b4.png', 579636, '6732eeaae6f627f732e6a7b4.png', '微信截图_20241022100804.png', '/file/', '2024/11/12/', 'png', 'image/png', 'minio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-12 13:59:06.990695');

-- ----------------------------
-- Primary Key structure for table base_area
-- ----------------------------
ALTER TABLE "public"."base_area" ADD CONSTRAINT "base_area_pkey" PRIMARY KEY ("code");

-- ----------------------------
-- Primary Key structure for table base_black_china_word
-- ----------------------------
ALTER TABLE "public"."base_black_china_word" ADD CONSTRAINT "base_china_word_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table base_city
-- ----------------------------
ALTER TABLE "public"."base_city" ADD CONSTRAINT "base_city_pkey" PRIMARY KEY ("code");

-- ----------------------------
-- Primary Key structure for table base_dict
-- ----------------------------
ALTER TABLE "public"."base_dict" ADD CONSTRAINT "base_dict_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table base_dict_item
-- ----------------------------
ALTER TABLE "public"."base_dict_item" ADD CONSTRAINT "base_dict_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table base_param
-- ----------------------------
ALTER TABLE "public"."base_param" ADD CONSTRAINT "base_param_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table base_province
-- ----------------------------
ALTER TABLE "public"."base_province" ADD CONSTRAINT "base_province_pkey" PRIMARY KEY ("code");

-- ----------------------------
-- Indexes structure for table base_street
-- ----------------------------
CREATE INDEX "inx_area_code" ON "public"."base_street" USING btree (
  "area_code" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);
COMMENT ON INDEX "public"."inx_area_code" IS '县区';

-- ----------------------------
-- Primary Key structure for table base_street
-- ----------------------------
ALTER TABLE "public"."base_street" ADD CONSTRAINT "base_street_pkey" PRIMARY KEY ("code");

-- ----------------------------
-- Primary Key structure for table iam_client
-- ----------------------------
ALTER TABLE "public"."iam_client" ADD CONSTRAINT "iam_client_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_perm_code
-- ----------------------------
ALTER TABLE "public"."iam_perm_code" ADD CONSTRAINT "iam_perm_code_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_perm_menu
-- ----------------------------
ALTER TABLE "public"."iam_perm_menu" ADD CONSTRAINT "iam_perm_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_perm_path
-- ----------------------------
ALTER TABLE "public"."iam_perm_path" ADD CONSTRAINT "iam_perm_code_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_role_code
-- ----------------------------
ALTER TABLE "public"."iam_role_code" ADD CONSTRAINT "iam_role_code_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_role_menu
-- ----------------------------
ALTER TABLE "public"."iam_role_menu" ADD CONSTRAINT "iam_role_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_role_path
-- ----------------------------
ALTER TABLE "public"."iam_role_path" ADD CONSTRAINT "iam_role_path_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_user_expand_info
-- ----------------------------
ALTER TABLE "public"."iam_user_expand_info" ADD CONSTRAINT "iam_user_expand_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_user_info
-- ----------------------------
ALTER TABLE "public"."iam_user_info" ADD CONSTRAINT "iam_user_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table iam_user_role
-- ----------------------------
ALTER TABLE "public"."iam_user_role" ADD CONSTRAINT "iam_user_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table starter_audit_login_log
-- ----------------------------
ALTER TABLE "public"."starter_audit_login_log" ADD CONSTRAINT "starter_audit_login_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table starter_audit_operate_log
-- ----------------------------
ALTER TABLE "public"."starter_audit_operate_log" ADD CONSTRAINT "starter_audit_operate_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table starter_file_platform
-- ----------------------------
ALTER TABLE "public"."starter_file_platform" ADD CONSTRAINT "starter_file_platform_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table starter_file_upload_info
-- ----------------------------
ALTER TABLE "public"."starter_file_upload_info" ADD CONSTRAINT "starter_file_upload_info_pkey" PRIMARY KEY ("id");
