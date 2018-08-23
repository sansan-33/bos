SELECT e.id,e.name,e.address, e.yearofcommencement, e.principal, e.categoryid FROM entity e, comment c WHERE e.id=c.entityid and c.year=2016 and c.type='system' and (e.yearofcommencement like '%沒有資料%' or e.principal like '%沒有資料%')
INTO OUTFILE '/home/ubuntu/yahoo.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

#mysqldump -u root -p  bos > bos.sql
mysqldump -u root -p  bos entity entityscore entitybasic > entity.sql
mysqldump -u root -p  bos > /home/ubuntu/bos_backup_sql/bos23Dec13.sql
#mysql -u root -p bos --default-character-set=utf8 < lookup2.sql
set define off;
DROP TABLE bos.user;
DROP TABLE bos.category;
drop table bos.news;
drop table bos.newscontent;
drop table bos.entity;
drop table bos.entitycomment;

CREATE TABLE bos.entity (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         nameeng VARCHAR(100) ,
         addresseng VARCHAR(100) ,
         districteng VARCHAR(100),
         languageeng VARCHAR(100),
         financetypeeng VARCHAR(100),
	 sessioneng VARCHAR(100),
         
         directeng VARCHAR(100),
         linkeng VARCHAR(100),
         religioneng VARCHAR(100),
         sexeng VARCHAR(100),
         principaleng VARCHAR(100),
         name VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         address VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci,
         district VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         language VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         financetype VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         session VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 direct VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         link VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         religion VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         sex VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         principal VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         schoolfee INT,
	 tuitionfee INT,
         area INT,
         noofclassroom  INT,
	 noofhall INT,
         noofplayground INT,
         nooflibraryroom INT,
         noofspecialroom VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci,
         noofotherroom VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 categoryid VARCHAR(100),
         poaschoolnet VARCHAR(100),
         url VARCHAR(100)
       );


CREATE TABLE bos.user (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         nameeng VARCHAR(100) ,
         email VARCHAR(100) ,
         password VARCHAR(100),
         roleid INT(11) default 0,
         name VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci
       );
CREATE TABLE bos.favorite (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         categoryid VARCHAR(100),
	 userid VARCHAR(100),
         entityid VARCHAR(100),
         status VARCHAR(100),
         grade INT(11),
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         interview TIMESTAMP,
         announcement TIMESTAMP,
         application TIMESTAMP,
         created TIMESTAMP 
    	);

CREATE TABLE bos.usercommentlike (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         userid VARCHAR(100),
         commentid VARCHAR(100),
         userlike INT(11) default 0,
        lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
    	);

drop table bos.lookup;
CREATE TABLE bos.lookup (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         type VARCHAR(100),
	 value VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
         description VARCHAR(100)  CHARACTER SET utf8 COLLATE utf8_general_ci
    	);
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','中西區 Central & Western District', '11')
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','灣仔 Wan Chai','12');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','北角/筲箕灣/柴灣 North Point/ Shau Kei Wan/ Chai Wan','14');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','北角/筲箕灣/柴灣 North Point/ Shau Kei Wan/ Chai Wan','16');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','薄扶林/香港仔/黃竹坑/赤柱 Pok Fu Lam/ Aberdeen/Wong Chuk Hang/ Stanley', '18');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','油麻地/尖沙咀/旺角 Yau Ma Tei/ Tsim Sha Tsui/ Mong Kok', '31'); 
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','油麻地/尖沙咀/旺角 Yau Ma Tei/ Tsim Sha Tsui/ Mong Kok', '32'); 
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','深水埗 Sham Shui Po','40');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','九龍城/何文田/紅磡 Kowloon City/ Ho Man Tin/ Hung Hom','34');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','九龍城/何文田/紅磡 Kowloon City/ Ho Man Tin/ Hung Hom','35');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','九龍城/何文田/紅磡 Kowloon City/ Ho Man Tin/ Hung Hom','41');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','黃大仙 Wong Tai Sin','43');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','黃大仙 Wong Tai Sin','45');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','九龍灣/牛頭角/觀塘/油塘 Kowloon Bay/ Ngau Tau Kok/Kwun Tong/ Yau Tong', '46');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','九龍灣/牛頭角/觀塘/油塘 Kowloon Bay/ Ngau Tau Kok/Kwun Tong/ Yau Tong', '48');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','荔景/葵涌/大窩口 Lai King/ Kwai Chung/ Tai Wo Hau', '64');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','荔景/葵涌/大窩口 Lai King/ Kwai Chung/ Tai Wo Hau', '65');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','青衣 Tsing Yi','66');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','荃灣 Tsuen Wan','62');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','屯門 Tuen Mun','70');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','屯門 Tuen Mun','71');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','天水圍/元朗 Tin Shui Wai/ Yuen Long','72');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','天水圍/元朗 Tin Shui Wai/ Yuen Long','73');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','天水圍/元朗 Tin Shui Wai/ Yuen Long','74');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','上水/粉嶺/北區 Sheung Shui/ Fanling/ North District','80');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','上水/粉嶺/北區 Sheung Shui/ Fanling/ North District','81');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','上水/粉嶺/北區 Sheung Shui/ Fanling/ North District','83');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','大埔 Tai Po','84');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','沙田 Shatin','88');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','沙田 Shatin','89');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','沙田 Shatin','91');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','西貢/將軍澳 Sai Kung/ Tseung Kwan O', '95');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','離島/東涌 Islands/ Tung Chung','96');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','離島/東涌 Islands/ Tung Chung','97');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','離島/東涌 Islands/ Tung Chung','98');
insert into bos.lookup (type,description,value) values ('district.poaschoolnet','離島/東涌 Islands/ Tung Chung','99');


insert into bos.lookup (type,description,value) values ('district.kindergarten','黃大仙 Wong Tai Sin','Wong Tai Sin');
insert into bos.lookup (type,description,value) values ('district.kindergarten','南區 Southern','Southern');
insert into bos.lookup (type,description,value) values ('district.kindergarten','元朗 Yuen Long','Yuen Long');
insert into bos.lookup (type,description,value) values ('district.kindergarten','大埔 Tai Po','Tai Po');
insert into bos.lookup (type,description,value) values ('district.kindergarten','西貢 Sai Kung','Sai Kung');
insert into bos.lookup (type,description,value) values ('district.kindergarten','屯門 Tuen Mun','Tuen Mun');
insert into bos.lookup (type,description,value) values ('district.kindergarten','沙田 Sha Tin','Sha Tin');
insert into bos.lookup (type,description,value) values ('district.kindergarten','荃灣 Tsuen Wan','Tsuen Wan');
insert into bos.lookup (type,description,value) values ('district.kindergarten','灣仔 Wan Chai','Wan Chai');
insert into bos.lookup (type,description,value) values ('district.kindergarten','九龍城 Kowloon City','Kowloon City');
insert into bos.lookup (type,description,value) values ('district.kindergarten','觀塘 Kwun Tong','Kwun Tong');
insert into bos.lookup (type,description,value) values ('district.kindergarten','葵青 Kwai Tsing','Kwai Tsing');
insert into bos.lookup (type,description,value) values ('district.kindergarten','深水埗 Sham Shui Po','Sham Shui Po');
insert into bos.lookup (type,description,value) values ('district.kindergarten','東區 East','East');
insert into bos.lookup (type,description,value) values ('district.kindergarten','北區 North','North');
insert into bos.lookup (type,description,value) values ('district.kindergarten','離島 Islands','Islands');
insert into bos.lookup (type,description,value) values ('district.kindergarten','油麻地/尖沙咀/旺角 Yau Tsim &amp; Mong Kok','Yau Tsim &amp; Mong Kok');
insert into bos.lookup (type,description,value) values ('district.kindergarten','中西區 Central &amp; Western','Central &amp; Western');

insert into bos.lookup (type,description,value) values ('entity.category.chi','幼稚園','0');
insert into bos.lookup (type,description,value) values ('entity.category.chi','小學','1');
insert into bos.lookup (type,description,value) values ('entity.category.chi','中學','2');
insert into bos.lookup (type,description,value) values ('entity.category.chi','課外活動','4');

insert into bos.lookup (type,description,value) values ('metric.parent.chi','校風','1');
insert into bos.lookup (type,description,value) values ('metric.parent.chi','老師','2');
insert into bos.lookup (type,description,value) values ('metric.parent.chi','功課','3');
insert into bos.lookup (type,description,value) values ('metric.parent.chi','學生','4');
alter table entity add metricparent1 decimal(4,1) ;
alter table entity add metricparent2 decimal(4,1) ;
alter table entity add metricparent3 decimal(4,1) ;
alter table entity add metricparent4 decimal(4,1) ;
alter table entity add metricoverall1 decimal(4,1) ;
alter table entity add metricoverall2 decimal(4,1) ;
alter table entity add metricoverall3 decimal(4,1) ;
alter table entity add metricoverall4 decimal(4,1) ;
alter table entity add metricoverall5 decimal(4,1) ;


alter table entity add parentcommentcount INT ;


CREATE TABLE bos.news (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         subject VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 entityid INT,
         userid INT, 
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
       );
      
      
CREATE TABLE bos.newscontent (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         newsid INT,
         seq INT,
	 content VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci,
         userid INT, 
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
   	);
      
insert into bos.news (subject,entityid,userid,created) values ('school CSK start application','1','1',now());    
insert into bos.newscontent (newsid,seq,content,userid,created) values (1,1,'start on 13-Sep-2011',1,now());    
insert into bos.newscontent (newsid,seq,content,userid,created) values (1,2,'thx, 1st interview on mid of oct',1,now());    


insert into bos.user (nameeng,email,password,name,roleid) values ('AW','anthan.wong@gmail.com','abcd1234','AW',1);
insert into bos.user (nameeng,email,password,name,roleid) values ('AY','anthea_yip@yahoo.com.hk','abcd1234','AY',0);


insert into bos.lookup (type,value,description) values ('school','kdg','Kidegarden');
insert into bos.lookup (type,value,description) values ('school','pri','Primary School');
insert into bos.lookup (type,value,description) values ('school','sec','secondary School');


drop table bos.comment;

CREATE TABLE bos.comment (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         comment VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 userlike INT,
         userdislike INT,
	 entityid INT,
         userid INT, 
	 subject varchar(100),
	 grade int(11) default 0,
	 metric1 int(11) default 0,
	 metric2 int(11) default 0,
	 metric3 int(11) default 0,
	 metric4 int(11) default 0,
	 metric5 int(11) default 0,
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
       );

CREATE TABLE bos.event (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         title VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 note VARCHAR(4000) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 entityid INT,
	 active  varchar(10),
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
 	 startdate TIMESTAMP,
         enddate TIMESTAMP,
         created TIMESTAMP 
       );

CREATE TABLE bos.networktraffic (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         ip varchar(100),
	 page varchar(100),
	 userid INT,
	 url varchar(100),
	 browser varchar(100),
	 lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
 	 created TIMESTAMP 
       );

CREATE TABLE bos.schoolallocation (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 entityidfrom INT,
	 entityidto INT,
	 noofstudent INT,
	 reference VARCHAR(400) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 allocationyear INT, 	
	 lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
 	 created TIMESTAMP 
       );
 

insert into bos.comment (comment,entityid,userid,created) values ('Very good environment and teacher','1050','2',now());
insert into bos.comment (comment,entityid,userid,created) values ('school fee is not the most expensive','1050','3',now());


alter table entity add voucher varchar(10);
alter table entity add activitieswithparent VARCHAR(2000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add nursery varchar(10);
alter table entity add schoolfeenursery varchar(100);
alter table entity add outdoorplayground varchar(100);
alter table entity change noofplayground noofplayground varchar(100);
alter table entity change addresseng addresseng varchar(1000);  
alter table entity add chscid int(11);
alter table entity add phone varchar(100);
alter table entity add email varchar(100);

alter table entity add coursekeywords varchar(2000);
alter table entity add coursedesc varchar(30000);
alter table entity add created TIMESTAMP  ;
alter table entity add lastmodified TIMESTAMP  ;
alter table entity change nominated nominated varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add throughtrain VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add feeder VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci;

alter table entity change coursekeywords coursekeywords varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table comment change comment comment varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity change coursedesc coursedesc varchar(30000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add yearofcommencement VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add discretionaryplaces VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add secondaryoneadmission VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add transportation VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add telephone VARCHAR(100);
alter table entity change area area varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table event change note note varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table user add lastmodified TIMESTAMP;
alter table user add lastlogin TIMESTAMP;
alter table user add created TIMESTAMP;
alter table entity add teacherexperience int(11);
alter table entity add teachermaster int(11);
alter table entity add teacherbachelor int(11);
alter table entity add banding varchar(100);
alter table entity change sixcoursesration sixcoursesratio int(11);

alter table entity add athleticsdiv varchar(50);
alter table entity add athleticspos int(11);
alter table entity add athleticsyear int(11);
alter table entity change athleticsdiv athleticsdivmale varchar(50);
alter table entity change athleticspos athleticsposmale int(11);
alter table entity change athleticsyear athleticsyearmale int(11);
alter table entity add athleticsdivfemale varchar(50);
alter table entity add athleticsposfemale int(11);
alter table entity add athleticsyearfemale int(11);
alter table entity change area area int(11);
alter table entity add exceedquota int(11);
alter table entity add schoolallocationscore int(11);
alter table lookup change description description VARCHAR(200)  CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add ranking int(11);
alter table entity add score int(11);
alter table entity change score score decimal(4,1);
alter table entity add schoolmotto  VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add schoolmission  VARCHAR(2000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table networktraffic add entityid int(11);
alter table entity add languagepolicy VARCHAR(6000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table comment add metric6 int(11);
alter table entity add scorefinancetype int(11);
alter table entity add scoredistrict int(11);
alter table entity change score score int(11);
alter table entity change rankingfinancetype  rankingfinancetype  int(11);
alter table entity change rankingdistrict  rankingdistrict  int(11);
alter table entity change score score decimal(4,1);
alter table comment change metric1 metric1 decimal(4,1);
alter table comment change metric2 metric2 decimal(4,1);
alter table comment change metric3 metric3 decimal(4,1);
alter table comment change metric4 metric4 decimal(4,1);
alter table comment change metric5 metric5 decimal(4,1);
alter table comment change metric6 metric6 decimal(4,1);


CREATE TABLE bos.questionanswer (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         questionanswer VARCHAR(10000) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 userlike INT,
         accept varchar(1),
	 entityid INT,
         userid INT, 
         type varchar(1), 
	 active varchar(1),
	 subject VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 parentid INT,
tag1 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
tag2 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
tag3 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
tag4 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
tag5 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
       );
CREATE TABLE bos.questionanswerlike (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         userid VARCHAR(100),
         ipaddr VARCHAR(100),
         questionanswerid INT(11),
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
    	);


alter table lookup add sortorder int(11);


alter table user add questionanswerscore int(11) default 0;
alter table user add noofanswer int(11) default 0;
alter table questionanswer add entityid int(11) default 0;

alter table user add socialid varchar(100);
alter table user change socialtype anonymous  varchar(10);
alter table user add anonymous varchar(1);
alter table user change socialid socialfbid  varchar(100);

alter table comment add metadesc varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table comment add keywords  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci;


alter table user change  nameeng namelocal  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table user change  name namesocial  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci;

alter table entity add indoorplayground varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add musicroom varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity add qareport varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table entity change outdoorplayground outdoorplayground varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table lookup add imgpath varchar(100);
alter table entity add qareporturl varchar(100);
alter table entity add speechfirst int(11);
alter table entity add speechsecond int(11);
alter table entity add speechthird int(11);
alter table entity add speechscore int(11);

alter table enttiy drop district;
alter table entity add teacherpupilam varchar(20);
alter table entity add teacherpupilpm varchar(20);
alter table networktraffic change browser browser varchar(300);
alter table networktraffic add entityid1  int(11) default 0;
alter table networktraffic add entityid2  int(11) default 0;
alter table networktraffic add entityid3  int(11) default 0;
alter table networktraffic add entityid4  int(11) default 0;
alter table networktraffic add entityid5  int(11) default 0;
alter table entity add urate int(11) default 0;
alter table entity add chipassrate int(11) default 0;
alter table entity add engpassrate int(11) default 0;
alter table entity add alpassrate int(11) default 0;
alter table entity add enrolltotal int(11) default 0;
alter table entity add totalstaff int(11) default 0;
alter table entityscore add totalstaff int(11) default 0;

alter table entityimage add external varchar(10) default 'n';

alter table comment add ip varchar(50);
alter table comment add type varchar(10);
update entity set session=SUBSTRING(session, 1, CHAR_LENGTH(session) - 62)  where id in (3500,3523,3596,3599,3604,3605,3637,3869);
alter table entity add parentscore int(11);
alter table entity add football int(11) default 0;
alter table entity add swimming int(11) default 0;

alter table user add kidentityid int(11) default 0;
alter table user add parententityid int(11) default 0;
alter table questionanswer add  ipaddr VARCHAR(100);
alter table user add parentratingcount int(11) default 0;
alter table user change questionanswerscore userscore int(11) default 0;

ALTER TABLE entity DROP coursedesc;
alter table entity change esf govbody VARCHAR(100);
alter table entity add primaryprogramme VARCHAR(1);
alter table entity add middleprogramme VARCHAR(1);
alter table entity add diplomaprogramme VARCHAR(1);
alter table entity add entitylink int(11);


CREATE TABLE bos.objectstat (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         objectid int(11),
         type VARCHAR(20),
         hitcounter int(11),
	 status VARCHAR(10),
	 lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
    	);

insert into bos.objectstat (objectid,type,hitcounter,status,lastmodified,created) select entityid, 'entity', count(entityid),'active',current_timestamp, current_timestamp from networktraffic group by entityid;




CREATE TABLE bos.course (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 coursedesc VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 courseimg varchar(100),	
         userid int(11),
         tutorcategoryid int(11),
         class VARCHAR(20),
         hourlyrate int(11),
	 hitcounter int(11),
	 status VARCHAR(10),
	 lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
    	);

alter table lookup add tooltips varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci;

insert into course (coursename,coursedesc,courseimg,userid,tutorcategoryid,class ,hourlyrate, hitcounter ,status ,lastmodified ,created) values('music','music grade 1-8','no img','1',3,'Age 1- 10',100,1,'a',current_timestamp,current_timestamp);


alter table user add selfintro varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE bos.usertutorcategory (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         userid int(11),
         tutorcategoryid int(11),
	 bestdesc VARCHAR(200) CHARACTER SET utf8 COLLATE utf8_general_ci,
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
);


insert into bos.lookup (type,description,value,sortorder,tooltips) values ('user.role','admin','1',1,'');
insert into bos.lookup (type,description,value,sortorder,tooltips) values ('user.role','tutor','2',2,'');
insert into bos.lookup (type,description,value,sortorder,tooltips) values ('user.role','school','3',3,'');

alter table usertutorcategory add tutorialexp varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table usertutorcategory add tutormaxgrade varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table user add sex varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table course add lookupclassid int(11);
alter table course add lookupclassrangestartid int(11);
alter table course add lookupclassrangeendid int(11);
alter table course change class remark  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table course drop coursename;
alter table course change lookupclassid lookupclassid VARCHAR(20);


CREATE TABLE bos.parenttutorsearch (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         userid int(11),
	 kidgradelookupid varchar(100),
	 lookupclassid varchar(100),
	 districtlookupid varchar(100), 
         tutorcategoryid varchar(100),
	 hourlyrate varchar(100),
	 sex varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 specialrequest VARCHAR(300) CHARACTER SET utf8 COLLATE utf8_general_ci,
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
);


alter table user add lookupdistrict1 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table user add lookupdistrict2 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table user add lookupdistrict3 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;

alter table user change lookupdistrictid1 lookupdistrict1 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table user change lookupdistrictid2 lookupdistrict2 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;
alter table user change lookupdistrictid3 lookupdistrict3 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci;


alter table course add notes varchar(10);
alter table user add userprofile varchar(200);


alter table event add eventtype varchar(10);
alter table favorite change grade grade int(11) default 999;
alter table entityscore add debatechi int(11) default 999;
alter table entity add debatechi int(11) default 999;
alter table entity add admitted int(11) default 0;
alter table entity add vacancy int(11) default 0;
alter table entityscore add admitted int(11) default 0;
alter table entityscore add vacancy int(11) default 0;


update entity set admitted=99,vacancy=99 where name like '%英華小學%';
update entityscore set admitted=99,vacancy=99 where entityid = (select id from entity where name like '%英華小學%') and year=2012;

mysqldump -uroot -p --no-create-db --no-create-info  --where="year=2011 and type='system'" bos comment > 2011commentsystem.sql


select id,comment from comment where comment like '%http://%' and type != 'system' order by lastmodified desc limit 10;
select id,title,ipaddr,lastmodified  from event where userid is null and ipaddr is null and length(note) = 0;
select count(1)   from comment where comment like '%http://%' and type != 'system' and userid='-1';


alter table entity add status varchar(10);

tee /home/awong/session.out;

update lookup set name='荔景/葵涌/大窩口/青衣 Lai King/ Kwai Chung/ Tai Wo Hau/ Tsing Yi' where id in (904,905,906);

alter table entityscore add qareporturl varchar(200);
alter table entity change qareporturl qareporturl varchar(200);
alter table entityscore change qareporturl qareporturl varchar(200);


update entityscore set musicother=0 where year=2013;
update entityscore es, entity e set es.sex =e.sex where es.entityid=e.id and es.year=2013;



select name, e.id, c1.metric1 as metric12011,es2011.schoolallocationscore as sas2011, es2011.exceedquota as eq2011,
c2.metric1 as metric12012, es2012.schoolallocationscore as sas2012, es2012.exceedquota as eq2012,
c3.metric1 as metric12013, es2013.schoolallocationscore as sas2013 , es2013.exceedquota as eq2013 from entity e, entityscore es2011, entityscore es2012, entityscore es2013,comment c1,comment c2,comment c3
where e.id=c1.entityid and e.id=c2.entityid and e.id=c3.entityid  and c3.year=2013 and c2.year=2012 and c1.year=2011
and e.id=es2011.entityid and es2011.categoryid=1 and es2011.year=2011
and e.id=es2012.entityid and es2012.categoryid=1 and es2012.year=2012
and e.id=es2013.entityid and es2013.categoryid=1 and es2013.year=2013
order by es2013.schoolallocationscore desc, es2013.exceedquota desc
INTO OUTFILE '/tmp/orders.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'


alter table entity change schoolallocationscore schoolallocationscore decimal(4,1) default 0;
alter table entityscore change schoolallocationscore schoolallocationscore decimal(4,1) default 0;


update entity set throughtrain="西貢崇真天主教學校（中學部）" where id=3643;
update entity set throughtrain="" where id=3799;
update entity set throughtrain="嘉諾撒聖瑪利書院" where id=3521;
update entity set feeder="慈幼英文學校" where id=3441;
update entity set throughtrain="" where id=3536;
update entity set throughtrain="" where id=3898;
update entity set feeder="德望學校",throughtrain="" where id=3850;
update entity set throughtrain="順德聯誼總會翁祐中學" where id=3900;
update entity set feeder="寶血女子中學" where id=3830;
update entity set feeder="東華三院張明添中學" where id=3919;


update entity set financetypeeng='direct' where financetype='直資';
update entity set financetypeeng='private' where financetype='私立';


alter table entity change schoolallocationscore schoolallocationscore decimal(5,2) default 0;
alter table entityscore change schoolallocationscore schoolallocationscore decimal(5,2) default 0;
alter table entity change score score decimal(5,2) default 0;
alter table entityscore change score score decimal(5,2) default 0;



alter table event add url varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci;
update event set title='小一統一派位辦理選校手續' , url='http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2014_leaflet_tc.pdf' where id=47;
update event set title='小一自行分配學位' , url='http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2014_leaflet_tc.pdf' where id=48;
update event set title='小一自行分配學位公佈結果' , url='http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2014_leaflet_tc.pdf', enddate='2013-11-25'  where id=49;
update event set title='小一統一派位公佈結果' , url='http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2014_leaflet_tc.pdf', startdate='2014-06-07' where id=50;
update event set title='中一統一派位選校日期為 2013年4月上旬' , url='http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/SecSch_TC_2014_web.pdf', startdate='2014-04-01', enddate='2014-04-15'  where id=51;
update event set title='中一自行分配學位申請' , url='http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/SecSch_TC_2014_web.pdf' where id=52;
update event set title='中學學位分配公布派位結果' , url='http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/SecSch_TC_2014_web.pdf' , startdate='2014-07-08',enddate='2014-07-08' where id=53;


UPDATE event
SET enddate = DATE_ADD(startdate , INTERVAL 1 DAY)
WHERE enddate ='0000-00-00 00:00:00' and eventtype !='principalsay';


insert into user ()



alter table entity change outdoorplayground  outdoorplayground varchar(50) ;
alter table entity change indoorplayground  indoorplayground varchar(50) ;
alter table entity change musicroom  musicroom varchar(50) ;
alter table entityscore change outdoorplayground  outdoorplayground varchar(50) ;
alter table entityscore change indoorplayground  indoorplayground varchar(50) ;
alter table entityscore change musicroom  musicroom varchar(50) ;


alter table entity change chipassrate  chipassrate decimal(4,1) ;
alter table entity change engpassrate  engpassrate decimal(4,1) ;
alter table entity change urate  urate decimal(4,1) ;
alter table entityscore change chipassrate  chipassrate decimal(4,1) ;
alter table entityscore change engpassrate  engpassrate decimal(4,1) ;
alter table entityscore change urate  urate decimal(4,1) ;
alter table entity add chscidnew  int(11) ;


-- 2015 March Update
alter table entity add nooftest  varchar(10) ;
alter table entity add noofexam  varchar(10) ;
alter table entity add elite  varchar(200) ;
alter table entityscore add nooftest  varchar(10) ;
alter table entityscore add noofexam  varchar(10) ;
alter table entityscore add elite  varchar(200) ;
alter table entity drop districteng;
alter table entity drop linkeng;
alter table entity drop principaleng;
alter table entity drop religioneng;
alter table entity drop sessioneng;


update entity set nameeng='ST JAMES'' SETTLEMENT BELCHER KINDERGARTEN' where id=5554;
update entity set nameeng='ST. CLARE''S PRIMARY SCHOOL' where id=5585;
update entity set nameeng='CHAI WAN BAPTIST CHURCH PRE-SCHOOL EDUCATION LUI MING CHOI KINDERGARTEN (SIU SAI WAN)' where id=5105;
update entity set nameeng='SUNSHINE HOUSE INTERNATIONAL PRE-SCHOOL (TUNG CHUNG)' , name='SUNSHINE HOUSE INTERNATIONAL PRE-SCHOOL (TUNG CHUNG)' where id=5649;
update entity set nameeng='NEW TERRITORIES WOMEN & JUVENILES WELFARE ASSOCIATION LIMITED FANLING NURSERY SCHOOL', name='新界婦孺福利會粉嶺幼兒學校' where id=5412;
update entity set nameeng='NEW TERRITORIES WOMEN & JUVENILES WELFARE ASSOCIATION LIMITED SHEUNG SHUI NURSERY SCHOOL', name='新界婦孺福利會上水幼兒學校' where id=5414;
update entity set nameeng='NTW&JWA LIMITED CHEUNG FAT ESTATE NURSERY SCHOOL' , name='新界婦孺福利會長發邨幼兒學校' where id=5411;


update entity set nameeng='DEBORAH ENGLISH KINDERGARTEN (BAUHINIA GARDEN)',name='德寶英文幼稚園﹝寶盈花園﹞' where id=5109;
update entity set nameeng='WOMEN''S WELFARE CLUB WESTERN DISTRICT HONG KONG AP LEI CHAU KINDERGARTEN',name='香港西區婦女福利會鴨脷洲邨幼稚園' where id=5800;
 -- update entity set nameeng='ETONHOUSE INTERNATIONAL PRE-SCHOOL',name='伊頓國際幼稚園' where id=1234;
update entity set nameeng='WOODLAND MONTESSORI PRE-SCHOOL (REPULSE BAY)',name='WOODLAND MONTESSORI PRE-SCHOOL (REPULSE BAY)' where id=5795;
update entity set nameeng='PO LEUNG KUK SHEK KIP MEI KINDERGARTEN',name='保良局石硤尾幼稚園' where id=1234;
update entity set nameeng='TSUNG TSIN PRIMARY SCHOOL AND KINDERGARTEN (LOCAL STREAM)',name='崇真小學暨幼稚園 （本地課程）' where id=5737;
update entity set nameeng='NTW&JWA LIMITED POK HONG ESTATE NURSERY SCHOOL',name='新界婦孺福利會博康邨幼兒學校' where id=5413;
-- update entity set nameeng='INTERNATIONAL COLLEGE HONG KONG HONG LOK YUEN (KINDERGARTEN SECTION)',name='INTERNATIONAL COLLEGE HONG KONG HONG LOK YUEN (KINDERGARTEN SECTION)' where id=1234;
update entity set nameeng='ST JAMES'' SETTLEMENT CAUSEWAY BAY KINDERGARTEN',name='聖雅各褔群會銅鑼灣幼稚園' where id=5555;
update entity set nameeng='ST JAMES'' SETTLEMENT KATHLEEN MCDOUALL KINDERGARTEN',name='聖雅各褔群會麥潔蓮幼稚園' where id=5556;
update entity set nameeng='THE TRUE LIGHT MIDDLE SCHOOL OF HONG KONG',name='香港真光中學' where id=5705;
update entity set nameeng='ALISON''S LETTERLAND INTERNATIONAL KINDERGARTEN',name='ALISON''S LETTERLAND INTERNATIONAL KINDERGARTEN' where id=4944;
update entity set nameeng='LYC''EE FRANCAIS INTERNATIONAL (FRENCH INTERNATIONAL SCHOOL)',name='LYC''EE FRANCAIS INTERNATIONAL (FRENCH INTERNATIONAL SCHOOL)' where id=5370;
update entity set nameeng='JING JING ANGLO-CHINESE KINDERGARTEN (HUNG SHUI KIU BRANCH)',name='晶晶中英文幼稚園﹝洪水橋分校﹞' where id=5286;
update entity set nameeng='NEW TERRITORIES WOMEN & JUVENILES WELFARE ASSOCIATION LIMITED YUEN LONG NURSERY SCHOOL',name='新界婦孺福利會元朗幼兒學校' where id=5415;
update entity set nameeng='YUEN LONG CHURCH (CHURCH OF CHRIST IN CHINA) CHAN KWONG KINDERGARTEN',name='中華基督教會元朗堂真光幼稚園' where id=5845;
update entity set nameeng='YUEN LONG CHURCH (CHURCH OF CHRIST IN CHINA) LONG PING ESTATE CHAN KWONG KINDERGARTEN',name='中華基督教會元朗堂朗屏邨真光幼稚園' where id=5836;
update entity set nameeng='SUN ISLAND ENGLISH KINDERGARTEN (YAU MA TEI BRANCH)',name='太陽島英文幼稚園﹝油麻地分校﹞' where id=5640;
-- update entity set nameeng='SOPHIE KINDERGARTEN',name='蔚思幼稚園' where id=1234;
-- update entity set nameeng='JONATHAN INNOVATIVE ENGLISH KINDERGARTEN',name='永樂創新英文幼稚園' where id=1234;
-- update entity set nameeng='HONG KONG LING LIANG CHURCH TSUEN WAN KINDERGARTEN',name='香港靈糧堂荃灣幼稚園' where id=1234;
-- update entity set nameeng='ABIDING KINDERGARTEN',name='遵道幼稚園' where id=1234;
-- update entity set nameeng='GLORIA CREATIVE KINDERGARTEN (SHEUNG SHUI)',name='耀基創藝幼稚園（上水）' where id=1234;
-- update entity set nameeng='ZENITH KINDERGARTEN (TUEN MUN)',name='英藝幼稚園（屯門）' where id=1234;
-- update entity set nameeng='AGNES WISE KINDERGARTEN',name='雅麗斯樂思幼稚園' where id=1234;
-- update entity set nameeng='MANHABIT KINDERGARTEN (KOWLOON CITY)',name='文娜雅拔幼稚園（九龍城）' where id=1234;
-- update entity set nameeng='CHRISTIAN ADRIANNE KINDERGARTEN (BAYVIEW)',name='基督教安得兒幼稚園（灣景）' where id=1234;
-- update entity set nameeng='GALILEE INTERNATIONAL KINDERGARTEN',name='伽利利國際幼稚園' where id=1234;
-- update entity set nameeng='GOLDEN GATE INTERNATIONAL KINDERGARTEN',name='GOLDEN GATE INTERNATIONAL KINDERGARTEN' where id=1234;
-- update entity set nameeng='WISE LE SAGE ANGLO-CHINESE KINDERGARTEN',name='雅然中英文幼稚園' where id=1234;
-- update entity set nameeng='ZENITH KINDERGARTEN (SHERWOOD)',name='英藝幼稚園（賞湖）' where id=1234;
-- update entity set nameeng='JOYFUL WORLD KINDERGARTEN (BELVEDERE)',name='心怡天地幼稚園（麗城）' where id=1234;
-- update entity set nameeng='ANTONIA INTERNATIONAL KINDERGARTEN',name='安東尼亞國際幼稚園' where id=1234;
-- update entity set nameeng='TSUNG TSIN PRIMARY SCHOOL AND KINDERGARTEN (NON-LOCAL STREAM)',name='崇真小學暨幼稚園（非本地課程）' where id=1234;
-- update entity set nameeng='EXCEL LONDON HOUSE INTERNATIONAL KINDERGARTEN',name='倫敦家國際幼稚園' where id=1234;
-- update entity set nameeng='MORI LISA INTERNATIONAL KINDERGARTEN',name='MORI LISA INTERNATIONAL KINDERGARTEN' where id=1234;
-- update entity set nameeng='SAINT BRIGIT INTERNATIONAL KINDERGARTEN',name='聖姬莉國際幼稚園' where id=1234;
-- update entity set nameeng='HONG KONG LING LIANG CHURCH SAU TAK KINDERGARTEN',name='香港靈糧堂秀德幼稚園' where id=1234;
-- update entity set nameeng='BUDDHIST MR. & MRS. CHAN CHART MAN KINDERGARTEN',name='佛教陳策文伉儷幼稚園' where id=1234;




insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2015小一統一派位公佈結果', '<ul><li>2015小一統一派位公佈結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2015_leaflet_tc.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'6-6-2015','6-6-2015',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2015_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2015中學學位分配公布派位結果', '<ul><li>2015中學學位分配公布派位結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/SSPA_2015_TC.pdfhttp://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/SSPA_2015_TC.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2015-07-07','2015-07-07',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/SSPA_2015_TC.pdf');


insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('二○一六年九月小一入學自行分配學位 ', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_addendum.pdf' ,10001,'y',current_timestamp,'2015-09-02','2015-09-25',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_addendum.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('二○一六年九月小一入學自行分配學位公布派位結果', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_addendum.pdf' ,10001,'y',current_timestamp,'2015-11-23','2015-11-23',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_addendum.pdf');


insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2016小一入學 統一派位學位申請', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_addendum.pdf' ,10001,'y',current_timestamp,'2016-01-30','2016-01-31',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_addendum.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2016小一入學 統一派位公佈結果', '<ul><li>2016小一入學 統一派位公佈結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_addendum.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2016-06-04','2016-06-04',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2016_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2016中學學位 申請自行分配學位', '<ul><li>2016中學學位 申請自行分配學位</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/index.html">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2016-01-04','2016-01-20',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/index.html');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2016中學學位 申請統一派位', '<ul><li>2016中學學位 申請統一派位</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/index.html">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2016-04-01','2016-05-10',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/index.html');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2016中學學位 公布自行分配學位及統一派位結果', '<ul><li>016中學學位 公布自行分配學位及統一派位結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/index.html">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2016-07-05','2016-07-05',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/index.html');



insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017年九月小一入學自行分配學位 ', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf' ,10001,'y',current_timestamp,'2016-09-05','2016-09-30',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017年九月小一入學自行分配學位公布派位結果', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf' ,10001,'y',current_timestamp,'2016-11-21','2016-11-21',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf');


insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017小一入學 統一派位學位申請', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf' ,10001,'y',current_timestamp,'2017-02-11','2017-02-12',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017小一入學 統一派位公佈結果', '<ul><li>2017小一入學 統一派位公佈結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2017-06-03','2017-06-03',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017中學學位 申請自行分配學位', '<ul><li>2017中學學位 申請自行分配學位</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1517_TC.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2017-01-03','2017-01-18',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1517_TC.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017中學學位 申請統一派位', '<ul><li>2017中學學位 申請統一派位</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1517_TC.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2017-05-01','2017-05-15',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1517_TC.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017中學學位 公布自行分配學位及統一派位結果', '<ul><li>2017中學學位 公布自行分配學位及統一派位結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1517_TC.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2017-07-11','2017-07-11',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1517_TC.pdf');



insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017年九月小一入學自行分配學位 ', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf' ,10001,'y',current_timestamp,'2016-09-05','2016-09-30',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2017年九月小一入學自行分配學位公布派位結果', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf' ,10001,'y',current_timestamp,'2016-11-21','2016-11-21',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2017_leaflet_tc.pdf');



insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2018小一入學 統一派位學位申請', 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2018_leaflet_tc.pdf' ,10001,'y',current_timestamp,'2018-02-03','2018-02-03',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2018_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2018小一入學 統一派位公佈結果', '<ul><li>2018小一入學 統一派位公佈結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2018_leaflet_tc.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2018-06-02','2018-06-02',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/primary-1-admission/poa2018_leaflet_tc.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2018中學學位 申請自行分配學位', '<ul><li>2018中學學位 申請自行分配學位</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1618_TC.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2018-01-02','2018-01-17',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1618_TC.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2018中學學位 申請統一派位', '<ul><li>2018中學學位 申請統一派位</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1618_TC.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2018-04-10','2018-05-10',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1618_TC.pdf');

insert into event (title,note,entityid,active,lastmodified,startdate,enddate,created,eventtype,ipaddr,userid,url)
values('2018中學學位 公布自行分配學位及統一派位結果', '<ul><li>2018中學學位 公布自行分配學位及統一派位結果</li><li><a rel="nofollow" target="_blank" href="http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1618_TC.pdf">資料來源</a></li></ul>' ,10001,'y',current_timestamp,'2018-07-10','2018-07-10',current_timestamp,'importantday','',1, 'http://www.edb.gov.hk/attachment/tc/edu-system/primary-secondary/spa-systems/secondary-spa/general-info/Leaflet_SSPA1618_TC.pdf');





ALTER TABLE objectstat ADD CONSTRAINT CK_objectstat UNIQUE (objectid,type);



mysql> update entity set name ='約克英文小學暨幼稚園（九龍塘）' where id=5840;

mysql> update entity set name ='銅鑼灣維多利亞國際幼稚園' where id=5034;

mysql> update entity set name ='啓思小學附屬幼稚園' where id=5098;

mysql> update entity set name ='銅鑼灣維多利亞幼稚園' where id=5035;

mysql> update entity set name ='聖公會幼稚園 (畢拉山) -- 已合拼' where id=5539;

mysql> update entity set name ='英藝幼稚園 (天水圍) -- 已關閉' where id=5854;

alter table entitybasic change created created TIMESTAMP;
alter table entitybasic change lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,

alter table entitybasic add lng varchar(20);
alter table entitybasic add lat varchar(20);
alter table entitybasic add isclosed varchar(1);
alter table entitybasic change isyahoo notshowyahoo varchar(1);
alter table entitybasic add nameyahoo  VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci;



insert into bos.lookup (type,description,value) values ('api.auth','api','api.user');
insert into bos.lookup (type,description,value) values ('api.auth','api9751','api.pwd');
alter table questionanswer add  childanswer VARCHAR(2000);

alter table entitybasic change isyahoo notshowyahoo varchar(1);
alter table entitybasic add nameyahoo  VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci;

update entity set name='九龍禮賢學校' where id=3689;
update entity set name='九龍禮賢學校' where id=5323;
update entity set name='優才（楊殷有娣）書院' where id=3639;
update entity set name='國際英文幼稚園' where id=5583;
update entitybasic set nameyahoo='九龍禮賢學校小學部' where entityid=3689;
update entitybasic set nameyahoo='九龍禮賢學校幼稚園部' where entityid=5323;
update entitybasic set nameyahoo='優才（楊殷有娣）書院小學部' where entityid=3639;
update entitybasic set nameyahoo='國際英文幼稚園(羅福道)' where entityid=5583;

update entitybasic set nameyahoo='培僑書院（小學部）' where entityid=3737;
update entitybasic set nameyahoo='培僑書院（中學部）' where entityid=6121;
update entitybasic set notshowyahoo='y' where entityid in (6021,5142);


update entitybasic set nameyahoo='大埔禮賢會幼稚園（正校）' where entityid=5659;
update entitybasic set nameyahoo='大埔禮賢會幼稚園（分校）' where entityid=5660;
update entity set address='大埔安富道2-8號金富樓一至二字樓', telephone='26574168' where entityid=5660;
update entitybasic set nameyahoo='安基司國際幼兒園（滌濤山分校）' where entityid=4951;
update entitybasic set nameyahoo='安菲爾國際幼稚園（九龍塘）' where entityid=4954;
update entitybasic set nameyahoo='安菲爾國際幼稚園（黃埔）' where entityid=4953;

update entitybasic set nameyahoo='德望小學暨幼稚園（幼稚園）' where entityid=5864;
update entitybasic set nameyahoo='德望小學暨幼稚園（小學部）' where entityid=3850;

update entitybasic set nameyahoo='救恩學校（幼稚園）' where entityid=5928;
update entitybasic set nameyahoo='救恩學校（小學部）' where entityid=3436;

update entitybasic set nameyahoo='東涌天主教學校（小學部）' where entityid=3474;
update entitybasic set nameyahoo='東涌天主教學校（中學部）' where entityid=5967;
update entitybasic set notshowyahoo='y' where entityid in (4974);

update entitybasic set nameyahoo='神召第一小學暨幼稚園（幼稚園）' where entityid=5149;
update entitybasic set nameyahoo='神召第一小學暨幼稚園（小學部）' where entityid=3526;

update entitybasic set nameyahoo='聖瑪加利男女英文中小學（小學部）' where entityid=3691;
update entitybasic set nameyahoo='聖瑪加利男女英文中小學（中學部）' where entityid=6189;

update entitybasic set nameyahoo='香港培正小學（幼稚園）' where entityid=5492;
update entitybasic set nameyahoo='香港培正小學（小學部）' where entityid=3495;

update entitybasic set nameyahoo='香港培道小學（幼稚園）' where entityid=5486;
update entitybasic set nameyahoo='香港培道小學（小學暨幼稚園）' where entityid=3508;

update entitybasic set nameyahoo='香港浸會大學附屬學校王錦輝中小學（小學部）' where entityid=3736;
update entitybasic set nameyahoo='香港浸會大學附屬學校王錦輝中小學（中學部）' where entityid=6260;

update entitybasic set nameyahoo='香港真光中學（幼稚園）' where entityid=5705;

update entitybasic set nameyahoo='督教聯會真道書院（小學部）' where entityid=3641;
update entitybasic set nameyahoo='香港華人基督教聯會真道書院（中學部）' where entityid=6256;


select name, count(name)  from entity e, entitybasic b where e.id=b.entityid and b.isclosed='n' and b.isyahoo='y' group by name having count(name) > 1 ;

select name, count(name)  from
( select e.id, IF(b.nameyahoo is null , e.name , b.nameyahoo)  as name from entity e, entitybasic b where e.id=b.entityid and b.notshowyahoo='n' and b.isclosed='n' ) as e
group by name having count(name) > 1 ;


update entity set name='港青基信國際幼稚園（西九龍）', nameeng='YMCA OF HONG KONG CHRISTIAN INTERNATIONAL KINDERGARTEN (WEST KOWLOON)' where id=5874;




select c.id as caseid, c.sex as casesex, u.filename, n.hitcounter ,  c.*, te.name as targetentity, te.nameeng  as targetentityeng, l.description as targetschoolcategory, u.*,  ce.name as currententity, ce.nameeng  as currententityeng, fe.name as finalentity, fe.nameeng  as finalentityeng, (select count(1) from casesharingentity where casesharingid=c.id and offer='y') as appliedentityoffercount , (select count(1) from casesharingentity where casesharingid=c.id and offer='n') as appliedentitycount , TIMESTAMPDIFF(MINUTE, c.lastmodified, now()) as timediffmin,TIMESTAMPDIFF(DAY, c.lastmodified, now()) as timediffday,TIMESTAMPDIFF(HOUR, c.lastmodified, now()) as timediffhour, TIMESTAMPDIFF(SECOND, c.lastmodified, now()) as timediffsec
from casesharing c left join (select * from objectstat where status='active' and type='case') n on (c.id=n.objectid) , entity te, lookup l, user u, entity ce, entity fe,     (select referenceid,filename from userimage where imagetype='casesharing' group by referenceid having max(id)) u where c.targetentityid=te.id and DATE_ADD(c.lastmodified,INTERVAL 3650 DAY) >= now()   and  c.userid = u.id  and c.currententityid=ce.id and c.finalentityid=fe.id     and  l.type = 'entity.category.chi' and te.categoryid=l.value
and  c.id=u.referenceid   and  c.userid= 6
order by c.lastmodified desc



insert into bos.lookup (type,description,value) values ('user.role','0','parents');
insert into bos.lookup (type,description,value) values ('user.role','1','admin');
insert into bos.lookup (type,description,value) values ('user.role','2','tutor');
insert into bos.lookup (type,description,value) values ('user.role','4','school');
insert into bos.lookup (type,description,value) values ('user.role','5','dba');

CREATE TABLE entity_dba AS SELECT * FROM entity;
CREATE TABLE entityscore_dba AS SELECT * FROM entityscore;

jstatd -p 1099 -Djava.security.policy=/usr/lib/jvm/java-8-oracle/bin/all.policy


grant codebase "file:/usr/lib/jvm/java-8-oracle/lib/tools.jar" {
   permission java.security.AllPermission;
};

sudo jstatd -p 1099 -J-Djava.security.policy=/usr/lib/jvm/java-8-oracle/bin/all.policy -J-Djava.rmi.server.logCalls=true -J-Djava.rmi.server.hostname=52.220.1.210

JAVA_OPTS="$JAVA_OPTS -Djava.rmi.server.hostname=52.220.1.210"


jstatd -p 1099  -J-Djava.rmi.server.hostname=www.bookofschool.com -J-Djava.security.policy=/usr/lib/jvm/java-8-oracle/bin/all.policy -J-Dcom.sun.management.jmxremote.port=8088 -J-Dcom.sun.management.jmxremote.ssl=false -J-Dcom.sun.management.jmxremote.authenticate=false -J-Djava.rmi.server.logCalls=true

jstatd -p 1099 -J-Djava.security.policy=/usr/lib/jvm/java-8-oracle/bin/all.policy -J-Djava.rmi.server.logCalls=true

jstatd -J-Djava.security.policy=/usr/lib/jvm/java-8-oracle/bin/all.policy  -J-Djava.rmi.server.hostname=www.bookofschool.com   -J-Dcom.sun.management.jmxremote.rmi.port=1099 -J-Dcom.sun.management.jmxremote.port=8088   -J-Dcom.sun.management.jmxremote.ssl=false  -J-Dcom.sun.management.jmxremote.authenticate=false -J-Djava.rmi.server.logCalls=true

alter table entityimage add status varchar(1);

alter table entity change qareporturl qareporturl  varchar(200);
alter table entity change url url  varchar(200);

update entity set poaschoolnet='Kwai Tsing' where categoryid=2 and poaschoolnet='葵青區';
update entity set poaschoolnet='Tuen Mun' where categoryid=2 and poaschoolnet='屯門區';
update entity set poaschoolnet='Wong Tai Sin' where categoryid=2 and poaschoolnet='黃大仙區';
update entity set poaschoolnet='Sha Tin' where categoryid=2 and poaschoolnet='沙田區';
update entity set poaschoolnet='Sai Kung' where categoryid=2 and poaschoolnet='西貢區';
update entity set poaschoolnet='Tsuen Wan' where categoryid=2 and poaschoolnet='荃灣區';
update entity set poaschoolnet='Islands' where categoryid=2 and poaschoolnet='離島區';
update entity set poaschoolnet='North' where categoryid=2 and poaschoolnet='北區';
update entity set poaschoolnet='Sham Shui Po' where categoryid=2 and poaschoolnet='深水埗區';
update entity set poaschoolnet='East' where categoryid=2 and poaschoolnet='香港東區';
update entity set poaschoolnet='Wan Chai' where categoryid=2 and poaschoolnet='灣仔區';
update entity set poaschoolnet='Yuen Long' where categoryid=2 and poaschoolnet='元朗區';
update entity set poaschoolnet='Tai Po' where categoryid=2 and poaschoolnet='大埔區';
update entity set poaschoolnet='Kwun Tong' where categoryid=2 and poaschoolnet='觀塘區';
update entity set poaschoolnet='Southern' where categoryid=2 and poaschoolnet='香港南區';
update entity set poaschoolnet='Central & Western' where categoryid=2 and poaschoolnet='中西區';