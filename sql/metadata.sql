connect bos;

/*update entity set name=nameeng where length(ltrim(rtrim(name))) < 1;*/

delete from lookup where type = 'metrics.category';
/*
insert into lookup (type,description,value) values ('metrics.category','Music / Speech  <a class="reference" target="_blank" href="http://www.hksmsa.org.hk/download/winlist/63MWinner.pdf">資料來源: 第六十三屆香港學校音樂節</a> <a class="reference" target="_blank" href="http://www.hksmsa.org.hk/download/winlist/63SWinner.pdf">資料來源: 第六十三屆香港學校朗誦節</a>','m');
insert into lookup (type,description,value) values ('metrics.category','Campus','c');
insert into lookup (type,description,value) values ('metrics.category','Teacher (佔全校教師人數%)','t');
insert into lookup (type,description,value) values ('metrics.category','Academic','a');
insert into lookup (type,description,value) values ('metrics.category','School Fee','f');
insert into lookup (type,description,value) values ('metrics.category','Sport <a class="reference" target="_blank" href="http://www.hkssf-hk.org.hk/hk/sec/" ></a> <a class="reference" href="http://www.hkssf-hk.org.hk/hk/pri/results%20book/6_Results-Book_1011.pdf">資料來源: 香港學界體育聯會</a> ','s');
insert into lookup (type,description,value) values ('metrics.category','Basic Info.','b');
insert into lookup (type,description,value) values ('metrics.category','Course Desc.','x');
*/

insert into lookup (type,description,value) values ('metrics.category','music','m');
insert into lookup (type,description,value) values ('metrics.category','campus','c');
insert into lookup (type,description,value) values ('metrics.category','teacher','t');
insert into lookup (type,description,value) values ('metrics.category','academic','a');
insert into lookup (type,description,value) values ('metrics.category','schoolfee','f');
insert into lookup (type,description,value) values ('metrics.category','sport','s');
insert into lookup (type,description,value) values ('metrics.category','basicinfo','b');
insert into lookup (type,description,value) values ('metrics.category','coursedesc','x');


DROP TABLE IF EXISTS `entitymetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitymetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(100) DEFAULT NULL,
  `fieldlabel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
  `fieldorder` int(11) DEFAULT NULL,
  `categoryorder` int(11) DEFAULT NULL,
  `kpivalue` int(11) DEFAULT NULL,
  `iskpi` varchar(10) DEFAULT NULL,
  `fieldcategory` varchar(10) DEFAULT NULL,  
  `entitycategory` varchar(10) DEFAULT NULL,
  `active` varchar(10) DEFAULT NULL,
  `excludecompare` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- c=campus,t=teachear,a=academic,f=schoolfee,s=sport,m=art/music, b=basic, h=hidden
-- 1-Academic,         2-Sport,   3-School Fee,     4-Campus,         5-Teacher

-- Kindergarten
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('fullname',1,'b','y','學校名稱','0',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('address',2,'b','y','地址','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('telephone',3,'b','y','電話','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('url',4,'b','y','網址','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('language',5,'b','y','教學語言','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('nominated',6,'b','y','聯繫','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('throughtrain',7,'b','y','一條龍','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('feeder',8,'b','y','直屬','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolmission',9,'b','y','辦學宗旨','0',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('schoolmotto',10,'b','y','校訓','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('yearofcommencement',11,'b','y','創校年份','0',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('languagepolicy',12,'b','y','全校語文政策','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('financetype',13,'b','y','資助類別','0',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('poaschoolnet',14,'b','y','地區','0',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('nursery',15,'b','y','幼兒班/Nursery','0',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('name',16,'b','y','校名','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nameeng',17,'b','y','校名(英文)','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('sex',18,'b','y','性別','0',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('session',19,'b','y','授課時間','0',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('principal',20,'b','y','校長','0',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('religion',21,'b','y','宗教','0',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('session',22,'b','y','全日/半日班','0',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('email',25,'b','y','電郵','0',0,'y');



insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofclassroom',1,'c','y','課室數目','0',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('indoorplayground',2,'c','y','室內遊戲場地','0',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('outdoorplayground',3,'c','y','室外遊戲場地','0',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicroom',4,'c','y','音樂室','0',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofotherroom',5,'c','y','其他','0',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolfee',1,'f','y','學費','0',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('voucher',2,'f','y','兌現學券資格','0',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolfeenursery',3,'f','y','Nursery 學費','0',3);


insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherexperience',1,'t','y','年資7年或以上','0',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherbachelor',2,'t','y','學士','0',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherpupilam',3,'t','y','師生比例(上午)','0',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherpupilpm',4,'t','y','師生比例(下午)','0',5);

insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolallocationscore',1,'a','y','升小派位總分','0',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('qareport',2,'a','y','學前評核','0',1);


-- Primary
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('fullname',1,'b','y','學校名稱','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('address',2,'b','y','地址','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('telephone',3,'b','y','電話','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('url',4,'b','y','網址','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('language',5,'b','y','教學語言','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values 
('nominated',6,'b','y','聯繫','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values 
('throughtrain',7,'b','y','一條龍','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values 
('feeder',8,'b','y','直屬','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolmission',9,'b','y','辦學宗旨','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolmotto',10,'b','y','校訓','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('yearofcommencement',11,'b','y','創校年份','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('languagepolicy',12,'b','y','全校語文政策','1',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('financetype',13,'b','y','資助類別','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('poaschoolnet',14,'b','y','地區','1',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nursery',15,'b','y','幼兒班/Nursery','1',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('name',16,'b','y','校名','1',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nameeng',17,'b','y','校名(英文)','1',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('sex',18,'b','y','性別','1',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('session',19,'b','y','授課時間','1',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('principal',20,'b','y','校長','1',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('religion',21,'b','y','宗教','1',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nooftest',22,'b','y','全年全科測驗次數','1',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('noofexam',23,'b','y','全年全科考試次數','1',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('elite',24,'b','y','分班安排','1',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('email',25,'b','y','電郵','1',0,'y');


insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('area',1,'c','y','學校佔地面積','1',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofclassroom',2,'c','y','課室數目','1',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofhall',3,'c','y','禮堂數目','1',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofplayground',4,'c','y','操場數目','1',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('nooflibraryroom',5,'c','y','圖書館數目','1',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofspecialroom',6,'c','y','特別室','1',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofotherroom',7,'c','y','其他','1',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolfee',1,'f','y','學費','1',6);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('tuitionfee',2,'f','y','堂費','1',6);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherexperience',1,'t','y','年資10年或以上','1',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teachermaster',2,'t','y','學歷碩士、博士或以上','1',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherbachelor',3,'t','y','學士','1',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolallocationscore',1,'a','y','升中派位總分','1',1);
-- insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('exceedquota',2,'a','y','最高超額 (%)','1',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('overpercent',2,'a','y','自行收生率 (%)','1',1);


insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposmale',1,'s','y','學界比賽(男子)總分','1',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposfemale',2,'s','y','學界比賽(女子)總分','1',2);

insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('choirchinese',1,'m','y','合唱隊','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('choirforeign',2,'m','y','Choir','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('instrumentchinese',3,'m','y','中國樂器(二胡/琵琶)','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('instrumentwestern',4,'m','y','Musical Instruments','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicfirst',5,'m','y','音樂冠軍','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicsecond',6,'m','y','音樂亞軍','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicthird',7,'m','y','音樂季軍','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechfirst',8,'m','y','朗誦冠軍','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechsecond',9,'m','y','朗誦亞軍','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechthird',10,'m','y','朗誦季軍','1',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicother',11,'m','y','其它(個人)','1',3);


-- Secondary
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('fullname',1,'b','y','學校名稱','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('address',2,'b','y','地址','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('telephone',3,'b','y','電話','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('url',4,'b','y','網址','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('language',5,'b','y','教學語言','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('nominated',6,'b','y','聯繫','2',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('throughtrain',7,'b','y','一條龍','2',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('feeder',8,'b','y','直屬','2',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolmission',9,'b','y','辦學宗旨','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolmotto',10,'b','y','校訓','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('yearofcommencement',11,'b','y','創校年份','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('languagepolicy',12,'b','y','全校語文政策','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('financetype',13,'b','y','資助類別','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('poaschoolnet',14,'b','y','地區','2',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nursery',15,'b','y','幼兒班/Nursery','2',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('name',16,'b','y','校名','2',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nameeng',17,'b','y','校名(英文)','2',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('sex',18,'b','y','性別','2',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('session',19,'b','y','授課時間','2',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('principal',20,'b','y','校長','2',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('religion',21,'b','y','宗教','2',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('email',25,'b','y','電郵','2',0,'y');


insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('area',1,'c','y','學校佔地面積','2',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofspecialroom',6,'c','y','學校設施','2',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolfee',1,'f','y','學費','2',6);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('tuitionfee',2,'f','y','堂費','2',6);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherexperience',1,'t','y','年資10年或以上','2',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teachermaster',2,'t','y','學歷碩士、博士或以上','2',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherbachelor',3,'t','y','學士','2',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherforeign',4,'t','y','外籍老師','2',5);

insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('banding',1,'a','y','Banding','2',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('hkdsepassrate',2,'a','y','4主科3322率','2',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('chipassrate',3,'a','y','中文(達3率)','2',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('engpassrate',4,'a','y','英文(達3率)','2',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('urate',5,'a','y','入本地大學百份比','2',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('sixcoursesratio',6,'a','y','6科14分百份比','2',1);

insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposmale',1,'s','y','男子田徑組別/排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsdivmale',10,'s','y','athleticsposmaledivision','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposfemale',2,'s','y','女子田徑組別/排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsdivfemale',11,'s','y','athleticsposfemaledivision','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('footballpos',3,'s','y','男子足球組別/排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('footballdiv',12,'s','y','footballposdivision','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingposmale',4,'s','y','男子游泳組別/排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingdivmale',13,'s','y','swimmingposmaledivision','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingposfemale',5,'s','y','女子游泳組別/排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingdivfemale',14,'s','y','swimmingposfemaledivision','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballposmale',6,'s','y','男子籃球組別/排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballdivmale',15,'s','y','basketballposmaledivision','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballposfemale',7,'s','y','女子籃球組別/排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballdivfemale',16,'s','y','basketballposfemaledivision','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposmale',8,'s','y','新界地域中學(男子)排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposfemale',9,'s','y','新界地域中學(女子)排名','2',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsdivname',17,'s','y','athleticsdivisionname','2',2);

insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('choirchinese',1,'m','y','合唱隊','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('choirforeign',2,'m','y','Choir','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('instrumentchinese',3,'m','y','中國樂器(二胡/琵琶)','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('instrumentwestern',4,'m','y','Musical Instruments','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicfirst',5,'m','y','音樂冠軍','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicsecond',6,'m','y','音樂亞軍','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicthird',7,'m','y','音樂季軍','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechfirst',8,'m','y','朗誦冠軍','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechsecond',9,'m','y','朗誦亞軍','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechthird',10,'m','y','朗誦季軍','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicother',11,'m','y','其它(個人)','2',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('debatechi',12,'m','y','聯校中文辯論排名','2',3);


-- Extra
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('name',1,'b','y','學校名稱','4',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('address',2,'b','y','地址','4',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('url',3,'b','y','網址','4',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('phone',4,'b','y','電話號碼','4',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('email',5,'b','y','電郵','4',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('coursedesc',1,'x','y','課程','4',1);




-- IB
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('fullname',1,'b','y','學校名稱','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('address',2,'b','y','地址','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('telephone',3,'b','y','地址','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('url',4,'b','y','網址','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('language',5,'b','y','教學語言','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('nominated',6,'b','y','聯繫','5',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('throughtrain',7,'b','y','一條龍','5',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values 
('feeder',8,'b','y','直屬','5',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolmission',9,'b','y','辦學宗旨','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolmotto',10,'b','y','校訓','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('yearofcommencement',11,'b','y','創校年份','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('languagepolicy',12,'b','y','全校語文政策','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('financetype',13,'b','y','資助類別','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('poaschoolnet',14,'b','y','地區','5',0);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nursery',15,'b','y','幼兒班/Nursery','5',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('name',16,'b','y','校名','5',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('nameeng',17,'b','y','校名(英文)','5',0,'y');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('sex',18,'b','y','性別','5',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('session',19,'b','y','授課時間','5',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('principal',20,'b','y','校長','5',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('religion',21,'b','y','宗教','5',0,'n');
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder,excludecompare) values ('email',25,'b','y','電郵','5',0,'y');



insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('area',1,'c','y','學校佔地面積','5',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('noofspecialroom',6,'c','y','學校設施','5',4);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('schoolfee',1,'f','y','學費','5',6);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('tuitionfee',2,'f','y','堂費','5',6);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherexperience',1,'t','y','年資10年或以上','5',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teachermaster',2,'t','y','學歷碩士、博士或以上','5',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('teacherbachelor',3,'t','y','學士','5',5);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('dp',1,'a','y','DP(45分滿分)','5',1);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('igcse',2,'a','y','IGCSE(A* %)','5',1);

insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposmale',1,'s','y','男子田徑組別/排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsdivmale',10,'s','y','athleticsposmaledivision','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposfemale',2,'s','y','女子田徑組別/排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsdivfemale',11,'s','y','athleticsposfemaledivision','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('footballpos',3,'s','y','男子足球組別/排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('footballdiv',12,'s','y','footballposdivision','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingposmale',4,'s','y','男子游泳組別/排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingdivmale',13,'s','y','swimmingposmaledivision','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingposfemale',5,'s','y','女子游泳組別/排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('swimmingdivfemale',14,'s','y','swimmingposfemaledivision','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballposmale',6,'s','y','男子籃球組別/排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballdivmale',15,'s','y','basketballposmaledivision','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballposfemale',7,'s','y','女子籃球組別/排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('basketballdivfemale',16,'s','y','basketballposfemaledivision','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposmale',8,'s','y','新界地域中學(男子)排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsposfemale',9,'s','y','新界地域中學(女子)排名','5',2);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('athleticsdivname',17,'s','y','athleticsdivisionname','5',2);



insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('choirchinese',1,'m','y','合唱隊','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('choirforeign',2,'m','y','Choir','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('instrumentchinese',3,'m','y','中國樂器(二胡/琵琶)','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('instrumentwestern',4,'m','y','Musical Instruments','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicfirst',5,'m','y','音樂冠軍','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicsecond',6,'m','y','音樂亞軍','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicthird',7,'m','y','音樂季軍','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechfirst',8,'m','y','朗誦冠軍','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechsecond',9,'m','y','朗誦亞軍','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('speechthird',10,'m','y','朗誦季軍','5',3);
insert into bos.entitymetadata (fieldname,fieldorder,fieldcategory,active,fieldlabel,entitycategory,categoryorder) values ('musicother',11,'m','y','其它(個人)','5',3);

