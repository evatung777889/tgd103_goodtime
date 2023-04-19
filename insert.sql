# table ROLE insert

insert into mydb.ROLE(`DESC`, `INDEX`, 
			INDEX_LEVEL, OVERVIEW, OVERVIEW_LEVEL, 
            PO, PO_LEVEL, PRODUCT, PRODUCT_LEVEL, 
            INFO, INFO_LEVEL, RENTAL, RENTAL_LEVEL, `MEMBER`, MEMBER_LEVEL)
values('admin管理員', 
	'後台主頁權限', 0, 
	'後台銷售概況權限', 0, 
	'後台訂單權限', 0, 
	'後台商品頁權限', 0, 
	'後台消息頁', 0, 
	'後台場地頁', 0, 
	'後台會員頁', 0);

insert into mydb.ROLE(`DESC`, `INDEX`, 
			INDEX_LEVEL, OVERVIEW, OVERVIEW_LEVEL, 
            PO, PO_LEVEL, PRODUCT, PRODUCT_LEVEL, 
            INFO, INFO_LEVEL, RENTAL, RENTAL_LEVEL, `MEMBER`, MEMBER_LEVEL)
values('member一般會員', 
	'後台主頁權限', 1, 
	'後台銷售概況權限', 1, 
	'後台訂單權限', 1, 
	'後台商品頁權限', 1, 
	'後台消息頁', 1, 
	'後台場地頁', 1, 
	'後台會員頁', 1);
    
# table ADDRESS insert

insert into mydb.ADDRESS(ZIP, REGION, DISTRICT, LOCATION)
values('104', '台北市', '中山區', '南京東路三段219號5樓');

# table MEMBER insert

insert into mydb.MEMBER(USERNAME, EMAIL, `PASSWORD`, PHONE, VERIFY, 
	FK_ADDRESS_ID, FK_ROLE_ID)
values('admin管理員', 'admin@goodtime.com', 'g3_@dmin',	'0987654321', 0, 
	1, 1);
    
insert into mydb.MEMBER(USERNAME, EMAIL, `PASSWORD`, PHONE, VERIFY, 
	FK_ADDRESS_ID, FK_ROLE_ID)
values('member1', 'member@goodtime.com', 'member1',	'0987654321', 0, 
	1, 2);
    
# table INFO_TYPE insert

insert into mydb.INFO_TYPE(`DESC`)
values('園區公告');

# table SUPPLIER insert

 insert into mydb.SUPPLIER(`NAME`)
 values('日本畫展');
 
 # table PRODUCT_TYPE insert
 
insert into mydb.PRODUCT_TYPE( `NAME`, `DESC`)
values( 
 '平面畫作', 
 '2D畫作不限大小' );
 
 # table PAGE insert 
 insert into mydb.PAGE(`TYPE`)
values('商城頁');

 insert into mydb.PAGE(`TYPE`)
values('商品頁');

# table LOCATION insert
insert into mydb.LOCATION(`NAME`, PRICE,
`DESC`, DEVICE, RULE, `AREA`, MAIN_PHOTO, LOCATED,`STATUS`)
values('1號倉庫',10000,
'{"構造":"室內為長廊式空間，鋼骨鋼筋混凝土柱樑系統，加強磚造結構"}',
'基礎照明、空調、簡易掃具','園區嚴禁使用任何火具。',
'141坪',
'{"0":"場地主圖"}',
'由大門進來後左轉到底即可抵達1號倉庫',
0);

# table BOOKING insert

insert into mydb.BOOKING(PRICE, `STATUS`, STATUS_DATE, STATUS_REASON, START_DATE, END_DATE, BOOKING_NOTE, CS_BOOKING_NOTE, 
CREATE_DATE, FK_BOOKING_MEMBER_ID, FK_LOCATION_ID)
values(10000, 
0, 
NOW(), 
"", 
'2022-12-31', '2023-01-07', 
'BOOKING_NOTE', 
'', 
NOW(), 
5, 1);

# table INFO insert

insert into mydb.INFO(TITLE, CONTENT, MAIN_PHOTO, PERIOD, `STATUS`,
	CREATE_DATE, EDIT_DATE, FK_INFO_PAGE_ID, FK_INFO_TYPE_ID)
values('動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！',
'{"消息內文":"動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！動了感情卻到不了愛情？展覽《你被愛情小魔遮眼了嗎？》解除你對戀愛的各種意亂情迷！"}',
'{"0":"PRODUCT1.JPG"}', '2022/12/25 00:00 - 2023/01/07 23:59', 0, NOW(),NOW(), 1, 1);

# table PRODUCT insert

insert into mydb.PRODUCT(`NAME`,
 PERIOD, `STATUS`, HIDE, PRICE, `DESC`, MAIN_PHOTO, 
 STOCK_QTY, MAX_QTY, FK_SUPPLIER_ID, FK_PRODUCT_TYPE_ID,
 CREATE_DATE, EDIT_DATE, FK_PRODUCT_PAGE_ID)
 values('蒙娜麗莎貓貓掛畫',
 '2022/12/31 00:00 - 2046/12/31 00:00', 
 '0', 
 '0',
 960, 
 '{"商品描述":"文藝復興時期畫家列奧納多·達芬奇所繪的一幅肖像畫與其代表作。"}', 
 '{"0":"商品主圖"}', 
 9999, 
 10, 
 1, 
 1,
 NOW(), 
 NOW(), 2);
 
 # table CART insert
 
 insert into mydb.CART(FK_CART_MEMBER_ID, FK_CART_PRODUCT_ID, 
 QTY, CART_DATE)
 values(5, 1, 2, NOW());
 
 # table PO insert
 
  insert into mydb.PO(FK_PO_MEMBER_ID, FREIGHT, ETD, 
  `STATUS`, STATUS_DATE, CREATE_DATE)
 values(5, 60, now() + interval 5 day, 0, now(), now());
 
 # table PO_DETAIL insert
 
   insert into mydb.PO_DETAIL(FK_PO_DETAIL_PO_ID, FK_PO_DETAIL_PRODUCT_ID, QTY, 
   UNIT_PRICE)
 values(1, 1, 3, 960);
 
 # table EXPO insert
 
 insert into mydb.EXPO(FK_EXPO_PAGE_ID, TITLE, CONTENT, MAIN_PHOTO, START_DATE, END_DATE, 
 CREATE_DATE, EDIT_DATE, ADULT_PRICE, CONC_PRICE, GROUP_PRICE)
 values(3, '《Lindsayooo》新興畫家特展', '{"0":"最近在Instagram點擊量爆增粉絲人數達百萬最熱門的新創插畫家Lindsayoo，畫家細膩的筆觸與寫實的作畫風格，短時間快速達到百萬人數訂閱，應許多粉絲留言要求，多次連繫畫家展出活動接洽此次為韶光文創園區特別限定期間展出，千萬不要錯過好機會！限定期間2024.12.01~2024.12.32 ，購票即送限量明信片。"}', 
 '{"0":"EXPO.JPG"}', now(), now() + interval 20 day, now(), now(), 300, 250, 230);