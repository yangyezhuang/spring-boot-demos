/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : jd_goods

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 21/07/2023 10:11:33
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`
(
    `good_id`     int(11) NOT NULL AUTO_INCREMENT,
    `good_shop`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `good_name`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `good_price`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `comment_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `good_link`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `good_img`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    PRIMARY KEY (`good_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 443 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods`
VALUES (1, 'Apple产品京东自营旗舰店',
        '京品手机 Apple\niPhone\n11 (A2223) 64GB 红色 移动联通电信4G手机 双卡双待 【年终赏，开享】指定iPhone13产品领券至高立减400元， 【限时活动】指定iPhone11至高立减300元！限时限量！！快来抢购吧！',
        ' 3799.00', '500万+条评价', 'https://item.jd.com/100004770249.html',
        'https://img14.360buyimg.com/n7/jfs/t1/143677/10/17909/104178/5fd32f60E2c7f4746/4d44264375b37db3.jpg');
INSERT INTO `goods`
VALUES (2, 'Apple产品京东自营旗舰店',
        'Apple\niPhone\n13 (A2634) 128GB 粉色 支持移动联通电信5G 双卡双待手机 【年终赏，开享】指定iPhone13产品领券至高立减400元， 【限时活动】指定iPhone11至高立减300元！限时限量！！快来抢购吧！',
        ' 5199.00', '500万+条评价', 'https://item.jd.com/100026667858.html',
        'https://img13.360buyimg.com/n7/jfs/t1/212319/25/23641/31666/63a41fd0Ed04f516e/ff9e609d0756e6f6.jpg');
INSERT INTO `goods`
VALUES (3, 'Apple产品京东自营旗舰店',
        '京品手机 Apple\niPhone\n12 (A2404) 256GB 黑色 支持移动联通电信5G 双卡双待手机 【年终赏，开享】指定iPhone13产品领券至高立减400元， 【限时活动】指定iPhone11至高立减300元！限时限量！！快来抢购吧！',
        ' 5599.00', '400万+条评价', 'https://item.jd.com/100009077457.html',
        'https://img12.360buyimg.com/n7/jfs/t1/148365/35/10544/41607/5f8617e9E8f9c9c20/d2d1b5acde7afb6d.jpg');
INSERT INTO `goods`
VALUES (4, '靓机优品二手手机专营店',
        '拍拍 Apple\niPhone\nX 二手苹果X 二手手机 苹果手机移动联通电信4G手机 国行\niphone\nx 深空灰 9新 64G 全网通（赠购机大礼包） Apple iPhone X 二手苹果X 二手手机 苹果手机移动联通电信4G手机 国行iphonex 深空灰 9新 64G 全网通（赠购机大礼包）',
        ' 1318.00', '2万+条评价', 'https://item.jd.com/10028108363808.html',
        'https://img13.360buyimg.com/n7/jfs/t1/221581/37/22241/92271/636393a9E49d58247/2004ee2834898124.jpg');
INSERT INTO `goods`
VALUES (5, '京东电竞手机官方旗舰店',
        'Apple 苹果\niPhone\n12 全网通5G手机【苹果13店内可选】 蓝色 全网通 256GB【官方标配】 【店长推荐！咨询客服额外优惠！好评送季度碎屏险！七仓配送快至次日达,全国联保,正品国行】',
        ' 5299.00', '2万+条评价', 'https://item.jd.com/10026331080165.html',
        'https://img10.360buyimg.com/n7/jfs/t1/32918/25/16382/372157/62cbc761E9ff285f0/1340c5491a790ef5.jpg');
INSERT INTO `goods`
VALUES (6, '鹏瑶旗舰店',
        '【12期白条0首付】Apple 苹果\niPhone\n13 (A2634) 苹果14店内可选5G手机 星光色 全网通 128GB(官方标配) 【12期白条0首付】Apple 苹果 iPhone 13 (A2634) 苹果14店内可选5G手机 星光色 全网通 128GB(官方标配)',
        ' 4988.00', '2万+条评价', 'https://item.jd.com/10037586600998.html',
        'https://img13.360buyimg.com/n7/jfs/t1/105839/18/35633/56487/637db89eE6cf94a4e/45e33d8b919f3956.jpg');
INSERT INTO `goods`
VALUES (7, '中国移动官方旗舰店',
        'Apple\niPhone\n13 ProMax(A2644)256GB苍岭绿色 支持移动联通电信5G 双卡双待手机 苹果合约机 移动用户专享 Apple iPhone13 ProMax(A2644)256GB苍岭绿色 支持移动联通电信5G 双卡双待手机 苹果合约机 移动用户专享',
        ' 9199.00', '2万+条评价', 'https://item.jd.com/100019794055.html',
        'https://img10.360buyimg.com/n7/jfs/t1/51015/11/19983/122005/62b5202aE57c04e59/29016d1bfedde21c.jpg');
INSERT INTO `goods`
VALUES (8, 'Apple产品京东自营旗舰店',
        'Apple\niPhone\n13 Pro (A2639) 128GB 苍岭绿色 支持移动联通电信5G 双卡双待手机 合约机 购机补贴版 【购机流程】1、“选择合约机”领补贴。2、选择套餐，查看直降到手价。3、填写个人信息。4、下单购买。【享购机补贴、更多流量和通话分钟，部分城市赠送宽带】更多查看',
        ' 7999.00', '2万+条评价', 'https://item.jd.com/100019899071.html',
        'https://img11.360buyimg.com/n7/jfs/t1/83418/13/17190/33005/6227c3bbE47e73fef/6375cd147fcf23e6.jpg');
INSERT INTO `goods`
VALUES (9, '耐谷手机旗舰店',
        'Apple 苹果13\niPhone\n13 支持移动联通电信5G 双卡双待手机 星光色 128GB 20点前下单，当天发【国行全新未激活】晒单享好礼！送90天碎屏险+壳膜套装+晒单返10元【推荐苹果12Pro】',
        ' 4998.00', '2万+条评价', 'https://item.jd.com/10037905558229.html',
        'https://img14.360buyimg.com/n7/jfs/t1/28999/1/18038/248238/62c7dfc5Ee63ab11d/03f45635ff09577a.png');
INSERT INTO `goods`
VALUES (10, '京铠玄手机旗舰店',
        'Apple 苹果\niPhone\n13 5G手机 午夜色 128GB 官方标配 Apple 苹果 iPhone 13 5G手机 午夜色 128GB 官方标配',
        ' 4999.00', '1万+条评价', 'https://item.jd.com/10044601496674.html',
        'https://img14.360buyimg.com/n7/jfs/t1/8362/11/17857/104659/62abe7c2Ef3f08f8a/01a3246dc1fbf36b.jpg');
INSERT INTO `goods`
VALUES (11, '银河信业手机专营店',
        '苹果Apple\niPhone\n14 /\niPhone\n14plus 5G手机【现货速发】\niPhone\n14【午夜色】 128GB 【下单后京仓随时发出】开增票普票，全国联保/可去当地售后换/修苹果新款13可选',
        ' 5899.00', '1万+条评价', 'https://item.jd.com/56693381057.html',
        'https://img12.360buyimg.com/n7/jfs/t1/43648/15/20172/60978/6358ad1bEa513d387/9ff6a01e396e0455.jpg');
INSERT INTO `goods`
VALUES (12, '悦蜂二手手机专营店',
        '拍拍 苹果11 Apple\niPhone\n11二手苹果手机 游戏手机 4G双卡双待 二手9成新 黄色 64G 全网通 苹果11 Apple iPhone11二手苹果手机 游戏手机 4G双卡双待 二手9成新 黄色 64G 全网通',
        ' 1979.00', '1万+条评价', 'https://item.jd.com/10035900858248.html',
        'https://img13.360buyimg.com/n7/jfs/t1/161282/16/21883/114521/618b30cbE02bc090c/c58828fc5f33922a.jpg');
INSERT INTO `goods`
VALUES (13, '拍拍严选官方旗舰店',
        '拍拍 Apple\niPhone\n13 Pro Max 支持移动联通电信苹果5G 二手手机 国行 远峰蓝色 256GB 拍拍严选，一年质保，超值钜惠，数量有限速戳速戳',
        ' 7159.00', '1万+条评价', 'https://item.jd.com/10038250397483.html',
        'https://img13.360buyimg.com/n7/jfs/t1/127560/18/29321/217605/63a5d0f4E24d56408/1f11dc19008862ea.png');
INSERT INTO `goods`
VALUES (14, '京粉二手手机旗舰店',
        '拍拍 Apple\niPhone\n12(A2404)苹果12国行公开版5G双卡双待二手手机99新 黑色 64G全网通『赠20W PD闪充』 iPhone13系列-甄选好品质大额优惠券-抢磁吸无线快充火爆开抢查看',
        ' 2899.00', '1万+条评价', 'https://item.jd.com/10023441098594.html',
        'https://img14.360buyimg.com/n7/jfs/t1/205658/12/29586/87468/63a5e575Efc7f178d/1e7631dd27b97cec.jpg');
INSERT INTO `goods`
VALUES (15, 'Apple羽通专卖店',
        'Apple\niPhone\n13 (A2634) 支持移动电信联通5G双卡双待手机 午夜色 128G【官方标配】 Apple iPhone 13 (A2634) 支持移动电信联通5G双卡双待手机 午夜色 128G【官方标配】',
        ' 5499.00', '1万+条评价', 'https://item.jd.com/10037217957919.html',
        'https://img14.360buyimg.com/n7/jfs/t1/67027/6/23751/40061/639d7786E3262b7a0/c6104090fb5f58fe.jpg');
INSERT INTO `goods`
VALUES (16, '无忧二手手机专营店',
        '拍拍 苹果12pro Apple\niPhone\n12Pro 5G版双卡双待 二手苹果手机 99新 深海蓝 128G 全网通【配件大礼包】 苹果12pro Apple iPhone 12Pro 5G版双卡双待 二手苹果手机 99新 深海蓝 128G 全网通【配件大礼包】',
        ' 4039.00', '5000+条评价', 'https://item.jd.com/10022263034830.html',
        'https://img10.360buyimg.com/n7/jfs/t1/130262/40/32785/100531/637c39e9E995027ab/91af2870cfa0f0ba.jpg');
INSERT INTO `goods`
VALUES (17, 'Apple产品京东自营旗舰店',
        'Apple\niPhone\n13ProMax(A2644)512GB苍岭绿色支持移动联通电信5G双卡双待手机【1年期官方AppleCare+版】 AppleiPhone13ProMax(A2644)512GB苍岭绿色支持移动联通电信5G双卡双待手机【1年期官方AppleCare+版】',
        ' 12547.00', '5000+条评价', 'https://item.jd.com/100019815365.html',
        'https://img10.360buyimg.com/n7/jfs/t1/148745/18/23149/128657/622ae2dfE1c228025/66ac33495cb2ebff.jpg');
INSERT INTO `goods`
VALUES (18, '京致二手手机专营店',
        '拍拍 Apple\niPhone\n苹果6s \\/ 6sPlus 苹果 二手手机 备用机 全网通 二手9成新 深灰色 6s 64G【电池100%】 年末超值购苹果6s优惠来袭！！立即前往！',
        ' 553.00', '5000+条评价', 'https://item.jd.com/10038053873601.html',
        'https://img11.360buyimg.com/n7/jfs/t1/189557/17/28153/103046/637068b5Ec660c5a1/b53f7a0cc114f940.jpg');
INSERT INTO `goods`
VALUES (19, '天域手机专营店',
        'Apple 苹果\niPhone\n13 5G手机【可选12期白条分期】【苹果14店内可选】 星光色 128G（碎屏险+品牌充电套装+壳膜) Apple 苹果 iPhone 13 5G手机【可选12期白条分期】【苹果14店内可选】 星光色 128G（碎屏险+品牌充电套装+壳膜)',
        ' 5099.00', '5000+条评价', 'https://item.jd.com/10037075220725.html',
        'https://img10.360buyimg.com/n7/jfs/t1/156795/17/30842/80062/63369405E0ab6beef/8352204e0ee01921.jpg');
INSERT INTO `goods`
VALUES (20, '京东电竞手机官方旗舰店',
        '【京东电竞】Apple 苹果13Pro(A2639)\niPhone\n13 Pro全网通5G手机 远峰蓝色 256GB【官方标配】 【店长推荐！咨询客服额外优惠！好评送季度碎屏险！七仓配送快至次日达,全国联保,正品国行】',
        ' 8788.00', '5000+条评价', 'https://item.jd.com/10038335098358.html',
        'https://img13.360buyimg.com/n7/jfs/t1/28870/31/17889/388064/62cbf806E42b6b7c4/352880847fc2385c.jpg');
INSERT INTO `goods`
VALUES (21, '微炫数码旗舰店',
        'Apple苹果\niPhone\n13 5G手机【苹果14店内可选】双卡双待【北京可闪送】 星光色 128GB【搭配90天碎屏险】 下单送20W充电头+碎屏险+精美亲肤壳+钢化膜+运费险+全国联保（部分型号无赠品，以实际订单为准）',
        ' 4999.00', '5000+条评价', 'https://item.jd.com/10037122795331.html',
        'https://img11.360buyimg.com/n7/jfs/t1/19563/13/16034/284272/6268e118Ec7ce0212/f3f45c9fde13e2e6.jpg');
INSERT INTO `goods`
VALUES (22, '京粉二手手机旗舰店',
        '拍拍 Apple\niPhone\nX XR (A2108) 苹果xr国行通双卡双待二手手机95新 黑色 64G全网通『赠充电套装』 iPhone13系列-甄选好品质大额优惠券-抢磁吸无线快充火爆开抢查看',
        ' 1499.00', '2000+条评价', 'https://item.jd.com/10023441115667.html',
        'https://img12.360buyimg.com/n7/jfs/t1/219610/29/24341/66558/63a5e4b9E5b8d986d/0c4288d1b8441179.jpg');
INSERT INTO `goods`
VALUES (23, 'Apple产品企业京东自营旗舰店',
        'Apple\niPhone\n14 128GB 星光色A2884手机 支持移动联通电信5GMPUJ3CH/A【企业客户专享】 Apple iPhone 14 128GB 星光色A2884手机 支持移动联通电信5GMPUJ3CH/A【企业客户专享】',
        ' 5999.00', '2000+条评价', 'https://item.jd.com/100038325457.html',
        'https://img12.360buyimg.com/n7/jfs/t1/206567/30/21003/19138/636b6d5cE952c6af6/bcddd26de2fbac87.jpg');
INSERT INTO `goods`
VALUES (24, '淘金手机旗舰店',
        'Apple 苹果\niPhone\n13mini 5G手机 绿色 全网通 128G 国行正品，全国联保，赠90天碎屏险+晒单红包5元，', ' 4478.00',
        '2000+条评价', 'https://item.jd.com/10030624117175.html',
        'https://img10.360buyimg.com/n7/jfs/t1/169941/6/30815/75022/6343d952E10e5685c/c18179bd6af0146a.jpg');
INSERT INTO `goods`
VALUES (25, '好采机二手手机旗舰店',
        '拍拍 激活未使用Apple\niPhone\n13Pro 苹果13 Pro 国行原装二手5G手机 远峰蓝 128G全网通【电池效率100%】 准新 【拍拍5周年-狂欢开启】准新苹果13Pro256G低至6639；准新苹果13-256G低至4849；限量送199元20W快充，详情咨询客服！',
        ' 6599.00', '2000+条评价', 'https://item.jd.com/10048718425222.html',
        'https://img12.360buyimg.com/n7/jfs/t1/103489/40/35754/85127/63a1db09Eccabbe85/60e1b79d442045ae.jpg');
INSERT INTO `goods`
VALUES (26, '酷族数码旗舰店',
        '【免息可选】Apple 苹果\niPhone\n13 Pro Max 全网通5G手机 远峰蓝色 128G 套装一：官方标配 【国行正品，全新未拆封未激活】晒单享好礼！下单即赠品牌快充套装+90天碎屏险+壳膜套装！选购年卡碎屏服务更优~',
        ' 9499.00', '2000+条评价', 'https://item.jd.com/10037154838310.html',
        'https://img10.360buyimg.com/n7/jfs/t1/28448/5/18273/543781/62d23258E2d9c2d29/0efe1250049ecbab.jpg');
INSERT INTO `goods`
VALUES (27, '悦蜂二手手机专营店',
        '拍拍 苹果x 手机 Apple\niPhone\nX 二手 苹果手机\niphone\nx 移动联通电信 深空灰【店长推荐】 64G 全网通 9成新 苹果x 手机 Apple iPhone X 二手 苹果手机 iphonex 移动联通电信 深空灰【店长推荐】 64G 全网通 9成新',
        ' 1278.00', '2000+条评价', 'https://item.jd.com/10052025793172.html',
        'https://img12.360buyimg.com/n7/jfs/t1/66782/15/17721/393052/627e167cEc5a9beff/050b0e53e87343e4.png');
INSERT INTO `goods`
VALUES (28, '蜜茶手机旗舰店',
        'Apple 苹果\niPhone\nXR 【苹果11可选】手机 双卡双待 全面屏 全新 原装正品行货 白色11 128G 标准套装 全新未拆封未激活原装正品，非二手，拒绝翻新二手！！仅剩少量货源，手慢无！！',
        ' 4099.00', '2000+条评价', 'https://item.jd.com/10026997476342.html',
        'https://img12.360buyimg.com/n7/jfs/t1/172533/34/32905/62479/639c0f87E08dabc2f/a42b52712d456ceb.jpg');
INSERT INTO `goods`
VALUES (29, '享机惠旗舰店',
        '苹果 Apple\niPhone\n14 (A2884) 支持移动联通电信5G 双卡双待手机 蓝色 128GB 苹果 Apple iPhone 14 (A2884) 支持移动联通电信5G 双卡双待手机 蓝色 128GB',
        ' 5549.00', '2000+条评价', 'https://item.jd.com/10061322682181.html',
        'https://img11.360buyimg.com/n7/jfs/t1/177280/7/31290/75738/63a5e543Ecfd81242/c27469e56b654b95.jpg');
INSERT INTO `goods`
VALUES (30, '京融二手商品专营店',
        'Apple 【JD】【不拆不贴-可零出】\niPhone\n13 (A2634) 128GB 星光色 (MLDV3CH/A） Apple 【JD】【不拆不贴-可零出】 iPhone 13 (A2634) 128GB 星光色 (MLDV3CH/A）',
        ' 5199.00', '2000+条评价', 'https://item.jd.com/100014383189.html',
        'https://img14.360buyimg.com/n7/jfs/t1/211944/37/8567/40952/61c1a592Ee0f8f7cf/c406d40332899e91.jpg');
INSERT INTO `goods`
VALUES (31, 'Apple产品京东自营旗舰店',
        'Apple\niPhone\n13 Pro(A2639)512GB 苍岭绿色 支持移动联通电信5G 双卡双待手机【1年期官方AppleCare+版】 Apple iPhone 13 Pro(A2639)512GB 苍岭绿色 支持移动联通电信5G 双卡双待手机【1年期官方AppleCare+版】',
        ' 11547.00', '2000+条评价', 'https://item.jd.com/100034855452.html',
        'https://img12.360buyimg.com/n7/jfs/t1/91456/18/23320/133931/622abd0bE21b183a9/5dacea315f543591.jpg');
INSERT INTO `goods`
VALUES (32, 'Apple羽通专卖店',
        'Apple\niPhone\n14 Pro Max (A2896) 全网通5G双卡双待手机 暗紫色 256G【官方标配】 Apple iPhone 14 Pro Max (A2896) 全网通5G双卡双待手机 暗紫色 256G【官方标配】',
        ' 9899.00', '2000+条评价', 'https://item.jd.com/10060086913760.html',
        'https://img10.360buyimg.com/n7/jfs/t1/185964/36/31109/44512/63a3e101Eb8499b9b/2049c1d40f370863.jpg');
INSERT INTO `goods`
VALUES (33, '博之襄二手手机专营店',
        '拍拍 Apple 苹果se\niPhone\nSE 二手手机 5se 二手苹果手机 玫瑰金 16G 全网通（电池100%） 9成新 现货速发丨苹果iPhoneSE指纹识别性能小钢炮单手操作4.0寸A9芯片嵌入式M9运动协处理器苹果5S升级版1200',
        ' 478.00', '2000+条评价', 'https://item.jd.com/39834198245.html',
        'https://img10.360buyimg.com/n7/jfs/t1/161342/33/33043/59694/637f24d9E704184ac/8a43d4d28d55f649.jpg');
INSERT INTO `goods`
VALUES (34, '拍拍严选官方旗舰店',
        '拍拍 【焕新机】Apple\niPhone\nX 苹果x二手手机 大陆国行 学生机 深空灰 64G 特惠低价，数量有限速戳~速戳', ' 1389.00',
        '2000+条评价', 'https://item.jd.com/10047281689632.html',
        'https://img12.360buyimg.com/n7/jfs/t1/78663/33/23425/41839/63771bbfEdfb2f8c6/2d96212c31804bb6.jpg');
INSERT INTO `goods`
VALUES (35, '青橙严选二手手机专营店',
        '拍拍 苹果 Apple 苹果8plus 二手手机\niPhone\n8plus 二手苹果手机 全网通 95新 金色 64G 促销优惠', ' 1159.00',
        '2000+条评价', 'https://item.jd.com/10026428727220.html',
        'https://img10.360buyimg.com/n7/jfs/t1/133735/19/32473/91290/63a5ec84E11eaefe9/f42953b364269e92.jpg');
INSERT INTO `goods`
VALUES (36, '久汇通手机旗舰店',
        'Apple 苹果14\niPhone\n14 Plus 5G手机（苹果13mini 白条12期分期可选） 星光色 128G（官方标配） 苹果正品，现货速发，全国联保下单送豪礼戳我抢购苹果14plus',
        ' 6499.00', '2000+条评价', 'https://item.jd.com/10026100075332.html',
        'https://img12.360buyimg.com/n7/jfs/t1/129562/17/27135/77913/6371eb7cE8e68b909/48e6714c033dd3fd.jpg');
INSERT INTO `goods`
VALUES (37, '久汇通手机旗舰店',
        'Apple 苹果14\niPhone\n14 (A2884)5G手机（现货当天发 白条12期分期可选） 128GB 午夜色 官方标配+(20W闪充 套装) 苹果原装正品,全国联保现货当天发戳我抢苹果新品旗舰14Pro',
        ' 5689.00', '2000+条评价', 'https://item.jd.com/10061783430688.html',
        'https://img13.360buyimg.com/n7/jfs/t1/84711/15/19607/74153/639fc326E89f33ac2/60edb68ed36670a4.jpg');
INSERT INTO `goods`
VALUES (38, '中国移动官方旗舰店',
        'Apple\niPhone\n14 Pro Max (A2896) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机 苹果合约机 移动用户专享 Apple iPhone 14 Pro Max (A2896) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机 苹果合约机 移动用户专享',
        ' 9899.00', '2000+条评价', 'https://item.jd.com/100038101279.html',
        'https://img14.360buyimg.com/n7/jfs/t1/117874/38/29744/21305/6319920bEc9f88c8d/baf513d33b293f19.jpg');
INSERT INTO `goods`
VALUES (39, 'Apple嘉世优品专卖店',
        'Apple\niPhone\n13 Pro (A2639)支持移动联通电信5G 双卡双待手机 A15芯片 苍岭绿色 256G【原装20W+全国联保+运费险】 【官方授权，正品行货】付款7天内晒图领90天原装碎屏险！99%当天发货，北京可闪送！五星好店，售后有保障！',
        ' 8949.00', '2000+条评价', 'https://item.jd.com/10046093346155.html',
        'https://img10.360buyimg.com/n7/jfs/t1/161567/1/32732/46452/637207caEa2529e85/ceeeab54a5e6f5bc.jpg');
INSERT INTO `goods`
VALUES (40, '考拉严选二手商品专营店',
        '拍拍 Apple\niPhone\n6sPlus 苹果6s Plus二手手机 苹果6sp国行 9成新 玫瑰金【店长推荐】 64G 【退换无忧】15天内换货，180天非人为保修； 【品质保证】国行机器，专业质检，专业售后； 【精美礼品】限时赠送一年内免费更换电池；',
        ' 828.00', '2000+条评价', 'https://item.jd.com/10021925633574.html',
        'https://img14.360buyimg.com/n7/jfs/t1/200165/34/27121/92897/62f47093Ec24336f9/cad7872b271a9f8b.png');
INSERT INTO `goods`
VALUES (41, '传奇二手商品专营店',
        '拍拍 Apple\niPhone\n13 Pro Max 苹果13 ProMax 二手手机 5G 国行双卡双待 远峰蓝色 128GB 99成新 手机界天花板，大家都说好iPhone13ProMax，戳',
        ' 6739.00', '2000+条评价', 'https://item.jd.com/10048882951156.html',
        'https://img11.360buyimg.com/n7/jfs/t1/53605/33/19018/32792/62920c67E467ae7d8/3ea9611a750f53fb.jpg');
INSERT INTO `goods`
VALUES (42, '盘酷优品二手手机专营店',
        '拍拍 苹果13 Pro Max Apple\niPhone\n13 Pro Max 二手5G手机 银色 128G全网通5G 99成新 苹果13 Pro Max Apple iPhone 13 Pro Max 二手5G手机 银色 128G全网通5G 99成新',
        ' 6959.00', '2000+条评价', 'https://item.jd.com/10053269763052.html',
        'https://img12.360buyimg.com/n7/jfs/t1/36599/10/17899/64375/6354145eEaf655584/386c13f1b401f02e.jpg');
INSERT INTO `goods`
VALUES (43, '荣盛优品二手手机专营店',
        '拍拍 苹果x Apple\niPhone\nX 二手苹果手机 二手95新 深空灰 64G【全网通】 下单即送快充套装、壳、膜、卡针，晒单有礼',
        ' 1359.00', '2000+条评价', 'https://item.jd.com/10027246634681.html',
        'https://img11.360buyimg.com/n7/jfs/t1/107372/37/33730/297565/63a65b7aE5d550b8b/9f3b67c0b590e215.png');
INSERT INTO `goods`
VALUES (44, '小皮科技二手商品旗舰店',
        '拍拍 【已验机】Apple\niPhone\n苹果11 国行 苹果二手手机 移动联通电信4G手机 双卡双待 红色 128G 【已验机】Apple iPhone 苹果11 国行 苹果二手手机 移动联通电信4G手机 双卡双待 红色 128G',
        ' 2299.00', '2000+条评价', 'https://item.jd.com/10027652266323.html',
        'https://img13.360buyimg.com/n7/jfs/t1/93599/3/25837/70860/63992216E8aca400b/ace7bf3a4e7a82e1.jpg');
INSERT INTO `goods`
VALUES (45, '中国联通京东自营官方旗舰店',
        'Apple\niPhone\n14 Pro (A2892) 256GB 金色 支持移动联通电信5G 双卡双待手机 Apple iPhone 14 Pro (A2892) 256GB 金色 支持移动联通电信5G 双卡双待手机',
        ' 8899.00', '2000+条评价', 'https://item.jd.com/100038101295.html',
        'https://img10.360buyimg.com/n7/jfs/t1/30133/7/20520/19107/638b682fE7d9b3798/1da2f12d31a6dfa5.jpg');
INSERT INTO `goods`
VALUES (46, '在一起二手手机专营店',
        '拍拍 Apple\niPhone\n13mini(A2629) 苹果13mini 二手苹果手机 5G全网通 蓝色 【95新】128G Apple iPhone13mini(A2629) 苹果13mini 二手苹果手机 5G全网通 蓝色 【95新】128G',
        ' 3449.00', '1000+条评价', 'https://item.jd.com/10037729294818.html',
        'https://img13.360buyimg.com/n7/jfs/t1/199710/26/10237/40299/61517f8aE85e2f7c3/606e9d274895ba95.jpg');
INSERT INTO `goods`
VALUES (47, '小皮科技二手商品旗舰店',
        '拍拍 【已验机】Apple\niPhone\nX 苹果x 二手苹果手机 国行 全网通4G 深空灰色 64G 【已验机】Apple iPhone X 苹果x 二手苹果手机 国行 全网通4G 深空灰色 64G',
        ' 1349.00', '1000+条评价', 'https://item.jd.com/10023687886319.html',
        'https://img14.360buyimg.com/n7/jfs/t1/113233/31/32325/39660/6386cb5aE41adeb2d/d38125fe05093a29.png');
INSERT INTO `goods`
VALUES (48, '机淘淘二手商品专营店',
        '拍拍 Apple\niPhone\nSE 2 苹果se2 国行 A13处理器 苹果二手机 二手手机 SE2 红色【9成新】 64G Apple iPhone SE 2 苹果se2 国行 A13处理器 苹果二手机 二手手机 SE2 红色【9成新】 64G',
        ' 1058.00', '1000+条评价', 'https://item.jd.com/10028745451653.html',
        'https://img13.360buyimg.com/n7/jfs/t1/184016/33/25084/85159/62904f70Ed5527409/436460ce021078c0.jpg');
INSERT INTO `goods`
VALUES (49, '壹思海外专营店',
        '京东国际 Apple\niPhone\n12 苹果12手机（美版有锁激活）移动联通电信智能手机\niPhone\n12 黑色 64GB美版有锁移动联通电信 Apple iPhone 12 苹果12手机（美版有锁激活）移动联通电信智能手机 iPhone12 黑色 64GB美版有锁移动联通电信',
        ' 2858.00', '1000+条评价', 'https://item.jd.com/33655077428.html',
        'https://img13.360buyimg.com/n7/jfs/t1/192990/5/29936/64524/63787ac5Ea4443080/97f8fc55a01b4fab.jpg');
INSERT INTO `goods`
VALUES (50, '可乐二手手机专营店',
        '拍拍 【焕新机】苹果11 Apple\niPhone\n11二手苹果手机 游戏手机 4G 双卡双待 黑色 64G【第三方屏幕】 9成新 【焕新机】苹果11 Apple iPhone11二手苹果手机 游戏手机 4G 双卡双待 黑色 64G【第三方屏幕】 9成新',
        ' 1879.00', '1000+条评价', 'https://item.jd.com/10058474522999.html',
        'https://img14.360buyimg.com/n7/jfs/t1/65612/24/23266/65472/639d6387Eee4ba2b3/9d47c0756f3df08b.jpg');
INSERT INTO `goods`
VALUES (51, 'Apple扬笛手机专卖店',
        'Apple\niPhone\n14 Pro Max 全网通5G 手机 双卡双待 深空黑色 128GB 【12期白条免息+运费险】 Apple iPhone 14 Pro Max 全网通5G 手机 双卡双待 深空黑色 128GB 【12期白条免息+运费险】',
        ' 10079.00', '1000+条评价', 'https://item.jd.com/10060075341016.html',
        'https://img11.360buyimg.com/n7/jfs/t1/222591/9/22855/58271/63a40fa6E0a01c2a5/8557bcf247dec054.jpg');
INSERT INTO `goods`
VALUES (52, '上海联通京东自营旗舰店',
        'Apple\niPhone\n13 Pro Max (A2644) 512GB 远峰蓝色 支持移动联通电信5G 双卡双待手机 Apple iPhone 13 Pro Max (A2644) 512GB 远峰蓝色 支持移动联通电信5G 双卡双待手机',
        ' 11899.00', '1000+条评价', 'https://item.jd.com/100014384463.html',
        'https://img13.360buyimg.com/n7/jfs/t1/174272/34/21342/34518/61417306Efb65c2de/8e64a3edf4263450.jpg');
INSERT INTO `goods`
VALUES (53, 'Apple智慧生活专卖店',
        'Apple\niPhone\n14 (A2884) 支持移动联通电信5G 双卡双待手机 午夜色 128G【官方标配+全国联保+运费险】 【官方授权，新品现货】17点前下单，现货当天发，收藏加购送运费险，购买有保障！更多优惠详询客服！了解更多',
        ' 5999.00', '1000+条评价', 'https://item.jd.com/10060119150464.html',
        'https://img14.360buyimg.com/n7/jfs/t1/98089/30/32876/34981/6390332dE485845e4/b50d41fa8afe5bee.jpg');
INSERT INTO `goods`
VALUES (54, '零一店二手商品专营店',
        '拍拍 未激活Apple苹果12\niPhone\n12国行5G 移动联通电信双卡原装二手手机激活过保 蓝色 256GB 【未激活未使用】 准新 未激活Apple苹果12 iPhone12国行5G 移动联通电信双卡原装二手手机激活过保 蓝色 256GB 【未激活未使用】 准新',
        ' 4399.00', '1000+条评价', 'https://item.jd.com/10049548582484.html',
        'https://img14.360buyimg.com/n7/jfs/t1/31084/22/20605/55535/63a602a3Ea5a50906/db0c96b948fd6b50.jpg');
INSERT INTO `goods`
VALUES (55, '传奇二手商品专营店',
        '拍拍 苹果11 Pro Apple\niPhone\n11 Pro 二手手机 二手苹果手机 全面屏 95成新 暗夜绿色 64GB 全网通 手机界天花板，大家都说好iPhone13ProMax，戳',
        ' 2559.00', '1000+条评价', 'https://item.jd.com/10045188361451.html',
        'https://img11.360buyimg.com/n7/jfs/t1/40535/9/23391/92486/639805eeE9d308c4a/164f44216ec9fbc6.jpg');
INSERT INTO `goods`
VALUES (56, '盛邦二手手机专营店',
        '拍拍 苹果xr Apple\niPhone\nXR 苹果xr二手\niphone\nxr 二手苹果手机 苹果xr 白色 9成新 128G 苹果xr Apple iPhone XR 苹果xr二手 iphonexr 二手苹果手机 苹果xr 白色 9成新 128G',
        ' 1989.00', '1000+条评价', 'https://item.jd.com/10065326735181.html',
        'https://img11.360buyimg.com/n7/jfs/t1/175988/14/32261/126719/63a41eebE19507caf/1e7ba929d0a9e15e.jpg');
INSERT INTO `goods`
VALUES (57, '传奇二手商品专营店',
        '拍拍 苹果12 mini Apple\niPhone\n12 mini 二手苹果手机 全面屏 5G手机 全网通 黑色【赠：5件套】 「9新」128GB 手机界天花板，大家都说好iPhone13ProMax，戳',
        ' 2399.00', '1000+条评价', 'https://item.jd.com/10025702376723.html',
        'https://img13.360buyimg.com/n7/jfs/t1/161512/36/33309/71106/639805e9E0ed307b0/977681d9bf5a5ce4.jpg');
INSERT INTO `goods`
VALUES (58, '悦蜂二手手机专营店',
        '拍拍 苹果13 Pro Apple\niPhone\n13 Pro 二手苹果手机 5G\niphone\n95新 远峰蓝色 95新 128G 全网通 苹果13 Pro Apple iPhone13 Pro 二手苹果手机 5G iphone 95新 远峰蓝色 95新 128G 全网通',
        ' 5659.00', '1000+条评价', 'https://item.jd.com/10066698665271.html',
        'https://img11.360buyimg.com/n7/jfs/t1/94446/24/31545/52478/636fa83bEa980d69b/97daf58f0d6bdb74.jpg');
INSERT INTO `goods`
VALUES (59, '拾锦二手商品专营店',
        '拍拍 苹果8Plus手机 Apple\niPhone\n8Plus 苹果8P国行 全网通更换品胜电池 灰色 64G 全网通 99成新 苹果8Plus手机 Apple iPhone 8Plus 苹果8P国行 全网通更换品胜电池 灰色 64G 全网通 99成新',
        ' 1208.00', '1000+条评价', 'https://item.jd.com/10052799683242.html',
        'https://img12.360buyimg.com/n7/jfs/t1/207834/35/22691/177594/628df508E53a7d423/7e9b17f1c80860e2.jpg');
INSERT INTO `goods`
VALUES (60, '盛邦二手手机专营店',
        '拍拍 苹果x 手机 Apple\niPhone\nX 苹果x二手苹果手机 二手手机 移动联通电信 银白色 【店长推荐】 9成新 256G 全网通 苹果x 手机 Apple iPhone X 苹果x二手苹果手机 二手手机 移动联通电信 银白色 【店长推荐】 9成新 256G 全网通',
        ' 1699.00', '1000+条评价', 'https://item.jd.com/10065809713493.html',
        'https://img13.360buyimg.com/n7/jfs/t1/105334/37/35395/87223/6374fb00E36339378/10febbdecb8fbfc9.jpg');
INSERT INTO `goods`
VALUES (61, '零一店二手商品专营店',
        '拍拍 Apple\niPhone\n14 Plus支持移动联通电信5G苹果14 Plus二手手机全国联保 准新 午夜色 128GB【全国联保300天+】 Apple iPhone 14 Plus支持移动联通电信5G苹果14 Plus二手手机全国联保 准新 午夜色 128GB【全国联保300天+】',
        ' 6199.00', '1000+条评价', 'https://item.jd.com/10064234943702.html',
        'https://img12.360buyimg.com/n7/jfs/t1/94968/33/34632/81071/63a601a3E7e35b8bc/7de6b1a84fa79052.jpg');
INSERT INTO `goods`
VALUES (62, '京融二手商品专营店',
        'Apple\niPhone\n13 (A2634) 256GB 蓝色 支持移动联通电信5G 双卡双待手机 YL Apple iPhone 13 (A2634) 256GB 蓝色 支持移动联通电信5G 双卡双待手机 YL',
        ' 6799.00', '1000+条评价', 'https://item.jd.com/100033637411.html',
        'https://img11.360buyimg.com/n7/jfs/t1/218640/14/14366/39988/6229b00cE381d59be/8a95d650a1b98eb1.jpg');
INSERT INTO `goods`
VALUES (63, '传奇二手商品专营店',
        '拍拍 Apple\niPhone\n12 Pro Max 苹果12promax二手手机 5G双卡双待 全网通 银色 「99新」128GB 手机界天花板，大家都说好iPhone13ProMax，戳',
        ' 4799.00', '1000+条评价', 'https://item.jd.com/10037971385008.html',
        'https://img13.360buyimg.com/n7/jfs/t1/208734/10/12859/42450/61b9bae7E3db17223/71877cf613761e09.jpg');
INSERT INTO `goods`
VALUES (64, 'APPLE鼎峰专卖店',
        'Apple 苹果\niPhone\n13 支持移动联通电信 5G手机 双卡双待 星光色 全网通128GB（官方标配) 无赠品 现货速发【国行正品，全新未拆封未激活】晒单享好礼！赠20WPD快充头+15W磁吸无线充+壳膜套装！',
        ' 4979.00', '1000+条评价', 'https://item.jd.com/10037142880647.html',
        'https://img12.360buyimg.com/n7/jfs/t1/98049/21/25423/141976/623c3c5bEc442b2bb/0b3078f271754210.jpg');
INSERT INTO `goods`
VALUES (65, '爱相随二手手机专营店',
        '拍拍 Apple\niPhone\n12mini 苹果12mini 二手苹果原装国行二手手机 黑色 64G【评价有礼】99成新 Apple iPhone12mini 苹果12mini 二手苹果原装国行二手手机 黑色 64G【评价有礼】99成新',
        ' 2388.00', '1000+条评价', 'https://item.jd.com/10025164298787.html',
        'https://img12.360buyimg.com/n7/jfs/t1/155276/9/8872/42314/5fcdb650E2a065c6f/6777a47e729d5271.jpg');
INSERT INTO `goods`
VALUES (66, '楽天海外官方旗舰店',
        'Apple 苹果\niphone\nSE2代手机日版 现货4G全网通\niphone\nSE2手机\niPhone\nSE3 午夜色 日版 解锁已激活64GB 下单务必提供真实姓名，避免影响清关*【冬日暖阳】数码3C不止5折，更多好物上新！，锁定楽天查看',
        ' 3200.00', '1000+条评价', 'https://item.jd.com/36230146819.html',
        'https://img14.360buyimg.com/n7/jfs/t1/209090/5/20483/33188/6253ef43E277348d0/06450d33e7154a9f.jpg');
INSERT INTO `goods`
VALUES (67, '拍拍严选官方旗舰店',
        '拍拍 Apple\niPhone\n6 Plus 苹果6plus二手手机 国行 金色 32G 拍拍严选，一年质保，超值钜惠，数量有限速戳速戳',
        ' 699.00', '1000+条评价', 'https://item.jd.com/67020337237.html',
        'https://img12.360buyimg.com/n7/jfs/t1/20794/37/17057/142948/62a93ca1E8657168a/6b974e548849c592.jpg');
INSERT INTO `goods`
VALUES (68, 'Apple产品京东自营旗舰店',
        'Apple\niPhone\n13 Pro(A2639)1T 苍岭绿色 支持移动联通电信5G 双卡双待手机【1年期官方AppleCare+版】 Apple iPhone 13 Pro(A2639)1T 苍岭绿色 支持移动联通电信5G 双卡双待手机【1年期官方AppleCare+版】',
        ' 12347.00', '1000+条评价', 'https://item.jd.com/100034855828.html',
        'https://img13.360buyimg.com/n7/jfs/t1/91456/18/23320/133931/622abd0bE21b183a9/5dacea315f543591.jpg');
INSERT INTO `goods`
VALUES (69, '京东国际保税现货官方直营店',
        '京东国际 【国内保税仓】apple苹果\niPhone\nSE3 (第三代) 64GB/120GB 未激活无锁机 64GB 黑色 【精选全球好货】爆款数码至高补贴千元！【加入会员】领取5元无门槛券，多重惊喜福利等你解锁！点击',
        ' 2999.00', '1000+条评价', 'https://item.jd.com/10059444570574.html',
        'https://img14.360buyimg.com/n7/jfs/t1/178384/37/31053/86912/63a5f58dE37e65fa8/093341384fcde52d.jpg');
INSERT INTO `goods`
VALUES (70, '京融二手商品专营店',
        'Apple\niPhone\n13 (A2634) 128GB 绿色 (MNG93CH/A）【JD】【不拆不贴-可零出】 Apple iPhone13 (A2634) 128GB 绿色 (MNG93CH/A）【JD】【不拆不贴-可零出】',
        ' 5999.00', '500+条评价', 'https://item.jd.com/100034858370.html',
        'https://img10.360buyimg.com/n7/jfs/t1/133879/31/26702/38021/62383f95Ec5e52e4a/a9673ae9faa54dbd.jpg');
INSERT INTO `goods`
VALUES (71, '京联通达旗舰店',
        '手机apple 苹果13promax\niPhone\n13promax 全网通 5G手机 远峰蓝色 512G（官方标配） 手机apple 苹果13promax iPhone13promax 全网通 5G手机 远峰蓝色 512G（官方标配）',
        ' 11599.00', '500+条评价', 'https://item.jd.com/10037194355422.html',
        'https://img12.360buyimg.com/n7/jfs/t1/63951/6/23561/70953/63775fdcE5e577f3a/8c37dcf0b1a0771f.jpg');
INSERT INTO `goods`
VALUES (72, '京粉二手手机旗舰店',
        '拍拍 Apple\niPhone\n11 Pro (A2217) 苹果11Pro二手手机95新 暗夜绿色 64G全网通『赠20W PD闪充』 iPhone13系列-甄选好品质大额优惠券-抢磁吸无线快充火爆开抢查看',
        ' 2539.00', '500+条评价', 'https://item.jd.com/10023441097881.html',
        'https://img11.360buyimg.com/n7/jfs/t1/186658/27/31152/90336/63a5e4b6E3a908854/27b511946d00c2f4.jpg');
INSERT INTO `goods`
VALUES (73, '可乐二手手机专营店',
        '拍拍 Apple\niPhone\nXS 苹果xs 二手苹果手机 5.8英寸 二手9成新 金色 256G全网通 Apple iPhone XS 苹果xs 二手苹果手机 5.8英寸 二手9成新 金色 256G全网通',
        ' 2099.00', '500+条评价', 'https://item.jd.com/10044652134336.html',
        'https://img11.360buyimg.com/n7/jfs/t1/108061/40/34284/85529/634bc6cbE97310f77/620f482d645b28ab.png');
INSERT INTO `goods`
VALUES (74, '在一起二手手机专营店',
        '拍拍 苹果11 Apple\niPhone\n11 游戏手机 备用机 二手苹果手机 国行4G双卡双待全网通 黑色 64G 9成新 苹果11 Apple iPhone 11 游戏手机 备用机 二手苹果手机 国行4G双卡双待全网通 黑色 64G 9成新',
        ' 1979.00', '500+条评价', 'https://item.jd.com/10035361289345.html',
        'https://img10.360buyimg.com/n7/jfs/t1/201657/29/1317/547310/6114fb78E8efb78e4/f219fbda8d0036d0.png');
INSERT INTO `goods`
VALUES (75, '万事达二手手机专营店',
        '拍拍 Apple\niPhone\nXSMax苹果xsmax手机 xsm双卡6.5寸大屏二手机备用机学生机拍照9新 金色 64GB 性价比推荐100%电池，数量有限，先到先得',
        ' 1798.00', '500+条评价', 'https://item.jd.com/10030314567440.html',
        'https://img10.360buyimg.com/n7/jfs/t1/213434/33/23204/68784/63776fb9E8249657b/f2ae6d9cb1079103.png');
INSERT INTO `goods`
VALUES (76, '在一起二手手机专营店',
        '拍拍 苹果13ProMax Apple\niPhone\n13 ProMax 二手苹果手机 95新 远峰蓝色 256G 全网通 苹果13ProMax Apple iPhone13 ProMax 二手苹果手机 95新 远峰蓝色 256G 全网通',
        ' 6899.00', '500+条评价', 'https://item.jd.com/10037730057017.html',
        'https://img12.360buyimg.com/n7/jfs/t1/76594/33/23846/102165/6397007dE064e0e7f/19d4ac73bc3afe83.jpg');
INSERT INTO `goods`
VALUES (77, '拾锦二手商品专营店',
        '拍拍 苹果13 Pro 国行\niPhone\n13 Pro 全网通5G二手手机 远峰蓝 256G全网通 99成新 苹果13 Pro 国行 iPhone 13 Pro 全网通5G二手手机 远峰蓝 256G全网通 99成新',
        ' 6804.00', '500+条评价', 'https://item.jd.com/10052863295701.html',
        'https://img11.360buyimg.com/n7/jfs/t1/59373/31/21728/74231/6326739aE40c7ef11/b6b2e23e70fdb9cd.jpg');
INSERT INTO `goods`
VALUES (78, '荣盛优品二手手机专营店',
        '拍拍 苹果8 Apple\niPhone\n8 二手苹果手机 二手9成新 银色 64G【JQ电池效率100%】 下单即送快充充电器，数据线，保护壳，钢化膜，店铺质保180天，晒单有礼',
        ' 899.00', '500+条评价', 'https://item.jd.com/10021428946797.html',
        'https://img12.360buyimg.com/n7/jfs/t1/96087/19/36379/320831/63a65b7dEe9a41cec/497f856525eda6c1.png');
INSERT INTO `goods`
VALUES (79, '机淘淘二手商品专营店',
        '拍拍 Apple\niPhone\nSE 2 苹果se2 国行 A13处理器iOS系统 苹果二手机 二手手机 红色【9成新】 64G Apple iPhone SE 2 苹果se2 国行 A13处理器iOS系统 苹果二手机 二手手机 红色【9成新】 64G',
        ' 1058.00', '500+条评价', 'https://item.jd.com/10034914516220.html',
        'https://img10.360buyimg.com/n7/jfs/t1/184016/33/25084/85159/62904f70Ed5527409/436460ce021078c0.jpg');
INSERT INTO `goods`
VALUES (80, '果粉二手手机专营店',
        '拍拍 Apple\niPhone\n12ProMax(A2412)苹果12ProMax二手5G 99新 海蓝色 256G全网通『赠20W PD闪充』 仅激活未使用iPhone13系列-媲美全新机大额优惠券-送蓝牙耳机火爆开抢',
        ' 5199.00', '500+条评价', 'https://item.jd.com/10026605982866.html',
        'https://img11.360buyimg.com/n7/jfs/t1/171909/39/30394/90836/63a5e571Eacff2590/044d76df7911cde0.jpg');
INSERT INTO `goods`
VALUES (81, '拍拍严选官方旗舰店',
        '拍拍 Apple\niPhone\nSE2\niPhone\n苹果se2手机（A2298） 二手手机 国行 红色 128G 特惠低价，数量有限速戳~速戳',
        ' 1459.00', '500+条评价', 'https://item.jd.com/10048463287498.html',
        'https://img13.360buyimg.com/n7/jfs/t1/92190/25/34340/57061/636a2aa4E5930dfb8/151ecd1e497e9d21.png');
INSERT INTO `goods`
VALUES (82, '典匠二手手机专营店',
        '拍拍 【已验机】苹果 Apple\niPhone\nXS 苹果XS 二手手机 大陆国行 金色 64GB 全网通 支持15天无理由,送运费险',
        ' 1519.00', '500+条评价', 'https://item.jd.com/10028765248143.html',
        'https://img13.360buyimg.com/n7/jfs/t1/34428/3/18420/91642/6346e215E13b21934/a596ebdfd34a9e3c.png');
INSERT INTO `goods`
VALUES (83, '忠诚优品二手手机专营店',
        '拍拍 Apple苹果12\niPhone\n12 5G二手手机6.1寸|高清拍摄|游戏备用 白色 9新 64GB全网通【配赠品】 苹果12 128G 黑色活动现货速发',
        ' 2999.00', '500+条评价', 'https://item.jd.com/10044527016311.html',
        'https://img11.360buyimg.com/n7/jfs/t1/109337/4/33184/71629/639f551fE94d77b20/9d3572956db60c46.png');
INSERT INTO `goods`
VALUES (84, '优质二手手机专营店',
        '拍拍 苹果X手机 Apple\niPhone\nX 二手手机国行 黑色 64G 【赠配件礼包】9成新 【支持7天无理由退、15天换货】京东专业机构质检，品质可靠丨180天超长质保丨京送到家，快速又放心丨下单即送配件5件套丨领券下单全网聚优惠',
        ' 1455.00', '500+条评价', 'https://item.jd.com/10040228863791.html',
        'https://img11.360buyimg.com/n7/jfs/t1/11649/14/20042/57520/63565c4dEb1a3a1b8/309c610516e6b584.jpg');
INSERT INTO `goods`
VALUES (85, '京优客二手手机专营店',
        '拍拍 苹果 Apple\niPhone\n12 苹果12 二手苹果手机 国行通 5G手机 红色[赠配PD20w快充] 64G全网通 99成新 1212特价，下单立减，店内爆款苹果12系列，活动期间赠送PD20w快充，联系客服还有神秘好礼相送，店内还有更多机器任你挑选！速戳',
        ' 3018.00', '500+条评价', 'https://item.jd.com/10048433377556.html',
        'https://img11.360buyimg.com/n7/jfs/t1/215158/20/20645/280136/62b56d62E2de8571c/274beb6a47392b6d.jpg');
INSERT INTO `goods`
VALUES (86, '京东之家官方旗舰店',
        '【京东之家】Apple 苹果14promax（A2896）\niphone\n14promax 5G手机 暗紫色 128G 套装一：搭配90天碎屏保障 苹果14新品多仓速发，可选20W闪充套装、耳机套装、0首付套装.',
        ' 9299.00', '500+条评价', 'https://item.jd.com/10060060952063.html',
        'https://img13.360buyimg.com/n7/jfs/t1/19485/20/19973/60130/63a17fa1E655c6eb4/1fda0266289b8a3f.jpg');
INSERT INTO `goods`
VALUES (87, '京拍优品二手手机专营店',
        '拍拍 Apple\niPhone\nXS 苹果xs手机 二手手机 游戏手机备用机美颜拍照学生手机 苹果手机 苹果XS 金色【赠送快充套装】 64G全网通 95新【赠蓝牙耳机】 Apple iPhone XS 苹果xs手机 二手手机 游戏手机备用机美颜拍照学生手机 苹果手机 苹果XS 金色【赠送快充套装】 64G全网通 95新【赠蓝牙耳机】',
        ' 1599.00', '500+条评价', 'https://item.jd.com/10054471989259.html',
        'https://img14.360buyimg.com/n7/jfs/t1/35318/13/21142/489241/63a5df21Eaccc82fd/110f01bdedcad2c8.png');
INSERT INTO `goods`
VALUES (88, '云南联通京东自营旗舰店',
        'Apple\niPhone\n12 Pro (A2408) 128GB 石墨色 支持移动联通电信5G 双卡双待手机 厂家为了环保，iphone12系列，以及iphone11、XR、SE的新包装均不配置充头和耳机，有需要的需单独购买哦！',
        ' 7199.00', '200+条评价', 'https://item.jd.com/100017468976.html',
        'https://img11.360buyimg.com/n7/jfs/t1/138112/21/20330/43609/5fe6e3a3E9bfad5c2/08b4a3453af7edd1.jpg');
INSERT INTO `goods`
VALUES (89, '京品严选二手手机专营店',
        '拍拍 Apple\niPhone\n11 二手苹果11手机 二手手机 4G手机 双卡双待全网通 绿色 128G 全网通 99成新 活动限时特价，现货速发，7天免费试用，30天质量问题换货，一年保修，联系客服有惊喜，赠品5件套，下单默认随机颜色发货，如需指定颜色请先联系客服告知',
        ' 2699.00', '200+条评价', 'https://item.jd.com/10048512222695.html',
        'https://img10.360buyimg.com/n7/jfs/t1/221431/19/9781/310915/61f120aeEd036e54a/56e97ab5659c39d0.png');
INSERT INTO `goods`
VALUES (90, '拍拍严选官方旗舰店',
        '拍拍 【资源机】Apple 苹果\niphone\nse3 5G 国行 二手手机 大陆国行 午夜色 64G 【资源机】Apple 苹果 iphone se3 5G 国行 二手手机 大陆国行 午夜色 64G',
        ' 2499.00', '200+条评价', 'https://item.jd.com/10040986105701.html',
        'https://img11.360buyimg.com/n7/jfs/t1/164442/34/30019/47267/6392d3eaE70106977/52cb433fff13670f.png');
INSERT INTO `goods`
VALUES (91, '拍拍严选官方旗舰店',
        '拍拍 【资源机】Apple 苹果13\niPhone\n13二手手机 5G手机 全网通 星光色 128G 【资源机】Apple 苹果13 iPhone 13二手手机 5G手机 全网通 星光色 128G',
        ' 4699.00', '200+条评价', 'https://item.jd.com/10045630106970.html',
        'https://img10.360buyimg.com/n7/jfs/t1/196321/4/30005/157123/63a2e848E1535af69/7025f282cbe46978.png');
INSERT INTO `goods`
VALUES (92, '万事达二手手机专营店',
        '拍拍 Apple\niPhone\nX 苹果x二手手机 学生机 工作机 备用机 全面屏 面容解锁 二手苹果95新 深空灰 256GB 性价比推荐100%电池，数量有限，先到先得',
        ' 1678.00', '200+条评价', 'https://item.jd.com/10030543412997.html',
        'https://img12.360buyimg.com/n7/jfs/t1/138269/38/31247/49527/636cd1b6E1fbf2c6d/f7d9ec7fb5cdb781.jpg');
INSERT INTO `goods`
VALUES (93, '谷风羽二手手机专营店',
        '拍拍 苹果se手机 Apple\niPhone\nse 5s e 二手手机国行 9成新 玫瑰金【电池100%】 64G 全网通 【支持7天无理由退、15天换货】京东专业机构质检品质可靠丨180天超长质保丨京送到家，快速又放心丨咨询客服即送配件5件套丨本店注重客户服务以及商品质量欢迎选购',
        ' 578.00', '200+条评价', 'https://item.jd.com/10039761263916.html',
        'https://img11.360buyimg.com/n7/jfs/t1/219118/6/2688/563003/617f763bEa72daf3c/21880ce01f2cc616.png');
INSERT INTO `goods`
VALUES (94, '青橙严选二手手机专营店',
        '拍拍 Apple 苹果12\niPhone\n12 二手苹果手机 5G手机 国行双卡双待 绿色 64GB【PD闪充20瓦】 95成新 促销优惠',
        ' 2799.00', '200+条评价', 'https://item.jd.com/10053758329095.html',
        'https://img10.360buyimg.com/n7/jfs/t1/57841/1/19612/93176/63a5ec7fE3b169421/687badaf11a0667d.jpg');
INSERT INTO `goods`
VALUES (95, '九州优品二手手机专营店',
        '拍拍 苹果x 手机 Apple\niPhone\nX 二手手机\niphone\nx 移动联通电信4G 二手9成新 银色 X-64G全网通 9成新 苹果x 手机 Apple iPhone X 二手手机 iphonex 移动联通电信4G 二手9成新 银色 X-64G全网通 9成新',
        ' 1299.00', '200+条评价', 'https://item.jd.com/10054380342109.html',
        'https://img14.360buyimg.com/n7/jfs/t1/218809/13/23815/123640/637958fdEf061678d/f7ffe902891666c6.jpg');
INSERT INTO `goods`
VALUES (96, '首昕二手手机专营店',
        '拍拍 Apple 苹果\niPhone\nX 苹果x 全面屏 国行公开版 全网通 二手苹果手机 二手95成新 银色【赠:5件套】 64G Apple 苹果 iPhone X 苹果x 全面屏 国行公开版 全网通 二手苹果手机 二手95成新 银色【赠:5件套】 64G',
        ' 1639.00', '200+条评价', 'https://item.jd.com/69091222837.html',
        'https://img12.360buyimg.com/n7/jfs/t1/172572/32/26160/335825/6351314cE734a7655/4a8f1b5249200583.png');
INSERT INTO `goods`
VALUES (97, '龙飞优品二手手机专营店',
        '拍拍 苹果11promax Apple\niPhone\n11 PRO MAX 二手苹果手机 11promax 深空灰 64G 原厂电池 赠配件大礼包 9成新 苹果11promax Apple iPhone 11 PRO MAX 二手苹果手机 11promax 深空灰 64G 原厂电池 赠配件大礼包 9成新',
        ' 3049.00', '200+条评价', 'https://item.jd.com/10060290082099.html',
        'https://img14.360buyimg.com/n7/jfs/t1/198047/31/30835/101981/63a019c8E485d4af2/54fc5da09e06635e.jpg');
INSERT INTO `goods`
VALUES (98, '番茄二手手机专营店',
        '拍拍 苹果8 Plus手机 Apple\niphone\n8P 国行 二手 手机 全网通 深空灰 64G全网通＋赠送充电器套装 苹果8 Plus手机 Apple iphone 8P 国行 二手 手机 全网通 深空灰 64G全网通＋赠送充电器套装',
        ' 1288.00', '200+条评价', 'https://item.jd.com/10032198190234.html',
        'https://img14.360buyimg.com/n7/jfs/t1/178672/4/8278/121339/60bf2675Ec8a6cd53/59a6de9bf921dbee.jpg');
INSERT INTO `goods`
VALUES (99, '博之襄二手手机专营店',
        '拍拍 Apple 苹果x\niPhone\nX 二手手机 二手苹果手机 全网通 黑色 256G 全网通 9成新 Apple 苹果x iPhoneX 二手手机 二手苹果手机 全网通 黑色 256G 全网通 9成新',
        ' 1699.00', '200+条评价', 'https://item.jd.com/41061641729.html',
        'https://img14.360buyimg.com/n7/jfs/t1/41260/5/22253/51019/639adcaaE03e385ff/ca0e6ba81bf03346.jpg');
INSERT INTO `goods`
VALUES (100, '鑫曙手机买手店',
        '爱心东东 Apple 2022款 苹果\niPhone\nSE3 苹果SE3【美版有锁】支持移动联通 全新机 拍照手机 黑色 单机 64GB 美版有锁带卡贴 【进口好物】【现货速发】',
        ' 1899.00', '200+条评价', 'https://item.jd.com/10060347247731.html',
        'https://img11.360buyimg.com/n7/jfs/t1/181026/7/30189/60897/63639c13E84a289c2/8ee5e9f68727ecbf.jpg');
INSERT INTO `goods`
VALUES (101, '物选手机通讯买手店',
        '爱心东东 现货Apple苹果\niPhone\n14 Pro Max 苹果14Pro 双卡双待 原装正品 14 Pro Max 深空黑色【6.7英寸】 128G 现货Apple苹果 iPhone 14 Pro Max 苹果14Pro 双卡双待 原装正品 14 Pro Max 深空黑色【6.7英寸】 128G',
        ' 9999.00', '200+条评价', 'https://item.jd.com/10060220648146.html',
        'https://img11.360buyimg.com/n7/jfs/t1/205392/23/26536/32519/6348d98eEca995c36/0fdd01391dec2526.png');
INSERT INTO `goods`
VALUES (102, '小皮科技二手商品旗舰店',
        '拍拍 【已验机】Apple\niPhone\n8 苹果8 二手苹果手机 外版 无锁版 插卡即用 深空灰色 【全网通4G】256G 【已验机】Apple iPhone8 苹果8 二手苹果手机 外版 无锁版 插卡即用 深空灰色 【全网通4G】256G',
        ' 1288.00', '200+条评价', 'https://item.jd.com/10024856994456.html',
        'https://img11.360buyimg.com/n7/jfs/t1/122633/38/20074/59797/5fc1ef77E9d31ec6a/f39fd904932933e5.jpg');
INSERT INTO `goods`
VALUES (103, '乐亨优品二手商品专营店',
        '拍拍 国行Apple\niPhone\n6s Plus 苹果6sp 二手手机 9新 深空灰 64G 全网通+365天碎屏险 价格全网优惠，下单京东速发，支持7天无理由退换货，下单好评现金红包，欢迎咨询客服砍价！点击查看点击查看',
        ' 888.00', '200+条评价', 'https://item.jd.com/16838058237.html',
        'https://img12.360buyimg.com/n7/jfs/t1/166782/12/28160/114794/6237e790E99f31d5a/8772c2a7fe2794a8.jpg');
INSERT INTO `goods`
VALUES (104, '考拉严选二手商品专营店',
        '拍拍 Apple\niPhone\nX 苹果X 二手手机 移动联通电信4G手机 95新 深空灰色 64G 【退换无忧】15天内换货，180天非人为保修； 【品质保证】国行机器，专业质检，专业售后； 【精美礼品】限时赠送一年内免费更换电池；',
        ' 1749.00', '200+条评价', 'https://item.jd.com/10023349783568.html',
        'https://img13.360buyimg.com/n7/jfs/t1/201132/6/21362/96453/638427abE879995de/c12ecffaf6655efc.jpg');
INSERT INTO `goods`
VALUES (105, '京融二手商品专营店',
        '拍拍 苹果11 Apple\niPhone\n11 游戏手机 二手苹果手机移动联通电信全网通4G双卡拍照 紫色 64G全网通 9成新 苹果11 Apple iPhone 11 游戏手机 二手苹果手机移动联通电信全网通4G双卡拍照 紫色 64G全网通 9成新',
        ' 2400.00', '200+条评价', 'https://item.jd.com/10051319353632.html',
        'https://img12.360buyimg.com/n7/jfs/t1/210888/1/21852/272623/627e63f7E5a490e1d/31519f66b040bbfd.jpg');
INSERT INTO `goods`
VALUES (106, '重庆电信京东自营旗舰店',
        'Apple\niPhone\n14 (A2884) 256GB 红色 支持移动联通电信5G 双卡双待手机 抢先购iPhone14：玩大玩超大，低光照手艺大提升，神技能爆满',
        ' 6499.00', '200+条评价', 'https://item.jd.com/100038257549.html',
        'https://img14.360buyimg.com/n7/jfs/t1/164208/11/28434/26138/631aa7a5Ebf4859a6/12da21abb34d2dd0.jpg');
INSERT INTO `goods`
VALUES (107, '恒泽数码买手店',
        'Apple 全新苹果未激活\niPhone\n12promax 5G 原装N 双卡 12pro 【6.1英寸】金色 官方标配 128GB 版本不一，拍前咨询客服。',
        ' 5400.00', '200+条评价', 'https://item.jd.com/10054578033203.html',
        'https://img13.360buyimg.com/n7/jfs/t1/213648/30/20033/176214/62a87952E8ee17479/7981be926b2596ca.jpg');
INSERT INTO `goods`
VALUES (108, '在一起二手手机专营店',
        '拍拍 Apple\niPhone\n12 苹果12 二手手机 5G双卡双待 全网通 9新 黑色【店长推荐】 64G 全网通(评价送好礼) Apple iPhone 12 苹果12 二手手机 5G双卡双待 全网通 9新 黑色【店长推荐】 64G 全网通(评价送好礼)',
        ' 2899.00', '200+条评价', 'https://item.jd.com/10033623671505.html',
        'https://img10.360buyimg.com/n7/jfs/t1/21432/10/19943/137025/63970089Edee8b0fd/930392d2d57c9ba4.png');
INSERT INTO `goods`
VALUES (109, '久汇通手机旗舰店',
        'Apple 苹果14pro max\niPhone\n14 Pro Max 5G手机（白条12期分期可选） 128GB 深空黑色 官方标配+(20w闪充 套装) 国行原装正品,全国联保,现货速发戳我抢苹果14pro',
        ' 9998.00', '200+条评价', 'https://item.jd.com/10061783431604.html',
        'https://img14.360buyimg.com/n7/jfs/t1/214569/31/22481/71490/634e4c3bE3b632da0/f1478b6b42b93f7f.jpg');
INSERT INTO `goods`
VALUES (110, '拍拍严选尖货旗舰店',
        '拍拍 Apple\niPhone\nXSMAX 苹果XSMAX二手手机全网通4G 双卡双待 金色 64G 热8购物季！苹果13Pro2下单赠手机壳+钢化膜！数量有限！现货速发~点击查看！',
        ' 2119.00', '200+条评价', 'https://item.jd.com/10057052923708.html',
        'https://img13.360buyimg.com/n7/jfs/t1/115862/33/29991/75065/635b3e80E4ed0d27d/27245834792213b8.jpg');
INSERT INTO `goods`
VALUES (111, '京融二手商品专营店',
        'Apple\niPhone\n14 Pro(A2892)256GB 暗紫色(MQ1C3CH/A)【CES】 Apple iPhone 14 Pro(A2892)256GB 暗紫色(MQ1C3CH/A)【CES】',
        ' 8899.00', '200+条评价', 'https://item.jd.com/100038003599.html',
        'https://img12.360buyimg.com/n7/jfs/t1/197957/15/18975/36383/61a477d5E1dfd96ed/5850a2c005fa16a1.jpg');
INSERT INTO `goods`
VALUES (112, '机淘淘二手商品专营店',
        '拍拍 Apple\niPhone\n12 苹果12 二手手机 A14芯片6.1寸 5G全网通苹果二手手 白色 99新 64GB Apple iPhone 12 苹果12 二手手机 A14芯片6.1寸 5G全网通苹果二手手 白色 99新 64GB',
        ' 2959.00', '200+条评价', 'https://item.jd.com/10023988484675.html',
        'https://img10.360buyimg.com/n7/jfs/t1/58515/37/18720/87885/6289a66dE85229696/a35edcc48838a790.jpg');
INSERT INTO `goods`
VALUES (113, '辉翔严选二手手机专营店',
        '拍拍 Apple\niPhone\nx Xsmax 苹果xsmax 二手手机 二手苹果手机 双卡双待 99新 金色 256G 全网通 赠20W快充 【售后保障】七天无理由换货、30天内换货，180天非人为保修；【品质保证】国行机器，专业质检，专业售后；下单赠送20W快充套装+耳机',
        ' 3099.00', '200+条评价', 'https://item.jd.com/10040553098522.html',
        'https://img12.360buyimg.com/n7/jfs/t1/121609/17/22563/149512/620cf98bE592629bf/e7575b59ba4b1433.jpg');
INSERT INTO `goods`
VALUES (114, '微炫数码旗舰店',
        'Apple 苹果14Pro (A2892)\niPhone\n14Pro 5G手机【北京可闪送】 暗紫色 128G【搭配90天碎屏保】 下单送20W充电头+碎屏险+精美亲肤壳+钢化膜+运费险+全国联保+晒单赠店铺延保1年（部分型号无赠品，以实际订单为准）',
        ' 8579.00', '200+条评价', 'https://item.jd.com/10060070127086.html',
        'https://img11.360buyimg.com/n7/jfs/t1/136907/5/30291/49987/63367259E5ad08d6c/9f4f2b34e129aa38.jpg');
INSERT INTO `goods`
VALUES (115, '新扬二手手机专营店',
        '拍拍 苹果xr Apple\niPhone\nXR x 二手手机 二手苹果手机 全面屏 游戏 全网通 双卡双待 黑色【靓机推荐】 64G 全网通(赠20W快充) 9成新 苹果xr Apple iPhone XR x 二手手机 二手苹果手机 全面屏 游戏 全网通 双卡双待 黑色【靓机推荐】 64G 全网通(赠20W快充) 9成新',
        ' 1439.00', '200+条评价', 'https://item.jd.com/10066828776804.html',
        'https://img14.360buyimg.com/n7/jfs/t1/202888/38/29810/70674/638ca503E158aa419/65bec0ec856f5655.jpg');
INSERT INTO `goods`
VALUES (116, '河南楷心手机商选专营店',
        'Apple苹果\niPhone\n13 5G全网通支持移动联通电信双卡手机 蓝色 128GB 蓝色 13 蓝色 Apple苹果iPhone13蓝色128GB',
        ' 5599.00', '200+条评价', 'https://item.jd.com/10042013113202.html',
        'https://img12.360buyimg.com/n7/jfs/t1/173492/29/22725/68766/61b3ff56E650907d7/fd13a763ac2ea4f9.jpg');
INSERT INTO `goods`
VALUES (117, '乐亨优品二手商品专营店',
        '拍拍 苹果8Plus手机 Apple\niPhone\n8Plus 苹果8P 二手手机 红色 128G 99成新 双面玻璃，无线充电，后置双摄（换新电池效率100）',
        ' 1699.00', '200+条评价', 'https://item.jd.com/10062303357936.html',
        'https://img11.360buyimg.com/n7/jfs/t1/204858/15/25061/86997/638d9ff0Ec77b9d9b/cbca92631b9086aa.jpg');
INSERT INTO `goods`
VALUES (118, '京致二手手机专营店',
        '拍拍 苹果 Apple\niPhone\n11 二手手机 二手苹果手机 全面屏游戏 4G手机 双卡双待 紫色 256G 95成新 年末超值购苹果6s优惠来袭！！立即前往！',
        ' 3088.00', '100+条评价', 'https://item.jd.com/10063689707578.html',
        'https://img13.360buyimg.com/n7/jfs/t1/101267/1/35428/76141/63706867E7758a4c2/9a60099dd2fd9269.jpg');
INSERT INTO `goods`
VALUES (119, '秒亿二手手机专营店',
        '拍拍 Apple 苹果x 手机\niPhone\nX 二手手机\niphone\nx 移动联通电信4G 银白色 256G全网通 95成新 年末超值购，华为P20-6+64G限时购低至546！立购！！！',
        ' 1858.00', '100+条评价', 'https://item.jd.com/10053709016327.html',
        'https://img12.360buyimg.com/n7/jfs/t1/102811/13/34605/250216/6364b985Ee1f3cd7c/f801e8b2929d6009.png');
INSERT INTO `goods`
VALUES (120, '重庆电信京东自营旗舰店',
        'Apple\niPhone\n13 (A2634) 256GB 星光色 支持移动联通电信5G 双卡双待手机 Apple iPhone 13 (A2634) 256GB 星光色 支持移动联通电信5G 双卡双待手机',
        ' 6299.00', '100+条评价', 'https://item.jd.com/100026954332.html',
        'https://img12.360buyimg.com/n7/jfs/t1/110094/39/19666/36314/614853dcE3f51bd26/c0cd816f2b84f372.jpg');
INSERT INTO `goods`
VALUES (121, '京粉二手手机旗舰店',
        '拍拍 Apple\niPhone\n8(A1863)苹果8游戏二手手机9成新 银色 64G通『赠充电套装』 iPhone13系列-甄选好品质大额优惠券-抢磁吸无线快充火爆开抢查看',
        ' 999.00', '100+条评价', 'https://item.jd.com/10033287721788.html',
        'https://img13.360buyimg.com/n7/jfs/t1/194119/39/11208/73455/60debb24E3e3ae514/fd7f1789e4ff232a.jpg');
INSERT INTO `goods`
VALUES (122, '天域手机专营店',
        'Apple苹果\niPhone\n14 (A2884) 支持移动联通电信5G 双卡双待手机 午夜色 128GB（碎屏险+品牌充电套装+壳膜） 购机赠送快充头套装可选+壳膜套装+运费险+全国联保苹果14Pro限时抢购',
        ' 5699.00', '100+条评价', 'https://item.jd.com/10060627785698.html',
        'https://img13.360buyimg.com/n7/jfs/t1/88205/39/31406/53680/633689e7Ebbe5a298/db927038bfef4409.jpg');
INSERT INTO `goods`
VALUES (123, '四川联通京东自营旗舰店',
        'Apple\niPhone\n12 Pro (A2408) 256GB 海蓝色 支持移动联通电信5G 双卡双待手机 厂家为了环保，iphone12系列，以及iphone11、XR、SE的新包装均不配置充头和耳机，有需要的需单独购买哦！',
        ' 7999.00', '100+条评价', 'https://item.jd.com/100010031241.html',
        'https://img11.360buyimg.com/n7/jfs/t1/153310/28/11872/46932/5fe7218fEe08cb685/ef362578c47ea655.jpg');
INSERT INTO `goods`
VALUES (124, '京融二手商品专营店',
        'Apple\niPhone\n14(A2884)128GB 蓝色(MPVG3CH/A)【CES】 Apple iPhone 14(A2884)128GB 蓝色(MPVG3CH/A)【CES】',
        ' 5999.00', '100+条评价', 'https://item.jd.com/100038005073.html',
        'https://img13.360buyimg.com/n7/jfs/t1/206590/33/24638/20436/631935adE1125f217/d0c920bab024a367.jpg');
INSERT INTO `goods`
VALUES (125, '京融二手商品专营店',
        'Apple\niPhone\n14(A2884)256GB 星光色(MPW13CH/A)【CES】 Apple iPhone 14(A2884)256GB 星光色(MPW13CH/A)【CES】',
        ' 6899.00', '100+条评价', 'https://item.jd.com/100038005133.html',
        'https://img12.360buyimg.com/n7/jfs/t1/197957/15/18975/36383/61a477d5E1dfd96ed/5850a2c005fa16a1.jpg');
INSERT INTO `goods`
VALUES (126, '爱相随二手手机专营店',
        '拍拍 Apple 苹果13 二手手机\niPhone\n13 二手苹果手机 星光色 128G【评价有礼】 99成新 Apple 苹果13 二手手机 iPhone13 二手苹果手机 星光色 128G【评价有礼】 99成新',
        ' 4278.00', '100+条评价', 'https://item.jd.com/10048524854202.html',
        'https://img12.360buyimg.com/n7/jfs/t1/197957/15/18975/36383/61a477d5E1dfd96ed/5850a2c005fa16a1.jpg');
INSERT INTO `goods`
VALUES (127, '京粉二手手机旗舰店',
        '拍拍 Apple\niPhone\nx XSmax(A2104)苹果x xs max国行二手手机95新 深空灰 256G全网通『赠充电套装』 iPhone13系列-甄选好品质大额优惠券-抢磁吸无线快充火爆开抢查看',
        ' 2599.00', '100+条评价', 'https://item.jd.com/10023440988474.html',
        'https://img14.360buyimg.com/n7/jfs/t1/141029/1/32268/87328/63a5e4b7Ebe9c1ecf/bfd43b3d08669eae.jpg');
INSERT INTO `goods`
VALUES (128, '京粉二手手机旗舰店',
        '拍拍 Apple\niPhone\n12 mini (A2400)苹果12mini二手手机准新 黑色【严选电池100】】 64G全网通『赠20W PD闪充』 iPhone13系列-甄选好品质大额优惠券-抢磁吸无线快充火爆开抢查看',
        ' 2799.00', '100+条评价', 'https://item.jd.com/10023441121733.html',
        'https://img13.360buyimg.com/n7/jfs/t1/95646/17/33593/89988/63a5e570E029f5502/7bfb9012f89ef437.jpg');
INSERT INTO `goods`
VALUES (129, '在一起二手手机专营店',
        '拍拍 Apple 苹果13Pro\niPhone\n13Pro 二手手机 二手苹果手机 远峰蓝色 128G 全网通 准新 Apple 苹果13Pro iPhone13Pro 二手手机 二手苹果手机 远峰蓝色 128G 全网通 准新',
        ' 6399.00', '100+条评价', 'https://item.jd.com/10048464683604.html',
        'https://img14.360buyimg.com/n7/jfs/t1/102069/31/35869/98234/6397007cEe05d2bd5/74c03e27846416c8.jpg');
INSERT INTO `goods`
VALUES (130, '重庆电信京东自营旗舰店',
        'Apple苹果\niPhone\n12 5G全网通双卡手机 黑色 128GB 厂家为了环保，iphone12系列，以及iphone11、XR、SE的新包装均不配置充头和耳机，有需要的需单独购买哦！',
        ' 4799.00', '100+条评价', 'https://item.jd.com/100017468794.html',
        'https://img14.360buyimg.com/n7/jfs/t1/154815/19/12560/41645/5feae9c2Ee333cf7a/928bd409e1e9136a.jpg');
INSERT INTO `goods`
VALUES (131, '星期八二手手机专营店',
        '拍拍 Apple\niPhone\n11 Pro Max 苹果11ProMax 原装国行 苹果手机 二手手机 暗夜绿色[赠配件大礼包] 64G全网通 95新 盛夏特惠，下单立减，店内爆款苹果12，活动期间赠送20w快充，联系客服还有神秘好礼相送，店内还有更多机器任你挑选！速戳！',
        ' 3009.00', '100+条评价', 'https://item.jd.com/10051505218340.html',
        'https://img10.360buyimg.com/n7/jfs/t1/16900/19/18064/264477/62c67b1aE7459468f/4628ace66e922ee1.jpg');
INSERT INTO `goods`
VALUES (132, '在一起二手手机专营店',
        '拍拍 苹果se2 Apple\niphone\nse 2 同苹果8外观 游戏性能 二手苹果手机 红色 64G【品牌效率100%电池】 95成新 苹果se2 Apple iphone se 2 同苹果8外观 游戏性能 二手苹果手机 红色 64G【品牌效率100%电池】 95成新',
        ' 1299.00', '100+条评价', 'https://item.jd.com/10055898480154.html',
        'https://img14.360buyimg.com/n7/jfs/t1/189280/30/18470/67768/6118e8d8Ef0333766/2b8185685ce39a3e.jpg');
INSERT INTO `goods`
VALUES (133, '京融二手商品专营店',
        'Apple\niPhone\n14 Pro Max(A2896)512GB 暗紫色(MQ8G3CH/A)【CTY】 Apple iPhone 14 Pro Max(A2896)512GB 暗紫色(MQ8G3CH/A)【CTY】',
        ' 12599.00', '100+条评价', 'https://item.jd.com/100041887295.html',
        'https://img10.360buyimg.com/n7/jfs/t1/185988/13/28403/20834/63368724Ee3f8247d/ffe6645c26240be9.jpg');
INSERT INTO `goods`
VALUES (134, '柏新优品二手手机专营店',
        '拍拍 苹果xr Apple\niPhone\nXR 二手手机 二手苹果手机 6.1英寸 国行全网通 9成新 黑色 64G全网通 新店开张，限时钜惠。下单赠送手机套装大礼包，本店注重客户服务以及商品质量，欢迎大家选购！点击福利款》',
        ' 1599.00', '100+条评价', 'https://item.jd.com/10029183913248.html',
        'https://img13.360buyimg.com/n7/jfs/t1/64171/34/23359/77161/63a5e885Ea4144b19/0ad396c6c7c0c7ec.jpg');
INSERT INTO `goods`
VALUES (135, '果粉二手手机专营店',
        '拍拍 Apple\niPhone\n13 mini (A2629)苹果13mini二手手机99新 粉色 256GB全网通『赠20W PD闪充』 仅激活未使用iPhone13系列-媲美全新机大额优惠券-送蓝牙耳机火爆开抢',
        ' 4199.00', '100+条评价', 'https://item.jd.com/10037748768366.html',
        'https://img11.360buyimg.com/n7/jfs/t1/44924/21/17214/75050/63a5e572Efa3fb5b3/52842c0136d9a59c.jpg');
INSERT INTO `goods`
VALUES (136, '莫拉克手机专营店', '国行全新原封未激活苹果Apple\niPhone\n11 Pro手机双卡双待 金色 64GB 全新国行正品未激活',
        ' 3998.00', '90条评价', 'https://item.jd.com/63278605849.html',
        'https://img14.360buyimg.com/n7/jfs/t1/175815/35/29959/96197/63215727Ef718b336/de1fed83d5ac8d05.jpg');
INSERT INTO `goods`
VALUES (137, '浙江电信京东自营旗舰店',
        'Apple\niPhone\n14 Plus (A2888) 128GB 紫色 支持移动联通电信5G 双卡双待手机Z Apple iPhone 14 Plus (A2888) 128GB 紫色 支持移动联通电信5G 双卡双待手机Z',
        ' 6499.00', '90条评价', 'https://item.jd.com/100038630337.html',
        'https://img12.360buyimg.com/n7/jfs/t1/142757/18/29575/19623/63200f4aE3ebd3eb7/35bd87b4151fa77a.jpg');
INSERT INTO `goods`
VALUES (138, '京融二手商品专营店',
        'Apple\niPhone\n14 Plus (A2888) 256GB 午夜色 支持移动联通电信5G 双卡双待手机 MQ3C3CH/A Apple iPhone 14 Plus (A2888) 256GB 午夜色 支持移动联通电信5G 双卡双待手机 MQ3C3CH/A',
        ' 7899.00', '90条评价', 'https://item.jd.com/100049606321.html',
        'https://img11.360buyimg.com/n7/jfs/t1/91577/38/34033/18922/63857119Ecf9aafee/783f0fcb5313e409.jpg');
INSERT INTO `goods`
VALUES (139, '京融二手商品专营店',
        '拍拍 苹果8 Apple\niPhone\n8 二手国行学生机备用机美观便携款全网通4G手机指纹解锁性能小钢炮 金色 256G全网通颜色随机【100%电池+20w快充】 95成新 苹果8 Apple iPhone 8 二手国行学生机备用机美观便携款全网通4G手机指纹解锁性能小钢炮 金色 256G全网通颜色随机【100%电池+20w快充】 95成新',
        ' 1339.00', '89条评价', 'https://item.jd.com/10051220393446.html',
        'https://img11.360buyimg.com/n7/jfs/t1/29360/8/16065/286964/627e707fE3855212f/a6b423f021246a2d.jpg');
INSERT INTO `goods`
VALUES (140, '北京移动京东自营旗舰店',
        'Apple\niPhone\n14 Pro Max (A2896) 256GB 金色 支持移动联通电信5G 双卡双待手机 【充电套装版】 Apple iPhone 14 Pro Max (A2896) 256GB 金色 支持移动联通电信5G 双卡双待手机 【充电套装版】',
        ' 11399.00', '88条评价', 'https://item.jd.com/100038630237.html',
        'https://img12.360buyimg.com/n7/jfs/t1/146962/11/29745/36060/6336996aE0e086b18/b256339958cdf5a2.jpg');
INSERT INTO `goods`
VALUES (141, '机淘淘二手商品专营店',
        '拍拍 Apple\niPhone\n11 Pro 苹果11 Pro 苹果二手手机 4G全网通二手手机 95新 银色 256G全网通 Apple iPhone 11 Pro 苹果11 Pro 苹果二手手机 4G全网通二手手机 95新 银色 256G全网通',
        ' 3199.00', '88条评价', 'https://item.jd.com/10034783074690.html',
        'https://img10.360buyimg.com/n7/jfs/t1/152044/28/23346/93880/629056bdE8253e58a/c8329a770df80bf0.jpg');
INSERT INTO `goods`
VALUES (142, '中国联通京东自营官方旗舰店',
        'Apple\niPhone\n14 Pro Max (A2896) 512GB 深空黑色 支持移动联通电信5G 双卡双待手机 套装版 Apple iPhone 14 Pro Max (A2896) 512GB 深空黑色 支持移动联通电信5G 双卡双待手机 套装版',
        ' 14949.00', '76条评价', 'https://item.jd.com/100048262943.html',
        'https://img13.360buyimg.com/n7/jfs/t1/216144/27/23241/20308/6375dc1fE677db435/689703fd8b07baf0.jpg');
INSERT INTO `goods`
VALUES (143, '柏新优品二手手机专营店',
        '拍拍 苹果11pro 二手手机 手机apple\niphone\n11pro 游戏全面屏手机 二手9成新 暗夜绿色 64G全网通【品牌电池效率100】 新店开张，限时钜惠。下单赠送手机套装大礼包，本店注重客户服务以及商品质量，欢迎大家选购！点击福利款》',
        ' 2459.00', '74条评价', 'https://item.jd.com/10031272662678.html',
        'https://img13.360buyimg.com/n7/jfs/t1/52806/10/24288/100467/63a5e884E12e7e325/743be79ee587ab63.jpg');
INSERT INTO `goods`
VALUES (144, '京品严选二手手机专营店',
        '拍拍 Apple\niPhone\n7plus 苹果7 Plus 二手苹果手机 4G全网通 金色 128G 全网通 99成新 Apple iPhone 7plus 苹果7 Plus 二手苹果手机 4G全网通 金色 128G 全网通 99成新',
        ' 928.00', '74条评价', 'https://item.jd.com/10048436087854.html',
        'https://img14.360buyimg.com/n7/jfs/t1/133229/25/22025/494083/62061951Ed1b8f010/0d69c623ad0a4d30.png');
INSERT INTO `goods`
VALUES (145, '居然智慧家旗舰店',
        'Apple苹果\niphone\n13promax（A2644） 5G手机 远峰蓝色 256GB 官方标配 现货当天发，全国多仓发货疾速达，晒单送红包30元，国行正品，全国联保，电子发票放心购，支持无线充电，热卖推荐：苹果iphone14',
        ' 10499.00', '74条评价', 'https://item.jd.com/10057627745891.html',
        'https://img11.360buyimg.com/n7/jfs/t1/213763/34/22015/48433/63490f67E0e21d443/bae8480c6431fb8f.jpg');
INSERT INTO `goods`
VALUES (146, '布爷3C数码买手店',
        'Apple 苹果\niPhone\n14系列手机14 Pro 14 ProMax 5G全网通双卡双待手机\niPhone\n14 Pro 暗紫色 128GB 新品上市,溢价比较高,价格浮动大，不保价。不保价,不保价,不保价！',
        ' 8699.00', '74条评价', 'https://item.jd.com/10060160510311.html',
        'https://img11.360buyimg.com/n7/jfs/t1/131425/5/32980/25955/6368e259Ec2995f6b/0aaf3ec140cd1cea.jpg');
INSERT INTO `goods`
VALUES (147, '中国电信自营旗舰店',
        'Apple* 苹果\niPhone\n13 支持移动联通电信 双卡双待全网通5G手机 128GB 绿色 Apple* 苹果 iPhone 13 支持移动联通电信 双卡双待全网通5G手机 128GB 绿色',
        ' 5399.00', '73条评价', 'https://item.jd.com/100024031677.html',
        'https://img12.360buyimg.com/n7/jfs/t1/125693/10/24454/37375/6229a729Eae61d3ef/7f362bd6b3cd339e.jpg');
INSERT INTO `goods`
VALUES (148, '拍拍严选尖货旗舰店',
        '拍拍 【仅激活未使用】苹果\niPhone\n13 Pro Max展示机 二手手机 国行 远峰蓝【99新】 128G 热8购物季！苹果13Pro2下单赠手机壳+钢化膜！数量有限！现货速发~点击查看！',
        ' 7399.00', '55条评价', 'https://item.jd.com/10049971093849.html',
        'https://img14.360buyimg.com/n7/jfs/t1/89728/25/22768/52835/63a1dd7cE44fa7d88/84de47da163cda44.jpg');
INSERT INTO `goods`
VALUES (149, '博之襄二手手机专营店',
        '拍拍 苹果6 Apple\niPhone\n6 苹果 6 二手手机 国行 金色 16G 移动4G版电池（100%） 9成新 苹果6 Apple iPhone 6 苹果 6 二手手机 国行 金色 16G 移动4G版电池（100%） 9成新',
        ' 378.00', '55条评价', 'https://item.jd.com/10050743873371.html',
        'https://img11.360buyimg.com/n7/jfs/t1/134276/15/32607/69915/6370a029E5839f44e/3f5c6bd96e6436ff.jpg');
INSERT INTO `goods`
VALUES (150, '拾锦二手商品专营店',
        '拍拍 Apple\niPhone\nSE 2 苹果 SE2二手手机 国行全网通4.7寸 黑色 128G 续航更好 换全新品牌电池 99成新 Apple iPhone SE 2 苹果 SE2二手手机 国行全网通4.7寸 黑色 128G 续航更好 换全新品牌电池 99成新',
        ' 1768.00', '55条评价', 'https://item.jd.com/10052792577309.html',
        'https://img14.360buyimg.com/n7/jfs/t1/215741/6/17502/177052/62603b7bE9d7e1ab8/fc46fdcc6dfd18cd.jpg');
INSERT INTO `goods`
VALUES (151, '秒亿二手手机专营店',
        '拍拍 苹果6手机 Apple iPhone6 二手手机 备用机 4.7英寸 全网通 二手 金色 16G全网通 9成新 年末超值购，华为P20-6+64G限时购低至546！立购！！！',
        ' 398.00', '55条评价', 'https://item.jd.com/10054169170170.html',
        'https://img10.360buyimg.com/n7/jfs/t1/213680/24/22899/454558/6364b98bEc362e51d/3c67908ad556b8d6.png');
INSERT INTO `goods`
VALUES (152, '帝豪二手手机专营店',
        '拍拍 二手苹果手机Apple\niPhone\n8 银色 99新256G全网通『电池效率100』 99 一物一验，专业质检，7天无理由退货，15天无理由包换，365天超长质保，联系客服送苹果5件套',
        ' 1538.00', '55条评价', 'https://item.jd.com/10056813234508.html',
        'https://img13.360buyimg.com/n7/jfs/t1/185109/26/27998/99887/63156ca0Ebddc298d/c478f39d7aa5e407.jpg');
INSERT INTO `goods`
VALUES (153, '鑫曙手机买手店',
        '爱心东东 【现货】Apple/苹果13 [美版有锁]\niPhone\n13美版 单卡 手机 全新机 支持移动联通 午夜色 单机 128GB 美版有锁带卡贴 【现货速发】【国内直邮】',
        ' 3998.00', '55条评价', 'https://item.jd.com/10060267144835.html',
        'https://img10.360buyimg.com/n7/jfs/t1/193625/8/29202/60106/63639b76E7c87dabb/74a0ccb217ea4b98.jpg');
INSERT INTO `goods`
VALUES (154, '北京移动京东自营旗舰店',
        'Apple\niPhone\n14 Pro (A2892) 512GB 银色 支持移动联通电信5G 双卡双待手机 【充电套装版】 Apple iPhone 14 Pro (A2892) 512GB 银色 支持移动联通电信5G 双卡双待手机 【充电套装版】',
        ' 12199.00', '43条评价', 'https://item.jd.com/100038630269.html',
        'https://img14.360buyimg.com/n7/jfs/t1/183193/32/28993/33283/634263bbEf7b836b3/3426639c7806a166.jpg');
INSERT INTO `goods`
VALUES (155, '小皮科技二手商品旗舰店',
        '拍拍 【已验机】Apple\niPhone\n苹果12 mini 国行 二手手机 全网通5G 蓝色 128G 【已验机】Apple iPhone 苹果12 mini 国行 二手手机 全网通5G 蓝色 128G',
        ' 2649.00', '43条评价', 'https://item.jd.com/10031974913896.html',
        'https://img11.360buyimg.com/n7/jfs/t1/158637/5/33475/51988/639932e0E4bb674a0/2e3838626501d5f4.png');
INSERT INTO `goods`
VALUES (156, '爱相随二手手机专营店',
        '拍拍 Apple\niPhone\n12mini 苹果12mini 二手苹果原装国行二手手机 黑色 64G 全网通 99成新 Apple iPhone12mini 苹果12mini 二手苹果原装国行二手手机 黑色 64G 全网通 99成新',
        ' 2388.00', '43条评价', 'https://item.jd.com/10049863809835.html',
        'https://img10.360buyimg.com/n7/jfs/t1/9174/7/21464/114547/6397005fE91340cde/2f33ae364c42ad74.jpg');
INSERT INTO `goods`
VALUES (157, '九州优品二手手机专营店',
        '拍拍 苹果 Apple 苹果11\niPhone\n11 二手手机 二手苹果手机 双卡双待 国行全网通 9成新 红色 11-128G【全网通】 9新 【活动持续不断---优惠乐享不停】现购买商品满1000减50元，满2000减100元，满3000减150元。活动限时特价，现货速发，7天免费试用，快来抢购吧。',
        ' 2339.00', '43条评价', 'https://item.jd.com/10050721600973.html',
        'https://img13.360buyimg.com/n7/jfs/t1/104065/28/35507/118844/637bc246Ef73651c0/c6f9238d1224ddc0.jpg');
INSERT INTO `goods`
VALUES (158, '盘酷优品二手手机专营店',
        '拍拍 Apple\niPhone\n11 Pro Max 苹果11promax二手苹果手机 双卡双待 国行原装 灰色 64G配20W快充 95成新 Apple iPhone11 Pro Max 苹果11promax二手苹果手机 双卡双待 国行原装 灰色 64G配20W快充 95成新',
        ' 3039.00', '43条评价', 'https://item.jd.com/10052255688311.html',
        'https://img11.360buyimg.com/n7/jfs/t1/186687/16/25705/201759/62bad0e6Ef411bf8c/dde26f7e9e12cfd0.jpg');
INSERT INTO `goods`
VALUES (159, '獭酷数码买手店',
        'Apple/苹果\niPhone\n11 全网通12 原装mini全新双卡 未使用bs\nIphone\n12 mini 5.4寸黑色 bs 官方标配 64GB 版本不一，排前咨询客服。',
        ' 3150.00', '43条评价', 'https://item.jd.com/10056290831852.html',
        'https://img12.360buyimg.com/n7/jfs/t1/180012/6/27743/58673/62f8d11aE50c34e0a/78cd781219799a17.jpg');
INSERT INTO `goods`
VALUES (160, '重庆电信京东自营旗舰店',
        'Apple苹果\niPhone\n12 5G全网通双卡手机 紫色 128GB Apple苹果iPhone 12 5G全网通双卡手机 紫色 128GB', ' 4799.00',
        '32条评价', 'https://item.jd.com/100011266351.html',
        'https://img11.360buyimg.com/n7/jfs/t1/183925/21/756/46068/6083e6e6Ef4133b6e/7041b4ec5e922528.jpg');
INSERT INTO `goods`
VALUES (161, '中国联通京东自营官方旗舰店',
        'Apple\niPhone\n14 Pro (A2892) 256GB 银色 支持移动联通电信5G 双卡双待手机 套装版 Apple iPhone 14 Pro (A2892) 256GB 银色 支持移动联通电信5G 双卡双待手机 套装版',
        ' 10499.00', '32条评价', 'https://item.jd.com/100048262939.html',
        'https://img14.360buyimg.com/n7/jfs/t1/219088/4/23695/16929/6375e624Eadb34aa8/f3521147999e0316.jpg');
INSERT INTO `goods`
VALUES (162, '谷风羽二手手机专营店',
        '拍拍 苹果7Plus手机 Apple\niPhone\n7Plus 苹果7P 二手手机国行 磨砂黑 128G 全网通【赠配件五件套】9成新 【支持7天无理由退、15天换货】京东专业机构质检品质可靠丨180天超长质保丨京送到家，快速又放心丨咨询客服即送配件5件套丨本店注重客户服务以及商品质量欢迎选购',
        ' 845.00', '32条评价', 'https://item.jd.com/10040526512464.html',
        'https://img14.360buyimg.com/n7/jfs/t1/193759/14/21895/453639/62480738E937a35cd/871abf6a0afb5753.png');
INSERT INTO `goods`
VALUES (163, '恒泽数码买手店',
        'Apple /苹果\niPhone\n12 mini日版 绿色 12 mini 5.4 64GB Apple /苹果 iPhone12 mini日版 绿色 12 mini 5.4 64GB',
        ' 3300.00', '32条评价', 'https://item.jd.com/10051234850129.html',
        'https://img14.360buyimg.com/n7/jfs/t1/111185/2/27516/70495/62716acfEf9d39653/42c098b99745298d.jpg');
INSERT INTO `goods`
VALUES (164, '拍拍严选官方旗舰店',
        '拍拍 【焕新机】Apple\niPhone\n7 苹果7 二手手机 更换电池和屏幕 优品 95新 亮黑色 128G 【焕新机】Apple iPhone 7 苹果7 二手手机 更换电池和屏幕 优品 95新 亮黑色 128G',
        ' 779.00', '32条评价', 'https://item.jd.com/10057202546400.html',
        'https://img10.360buyimg.com/n7/jfs/t1/137521/3/27379/36225/63771bc4E81ef9624/e2704bb231f80798.jpg');
INSERT INTO `goods`
VALUES (165, '柑恒通讯香港手机买手店',
        'Apple 苹果\niPhone\n14 Plus 14 Pro Max 双卡双待5G手机 新功能灵动岛\niPhone\n14 Pro 暗紫色 128GB 新品上市，溢价比较高，价格浮动大，不保价，不保价，不保价，不保价',
        ' 8699.00', '32条评价', 'https://item.jd.com/10060294881526.html',
        'https://img11.360buyimg.com/n7/jfs/t1/179549/7/28651/25955/632ace8eE6030fc76/8144b2b1637e1f2c.jpg');
INSERT INTO `goods`
VALUES (166, '华语二手手机专营店',
        '拍拍 苹果 8Plus Apple\niPhone\n8 Plus 二手手机 8p 国行【电池效率100%】 银色 64G 标准版-3C认证品牌新电池2675毫安 9成新 苹果 8Plus Apple iPhone 8 Plus 二手手机 8p 国行【电池效率100%】 银色 64G 标准版-3C认证品牌新电池2675毫安 9成新',
        ' 1388.00', '26条评价', 'https://item.jd.com/10052689022144.html',
        'https://img14.360buyimg.com/n7/jfs/t1/134751/36/28581/76588/63996fefE38e24908/075522ae7099796f.jpg');
INSERT INTO `goods`
VALUES (167, '拍拍严选官方旗舰店',
        '拍拍 【焕新机】Apple\niPhone\n7 Plus 苹果7 plus 更换电池和屏幕 二手手机 优品 95新 玫瑰金 128G 【焕新机】Apple iPhone 7 Plus 苹果7 plus 更换电池和屏幕 二手手机 优品 95新 玫瑰金 128G',
        ' 979.00', '26条评价', 'https://item.jd.com/10057202440794.html',
        'https://img14.360buyimg.com/n7/jfs/t1/64294/23/23513/41768/63771bcaE55d778a0/40220993406fc5ad.png');
INSERT INTO `goods`
VALUES (168, '海汇通数码买手店',
        'Apple 苹果\niPhone\n14 Plus手机14 Pro Max 手机 5G 双卡双待手机\niPhone\n14 Pro 暗紫色 128GB 官方标配 iPhone14横空出世，现货速发，不保价，以当天发货前的价格为准，新机上市价格波动大，不保价，不保价，不保价，不保价',
        ' 8799.00', '26条评价', 'https://item.jd.com/10060295009443.html',
        'https://img13.360buyimg.com/n7/jfs/t1/169794/34/29258/35508/63678540Eb99792af/72b49f058519d382.jpg');
INSERT INTO `goods`
VALUES (169, '拍拍严选尖货旗舰店',
        '拍拍 【焕新机】Apple\niPhone\n11 Pro 苹果11pro手机 备用机学生机 苹果二手机 绿色 256 热8购物季！苹果13Pro2下单赠手机壳+钢化膜！数量有限！现货速发~',
        ' 3439.00', '26条评价', 'https://item.jd.com/10061533255078.html',
        'https://img13.360buyimg.com/n7/jfs/t1/43223/4/20074/177713/6359dea2E30f5f353/aea6ad2453b19ee3.png');
INSERT INTO `goods`
VALUES (170, '四川联通京东自营旗舰店',
        'Apple\niPhone\n13 Pro Max (A2644) 256GB 石墨色 支持移动联通电信5G 双卡双待手机 Apple iPhone 13 Pro Max (A2644) 256GB 石墨色 支持移动联通电信5G 双卡双待手机',
        ' 9799.00', '25条评价', 'https://item.jd.com/100026954934.html',
        'https://img14.360buyimg.com/n7/jfs/t1/90071/8/15263/34162/6146db6dE19aaf76e/294eb993e08d8961.jpg');
INSERT INTO `goods`
VALUES (171, '亿品汇旗舰店',
        'Apple\niPhone\n14 Plus(A2888)128GB 紫色(MQ373CH/A)【CES】 Apple iPhone 14 Plus(A2888)128GB 紫色(MQ373CH/A)【CES】',
        ' 6999.00', '25条评价', 'https://item.jd.com/100038004331.html',
        'https://img10.360buyimg.com/n7/jfs/t1/223337/5/18165/89636/63a4099aE79b8b1cf/e153d9c3af22abcf.jpg');
INSERT INTO `goods`
VALUES (172, '深得二手手机专营店',
        '拍拍 苹果Apple\niPhone\n12Pro 二手手机 苹果12Pro 国行 全网通 5G双卡双待 灰色 128G 全网通 二手99新 国行正品，下单即送充电器套装，钢化膜手机壳，7天免费试用，365天质保，数量有限抢购！！',
        ' 4479.00', '20条评价', 'https://item.jd.com/10052478468540.html',
        'https://img10.360buyimg.com/n7/jfs/t1/223337/5/18165/89636/63a4099aE79b8b1cf/e153d9c3af22abcf.jpg');
INSERT INTO `goods`
VALUES (173, '京严二手手机专营店',
        '拍拍 苹果xr Apple\niPhone\nXR 二手手机 二手苹果手机 全面屏游戏手机 黑色 64G全网通[赠配件套装] 99成新 本店注重产品质量，服务质量，国行机器，品质保证，专业质检，购机无忧，99新苹果12蓝色128G仅售3098，点击直达！',
        ' 1488.00', '20条评价', 'https://item.jd.com/10056875909623.html',
        'https://img13.360buyimg.com/n7/jfs/t1/153515/28/25347/67706/62de567fEad9c5f7c/dd26ed23b1f96ca5.jpg');
INSERT INTO `goods`
VALUES (174, '发靓机优品二手手机专营店',
        '拍拍 Apple苹果\niPhone\n12ProMax国行双卡全网通5G版 二手苹果12ProMax 海蓝色 256G 99成新 下单领优惠券',
        ' 5499.00', '20条评价', 'https://item.jd.com/10057064071456.html',
        'https://img11.360buyimg.com/n7/jfs/t1/222796/10/17272/126131/6287191cEedd9f29d/8b53efc0a87b34c2.jpg');
INSERT INTO `goods`
VALUES (175, '拍拍严选官方旗舰店',
        '拍拍 Apple\niPhone\n8 苹果8二手手机 国行 优品 95新 深空灰色 64G Apple iPhone 8 苹果8二手手机 国行 优品 95新 深空灰色 64G',
        ' 1089.00', '20条评价', 'https://item.jd.com/10057201068083.html',
        'https://img13.360buyimg.com/n7/jfs/t1/51135/12/20033/263521/62e0f140E38995321/0fffeeac0678d936.png');
INSERT INTO `goods`
VALUES (176, '四川联通京东自营旗舰店',
        'Apple\niPhone\n13 Pro Max (A2644) 256GB 银色 支持移动联通电信5G 双卡双待手机 Apple iPhone 13 Pro Max (A2644) 256GB 银色 支持移动联通电信5G 双卡双待手机',
        ' 9799.00', '19条评价', 'https://item.jd.com/100014543437.html',
        'https://img12.360buyimg.com/n7/jfs/t1/204707/32/1893/36177/6146df49E203debf2/bfc4ad97e51bc481.jpg');
INSERT INTO `goods`
VALUES (177, '云南联通京东自营旗舰店',
        'Apple苹果\niphone\nSE小屏幕旗舰手机全网通 红色 256GB Apple苹果iphone SE小屏幕旗舰手机全网通 红色 256GB',
        ' 4599.00', '19条评价', 'https://item.jd.com/100017979046.html',
        'https://img11.360buyimg.com/n7/jfs/t1/160837/29/3203/53476/6003c311Ee5404a8a/bd25fb2cd95ecff5.jpg');
INSERT INTO `goods`
VALUES (178, '锦昱手机通讯专营店',
        'Apple 苹果\niPhone\n13 Pro Max (A2644) 支持移动联通电信5G手机 石墨色 256GB Apple 苹果 iPhone 13 Pro Max (A2644) 支持移动联通电信5G手机 石墨色 256GB',
        ' 10899.00', '15条评价', 'https://item.jd.com/10037920705824.html',
        'https://img14.360buyimg.com/n7/jfs/t1/6213/17/20012/78661/6177786cE28dec1f3/5440300ddd03ca09.jpg');
INSERT INTO `goods`
VALUES (179, '三可严选二手手机专营店',
        '拍拍 Apple 苹果11 二手手机\niPhone\n11 二手苹果手机 全网通 白色 64G 95新 白色 128G全网通 送充电套装 95成新 三可严选所有商品都是有送检京东指定质检机构的！所有机器均是二手原装手机，【三可严选：可信任、可放心、可保障，打造京东服务品质，质量品质】',
        ' 2538.00', '15条评价', 'https://item.jd.com/10048729696981.html',
        'https://img11.360buyimg.com/n7/jfs/t1/75255/18/22599/49583/63349277Ed074d61e/21a2310d1e5788d9.png');
INSERT INTO `goods`
VALUES (180, '恒泽数码买手店',
        'Apple 苹果全新\niPhone\nX 原装SE2/SE3 8代 手机通4G手机 SE2白色美版 通 128GB Apple 苹果全新 iPhoneX 原装SE2/SE3 8代 手机通4G手机 SE2白色美版 通 128GB',
        ' 2350.00', '15条评价', 'https://item.jd.com/10053959630559.html',
        'https://img14.360buyimg.com/n7/jfs/t1/53631/5/18849/344768/629e0c12Ee3ab3303/a7de2be536a614ab.png');
INSERT INTO `goods`
VALUES (181, '三火全球买手店',
        'Apple 苹果\niPhone\nSE2 / SE3 4.7英寸通4G 全新海外版 无锁 SE3 黑色 64GB 海外版 Apple 苹果 iPhone SE2 / SE3 4.7英寸通4G 全新海外版 无锁 SE3 黑色 64GB 海外版',
        ' 2639.00', '15条评价', 'https://item.jd.com/10057216158798.html',
        'https://img13.360buyimg.com/n7/jfs/t1/172579/35/31552/15734/636f7828E6090b068/b519c80f0834f020.jpg');
INSERT INTO `goods`
VALUES (182, '拍拍严选尖货旗舰店',
        '拍拍 Apple\niPhone\nSE2\niPhone\n苹果se2手机 二手手机 国行\\x0a 白色 64G 9成新 热8购物季！苹果13Pro2下单赠手机壳+钢化膜！数量有限！现货速发~',
        ' 1489.00', '15条评价', 'https://item.jd.com/10057642664662.html',
        'https://img12.360buyimg.com/n7/jfs/t1/141630/29/30348/42553/635b3a38Ee29cb96c/605deccfe0bc4a24.jpg');
INSERT INTO `goods`
VALUES (183, '柔化数码专营店', '苹果Apple苹果12 mini\niPhone\n12 mini 5G 手机 紫色 5G版 256G 国行正品', ' 4999.00',
        '12条评价', 'https://item.jd.com/10035627533136.html',
        'https://img11.360buyimg.com/n7/jfs/t1/197385/28/3659/55410/611b80bbE13da2f7b/1e555df78dab9698.jpg');
INSERT INTO `goods`
VALUES (184, '萌豹数码专营店',
        'Apple 苹果\niphone\n12 5G手机 6.1英寸OLED屏 白色 全网通128G Apple 苹果 iphone 12 5G手机 6.1英寸OLED屏 白色 全网通128G',
        ' 4998.00', '12条评价', 'https://item.jd.com/10036399873011.html',
        'https://img11.360buyimg.com/n7/jfs/t1/194705/24/20887/60165/612f4f8aE0a77e871/f7e38a8fd7f78237.jpg');
INSERT INTO `goods`
VALUES (185, '岳鸿手机合约机专营店',
        'APPLE 【可选12期免息】Apple 苹果\niPhone\n12 5G手机 移动联通电信双卡双待 白色 256GB【官方标配】 APPLE 【可选12期免息】Apple 苹果 iPhone 12 5G手机 移动联通电信双卡双待 白色 256GB【官方标配】',
        ' 5799.00', '12条评价', 'https://item.jd.com/10038943971616.html',
        'https://img11.360buyimg.com/n7/jfs/t1/179090/6/20317/48920/611f1a55E0706465a/34bd2c383813303b.jpg');
INSERT INTO `goods`
VALUES (186, '万事达二手手机专营店',
        '拍拍 苹果\niPhone\n13ProMax 国行二手手机双卡5G全网通6.7大屏工作机备用机拍照性能机 99新 远峰蓝 128GB 性价比推荐100%电池，数量有限，先到先得',
        ' 6829.00', '12条评价', 'https://item.jd.com/10040690746383.html',
        'https://img13.360buyimg.com/n7/jfs/t1/144122/37/27007/51075/6361fcf0E6eda0a51/aa27a98c54295ded.png');
INSERT INTO `goods`
VALUES (187, '亿品汇旗舰店',
        '爱心东东 Apple\niPhone\n苹果12 Pro (A2408) 512GB 海蓝色 支持移动联通电信5G 海蓝色 128GB+20W原装充电 Apple iPhone 苹果12 Pro (A2408) 512GB 海蓝色 支持移动联通电信5G 海蓝色 128GB+20W原装充电',
        ' 6499.00', '12条评价', 'https://item.jd.com/10048289795253.html',
        'https://img13.360buyimg.com/n7/jfs/t1/59323/35/17993/319991/62739a4cE1c5e7801/b63f1d5c0feda80a.png');
INSERT INTO `goods`
VALUES (188, '三可严选二手手机专营店',
        '拍拍 Apple 苹果XS 二手手机\niPhone\nXS 二手苹果 国行 全网通 黑色 256G 95新 金色 256G全网通 送充电套装 95成新 Apple 苹果XS 二手手机 iPhone XS 二手苹果 国行 全网通 黑色 256G 95新 金色 256G全网通 送充电套装 95成新',
        ' 2238.00', '12条评价', 'https://item.jd.com/10051133887875.html',
        'https://img10.360buyimg.com/n7/jfs/t1/180734/22/28840/338348/6334b2bfE3bf0cc11/06406705f989e290.png');
INSERT INTO `goods`
VALUES (189, '发靓机优品二手手机专营店',
        '拍拍 Apple\niPhone\n14 Pro Max 二手手机 国行双卡全网通5G 双卡双待 暗紫色 256G 99成新 下单领优惠券',
        ' 10399.00', '9条评价', 'https://item.jd.com/10061225012819.html',
        'https://img14.360buyimg.com/n7/jfs/t1/204805/26/29536/79582/63731348Efdd09bec/193330c294d445ce.jpg');
INSERT INTO `goods`
VALUES (190, '粤和数码买手店',
        '苹果（Apple）\niPhone\nSE SE2 SE3 苹果SE 系列 手机 全新未激活有锁\niPhone\nSE 2 黑色 64G 欧/美/日版 有锁单机未激活 苹果（Apple）iPhone SE SE2 SE3 苹果SE 系列 手机 全新未激活有锁 iPhone SE 2 黑色 64G 欧/美/日版 有锁单机未激活',
        ' 1299.00', '9条评价', 'https://item.jd.com/10066473719804.html',
        'https://img14.360buyimg.com/n7/jfs/t1/184539/30/31065/15693/638225c5Ed8080baf/27683d1a9de9599c.jpg');
INSERT INTO `goods`
VALUES (191, '亿品汇旗舰店', 'Apple\niPhone\n13 全网通5G手机 粉色 256GB Apple iPhone 13 全网通5G手机 粉色 256GB',
        ' 6799.00', '8条评价', 'https://item.jd.com/100026435975.html',
        'https://img10.360buyimg.com/n7/jfs/t1/903/3/18606/36216/62abf296Ecc3b6e9c/d8f3cf96ea341c23.jpg');
INSERT INTO `goods`
VALUES (192, '四川联通京东自营旗舰店',
        'Apple\niPhone\n13 (A2634) 512GB 蓝色 支持移动联通电信5G 双卡双待手机 Apple iPhone 13 (A2634) 512GB 蓝色 支持移动联通电信5G 双卡双待手机',
        ' 8099.00', '8条评价', 'https://item.jd.com/100026954378.html',
        'https://img13.360buyimg.com/n7/jfs/t1/198753/4/9291/40198/61483bb6Efbbf0b99/a95b900669a1cdae.jpg');
INSERT INTO `goods`
VALUES (193, '四川联通京东自营旗舰店',
        'Apple\niPhone\n13 Pro Max (A2644) 256GB 苍岭绿色 支持移动联通电信5G 双卡双待手机 Apple iPhone 13 Pro Max (A2644) 256GB 苍岭绿色 支持移动联通电信5G 双卡双待手机',
        ' 9799.00', '8条评价', 'https://item.jd.com/100034873348.html',
        'https://img13.360buyimg.com/n7/jfs/t1/145760/5/25263/35792/6228b82eE0492d417/23dacf742f63706f.jpg');
INSERT INTO `goods`
VALUES (194, '云南联通京东自营旗舰店',
        'Apple\niPhone\n14 Pro Max (A2896) 256GB 暗紫色 支持移动联通电信5G 双卡双待手机【开心套装】 【套装】包含:iPhone14ProMax手机1台+苹果20W充电头1个+透明手机壳1个',
        ' 11399.00', '8条评价', 'https://item.jd.com/100047991983.html',
        'https://img13.360buyimg.com/n7/jfs/t1/125651/9/28505/26094/63762676Ec3c935e0/a66be12fcd5a6a3e.jpg');
INSERT INTO `goods`
VALUES (195, '亿品汇旗舰店',
        'Apple\niPhone\n14(A2884)256GB 红色(MPWE3CH/A)【CES】 Apple iPhone 14(A2884)256GB 红色(MPWE3CH/A)【CES】',
        ' 6899.00', '6条评价', 'https://item.jd.com/100038005115.html',
        'https://img10.360buyimg.com/n7/jfs/t1/171821/33/29583/25287/631937f4E35b39e06/ab028e6f3dfd0e1f.jpg');
INSERT INTO `goods`
VALUES (196, '重庆电信京东自营旗舰店',
        'Apple\niPhone\n14 Plus (A2888) 512GB 蓝色 支持移动联通电信5G 双卡双待手机 抢先购iPhone14：玩大玩超大，低光照手艺大提升，神技能爆满',
        ' 9299.00', '6条评价', 'https://item.jd.com/100038632645.html',
        'https://img10.360buyimg.com/n7/jfs/t1/62549/30/21637/22526/631bf28cE4b5ec161/080f920b3dd4da34.jpg');
INSERT INTO `goods`
VALUES (197, '云南联通京东自营旗舰店',
        'Apple\niPhone\n14 Pro Max (A2896) 512GB 深空黑色 支持移动联通电信5G 双卡双待手机【开心套装】 【套装】包含:iPhone14ProMax手机1台+苹果20W充电头1个+透明手机壳1个',
        ' 13899.00', '6条评价', 'https://item.jd.com/100047991971.html',
        'https://img11.360buyimg.com/n7/jfs/t1/172473/15/31696/31698/63762239Ed1346e3b/562b294e81063aa1.jpg');
INSERT INTO `goods`
VALUES (198, '重庆电信京东自营旗舰店',
        'Apple\niPhone\n14 Pro (A2892) 512GB 银色 支持移动联通电信5G 双卡双待手机【开心套装】 【套装】包含:iPhone14Pro手机1台+苹果20W充电头1个+透明手机壳1个',
        ' 12099.00', '6条评价', 'https://item.jd.com/100047991987.html',
        'https://img12.360buyimg.com/n7/jfs/t1/50931/11/21991/32856/63762290Ed0d99e95/342e931c51cd5b83.jpg');
INSERT INTO `goods`
VALUES (199, '鲲鹏手机专营店',
        '爱心东东 Apple\niPhone\n苹果 11Pro Max 256g全新原装正品未激活手机电信移动联通 暗夜绿色 64G 【原封国行，全国联保】送尊享好礼，下单速发！',
        ' 5219.00', '6条评价', 'https://item.jd.com/10035117451816.html',
        'https://img11.360buyimg.com/n7/jfs/t1/75395/18/18038/114063/6274a38dE90c41ca9/5db111bba742a9d7.jpg');
INSERT INTO `goods`
VALUES (200, '讯天安专营店',
        '苹果（Apple） Apple\niPhone\n13 Pro (A2639) 支持移动联通电信5G 银色 256GB 苹果（Apple） Apple iPhone 13 Pro (A2639) 支持移动联通电信5G 银色 256GB',
        ' 9399.00', '6条评价', 'https://item.jd.com/10037748178871.html',
        'https://img11.360buyimg.com/n7/jfs/t1/167176/19/24487/133895/61519428E31483570/d184450d704dcf56.jpg');
INSERT INTO `goods`
VALUES (201, '美集睿旗舰店',
        'Apple 苹果\niPhone\n14 Pro Max (A2896) 暗紫色 1TB Apple 苹果 iPhone 14 Pro Max (A2896) 暗紫色 1TB',
        'ContentMap14799.00', '5条评价', 'https://item.jd.com/10061787107767.html',
        'https://img12.360buyimg.com/n7/jfs/t1/62589/16/22587/52455/634fccadE0e73966e/272866172af05b98.jpg');
INSERT INTO `goods`
VALUES (202, '耀不凡旗舰店',
        '爱心东东 Apple 苹果\niphone\n14promax (A2896) 5G 双卡双待手机 深空黑色 1T全网通 【国行正品，全新未拆封未激活】6.7英寸屏幕，灵动岛设计，A16仿生芯片，主摄4800万像素！',
        'ContentMap15078.00', '5条评价', 'https://item.jd.com/10062390970858.html',
        'https://img13.360buyimg.com/n7/jfs/t1/193611/19/30730/315785/63a2a1c3E046e3386/a76cd0e7c1e5b6c2.png');
INSERT INTO `goods`
VALUES (203, '机淘淘二手商品专营店',
        '拍拍 Apple 苹果\niPhone\n14 二手手机 支持移动联通电信5G 双卡双待手机 星光色 128GB 99成新 Apple 苹果 iPhone 14 二手手机 支持移动联通电信5G 双卡双待手机 星光色 128GB 99成新',
        'ContentMap5299.00', '5条评价', 'https://item.jd.com/10063187621670.html',
        'https://img10.360buyimg.com/n7/jfs/t1/100592/25/27238/41067/634d08b8E9d0d9b7e/ca74eecc87698f7e.jpg');
INSERT INTO `goods`
VALUES (204, '好机汇手机专营店',
        'Apple\niPhone\n14 (A2884)\\/苹果14支持移动联通电信5G 双卡双待手机 午夜色 128G【90天碎屏保】 Apple iPhone 14 (A2884)\\/苹果14支持移动联通电信5G 双卡双待手机 午夜色 128G【90天碎屏保】',
        'ContentMap5599.00', '5条评价', 'https://item.jd.com/10063618479044.html',
        'https://img14.360buyimg.com/n7/jfs/t1/112205/26/26996/49063/63636b6dE0d6ed852/fa7da9f675334cb5.jpg');
INSERT INTO `goods`
VALUES (205, '柒静绗数码买手店',
        'Apple /\niPhone\n12ProMax 苹果12Pro 拍照手机游戏手机 5G全网通未激活 颜值\niPhone\n12 海蓝色 256GB 未激活 所有版本均为拆封原装过保裸机单机头，由本店后配非原装手机盒数据线，并提供一年质保服务，具体版本情况请购买前咨询客服！',
        'ContentMap4829.00', '5条评价', 'https://item.jd.com/10065353303551.html',
        'https://img11.360buyimg.com/n7/jfs/t1/183191/18/29913/24350/636c7e56E090dfe89/94b0f4673662165b.jpg');
INSERT INTO `goods`
VALUES (206, 'cdf会员购海南旗舰店',
        '苹果手机 Apple\niPhone\n14 蓝色 128GB N100963 苹果手机 Apple iPhone 14 蓝色 128GB N100963',
        'ContentMap5999.00', '5条评价', 'https://item.jd.com/10065450896797.html',
        'https://img12.360buyimg.com/n7/jfs/t1/63111/37/19942/19466/636dde3eE4aca4a97/bbfcf58fcc8834c4.jpg');
INSERT INTO `goods`
VALUES (207, '海汇通数码买手店',
        'Apple\niPhone\n13 苹果 13 pro Max 苹果13系列 5G手机 通双卡双待 13 黑色 256GB Apple iPhone13 苹果 13 pro Max 苹果13系列 5G手机 通双卡双待 13 黑色 256GB',
        'ContentMap6399.00', '3条评价', 'https://item.jd.com/10054433534906.html',
        'https://img11.360buyimg.com/n7/jfs/t1/83275/17/24206/125336/6391b833E89e2d5da/23bb1f7515e5d031.png');
INSERT INTO `goods`
VALUES (208, '星潮二手手机专营店',
        '拍拍 Apple\niPhone\n13 苹果13二手苹果手机国行全网通5G手机 红色 128G全网通 99新 Apple iPhone 13 苹果13二手苹果手机国行全网通5G手机 红色 128G全网通 99新',
        'ContentMap4279.00', '3条评价', 'https://item.jd.com/10055490645085.html',
        'https://img10.360buyimg.com/n7/jfs/t1/23916/19/17446/93070/62bea3c2E5fc4b764/338ef3ddfdd94c2a.jpg');
INSERT INTO `goods`
VALUES (209, '爱相随二手手机专营店',
        '拍拍 苹果se2 Apple\niphone\nse 2 游戏性能 二手苹果手机 黑色 128G【品牌效率100%电池】 95成新 苹果se2 Apple iphone se 2 游戏性能 二手苹果手机 黑色 128G【品牌效率100%电池】 95成新',
        'ContentMap1549.00', '3条评价', 'https://item.jd.com/10055903143488.html',
        'https://img13.360buyimg.com/n7/jfs/t1/132734/39/33804/99029/6397005eE5d4bc5b6/07740c5dd23c066a.jpg');
INSERT INTO `goods`
VALUES (210, '獭酷数码买手店',
        'Apple全新\niPhone\n13 pro max全网通5G美版 正品 蓝色13 256 GB Apple全新 iPhone13 pro max全网通5G美版 正品 蓝色13 256 GB',
        'ContentMap5876.00', '3条评价', 'https://item.jd.com/10056290852815.html',
        'https://img10.360buyimg.com/n7/jfs/t1/201990/34/25451/55555/62ceba4aE95275176/aefead255c344ad8.jpg');
INSERT INTO `goods`
VALUES (211, '拍拍严选官方旗舰店',
        '拍拍 Apple\niPhone\nXS Max 苹果xsmax手机 二手手机 备用机学生机 优品 95新 深空灰 256G Apple iPhone XS Max 苹果xsmax手机 二手手机 备用机学生机 优品 95新 深空灰 256G',
        'ContentMap2999.00', '3条评价', 'https://item.jd.com/10057718272603.html',
        'https://img13.360buyimg.com/n7/jfs/t1/41299/8/17960/264189/62f0cfcdEd07a9e68/01b3ad76121d5864.png');
INSERT INTO `goods`
VALUES (212, '亿品汇旗舰店',
        'Apple 苹果\niPhone\nSE(A2298) 手机 全网通4G 全新原封未激活 白色 全网通 256GB 64G老包装带充电器耳机。256G为新版简配包装，没有充电器耳机',
        'ContentMap3329.00', '3条评价', 'https://item.jd.com/10058809539980.html',
        'https://img10.360buyimg.com/n7/jfs/t1/37514/9/18385/49276/6300de22E74446451/3df6334708d12670.png');
INSERT INTO `goods`
VALUES (213, '柑恒通讯香港手机买手店',
        '苹果（Apple）\niPhone\n12 苹果12 pro 12PM 手机 12mini 有锁海外版全新\niPhone\n12 mini 蓝色 64GB 有锁单机支持卡贴移动联通 欧/美/日版 苹果（Apple）iPhone 12 苹果12 pro 12PM 手机 12mini 有锁海外版全新 iPhone 12 mini 蓝色 64GB 有锁单机支持卡贴移动联通 欧/美/日版',
        'ContentMap2499.00', '2条评价', 'https://item.jd.com/10059386894508.html',
        'https://img13.360buyimg.com/n7/jfs/t1/203255/27/30218/24671/638de39aEf15a2230/7546c318ebf21631.jpg');
INSERT INTO `goods`
VALUES (214, '宇能兴手机专营店',
        'Apple\niPhone\nSE(3代)128G 星光色 支持移动联通电信5G手机 星光色 64G(原装20w充电器套装) Apple iPhone SE(3代)128G 星光色 支持移动联通电信5G手机 星光色 64G(原装20w充电器套装)',
        'ContentMap3509.00', '2条评价', 'https://item.jd.com/10059830225640.html',
        'https://img10.360buyimg.com/n7/jfs/t1/47393/32/21413/44931/63145701E91a31db5/961df6785687b4f1.png');
INSERT INTO `goods`
VALUES (215, '海汇通数码买手店',
        'Apple 苹果14 Pro系列\niPhone\n14 Pro Max移动联通电信 双卡双待手机\niPhone\n14 Pro 金色 128GB Apple 苹果14 Pro系列 iPhone 14 Pro Max移动联通电信 双卡双待手机 iPhone 14 Pro 金色 128GB',
        'ContentMap8899.00', '2条评价', 'https://item.jd.com/10060294936795.html',
        'https://img10.360buyimg.com/n7/jfs/t1/52107/19/22015/38617/638de8d0E4b6e9cd6/f74ef5077397edde.jpg');
INSERT INTO `goods`
VALUES (216, '三火全球买手店',
        'Apple\niPhone\n14 Pro Max水滴屏双卡双待 A16仿生芯片 全国联保 14 Pro 【黑色】 128GB 【联保一年 】 【大陆版现货当天发，全国联保】【港版预售，发货时多退少补，港版官网发售后同步发货】',
        'ContentMap9880.00', '2条评价', 'https://item.jd.com/10060753500224.html',
        'https://img14.360buyimg.com/n7/jfs/t1/185149/17/28703/18932/631c97a3E5e4cc0ad/b0a63da028ed6179.jpg');
INSERT INTO `goods`
VALUES (217, '漫博游旗舰店',
        'Apple 苹果\niPhone\n14 Pro（A2892）苹果14pro 5G新品手机 暗紫色 128GB【官方标配】 Apple 苹果 iPhone 14 Pro（A2892）苹果14pro 5G新品手机 暗紫色 128GB【官方标配】',
        'ContentMap8899.00', '2条评价', 'https://item.jd.com/10060866997108.html',
        'https://img13.360buyimg.com/n7/jfs/t1/164034/38/30003/20815/6326b937Ee2dae321/7587542256a93a15.jpg');
INSERT INTO `goods`
VALUES (218, '新扬二手手机专营店',
        '拍拍 Apple\niPhone\nXs max X 苹果xsmax 二手手机 苹果手机\niphone\n全网通 金色 256G 全网通 99成新 Apple iPhone Xs max X 苹果xsmax 二手手机 苹果手机 iphone全网通 金色 256G 全网通 99成新',
        'ContentMap2699.00', '2条评价', 'https://item.jd.com/10060990887732.html',
        'https://img12.360buyimg.com/n7/jfs/t1/157928/35/30922/116403/63288c4bE67230aff/9e2972de63451b8a.jpg');
INSERT INTO `goods`
VALUES (219, '三火全球买手店',
        '苹果Apple\niPhone\nSE (第二代) SE2全网通4G手机A13芯片 黑色 日版 64G 日版 所有版本均为拆封原装过保裸机单机头，由本店后配非原装手机盒数据线，并提供一年质保服务，具体版本情况请购买前咨询客服！',
        'ContentMap1988.00', '1条评价', 'https://item.jd.com/10057215941325.html',
        'https://img10.360buyimg.com/n7/jfs/t1/198595/31/28996/45188/6381c270Ec1552a75/19de2dd2ede4b315.png');
INSERT INTO `goods`
VALUES (220, '拍拍严选尖货旗舰店',
        '拍拍 Apple 苹果8\niPhone\n8 4G全网通 4.7英寸 二手苹果手机 手机 深空灰 128G 9成新 热8购物季！苹果13Pro2下单赠手机壳+钢化膜！数量有限！现货速发~',
        'ContentMap1469.00', '1条评价', 'https://item.jd.com/10057622242261.html',
        'https://img11.360buyimg.com/n7/jfs/t1/54068/40/20783/50096/635b3a34E83505936/3389db475411d5f3.jpg');
INSERT INTO `goods`
VALUES (221, '中国移动手机官方旗舰店',
        'Apple\niPhone\n14 (A2884) 128GB红色 支持移动联通电信5G 双卡双待手机 蓝色128G 官方标配 Apple iPhone 14 (A2884) 128GB红色 支持移动联通电信5G 双卡双待手机 蓝色128G 官方标配',
        'ContentMap5999.00', '1条评价', 'https://item.jd.com/10059500355801.html',
        'https://img11.360buyimg.com/n7/jfs/t1/201484/21/26899/29037/6319634eEa205df83/a507a3234e5f6cb7.jpg');
INSERT INTO `goods`
VALUES (222, '柒静绗数码买手店',
        'Apple 苹果手机\niPhone\n13 Pro Max 智能手机 全新机 双卡双待 13 黑色 6.1英寸 256GB 店保一年 所有版本均为拆封原装过保裸机单机头，由本店后配非原装手机盒数据线，并提供一年质保服务，具体版本情况请购买前咨询客服！',
        'ContentMap5699.00', '1条评价', 'https://item.jd.com/10059881469064.html',
        'https://img14.360buyimg.com/n7/jfs/t1/32433/2/18847/14741/639015bbE244a4167/12729ed5cafd3230.jpg');
INSERT INTO `goods`
VALUES (223, '柒静绗数码买手店',
        'Apple\niPhone\n14 Plus联保一年版 苹果14 /Plus双卡双待 【黑色】联保一年现货\niphone\n14【128G】 Apple iPhone14 Plus联保一年版 苹果14 /Plus双卡双待 【黑色】联保一年现货 iphone14【128G】',
        'ContentMap5999.00', '1条评价', 'https://item.jd.com/10060279700096.html',
        'https://img11.360buyimg.com/n7/jfs/t1/98697/30/29957/17215/631c1278E960e89db/49014828ae1a24c3.jpg');
INSERT INTO `goods`
VALUES (224, '柑恒通讯香港手机买手店',
        'Apple\niPhone\n14 Pro 支持移动联通电信5G 双卡双待手机 深空黑色 128GB 官方标配 新品上市，溢价高，价格浮动大，不保价，不保价，不保价，不保价',
        'ContentMap8799.00', '1条评价', 'https://item.jd.com/10060294861258.html',
        'https://img13.360buyimg.com/n7/jfs/t1/212451/17/23047/27893/63662c9dEd16fe338/6112b1c718fd5650.png');
INSERT INTO `goods`
VALUES (225, '中国电信自营旗舰店',
        'Apple *\niPhone\n14 支持移动联通电信 双卡双待全网通5G手机 256GB 星光色 电信用户专享优惠 Apple * iPhone 14 支持移动联通电信 双卡双待全网通5G手机 256GB 星光色 电信用户专享优惠',
        'ContentMap6899.00', '0条评价', 'https://item.jd.com/100045124315.html',
        'https://img10.360buyimg.com/n7/jfs/t1/146886/31/32856/16889/6390420bE071b3034/437b522058dea181.jpg');
INSERT INTO `goods`
VALUES (226, '中国电信自营旗舰店',
        'Apple *\niPhone\n14 支持移动联通电信 双卡双待全网通5G手机 256GB 午夜色 电信用户专享优惠 Apple * iPhone 14 支持移动联通电信 双卡双待全网通5G手机 256GB 午夜色 电信用户专享优惠',
        'ContentMap6899.00', '0条评价', 'https://item.jd.com/100045124331.html',
        'https://img11.360buyimg.com/n7/jfs/t1/108546/21/21719/14897/63904196E79c5efa5/a52ca5e8e50b982c.jpg');
INSERT INTO `goods`
VALUES (227, '中国电信自营旗舰店',
        'Apple *\niPhone\n14 支持移动联通电信 双卡双待全网通5G手机 128GB 星光色 电信用户专享优惠 Apple * iPhone 14 支持移动联通电信 双卡双待全网通5G手机 128GB 星光色 电信用户专享优惠',
        'ContentMap5999.00', '0条评价', 'https://item.jd.com/100045124375.html',
        'https://img10.360buyimg.com/n7/jfs/t1/35475/31/18589/16889/639040aeE05492f25/1d097840938375c8.jpg');
INSERT INTO `goods`
VALUES (228, '中国电信自营旗舰店',
        'Apple *\niPhone\n14 支持移动联通电信 双卡双待全网通5G手机 128GB 蓝色 电信用户专享优惠 Apple * iPhone 14 支持移动联通电信 双卡双待全网通5G手机 128GB 蓝色 电信用户专享优惠',
        'ContentMap5999.00', '0条评价', 'https://item.jd.com/100045124389.html',
        'https://img14.360buyimg.com/n7/jfs/t1/177159/34/31461/8480/63903fdaE2806c0ee/a650152d29425d92.jpg');
INSERT INTO `goods`
VALUES (229, '中国电信自营旗舰店',
        'Apple\niPhone\n13 (A2634) 128GB 粉色 支持移动联通电信5G 双卡双待手机 Apple iPhone 13 (A2634) 128GB 粉色 支持移动联通电信5G 双卡双待手机',
        'ContentMap5279.00', '0条评价', 'https://item.jd.com/100045176351.html',
        'https://img11.360buyimg.com/n7/jfs/t1/43419/19/20974/25354/635757f3E64ac9e01/8fc774a40e65ee0d.jpg');
INSERT INTO `goods`
VALUES (230, '四川电信京东自营旗舰店',
        'Apple\niPhone\n14 Pro Max (A2896) 1TB 银色 支持移动联通电信5G 双卡双待手机【快充套装】 Apple iPhone 14 Pro Max (A2896) 1TB 银色 支持移动联通电信5G 双卡双待手机【快充套装】',
        'ContentMap14699.00', '0条评价', 'https://item.jd.com/100045775675.html',
        'https://img10.360buyimg.com/n7/jfs/t1/107488/15/26657/31570/634e197cEa44731bb/cdc55aaf01388b42.jpg');
INSERT INTO `goods`
VALUES (231, '浩跃优品二手手机专营店',
        '拍拍 Apple\niPhone\n13 苹果13 mini 5G 二手苹果手机 95新 国行全网通 午夜色 256GB 95新 【新店开业！】享20元晒单红包+店铺半年质保+手机壳！数量有限！送完为止！活动详情咨询客服！',
        'ContentMap4169.00', '0条评价', 'https://item.jd.com/10059858200358.html',
        'https://img13.360buyimg.com/n7/jfs/t1/179806/27/29109/73345/63454466E2748aac6/f5302ba1608e4162.jpg');
INSERT INTO `goods`
VALUES (232, '拍拍严选官方旗舰店',
        '拍拍 Apple 苹果\niPhone\n14 Plus(A2888) 二手手机以官网信息为准【预售定金膨胀】 蓝色 128G Apple 苹果 iPhone 14 Plus(A2888) 二手手机以官网信息为准【预售定金膨胀】 蓝色 128G',
        'ContentMap6999.00', '0条评价', 'https://item.jd.com/10060124139887.html',
        'https://img12.360buyimg.com/n7/jfs/t1/96032/16/33282/38666/635f4052Ed6a3ec85/f5bd35fffe70a42b.jpg');
INSERT INTO `goods`
VALUES (233, '锋锋通讯香港手机买手店',
        '苹果（Apple）\niPhone\n14 Pro Max (A2896) 支持联通移动电信 5G 海外版 暗紫色 128GB 苹果（Apple）iPhone 14 Pro Max (A2896) 支持联通移动电信 5G 海外版 暗紫色 128GB',
        'ContentMap10399.00', '0条评价', 'https://item.jd.com/10060164743007.html',
        'https://img12.360buyimg.com/n7/jfs/t1/158177/39/30766/27066/632956e0Ee914d778/33ec332a164a2a40.jpg');
INSERT INTO `goods`
VALUES (234, '旷视界手机通讯买手店',
        'Apple\niPhone\n14 Pro (A2892) 灵动岛 支持移动联通电信5G 双卡 港版\niPhone\n14 Pro 深紫色 港版128G 全新港版正品，价格浮动大，不进行价保！',
        'ContentMap9259.00', '0条评价', 'https://item.jd.com/10060214582804.html',
        'https://img14.360buyimg.com/n7/jfs/t1/161710/35/30258/20815/631ab6d3E77c3ba14/06d7ef41827f1101.jpg');
INSERT INTO `goods`
VALUES (235, '旷视界手机通讯买手店',
        'Apple\niPhone\n14 Pro Max (A2896) 支持移动联通电信5G 港版\niPhone\n14 Pro Max 暗紫色 港版1T 赠苹果充电头，全新正品未激活，支持检测，假一赔十',
        'ContentMap25332.00', '0条评价', 'https://item.jd.com/10060217272445.html',
        'https://img10.360buyimg.com/n7/jfs/t1/120636/14/29682/20815/631ac5c9E166b7968/6d8ddc87c0757fc6.jpg');
INSERT INTO `goods`
VALUES (236, '柑恒通讯香港手机买手店',
        'Apple 苹果\niPhone\n14 Plus手机 5G通 14 Pro Max 双卡双待港行\niPhone\n14 Plus 紫色 512GB 港行 新品上市，溢价高，价格浮动大，不保价，不保价，不保价，不保价',
        'ContentMap10799.00', '0条评价', 'https://item.jd.com/10060295684270.html',
        'https://img10.360buyimg.com/n7/jfs/t1/119035/30/28334/19202/631c73a6E56d9e5d6/68408f3ccca08ef7.jpg');
INSERT INTO `goods`
VALUES (237, '旷视界手机通讯买手店',
        'Apple苹果\niPhone\n13 /13mini 新品双卡双待全面屏手机 港版官方标配512G\niPhone\n13mini 黑色 港版512G Apple苹果 iPhone 13 /13mini 新品双卡双待全面屏手机 港版官方标配512G iPhone 13mini 黑色 港版512G',
        'ContentMap6549.00', '0条评价', 'https://item.jd.com/10067050994037.html',
        'https://img12.360buyimg.com/n7/jfs/t1/174893/24/31970/77489/63a43defEde32e3b6/dba3a7a38e472b98.jpg');
INSERT INTO `goods`
VALUES (238, '正合数码海外专营店',
        'Apple\niPhone\n11 pro Max 全新美版苹果11手机通 苹果11Pro手机 苹果 11 pro max 6.5寸金色 64GB海外版全新库存机 海外版全新库存机解释：全新未使用，仅拆封过保的单机头，是各大海外供应商们存放在仓库的库存样机机器，成色全新，全原装。',
        'ContentMap4499.00', '0条评价', 'https://item.jd.com/10067051456179.html',
        'https://img14.360buyimg.com/n7/jfs/t1/203272/10/29654/69653/6392f45aEacf9f2da/bdf1b6e494a8e075.png');
INSERT INTO `goods`
VALUES (239, '森博威数码海外专营店',
        'Apple 苹果\niPhone\nSE2 4.7英寸通4G 全新海外版 无锁 SE2 黑色 64GB 海外版全新库存机 Apple 苹果 iPhone SE2 4.7英寸通4G 全新海外版 无锁 SE2 黑色 64GB 海外版全新库存机',
        'ContentMap1899.00', '0条评价', 'https://item.jd.com/10067077013086.html',
        'https://img11.360buyimg.com/n7/jfs/t1/149511/9/32495/38507/6393f333E8e620e51/333ceee5caa831da.png');
INSERT INTO `goods`
VALUES (240, '森博威数码海外专营店',
        'Apple 苹果\niPhone\nSE3 4.7英寸通4G 全新海外版 无锁 SE3 黑色 128GB 海外版全新库存机 Apple 苹果 iPhone SE3 4.7英寸通4G 全新海外版 无锁 SE3 黑色 128GB 海外版全新库存机',
        'ContentMap3139.00', '0条评价', 'https://item.jd.com/10067077024130.html',
        'https://img10.360buyimg.com/n7/jfs/t1/75633/20/22802/16024/6393f328E2c39d680/b08c6ec782e10a5f.jpg');
INSERT INTO `goods`
VALUES (241, '森博威数码海外专营店',
        'Apple\niPhone\n11 pro Max 全新美版苹果11手机通 苹果11Pro手机 苹果 11 pro max 6.5寸白色 256GB海外版全新库存机 海外版全新库存机解释：全新未使用，仅拆封过保的单机头，是各大海外供应商们存放在仓库的库存样机机器，成色全新，全原装。',
        'ContentMap4899.00', '0条评价', 'https://item.jd.com/10067077033927.html',
        'https://img12.360buyimg.com/n7/jfs/t1/94085/10/33607/74009/6393f32cE26d82c4f/dcf89e7ecca6895d.png');
INSERT INTO `goods`
VALUES (242, '三火全球买手店',
        'Apple 苹果\niPhone\nSE2 / SE3 4.7英寸通4G 美版智能手机 SE3 黑色 64GB 单机（移动联通）美版有锁带卡贴 Apple 苹果 iPhone SE2 / SE3 4.7英寸通4G 美版智能手机 SE3 黑色 64GB 单机（移动联通）美版有锁带卡贴',
        'ContentMap2199.00', '0条评价', 'https://item.jd.com/10067154626008.html',
        'https://img13.360buyimg.com/n7/jfs/t1/7188/2/20363/20962/6396bcb2E0c70b3a9/58244c6c110648c0.png');
INSERT INTO `goods`
VALUES (243, '华为京东自营官方旗舰店',
        '华为\n智选 Hi nova 9z 5G全网通\n手机\n6.67英寸120Hz原彩屏 6400万像素超清摄影 66W快充8GB+256GB幻境森林 【华为智选Hinova9z】6.67英寸120Hz原彩屏,6400万像素超清摄影,66W快充;华为智选手机热销爆款，限量抢购，猛戳》》》',
        'ContentMap1599.00', '50万+条评价', 'https://item.jd.com/100022080099.html',
        'https://img14.360buyimg.com/n7/jfs/t1/48938/13/20381/47345/63497660Eecb7d2d4/e9fcbfe4ad37bf03.jpg');
INSERT INTO `goods`
VALUES (244, '华为京东自营官方旗舰店',
        '华为\nHUAWEI nova 8 Pro 麒麟985 5G SoC芯片Vlog视频双镜头 8GB+128GB 8号色全网通5G\n华为手机\n（无充版） 【华为nova8pro】麒麟985,5G,SoC芯片,Vlog双镜头,120Hz环幕屏,速来抢购;华为手机热销爆款，限量抢购，猛戳》》》',
        'ContentMap3799.00', '50万+条评价', 'https://item.jd.com/100020882310.html',
        'https://img10.360buyimg.com/n7/jfs/t1/163284/6/19601/425570/607d30ddEf7818805/61ed5b8b67e388d8.jpg');
INSERT INTO `goods`
VALUES (245, '华为京东自营官方旗舰店',
        '华为\n智选 Hi nova 10 Pro 5G全网通 前置6000万追焦双摄 内置100W\n华为\n超级快充 8+128GB 普罗旺斯\n手机\nhinova 华为智选 Hi nova 10 Pro 5G全网通 前置6000万追焦双摄 内置100W华为超级快充 8+128GB 普罗旺斯手机hinova',
        'ContentMap3619.00', '20万+条评价', 'https://item.jd.com/100043729907.html',
        'https://img12.360buyimg.com/n7/jfs/t1/74078/18/21108/63214/635c81a3E0ee00100/668234b791b27a2b.jpg');
INSERT INTO `goods`
VALUES (246, '华为京东自营官方旗舰店',
        'HUAWEI P50 Pro 原色双影像单元 万象双环设计 搭载HarmonyOS 2 支持66W快充 8GB+256GB可可茶金\n华为手机\n【购机补贴版】 【购机流程】1、“选择合约机”领补贴。2、选择套餐，查看直降到手价。3、填写个人信息。4、下单购买。【享购机补贴、更多流量和通话分钟，部分城市赠送宽带】更多查看',
        'ContentMap5988.00', '1万+条评价', 'https://item.jd.com/100038086906.html',
        'https://img11.360buyimg.com/n7/jfs/t1/148031/7/27024/173871/625e87d8E7130e3f2/24c8e167ca166dfb.jpg');
INSERT INTO `goods`
VALUES (247, '京联通达旗舰店',
        '爱心东东\n华为\n智选 Hi nova9 新品\n手机\n梦幻罗兰 5G\n手机\n全网通8+128GB（品牌66W充电套装+碎屏险） 【放心购买】厂家直供，新品上市，下单赠品牌蓝牙耳机+品牌66W充电器+碎屏险季卡+晒单30红包+保修两年+退货无忧运费险',
        'ContentMap1699.00', '1万+条评价', 'https://item.jd.com/10062955239537.html',
        'https://img12.360buyimg.com/n7/jfs/t1/121508/21/28432/110347/637f1196Ea2f637e3/34688045c191623d.jpg');
INSERT INTO `goods`
VALUES (248, '炜东电商旗舰店',
        '爱心东东\n华为\nnova8 pro 5G\n手机\n8号色 8+128G全网通 【现货当天发，京东好店放心购】【8+128G到手价3049元！】华为官方直供，全国联保；麒麟985,5G,SoC芯片,Vlog双镜头,120Hz环幕屏',
        'ContentMap3049.00', '1万+条评价', 'https://item.jd.com/10025616677261.html',
        'https://img11.360buyimg.com/n7/jfs/t1/211205/35/27728/80347/63747b9dE14209d5d/1a8db5e95d81d251.jpg');
INSERT INTO `goods`
VALUES (249, '华为京东自营官方旗舰店',
        'HUAWEI/\n华为\nP50E 5000万超感光原色影像 支持66W快充 8GB+256GB曜金黑\n华为手机\n合约机 购机补贴版 【购机流程】1、“选择合约机”领补贴。2、选择套餐，查看直降到手价。3、填写个人信息。4、下单购买。【享购机补贴、更多流量和通话分钟，部分城市赠送宽带】更多查看',
        'ContentMap4488.00', '5000+条评价', 'https://item.jd.com/100021971249.html',
        'https://img14.360buyimg.com/n7/jfs/t1/106355/24/20333/178232/625eaa13Eba7b8cc1/927e69acbbbd142c.jpg');
INSERT INTO `goods`
VALUES (250, '久汇通手机旗舰店',
        '华为\n畅享20 5G\n手机\n【畅玩30Plus 可选】 全网通（白条12期分期 可选） 钛空银 8+128GB【畅玩30 Plus】 官方标配 华为原装正品，全国联保戳我抢华为智选优畅享50plus5g手机',
        'ContentMap5999.00', '5000+条评价', 'https://item.jd.com/10041725068948.html',
        'https://img13.360buyimg.com/n7/jfs/t1/17871/32/20309/89333/6390488bEd3a88ad2/ebd83a0cfa8d7d4e.jpg');
INSERT INTO `goods`
VALUES (251, '鹏瑶旗舰店',
        '华为\n智选 优 畅享20 Plus\\/畅享50Plus 5G\n手机\n畅享50plus 珠贝白 8G+128G无充版 全网通5G (8GB+128GB)碎屏险套餐 【热销推荐】支持66W超级快充，120Hz高刷大屏，4300mAh大电池长续航，6400万AI影像，大音量大字体！',
        'ContentMap1149.00', '5000+条评价', 'https://item.jd.com/10065813532372.html',
        'https://img12.360buyimg.com/n7/jfs/t1/215418/36/23279/111784/6374a2a8E243926e9/de7d79d677326351.jpg');
INSERT INTO `goods`
VALUES (252, '疆界互联旗舰店',
        '爱心东东\n华为\nnova9pro 全网通HarmonyOS2新品上市\n手机\n9号色 8G+128G官方标配【含100W\n华为\n充电套装】 京东物流发货快至当日达，咨询客服更优惠，19点前订单99%发，赠碎屏险季卡+壳膜出厂自带等好礼华为nova10pro新品上市',
        'ContentMap2399.00', '5000+条评价', 'https://item.jd.com/10036137762588.html',
        'https://img13.360buyimg.com/n7/jfs/t1/109482/18/33608/115413/63a184d1E2ef1fd62/687e7d34d612b049.jpg');
INSERT INTO `goods`
VALUES (253, '华为京东自营官方旗舰店',
        'HUAWEI nova 10 SE 一亿像素质感人像 4500mAh长续航 轻薄机身128GB 10号色\n华为手机\n【华为nova10se新品上市】一亿像素质感人像,4500mAh长续航,66W疾速快充！更多手机热销爆款，限量抢购，猛戳》》》',
        'ContentMap1999.00', '5000+条评价', 'https://item.jd.com/100049628151.html',
        'https://img11.360buyimg.com/n7/jfs/t1/142640/27/31699/58845/63919badEe5ecd012/331f03fd132f40c7.jpg');
INSERT INTO `goods`
VALUES (254, '信优速二手手机专营店',
        '拍拍\n华为\nHUAWEI P30 Pro 二手\n手机\n麒麟980曲面屏10倍变焦美颜拍照游戏 亮黑色【赠送20Wpd快充】 8GB+128GB全网通4G 95新 本店注重产品质量，服务质量，购机无忧！爆款推荐：华为mate40pro，直击冰点价，点击直达！',
        'ContentMap1428.00', '5000+条评价', 'https://item.jd.com/10035346972105.html',
        'https://img10.360buyimg.com/n7/jfs/t1/160825/15/32979/98871/63719bfdE88566886/77753f2f4065c959.jpg');
INSERT INTO `goods`
VALUES (255, '秒亿二手手机专营店',
        '拍拍\n华为\nnova2S 二手\n手机\nHUAWEI 安卓 智能 全面 屏游戏 拍照 备用机 曜石黑 4GB+64GB 9成新 年末超值购，华为P20-6+64G限时购低至546！立购！！！',
        'ContentMap373.00', '2000+条评价', 'https://item.jd.com/10064023031894.html',
        'https://img14.360buyimg.com/n7/jfs/t1/197073/10/29355/77299/6364b981E7a0d7d53/3b41bd2cdeb091d6.jpg');
INSERT INTO `goods`
VALUES (256, '和合优品二手商品专营店',
        '拍拍\n华为\nHUAWEI Mate 30 4G/5G全网通二手\n手机\n麒麟990旗舰芯片徕卡影像 95新 星河银【赠3C认证快充】 8G+128GB【4G版全网通】 国行正品，品类好货，下单即送配件套装及运费险，华为Mate40Pro，5G麒麟9000|非凡影响超感纸徕卡电影影像²点击',
        'ContentMap1618.00', '2000+条评价', 'https://item.jd.com/72381061551.html',
        'https://img11.360buyimg.com/n7/jfs/t1/169254/22/33577/201249/63a1cf9eEd539a427/99ec4281c30895bf.jpg');
INSERT INTO `goods`
VALUES (257, '京铠玄手机旗舰店',
        '爱心东东\n华为\np50pro 新品上市\n手机\n曜金黑 8+256GB【原装66W充电套装】 【原装正品，全国联保】【赠】赠66w充电套装+30元晒单红包+90天碎屏宝+无线蓝牙耳机+液态硅胶壳+精美贴膜+运费险+2年保修',
        'ContentMap5458.00', '2000+条评价', 'https://item.jd.com/10034425967216.html',
        'https://img11.360buyimg.com/n7/jfs/t1/114083/6/30560/102667/634d08acEdfb3c789/8a389aa59b6a39a4.jpg');
INSERT INTO `goods`
VALUES (258, '炜东电商旗舰店',
        '爱心东东\n华为\n智选 麦芒11 5G\n手机\n6000mAh大电池长续航 幻影墨黑 8+128G 全网通 【京东好店放心购，现货速发】8+128G到手价仅1249元，8+256G到手价仅1449，6000mAh大电池，6.75英寸超大屏，赠蓝牙耳机，碎屏险',
        'ContentMap1249.00', '2000+条评价', 'https://item.jd.com/10051693450045.html',
        'https://img10.360buyimg.com/n7/jfs/t1/94226/22/32443/107498/63944b29E29813c17/579f4c9b7de16824.jpg');
INSERT INTO `goods`
VALUES (259, '京合旗舰店',
        '华为\nnova9【12期分期可选/nova9Pro店内可选】鸿蒙HarmonyOS2系统\n华为手机\n亮黑色（官方标配无充电套装） 8GB+256GB 7.77mm纤薄轻盈机身，120Hz原色环幕屏，前置3200万后置5000万影像系统，66W超级闪充4300mAh大电池。【nova9Pro热卖中】',
        'ContentMap2299.00', '2000+条评价', 'https://item.jd.com/10037671660974.html',
        'https://img14.360buyimg.com/n7/jfs/t1/82841/24/20041/96150/62cd2e1eEb424d96d/c50bc61c1237dfb4.jpg');
INSERT INTO `goods`
VALUES (260, '鹏瑶旗舰店', '爱心东东 5G\n手机\n华为\n智选 麦芒 9\n手机\n幻夜黑 （6GB+128GB） 官方标配 现货速发',
        'ContentMap949.00', '2000+条评价', 'https://item.jd.com/10044107224408.html',
        'https://img13.360buyimg.com/n7/jfs/t1/108559/11/21389/121566/6346337dEceb8b49b/aec0fec627528299.jpg');
INSERT INTO `goods`
VALUES (261, '准正二手手机专营店',
        '拍拍\n华为\nHUAWEI Mate30 Pro二手\n手机\n4G\\\\5G 安卓智能\n手机\n大陆国行 曲面\n手机\n星河银 8GB+128GB【5G版全网通】赠40瓦快充 7天无理由退货丨15天无理由包换丨180天超长质保丨联系客服送手机8件套丨全网聚优惠，选择二手机找准正优品',
        'ContentMap2368.00', '2000+条评价', 'https://item.jd.com/10025233486297.html',
        'https://img12.360buyimg.com/n7/jfs/t1/198117/36/30704/584500/63a5e639Eeb298f54/81e33f790c9e3716.png');
INSERT INTO `goods`
VALUES (262, '博恒聚优旗舰店',
        '爱心东东\n华为\n畅享50 新品\n手机\n搭载鸿蒙系统 麒麟710A芯片 冰晶蓝 6+128GB 正品保证，全国联保。6000mAh大电池、6.75英寸影音大屏【赠】碎屏险+晒单红包',
        'ContentMap1179.01', '2000+条评价', 'https://item.jd.com/10052533739462.html',
        'https://img12.360buyimg.com/n7/jfs/t1/10920/29/20329/100109/637600bbEd89f55ab/1ed94ae86369750f.jpg');
INSERT INTO `goods`
VALUES (263, '拍拍严选官方旗舰店',
        '拍拍\n华为\n（HUAWEI） P50 Pro （4G） 高通版 骁龙处理器 二手\n手机\n曜金黑 8G+256G 华为（HUAWEI） P50 Pro （4G） 高通版 骁龙处理器 二手手机 曜金黑 8G+256G',
        'ContentMap3909.00', '2000+条评价', 'https://item.jd.com/10035668441040.html',
        'https://img10.360buyimg.com/n7/jfs/t1/190440/11/30309/58147/636a2a9fE1ce8c841/096ca6c1806831cd.jpg');
INSERT INTO `goods`
VALUES (264, '炜东电商旗舰店',
        '爱心东东\n华为\n智选 Hi nova9se 新品5G\n手机\n梦幻冰蓝 8+128G 全网通 【现货当天发货，京东好店放心购】8+128G到手价1559元，8+256G到手价1939元！一亿像素',
        'ContentMap1469.00', '1000+条评价', 'https://item.jd.com/10047688259754.html',
        'https://img14.360buyimg.com/n7/jfs/t1/100850/17/22028/94088/6392cfdcE5b6c6d06/2edce8fd490bb30d.jpg');
INSERT INTO `goods`
VALUES (265, '优爱特手机专营店',
        '华为\n畅享50\n华为\n麒麟处理器 鸿蒙安全操作系统 智能老人老年大屏大电池超长待机\n手机\n双卡双待 冰晶蓝 (6GB+128GB) 【送钢化膜】【华为6000毫安大电池新品手机】6.75英寸影音大屏,6000mAh大电池,22.5W超能续航',
        'ContentMap1189.00', '1000+条评价', 'https://item.jd.com/10054050965221.html',
        'https://img11.360buyimg.com/n7/jfs/t1/11638/35/19746/56562/63326206E969846b7/97391a1a4b65801a.jpg');
INSERT INTO `goods`
VALUES (266, '果美严选二手手机专营店',
        '拍拍 HUAWEI\n华为\nP20\\/p20 Pro 二手\n手机\n安卓\n手机\n4G全网通双卡双待\n华为\nP20 极光色 6G+64G+【充电器套装】 95成新 品质如一，服务至上，本店注重产品质量，服务质量，购机无忧！爆款苹果7P黑色128G仅售788，点击直达！',
        'ContentMap579.00', '1000+条评价', 'https://item.jd.com/10048437674717.html',
        'https://img12.360buyimg.com/n7/jfs/t1/105400/9/35637/96570/638c2bf3E17b78e81/1de66a44ab080a0a.jpg');
INSERT INTO `goods`
VALUES (267, '诚峻二手手机专营店',
        '拍拍 现货速发【二手9成新】\n华为\n（HUAWEI）荣耀9青春版 安卓\n手机\n蓝色 全网通 3G+32G 现货速发【二手9成新】华为（HUAWEI）荣耀9青春版 安卓手机 蓝色 全网通 3G+32G',
        'ContentMap255.00', '1000+条评价', 'https://item.jd.com/70022207219.html',
        'https://img14.360buyimg.com/n7/jfs/t1/129687/4/961/307305/5ed42d93Ed05e6568/de7250d6031ec069.jpg');
INSERT INTO `goods`
VALUES (268, '优锋派二手商品专营店',
        '拍拍\n华为\nHUAWEI 畅享10e 二手\n手机\n华为手机\n二手\n华为手机\n手机华为\n二手\n华为\n全面屏\n手机\n翡冷翠 4G+128G 99成新 华为 HUAWEI 畅享10e 二手手机 华为手机 二手华为手机 手机华为 二手华为 全面屏手机 翡冷翠 4G+128G 99成新',
        'ContentMap475.00', '1000+条评价', 'https://item.jd.com/10059973366888.html',
        'https://img13.360buyimg.com/n7/jfs/t1/53268/16/17081/600904/63a5e80aEb220de60/da91ad42cea40b09.png');
INSERT INTO `goods`
VALUES (269, '准正二手手机专营店',
        '拍拍\n华为\nnova3i 二手\n手机\n全面刘海屏 高清四摄游戏\n手机\n4G全网通 双卡双待 二手9新 相思红 6G+64G【全网通】 华为 nova3i 二手手机 全面刘海屏 高清四摄游戏手机 4G全网通 双卡双待 二手9新 相思红 6G+64G【全网通】',
        'ContentMap438.00', '1000+条评价', 'https://item.jd.com/10032981758323.html',
        'https://img13.360buyimg.com/n7/jfs/t1/193599/34/31870/72427/63a5e624E4f2820e2/e8821586beaf3c09.png');
INSERT INTO `goods`
VALUES (270, '火山科技二手手机专营店',
        '拍拍 【现货95新】\n华为\n畅享9plus 6.5英寸大屏 全面屏拍摄 4G全网通 二手\n华为手机\n幻夜黑 4GB+128GB 【现货95新】 华为 畅享9plus 6.5英寸大屏 全面屏拍摄 4G全网通 二手华为手机 幻夜黑 4GB+128GB',
        'ContentMap498.00', '1000+条评价', 'https://item.jd.com/10033694265888.html',
        'https://img13.360buyimg.com/n7/jfs/t1/23133/15/19930/63472/637edd1bEeb3b8365/466d0c62bc6191d3.png');
INSERT INTO `goods`
VALUES (271, '准正二手手机专营店',
        '拍拍\n华为\n（HUAWEI）\n华为\nP9 二手\n手机\n全网通4G 5.2寸屏幕安卓\n手机\n全网通 双卡双待 二手9新 流光金 4G+64G 华为（HUAWEI）华为P9 二手手机 全网通4G 5.2寸屏幕安卓手机 全网通 双卡双待 二手9新 流光金 4G+64G',
        'ContentMap368.00', '1000+条评价', 'https://item.jd.com/10032792219302.html',
        'https://img12.360buyimg.com/n7/jfs/t1/117974/14/31272/67860/63a5e62dEfb0cff8f/148b2d504ac988da.png');
INSERT INTO `goods`
VALUES (272, '腾龙二手商品专营店',
        '拍拍\n华为\nHUAWEI P20 全网通4G AI智慧徕卡双摄全面屏 安卓智能\n华为\n二手\n手机\n95成新 黑色 6+64G 全网通 国行，经过官方指定质检，支持7天无理由退货，15天换货，店铺保修180天，包邮+赠运费险+充电器+钢化膜点击查看可以进店挑选多款手机哦',
        'ContentMap549.00', '1000+条评价', 'https://item.jd.com/29197602043.html',
        'https://img13.360buyimg.com/n7/jfs/t1/132068/16/30621/98631/6335307fE4ddc7841/6373272a2859148b.jpg');
INSERT INTO `goods`
VALUES (273, '传奇二手商品专营店',
        '拍拍\n华为\nHUAWEI P40 Pro 5G 二手\n手机\n二手\n华为手机\n麒麟990 支持鸿蒙 安卓智能\n手机\n亮黑色 8GB+128GB 全网通 99成新 手机界天花板，大家都说好iPhone13ProMax，戳',
        'ContentMap2499.00', '1000+条评价', 'https://item.jd.com/10048553557143.html',
        'https://img13.360buyimg.com/n7/jfs/t1/111783/11/31194/76882/639805e9Ed3fc69ad/a479df3ab8f868c3.jpg');
INSERT INTO `goods`
VALUES (274, '众盛手机专营店',
        '华为\n（HUAWEI） 畅享8 Plus 全网通版移动联通电信4G 智能\n手机\n双卡双待 黑色 (4GB+128GB) 【七仓直发·货票同行】华为新品劲爆价',
        'ContentMap2000.00', '1000+条评价', 'https://item.jd.com/34376677895.html',
        'https://img10.360buyimg.com/n7/jfs/t26836/282/2182022903/369221/f6505fbf/5bfa4ba0N82a25c50.jpg');
INSERT INTO `goods`
VALUES (275, '鹏瑶旗舰店',
        '爱心东东\n华为\nmate40epro 5G\n手机\n支持HarmonyOS 亮黑色 8GB+256GB 【mate40epro下单即送,蓝牙耳机+季度碎屏险+三合一数据线+手机支架！】麒麟9000L芯片,超感知徕卡电影影像',
        'ContentMap5598.00', '1000+条评价', 'https://item.jd.com/59947899546.html',
        'https://img11.360buyimg.com/n7/jfs/t1/26953/11/19769/109377/638812d5E44fe0c6e/807e8d4ce43d1f61.jpg');
INSERT INTO `goods`
VALUES (276, '响当当二手手机专营店',
        '拍拍\n华为\nnova7se 5G 二手\n手机\nHUAWEI 安卓智能全面屏游戏/ 绮境森林 8GB+128GB 9成新 【优惠品质二手机，手慢无】OPPOA5火爆抢购中，4GB+64GB只要339元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap939.00', '1000+条评价', 'https://item.jd.com/10065870153839.html',
        'https://img14.360buyimg.com/n7/jfs/t1/212500/26/24747/87080/63a27e00Eadb87f16/bd73a7adfb1ffb4a.jpg');
INSERT INTO `goods`
VALUES (277, '响当当二手手机专营店',
        '拍拍\n华为\n畅享10s 二手\n手机\nHUAWEI 安卓智能全面屏游戏拍照/ 天空之境 8GB+128GB 9成新 【优惠品质二手机，手慢无】OPPOA5火爆抢购中，4GB+64GB只要339元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap719.00', '1000+条评价', 'https://item.jd.com/10065867758356.html',
        'https://img11.360buyimg.com/n7/jfs/t1/138008/30/32792/83904/63a27e02Ef6fd37b3/9360508749126c2c.jpg');
INSERT INTO `goods`
VALUES (278, '机友二手数码专营店',
        '拍拍\n华为\n畅享9Plus 二手\n手机\nHUAWEI 安卓智能游戏全面屏拍照/ 宝石蓝 6GB+128GB 95成新 【优惠品质二手机，手慢无】vivoY66火爆抢购中，低至209元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap549.00', '1000+条评价', 'https://item.jd.com/10053717970519.html',
        'https://img14.360buyimg.com/n7/jfs/t1/82392/14/18571/44973/6299d03aEe1969791/65d9a4cec82fbcc9.jpg');
INSERT INTO `goods`
VALUES (279, '三盛数码二手手机专营店',
        '拍拍 huawei\n华为\nMate20 二手\n手机\n麒麟980 翡冷翠 徕卡三摄 6G+64G翡冷翠 【9新】 黑色 6G+64G 9成新 麒麟980/徕卡三摄/6.53英寸',
        'ContentMap769.00', '500+条评价', 'https://item.jd.com/10051448483583.html',
        'https://img13.360buyimg.com/n7/jfs/t1/59261/36/20071/750428/6384a0d2E63104eb7/5c3d164504e0bcb8.png');
INSERT INTO `goods`
VALUES (280, '准正二手手机专营店',
        '拍拍\n华为\nHUAWEI P20 二手\n手机\nAI智慧徕卡双摄全面屏游戏\n手机\n全网通4G 双卡双待 二手9新 亮黑色【5.8英寸】 6G+128G 7天无理由退货丨15天无理由包换丨180天超长质保丨联系客服送手机8件套丨全网聚优惠，选择二手机找准正优品',
        'ContentMap678.00', '500+条评价', 'https://item.jd.com/59869797129.html',
        'https://img14.360buyimg.com/n7/jfs/t1/185738/39/32187/395251/63a5e622E61886594/42692622baf62f09.png');
INSERT INTO `goods`
VALUES (281, '京铠玄手机旗舰店',
        '爱心东东\n华为\n畅享50 新品上市智能\n手机\n麒麟710A芯片 鸿蒙系统 幻夜黑 6GB+128GB 全网通 90天碎屏险+晒单红包 华为官方直供,高性价比手机【赠90天碎屏宝+原装壳膜+晒单红包10元】6000mAh大电池,22.5W快充,6.75英寸大屏',
        'ContentMap1179.01', '500+条评价', 'https://item.jd.com/10059050959091.html',
        'https://img11.360buyimg.com/n7/jfs/t1/95544/16/34011/109176/6380a55dE07bf0329/84700c162082ea27.jpg');
INSERT INTO `goods`
VALUES (282, '浩瀚蜂鸟手机专营店',
        'X40 新品5G\n手机\n120Hz OLED硬核曲屏 5100mAh大电池【\n华为手机华为\n有售】 彩云追月8+256G 官方标配 X40 新品5G手机120Hz OLED硬核曲屏 5100mAh大电池【华为手机华为有售】 彩云追月8+256G 官方标配',
        'ContentMap1898.00', '500+条评价', 'https://item.jd.com/10060875243288.html',
        'https://img13.360buyimg.com/n7/jfs/t1/146570/6/31028/402104/6326cd02E4203e14b/003b619de7c3474b.png');
INSERT INTO `goods`
VALUES (283, '博恒聚优旗舰店',
        '爱心东东\n华为\nnova9\n手机\n搭载HarmonyOS鸿蒙系统 亮黑色 8+128GB\n华为\n原装66W充电套装 华为nova9壳膜套装+90天碎屏险+运费险+店铺延保华为nova9Pro新品上市，点此跳转：',
        'ContentMap2199.00', '500+条评价', 'https://item.jd.com/10049931480737.html',
        'https://img12.360buyimg.com/n7/jfs/t1/211127/28/28420/85618/63760145E7b7ebff0/6479c7e170e02eaa.jpg');
INSERT INTO `goods`
VALUES (284, '拍拍严选官方旗舰店',
        '拍拍\n华为\nHUAWEI nova 5i Pro 安卓智能\n华为\n老人机 备用机 二手\n手机\n极光色 6G+128G 华为权益机，原厂原件，全新原装电池，一年官方质保，数量有限速戳',
        'ContentMap809.00', '500+条评价', 'https://item.jd.com/69986196093.html',
        'https://img13.360buyimg.com/n7/jfs/t1/83529/20/17369/62895/635f46a2E1f8d6f55/ada488b1be7c6ef6.jpg');
INSERT INTO `goods`
VALUES (285, '京联通达旗舰店',
        '爱心东东\n华为\n智选 Hi nova9pro 5G\n手机华为\n智选 梦幻罗兰 8+128GB （内含原装100W充电套装） 【放心购买】厂家直供，新品上市，下单赠品牌蓝牙耳机+充电器+碎屏险季卡+晒单30红包+保修两年+退货无忧运费险',
        'ContentMap1969.00', '500+条评价', 'https://item.jd.com/10063753802455.html',
        'https://img10.360buyimg.com/n7/jfs/t1/136717/14/32460/113345/639af302E90b177fa/95457f9e57ebd62b.jpg');
INSERT INTO `goods`
VALUES (286, '机友二手数码专营店',
        '拍拍\n华为\nMate20 Pro 二手\n手机\nHUAWEI 面部识别屏幕指纹UD版安卓游戏智能全面屏拍照/ 极光色 6GB+128GB【3D面部】 95成新 【优惠品质二手机，手慢无】vivoY66火爆抢购中，低至209元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap1129.00', '500+条评价', 'https://item.jd.com/10053718782856.html',
        'https://img11.360buyimg.com/n7/jfs/t1/202994/35/23816/56190/6299d5f0Eb7729ed5/ff49b5a026267205.jpg');
INSERT INTO `goods`
VALUES (287, '好机汇手机专营店',
        '华为\n智选 优畅享20Plus 5G\n手机\n128G大内存 幻夜黑 8G+128G 华为智选 优畅享20Plus 5G手机 128G大内存 幻夜黑 8G+128G',
        'ContentMap1299.00', '500+条评价', 'https://item.jd.com/10067403715699.html',
        'https://img14.360buyimg.com/n7/jfs/t1/82630/26/23111/86133/63a19552E33036ea2/5e49a547c20c30a1.jpg');
INSERT INTO `goods`
VALUES (288, '京铠玄手机旗舰店',
        '华为\nMate X2折叠屏5G旗舰\n手机\n8+256GB冰晶蓝 官方标配 赠66W原装充电器【华为厂家直供，全新原封，全国联保】【华为matex2典藏版】麒麟9000旗舰芯片,第二代鹰翼折叠设计,超感知徕卡四摄,1',
        'ContentMap17499.00', '500+条评价', 'https://item.jd.com/10023971473066.html',
        'https://img11.360buyimg.com/n7/jfs/t1/168129/16/32280/63711/6389baa7E0a040f1f/3ce134dea9ba5f0f.jpg');
INSERT INTO `goods`
VALUES (289, '京东电竞手机官方旗舰店',
        '爱心东东 【京东电竞】\n华为\nmate50 新品\n手机\n曜金黑 256GB全网通 【华为Mate50系列新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！',
        'ContentMap5538.00', '500+条评价', 'https://item.jd.com/10058890979133.html',
        'https://img13.360buyimg.com/n7/jfs/t1/60117/22/22871/123555/638ed1c8E109ae8e2/48672987fecc17f5.jpg');
INSERT INTO `goods`
VALUES (290, '辉煌二手商品专营店',
        '拍拍\n华为\nHUAWEI 荣耀9X 麒麟810 升降全面屏4800万超清夜拍 二手安卓\n手机\n【二手9成新】 幻夜黑 6RAM+128GB 【现货速发】华为P20麒麟970全面屏游戏手机AI智慧徕卡双摄送礼品套装运费险！送礼品套装运费险！',
        'ContentMap688.00', '500+条评价', 'https://item.jd.com/32503326505.html',
        'https://img10.360buyimg.com/n7/jfs/t1/200183/29/18315/109289/619f4418Eea8aebbb/a8e0964aaa8a8d9b.jpg');
INSERT INTO `goods`
VALUES (291, '天翼电信京东自营旗舰店',
        '华为\nHUAWEI 畅享50 全网通4G\n手机\n6GB+128GB 幻夜黑 【高性价比千元机！】6000mAh大电池，22.5W超能续航，6.75英寸影音大屏，晒单再返15元红包，详情请咨询客服！电信用户优惠专区~',
        'ContentMap1149.00', '200+条评价', 'https://item.jd.com/100025229691.html',
        'https://img11.360buyimg.com/n7/jfs/t1/121305/4/31555/41168/634e4e9dEc248100b/91a98f8f30d24b5f.jpg');
INSERT INTO `goods`
VALUES (292, '京东电竞手机官方旗舰店',
        '爱心东东 【京东电竞】\n华为\nnova10 新品\n手机\n普罗旺斯 全网通8G+128G【含\n华为\n原装66W充电套装】 京仓速发，快至当日达，下单赠：碎屏险季卡+出厂自带壳膜+晒单红包5元+快充套装自带',
        'ContentMap2289.00', '200+条评价', 'https://item.jd.com/10054931855040.html',
        'https://img10.360buyimg.com/n7/jfs/t1/19948/20/19389/114087/638ecfc9E71113c2d/37bc72cfa12b752d.jpg');
INSERT INTO `goods`
VALUES (293, '腾龙二手商品专营店',
        '拍拍\n华为\nHUAWEI nova5i Pro 二手\n手机\n4G全网通 安卓智能\n手机\n95新 二手\n华为手机\n极光色 8+128G 全网通 国行，经过官方指定质检，支持7天无理由退货，15天换货，店铺保修180天，包邮+赠运费险+充电器+钢化膜点击查看可以进店挑选多款手机哦',
        'ContentMap728.00', '200+条评价', 'https://item.jd.com/48623800012.html',
        'https://img12.360buyimg.com/n7/jfs/t1/67355/23/18319/138810/62a06322E4e9e0fa8/015299f24003c2ad.jpg');
INSERT INTO `goods`
VALUES (294, '京铠玄手机旗舰店',
        '爱心东东\n华为\n智选麦芒11 5G\n手机华为\n智选 6000mAh大电池 幻影墨黑 8+128GB 全网通 百分之99订单当天发货，加购下单赠送品质耳机!大音量大电池大字体。',
        'ContentMap1199.00', '200+条评价', 'https://item.jd.com/10051809098088.html',
        'https://img13.360buyimg.com/n7/jfs/t1/201622/30/29709/145602/63a40994Ed85717d4/39d57460c86d9b90.jpg');
INSERT INTO `goods`
VALUES (295, '北京电信京东自营旗舰店',
        '华为\nHUAWEI nova 8 SE 4G全网通 8+128GB幻夜黑 66W超级快充 6.5英寸OLED大屏\n华为手机\n标配无充 【自营品质保障，全国联保】搭载HarmonyOS2，66W华为超级快充，6.5英寸OLED大屏',
        'ContentMap1699.00', '200+条评价', 'https://item.jd.com/100033087892.html',
        'https://img12.360buyimg.com/n7/jfs/t1/108985/9/23781/66148/62038276Ee711aa3e/700666e40b4529a3.jpg');
INSERT INTO `goods`
VALUES (296, '京联通达旗舰店',
        '华为\nmate50pro 新品上市\n手机\n矅金黑 256G全网通 【90天碎屏险+晒单红包50元】 华为直供货源现货当天发，全国联保，赠7天价格保护+90天碎屏险季卡+蓝牙耳机+蓝牙音箱+晒单红包50元',
        'ContentMap6669.01', '200+条评价', 'https://item.jd.com/10058887549151.html',
        'https://img11.360buyimg.com/n7/jfs/t1/131774/24/34139/122954/639c2c03E7b56770f/9f21b07aa2d593cc.jpg');
INSERT INTO `goods`
VALUES (297, '疆界互联旗舰店',
        '华为\n智选 优畅享50plus 5G\n手机\n雅致黑 8G+256GB 华为智选 优畅享50plus 5G手机 雅致黑 8G+256GB',
        'ContentMap1299.00', '200+条评价', 'https://item.jd.com/10046483925701.html',
        'https://img11.360buyimg.com/n7/jfs/t1/113809/8/31293/72521/639a8086E410587fb/59c71b2a8ef678f1.jpg');
INSERT INTO `goods`
VALUES (298, '松茂盛手机专营店',
        'X30 骁龙6nm疾速5G芯 66W超级快充 120Hz全视屏【\n华为手机华为\n有售】 X30 钛空银 6G+128GB X30 骁龙6nm疾速5G芯 66W超级快充 120Hz全视屏【华为手机华为有售】 X30 钛空银 6G+128GB',
        'ContentMap1399.00', '200+条评价', 'https://item.jd.com/10054843404059.html',
        'https://img14.360buyimg.com/n7/jfs/t1/199470/11/25408/142863/62b06899Ee118d5c2/9129dd87e06626a5.jpg');
INSERT INTO `goods`
VALUES (299, '龙帜优品二手手机专营店',
        '拍拍\n华为\nHUAWEI Mate10保时捷设计限量版 二手\n手机\n4G全网通双卡徕卡双摄 二手95新 黑色 6GB+256GB 原装正品华为mate10保时捷限量版麒麟970',
        'ContentMap1698.00', '200+条评价', 'https://item.jd.com/10038178617671.html',
        'https://img11.360buyimg.com/n7/jfs/t1/186849/9/20509/347244/612b2f3cE39f32f37/da5833de26294a92.jpg');
INSERT INTO `goods`
VALUES (300, '秒亿二手手机专营店',
        '拍拍 HUAWEI\n华为\nP20\\/P20 Pro 二手\n手机\n安卓\n手机\n4G全网通双卡双待\n华为\nP20 极光色 6GB+64G全网通 95成新 年末超值购，华为P20-6+64G限时购低至546！立购！！！',
        'ContentMap559.00', '200+条评价', 'https://item.jd.com/10055570721159.html',
        'https://img14.360buyimg.com/n7/jfs/t1/145051/21/31529/94989/637064f3E4ecb13d2/badb9aa74b44ccfa.jpg');
INSERT INTO `goods`
VALUES (301, '延续优品二手手机专营店',
        '拍拍 荣耀V20 麒麟980 双卡双待 游戏\n手机\n安卓\n华为\n二手\n手机\n幻夜黑 6GB+128GB 95成新 国行正品一机一检！爆款推荐：华为5G版Mate30Pro热销中，极速发货！立即抢购立即抢购',
        'ContentMap648.00', '200+条评价', 'https://item.jd.com/10057638165957.html',
        'https://img12.360buyimg.com/n7/jfs/t1/157584/17/34153/132145/63a1c213E0bb79fa0/38c2f18a3eb3713c.jpg');
INSERT INTO `goods`
VALUES (302, '小Q优品二手手机专营店',
        '拍拍\n华为\nHUAWEI畅享10e 送快充 4G全网通 6.3英寸全面屏 全网通 二手\n手机\n9成新 珍珠白（颜色随机，不接受指定） 4GB+64GB 小Q出品，怎么总是精品，7天无理由包邮还送运费险',
        'ContentMap385.00', '200+条评价', 'https://item.jd.com/10024157217286.html',
        'https://img11.360buyimg.com/n7/jfs/t1/44154/7/23121/300136/63a5d382Ef0d3b27b/27fcb6694e28b0a9.png');
INSERT INTO `goods`
VALUES (303, '浩瀚蜂鸟手机专营店',
        '24期白条70新品5G\n手机\n【\n华为手机华为\n有售】 70【流光水晶 12+256G】 官方标配版 原封正品，现货当天发！全国多仓，快次日达~！',
        'ContentMap2599.00', '200+条评价', 'https://item.jd.com/10059511637389.html',
        'https://img14.360buyimg.com/n7/jfs/t1/221357/17/18335/93819/6316b3fbE5f975750/2776ba0f1c03c9f0.jpg');
INSERT INTO `goods`
VALUES (304, '和合优品二手商品专营店',
        '拍拍 Huawei\n华为\nP30二手\n手机\n感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹 95新 天空之境 8GB+64GB 国行正品，品类好货，下单即送配件套装及运费险，华为Mate40Pro，5G麒麟9000|非凡影响超感纸徕卡电影影像²点击',
        'ContentMap928.00', '200+条评价', 'https://item.jd.com/70281291887.html',
        'https://img12.360buyimg.com/n7/jfs/t1/188461/3/28199/122187/63a1cf21Eb731b91d/b744505d34abb098.jpg');
INSERT INTO `goods`
VALUES (305, '天天数码二手手机专营店',
        '拍拍\n华为\nMate10 Pro 二手\n手机\n麒麟970 二手\n华为手机\n4G全网通 6英寸大屏美颜拍照 9成新 宝石蓝 6GB+64GB 品质服务-OPPOA55,5G全网通大电池拍照游戏手机！店长推荐',
        'ContentMap598.00', '200+条评价', 'https://item.jd.com/10021509938676.html',
        'https://img11.360buyimg.com/n7/jfs/t1/219287/1/25246/97243/63a5f223E296636b4/b336e8e2d849bb97.jpg');
INSERT INTO `goods`
VALUES (306, '江苏移动京东自营店',
        '华为\n（HUAWEI）P50 4G全网通 8GB+256GB 曜金黑\n手机\n（无充电器和数据线） 华为（HUAWEI）P50 4G全网通 8GB+256GB 曜金黑 手机（无充电器和数据线）',
        'ContentMap4388.00', '200+条评价', 'https://item.jd.com/100033505254.html',
        'https://img14.360buyimg.com/n7/jfs/t1/223358/31/10766/82457/620dfac9Eebd5152f/a75efad1266c9d40.jpg');
INSERT INTO `goods`
VALUES (307, '乐为优品二手商品专营店',
        '拍拍\n华为\n畅享8 二手\n手机\n备用机老人\n手机\n安卓4G全网通双卡双待 9成新 金色 4GB+64GB 【新年盛典】全店直降部分商品再领大额优惠券，全店产品下单赠运费险及配件套装，99新华为Mate30点击查看》',
        'ContentMap599.00', '200+条评价', 'https://item.jd.com/10027737264580.html',
        'https://img10.360buyimg.com/n7/jfs/t1/221537/24/18504/45481/63a5d6ecE72e602b4/b47b22c956e0cc19.jpg');
INSERT INTO `goods`
VALUES (308, '博恒聚优旗舰店',
        '爱心东东\n华为\n智选 优畅享20Plus 5G\n手机\n40W超级快充 90Hz高刷 幻夜黑 6GB+128GB（\n华为\n40W原装充电套装） 6.63英大屏幕,4800万像素,40W超级快充',
        'ContentMap1099.00', '200+条评价', 'https://item.jd.com/10051067271911.html',
        'https://img11.360buyimg.com/n7/jfs/t1/66878/18/22861/119687/6385aab6E62ceb64f/d8396e5e4c03734d.jpg');
INSERT INTO `goods`
VALUES (309, '顺顺智二手商品专营店',
        '拍拍\n华为手机\n畅享7S安卓智能游戏备用 二手\n手机\n9成新成色 金色 4 64G _通 国行正品，专业检测。支持7天无理由退货，长达180天保修质保。赠运费险，不满意直接退，赠：充电器-贴膜贴好-包邮',
        'ContentMap308.00', '200+条评价', 'https://item.jd.com/72162069456.html',
        'https://img11.360buyimg.com/n7/jfs/t1/54056/35/4471/93399/5d234473E0e1af487/58f0b8d2aa8506ca.jpg');
INSERT INTO `goods`
VALUES (310, '天天数码二手手机专营店',
        '拍拍\n华为\nmate30 RS 二手\n手机\n保时捷限量版\n华为\n5G\n手机\n麒麟990芯片 OLED环幕屏 玄黑 12GB+512GB-99新 品质服务-OPPOA55,5G全网通大电池拍照游戏手机！店长推荐',
        'ContentMap4798.00', '200+条评价', 'https://item.jd.com/10042913724540.html',
        'https://img10.360buyimg.com/n7/jfs/t1/101363/30/36568/293119/63a5f233Ec0c9d8a8/12219d2035356b56.png');
INSERT INTO `goods`
VALUES (311, '星河二手手机专营店',
        '拍拍\n华为\nHUAWEI Mate30RS 保时捷限量版 5G二手\n手机\n麒麟990芯片 OLED环幕曲面屏 玄黑色【送高品质皮套】 12GB+512GB 5G全网通 99成新 现在下单立即送价值188元超级快充套装，赶快来抢！！',
        'ContentMap4899.00', '200+条评价', 'https://item.jd.com/10059315039648.html',
        'https://img13.360buyimg.com/n7/jfs/t1/136229/28/29465/110924/633653c2Ec45e6ce3/c1b9c5e7b5faa9bc.jpg');
INSERT INTO `goods`
VALUES (312, 'olj欧霖爵手机旗舰店',
        '爱心东东\n华为\n畅享 50 6000mAh大电池 支持鸿蒙系统 学生 女士\n手机\n冰晶蓝 8G+128GB 现货速发，多仓快至次日达！！！ 直供货源，全国联保，正品保障！！！ 首页关注店铺享优惠价格！！！查看',
        'ContentMap1379.00', '100+条评价', 'https://item.jd.com/10054058460287.html',
        'https://img12.360buyimg.com/n7/jfs/t1/14028/22/19030/77331/6347d28bEbbe87f1a/07da6cc7f387c1b7.jpg');
INSERT INTO `goods`
VALUES (313, '创信誉二手商品专营店',
        '拍拍\n华为\n（HUAWEI）畅享9e\n手机\n6.09珍珠屏 老人学生备用 安卓二\n手机\n幻夜黑 3GB+64GB 全网通4G 9成新 原装正品,官方指定检测商质检。7天退货,15天换货,180天保修。赠:品牌充电器-保护套-钢化膜-运费险',
        'ContentMap308.00', '100+条评价', 'https://item.jd.com/10055926377924.html',
        'https://img14.360buyimg.com/n7/jfs/t1/30992/33/19815/86413/63878df6E0874f992/871929e0a9750fc0.jpg');
INSERT INTO `goods`
VALUES (314, '慧耀二手商品专营店',
        '拍拍\n华为\nHUAWEI P30 Pro 二手\n手机\n二手\n华为手机\n麒麟980曲面屏10倍变焦美颜拍照\n手机\n亮黑色 8GB+128G【4G全网通】 95成新 全店直降，下单赠好礼，超高性价比优选，7天免费免费试用，还赠运费险，店长推荐小米10低至1199，华为P40低至1879热销中',
        'ContentMap1366.00', '100+条评价', 'https://item.jd.com/10059449312615.html',
        'https://img10.360buyimg.com/n7/jfs/t1/185154/13/30066/132094/63a5e4c1E13f3ed3a/32a0be79b68cd04f.jpg');
INSERT INTO `goods`
VALUES (315, '天翼电信京东自营旗舰店',
        '华为\nHUAWEI nova 9 Pro 全网通4G\n手机\n8GB+128GB 普罗旺斯 【中国电信国企品质保障】页面价已直降，自带100W原装超级快充，晒单再返15元红包，详情请咨询客服！5G手机热卖推荐~',
        'ContentMap2299.00', '100+条评价', 'https://item.jd.com/100017630267.html',
        'https://img12.360buyimg.com/n7/jfs/t1/218975/40/22384/45194/634e0689E8f7d9c5b/47c0c5fa0fba008a.jpg');
INSERT INTO `goods`
VALUES (316, '中国电信自营旗舰店',
        '华为\n* HUAWEI nova 10 全网通4G\n手机\n8GB+128GB 绮境森林 标配66W\n华为\n超级快充 【中国电信国企品质保障】前置6000万超广角镜头，自带66W超级快充，页面价已直降，赠无线蓝牙耳机，晒单再返15元红包，详情请咨询客服！电信用户优惠专区~',
        'ContentMap2449.00', '100+条评价', 'https://item.jd.com/100028693747.html',
        'https://img12.360buyimg.com/n7/jfs/t1/130110/36/28862/64488/6371d9e6Ea1b7801a/eb958ad487389b6c.jpg');
INSERT INTO `goods`
VALUES (317, '一诺优品二手手机专营店',
        '拍拍\n华为\nHUAWEI P40 二手\n手机\n麒麟990 5G SoC芯片全面屏安卓智能拍照游戏\n手机\n95新 亮黑色 8GB+128GB 国行正品，专业检测，质保180天，vivo-x80pro:全网通5G手机超感光大底主摄,蔡司影像点击查看',
        'ContentMap2169.00', '100+条评价', 'https://item.jd.com/10039409455202.html',
        'https://img12.360buyimg.com/n7/jfs/t1/65153/14/24505/65477/6397ceafE274322ea/ebdd092e50e5e4f5.jpg');
INSERT INTO `goods`
VALUES (318, '京粉二手手机旗舰店',
        '拍拍\n华为\nHUAWEI Mate 40 Pro麒麟9000 SoC芯片感知徕卡有线无线双快充二手\n手机\n99新 亮黑色 8GB+256GB『赠20W闪充』 iPhone13系列-甄选好品质大额优惠券-抢磁吸无线快充火爆开抢查看',
        'ContentMap4749.00', '100+条评价', 'https://item.jd.com/10036179051064.html',
        'https://img14.360buyimg.com/n7/jfs/t1/189322/3/31882/360225/63a5e4bcEbd834f15/3395a48a49dc5a53.png');
INSERT INTO `goods`
VALUES (319, '凯旋通二手手机专营店',
        '拍拍\n华为\nHUAWEI P30 Pro 二手\n手机\n二手\n华为手机\n麒麟980曲面屏10倍变焦 麒麟980 天空之境（赠3c认证快充） 8GB+128GB【95新】 95成新 华为 HUAWEI P30 Pro 二手手机 二手华为手机 麒麟980曲面屏10倍变焦 麒麟980 天空之境（赠3c认证快充） 8GB+128GB【95新】 95成新',
        'ContentMap1329.00', '100+条评价', 'https://item.jd.com/10048830510707.html',
        'https://img12.360buyimg.com/n7/jfs/t1/155878/1/34237/67155/63a66ef7Ebf904467/51422222a81bdd78.jpg');
INSERT INTO `goods`
VALUES (320, '耐谷手机旗舰店',
        '华为\n（HUAWEI）畅享20 Plus 5G\n手机\n畅玩20 幻夜黑 6GB+128GB 华为（HUAWEI）畅享20 Plus 5G手机 畅玩20 幻夜黑 6GB+128GB',
        'ContentMap969.00', '100+条评价', 'https://item.jd.com/10049523579082.html',
        'https://img12.360buyimg.com/n7/jfs/t1/197/21/17380/36264/63a03834Ee14c6fa8/1ffbdbe38e5bfffc.png');
INSERT INTO `goods`
VALUES (321, '京铠玄手机旗舰店',
        '华为\nmate40 5G\n手机\n支持鸿蒙系统 【Mate40E 5G】8+256G釉白色 官方标配 【原装正品，店长推荐Mate40e】麒麟990E芯片超感知徕卡影像68°曲面屏',
        'ContentMap5999.00', '100+条评价', 'https://item.jd.com/10065109413028.html',
        'https://img13.360buyimg.com/n7/jfs/t1/6126/12/26648/86170/6368dc62E89dc9c34/424f6cd90ece3084.jpg');
INSERT INTO `goods`
VALUES (322, '荣达数码科技二手手机专营店',
        '拍拍\n华为\n（HUAWEI）畅享9 全面屏 双卡双待 后置双摄智能美颜拍照 二手\n手机\n珊瑚红 4+128G 95新 华为（HUAWEI）畅享9 全面屏 双卡双待 后置双摄智能美颜拍照 二手手机 珊瑚红 4+128G 95新',
        'ContentMap468.00', '100+条评价', 'https://item.jd.com/10066862792158.html',
        'https://img13.360buyimg.com/n7/jfs/t1/197267/39/29469/46491/638db441Ea89dd738/5b179579a82410b6.jpg');
INSERT INTO `goods`
VALUES (323, '上海电信京东自营旗舰店',
        '华为\nMate Xs2 全新一代折叠旗舰\n手机\n雅黑 8G+256G（上海电信） 华为Mate Xs2 全新一代折叠旗舰手机 雅黑 8G+256G（上海电信）',
        'ContentMap9899.00', '100+条评价', 'https://item.jd.com/100026388599.html',
        'https://img14.360buyimg.com/n7/jfs/t1/7203/1/17498/110023/62aae63dEc429f89c/a325a71edf821743.jpg');
INSERT INTO `goods`
VALUES (324, '江苏移动京东自营店',
        '华为\n（HUAWEI）P50Pro 4G全网通 原色双影像单元 8GB+256GB可可茶金手机（无充电器和数据线） 华为（HUAWEI）P50Pro 4G全网通 原色双影像单元 8GB+256GB可可茶金手机（无充电器和数据线）',
        'ContentMap4888.00', '100+条评价', 'https://item.jd.com/100033505158.html',
        'https://img13.360buyimg.com/n7/jfs/t1/212983/26/12711/74864/620de0b8Ecb15b4a6/5b4d898ca85f3e13.jpg');
INSERT INTO `goods`
VALUES (325, '天翼电信京东自营旗舰店',
        '华为\nHUAWEI Mate 50 全网通\n手机\n128GB 曜金黑 直屏旗舰 超光变XMAGE影像 鸿蒙系统 【中国电信国企品质保障】内置66W华为充电套装，超光变XMAGE影像，北斗卫星消息，鸿蒙操作系统3.0！电信用户优惠专区~',
        'ContentMap4849.00', '100+条评价', 'https://item.jd.com/100037845007.html',
        'https://img12.360buyimg.com/n7/jfs/t1/187498/1/27494/76496/63198bb5Eb62ac360/32060831d736b8a9.jpg');
INSERT INTO `goods`
VALUES (326, '深圳电信京东自营旗舰店',
        '华为\n（HUAWEI） 畅享 50 6000mAh大电池 22.5W超能续航 6.75英寸影音大屏双卡双待智能\n手机\n6G+128GB 贝母白 华为（HUAWEI） 畅享 50 6000mAh大电池 22.5W超能续航 6.75英寸影音大屏双卡双待智能手机 6G+128GB 贝母白',
        'ContentMap1199.00', '100+条评价', 'https://item.jd.com/100044680961.html',
        'https://img11.360buyimg.com/n7/jfs/t1/170342/24/32777/44535/63870d19Eff8710dd/65b4e8bf79fc9ea2.jpg');
INSERT INTO `goods`
VALUES (327, '汇优机二手手机专营店',
        '拍拍\n华为\nHUAWEI nova 9/ 9 Pro 二手\n手机\n4G全网通120Hz 送66w快充 99新 亮黑色【nova 9 】 8G+128G 【送66w超级快充】 99成新 华为 HUAWEI nova 9/ 9 Pro 二手手机 4G全网通120Hz 送66w快充 99新 亮黑色【nova 9 】 8G+128G 【送66w超级快充】 99成新',
        'ContentMap1428.00', '100+条评价', 'https://item.jd.com/10049106750936.html',
        'https://img11.360buyimg.com/n7/jfs/t1/124917/40/32792/80900/63a1dc85Ec2b19170/42e89b916e64085f.jpg');
INSERT INTO `goods`
VALUES (328, '京采二手手机专营店',
        '拍拍\n华为\nHUAWEI\n华为\n畅享10e 二手\n手机\n智能\n手机\n6.3英寸全面屏 大电量长待机 翡冷翠 4G+64G 95新 华为 HUAWEI 华为 畅享10e 二手手机 智能手机 6.3英寸全面屏 大电量长待机 翡冷翠 4G+64G 95新',
        'ContentMap398.00', '100+条评价', 'https://item.jd.com/10053560255194.html',
        'https://img14.360buyimg.com/n7/jfs/t1/97472/16/34794/361558/63a5c3aaE323f59f0/50bbf14c01be174e.png');
INSERT INTO `goods`
VALUES (329, '鹏瑶旗舰店',
        '爱心东东\n华为\n智选 优畅享50\n手机\n幻海蓝 全网通5G(8+128GB) 华为智选 优畅享50 手机 幻海蓝 全网通5G(8+128GB)',
        'ContentMap1168.00', '100+条评价', 'https://item.jd.com/10054298222548.html',
        'https://img13.360buyimg.com/n7/jfs/t1/162104/11/31068/128991/63462f4bEbbc2f77b/d394d5a385e887eb.jpg');
INSERT INTO `goods`
VALUES (330, '锦昱手机通讯专营店',
        '华为\n（HUAWEI） 畅享20 全网通5G\n手机\n6.6英寸 5000mah大电池 大字体大声音 畅享20 亮黑色 4GB+64GB 华为（HUAWEI） 畅享20 全网通5G手机 6.6英寸 5000mah大电池 大字体大声音 畅享20 亮黑色 4GB+64GB',
        'ContentMap1058.00', '93条评价', 'https://item.jd.com/10048802585009.html',
        'https://img14.360buyimg.com/n7/jfs/t1/121314/5/23507/107381/625291d8E3a9b9f65/87a8010700472244.jpg');
INSERT INTO `goods`
VALUES (331, '浩瀚蜂鸟手机专营店',
        '24期白条\n华为\nMate Xs2 matexs2新品折叠屏\n手机\n霜紫 全网通8+256G 全国多仓现货当天发！华为高端机器，请确认需求后下单，无质量问题不支持7天无理由退货！华为matex2；5G版点我购',
        'ContentMap8998.00', '93条评价', 'https://item.jd.com/10051167452937.html',
        'https://img12.360buyimg.com/n7/jfs/t1/146469/21/34048/91575/639ecf78E05acbe7b/b0a9f9f5d0d88f90.jpg');
INSERT INTO `goods`
VALUES (332, '金麦子二手手机专营店',
        '拍拍 【二手9成新】\n华为\n（HUAWEI）荣耀10 4G全面屏AI摄影 游戏安卓智能\n手机\n双卡双待 幻影黑 幻影紫 6 +128G 【二手9成新】华为（HUAWEI）荣耀10 4G全面屏AI摄影 游戏安卓智能手机 双卡双待 幻影黑 幻影紫 6 +128G',
        'ContentMap699.00', '92条评价', 'https://item.jd.com/68976727015.html',
        'https://img10.360buyimg.com/n7/jfs/t1/113731/40/5063/91763/5eb23925E876c9c7f/64eaabf360a56d0c.jpg');
INSERT INTO `goods`
VALUES (333, '机窝窝二手商品专营店',
        '拍拍\n华为\n畅享10plus 二手\n手机华为\n二\n手机\n95新 天空之镜 4+128全网通 全店支持7天无理由退15天换货，180天保修服务，购二手售后有保障',
        'ContentMap539.00', '83条评价', 'https://item.jd.com/10028019211836.html',
        'https://img11.360buyimg.com/n7/jfs/t1/168025/1/18768/147841/6075b86aE1ff158be/cb01252ac251a1b9.jpg');
INSERT INTO `goods`
VALUES (334, '亿佳基业手机专营店',
        '华为\n智选 Hi nova9pro 5G\n手机\n全网通版 双卡双待 亮黑色 8GB+128GB【原装100W充电套装】 365天质量问题只换不修【官网直降·现货当天发】5G手机,120Hz原色超曲屏,后置5000万超感光主摄,100W疾速快充，',
        'ContentMap1859.00', '83条评价', 'https://item.jd.com/10044585404526.html',
        'https://img11.360buyimg.com/n7/jfs/t1/213168/11/24714/131772/63a5737bE48959eb8/c4956809b6184e22.jpg');
INSERT INTO `goods`
VALUES (335, '京东电竞手机官方旗舰店',
        '华为\n智选优畅享50Plus 新品5G\n手机\n雅致黑 8GB+256GB 华为智选优畅享50Plus 新品5G手机 雅致黑 8GB+256GB',
        'ContentMap1349.00', '83条评价', 'https://item.jd.com/10047762713064.html',
        'https://img14.360buyimg.com/n7/jfs/t1/104079/6/30367/80400/6305d8d4Eb4acd31e/34f21cd01626a8ba.jpg');
INSERT INTO `goods`
VALUES (336, '上海电信京东自营旗舰店',
        '华为\nnova10\n手机\n耀金黑 8G+128GB 全网通【内置66W\n华为\n超级快充】（上海电信） 华为nova10手机 耀金黑 8G+128GB 全网通【内置66W华为超级快充】（上海电信）',
        'ContentMap2299.00', '74条评价', 'https://item.jd.com/100036769267.html',
        'https://img12.360buyimg.com/n7/jfs/t1/79396/24/22209/39251/630d81f2E3776720c/7f6d8e784e5098a7.jpg');
INSERT INTO `goods`
VALUES (337, '天翼电信京东自营旗舰店',
        '华为\nHUAWEI Mate 50 Pro 全网通\n手机\n512GB 冰霜银 北斗卫星消息 超光变XMAGE影像 鸿蒙系统 【中国电信国企品质保障】内置66W华为充电套装，超光变XMAGE影像，北斗卫星消息，鸿蒙操作系统3.0！电信用户优惠专区~',
        'ContentMap7599.00', '74条评价', 'https://item.jd.com/100037908435.html',
        'https://img10.360buyimg.com/n7/jfs/t1/75708/2/22075/75770/63198deeE10b5096d/2e5e30236f734784.jpg');
INSERT INTO `goods`
VALUES (338, '乐为优品二手商品专营店',
        '拍拍 Huawei\n华为\nP30二手\n手机\n感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹 95新 极光色 8GB+128GB 【新年盛典】全店直降部分商品再领大额优惠券，全店产品下单赠运费险及配件套装，99新华为Mate30点击查看》',
        'ContentMap1186.00', '74条评价', 'https://item.jd.com/10027738359822.html',
        'https://img12.360buyimg.com/n7/jfs/t1/196577/18/31207/94031/63a5d6eaE25e9b37c/d077f554acef3c6e.jpg');
INSERT INTO `goods`
VALUES (339, '博恒聚优旗舰店',
        '爱心东东\n华为\nP50 新品\n手机\n搭载HarmonyOS鸿蒙系统 曜金黑 8+128GB（\n华为\n原装66W充电套装） 万象双环设计，原色双影像单元,搭载HarmonyOS2，购机【赠】华为66w充电套装+90天碎屏险+运费险+咨询客服好礼相送',
        'ContentMap3688.01', '66条评价', 'https://item.jd.com/10051238806232.html',
        'https://img12.360buyimg.com/n7/jfs/t1/169502/36/33174/62986/638aec4dEb181177e/d90a8151557f9a16.jpg');
INSERT INTO `goods`
VALUES (340, '浩瀚蜂鸟手机专营店',
        '24期免息\n华为\nP50 Pro\n手机\n万象双环设计 搭载HarmonyOS 2 8GB+256GB 曜金黑\n华为\n原装66W充电套装版 【现货当天发】原色双影像单元,万象双环设计,66W超级快充,欢迎选购！',
        'ContentMap5488.00', '66条评价', 'https://item.jd.com/10058910941762.html',
        'https://img12.360buyimg.com/n7/jfs/t1/117939/34/28540/89004/63075e68Ee5991fb9/6db1a3595886ae29.jpg');
INSERT INTO `goods`
VALUES (341, '万佳诚手机专营店',
        '华为\nHUAWEI Mate 30 Pro\n手机\n麒麟990旗舰芯片OLED环幕屏双4000万四摄 亮黑色 4G全网通8GB+256GB 华为 HUAWEI Mate 30 Pro 手机 麒麟990旗舰芯片OLED环幕屏双4000万四摄 亮黑色 4G全网通8GB+256GB',
        'ContentMap5799.00', '65条评价', 'https://item.jd.com/64701204352.html',
        'https://img12.360buyimg.com/n7/jfs/t1/108911/29/389/310058/5df494c5E7edf5a56/0bba8294be47c7cb.jpg');
INSERT INTO `goods`
VALUES (342, '八连星手机专营店',
        '顺丰速发 Huawei/\n华为\nMate30超感光徕卡三摄超级4000万4G智能\n手机\nmate30\n华为\n翡冷翠 4G全网通8GB+128GB 顺丰速发 Huawei/华为Mate30超感光徕卡三摄超级4000万4G智能手机mate30华为 翡冷翠 4G全网通8GB+128GB',
        'ContentMap3659.00', '58条评价', 'https://item.jd.com/67750473769.html',
        'https://img14.360buyimg.com/n7/jfs/t1/187942/19/5451/137702/60b0b3b0Ed5030ba9/adac1a379eb0a53f.jpg');
INSERT INTO `goods`
VALUES (343, '中国电信自营旗舰店',
        '华为\n# Mate 40 Pro 麒麟9000 SoC芯片 超感知徕卡电影影像 8GB+256GB 釉白色 5G全网通\n手机\n新 华为# Mate 40 Pro 麒麟9000 SoC芯片 超感知徕卡电影影像 8GB+256GB 釉白色 5G全网通手机 新',
        'ContentMap7399.00', '58条评价', 'https://item.jd.com/100040183125.html',
        'https://img10.360buyimg.com/n7/jfs/t1/49354/2/21580/68607/63411e07E5fd09c17/a054dc7c96985f0d.jpg');
INSERT INTO `goods`
VALUES (344, '乐为优品二手商品专营店',
        '拍拍\n华为\n畅享 7s 二手\n手机\n老人\n手机\n备用机安卓全网通4G 双卡双待 9成新 黑色 4GB+64GB 【新年盛典】全店直降部分商品再领大额优惠券，全店产品下单赠运费险及配件套装，99新华为Mate30点击查看》',
        'ContentMap499.00', '58条评价', 'https://item.jd.com/10027737992493.html',
        'https://img13.360buyimg.com/n7/jfs/t1/14386/29/20629/79516/63a5d6e7E82989db6/2bb5f1a2851ddb54.jpg');
INSERT INTO `goods`
VALUES (345, '传奇二手商品专营店',
        '拍拍\n华为\nHUAWEI Mate30E Pro 5G\n手机\n二手\n手机\n华为手机\n麒麟990E SoC芯片 丹霞橙 8GB+128GB 全网通 99新 手机界天花板，大家都说好iPhone13ProMax，戳',
        'ContentMap2388.00', '52条评价', 'https://item.jd.com/10026873485333.html',
        'https://img13.360buyimg.com/n7/jfs/t1/194631/17/30334/487690/639805eeEe0b7f965/08d1ab6f87d3e541.png');
INSERT INTO `goods`
VALUES (346, '乐为优品二手商品专营店',
        '拍拍\n华为\nMate30Pro 二手\n手机\n4g全网通5g\n手机\n95新 星河银【赠3C认证快充】 8GB+128GB【4G版全网通】 【新年盛典】全店直降部分商品再领大额优惠券，全店产品下单赠运费险及配件套装，99新华为Mate30点击查看》',
        'ContentMap2086.00', '52条评价', 'https://item.jd.com/10027737860157.html',
        'https://img12.360buyimg.com/n7/jfs/t1/188227/26/32102/123433/63a5d6e8E466aff45/1c6b06a456393902.jpg');
INSERT INTO `goods`
VALUES (347, '柏新优品二手手机专营店',
        '拍拍\n华为\nHUAWEI Mate30pro 二手\n手机\n麒麟990芯片4G/5G全网通徕卡影像 95成新 星河银 8G+128G【4G版】 国行正品,拍拍质检.支持7天无理由退货,180天保修.【P30pro感光徕卡四摄,10倍混合变焦,麒麟980芯片,屏内指纹】促销低至17XX,点击',
        'ContentMap2188.00', '52条评价', 'https://item.jd.com/10034953882713.html',
        'https://img13.360buyimg.com/n7/jfs/t1/223016/8/22652/108161/63a5e887Ed528eef4/6bb83f6c78211bd3.jpg');
INSERT INTO `goods`
VALUES (348, '乐亨优品二手商品专营店',
        '拍拍\n华为\nMate20 RS 保时捷限量版 麒麟980 曲面屏 二手\n华为手机\n玄黑 8G+512G 95成新 华为Mate20 RS 保时捷限量版 麒麟980 曲面屏 二手华为手机 玄黑 8G+512G 95成新',
        'ContentMap2688.00', '45条评价', 'https://item.jd.com/10064315940400.html',
        'https://img10.360buyimg.com/n7/jfs/t1/222620/23/20100/70864/63903bdfE3420a1bb/4380bb6f1496b3ea.jpg');
INSERT INTO `goods`
VALUES (349, '浩瀚蜂鸟手机专营店',
        '【现货当天发】80 Pro 5G新品\n手机\n1.6亿像素超清主摄 骁龙8+【\n华为手机华为\n有售】 碧波微蓝 8+256G 官方标配 【原封正品现货当天发】',
        'ContentMap3498.00', '46条评价', 'https://item.jd.com/10066153759440.html',
        'https://img10.360buyimg.com/n7/jfs/t1/126856/27/32236/164680/63887053Ea2f44022/14dab9f091a5c2ec.jpg');
INSERT INTO `goods`
VALUES (350, '和合优品二手商品专营店',
        '拍拍\n华为\nnova5i\n手机\n麒麟710全网通4G 双卡双待 9成新 苏音蓝 6GB+128GB 国行正品，品类好货，下单即送配件套装及运费险，华为Mate40Pro，5G麒麟9000|非凡影响超感纸徕卡电影影像²点击',
        'ContentMap548.00', '45条评价', 'https://item.jd.com/70869053833.html',
        'https://img13.360buyimg.com/n7/jfs/t1/31774/28/19222/83061/63a5e390E9200f309/da552cb717467aec.jpg');
INSERT INTO `goods`
VALUES (351, '福气多多手机旗舰店',
        '华为\nnova9 新品\n手机\n9号色 8GB+256G丨白条免息丨12期 【享12期免息】下单即送蓝牙耳机、智能手环、晒单红包、2年保修',
        'ContentMap2999.00', '41条评价', 'https://item.jd.com/10039784098077.html',
        'https://img12.360buyimg.com/n7/jfs/t1/146536/38/32390/99141/6396874eE9f1c16bd/d945bc8027038a46.jpg');
INSERT INTO `goods`
VALUES (352, '久恒二手手机专营店',
        '拍拍\n华为\nHUAWEI nova3i 二手\n手机\n4G全网通 双卡双待 全面刘海屏安卓高清四摄 游戏机 蓝楹紫 4+128G 9成新 聚全网优惠丨国行正品丨七天非人为质量问题免费退换丨售后无忧丨买二手机找久恒优品',
        'ContentMap408.00', '41条评价', 'https://item.jd.com/10052539325694.html',
        'https://img14.360buyimg.com/n7/jfs/t1/1957/30/17236/80262/63a5f408Ef23a3870/7e06b8886aa5142a.jpg');
INSERT INTO `goods`
VALUES (353, '机友二手数码专营店',
        '拍拍\n华为\n智选 麦芒7 二手\n手机\nHUAWEI 安卓智能全面屏游戏拍照学生备用 铂光金 6GB+64GB 95成新 【优惠品质二手机，手慢无】vivoY66火爆抢购中，低至209元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap449.00', '41条评价', 'https://item.jd.com/10053008140345.html',
        'https://img10.360buyimg.com/n7/jfs/t1/55818/40/18818/59718/63a67d95Ea3b3a39d/a459d801af4a75c1.jpg');
INSERT INTO `goods`
VALUES (354, '和合优品二手商品专营店',
        '拍拍\n华为\nnova6 5G\n手机\n105°前置广角双摄感光暗拍 麒麟990芯片二手\n手机\n95新 亮黑色 (8GB+128GB)5G版全网通 国行正品，品类好货，下单即送配件套装及运费险，华为Mate40Pro，5G麒麟9000|非凡影响超感纸徕卡电影影像²点击',
        'ContentMap1268.00', '36条评价', 'https://item.jd.com/70281253853.html',
        'https://img13.360buyimg.com/n7/jfs/t1/157997/20/33413/468578/63a1cf22E1a0c02fb/6adce1158cb63d0f.png');
INSERT INTO `goods`
VALUES (355, '万佳诚手机专营店',
        '华为\nHUAWEI Mate 30 5G\n手机\n麒麟990 4000万超感光徕卡影像双摄 全网通 亮黑色 8GB+128GB 6.62英寸，4200毫安电池，支持NFC',
        'ContentMap5499.00', '36条评价', 'https://item.jd.com/70411800692.html',
        'https://img12.360buyimg.com/n7/jfs/t1/111230/32/9720/211380/5ee074c9Ee45cb6d5/0c802d3bc5b7259d.jpg');
INSERT INTO `goods`
VALUES (356, '湖南电信官方自营旗舰店',
        'Hi nova 9 Pro 5G全网通 前置双3200万影像单元 100W疾速快充 5G双模 8GB+128GB亮黑色5g\n手机\n【\n华为\n智选】 【华为智选hinova9pro】5G手机，120Hz原色超曲屏，后置5000万超感光主摄，热销爆款，限量抢购【赠】华为66W原装快充+碎屏险90天+店铺延保',
        'ContentMap2509.00', '36条评价', 'https://item.jd.com/100028915699.html',
        'https://img14.360buyimg.com/n7/jfs/t1/114550/7/27906/112963/62cb9931E92c21acc/65296adb8c52ac50.jpg');
INSERT INTO `goods`
VALUES (357, '耀不凡旗舰店',
        '华为\n智选 Hi nova9se 新品5G\n手机\n亮黑色 8+256G 全网通 华为智选 Hi nova9se 新品5G手机 亮黑色 8+256G 全网通',
        'ContentMap2499.01', '33条评价', 'https://item.jd.com/10049068656853.html',
        'https://img13.360buyimg.com/n7/jfs/t1/162730/28/32985/113691/63a541d3E0ae98ef3/c08eb6fa89fde378.jpg');
INSERT INTO `goods`
VALUES (358, '机友二手数码专营店',
        '拍拍\n华为\nnova8 SE 活力版 二手\n手机\nHUAWEI 安卓全面屏智能游戏拍照 幻夜黑 8GB+128GB 95成新 【优惠品质二手机，手慢无】vivoY66火爆抢购中，低至209元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap999.00', '33条评价', 'https://item.jd.com/10049605966829.html',
        'https://img14.360buyimg.com/n7/jfs/t1/112658/34/34361/42546/63a67d9dEb3d3246e/ad94235139d117f3.png');
INSERT INTO `goods`
VALUES (359, '拍拍严选尖货旗舰店',
        '拍拍\n华为\nHUAWEI Mate 30 Pro 二手\n手机\n5G\n手机\n智能\n手机\n华为\nmate30pro 亮黑色 8+128G 热8购物季！苹果13Pro2下单赠手机壳+钢化膜！数量有限！现货速发~点击查看！',
        'ContentMap3019.00', '33条评价', 'https://item.jd.com/10057062473883.html',
        'https://img13.360buyimg.com/n7/jfs/t1/203150/32/28591/67113/635b3e88E0bf0de8e/0a8c32504b43b68f.jpg');
INSERT INTO `goods`
VALUES (360, '好机汇手机专营店',
        '华为\nMatexs2 /Mate xs2 折叠屏\n手机\n鸿蒙HarmonyOS 雅黑 8G+256G【含原装66W充电套装】 支持开赠票/北京闪送【高端产品价格波动大，购买后不支持退差价，无质量问题不支持退换，请确认需求后购买！】',
        'ContentMap9188.00', '30条评价', 'https://item.jd.com/10051388864584.html',
        'https://img14.360buyimg.com/n7/jfs/t1/222087/12/21274/46683/638814f8E7c3f4490/19a51aa287a5868e.png');
INSERT INTO `goods`
VALUES (361, '京采二手手机专营店',
        '拍拍\n华为\n畅享10 二手\n手机\n极点全面屏 4800万 4000mAh大电池 学生备用机 天空之境(颜色随机不指定） 4GB+ 64GB 9新 华为 畅享10 二手手机 极点全面屏 4800万 4000mAh大电池 学生备用机 天空之境(颜色随机不指定） 4GB+ 64GB 9新',
        'ContentMap499.00', '30条评价', 'https://item.jd.com/10054579131451.html',
        'https://img11.360buyimg.com/n7/jfs/t1/8111/5/18734/104096/63a5c3adE246a4dd9/47727bc5bc3254d5.jpg');
INSERT INTO `goods`
VALUES (362, '秒亿二手手机专营店',
        '拍拍\n华为\nHuawei P30 二手\n手机\n超感光徕卡三摄麒麟980AI智能芯片全面屏 全网通 亮黑色 8G+256G【送快充】 95成新 年末超值购，华为P20-6+64G限时购低至546！立购！！！',
        'ContentMap1639.00', '30条评价', 'https://item.jd.com/10055560169797.html',
        'https://img12.360buyimg.com/n7/jfs/t1/78798/8/22712/99086/6364b982E481431ec/5682b33e7146d1b1.jpg');
INSERT INTO `goods`
VALUES (363, '华为新境界专卖店', '华为\nnova9pro\n手机\n9号色 8+128GB全网通 华为nova9pro 手机 9号色 8+128GB全网通',
        'ContentMap2159.00', '27条评价', 'https://item.jd.com/10063166525065.html',
        'https://img10.360buyimg.com/n7/jfs/t1/119710/32/33591/88684/639052a3E0ae460c7/26aebaa33888e37e.jpg');
INSERT INTO `goods`
VALUES (364, '秦王湖手机旗舰店',
        '荣耀x40GT 新品5G\n手机\n满帧战神 游戏\n手机\n竞速黑 8GB+256GB 荣耀x40GT 新品5G手机 满帧战神 游戏手机 竞速黑 8GB+256GB',
        'ContentMap2299.00', '27条评价', 'https://item.jd.com/10066390899820.html',
        'https://img10.360buyimg.com/n7/jfs/t1/192393/10/31008/110256/638469b4E18b2b6c0/7848a14d8b79e027.jpg');
INSERT INTO `goods`
VALUES (365, '中国电信自营旗舰店',
        '华为\n（HUAWEI）P50系列 P50 Pro 4G全网通 原色双影像单元 麒麟9000芯片 万象双环设 8GB+256GB曜金黑\n手机\n华为（HUAWEI）P50系列 P50 Pro 4G全网通 原色双影像单元 麒麟9000芯片 万象双环设 8GB+256GB曜金黑手机',
        'ContentMap5988.00', '26条评价', 'https://item.jd.com/100025308828.html',
        'https://img13.360buyimg.com/n7/jfs/t1/200218/34/2553/70978/61137b1eEcf7b9955/e4bbc06cc78e18b0.jpg');
INSERT INTO `goods`
VALUES (366, '普华手机专营店',
        '华为\n智选 NZONE S7 Pro 新款5G男女士学生游戏\n手机\n烟雨青蓝 8GB+128GB 华为智选 NZONE S7 Pro 新款5G男女士学生游戏手机 烟雨青蓝 8GB+128GB',
        'ContentMap1359.00', '22条评价', 'https://item.jd.com/10061229031974.html',
        'https://img14.360buyimg.com/n7/jfs/t1/168048/11/30113/92209/632c33e1Ed7f0f36c/4baf2a42befcdc2e.png');
INSERT INTO `goods`
VALUES (367, 'OKSJ手机旗舰店',
        '华为\nMate 50e 鸿蒙操作系统3.0 全网通\n手机\n128GB 冰霜银 官方标配 全新原装正品，全国联保！推荐华为Mate50Pro',
        'ContentMap3999.00', '23条评价', 'https://item.jd.com/10062381787425.html',
        'https://img10.360buyimg.com/n7/jfs/t1/215659/33/21412/82343/63450b5dE7ce6de5a/338271b0b4d1b372.jpg');
INSERT INTO `goods`
VALUES (368, '华为新境界专卖店',
        '华为\npocket s 新品折叠\n手机\n曜石黑 256G通【晒单红包100元】 华为pocket s 新品折叠手机 曜石黑 256G通【晒单红包100元】',
        'ContentMap6158.01', '23条评价', 'https://item.jd.com/10064707932531.html',
        'https://img11.360buyimg.com/n7/jfs/t1/47100/23/21346/56258/63632037E703875e2/ad58ca7bdbab8096.jpg');
INSERT INTO `goods`
VALUES (369, '汇优机二手手机专营店',
        '拍拍 HUAWEI /\n华为\nNova7 SE麒麟820 5G SOC芯片智能安卓二手手送40w快充95成新 幻夜黑 8G+128G【送40w快充】 95成新 HUAWEI /华为Nova7 SE麒麟820 5G SOC芯片智能安卓二手手送40w快充95成新 幻夜黑 8G+128G【送40w快充】 95成新',
        'ContentMap1018.00', '20条评价', 'https://item.jd.com/10049095072121.html',
        'https://img11.360buyimg.com/n7/jfs/t1/166262/28/33521/79390/63a1dc7cE35ecef3a/7db0321245525839.jpg');
INSERT INTO `goods`
VALUES (370, '机友二手数码专营店',
        '拍拍\n华为\n畅享20 5G 二手\n手机\nHUAWEI 智能安卓全面屏游戏学生 极夜黑 4GB+128GB 9成新 【优惠品质二手机，手慢无】vivoY66火爆抢购中，低至209元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap659.00', '20条评价', 'https://item.jd.com/10052219595602.html',
        'https://img12.360buyimg.com/n7/jfs/t1/8659/13/21158/61578/63a67da1Ef0edd392/1b7e1ece2e90032d.jpg');
INSERT INTO `goods`
VALUES (371, '蜀夏通讯优品专营店',
        '拍拍\n华为\nHuawei nova3i 128G 全面屏AI美颜四摄拍照 4G全网通二手\n手机\n蓝楹紫 6G+128G 95成新 5G手机、尽在蜀夏优品。国行正品,、专业检测、支持7天无理由退货、180天质量保修。下单即赠:3A3C认证充电器、数据线。5G手机、尽在蜀夏优品。',
        'ContentMap470.00', '20条评价', 'https://item.jd.com/10053149301704.html',
        'https://img14.360buyimg.com/n7/jfs/t1/203853/1/20980/78052/63946ec2E2b58e0d3/0c3024e1fc090f83.jpg');
INSERT INTO `goods`
VALUES (372, 'OKSJ手机旗舰店',
        '华为\nPocket S 新品折叠屏4G全网通\n手机\n冰霜银 128G 官方标配 全新原装正品，全国联保，下单送多重好礼！',
        'ContentMap6488.00', '18条评价', 'https://item.jd.com/10064027715962.html',
        'https://img12.360buyimg.com/n7/jfs/t1/86388/37/32049/46330/63626af2E56b93d95/8da2f3f5be7d48c0.jpg');
INSERT INTO `goods`
VALUES (373, '头号卖家旗舰店',
        '华为\npocket s 全网通新品旗舰折叠屏\n手机\n曜石黑 8G+128GB 官方标配【含\n华为\n原装充电套装】 华为pocket s 全网通新品旗舰折叠屏手机 曜石黑 8G+128GB 官方标配【含华为原装充电套装】',
        'ContentMap5688.00', '18条评价', 'https://item.jd.com/10064058320792.html',
        'https://img12.360buyimg.com/n7/jfs/t1/147793/27/29260/57718/63947a61E3e27c947/0cecc589fc55f34f.jpg');
INSERT INTO `goods`
VALUES (374, '京东之家官方旗舰店',
        '华为\nnova10se 新品上市\n手机\n10号色 128G全网通（碎屏险套装） 【新品优惠下单立减50元！华为官方直供】新品上市，全国联保【赠】碎屏险季卡+蓝牙耳机+充电宝+晒单专享红包。nova10火热抢购中',
        'ContentMap1998.00', '18条评价', 'https://item.jd.com/10067033210381.html',
        'https://img11.360buyimg.com/n7/jfs/t1/219741/14/23934/165694/6392df7cEd86e3fb3/d39838cf19336cfc.png');
INSERT INTO `goods`
VALUES (375, '福气多多手机旗舰店',
        '华为\n畅享50pro 新品\n手机\n8GB+128GB幻夜黑 官方标配 【现货速发官方直供】下单赠送无线蓝牙耳机+手机壳+钢化膜等',
        'ContentMap1699.00', '16条评价', 'https://item.jd.com/10057063380155.html',
        'https://img10.360buyimg.com/n7/jfs/t1/139842/2/32490/100312/6396883dEf2c7b84d/98ef3bfe1e7c45e5.jpg');
INSERT INTO `goods`
VALUES (376, '传奇二手商品专营店',
        '拍拍\n华为\nHUAWEI Mate 40 E 5G/4G可选 二手\n手机\n华为手机\n全面屏 搭载鸿蒙OS2 亮黑色 8G+128G 4G版 99成新 手机界天花板，大家都说好iPhone13ProMax，戳',
        'ContentMap2599.00', '16条评价', 'https://item.jd.com/10058800076265.html',
        'https://img10.360buyimg.com/n7/jfs/t1/141245/27/32481/84273/639805e7E03858265/37ccf7cd751d5625.jpg');
INSERT INTO `goods`
VALUES (377, '乐亨优品二手商品专营店',
        '拍拍\n华为\nHUAWEI P30 Pro 二手\n手机\n二手\n华为手机\n麒麟980曲面屏10倍变焦美颜拍照\n手机\n极光色 8G+256G 95成新 华为 HUAWEI P30 Pro 二手手机 二手华为手机 麒麟980曲面屏10倍变焦美颜拍照手机 极光色 8G+256G 95成新',
        'ContentMap1788.00', '16条评价', 'https://item.jd.com/10058831327530.html',
        'https://img10.360buyimg.com/n7/jfs/t1/141509/17/32815/86819/6397eeebE56a2380f/1a34986609df0f87.jpg');
INSERT INTO `goods`
VALUES (378, '在一起二手手机专营店',
        '拍拍\n华为\np50 pocket 旗舰折叠屏\n手机\n双卡双待 二手\n华为\np50宝盒 国行全网通 赠3c认证快充 曜石黑 8G+256G 95成新 华为p50 pocket 旗舰折叠屏手机 双卡双待 二手华为p50宝盒 国行全网通 赠3c认证快充 曜石黑 8G+256G 95成新',
        'ContentMap4899.00', '14条评价', 'https://item.jd.com/10058718371003.html',
        'https://img13.360buyimg.com/n7/jfs/t1/214407/30/24358/522936/6397009aE9e9fcd5d/641bea8b10145c75.png');
INSERT INTO `goods`
VALUES (379, '千寻雪旗舰店',
        '华为\nnova10 pro （白条0首付6期分期免息可选）\n手机\n普罗旺斯 8GB+256GB 华为nova10 pro （白条0首付6期分期免息可选）手机 普罗旺斯 8GB+256GB',
        'ContentMap3999.00', '14条评价', 'https://item.jd.com/10058959041920.html',
        'https://img10.360buyimg.com/n7/jfs/t1/50758/14/21741/55392/630451b7E8d0364a8/5faced7595b7615c.jpg');
INSERT INTO `goods`
VALUES (380, '平天数码旗舰店', '华为\nMate50 Pro 新品\n手机\n矅金黑 256G全网通 【现货速发】华为官方直供华为mate50',
        'ContentMap6799.00', '14条评价', 'https://item.jd.com/10058975724231.html',
        'https://img11.360buyimg.com/n7/jfs/t1/191454/1/32020/75099/639c0136Ed53bbf4a/57deb44b498e6152.jpg');
INSERT INTO `goods`
VALUES (381, '响当当二手手机专营店',
        '拍拍\n华为\nnova5z 二手\n手机\nHUAWEI 安卓智能游戏全面屏拍照学生 幻夜黑 6GB+64GB 9成新 【优惠品质二手机，手慢无】OPPOA5火爆抢购中，4GB+64GB只要339元，下单送多重好礼。七天免费试用，15天换货，365天质保抢购点击',
        'ContentMap569.00', '12条评价', 'https://item.jd.com/10048723280598.html',
        'https://img13.360buyimg.com/n7/jfs/t1/205183/6/20395/56831/624d3d5dEf9a08d0e/b6e4a75e4abb0280.jpg');
INSERT INTO `goods`
VALUES (382, '锦昱手机通讯专营店',
        '华为\n（HUAWEI） 畅享20 SE 6.67英寸 5000mAh电池\n华为\n畅享20se\n手机\n畅享20e 幻夜黑 4GB+64GB 华为（HUAWEI） 畅享20 SE 6.67英寸 5000mAh电池 华为畅享20se手机 畅享20e 幻夜黑 4GB+64GB',
        'ContentMap688.00', '12条评价', 'https://item.jd.com/10049843258144.html',
        'https://img14.360buyimg.com/n7/jfs/t1/133294/16/21245/75116/625fc515E857b9596/acbfdf79b285f9c7.jpg');
INSERT INTO `goods`
VALUES (383, '达倍手机通讯专营店',
        '华为\n（HUAWEI） 畅享 9e 畅享9E 实力大音量高像素珍珠屏通4G版双4G\n手机\n10E幻夜黑(4GB运存+64GB内存) 华为（HUAWEI） 畅享 9e 畅享9E 实力大音量高像素珍珠屏通4G版双4G手机 10E幻夜黑(4GB运存+64GB内存)',
        'ContentMap718.00', '12条评价', 'https://item.jd.com/10051803130403.html',
        'https://img13.360buyimg.com/n7/jfs/t1/205197/22/14048/97806/627a02f3E9d1337d8/10da39b0533cd5b5.jpg');
INSERT INTO `goods`
VALUES (384, '和合优品二手商品专营店',
        '拍拍 畅玩 7X 二手\n手机\n老人\n手机\n备用机全面屏\n手机\n工作机 双卡双待 9成新 魅焰红 4GB+64GB 国行正品，品类好货，下单即送配件套装及运费险，华为Mate40Pro，5G麒麟9000|非凡影响超感纸徕卡电影影像²点击',
        'ContentMap558.00', '10条评价', 'https://item.jd.com/70869018752.html',
        'https://img12.360buyimg.com/n7/jfs/t1/42052/14/21054/135254/63a5e38cEd88bb0cd/e497523aab1c60cf.jpg');
INSERT INTO `goods`
VALUES (385, '银河信业专营店',
        '爱心东东\n华为\n畅享20Pro 5G双模全网通\n手机\n深海蓝 6GB+128GB 赠、碎屏险套装/开增普票/欢迎单位集团采购/全国联保/有质量问题/开箱损/可去当地售后换修',
        'ContentMap1429.00', '10条评价', 'https://item.jd.com/70950720394.html',
        'https://img14.360buyimg.com/n7/jfs/t1/95537/8/28778/80393/6371ca21Ed62106e6/054cbf29136cb753.jpg');
INSERT INTO `goods`
VALUES (386, '京东电器超级体验店西安店',
        '华为\nP50E 4G全网通 万象双环 5000万超感光原色影像 超级变焦单元 8GB+128GB可可茶金 华为 P50E 4G全网通 万象双环 5000万超感光原色影像 超级变焦单元 8GB+128GB可可茶金',
        'ContentMap3688.00', '10条评价', 'https://item.jd.com/100020331955.html',
        'https://img10.360buyimg.com/n7/jfs/t1/101596/28/25762/61356/62383adfE22abc1d3/0838819393333fbd.jpg');
INSERT INTO `goods`
VALUES (387, '在一起二手手机专营店',
        '拍拍 【二手95新】\n华为\nHUAWEI Mate30/Mate30Pro麒麟990芯片徕卡影像4G二手\n手机\n星河银（mate30） 6G+128G 4G全网通 【二手95新】华为 HUAWEI Mate30/Mate30Pro麒麟990芯片徕卡影像4G二手手机 星河银（mate30） 6G+128G 4G全网通',
        'ContentMap1749.00', '9条评价', 'https://item.jd.com/10038500175596.html',
        'https://img11.360buyimg.com/n7/jfs/t1/20747/8/20120/646001/639700a5Ed2838839/ad4943afabf2f977.png');
INSERT INTO `goods`
VALUES (388, '天行健数码专营店',
        '华为\n（HUAWEI） p40pro+ 双模5G\n手机\nP40 pro+ 全网通5G\n手机\n陶瓷白 全网通(8+512G) 华为（HUAWEI） p40pro+ 双模5G手机 P40 pro+ 全网通5G手机 陶瓷白 全网通(8+512G)',
        'ContentMap9399.00', '9条评价', 'https://item.jd.com/10039155545865.html',
        'https://img10.360buyimg.com/n7/jfs/t1/201324/30/18951/176613/61b8b46fE176e4ce2/0f41defd0d24a9bc.jpg');
INSERT INTO `goods`
VALUES (389, '翔辰手机专营店',
        'X30 5G\n手机\n双卡双待\n华为手机\n店内有售 钛空银6+128G 12期免息版 X30 5G手机 双卡双待 华为手机店内有售 钛空银6+128G 12期免息版',
        'ContentMap1399.00', '9条评价', 'https://item.jd.com/10040895859661.html',
        'https://img11.360buyimg.com/n7/jfs/t1/65401/20/23301/45885/6368a32dE17a31663/c26bcd0ce1e88591.jpg');
INSERT INTO `goods`
VALUES (390, '福气多多手机旗舰店',
        '华为\nnova10 Pro 新品\n手机\n前置6000万追焦双摄 轻薄机身 10号色8GB+256GB丨含\n华为\n100W充电套装 官方标配 【现货速发、顺丰直达】白条12期免息！下单送蓝牙耳机+运动手环+液态手机壳+屏幕保护膜+镜头保护膜+晒单赠品等众多好礼',
        'ContentMap3999.00', '8条评价', 'https://item.jd.com/10055212775272.html',
        'https://img12.360buyimg.com/n7/jfs/t1/43534/33/22211/108279/639687d1E0b382981/bf7f81d9a82b2db8.jpg');
INSERT INTO `goods`
VALUES (391, '浩瀚蜂鸟手机专营店',
        '24期免息\n华为\nnova 10 Pro 前置6000万追焦双摄 轻薄机身 新品\n手机\n普罗旺斯 8+128G（含\n华为\n原装100W充电套装） 24期免息 华为nova 10 Pro 前置6000万追焦双摄 轻薄机身 新品手机 普罗旺斯 8+128G（含华为原装100W充电套装）',
        'ContentMap3699.00', '8条评价', 'https://item.jd.com/10056002870037.html',
        'https://img12.360buyimg.com/n7/jfs/t1/57591/31/21617/137271/62f763edE3ccaf07f/f9d8c4d300553ff5.jpg');
INSERT INTO `goods`
VALUES (392, '京东电竞手机官方旗舰店',
        '【京东电竞】\n华为\n畅享50pro 新品\n手机\n翡冷翠 全网通【8G+128GB】 【京东电竞】华为畅享50pro 新品手机 翡冷翠 全网通【8G+128GB】',
        'ContentMap1658.00', '8条评价', 'https://item.jd.com/10057274438441.html',
        'https://img11.360buyimg.com/n7/jfs/t1/92118/7/31424/108732/63109036Efc56d9a1/0a8df55bf431676e.jpg');
INSERT INTO `goods`
VALUES (393, '恒凯二手手机专营店',
        '拍拍\n华为\np40 pro 5G 二手\n手机\n麒麟990芯片 50倍数字变焦 5000万莱卡四摄 99新 P40 pro(8G运行)晨曦金 8GB + 512GB【送3c 66w快充】 华为 p40 pro 5G 二手手机 麒麟990芯片 50倍数字变焦 5000万莱卡四摄 99新 P40 pro(8G运行)晨曦金 8GB + 512GB【送3c 66w快充】',
        'ContentMap3998.00', '7条评价', 'https://item.jd.com/10057598648077.html',
        'https://img12.360buyimg.com/n7/jfs/t1/222186/9/22451/257090/637dee94E645668d3/50b1dff67ecca200.png');
INSERT INTO `goods`
VALUES (394, '延续优品二手手机专营店',
        '拍拍\n华为\nHUAWEI P30 Pro 二手\n手机\n二手\n华为手机\n麒麟980曲面屏10倍变焦美颜拍照\n手机\n亮黑色【赠3C认证快充】 8+256G全网通4G 95新 国行正品一机一检！爆款推荐：华为5G版Mate30Pro热销中，极速发货！立即抢购立即抢购',
        'ContentMap1638.00', '7条评价', 'https://item.jd.com/10057704229660.html',
        'https://img10.360buyimg.com/n7/jfs/t1/195221/18/31485/130951/63a1c215E2bd723cb/517a72ff0721b357.jpg');
INSERT INTO `goods`
VALUES (395, '京拍优品二手手机专营店',
        '拍拍\n华为\nHUAWEI Mate20 麒麟980AI智能芯片全面屏\n手机\n超大广角徕卡三摄 二手\n华为手机\n翡冷翠 6G+128G【4G全网通】 95新 优惠大放送！',
        'ContentMap918.00', '7条评价', 'https://item.jd.com/10058357529983.html',
        'https://img13.360buyimg.com/n7/jfs/t1/63296/19/22845/779471/6380cf0dEeecdc16b/b509e280bab1e7af.png');
INSERT INTO `goods`
VALUES (396, '神锌讯数码专营店',
        '华为\nMate40 Pro+ 5G\n手机\n全网通 支持鸿蒙HarmonyOS Mate40Pro 标配 亮黑色 8+128G 华为Mate40 Pro+ 5G手机全网通 支持鸿蒙HarmonyOS Mate40Pro 标配 亮黑色 8+128G',
        'ContentMap7488.00', '6条评价', 'https://item.jd.com/10060577918003.html',
        'https://img13.360buyimg.com/n7/jfs/t1/219258/24/20412/50344/6322dd39E746d447b/e13c55fefd7cd0b2.jpg');
INSERT INTO `goods`
VALUES (397, '华为新境界专卖店',
        '华为\nmate50 RS 保时捷设计 新品\n手机\n胭紫瓷 512G 【假一赔三】【现货当天发】品牌直供，全国联保，高端产品价格波动大，购买后不支持退差价，无质量问题不支持退换货，请确认需求后购买！',
        'ContentMap13599.00', '6条评价', 'https://item.jd.com/10060702628141.html',
        'https://img11.360buyimg.com/n7/jfs/t1/199906/29/30654/68581/63a428e8E07987428/b1a2fea3d2278f73.jpg');
INSERT INTO `goods`
VALUES (398, '莫拉克手机专营店',
        '华为\nMate40 Pro 5G版\n手机\n亮黑色 8+512GB全网通5G（无充） 华为Mate40 Pro 5G版手机 亮黑色 8+512GB全网通5G（无充）',
        'ContentMap8688.00', '6条评价', 'https://item.jd.com/10061032981890.html',
        'https://img10.360buyimg.com/n7/jfs/t1/160882/2/21415/688237/612ca8f9E6fd01013/3ce73a9defa9cc96.png');
INSERT INTO `goods`
VALUES (399, '慧耀二手商品专营店',
        '拍拍\n华为\nHUAWEI P40Pro 二手\n手机\n二手\n华为手机\n5G 5000万徕卡四摄 50倍数字变焦 亮黑色 8GB+256GB 95成新 全店直降，下单赠好礼，超高性价比优选，7天免费免费试用，还赠运费险，店长推荐小米10低至1199，华为P40低至1879热销中',
        'ContentMap2839.00', '5条评价', 'https://item.jd.com/10059450564286.html',
        'https://img11.360buyimg.com/n7/jfs/t1/101756/7/34564/131615/63a5e4bdEfddbc32f/d840eca3c6dc883b.jpg');
INSERT INTO `goods`
VALUES (400, '慧耀二手商品专营店',
        '拍拍\n华为\nHUAWEI P40Pro 二手\n手机\n二手\n华为手机\n5G 5000万徕卡四摄 50倍数字变焦 冰霜银 8GB+256GB 9成新 全店直降，下单赠好礼，超高性价比优选，7天免费免费试用，还赠运费险，店长推荐小米10低至1199，华为P40低至1879热销中',
        'ContentMap2829.00', '5条评价', 'https://item.jd.com/10059504727366.html',
        'https://img11.360buyimg.com/n7/jfs/t1/65614/8/23174/131676/63a5e4beEabc66465/d896673cfe4f1aa0.jpg');
INSERT INTO `goods`
VALUES (401, '漫博游旗舰店',
        '华为\nHUAWEI P40 麒麟990全网通5G SoC芯片 全面屏安卓智能 拍照游戏\n手机\n零度白 8GB+128GB 华为 HUAWEI P40 麒麟990全网通5G SoC芯片 全面屏安卓智能 拍照游戏手机 零度白 8GB+128GB',
        'ContentMap4999.00', '5条评价', 'https://item.jd.com/10060559241528.html',
        'https://img13.360buyimg.com/n7/jfs/t1/202582/19/26377/35825/63216c4bE43e7b569/e19af88a2bec5974.png');
INSERT INTO `goods`
VALUES (402, '酷博昊远手机通讯专营店',
        '华为\nnova10 Pro 新品\n手机\n10号色【256GB】 官方标配 华为 nova10 Pro 新品手机 10号色【256GB】 官方标配',
        'ContentMap3999.01', '4条评价', 'https://item.jd.com/10055117951525.html',
        'https://img10.360buyimg.com/n7/jfs/t1/18168/19/16890/418414/62c2a1a5E4fa4d23b/d4ed5bc6a7a3f294.jpg');
INSERT INTO `goods`
VALUES (403, '京采二手手机专营店',
        '拍拍\n华为\nHuawei\n华为\nnova7 SE 二手\n手机\nnova7se全面屏 智能5G\n手机\n麒麟820 幻夜黑 8G+128G【赠送40w快充】 95新 附赠智能快充（非原装）充电套装壳膜卡针',
        'ContentMap1000.00', '4条评价', 'https://item.jd.com/10055613799852.html',
        'https://img12.360buyimg.com/n7/jfs/t1/107928/40/25843/83182/63a5c3a8Ec28db570/39c50bc2e712651b.jpg');
INSERT INTO `goods`
VALUES (404, '岳鸿手机合约机专营店',
        '华为\n畅享 50 6000mAh大电池 22.5W超能续航 6.75英寸影音大屏 双卡双待 智能\n手机\n蓝色 8G+128GB 华为畅享 50 6000mAh大电池 22.5W超能续航 6.75英寸影音大屏 双卡双待 智能手机 蓝色 8G+128GB',
        'ContentMap1499.00', '4条评价', 'https://item.jd.com/10055871016511.html',
        'https://img11.360buyimg.com/n7/jfs/t1/131980/7/24440/42118/62c654d4E8ff6f81d/401e0b89d75ca6a3.jpg');
INSERT INTO `goods`
VALUES (405, '中国电信自营旗舰店',
        '华为\n畅享 50 6000mAh大电池 22.5W超能续航 6.75英寸影音大屏 双卡双待 智能\n手机\n8G+128GB 贝母白\n华为手机\n自营品质，全新正品，全国联保，限时抢购',
        'ContentMap1099.00', '3条评价', 'https://item.jd.com/100033098451.html',
        'https://img11.360buyimg.com/n7/jfs/t1/109016/1/18614/44822/6368a0afE89016cd0/f14e87557f3d3927.jpg');
INSERT INTO `goods`
VALUES (406, '中国电信自营旗舰店',
        '华为\nHUAWEI Mate X2 5G全网通12GB+512GB釉白色典藏版 麒麟芯片 超感知徕卡四摄\n华为手机\n折叠屏（标配无充） 华为 HUAWEI Mate X2 5G全网通12GB+512GB釉白色典藏版 麒麟芯片 超感知徕卡四摄华为手机折叠屏（标配无充）',
        'ContentMap22599.00', '3条评价', 'https://item.jd.com/100033634955.html',
        'https://img10.360buyimg.com/n7/jfs/t1/183996/35/27501/164172/62ef3f0bEe73fc168/b2de936e51c92cb9.jpg');
INSERT INTO `goods`
VALUES (407, '中国电信自营旗舰店',
        '华为\nHUAWEI Mate X2 （典藏版）5G 麒麟9000芯片 超感知徕卡四摄 100倍数字变焦 墨黑 12+512G 标准版 华为 HUAWEI Mate X2 （典藏版）5G 麒麟9000芯片 超感知徕卡四摄 100倍数字变焦 墨黑 12+512G 标准版',
        'ContentMap32999.00', '3条评价', 'https://item.jd.com/100039561939.html',
        'https://img14.360buyimg.com/n7/jfs/t1/28393/11/19740/55119/63281504Ee5d688c0/e7d4f1ccbb035fb5.jpg');
INSERT INTO `goods`
VALUES (408, '唯尔优品二手商品专营店',
        '拍拍\n华为\n（HUAWEI）\n华为\n畅享9 二手\n手机\n智能机 工作机全网通4G 双卡双待 后置双摄智能美颜 幻夜黑 4GB+64GB 9成新 12月放心购，国行正品，工作机，备用机，高性价比强烈推荐，oppoR9s低至289，小米11青春版低至1078点击直达',
        'ContentMap348.00', '3条评价', 'https://item.jd.com/10059524293709.html',
        'https://img14.360buyimg.com/n7/jfs/t1/102536/29/20185/86605/639d6255E4b4eb87d/e8009f624e044570.jpg');
INSERT INTO `goods`
VALUES (409, 'OKSJ手机旗舰店',
        '华为\nMate 50 RS保时捷 全网通4G\n手机\n512GB 墨蓝瓷 官方标配 全新原装正品，全国联保！推荐华为Mate50Pro',
        'ContentMap13588.00', '3条评价', 'https://item.jd.com/10059987684266.html',
        'https://img11.360buyimg.com/n7/jfs/t1/171909/32/27276/24650/6317fc9bE97f0b5d0/044d76df7911cde0.jpg');
INSERT INTO `goods`
VALUES (410, '居然智慧家旗舰店',
        '华为\nnova10z 新品\n手机\n幻夜黑 8GB+256GB 官方标配 华为nova10z 新品手机 幻夜黑 8GB+256GB 官方标配',
        'ContentMap1899.00', '3条评价', 'https://item.jd.com/10059992596040.html',
        'https://img10.360buyimg.com/n7/jfs/t1/100227/6/34914/97632/63776554Edf2d88c5/612f9750ff3b19bf.jpg');
INSERT INTO `goods`
VALUES (411, '重庆联通京东自营旗舰店',
        '华为\n/HUAWEI nova 9 SE 一亿像素超清摄影 支持66W快充 创新Vlog体验 8GB+128GB 冰晶蓝\n华为手机\n华为/HUAWEI nova 9 SE 一亿像素超清摄影 支持66W快充 创新Vlog体验 8GB+128GB 冰晶蓝 华为手机',
        'ContentMap1389.00', '2条评价', 'https://item.jd.com/100045543909.html',
        'https://img14.360buyimg.com/n7/jfs/t1/34501/32/18640/51837/635b7ad3Ea5fafc45/00929783c7bee675.jpg');
INSERT INTO `goods`
VALUES (412, '京东手机优选自营旗舰店',
        'HUAWEI Pocket S 折叠屏\n手机\n时尚多彩 40万次折叠认证 后摄人像自拍 256GB 樱草金\n华为\n小折叠 HUAWEI Pocket S 折叠屏手机 时尚多彩 40万次折叠认证 后摄人像自拍 256GB 樱草金 华为小折叠',
        'ContentMap6488.00', '2条评价', 'https://item.jd.com/100046699461.html',
        'https://img11.360buyimg.com/n7/jfs/t1/62120/20/22976/42780/63687679E94e15ce7/533c0e0b2007e7bf.jpg');
INSERT INTO `goods`
VALUES (413, '北京联通京东自营旗舰店',
        '华为\n智选 Hi nova 10 5G全网通 前置6000万4K超广角摄像头 6.88毫米超轻薄机身 8+256GB 10号色5G\n手机\n华为智选 Hi nova 10 5G全网通 前置6000万4K超广角摄像头 6.88毫米超轻薄机身 8+256GB 10号色5G手机',
        'ContentMap2969.00', '2条评价', 'https://item.jd.com/100047509275.html',
        'https://img10.360buyimg.com/n7/jfs/t1/9766/24/20766/57628/6389b91fEc3a68045/b8f6c54c30b7f857.jpg');
INSERT INTO `goods`
VALUES (414, '杰方手机通讯专营店',
        '华为\n（HUAWEI）\n华为\n畅享10e\n手机\n智能中年老年人学生大屏超长待机 幻夜黑 4G+64G 华为（HUAWEI） 华为畅享10e 手机 智能中年老年人学生大屏超长待机 幻夜黑 4G+64G',
        'ContentMap799.00', '2条评价', 'https://item.jd.com/10058263418754.html',
        'https://img14.360buyimg.com/n7/jfs/t1/40322/10/17851/97662/62f3d1b5Ee7d9b62e/367c5b5f0f96327d.jpg');
INSERT INTO `goods`
VALUES (415, '神锌讯数码专营店',
        '华为\nMate 40 5G\n手机\n全网通 麒麟9000E Soc芯片 5000万超感知莱卡电影影像 秘银色 8GB+128GB 华为Mate 40 5G手机全网通 麒麟9000E Soc芯片 5000万超感知莱卡电影影像 秘银色 8GB+128GB',
        'ContentMap5888.00', '2条评价', 'https://item.jd.com/10058331423325.html',
        'https://img10.360buyimg.com/n7/jfs/t1/69904/36/21407/99295/62f5b226E7b379c3f/c3d3507eac6da40a.jpg');
INSERT INTO `goods`
VALUES (416, '拍拍严选尖货旗舰店',
        '拍拍 【\n华为\n认证二\n手机\n】\n华为\nHUAWEI P30 1年官方质保 鸿蒙OS 二手\n手机\n99新赤茶橘 8G+128G 【华为认证二手机】华为HUAWEI P30 1年官方质保 鸿蒙OS 二手手机 99新赤茶橘 8G+128G',
        'ContentMap1649.00', '2条评价', 'https://item.jd.com/10065368675301.html',
        'https://img11.360buyimg.com/n7/jfs/t1/195961/34/30279/55929/6371e6a8E9655c706/1cd5ff764446fb12.jpg');
INSERT INTO `goods`
VALUES (417, '华为新境界专卖店',
        '华为\nnova10pro 新品\n手机\n曜金黑 8+256GB全网通(含\n华为\n原装100W充电套装) 【17点之前订单99%发出】【官方直供全国联保】',
        'ContentMap3789.00', '2条评价', 'https://item.jd.com/10065372252296.html',
        'https://img11.360buyimg.com/n7/jfs/t1/8819/17/20329/77660/63a42a2dEcc075c4e/42e0536a88f1783c.jpg');
INSERT INTO `goods`
VALUES (418, '七七优品二手手机专营店',
        '拍拍\n华为\nHUAWEI Mate X2 二手手\n华为\n机 折叠屏\n手机\n全网通5G 麒麟9000 matex2 釉白色 8+256 8成新 华为 HUAWEI Mate X2 二手手华为机 折叠屏手机 全网通5G 麒麟9000 matex2 釉白色 8+256 8成新',
        'ContentMap9888.00', '2条评价', 'https://item.jd.com/10065464945634.html',
        'https://img14.360buyimg.com/n7/jfs/t1/98605/33/28866/56057/638f0385E55ed5e15/d298289f524aa890.png');
INSERT INTO `goods`
VALUES (419, '中国电信自营旗舰店',
        'HUAWEI Mate 50 Pro # 曲面旗舰 超光变XMAGE影像 北斗卫星消息 256GB 冰霜银\n华为\n鸿蒙\n手机\nHUAWEI Mate 50 Pro # 曲面旗舰 超光变XMAGE影像 北斗卫星消息 256GB 冰霜银 华为鸿蒙手机',
        'ContentMap6799.00', '1条评价', 'https://item.jd.com/100048631723.html',
        'https://img13.360buyimg.com/n7/jfs/t1/20218/21/19343/64500/637b2b0eEc031baf4/8351d7d3b96c8442.jpg');
INSERT INTO `goods`
VALUES (420, '漫博游旗舰店',
        '选12期白条免息\n华为\n智选 优畅享30e 5G\n手机\n雅致黑 4+128 选12期白条免息华为智选 优畅享30e 5G手机 雅致黑 4+128',
        'ContentMap899.00', '1条评价', 'https://item.jd.com/10061359604337.html',
        'https://img12.360buyimg.com/n7/jfs/t1/15147/6/19900/93442/63a56955E8c77ae5e/dfda8247970d146c.jpg');
INSERT INTO `goods`
VALUES (421, '宇航手机专营店',
        '华为\n（HUAWEI） mate50RS 保时捷 新品\n手机\n【pro店内可选】 墨蓝瓷 12G+512G 华为（HUAWEI） mate50RS 保时捷 新品手机 【pro店内可选】 墨蓝瓷 12G+512G',
        'ContentMap14999.00', '1条评价', 'https://item.jd.com/10061450118243.html',
        'https://img13.360buyimg.com/n7/jfs/t1/37030/22/19302/50492/632fd4a5Ef546aab1/ad4c79e2d97dada8.jpg');
INSERT INTO `goods`
VALUES (422, '银河信业专营店',
        '畅玩30 5G\n手机\n【\n华为\n产品店内有售】 幻夜黑 8GB+128GB 荣耀畅玩30下单即送3个月碎屏险，产品支持全国联保，1年保修，如需售后可就近处理！',
        'ContentMap1258.00', '1条评价', 'https://item.jd.com/10061535217329.html',
        'https://img14.360buyimg.com/n7/jfs/t1/165768/22/29348/84944/635a4e27E7b141489/b64096ba0256ee1e.jpg');
INSERT INTO `goods`
VALUES (423, '臻选二手手机专营店',
        '拍拍\n华为\nMate RS 保时捷设计版 二手安卓\n手机\n曲面屏游戏拍照\n手机\n95成新 MateRs黑色 6GB+256GB 华为Mate RS 保时捷设计版 二手安卓手机 曲面屏游戏拍照手机 95成新 MateRs黑色 6GB+256GB',
        'ContentMap1580.00', '1条评价', 'https://item.jd.com/10066532423585.html',
        'https://img10.360buyimg.com/n7/jfs/t1/127695/29/24182/38796/62cc7b3bEc1d11faf/26c9dbe627046d19.jpg');
INSERT INTO `goods`
VALUES (424, '臻选二手手机专营店',
        '拍拍 HUAWEI\n华为\nnova5 Pro 6.39英寸屏 4800万AI四摄 二手\n手机\n仲夏紫 8G+256Gnova5pr HUAWEI 华为nova5 Pro 6.39英寸屏 4800万AI四摄 二手手机 仲夏紫 8G+256Gnova5pr',
        'ContentMap1158.00', '1条评价', 'https://item.jd.com/10066532570251.html',
        'https://img11.360buyimg.com/n7/jfs/t1/112570/1/31022/74332/63844b6cE19fb827d/2aef383dc29c50cb.png');
INSERT INTO `goods`
VALUES (425, '微焱数码旗舰店', '华为\nnova10se 新品\n手机\n10号色 128G全网通 华为nova10se 新品手机 10号色 128G全网通',
        'ContentMap1999.01', '1条评价', 'https://item.jd.com/10066583513936.html',
        'https://img11.360buyimg.com/n7/jfs/t1/133023/13/28741/57224/6392f951E4950555e/21a9d07040542519.jpg');
INSERT INTO `goods`
VALUES (426, '京东电脑数码办公设备企业级解决方案自营',
        '华为\n畅享 50 6000mAh大电池 22.5W超能续航 6.75英寸影音大屏 双卡双待 智能\n手机\n8G+256GB 幻夜黑\n华为手机\n华为畅享 50 6000mAh大电池 22.5W超能续航 6.75英寸影音大屏 双卡双待 智能手机 8G+256GB 幻夜黑 华为手机',
        'ContentMap1835.00', '0条评价', 'https://item.jd.com/100042944467.html',
        'https://img12.360buyimg.com/n7/jfs/t1/187072/5/28861/39590/6344fd68E754679e9/d361e549ac87c1f7.jpg');
INSERT INTO `goods`
VALUES (427, '华为京东自营官方旗舰店',
        '华为\n畅享 50z 5000万高清AI三摄 5000mAh超能续航 128GB 宝石蓝 大内存鸿蒙智能\n手机\n【华为畅享50z新品上市】5000万高清AI三摄,5000mAh超能续航,大内存鸿蒙智能手机！更多手机热销爆款，限量抢购，猛戳》》》',
        'ContentMap1099.00', '0条评价', 'https://item.jd.com/100049728367.html',
        'https://img12.360buyimg.com/n7/jfs/t1/92842/28/33119/95789/6391caf7E072d350c/74ddc795ac8ceaeb.jpg');
INSERT INTO `goods`
VALUES (428, '中国电信自营旗舰店',
        '华为\n（HUAWEI） Pocket S 折叠屏\n手机\n时尚多彩 40万次折叠认证 后摄人像自拍 256GB 樱语粉\n华为\n小折叠 华为（HUAWEI） Pocket S 折叠屏手机 时尚多彩 40万次折叠认证 后摄人像自拍 256GB 樱语粉 华为小折叠',
        'ContentMap7299.00', '0条评价', 'https://item.jd.com/100049830085.html',
        'https://img10.360buyimg.com/n7/jfs/t1/32049/28/19024/22991/63859462E49850f33/8a990cec3c0ea73d.jpg');
INSERT INTO `goods`
VALUES (429, '中国电信自营旗舰店',
        '华为\n（HUAWEI） Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息 低电量应急模式 128GB冰霜银\n华为\n鸿蒙\n手机\n华为（HUAWEI） Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息 低电量应急模式 128GB冰霜银华为鸿蒙手机',
        'ContentMap5899.00', '0条评价', 'https://item.jd.com/100049830197.html',
        'https://img12.360buyimg.com/n7/jfs/t1/187826/3/30152/102349/63859837Ef71b75e4/fb87093ab89d6659.jpg');
INSERT INTO `goods`
VALUES (430, '席泰数码专营店',
        '爱心东东\n华为\nP50 Pro 新品\n华为手机\n搭载鸿蒙OS2系统 可可茶金 8GB+128GB 骁龙888 【稀缺商品，一经售出不支持七天无理由退换货，敬请谅解！】',
        'ContentMap5378.00', '0条评价', 'https://item.jd.com/10055704570725.html',
        'https://img10.360buyimg.com/n7/jfs/t1/58902/1/20116/91454/62d58910E6cbdf223/ad72c2febfc036e9.jpg');
INSERT INTO `goods`
VALUES (431, '发靓机优品二手手机专营店',
        '拍拍 HUAWEI P50 Pocket 素皮版 4G\n华为\n国行全网通二手折叠\n手机\n120Hz高刷 云锦白 8G+256G 99成新 下单领优惠券',
        'ContentMap5259.00', '0条评价', 'https://item.jd.com/10055755584385.html',
        'https://img10.360buyimg.com/n7/jfs/t1/202948/27/25181/124611/62ce6daaE512f0f03/3e2ff885fa0eedad.jpg');
INSERT INTO `goods`
VALUES (432, '和合优品二手商品专营店',
        '拍拍 荣耀60SE 120Hz十亿色曲面屏 66W超级快充 全网通5G 二手\n手机\n95新 亮黑色 8GB+128GB 荣耀60SE 120Hz十亿色曲面屏 66W超级快充 全网通5G 二手手机 95新 亮黑色 8GB+128GB',
        'ContentMap2398.00', '0条评价', 'https://item.jd.com/10055880006573.html',
        'https://img13.360buyimg.com/n7/jfs/t1/167736/32/29983/118093/63a1cf28E935be589/5056afe1c47dc02f.jpg');
INSERT INTO `goods`
VALUES (433, '龙飞优品二手手机专营店',
        '拍拍\n华为\nMate40 RS保时捷设计\n手机\n系列 麒麟9000 5G 二手\n手机\n陶瓷白 8+256G 未拆封未使用 华为 Mate40 RS保时捷设计手机系列 麒麟9000 5G 二手手机 陶瓷白 8+256G 未拆封未使用',
        'ContentMap16999.00', '0条评价', 'https://item.jd.com/10061612561122.html',
        'https://img12.360buyimg.com/n7/jfs/t1/147514/7/30315/36584/63365674E388c0c57/f5b2391383f5625c.jpg');
INSERT INTO `goods`
VALUES (434, '八滢星手机通讯专营店',
        '华为\n（HUAWEI） P30\n手机\n超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版\n手机\nP30Pro【珠光贝母】 8GB+128GB 华为（HUAWEI） P30 手机 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机 P30Pro【珠光贝母】 8GB+128GB',
        'ContentMap4299.00', '0条评价', 'https://item.jd.com/10061615964721.html',
        'https://img11.360buyimg.com/n7/jfs/t1/210094/23/26925/25406/63328f12E052b114e/8b90f6459da3a0bf.jpg');
INSERT INTO `goods`
VALUES (435, '八达二手手机专营店',
        '拍拍\n华为\nP30 Pro 全网通 天空之境 麒麟 980处理器 学生备用机 二手\n华为手机\nHUAWEI 天空之境 8GB+128GB送快充 9新 嗨，找我买手机，我宠你啊！',
        'ContentMap1418.00', '0条评价', 'https://item.jd.com/10064944751077.html',
        'https://img12.360buyimg.com/n7/jfs/t1/103077/24/33425/12419/6366376bE9d646b7a/adf5804f2fb674c2.jpg');
INSERT INTO `goods`
VALUES (436, '头号卖家旗舰店',
        '华为\n智选Hi nova9se 全网通5G 新品智能\n手机\n120Hz刷新率 梦幻冰蓝 8G+128G 全网通5G【180天碎屏保】 华为智选Hi nova9se 全网通5G 新品智能手机120Hz刷新率 梦幻冰蓝 8G+128G 全网通5G【180天碎屏保】',
        'ContentMap1499.00', '0条评价', 'https://item.jd.com/10065032302167.html',
        'https://img12.360buyimg.com/n7/jfs/t1/127246/33/30433/80208/63477bd9Ef0b6c9a0/d37ce71da12587a2.jpg');
INSERT INTO `goods`
VALUES (437, '恒凯二手手机专营店',
        '拍拍\n华为\nMate20 X 4G/5G 二手\n手机\n麒麟980 AI芯片 全面屏 超大广角徕卡三摄 9新 宝石蓝（4G） 6GB + 128GB 9成新 华为 Mate20 X 4G/5G 二手手机 麒麟980 AI芯片 全面屏 超大广角徕卡三摄 9新 宝石蓝（4G） 6GB + 128GB 9成新',
        'ContentMap1408.00', '0条评价', 'https://item.jd.com/10065161831550.html',
        'https://img10.360buyimg.com/n7/jfs/t1/212650/9/23458/70794/637deea3E9fcc34cb/a57933a700f79376.png');
INSERT INTO `goods`
VALUES (438, '臻选二手手机专营店',
        '拍拍\n华为\n（HUAWEI） 畅享10e 5000mAh大电量 长待机 安卓\n华为\n二手\n手机\n95新 幻夜黑 4G+64G 通 华为（HUAWEI） 畅享10e 5000mAh大电量 长待机 安卓 华为二手手机 95新 幻夜黑 4G+64G 通',
        'ContentMap378.00', '0条评价', 'https://item.jd.com/10066532679722.html',
        'https://img12.360buyimg.com/n7/jfs/t1/37318/17/15198/81161/612c5c27E6124e488/77712e0338737afc.jpg');
INSERT INTO `goods`
VALUES (439, '漫博游旗舰店',
        '80 1.6亿像素超清主摄 Vlog视频大师 全新Magic OS 7.0系统 5G\n手机华为\n店内可选 碧波微蓝 12GB+256GB 80 1.6亿像素超清主摄 Vlog视频大师 全新Magic OS 7.0系统 5G手机华为店内可选 碧波微蓝 12GB+256GB',
        'ContentMap2999.00', '0条评价', 'https://item.jd.com/10066536217213.html',
        'https://img13.360buyimg.com/n7/jfs/t1/131094/22/29482/105786/639c062cE207ed146/e1ca459ac6702c49.jpg');
INSERT INTO `goods`
VALUES (440, '华伟通讯旗舰店',
        '华为\nMate50 Pro 曲面旗舰 超光变XMAGE影像 北斗卫星消息 流光紫 512GB 白条分期 华为Mate50Pro新品上市内置66W华为充电套装，超光变XMAGE影像，北斗卫星消息，鸿蒙操作系统3.0！',
        'ContentMap8759.00', '0条评价', 'https://item.jd.com/10066536546523.html',
        'https://img13.360buyimg.com/n7/jfs/t1/33834/36/18223/147716/6384316eE9ad30f3a/30e5e9df501512e9.jpg');
INSERT INTO `goods`
VALUES (441, '席泰数码专营店',
        'nova 9 120Hz高刷 后置5000万超感知影像 支持鸿蒙操作系统 4G\n手机\n亮黑色 8GB+256GB nova 9 120Hz高刷 后置5000万超感知影像 支持鸿蒙操作系统 4G手机 亮黑色 8GB+256GB',
        'ContentMap2299.00', '0条评价', 'https://item.jd.com/10067142909234.html',
        'https://img14.360buyimg.com/n7/jfs/t1/33007/23/18776/56625/639612d8E95f0da17/2c72e9c22d70ea85.jpg');
INSERT INTO `goods`
VALUES (442, '一多二手手机专营店',
        '拍拍\n华为\n（HUAWEI）畅享10s 二手\n手机\n全网通8+128G屏幕指纹4800万拍照游戏备用 幻夜黑 6+128GB 9成新 国行正品，质检机构专业检测。支持7天无理由退货，180天保修，赠运费险，不满意包退，赠3c认证2A充电套装-钢化膜贴好-包邮',
        'ContentMap580.00', '0条评价', 'https://item.jd.com/10067153198952.html',
        'https://img12.360buyimg.com/n7/jfs/t1/205323/38/15700/393003/61959ffaE8a0ef575/baecd3105f559577.png');

SET
FOREIGN_KEY_CHECKS = 1;
