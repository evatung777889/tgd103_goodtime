/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.31 : Database - GOODTIME
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`GOODTIME` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `GOODTIME`;

/*Table structure for table `ADDRESS` */

DROP TABLE IF EXISTS `ADDRESS`;

CREATE TABLE `ADDRESS` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '地址編號',
  `LOCATION` varchar(256) NOT NULL COMMENT '詳細地址',
  `FK_ADDRESS_MEMBER_ID` int DEFAULT NULL COMMENT 'FK_會員編號',
  PRIMARY KEY (`ID`),
  KEY `FK_ADDRESS_MEMBER_ID_idx` (`FK_ADDRESS_MEMBER_ID`),
  CONSTRAINT `FK_ADDRESS_MEMBER_ID` FOREIGN KEY (`FK_ADDRESS_MEMBER_ID`) REFERENCES `MEMBER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

/*Data for the table `ADDRESS` */

insert  into `ADDRESS`(`ID`,`LOCATION`,`FK_ADDRESS_MEMBER_ID`) values 
(1,'台北市中山區南京東路三段219號5樓',5),
(3,'110台北市信義區莊敬路334號1樓',7),
(7,'100台北市中正區濟南路一段321號',38),
(12,'台北市松山區敦化北路100號2樓',7),
(13,'台北市松山區敦化北路100號2樓',5),
(14,'249新北市八里區頂寮一街12號',39),
(15,'333桃園市龜山區文化一路196號',1),
(16,'新北市新莊區鳳山街56巷',48),
(17,'235新北市中和區中正路291號',49),
(18,'10491台北市中山區民權東路二段145號',50),
(19,'100台北市中正區福州街12號',51),
(20,'106台北市大安區四維路198巷38弄2號',52),
(21,'106台北市大安區仁愛路四段10號',53);

/*Table structure for table `BOOKING` */

DROP TABLE IF EXISTS `BOOKING`;

CREATE TABLE `BOOKING` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '預約編號',
  `PRICE` mediumint NOT NULL COMMENT '單價',
  `STATUS` tinyint NOT NULL COMMENT '預約狀態',
  `STATUS_DATE` timestamp NOT NULL COMMENT '預約狀態更新日期',
  `STATUS_REASON` varchar(128) NOT NULL COMMENT '預約狀態原因',
  `START_DATE` date NOT NULL COMMENT '開始使用日期',
  `END_DATE` date NOT NULL COMMENT '最後使用日期',
  `BOOKING_NOTE` varchar(256) DEFAULT NULL COMMENT '預約備註',
  `CS_BOOKING_NOTE` varchar(256) DEFAULT NULL COMMENT '客服預約備註',
  `CREATE_DATE` timestamp NOT NULL COMMENT '下單日期',
  `FK_BOOKING_MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  `FK_LOCATION_ID` int NOT NULL COMMENT 'FK_場地編號',
  `ACTIVITY_NAME` varchar(64) NOT NULL COMMENT '活動名稱',
  `APPLICANT` varchar(128) NOT NULL COMMENT '申請單位',
  `PRINCIPAL` varchar(45) NOT NULL COMMENT '負責人姓名',
  `GROUP_TYPE` varchar(45) NOT NULL COMMENT '單位類別',
  `ID_PIC` varchar(256) NOT NULL COMMENT '上傳證件',
  `CONTACT_NAME` varchar(128) NOT NULL COMMENT '聯絡人姓名',
  `TEL` varchar(45) NOT NULL COMMENT '聯絡人電話',
  `ACTIVITY_TYPE` varchar(45) NOT NULL COMMENT '活動性質',
  `SEE_TYPE` varchar(45) NOT NULL COMMENT '觀賞性質',
  `OTHER` varchar(128) DEFAULT NULL COMMENT '其他需求',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_BOOKING_MEMBER_ID`),
  KEY `FK_LOCATION_ID_idx` (`FK_LOCATION_ID`),
  CONSTRAINT `FK_BOOKING_MEMBER_ID` FOREIGN KEY (`FK_BOOKING_MEMBER_ID`) REFERENCES `MEMBER` (`ID`),
  CONSTRAINT `FK_LOCATION_ID` FOREIGN KEY (`FK_LOCATION_ID`) REFERENCES `LOCATION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `BOOKING` */

insert  into `BOOKING`(`ID`,`PRICE`,`STATUS`,`STATUS_DATE`,`STATUS_REASON`,`START_DATE`,`END_DATE`,`BOOKING_NOTE`,`CS_BOOKING_NOTE`,`CREATE_DATE`,`FK_BOOKING_MEMBER_ID`,`FK_LOCATION_ID`,`ACTIVITY_NAME`,`APPLICANT`,`PRINCIPAL`,`GROUP_TYPE`,`ID_PIC`,`CONTACT_NAME`,`TEL`,`ACTIVITY_TYPE`,`SEE_TYPE`,`OTHER`) values 
(1,10000,0,'2022-12-25 16:54:25','','2022-12-31','2023-01-07','BOOKING_NOTE','','2022-12-25 16:54:25',5,1,'','','','','','','','','',NULL);

/*Table structure for table `CART` */

DROP TABLE IF EXISTS `CART`;

CREATE TABLE `CART` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '購物車編號',
  `QTY` smallint NOT NULL COMMENT '數量',
  `CART_DATE` timestamp NOT NULL COMMENT '加入購物車日期',
  `FK_CART_MEMBER_ID` int NOT NULL COMMENT '會員編號',
  `FK_CART_PRODUCT_ID` int NOT NULL COMMENT '商品編號',
  `FK_CART_PRODUCT_SPEC_ID` int NOT NULL COMMENT '商品規格編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_CART_MEMBER_ID`),
  KEY `FK_PRODUCT_ID_idx` (`FK_CART_PRODUCT_ID`),
  KEY `FK_CART_PRODUCT_SPEC_SPEC_idx` (`FK_CART_PRODUCT_SPEC_ID`),
  CONSTRAINT `FK_CART_MEMBER_ID` FOREIGN KEY (`FK_CART_MEMBER_ID`) REFERENCES `MEMBER` (`ID`),
  CONSTRAINT `FK_CART_PRODUCT_ID` FOREIGN KEY (`FK_CART_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK_CART_PRODUCT_SPEC_ID` FOREIGN KEY (`FK_CART_PRODUCT_SPEC_ID`) REFERENCES `PRODUCT_SPEC` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

/*Data for the table `CART` */

/*Table structure for table `CONTACT_US` */

DROP TABLE IF EXISTS `CONTACT_US`;

CREATE TABLE `CONTACT_US` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(10) NOT NULL,
  `PHONE` varchar(10) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `FEEDBACK` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `CONTACT_US` */

insert  into `CONTACT_US`(`ID`,`NAME`,`PHONE`,`EMAIL`,`FEEDBACK`) values 
(1,'董怡均','0983082095','qwer777889@gmail.com','希望能有超商取貨的功能'),
(3,'董文碩','0989207109','sed77735@gmail.com','希望能提供貨到付款的服務');

/*Table structure for table `COUNTER` */

DROP TABLE IF EXISTS `COUNTER`;

CREATE TABLE `COUNTER` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `POINT` varchar(45) NOT NULL,
  `DATE` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `COUNTER` */

/*Table structure for table `EXPO` */

DROP TABLE IF EXISTS `EXPO`;

CREATE TABLE `EXPO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '展覽編號',
  `TITLE` varchar(128) NOT NULL COMMENT '展覽標題',
  `CONTENT` mediumtext COMMENT '展覽內文',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '展覽主圖',
  `FK_EXPO_PAGE_ID` int NOT NULL COMMENT 'FK_展覽分頁編號',
  `START_DATE` date NOT NULL COMMENT '展覽開始日期',
  `END_DATE` date NOT NULL COMMENT '展覽結束日期',
  `CREATE_DATE` timestamp NOT NULL COMMENT '展覽新增時間',
  `EDIT_DATE` timestamp NOT NULL COMMENT '最後更新日期',
  `ADULT_PRICE` smallint NOT NULL COMMENT '一般票票價',
  `CONC_PRICE` smallint NOT NULL COMMENT '優待票票價 concession',
  `GROUP_PRICE` smallint NOT NULL COMMENT '團體票票價',
  `FK_BOOKING_ID` int DEFAULT NULL COMMENT 'FK_預約編號',
  `TAG1` varchar(12) DEFAULT NULL COMMENT '展演活動標籤(上)',
  `TAG2` varchar(12) DEFAULT NULL COMMENT '展演活動標籤(下)',
  `BANNER_PHOTO` varchar(256) DEFAULT NULL COMMENT '活動內頁BANNER照片路徑',
  `INFO` mediumtext COMMENT '展覽資訊',
  `STATUS` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_EXPO_PAGE_ID`),
  KEY `FK_BOOKING_ID_idx` (`FK_BOOKING_ID`),
  CONSTRAINT `FK_BOOKING_ID` FOREIGN KEY (`FK_BOOKING_ID`) REFERENCES `BOOKING` (`ID`),
  CONSTRAINT `FK_EXPO_PAGE_ID` FOREIGN KEY (`FK_EXPO_PAGE_ID`) REFERENCES `PAGE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

/*Data for the table `EXPO` */

insert  into `EXPO`(`ID`,`TITLE`,`CONTENT`,`MAIN_PHOTO`,`FK_EXPO_PAGE_ID`,`START_DATE`,`END_DATE`,`CREATE_DATE`,`EDIT_DATE`,`ADULT_PRICE`,`CONC_PRICE`,`GROUP_PRICE`,`FK_BOOKING_ID`,`TAG1`,`TAG2`,`BANNER_PHOTO`,`INFO`,`STATUS`) values 
(1,'《Lindsayooo》新興畫家特展','最近在Instagram點擊量爆增粉絲人數達百萬最熱門的新創插畫家Lindsayoo，畫家細膩的筆觸與寫實的作畫風格，短時間快速達到百萬人數訂閱，應許多粉絲留言要求，多次連繫畫家展出活動接洽此次為韶光文創園區特別限定期間展出，千萬不要錯過好機會！限定期間2024.12.01~2024.12.32 ，購票即送限量明信片。','../img/event/event1.png',3,'2023-02-05','2023-02-10','2022-12-26 12:36:13','2023-01-26 20:38:15',300,250,230,NULL,'活動特展','手繪限定油畫','../img/event_detail/banner.png','A',1),
(2,'《國際婚紗展》2023台北國際婚紗展','2023年台北國際婚紗展-櫻の戀人婚禮博覽會，以一站式婚禮體驗帶領即將步入禮堂的新人們一同感受婚紗攝影、喜餅喜宴、婚戒、婚禮小物親自挑選的幸福感！嚴選知名婚禮品牌婚紗攝影菲菲婚紗、婚戒亞立、人氣口碑推薦中西式喜餅~坊坊、洋菓子、詩特莉、小倆口等以上品牌持續增加中。 以最齊全一站式婚禮採購平台享最優惠的價格，提供正在籌劃婚禮的準新人們。','../img/event/event2.png',3,'2023-02-20','2023-02-28','2022-01-23 16:11:25','2022-01-23 16:11:25',150,130,100,NULL,'活動特展','人氣喜餅','../img/event_detail/banner2.png','B',1),
(3,'《崖下的波妞》十周年特展','由吉卜力工作室製作的動畫「崖上的波妞」，今年剛好是10週年。為此，吉卜力週邊專賣店橡子共和國推出了一系列超萌的波妞掌上玩偶，5月中起在日本全國的橡子共和國店面及網路商店販售，6月更計畫加碼推出戲水組合，結合水槍功能還有紗網收納袋。','../img/event/event3.png',3,'2023-03-10','2023-03-15','2022-01-23 16:14:28','2022-01-23 16:14:28',300,250,230,NULL,'吉卜力特展','波妞造型人氣麻糬','../img/event_detail/banner3.png','C',1),
(4,'《新海誠》童話特展','新海誠展從《星之聲》到《你的名字》海外首站特展將於1月26日於台北韶光登場，完整呈現《星之聲》到《你的名字，》六部作品，且完整重現《你的名字》《言葉之庭》《秒速五公分》場景­，並首度公開新海誠親筆訊息、手繪分鏡等珍貴畫面­，喜歡新海城的您千萬不可以錯過！','../img/event/event4.png',3,'2023-03-15','2023-03-25','2022-01-23 16:16:55','2022-01-23 16:16:55',300,250,230,NULL,'電影特展','台灣限定明信片','../img/event_detail/banner4.png','D',1),
(5,'《ヒグチユウコ》台灣限定特展','ヒグチユウコ(Higuchi Yuko)，樋口裕子為居住於日本的專業畫家和繪本作家。曾多次與 GUCCI 等多家公司合作。\n\n2014年出版第一本繪本《迷路的貓》。2018年首度與GUCCI 合作。2019年於東京表參道站附近開設個人的商店/畫廊「ボリス雑貨店(Boris Zakkaten)」，並定期舉辦展覽。目前，「ヒグチユウコCIRCUS (樋口裕子馬戲團)」展正在各大美術館巡迴展覽中。','../img/event/event5.png',3,'2023-03-05','2023-03-15','2022-01-23 16:18:02','2022-01-23 16:18:02',350,300,250,NULL,'插畫特展','台灣限定周邊絲巾','../img/event_detail/banner5.png','A',1),
(6,'《再見梵谷》光影體驗展','首展至今十餘年，巡迴超過70個城市，《再見梵谷-光影體驗展》因應場地環境不斷蛻變，呈現大異其趣而各自精彩的面貌。製作團隊再度大膽突破展覽過去規格，巡迴十多年來首度加入黑色鏡面視覺效果，將三十多座巨幕環繞的視覺饗宴向下延伸，讓觀眾一腳踩進展區瞬間，便宛如陷入梵谷瑰麗迷幻的異境，帶給觀眾截然不同的感官震撼。','../img/event/event6.png',3,'2023-04-01','2023-04-10','2022-01-23 16:22:57','2022-01-23 16:22:57',350,300,250,NULL,'名匠特展','原稿明信片','../img/event_detail/banner8.png','B',1),
(7,'《Game Show》台北國際電玩展','台北國際電玩展在世界的激烈競爭中站穩了腳步。作為全球第一檔及台灣唯一的遊戲展會，我們不畏困難，努力前行，始終走在最前端。面對世界的瞬息萬變，台北國際電玩展自2021年起以雙軌並行方式，舉辦線上暨線下展覽，並推出Taipei Game Show ONLINE，藉由線上節目讓全球注目的大作進行新訊發表，為世界各地的產業人士與玩家帶來全方位最新遊戲體驗。','../img/event/event7.png',3,'2023-04-15','2023-04-18','2022-01-23 16:26:14','2022-01-23 16:26:14',250,230,200,NULL,'國際電玩展','限定紀念品','../img/event_detail/banner6.png','C',1),
(8,'《諸神黃昏》北歐神話特展','即便在北歐神話裡，諸神也並非長生不死。諸神明白所有九個國度的居住者最終全面滅亡。這意味著將會有一場巨人跟諸神之間的最後一戰，且最終會以一場熊熊火焰燃燒毀掉九個國度作為落幕。「諸神的黃昏」（Ragnarok）就是北歐神話預言中的災難日，當不幸之日來臨時，黑狼斯庫爾（Skoll）會吞食太陽，牠的兄弟哈提（Hati）則會吃掉月亮。','../img/event/event8.png',3,'2023-05-05','2023-05-15','2022-01-23 16:29:48','2022-01-23 16:29:48',250,230,200,NULL,'神話特展','神話明信片','../img/event_detail/banner7.png','D',1),
(9,'《流體藝術》暈染雙人流體畫展','流體藝術是一種抽象有趣、創作簡單的的藝術形式，也是一種反傳統筆觸畫出的作品。不需畫筆的你，可以隨心所欲，透過澆灌、旋轉、拖曳、風吹、火烤等方式，使作品能呈現萬種風貌。在操作過程中感受自己的內在宇宙，釋放一切情緒，可以恣意奔放，可以成熟內斂，在沒有框條拘束下的畫布，讓心靈與流動的線條合而為一，呈現獨一無二的自己。','../img/event/event9.png',3,'2023-05-25','2023-05-31','2022-01-23 16:33:21','2022-01-23 16:33:21',250,230,200,NULL,'多媒體特展','限定印章','../img/event_detail/banner9.png','A',1),
(10,'《名窯特展》琺瑯彩瓷特展','當我們看文物時，首先映入眼簾的是它的造型和裝飾紋樣；再進一步思考時，就又想要瞭解相關的時代背景和製作技術。從這個角度看清朝康熙、雍正和乾隆三個時期（1662-1795）的琺瑯彩瓷，除了推薦這是十八世紀最具代表性的瓷器之外，也想透過展覽說明因應彩料的研發與使用，以及主政者三位皇帝對官窯的不同訴求，而形成的三個階段的風格樣式。','../img/event/event10.png',3,'2023-06-01','2023-06-10','2022-01-23 16:37:45','2022-01-23 16:37:45',350,300,250,NULL,'瓷器特展','獨家小瓷器','../img/event_detail/banner10.png','B',1),
(11,'《微縮人生》微型展的奇幻世界','12萬粉絲朝聖的微型展將帶著新作品再次席捲全台，這次是田中老師第二次來台舉辦大型個展，展區主題橫跨自然、冒險、旅行、工作者、運動、家庭等，在炸雞樹下乘涼、飛向切片食物宇宙、在牛仔褲海浪中乘風破浪、進入充滿機會與命運的骰子道路，最後再與愛人在鈕扣花中結為連理，跟著田中達也大師的腳步，看盡、走過人生的所有片段，喜歡微型展的您千萬不能錯過！','../img/event/event11.png',3,'2023-06-15','2023-06-20','2022-01-23 16:42:01','2022-01-23 16:42:01',300,250,230,NULL,'攝影特展','微型紀念品','../img/event_detail/banner11.png','C',1),
(12,'《美食饗味》2023台灣國際美食展','專業分區 完整展出 - 定位鮮明，滿足小眾需求，成就零售未來。\n匯集28國食品展現臺灣與全球特色食品，結合食品加工/包裝機械、包裝材料及餐飲設備，完整呈現食品產業上中下游供應鏈，\n歡迎食品、飯店、餐飲設備及通路商等相關業者預先登錄參觀！','../img/event/event12.png',3,'2023-07-01','2023-07-15','2022-01-23 16:57:29','2022-01-23 16:57:29',280,250,230,NULL,'美食特展','各國美食','../img/event_detail/banner12.png','D',1);

/*Table structure for table `INFO` */

DROP TABLE IF EXISTS `INFO`;

CREATE TABLE `INFO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息編號',
  `TITLE` varchar(100) NOT NULL COMMENT '消息標題',
  `CONTENT` mediumtext COMMENT '消息內文',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '消息主圖',
  `STATUS` tinyint(1) NOT NULL COMMENT '消息頁狀態',
  `CREATE_DATE` timestamp NOT NULL COMMENT '新增日期',
  `EDIT_DATE` timestamp NOT NULL COMMENT '最後編輯日期',
  `FK_INFO_PAGE_ID` int NOT NULL COMMENT 'FK_消息頁編號',
  `FK_INFO_TYPE_ID` int NOT NULL COMMENT 'FK_消息頁類型編號',
  `START` varchar(10) NOT NULL,
  `END` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_INFO_PAGE_ID`),
  KEY `FK_INFO_TYPE_ID_idx` (`FK_INFO_TYPE_ID`),
  CONSTRAINT `FK_INFO_PAGE_ID` FOREIGN KEY (`FK_INFO_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_INFO_TYPE_ID` FOREIGN KEY (`FK_INFO_TYPE_ID`) REFERENCES `INFO_TYPE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

/*Data for the table `INFO` */

insert  into `INFO`(`ID`,`TITLE`,`CONTENT`,`MAIN_PHOTO`,`STATUS`,`CREATE_DATE`,`EDIT_DATE`,`FK_INFO_PAGE_ID`,`FK_INFO_TYPE_ID`,`START`,`END`) values 
(1,'漫畫展延期至3/30','因應政府防疫政策，園區配合政府提供場地作為疫苗施打場地。日期與3/23漫畫展衝突，因此漫畫展順延至3/30，並贈送已購票民眾一份小禮物做為補償，如造成不便敬請見諒。','../img/new/news_detail_01.png',1,'2023-01-23 14:38:07','2023-01-23 14:38:07',1,2,'2023-02-01','2023-02-28'),
(2,'2023春節園區商家營業時間一覽表','2023 春節連假準備開始！祝大家新的一年鴻兔大展、揚眉兔氣，歡迎全家大小新年期間，一起來韶光走春、熱鬧過新年，韶光文創園區祝大家新年快樂！','../img/new/news_detail_02.png',1,'2023-01-23 14:44:07','2023-01-23 14:44:07',1,1,'2023-02-01','2023-02-28'),
(3,'焙可先生營業時間延長至22:00','為配合春節特別活動，1/21至1/24，焙可先生延長營業時間至22:00。期間還有神秘嘉賓現身，等你一起來發現！','../img/new/news_detail_03.png',1,'2023-01-23 14:46:09','2023-01-23 14:46:09',1,3,'2023-02-01','2023-02-28'),
(4,'官方LINE好友募集中','✱ 韶光文創園區｜LINE好友募集中 ✱ ❥第一手展覽活動資訊 ❥特色文創店家一把抓 ❥韶光園區指引不迷路 韶光懶人別錯過，每周定期更新，帶你一手掌握園區大小事！','../img/new/news_detail_04.png',1,'2023-01-23 14:47:12','2023-01-23 14:47:12',1,1,'2023-02-01','2023-02-28'),
(5,'2023點讀韶光封面插畫徵集','為延續韶光文創園區「鼓勵原創」的精神，「點讀韶光」自2022改版以來，便保持封面版位開放，讓創意從實體空間延伸到平面紙本，提供給創作者多樣化的舞台。','../img/new/news_detail_05.png',1,'2023-01-23 15:22:47','2023-01-23 15:22:47',1,1,'2023-02-01','2023-02-28'),
(6,'2023 韶光志工大募集！！！','韶光園區如一山有四季般，常有不同的活動在一整年間為此處帶來不同的樣貌；無庸置疑地，志工就是穿梭在各山區的韶光精靈們，是他們讓山上的樹木更欣欣向榮，是他們讓大家更想親近、更想了解這個地方。那您呢？您也想加入志工，一起成為拼湊韶光記憶的精靈嗎？現在機會來了！韶光文創園區志工熱烈招募中！','../img/new/news_detail_06.png',1,'2023-01-24 09:22:47','2023-01-24 09:22:47',1,1,'2023-02-01','2023-02-28'),
(7,'TibaMe學生大膽創意無邊際','是否常常想要享受歡樂的氣氛搭配一瓶啤酒的美妙，但派對上震耳欲聾的聲音又讓你感到不舒服呢？由TibaMe學生舉辦的【那邊看起來好蝦！】開幕派對會讓你耳目一新。這是一個由靜音派對衍生出的派對形式，觀眾到場後只需連上直播網頁並插上耳機，就可以開始享受一場舒適又充滿科技感的Party！靜音派對起源於倫敦，而後風靡於各大國際城市，不會干擾到左鄰右舍，可以讓本來禁止撥放音樂的地方，搖身一變成了眾人狂歡的場所。當連上直播網頁，聽見現場即時播送的聲音時，現實與網路虛擬的模糊交界，給予觀眾一場城市中前所未有的奇幻體驗。 整場開幕活動開放、有趣的表演，讓新媒系的學生們在台上大展身手表演現場聲響創作，將現場氣氛嗨到最高點。活動亦請到專業DJ讓現場充滿Funk/Soul、Jazz等音樂美好氣氛，享受當下的同時，音樂演出的個人化似乎為所有參與開幕的人開闢了專屬小小天地。','../img/new/news_detail_07.png',1,'2023-01-24 10:47:59','2023-01-24 10:47:59',1,2,'2023-02-01','2023-02-28'),
(8,'今年朗讀節，我們一起帶著專題上街頭','今年朗讀節一共有三大特色五大亮點！由知名文化評論家擔任總策劃，青鳥文化制作擔任主要企劃統籌，邀請到五月天的瑪莎、美學大師蔣勳、金曲台語男歌手謝銘佑、導演吳念真與三金設計師方序中，三地接續以文學、設計、建築、音樂、戲劇、電影接力。朗讀的形式從經典講座結合鋼琴、傳統布袋戲到叛逆搖滾樂，多語朗讀的影視新創再回到民謠。更邀請來自日本的《革命青春：高校1968》作者四方田犬彥老師擔任國際講座嘉賓。','../img/new/news_detail_08.png',1,'2023-01-24 11:08:01','2023-01-24 11:08:01',1,2,'2023-02-01','2023-02-28'),
(9,'崖下的波妞》十周年特展','為紀念動畫推出十週年，除介紹動畫重要角色外，展區內將重現眾多經典場景，得以親身感受作品的獨特魅力，更有首次在台曝光的動畫複製原稿展出！','../img/new/news_detail_09.png',1,'2023-01-24 13:22:07','2023-01-24 13:22:07',1,2,'2023-02-01','2023-02-28'),
(10,'02.01-02.15 園區防疫管理措施','韶光文創園區將配合實施相關防疫指引，並遵循文化部展覽場館防疫管理辦法，落實總人流管制及實聯制登記。','../img/new/news_detail_10.png',1,'2023-01-24 14:44:27','2023-01-24 14:44:27',1,3,'2023-02-01','2023-02-28'),
(11,'藝FUN券使用大補帖！ 全家一起遊韶光','你也是藝Fun券幸運中獎的幸運兒嗎？ 不論你是想逛展覽、買文創商品、看電影、吃美食，在全園區都可以使用喔。為了回饋給韶光的朋友們更多好康，現在單筆消費滿額還可以享現金現抵優惠，滿1000現抵100、滿2000現抵200！ 快一起來看看，在韶光文創園區怎麼花最划算？ ','../img/new/news_detail_11.png',1,'2023-01-25 10:31:58','2023-01-25 10:31:58',1,3,'2023-02-01','2023-02-28'),
(12,'Wapple PLUS 台北旅遊情報導覽特集','台北旅遊情報導覽特集出爐了！您喜歡去台北旅遊嗎？想不到要去哪些景點朝聖嗎？快點來看Wapple PLUS 台北旅遊情報導覽特集就對了，好吃、好玩、好逛帶您深入台北地區，體驗不一樣的旅遊滋味。詳細請查閱Wapple PLUS 台北：http://ec.shop.mapple.co.jp/shopdetail/0000000036999/','../img/new/news_detail_12.png',1,'2023-01-25 12:08:23','2023-01-25 12:08:23',1,3,'2023-02-01','2023-02-28'),
(13,'《2023韶光畢業季》獲選名單公告','本屆獲選校系單位畢展檔期空間如下(*以下依場館空間排序)\r 異動說明：原獲選《國立臺灣藝術大學圖文傳播藝術學系》因場館檔期異動調整，由第一優先遞補單位《世新大學廣播電視電影學系》獲選《C區》檔期場地。獲選單位均已發信通知，後續由專案窗口聯繫接洽場勘與簽約作業，如有問題請來信詢問graduate@goodtime.com或致電詢問(02)2358-1914#534李小姐。','../img/new/news_detail_13.png',1,'2023-01-27 20:41:07','2023-01-27 20:41:07',1,1,'2023-02-01','2023-02-28'),
(14,'下一站，就是夢想！ 2023肖年頭家春季徵件','距離夢想只剩下一步的距離！即日起至2/20到expo官網投遞報名資料，第一波入選名單即可晉級參加由expo、韶光文創園區舉辦之春季評選會，經由業界專業評審及市集實測，最終優勝品牌將有機會進駐expo文創平台、韶光快閃店計畫。誠品生活expo透過公開徵件與多元評選，發掘精彩的微型文創品牌，展現台灣設計的能量與無限可能，讓好夢想、好設計被看見！','../img/new/news_detail_14.png',1,'2023-01-27 20:42:57','2023-01-27 20:42:57',1,2,'2023-02-01','2023-02-28'),
(15,'【韶光 x Uber eat】2/1-2/28 美食優惠主打星','【 2月優惠主打星活動⭐】【Ubereats X 焙可先生】優惠活動！凡單筆消費折扣後金額滿400元即贈水果冷泡茶乙瓶\r ，活動時間：2023/2/1-2/28，喜歡焙可先生的您千萬不能錯過！*主辦單位保有最終修改、變更、活動解釋及取消活動之權利，若有相關異動，將公告於官網上。','../img/new/news_detail_15.png',1,'2023-01-27 20:48:23','2023-01-27 20:48:23',1,3,'2023-02-01','2023-02-28');

/*Table structure for table `INFO_TYPE` */

DROP TABLE IF EXISTS `INFO_TYPE`;

CREATE TABLE `INFO_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '消息類型',
  `DESC` varchar(100) NOT NULL COMMENT '消息類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `INFO_TYPE` */

insert  into `INFO_TYPE`(`ID`,`DESC`) values 
(1,'園區公告'),
(2,'展演資訊'),
(3,'其他消息');

/*Table structure for table `LOCATION` */

DROP TABLE IF EXISTS `LOCATION`;

CREATE TABLE `LOCATION` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '場地編號',
  `NAME` varchar(45) NOT NULL COMMENT '場地名稱',
  `PRICE` mediumint NOT NULL COMMENT '出租訂價',
  `DESC` varchar(256) NOT NULL COMMENT '場地描述',
  `DEVICE` varchar(256) NOT NULL COMMENT '場地設備',
  `RULE` varchar(256) NOT NULL COMMENT '場地規範',
  `AREA` varchar(128) NOT NULL COMMENT '場地空間',
  `MAIN_PHOTO` varchar(256) NOT NULL COMMENT '場地主圖',
  `LOCATED` varchar(64) NOT NULL COMMENT '場地位置',
  `STATUS` tinyint(1) NOT NULL COMMENT '開放預約狀態',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

/*Data for the table `LOCATION` */

insert  into `LOCATION`(`ID`,`NAME`,`PRICE`,`DESC`,`DEVICE`,`RULE`,`AREA`,`MAIN_PHOTO`,`LOCATED`,`STATUS`) values 
(1,'A館',70000,'本場地約可容納100~200人，適合大型記者會、新品發表會、展覽活動、頒獎典禮、國際展演會場、教育訓練會場、大型講座等使用。','基礎照明、空調、給排水','園區嚴禁使用任何火具，場地租借費用不含任何場地清潔，結束後需自行復原。','74坪','{\"0\": \"場地主圖\"}','由韶光文創園區大門進來後左轉第一間倉庫即為A館',1),
(2,'B館',60000,'本場地約可容納100~120人，適合產品發表會、展覽活動、講座等使用。','基礎照明、空調、給排水','園區嚴禁使用任何火具，場地租借費用不含任何場地清潔，結束後需自行復原。','60坪','{\"0\": \"場地主圖\"}','由韶光文創園區大門進來後左轉第二間倉庫即為B館',1),
(3,'C館',80000,'本場地約可容納150~250人，適合記者會、座談會、小型研習會、教育訓練等使用。','基礎照明、空調、給排水','園區嚴禁使用任何火具，場地租借費用不含任何場地清潔，結束後需自行復原。','120坪','{\"0\": \"場地主圖\"}','由韶光文創園區大門進來後左轉第三間倉庫即為C館',1),
(4,'D館',90000,'任何大型藝文演出、演唱會、發表會、展覽、車展等均可在此辦理。','基礎照明、空調、給排水','園區嚴禁使用任何火具，場地租借費用不含任何場地清潔，結束後需自行復原。','299坪','{\"0\": \"場地主圖\"}','由韶光文創園區大門進來後左轉第四間倉庫即為D館',1),
(5,'E區(文創大街)',50000,'適合小型快閃店或市集活動等使用，禁止使用明火，戶外空間請避免餐飲調理或現場食品包裝。','基礎用電或自備發電機','園區嚴禁使用任何火具，場地租借費用不含任何場地清潔，結束後需自行復原。','全區租用(60*6米)','{\"0\": \"場地主圖\"}','位於韶光文創園區與台北文創大樓交界處',1),
(6,'周邊攤位',25000,'適合市集活動，禁止使用明火。','無提供電力，可自備發電機','園區嚴禁使用任何火具，場地租借費用不含任何場地清潔，結束後需自行復原。','長60公尺、寬3公尺','{\"0\": \"場地主圖\"}','緊靠園區生態池湖畔',1);

/*Table structure for table `MEMBER` */

DROP TABLE IF EXISTS `MEMBER`;

CREATE TABLE `MEMBER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `USERNAME` varchar(100) NOT NULL COMMENT '會員名稱',
  `EMAIL` varchar(100) NOT NULL COMMENT '會員電郵',
  `PASSWORD` varchar(45) NOT NULL COMMENT '會員密碼',
  `PHONE` varchar(10) NOT NULL COMMENT '會員電話',
  `VERIFY` tinyint(1) NOT NULL DEFAULT '1' COMMENT '會員狀態',
  `FK_ROLE_ID` int NOT NULL DEFAULT '2' COMMENT '會員權限代碼',
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_ID_idx` (`FK_ROLE_ID`),
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`FK_ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;

/*Data for the table `MEMBER` */

insert  into `MEMBER`(`ID`,`USERNAME`,`EMAIL`,`PASSWORD`,`PHONE`,`VERIFY`,`FK_ROLE_ID`) values 
(1,'admin','admin@goodtime.com','g3_@dmin','0987654321',1,1),
(5,'member1','member@goodtime.com','member1','0987654321',1,2),
(7,'member2','member2@goodtime.com','member2','0987654321',1,2),
(38,'member3','member3@goodtime.com','member3','0987654321',1,2),
(39,'董怡均','qwer777889@gmail.com','sed77789','0983082095',1,2),
(48,'王淑英','dskfhgkjdsf@gmail.com','sed74152','0987654321',1,2),
(49,'浩文','gavin@goodtime.com','123456','0909090909',1,2),
(50,'思平','andy@goodtime.com','123456','0909090909',1,2),
(51,'全穀','bryan@goodtime.com','123456','0909090909',1,2),
(52,'金玲','chin@goodtime.com','123456','0909009009',1,2),
(53,'子瑢','vivien@goodtime.com','123456','0909090909',1,2);

/*Table structure for table `PAGE` */

DROP TABLE IF EXISTS `PAGE`;

CREATE TABLE `PAGE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '頁面編號',
  `TYPE` varchar(45) NOT NULL COMMENT '頁面類型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PAGE` */

insert  into `PAGE`(`ID`,`TYPE`) values 
(1,'消息頁'),
(2,'商品頁'),
(3,'展覽頁');

/*Table structure for table `PASSPORT` */

DROP TABLE IF EXISTS `PASSPORT`;

CREATE TABLE `PASSPORT` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '門票護照編號',
  `EXPO_ID` int NOT NULL COMMENT '展覽編號',
  `UNIT_PRICE` smallint NOT NULL COMMENT '門票單價',
  `QTY` tinyint NOT NULL COMMENT '下單數量',
  `PO_ID` int NOT NULL COMMENT 'FK_訂單編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PASSPORT_PO_ID_idx` (`PO_ID`),
  CONSTRAINT `FK_PASSPORT_PO_ID` FOREIGN KEY (`PO_ID`) REFERENCES `PO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='門票訂單';

/*Data for the table `PASSPORT` */

/*Table structure for table `PO` */

DROP TABLE IF EXISTS `PO`;

CREATE TABLE `PO` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主單編號',
  `FREIGHT` smallint NOT NULL COMMENT '運費',
  `ETD` date NOT NULL,
  `SHIP_DATE` date DEFAULT NULL,
  `BL` varchar(45) DEFAULT NULL,
  `STATUS` tinyint NOT NULL,
  `STATUS_DATE` timestamp NOT NULL,
  `STATUS_REASON` varchar(128) DEFAULT NULL,
  `PO_NOTE` varchar(256) DEFAULT NULL,
  `CS_PO_NOTE` varchar(256) DEFAULT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `FK_PO_MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  PRIMARY KEY (`ID`),
  KEY `FK_MEMBER_ID_idx` (`FK_PO_MEMBER_ID`),
  CONSTRAINT `FK_PO_MEMBER_ID` FOREIGN KEY (`FK_PO_MEMBER_ID`) REFERENCES `MEMBER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PO` */

insert  into `PO`(`ID`,`FREIGHT`,`ETD`,`SHIP_DATE`,`BL`,`STATUS`,`STATUS_DATE`,`STATUS_REASON`,`PO_NOTE`,`CS_PO_NOTE`,`CREATE_DATE`,`FK_PO_MEMBER_ID`) values 
(1,60,'2022-12-31',NULL,NULL,1,'2022-12-26 11:43:21',NULL,NULL,NULL,'2022-12-26 11:43:21',5),
(2,60,'2022-12-31',NULL,NULL,2,'2023-01-30 11:43:21',NULL,NULL,NULL,'2023-01-30 11:43:21',5),
(3,60,'2023-01-30',NULL,NULL,1,'2023-01-30 11:43:21',NULL,NULL,NULL,'2023-01-30 11:43:21',5);

/*Table structure for table `PO_DETAIL` */

DROP TABLE IF EXISTS `PO_DETAIL`;

CREATE TABLE `PO_DETAIL` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '訂單編號',
  `FK_PO_DETAIL_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  `UNIT_PRICE` mediumint NOT NULL COMMENT '單價',
  `QTY` tinyint NOT NULL COMMENT '下單數量',
  `FK_PO_DETAIL_PO_ID` int NOT NULL COMMENT 'FK_訂單_訂單編號',
  `FK_PO_PRODUCT_SPEC_ID` int NOT NULL COMMENT 'FK_商品規格編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_ID_idx` (`FK_PO_DETAIL_PRODUCT_ID`),
  KEY `FK_PO_ID_idx` (`FK_PO_DETAIL_PO_ID`),
  KEY `FK_PO_PRODUCT_SPEC_ID_idx` (`FK_PO_PRODUCT_SPEC_ID`),
  CONSTRAINT `FK_PO_DETAIL_PO_ID` FOREIGN KEY (`FK_PO_DETAIL_PO_ID`) REFERENCES `PO` (`ID`),
  CONSTRAINT `FK_PO_DETAIL_PRODUCT_ID` FOREIGN KEY (`FK_PO_DETAIL_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK_PO_PRODUCT_SPEC_ID` FOREIGN KEY (`FK_PO_PRODUCT_SPEC_ID`) REFERENCES `PRODUCT_SPEC` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PO_DETAIL` */

insert  into `PO_DETAIL`(`ID`,`FK_PO_DETAIL_PRODUCT_ID`,`UNIT_PRICE`,`QTY`,`FK_PO_DETAIL_PO_ID`,`FK_PO_PRODUCT_SPEC_ID`) values 
(2,1,960,3,1,4),
(3,1,960,1,1,5);

/*Table structure for table `PRODUCT` */

DROP TABLE IF EXISTS `PRODUCT`;

CREATE TABLE `PRODUCT` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品編號',
  `PRODUCT_NAME` varchar(100) NOT NULL COMMENT '商品名稱',
  `STATUS` tinyint(1) NOT NULL COMMENT '商品頁狀態',
  `HIDE` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隱藏賣場',
  `PRICE` mediumint NOT NULL DEFAULT '0' COMMENT '商品單價',
  `DESC` mediumtext COMMENT '商品描述',
  `MAIN_PHOTO` varchar(256) DEFAULT NULL COMMENT '商品主圖',
  `STOCK_QTY` smallint NOT NULL COMMENT '庫存數量',
  `MAX_QTY` tinyint NOT NULL COMMENT '最大下單數量',
  `CREATE_DATE` timestamp NOT NULL COMMENT '商品新增日期',
  `EDIT_DATE` timestamp NOT NULL COMMENT '商品編輯日期',
  `FK_PRODUCT_PAGE_ID` int NOT NULL COMMENT 'FK_頁面編號',
  `FK_EXPO_ID` int NOT NULL COMMENT 'FK_供應商編號',
  `FK_PRODUCT_TYPE_ID` int NOT NULL COMMENT 'FK_商品類型編號',
  `SPEC` mediumtext COMMENT '規格',
  `NOTE` mediumtext COMMENT '備註',
  `FEATURED` varchar(256) NOT NULL COMMENT '商品賣點',
  `START` varchar(10) NOT NULL COMMENT '開始銷售日',
  `END` varchar(10) NOT NULL COMMENT '結束銷售日',
  `TAG1` varchar(45) DEFAULT NULL,
  `TAG2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PAGE_ID_idx` (`FK_PRODUCT_TYPE_ID`),
  KEY `FK_PAGE_ID_idx1` (`FK_PRODUCT_PAGE_ID`),
  KEY `FK_EXPO_ID_idx` (`FK_EXPO_ID`),
  CONSTRAINT `FK_EXPO_ID` FOREIGN KEY (`FK_EXPO_ID`) REFERENCES `EXPO` (`ID`),
  CONSTRAINT `FK_PRODUCT_PAGE_ID` FOREIGN KEY (`FK_PRODUCT_PAGE_ID`) REFERENCES `PAGE` (`ID`),
  CONSTRAINT `FK_PRODUCT_TYPE_ID` FOREIGN KEY (`FK_PRODUCT_TYPE_ID`) REFERENCES `PRODUCT_TYPE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PRODUCT` */

insert  into `PRODUCT`(`ID`,`PRODUCT_NAME`,`STATUS`,`HIDE`,`PRICE`,`DESC`,`MAIN_PHOTO`,`STOCK_QTY`,`MAX_QTY`,`CREATE_DATE`,`EDIT_DATE`,`FK_PRODUCT_PAGE_ID`,`FK_EXPO_ID`,`FK_PRODUCT_TYPE_ID`,`SPEC`,`NOTE`,`FEATURED`,`START`,`END`,`TAG1`,`TAG2`) values 
(1,'蒙娜麗莎貓貓掛畫',1,1,960,'文藝復興時期畫家列奧納多·達芬奇所繪的一幅肖像畫與其代表作。<br>\n加上愛貓的作家為畫作添加了創意理念<br>\n讓生活充滿有趣的色彩。','../img/product_detail/item17.png',9999,10,'2022-12-25 17:13:20','2022-12-25 17:13:20',2,1,1,'產品名稱：蒙娜麗莎貓掛畫\r<br>木框原料︰進口松木實木內框\r<br>專業畫布︰防水防皺專業油畫布\r<br>產品尺寸：(小)30x30cm  (中)40x50cm  (大)50x70cm','尺寸','進口松木實木內框\n,防水防皺專業油畫布\n,畫家限定少數款','2022/12/01','2046/12/31','展覽限定','文創商品'),
(2,'自訂款迷你保溫瓶',1,1,590,'輕巧便攜：<br />\n                迷你保溫瓶容量為350ml，重量僅190g，無論去到哪，都可以輕鬆攜帶。<br />\n                <br>\n                長效保溫鎖冷：<br />\n                無論冬天還是夏天，冷水還是熱水，都可以保持長效保溫和保冷。<br />\n                <br>\n                SUS 304不鏽鋼安全材質：<br />\n                採用SUS\n                304食品級不鏽鋼材質，抗氧化、耐腐蝕、易清潔，讓您輕鬆健康飲水。<br />\n                <br>\n                真空技術：<br />\n                採用不鏽鋼真空技術，有效阻隔溫度傳導，打造保溫鎖冷效果。<br />\n                <br>\n                保溫測試：<br />\n                在20°C±5°C的室內溫度下，將100°C的水倒入至密封蓋下端。<br />\n                當水溫降至95°C±1°C時，立即拴緊杯蓋。6小時後杯內水溫不低於58℃。<br />\n                <br>\n                保冷測試：<br />\n                在20°C±5℃的室內溫度下，將冰水倒入至密封蓋的下端。<br />\n                當水溫升至4℃±1℃時，拴緊蓋子。6小時後杯內水溫不高於12°C。','../img/product_detail/item01.png',9999,10,'2023-01-08 10:58:00','2023-01-08 10:58:00',2,1,2,'保溫效率：高於58°C（6小時）<br />冷藏效率：低於12°C（6小時）<br /> ','顏色','採用SUS304不鏽鋼材質，讓你安心飲用,小巧便攜，重量僅200克, 長效保溫保冷','2022/12/01','2046/12/31','韶光限定','韶光限定'),
(3,'貓貓洗頭掛畫',1,1,900,'文藝復興時期畫家列奧納多·達芬奇所繪的一幅肖像畫與其代表作。<br>加上愛貓的作家為畫作添加了創意理念<br>讓生活充滿有趣的色彩。<br>產品名稱：貓貓洗頭掛畫<br>木框原料:進口松木實木內框<br>專業畫布:防水防皺專業油畫布<br>產品尺寸：(小)30x30cm  (中)40x50cm  (大)50x70cm<br>商品可能因每台電腦或手機螢幕產生色差，敬請見諒<br>','../img/product_detail/item02.png',9999,10,'2023-01-23 17:01:22','2023-01-23 17:01:22',2,1,1,'木框原料︰進口松木實木內框<br>專業畫布︰防水防皺專業油畫布<br>產品尺寸：(小)30x30cm (中)40x50cm (大)50x70cm','尺寸','進口松木實木內框 ,防水防皺專業油畫布 ,畫家限定少數款','2022/12/01','2046/12/31','展覽限定','日本畫展'),
(4,'惡夢去去捕夢網',1,1,450,'捕夢網是印地安人的幸運物，古老印第安人相傳捕夢網可以將惡夢從網中捕獲，將好夢透過羽毛下滑到夢境之內。傳統上當有小朋友出世時，部落裡既長輩就會送一個給小朋友，寓意一個衷心的祝福,並希望可以幫小朋友將惡夢過濾，只留下美夢，健康快樂成長。<br>由於吊飾為天然水晶，所以形狀大小會不一，每個石子也是獨一無二。<br>','../img/product_detail/item03.png',9999,10,'2023-01-23 17:10:57','2023-01-23 17:10:57',2,1,2,'產品名稱：惡夢去去捕夢網<br>材質：毛冷/麻線、棉線、天然水晶、羽毛、木珠<br>產品尺寸：(小)27cm (中)30cm (大)32cm','尺寸','人手製造每個都獨一無二, 歡迎客製化訂造, 印第安的祝福文化','2022/12/01','2046/12/31','展覽限定','文創商品'),
(5,'手繪限定油畫',1,1,2000,'油畫風格採用較為寫實的畫風，著重光影的變化，以及顏色的堆疊。<br>採用專業級油畫顏料與棉麻帆布畫框。<br>基於不同電腦設備的頻幕解析與顏色校準因素，作品可能會有些許色差。<br>所有畫作都會以雙重加固包裝，提供最大的運輸防護保障。<br>','../img/product_detail/item04.png',9999,10,'2023-01-23 17:30:16','2023-01-23 17:30:16',2,1,1,'產品名稱：手繪限定油畫<br>畫框材質：棉麻帆布<br>產品尺寸：(小)30x30cm (中)40x50cm (大)50x70cm','尺寸','純手工厚油肌理畫, 現代丙烯裝飾畫, 採用高端亞麻布料','2022/12/01','2046/12/31','展覽限定','《Lindsayooo》新興插畫家展'),
(6,'畫家限定簽名',1,1,5600,'正版現貨，日本知名畫家限定款簽名卡<br>可用相框裱起來做家居擺設','../img/product_detail/item05.png',9999,10,'2023-01-23 20:13:47','2023-01-23 20:13:47',2,1,1,'產品名稱：畫家限定簽名<br>產品尺寸：(小)30x30cm (中)40x50cm (大)50x70cm','尺寸','日本知名畫家簽名, 值得珍藏, 正版現貨 ','2023/01/21','2046/12/31','展覽限定','日本畫展'),
(7,'格魯特時鐘',1,1,560,'由原木拼接製作而成，有別於以往的整片原木裁切製作，原木拼接雖製程更繁複，但較能持續提供作品給喜愛此風格的客人，所以大面積的作品我們改以原木拼接的方式繼續開發新產品。<br>','../img/product_detail/item06.png',9999,10,'2023-01-26 11:41:29','2023-01-26 11:41:29',2,1,2,'產品名稱：格魯特時鐘<br>材質：北美硬楓木、黑胡桃木<br>尺寸：(小)20cm (中)26cm (大)30cm<br>包裝：牛皮瓦楞紙盒包裝、瓦楞紙盒寄送','尺寸','北美硬楓木原木拼接, 天然色澤與紋路, 手工塗佈德國百年 OSMO 天然環保漆','2023/01/21','2046/12/31','展覽限定','文創商品'),
(8,'手繪限量明信片組',1,1,990,'不知道要選哪幾張明信片而感到煩惱嗎？<br>沒關係，嚴選經典圖文搭配日常感悟，每張不重複，一起拼湊三十種生活的味道吧！','../img/product_detail/item07.png',9999,10,'2023-01-26 11:45:57','2023-01-26 11:45:57',2,1,1,'產品名稱：手繪限量明信片組<br>單張卡片內容物： 牛皮紙信封X1 單面無法對折的卡片X1 塑膠套X1<br>卡片的尺寸：15 x 10.5(cm)<br>材質：象牙厚磅<br>顏色：黑/白/灰','顏色','30張不嫌少, 每張皆附牛皮信封, 經典圖文搭配 ','2023/01/21','2046/12/31','展覽限定','日本畫展'),
(9,'手繪限量明信片',1,1,560,'正版現貨，日本超人氣畫家限定手繪明信片<br>使用250磅義大利高級進口紙張，質感絕佳，非常易於書寫。<br>正面全彩印刷，背面單色印刷，書寫範圍大。','../img/product_detail/item08.png',9999,10,'2023-01-26 11:52:42','2023-01-26 11:52:42',2,1,1,'產品名稱：手繪限量明信片組<br>尺寸：10 x 15cm (明信片尺寸)<br>材質：300厚磅水彩紙<br>組合：8張/24張/100張','組合','日本超高人氣畫家手繪, 臺灣場獨家限定款, 適合不同場合的萬用卡片','2023/01/21','2046/12/31','展覽限定','《Lindsayooo》新興插畫家展'),
(10,'限量手繪絲巾',1,1,1600,'雪紡大方絲巾大小恰到好處的方巾，除了作為秋冬保暖圍巾方巾使用，更是從來不退流行的時尚髮飾髮帶，或者包包綁帶！<br>\r ','../img/product_detail/item09.png',9999,10,'2023-01-26 11:55:58','2023-01-26 11:55:58',2,1,2,'產品名稱：限量手繪絲巾<br>產品尺寸：(小)30 x 30cm (中)50 x 50cm (大)87 x 87cm<br>產品材質：100% 聚酯纖維 (強撚絲巾布)<br>洗滌方式：請用冷水手洗。避免烘乾、長時間浸泡及曝曬。<br>產品外盒包裝：25 x 25 x 0.5cm 牛皮紙盒','尺寸','雪紡大方絲巾, 秋冬保暖圍巾方巾, 時尚髮飾or包包綁帶','2023/01/21','2046/12/31','展覽限定','《ヒグチユウコ》台灣限定特展'),
(11,'水彩風手繪小卡組',1,1,560,'原創手繪水彩插畫、文創手工和純藝術<br>人手繪畫在水彩紙上，再印製小卡<br>縱使世界很殘酷，但希望看我作品的人，都能感受到藝術的一點溫柔<br>','../img/product_detail/item10.png',9999,10,'2023-01-26 12:00:11','2023-01-26 12:00:11',2,1,1,'產品名稱：水彩風手繪小卡組<br>尺寸：約 6.5 X 9cm<br>材質：水彩紙<br>款式：聖誕/星空/空色<br>共 3 款，一包 12 張','款式','原創手繪水彩插畫, 文創手工和純藝術, 手繪水彩系列','2023/01/21','2046/12/31','展覽限定','日本畫展'),
(12,'自訂手工餐盤',1,1,700,'讓生活中的用品，改變一點點造型、改變一點點色彩、改變一點點質感，都可以讓生活變得不一樣。<br>手作陶瓷以簡約的造型為主，加上手感的疊加，再加上簡單卻又不失變化的霧面釉色，呈現出低調且靜謐的的質感與氛圍。希望透過簡單、低調的作品，帶領大家進入安靜的生活氛圍，在這個屬於自己的時空，細細品味每一個生活物件，發掘創作者在作品當中所設計的細節與巧思。<br>每一件手作陶瓷都是獨一無二的，會因為造型的手感、釉藥的厚薄、窯爐的溫度以及氣氛等因素，而讓每一件手作陶瓷成為獨一無二的產品。且此款釉藥具有霧面、開片紋路的特性，會隨著時間留下使用痕跡，變化成屬於使用者、且獨一無二的作品。','../img/product_detail/item11.png',9999,10,'2023-01-26 12:04:28','2023-01-26 12:04:28',2,1,2,'產品名稱：自訂手工餐盤<br>尺寸：寬約20公分，高約4公分<br>材質：陶瓷<br>產地：臺灣/手工製作<br>顏色：黑/白/綠','顏色','皆為手工拉坯製作, 使用霧面釉色呈現質感, 獨一無二的手作陶瓷','2023/01/21','2046/12/31','韶光限定','韶光限定'),
(13,'限定手繡毛巾',1,1,560,'正面用上日本紗巾布，配搭純色純綿布，色彩鮮明。 後面使用柔軟舒適的短毛巾布，可以擦汗/口水，一巾多用。<br> \r 於純綿布的位置繡上不同字句或名字，讓它更有獨特感。 <br>\r 在手巾側面用不同材質的織帶/絲帶縫製小標籤，可以給Baby觸摸，有利觸覺及視覺等感官。','../img/product_detail/item12.png',9999,10,'2023-01-26 12:08:47','2023-01-26 12:08:47',2,1,2,'產品名稱：限定手繡毛巾<br>尺寸：長35x寬35cm<br>材質：珊瑚絨<br>不可用於：烘乾機、熨斗<br>產地：臺灣<br>顏色：白色/米色/藍色<br>※尺寸皆為人工測量，誤差±2cm屬正常範圍','顏色','珊瑚絨材質, 超細纖維質地, 好收納方便取用','2023/01/21','2046/12/31','韶光限定','韶光限定'),
(14,'文青手帳本',1,1,400,'手帳，是生活裡的沉浸式書寫。 <br>忙碌起來，很有成就感， 不忙碌的日子裡，也很有儀式感， 我們可以從中學會探險、相遇、分離。<br>手帳，是記下生活裡品嘗的溫度。<br>我不要只是簡單和清澈的鹽系，<br>偶爾也想要加點糖，一點點甜就好。<br>能夠亮起自己的世界就好。','../img/product_detail/item13.png',9999,10,'2023-01-26 12:12:54','2023-01-26 12:12:54',2,1,2,'產品名稱：文青手帳本<br>尺寸：148 x 210mm<br>顏色：粉色/米色/綠色<br>裝訂：裸背穿線膠裝、180度完全攤平<br>書衣：親夫合成皮革，防潑水，保護內容<br>內頁：日本巴川紙TOMOERIVER 68N<br>','顏色','書皮燙金質感大提升, 月期許&月總結&每月計畫表, 插畫搭配金句是美的日常！','2023/01/21','2046/12/31','韶光限定','韶光限定'),
(15,'創作者御用顏料',1,1,560,'成分均為全國公證認證，成分安全天然環保<br>專業比例調料，比市售的壓克力顏料更具彈力與柔軟<br>防水成份遇水也不怕<br>色漿可自由混合調色增添更多顏色豐富性<br>可隨自身喜好添加一定比例的水，使用上會更滑順<br>運送時會因為瓶身傾倒內容物沾於蓋子上，並不影響使用<br>','../img/product_detail/item14.png',9999,10,'2023-01-26 12:19:12','2023-01-26 12:19:12',2,1,2,'產品名稱：創作者御用顏料<br>成份：水性PU<br>用途：上色<br>','組合','顏色彩飽和可調色, 堆疊不吃色不混色, 防水配方水洗不掉色','2023-01-25','2046-12-31','韶光限定','韶光限定'),
(16,'DIY毛線聖誕樹',1,1,560,'來自俄羅斯的刺繡方式，用一支筆就完成刺繡的作品！<br>不僅可以紓解壓力，創作作品的過程超療癒！<br>不想被材料包中的圖案限制，只想自己創作？這個組合很適合你！','../img/product_detail/item15.png',9999,10,'2023-01-26 12:22:59','2023-01-26 12:22:59',2,1,2,'產品名稱：DIY毛線聖誕樹<br>【俄羅斯刺繡】全工具材料組合內容如下：<br>(粗)刺繡針組1、(細針)刺繡針組1、修補針組1、6吋繡框1、\n盒裝40色繡線1、16色毛線、粗針用布料1、細針用布料*1<br>顏色：大地色/聖誕綠/喜氣紅','顏色','俄羅斯戳戳繍, 在布上戳戳戳、不打結就可以完成刺繡, 療癒好入門的超實用作品','2023/01/25','2046/12/31','韶光限定','韶光限定'),
(17,'山形實木杯墊',1,1,280,'選用㊣臺灣鶯歌製造吸水杯墊，質白好上色，吸水效果佳<br>SGS檢驗合格，無毒殘留，日本印刷機器品質保證<br>背面黏貼防滑墊EVA，貼近桌面更耐用<br>','../img/product_detail/item16.png',9999,10,'2023-01-26 12:26:17','2023-01-26 12:26:17',2,1,2,'產品名稱：山形實木杯墊<br>商品厚度：0.6 cm<br>材質：陶瓷款/毛氈款<br>防滑墊EVA、牛皮紙盒<br>款式：陶瓷-山形/陶瓷-圓形毛氈','款式','經SGS檢驗合格不含重金屬, 吸水效果佳, 防滑墊貼近桌面更耐用','2023/01/25','2046/12/31','展覽限定','日本畫展');

/*Table structure for table `PRODUCT_PIC` */

DROP TABLE IF EXISTS `PRODUCT_PIC`;

CREATE TABLE `PRODUCT_PIC` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品圖編號',
  `PATH` varchar(128) NOT NULL COMMENT '商品圖路徑',
  `FK_PRODUCT_PIC_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_PIC_PRODUCT_ID_idx` (`FK_PRODUCT_PIC_PRODUCT_ID`),
  CONSTRAINT `FK_PRODUCT_PIC_PRODUCT_ID` FOREIGN KEY (`FK_PRODUCT_PIC_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COMMENT='商品圖';

/*Data for the table `PRODUCT_PIC` */

insert  into `PRODUCT_PIC`(`ID`,`PATH`,`FK_PRODUCT_PIC_PRODUCT_ID`) values 
(1,'../img/product_detail/item17_01.png',1),
(2,'../img/product_detail/item01_01.png',2),
(3,'../img/product_detail/item01_02.png',2),
(4,'../img/product_detail/item01_03.png',2),
(5,'../img/product_detail/item02_01.png',3),
(6,'../img/product_detail/item02_02.png',3),
(7,'../img/product_detail/item02_03.png',3),
(8,'../img/product_detail/item03_01.png',4),
(9,'../img/product_detail/item03_02.png',4),
(10,'../img/product_detail/item03_03.png',4),
(11,'../img/product_detail/item04_01.png',5),
(12,'../img/product_detail/item04_02.png',5),
(13,'../img/product_detail/item04_03.png',5),
(14,'../img/product_detail/item05_01.png',6),
(15,'../img/product_detail/item05_02.png',6),
(16,'../img/product_detail/item05_03.png',6),
(17,'../img/product_detail/item06_01.png',7),
(18,'../img/product_detail/item06_02.png',7),
(19,'../img/product_detail/item06_03.png',7),
(20,'../img/product_detail/item07_01.png',8),
(21,'../img/product_detail/item07_02.png',8),
(22,'../img/product_detail/item07_03.png',8),
(23,'../img/product_detail/item08_01.png',9),
(24,'../img/product_detail/item08_02.png',9),
(25,'../img/product_detail/item08_03.png',9),
(26,'../img/product_detail/item09_01.png',10),
(27,'../img/product_detail/item09_02.png',10),
(28,'../img/product_detail/item09_03.png',10),
(29,'../img/product_detail/item10_01.png',11),
(30,'../img/product_detail/item10_02.png',11),
(31,'../img/product_detail/item10_03.png',11),
(32,'../img/product_detail/item11_01.png',12),
(33,'../img/product_detail/item11_02.png',12),
(34,'../img/product_detail/item11_03.png',12),
(35,'../img/product_detail/item12_01.png',13),
(36,'../img/product_detail/item12_02.png',13),
(37,'../img/product_detail/item12_03.png',13),
(38,'../img/product_detail/item13_01.png',14),
(39,'../img/product_detail/item13_02.png',14),
(40,'../img/product_detail/item13_03.png',14),
(41,'../img/product_detail/item14_01.png',15),
(42,'../img/product_detail/item14_02.png',15),
(43,'../img/product_detail/item14_03.png',15),
(44,'../img/product_detail/item15_01.png',16),
(45,'../img/product_detail/item15_02.png',16),
(46,'../img/product_detail/item15_03.png',16),
(47,'../img/product_detail/item16_01.png',17),
(48,'../img/product_detail/item16_02.png',17),
(49,'../img/product_detail/item16_03.png',17),
(50,'../img/product_detail/item17_02.png',1),
(51,'../img/product_detail/item17_03.png',1);

/*Table structure for table `PRODUCT_SPEC` */

DROP TABLE IF EXISTS `PRODUCT_SPEC`;

CREATE TABLE `PRODUCT_SPEC` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品規格編號',
  `SPEC` varchar(45) NOT NULL COMMENT '商品規格',
  `FK_PRODUCT_SPEC_PRODUCT_ID` int NOT NULL COMMENT 'FK_商品編號',
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_SPEC_PRODUCT_ID_idx` (`FK_PRODUCT_SPEC_PRODUCT_ID`),
  CONSTRAINT `FK_PRODUCT_SPEC_PRODUCT_ID` FOREIGN KEY (`FK_PRODUCT_SPEC_PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COMMENT='商品規格';

/*Data for the table `PRODUCT_SPEC` */

insert  into `PRODUCT_SPEC`(`ID`,`SPEC`,`FK_PRODUCT_SPEC_PRODUCT_ID`) values 
(1,'黑色',2),
(2,'藍色',2),
(3,'粉色',2),
(4,'30x30cm',1),
(5,'40x50cm',1),
(6,'50x70cm',1),
(7,'30x30cm',3),
(8,'40x50cm',3),
(9,'50x70cm',3),
(10,'27cm',4),
(11,'30cm',4),
(12,'32cm',4),
(13,'30x30cm',5),
(14,'40x50cm',5),
(15,'50x70cm',5),
(16,'30x30cm',6),
(17,'40x50cm',6),
(18,'50x70cm',6),
(19,'20cm',7),
(20,'26cm',7),
(21,'30cm',7),
(22,'黑色',8),
(23,'白色',8),
(24,'灰色',8),
(25,'8張',9),
(26,'24張',9),
(27,'100張',9),
(28,'30x30cm',10),
(29,'50x50cm',10),
(30,'87x87cm',10),
(31,'聖誕',11),
(32,'星空',11),
(33,'空色',11),
(34,'黑色',12),
(35,'白色',12),
(36,'綠色',12),
(37,'白色',13),
(38,'米色',13),
(39,'藍色',13),
(40,'粉色',14),
(41,'米色',14),
(42,'綠色',14),
(43,'8入',15),
(44,'24入',15),
(45,'32入',15),
(46,'大地色',16),
(47,'聖誕綠',16),
(48,'喜氣紅',16),
(49,'陶瓷款',17),
(50,'毛氈款',17),
(51,'橡木款',17);

/*Table structure for table `PRODUCT_TYPE` */

DROP TABLE IF EXISTS `PRODUCT_TYPE`;

CREATE TABLE `PRODUCT_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '商品類型編號',
  `PRODUCT_TYPE_NAME` varchar(45) NOT NULL COMMENT '商品類型名稱',
  `PRODUCT_DETAIL_DESC` varchar(100) DEFAULT NULL COMMENT '商品類型描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `PRODUCT_TYPE` */

insert  into `PRODUCT_TYPE`(`ID`,`PRODUCT_TYPE_NAME`,`PRODUCT_DETAIL_DESC`) values 
(1,'紀念周邊','紀念周邊'),
(2,'生活用品','生活用品'),
(3,'藝術創作','藝術創作'),
(4,'衣著服飾','衣著服飾'),
(5,'美味食品','美味食品'),
(6,'家居佈置','家居佈置'),
(7,'交通相關','交通相關'),
(8,'知識教育','知識教育'),
(9,'電玩遊戲','電玩遊戲'),
(10,'其他','其他');

/*Table structure for table `RENTAL_FORM` */

DROP TABLE IF EXISTS `RENTAL_FORM`;

CREATE TABLE `RENTAL_FORM` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(45) NOT NULL,
  `APPLICANT_UNIT` varchar(45) NOT NULL,
  `PRINCIPAL_NAME` varchar(10) NOT NULL,
  `UNIT_TYPE` varchar(45) NOT NULL,
  `CONTACT_NAME` varchar(10) NOT NULL,
  `CONTACT_PHONE` varchar(10) NOT NULL,
  `LOCATION` varchar(45) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `NATURE_ACT` varchar(45) NOT NULL,
  `ORNAMENTAL_ACT` varchar(45) NOT NULL,
  `OTHER_DEMANDS` varchar(45) NOT NULL,
  `FEEDBACK` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;

/*Data for the table `RENTAL_FORM` */

insert  into `RENTAL_FORM`(`ID`,`EVENT_NAME`,`APPLICANT_UNIT`,`PRINCIPAL_NAME`,`UNIT_TYPE`,`CONTACT_NAME`,`CONTACT_PHONE`,`LOCATION`,`START_DATE`,`END_DATE`,`NATURE_ACT`,`ORNAMENTAL_ACT`,`OTHER_DEMANDS`,`FEEDBACK`) values 
(1,'韶光藝術展','韶光文創園區','董怡均','個人','董怡均','0983082095','A館','2023-02-01','2023-02-28','其他','不開放','無代售需求','無');

/*Table structure for table `ROLE` */

DROP TABLE IF EXISTS `ROLE`;

CREATE TABLE `ROLE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESC` varchar(45) NOT NULL COMMENT '權限描述',
  `INDEX` varchar(45) NOT NULL COMMENT '後台首頁',
  `INDEX_LEVEL` tinyint NOT NULL COMMENT '首頁權限',
  `OVERVIEW` varchar(45) NOT NULL COMMENT '後台銷售狀況',
  `OVERVIEW_LEVEL` tinyint NOT NULL COMMENT '銷售概況權限',
  `PO` varchar(45) NOT NULL COMMENT '後台訂單頁',
  `PO_LEVEL` tinyint NOT NULL COMMENT '訂單頁權限',
  `PRODUCT` varchar(45) NOT NULL COMMENT '後台商品頁',
  `PRODUCT_LEVEL` tinyint NOT NULL COMMENT '商品頁權限',
  `INFO` varchar(45) NOT NULL COMMENT '後台消息頁',
  `INFO_LEVEL` tinyint NOT NULL COMMENT '消息頁權限',
  `RENTAL` varchar(45) NOT NULL COMMENT '後台場地頁',
  `RENTAL_LEVEL` tinyint NOT NULL COMMENT '埸地頁權限',
  `MEMBER` varchar(45) NOT NULL COMMENT '後台會員頁',
  `MEMBER_LEVEL` tinyint NOT NULL COMMENT '會員頁權限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `ROLE` */

insert  into `ROLE`(`ID`,`DESC`,`INDEX`,`INDEX_LEVEL`,`OVERVIEW`,`OVERVIEW_LEVEL`,`PO`,`PO_LEVEL`,`PRODUCT`,`PRODUCT_LEVEL`,`INFO`,`INFO_LEVEL`,`RENTAL`,`RENTAL_LEVEL`,`MEMBER`,`MEMBER_LEVEL`) values 
(1,'admin管理員','後台主頁權限',0,'後台銷售概況權限',0,'後台訂單權限',0,'後台商品頁權限',0,'後台消息頁',0,'後台場地頁',0,'後台會員頁',0),
(2,'member一般會員','後台主頁權限',1,'後台銷售概況權限',1,'後台訂單權限',1,'後台商品頁權限',1,'後台消息頁',1,'後台場地頁',1,'後台會員頁',1);

/*Table structure for table `SHOPS_FORM` */

DROP TABLE IF EXISTS `SHOPS_FORM`;

CREATE TABLE `SHOPS_FORM` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BRAND_NAME` varchar(45) NOT NULL,
  `PRINCIPAL_NAME` varchar(10) NOT NULL,
  `PRINCIPAL_PHONE` varchar(10) NOT NULL,
  `PRINCIPAL_EMAIL` varchar(45) NOT NULL,
  `STAY_TIME` varchar(2) NOT NULL,
  `FEEDBACK` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `SHOPS_FORM` */

insert  into `SHOPS_FORM`(`ID`,`BRAND_NAME`,`PRINCIPAL_NAME`,`PRINCIPAL_PHONE`,`PRINCIPAL_EMAIL`,`STAY_TIME`,`FEEDBACK`) values 
(1,'Hey ! Studio','董怡均','0983082095','qwer777889@gmail.com','兩年','無');

/*Table structure for table `SUPPLIER` */

DROP TABLE IF EXISTS `SUPPLIER`;

CREATE TABLE `SUPPLIER` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '供應商編號',
  `SUPPLIER_NAME` varchar(45) NOT NULL COMMENT '供應商名稱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `SUPPLIER` */

insert  into `SUPPLIER`(`ID`,`SUPPLIER_NAME`) values 
(1,'日本畫展');

/*Table structure for table `TICKET` */

DROP TABLE IF EXISTS `TICKET`;

CREATE TABLE `TICKET` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '門票購物車編號',
  `QTY` smallint NOT NULL COMMENT '數量',
  `TICKET_DATE` timestamp NOT NULL COMMENT '加入日期',
  `MEMBER_ID` int NOT NULL COMMENT 'FK_會員編號',
  `EXPO_ID` int NOT NULL COMMENT 'FK_展覽編號',
  `EXPO_PRICE` int NOT NULL COMMENT '展覽票價',
  PRIMARY KEY (`ID`),
  KEY `FK_TICKET_MEMBER_ID_idx` (`MEMBER_ID`),
  KEY `FK_TICKET_EXPO_ID_idx` (`EXPO_ID`),
  CONSTRAINT `FK_TICKET_EXPO_ID` FOREIGN KEY (`EXPO_ID`) REFERENCES `EXPO` (`ID`),
  CONSTRAINT `FK_TICKET_MEMBER_ID` FOREIGN KEY (`MEMBER_ID`) REFERENCES `MEMBER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='門票購物車';

/*Data for the table `TICKET` */

/*Table structure for table `b_hotitem` */

DROP TABLE IF EXISTS `b_hotitem`;

/*!50001 DROP VIEW IF EXISTS `b_hotitem` */;
/*!50001 DROP TABLE IF EXISTS `b_hotitem` */;

/*!50001 CREATE TABLE  `b_hotitem`(
 `ID` int ,
 `FREIGHT` smallint ,
 `ETD` date ,
 `SHIP_DATE` date ,
 `BL` varchar(45) ,
 `STATUS` tinyint ,
 `STATUS_DATE` timestamp ,
 `STATUS_REASON` varchar(128) ,
 `PO_NOTE` varchar(256) ,
 `CS_PO_NOTE` varchar(256) ,
 `CREATE_DATE` timestamp ,
 `FK_PO_MEMBER_ID` int ,
 `PODID` int ,
 `PID` int ,
 `PRODUCT_NAME` varchar(100) ,
 `PRICE` mediumint 
)*/;

/*Table structure for table `b_hotitem2` */

DROP TABLE IF EXISTS `b_hotitem2`;

/*!50001 DROP VIEW IF EXISTS `b_hotitem2` */;
/*!50001 DROP TABLE IF EXISTS `b_hotitem2` */;

/*!50001 CREATE TABLE  `b_hotitem2`(
 `PID` int ,
 `COUNT(*)` bigint 
)*/;

/*Table structure for table `b_member` */

DROP TABLE IF EXISTS `b_member`;

/*!50001 DROP VIEW IF EXISTS `b_member` */;
/*!50001 DROP TABLE IF EXISTS `b_member` */;

/*!50001 CREATE TABLE  `b_member`(
 `ID` int ,
 `USERNAME` varchar(100) ,
 `VERIFY` tinyint(1) ,
 `EMAIL` varchar(100) ,
 `DESC` varchar(45) 
)*/;

/*Table structure for table `b_new` */

DROP TABLE IF EXISTS `b_new`;

/*!50001 DROP VIEW IF EXISTS `b_new` */;
/*!50001 DROP TABLE IF EXISTS `b_new` */;

/*!50001 CREATE TABLE  `b_new`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `STATUS` tinyint(1) ,
 `MAIN_PHOTO` varchar(256) ,
 `EDIT_DATE` timestamp ,
 `FK_INFO_TYPE_ID` int ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `b_new_detail` */

DROP TABLE IF EXISTS `b_new_detail`;

/*!50001 DROP VIEW IF EXISTS `b_new_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_new_detail` */;

/*!50001 CREATE TABLE  `b_new_detail`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `EDIT_DATE` timestamp ,
 `FK_INFO_PAGE_ID` int ,
 `FK_INFO_TYPE_ID` int ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `b_po_test` */

DROP TABLE IF EXISTS `b_po_test`;

/*!50001 DROP VIEW IF EXISTS `b_po_test` */;
/*!50001 DROP TABLE IF EXISTS `b_po_test` */;

/*!50001 CREATE TABLE  `b_po_test`(
 `ID` int ,
 `FREIGHT` smallint ,
 `ETD` date ,
 `SHIP_DATE` date ,
 `BL` varchar(45) ,
 `STATUS` tinyint ,
 `STATUS_DATE` timestamp ,
 `STATUS_REASON` varchar(128) ,
 `PO_NOTE` varchar(256) ,
 `CS_PO_NOTE` varchar(256) ,
 `CREATE_DATE` timestamp ,
 `FK_PO_MEMBER_ID` int ,
 `MEMBERID` int ,
 `USERNAME` varchar(100) ,
 `PODID` int ,
 `QTY` tinyint ,
 `SPEC` varchar(45) ,
 `PRODUCTID` int ,
 `PRICE` mediumint ,
 `PRODUCT_NAME` varchar(100) ,
 `FK_PRODUCT_PAGE_ID` int 
)*/;

/*Table structure for table `b_product` */

DROP TABLE IF EXISTS `b_product`;

/*!50001 DROP VIEW IF EXISTS `b_product` */;
/*!50001 DROP TABLE IF EXISTS `b_product` */;

/*!50001 CREATE TABLE  `b_product`(
 `ID` int ,
 `PRODUCT_NAME` varchar(100) ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `STATUS` tinyint(1) ,
 `HIDE` tinyint(1) ,
 `PRICE` mediumint ,
 `MAIN_PHOTO` varchar(256) ,
 `FK_PRODUCT_PAGE_ID` int ,
 `PRODUCT_TYPE_NAME` varchar(45) 
)*/;

/*Table structure for table `b_product_detail` */

DROP TABLE IF EXISTS `b_product_detail`;

/*!50001 DROP VIEW IF EXISTS `b_product_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_product_detail` */;

/*!50001 CREATE TABLE  `b_product_detail`(
 `ID` int ,
 `PRODUCT_NAME` varchar(100) ,
 `STATUS` tinyint(1) ,
 `HIDE` tinyint(1) ,
 `PRICE` mediumint ,
 `DESC` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STOCK_QTY` smallint ,
 `MAX_QTY` tinyint ,
 `CREATE_DATE` timestamp ,
 `EDIT_DATE` timestamp ,
 `FK_PRODUCT_PAGE_ID` int ,
 `FK_EXPO_ID` int ,
 `FK_PRODUCT_TYPE_ID` int ,
 `SPEC` mediumtext ,
 `NOTE` mediumtext ,
 `FEATURED` varchar(256) ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `TITLE` varchar(128) ,
 `PRODUCT_TYPE_NAME` varchar(45) ,
 `PRODUCT_DETAIL_DESC` varchar(100) 
)*/;

/*Table structure for table `b_product_detail_pic` */

DROP TABLE IF EXISTS `b_product_detail_pic`;

/*!50001 DROP VIEW IF EXISTS `b_product_detail_pic` */;
/*!50001 DROP TABLE IF EXISTS `b_product_detail_pic` */;

/*!50001 CREATE TABLE  `b_product_detail_pic`(
 `PATH` varchar(128) ,
 `FK_PRODUCT_PIC_PRODUCT_ID` int ,
 `ID` int 
)*/;

/*Table structure for table `b_product_detail_size` */

DROP TABLE IF EXISTS `b_product_detail_size`;

/*!50001 DROP VIEW IF EXISTS `b_product_detail_size` */;
/*!50001 DROP TABLE IF EXISTS `b_product_detail_size` */;

/*!50001 CREATE TABLE  `b_product_detail_size`(
 `SPEC` varchar(45) ,
 `FK_PRODUCT_SPEC_PRODUCT_ID` int ,
 `ID` int 
)*/;

/*Table structure for table `b_rental` */

DROP TABLE IF EXISTS `b_rental`;

/*!50001 DROP VIEW IF EXISTS `b_rental` */;
/*!50001 DROP TABLE IF EXISTS `b_rental` */;

/*!50001 CREATE TABLE  `b_rental`(
 `ID` int ,
 `NAME` varchar(45) ,
 `PRICE` mediumint ,
 `DESC` varchar(256) ,
 `MAIN_PHOTO` varchar(256) ,
 `LOCATED` varchar(64) ,
 `STATUS` tinyint(1) 
)*/;

/*Table structure for table `b_rental_detail` */

DROP TABLE IF EXISTS `b_rental_detail`;

/*!50001 DROP VIEW IF EXISTS `b_rental_detail` */;
/*!50001 DROP TABLE IF EXISTS `b_rental_detail` */;

/*!50001 CREATE TABLE  `b_rental_detail`(
 `ID` int ,
 `NAME` varchar(45) ,
 `PRICE` mediumint ,
 `DESC` varchar(256) ,
 `DEVICE` varchar(256) ,
 `RULE` varchar(256) ,
 `AREA` varchar(128) ,
 `MAIN_PHOTO` varchar(256) ,
 `LOCATED` varchar(64) ,
 `STATUS` tinyint(1) 
)*/;

/*Table structure for table `f_expo` */

DROP TABLE IF EXISTS `f_expo`;

/*!50001 DROP VIEW IF EXISTS `f_expo` */;
/*!50001 DROP TABLE IF EXISTS `f_expo` */;

/*!50001 CREATE TABLE  `f_expo`(
 `ID` int ,
 `TITLE` varchar(128) ,
 `MAIN_PHOTO` varchar(256) ,
 `START_DATE` date ,
 `END_DATE` date ,
 `TYPE` varchar(45) 
)*/;

/*Table structure for table `f_expo_inner` */

DROP TABLE IF EXISTS `f_expo_inner`;

/*!50001 DROP VIEW IF EXISTS `f_expo_inner` */;
/*!50001 DROP TABLE IF EXISTS `f_expo_inner` */;

/*!50001 CREATE TABLE  `f_expo_inner`(
 `ID` int ,
 `TITLE` varchar(128) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `START_DATE` date ,
 `END_DATE` date ,
 `ADULT_PRICE` smallint ,
 `CONC_PRICE` smallint ,
 `GROUP_PRICE` smallint ,
 `TYPE` varchar(45) 
)*/;

/*Table structure for table `f_index_1` */

DROP TABLE IF EXISTS `f_index_1`;

/*!50001 DROP VIEW IF EXISTS `f_index_1` */;
/*!50001 DROP TABLE IF EXISTS `f_index_1` */;

/*!50001 CREATE TABLE  `f_index_1`(
 `ID` int ,
 `TITLE` varchar(128) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `FK_EXPO_PAGE_ID` int ,
 `START_DATE` date ,
 `END_DATE` date ,
 `CREATE_DATE` timestamp ,
 `EDIT_DATE` timestamp ,
 `ADULT_PRICE` smallint ,
 `CONC_PRICE` smallint ,
 `GROUP_PRICE` smallint ,
 `FK_BOOKING_ID` int ,
 `TAG1` varchar(12) ,
 `TAG2` varchar(12) ,
 `BANNER_PHOTO` varchar(256) ,
 `INFO` mediumtext ,
 `STATUS` tinyint(1) ,
 `TYPE` varchar(45) 
)*/;

/*Table structure for table `f_index_2` */

DROP TABLE IF EXISTS `f_index_2`;

/*!50001 DROP VIEW IF EXISTS `f_index_2` */;
/*!50001 DROP TABLE IF EXISTS `f_index_2` */;

/*!50001 CREATE TABLE  `f_index_2`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `EDIT_DATE` timestamp ,
 `FK_INFO_PAGE_ID` int ,
 `FK_INFO_TYPE_ID` int ,
 `START` varchar(10) ,
 `END` varchar(10) ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `f_news` */

DROP TABLE IF EXISTS `f_news`;

/*!50001 DROP VIEW IF EXISTS `f_news` */;
/*!50001 DROP TABLE IF EXISTS `f_news` */;

/*!50001 CREATE TABLE  `f_news`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `f_news_inner` */

DROP TABLE IF EXISTS `f_news_inner`;

/*!50001 DROP VIEW IF EXISTS `f_news_inner` */;
/*!50001 DROP TABLE IF EXISTS `f_news_inner` */;

/*!50001 CREATE TABLE  `f_news_inner`(
 `ID` int ,
 `TITLE` varchar(100) ,
 `CONTENT` mediumtext ,
 `MAIN_PHOTO` varchar(256) ,
 `STATUS` tinyint(1) ,
 `CREATE_DATE` timestamp ,
 `DESC` varchar(100) 
)*/;

/*Table structure for table `f_rental` */

DROP TABLE IF EXISTS `f_rental`;

/*!50001 DROP VIEW IF EXISTS `f_rental` */;
/*!50001 DROP TABLE IF EXISTS `f_rental` */;

/*!50001 CREATE TABLE  `f_rental`(
 `ID` int ,
 `NAME` varchar(45) ,
 `PRICE` mediumint ,
 `DESC` varchar(256) ,
 `DEVICE` varchar(256) ,
 `RULE` varchar(256) ,
 `AREA` varchar(128) ,
 `MAIN_PHOTO` varchar(256) ,
 `LOCATED` varchar(64) ,
 `STATUS` tinyint(1) 
)*/;

/*Table structure for table `f_rental_inner` */

DROP TABLE IF EXISTS `f_rental_inner`;

/*!50001 DROP VIEW IF EXISTS `f_rental_inner` */;
/*!50001 DROP TABLE IF EXISTS `f_rental_inner` */;

/*!50001 CREATE TABLE  `f_rental_inner`(
 `ID` int ,
 `NAME` varchar(45) ,
 `MAIN_PHOTO` varchar(256) ,
 `START_DATE` date ,
 `END_DATE` date 
)*/;

/*View structure for view b_hotitem */

/*!50001 DROP TABLE IF EXISTS `b_hotitem` */;
/*!50001 DROP VIEW IF EXISTS `b_hotitem` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_hotitem` AS select `po`.`ID` AS `ID`,`po`.`FREIGHT` AS `FREIGHT`,`po`.`ETD` AS `ETD`,`po`.`SHIP_DATE` AS `SHIP_DATE`,`po`.`BL` AS `BL`,`po`.`STATUS` AS `STATUS`,`po`.`STATUS_DATE` AS `STATUS_DATE`,`po`.`STATUS_REASON` AS `STATUS_REASON`,`po`.`PO_NOTE` AS `PO_NOTE`,`po`.`CS_PO_NOTE` AS `CS_PO_NOTE`,`po`.`CREATE_DATE` AS `CREATE_DATE`,`po`.`FK_PO_MEMBER_ID` AS `FK_PO_MEMBER_ID`,`pod`.`ID` AS `PODID`,`p`.`ID` AS `PID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`PRICE` AS `PRICE` from ((`po` join `po_detail` `pod` on((`po`.`ID` = `pod`.`FK_PO_DETAIL_PO_ID`))) join `product` `p` on((`p`.`ID` = `pod`.`FK_PO_DETAIL_PRODUCT_ID`))) where (`po`.`STATUS` = 1) */;

/*View structure for view b_hotitem2 */

/*!50001 DROP TABLE IF EXISTS `b_hotitem2` */;
/*!50001 DROP VIEW IF EXISTS `b_hotitem2` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_hotitem2` AS select `b_hotitem`.`PID` AS `PID`,count(0) AS `COUNT(*)` from `b_hotitem` group by `b_hotitem`.`PID` order by count(0) desc */;

/*View structure for view b_member */

/*!50001 DROP TABLE IF EXISTS `b_member` */;
/*!50001 DROP VIEW IF EXISTS `b_member` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_member` AS select `m`.`ID` AS `ID`,`m`.`USERNAME` AS `USERNAME`,`m`.`VERIFY` AS `VERIFY`,`m`.`EMAIL` AS `EMAIL`,`r`.`DESC` AS `DESC` from (`member` `m` join `role` `r` on((`m`.`FK_ROLE_ID` = `r`.`ID`))) */;

/*View structure for view b_new */

/*!50001 DROP TABLE IF EXISTS `b_new` */;
/*!50001 DROP VIEW IF EXISTS `b_new` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_new` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`START` AS `START`,`i`.`END` AS `END`,`i`.`STATUS` AS `STATUS`,`i`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`i`.`EDIT_DATE` AS `EDIT_DATE`,`i`.`FK_INFO_TYPE_ID` AS `FK_INFO_TYPE_ID`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view b_new_detail */

/*!50001 DROP TABLE IF EXISTS `b_new_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_new_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_new_detail` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`CONTENT` AS `CONTENT`,`i`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`i`.`EDIT_DATE` AS `EDIT_DATE`,`i`.`FK_INFO_PAGE_ID` AS `FK_INFO_PAGE_ID`,`i`.`FK_INFO_TYPE_ID` AS `FK_INFO_TYPE_ID`,`i`.`START` AS `START`,`i`.`END` AS `END`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view b_po_test */

/*!50001 DROP TABLE IF EXISTS `b_po_test` */;
/*!50001 DROP VIEW IF EXISTS `b_po_test` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_po_test` AS select `po`.`ID` AS `ID`,`po`.`FREIGHT` AS `FREIGHT`,`po`.`ETD` AS `ETD`,`po`.`SHIP_DATE` AS `SHIP_DATE`,`po`.`BL` AS `BL`,`po`.`STATUS` AS `STATUS`,`po`.`STATUS_DATE` AS `STATUS_DATE`,`po`.`STATUS_REASON` AS `STATUS_REASON`,`po`.`PO_NOTE` AS `PO_NOTE`,`po`.`CS_PO_NOTE` AS `CS_PO_NOTE`,`po`.`CREATE_DATE` AS `CREATE_DATE`,`po`.`FK_PO_MEMBER_ID` AS `FK_PO_MEMBER_ID`,`m`.`ID` AS `MEMBERID`,`m`.`USERNAME` AS `USERNAME`,`pod`.`ID` AS `PODID`,`pod`.`QTY` AS `QTY`,`s`.`SPEC` AS `SPEC`,`p`.`ID` AS `PRODUCTID`,`p`.`PRICE` AS `PRICE`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`FK_PRODUCT_PAGE_ID` AS `FK_PRODUCT_PAGE_ID` from ((((`po` join `member` `m` on((`po`.`FK_PO_MEMBER_ID` = `m`.`ID`))) join `po_detail` `pod` on((`pod`.`FK_PO_DETAIL_PO_ID` = `po`.`ID`))) join `product` `p` on((`pod`.`FK_PO_DETAIL_PRODUCT_ID` = `p`.`ID`))) join `product_spec` `s` on((`s`.`ID` = `pod`.`FK_PO_PRODUCT_SPEC_ID`))) */;

/*View structure for view b_product */

/*!50001 DROP TABLE IF EXISTS `b_product` */;
/*!50001 DROP VIEW IF EXISTS `b_product` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product` AS select `p`.`ID` AS `ID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`START` AS `START`,`p`.`END` AS `END`,`p`.`STATUS` AS `STATUS`,`p`.`HIDE` AS `HIDE`,`p`.`PRICE` AS `PRICE`,`p`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`p`.`FK_PRODUCT_PAGE_ID` AS `FK_PRODUCT_PAGE_ID`,`pt`.`PRODUCT_TYPE_NAME` AS `PRODUCT_TYPE_NAME` from (`product` `p` join `product_type` `pt` on((`p`.`FK_PRODUCT_TYPE_ID` = `pt`.`ID`))) */;

/*View structure for view b_product_detail */

/*!50001 DROP TABLE IF EXISTS `b_product_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_product_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product_detail` AS select `p`.`ID` AS `ID`,`p`.`PRODUCT_NAME` AS `PRODUCT_NAME`,`p`.`STATUS` AS `STATUS`,`p`.`HIDE` AS `HIDE`,`p`.`PRICE` AS `PRICE`,`p`.`DESC` AS `DESC`,`p`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`p`.`STOCK_QTY` AS `STOCK_QTY`,`p`.`MAX_QTY` AS `MAX_QTY`,`p`.`CREATE_DATE` AS `CREATE_DATE`,`p`.`EDIT_DATE` AS `EDIT_DATE`,`p`.`FK_PRODUCT_PAGE_ID` AS `FK_PRODUCT_PAGE_ID`,`p`.`FK_EXPO_ID` AS `FK_EXPO_ID`,`p`.`FK_PRODUCT_TYPE_ID` AS `FK_PRODUCT_TYPE_ID`,`p`.`SPEC` AS `SPEC`,`p`.`NOTE` AS `NOTE`,`p`.`FEATURED` AS `FEATURED`,`p`.`START` AS `START`,`p`.`END` AS `END`,`e`.`TITLE` AS `TITLE`,`pt`.`PRODUCT_TYPE_NAME` AS `PRODUCT_TYPE_NAME`,`pt`.`PRODUCT_DETAIL_DESC` AS `PRODUCT_DETAIL_DESC` from ((`product` `p` join `product_type` `pt` on((`p`.`FK_PRODUCT_TYPE_ID` = `pt`.`ID`))) join `expo` `e` on((`p`.`FK_EXPO_ID` = `e`.`ID`))) */;

/*View structure for view b_product_detail_pic */

/*!50001 DROP TABLE IF EXISTS `b_product_detail_pic` */;
/*!50001 DROP VIEW IF EXISTS `b_product_detail_pic` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product_detail_pic` AS select `pp`.`PATH` AS `PATH`,`pp`.`FK_PRODUCT_PIC_PRODUCT_ID` AS `FK_PRODUCT_PIC_PRODUCT_ID`,`p`.`ID` AS `ID` from (`product` `p` join `product_pic` `pp` on((`p`.`ID` = `pp`.`FK_PRODUCT_PIC_PRODUCT_ID`))) */;

/*View structure for view b_product_detail_size */

/*!50001 DROP TABLE IF EXISTS `b_product_detail_size` */;
/*!50001 DROP VIEW IF EXISTS `b_product_detail_size` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_product_detail_size` AS select `ps`.`SPEC` AS `SPEC`,`ps`.`FK_PRODUCT_SPEC_PRODUCT_ID` AS `FK_PRODUCT_SPEC_PRODUCT_ID`,`p`.`ID` AS `ID` from (`product` `p` join `product_spec` `ps` on((`p`.`ID` = `ps`.`FK_PRODUCT_SPEC_PRODUCT_ID`))) */;

/*View structure for view b_rental */

/*!50001 DROP TABLE IF EXISTS `b_rental` */;
/*!50001 DROP VIEW IF EXISTS `b_rental` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_rental` AS select `location`.`ID` AS `ID`,`location`.`NAME` AS `NAME`,`location`.`PRICE` AS `PRICE`,`location`.`DESC` AS `DESC`,`location`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`location`.`LOCATED` AS `LOCATED`,`location`.`STATUS` AS `STATUS` from `location` */;

/*View structure for view b_rental_detail */

/*!50001 DROP TABLE IF EXISTS `b_rental_detail` */;
/*!50001 DROP VIEW IF EXISTS `b_rental_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_rental_detail` AS select `l`.`ID` AS `ID`,`l`.`NAME` AS `NAME`,`l`.`PRICE` AS `PRICE`,`l`.`DESC` AS `DESC`,`l`.`DEVICE` AS `DEVICE`,`l`.`RULE` AS `RULE`,`l`.`AREA` AS `AREA`,`l`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`l`.`LOCATED` AS `LOCATED`,`l`.`STATUS` AS `STATUS` from `location` `l` */;

/*View structure for view f_expo */

/*!50001 DROP TABLE IF EXISTS `f_expo` */;
/*!50001 DROP VIEW IF EXISTS `f_expo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_expo` AS select `e`.`ID` AS `ID`,`e`.`TITLE` AS `TITLE`,`e`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`e`.`START_DATE` AS `START_DATE`,`e`.`END_DATE` AS `END_DATE`,`p`.`TYPE` AS `TYPE` from (`expo` `e` join `page` `p` on((`e`.`FK_EXPO_PAGE_ID` = `p`.`ID`))) */;

/*View structure for view f_expo_inner */

/*!50001 DROP TABLE IF EXISTS `f_expo_inner` */;
/*!50001 DROP VIEW IF EXISTS `f_expo_inner` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_expo_inner` AS select `e`.`ID` AS `ID`,`e`.`TITLE` AS `TITLE`,`e`.`CONTENT` AS `CONTENT`,`e`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`e`.`START_DATE` AS `START_DATE`,`e`.`END_DATE` AS `END_DATE`,`e`.`ADULT_PRICE` AS `ADULT_PRICE`,`e`.`CONC_PRICE` AS `CONC_PRICE`,`e`.`GROUP_PRICE` AS `GROUP_PRICE`,`p`.`TYPE` AS `TYPE` from (`expo` `e` join `page` `p` on((`e`.`FK_EXPO_PAGE_ID` = `p`.`ID`))) */;

/*View structure for view f_index_1 */

/*!50001 DROP TABLE IF EXISTS `f_index_1` */;
/*!50001 DROP VIEW IF EXISTS `f_index_1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_index_1` AS select `e`.`ID` AS `ID`,`e`.`TITLE` AS `TITLE`,`e`.`CONTENT` AS `CONTENT`,`e`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`e`.`FK_EXPO_PAGE_ID` AS `FK_EXPO_PAGE_ID`,`e`.`START_DATE` AS `START_DATE`,`e`.`END_DATE` AS `END_DATE`,`e`.`CREATE_DATE` AS `CREATE_DATE`,`e`.`EDIT_DATE` AS `EDIT_DATE`,`e`.`ADULT_PRICE` AS `ADULT_PRICE`,`e`.`CONC_PRICE` AS `CONC_PRICE`,`e`.`GROUP_PRICE` AS `GROUP_PRICE`,`e`.`FK_BOOKING_ID` AS `FK_BOOKING_ID`,`e`.`TAG1` AS `TAG1`,`e`.`TAG2` AS `TAG2`,`e`.`BANNER_PHOTO` AS `BANNER_PHOTO`,`e`.`INFO` AS `INFO`,`e`.`STATUS` AS `STATUS`,`p`.`TYPE` AS `TYPE` from (`expo` `e` join `page` `p` on((`e`.`FK_EXPO_PAGE_ID` = `p`.`ID`))) */;

/*View structure for view f_index_2 */

/*!50001 DROP TABLE IF EXISTS `f_index_2` */;
/*!50001 DROP VIEW IF EXISTS `f_index_2` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_index_2` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`CONTENT` AS `CONTENT`,`i`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`i`.`EDIT_DATE` AS `EDIT_DATE`,`i`.`FK_INFO_PAGE_ID` AS `FK_INFO_PAGE_ID`,`i`.`FK_INFO_TYPE_ID` AS `FK_INFO_TYPE_ID`,`i`.`START` AS `START`,`i`.`END` AS `END`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view f_news */

/*!50001 DROP TABLE IF EXISTS `f_news` */;
/*!50001 DROP VIEW IF EXISTS `f_news` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_news` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view f_news_inner */

/*!50001 DROP TABLE IF EXISTS `f_news_inner` */;
/*!50001 DROP VIEW IF EXISTS `f_news_inner` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_news_inner` AS select `i`.`ID` AS `ID`,`i`.`TITLE` AS `TITLE`,`i`.`CONTENT` AS `CONTENT`,`i`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`i`.`STATUS` AS `STATUS`,`i`.`CREATE_DATE` AS `CREATE_DATE`,`it`.`DESC` AS `DESC` from (`info` `i` join `info_type` `it` on((`i`.`FK_INFO_TYPE_ID` = `it`.`ID`))) */;

/*View structure for view f_rental */

/*!50001 DROP TABLE IF EXISTS `f_rental` */;
/*!50001 DROP VIEW IF EXISTS `f_rental` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_rental` AS select `location`.`ID` AS `ID`,`location`.`NAME` AS `NAME`,`location`.`PRICE` AS `PRICE`,`location`.`DESC` AS `DESC`,`location`.`DEVICE` AS `DEVICE`,`location`.`RULE` AS `RULE`,`location`.`AREA` AS `AREA`,`location`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`location`.`LOCATED` AS `LOCATED`,`location`.`STATUS` AS `STATUS` from `location` */;

/*View structure for view f_rental_inner */

/*!50001 DROP TABLE IF EXISTS `f_rental_inner` */;
/*!50001 DROP VIEW IF EXISTS `f_rental_inner` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f_rental_inner` AS select `l`.`ID` AS `ID`,`l`.`NAME` AS `NAME`,`l`.`MAIN_PHOTO` AS `MAIN_PHOTO`,`b`.`START_DATE` AS `START_DATE`,`b`.`END_DATE` AS `END_DATE` from (`location` `l` join `booking` `b` on((`l`.`ID` = `b`.`FK_LOCATION_ID`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
