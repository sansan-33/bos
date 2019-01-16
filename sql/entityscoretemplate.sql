DROP TABLE IF EXISTS  bos.entityscore;

CREATE TABLE bos.entityscore (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        entityid int(11),
	categoryid int(11),

	year int(11),
	ranking               int(11),
	rankingfinancetype    int(11),
	rankingdistrict      int(11),
	score                 decimal(4,1),
	parentscore           int(11),

	exceedquota int(11),
	enrolltotal int(11),
	schoolallocationscore int(11),

	banding              varchar(100),
	sixcoursesratio        int(11),
	chipassrate           int(11),
	engpassrate         int(11),
	urate                 int(11),
	alpassrate            int(11),


	swimming               int(11),
	football               int(11),
	athleticsdivmale       varchar(50),
	athleticsposmale       int(11),
	athleticsdivfemale    varchar(50),
	athleticsposfemale    int(11),


	speechfirst           int(11),
	speechsecond          int(11),
	speechthird           int(11),
	speechscore           int(11),
	choirforeign          int(11),
	choirchinese           int(11),
	instrumentwestern     int(11),
	instrumentchinese      int(11),


	schoolfee             int(11),
	tuitionfee            int(11) ,
	schoolfeenursery      varchar(100),

	area                  int(11),
	noofclassroom         int(11) ,
	noofhall              int(11) ,
	noofplayground        varchar(100)  CHARACTER SET utf8 COLLATE utf8_general_ci,
	nooflibraryroom       int(11),
	noofspecialroom       varchar(500)  CHARACTER SET utf8 COLLATE utf8_general_ci,
	noofotherroom         varchar(500)  CHARACTER SET utf8 COLLATE utf8_general_ci,
	outdoorplayground     varchar(10)   CHARACTER SET utf8 COLLATE utf8_general_ci,
	indoorplayground       varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci,
	musicroom              varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci,

	teacherexperience     int(11),
	teachermaster        int(11),
	teacherbachelor      int(11),
	teacherpupilam       varchar(20),
	teacherpupilpm        varchar(20),
	voucher  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci,
	qareport varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
	userid 	int(11),
	created               timestamp,
	lastmodified          timestamp
);




update entityscore es1, entityscore es2 set
es2.noofspecialroom = es1.noofspecialroom ,
	es2.noofotherroom=es1.noofotherroom
where es1.entityid=es2.entityid and es1.year=2011 and es2.year=2012;



update entity e, entityscore es set
e.schoolfee=es.schoolfee,
e.tuitionfee = es.tuitionfee,
e.schoolfeenursery =es.schoolfeenursery,
e.area=es.area ,
e.noofclassroom= es.noofclassroom  ,
	e.noofhall=es.noofhall     ,
	e.noofplayground=es.noofplayground   ,
	e.nooflibraryroom=es.nooflibraryroom   ,
	e.noofspecialroom = es.noofspecialroom ,
	e.noofotherroom=es.noofotherroom  ,
	e.outdoorplayground=es.outdoorplayground ,
	e.indoorplayground=es.indoorplayground ,
	e.musicroom=es.musicroom  ,

	e.teacherexperience=es.teacherexperience ,
	e.teachermaster=es.teachermaster   ,
	e.teacherbachelor=es.teacherbachelor  ,
	e.teacherpupilam=es.teacherpupilam  ,
	e.teacherpupilpm=es.teacherpupilpm ,
 	e.voucher=es.voucher

 where e.id=es.entityid and es.year=2012;

 update entity e, entityscore es set
es.ranking=e.ranking,
es.rankingfinancetype=e.rankingfinancetype,
es.rankingdistrict=e.rankingdistrict
 where e.id=es.entityid and es.year=2011;





INSERT INTO comment (
comment,userlike,userdislike,entityid,userid,subject,grade,metric1,metric2,metric3,metric4,metric5,lastmodified,created,metric6,metadesc,keywords,ip,type,year)
select c.comment,c.userlike,c.userdislike,c.entityid,c.userid,c.subject,c.grade,c.metric1,c.metric2,c.metric3,c.metric4,c.metric5,c.lastmodified,c.created,c.metric6,c.metadesc,c.keywords,c.ip,c.type,2013 from comment c, entity e where type='system' and c.userid=1 and year=2012 and c.entityid=e.id and e.categoryid=5;



alter table entityscore add sex VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci;
update entityscore es, entity e set
es.sex =e.sex
where es.entityid=e.id;
update entityscore set dp=0 where dp is null and categoryid=5;
update entityscore set igcse=0 where igcse is null and categoryid=5;

update entityscore es1, entityscore es2 set
es1.musicfirst=es2.musicfirst,
es1.musicsecond=es2.musicsecond,
es1.musicthird=es2.musicthird
 where es1.entityid=es2.entityid and es1.year=2011 and es2.year=2012;


update entityscore es1, entityscore es2 set
es1.area=es2.area
 where es1.entityid=es2.entityid and es1.year=2012 and es2.year=2011 and es1.area is null and es1.categoryid=1;

update entityscore e, (select * from entityscore where entityid=5864) es set
e.schoolfee=es.schoolfee,
e.tuitionfee = es.tuitionfee,
e.schoolfeenursery =es.schoolfeenursery,
e.area=es.area ,
e.noofclassroom= es.noofclassroom  ,
	e.noofhall=es.noofhall     ,
	e.noofplayground=es.noofplayground   ,
	e.nooflibraryroom=es.nooflibraryroom   ,
	e.noofspecialroom = es.noofspecialroom ,
	e.noofotherroom=es.noofotherroom  ,
	e.outdoorplayground=es.outdoorplayground ,
	e.indoorplayground=es.indoorplayground ,
	e.musicroom=es.musicroom  ,

	e.teacherexperience=es.teacherexperience ,
	e.teachermaster=es.teachermaster   ,
	e.teacherbachelor=es.teacherbachelor  ,
	e.teacherpupilam=es.teacherpupilam  ,
	e.teacherpupilpm=es.teacherpupilpm ,
 	e.voucher=es.voucher

 where e.entityid=es.entityid and e.year=2012 and es.year=2013


  update entity e, entityscore es set
 es.admitted=e.admitted,
 es.vacancy=e.vacancy
  where e.id=es.entityid and es.year=2013;

alter table entityscore add poaschoolnet VARCHAR(100);

update entity e, entityscore es set e.area=es.area where e.id=es.entityid and es.year=2012 and e.area < 1 and es.area > 1 and es.categoryid=1;

update entity e, entityscore es set es.poaschoolnet=e.poaschoolnet where e.id=es.entityid;

update entity e, entityscore es set es.exceedquota=e.poaschoolnet where e.id=es.entityid;




INSERT INTO comment (
comment,userlike,userdislike,entityid,userid,subject,grade,metric1,metric2,metric3,metric4,metric5,lastmodified,created,metric6,metadesc,keywords,ip,type,year)
select c.comment,c.userlike,c.userdislike,c.entityid,c.userid,c.subject,c.grade,c.metric1,c.metric2,c.metric3,c.metric4,c.metric5,c.lastmodified,c.created,c.metric6,c.metadesc,c.keywords,c.ip,c.type,2015 from comment c, entity e where type='system' and c.userid=1 and year=2014 and c.entityid=e.id and e.categoryid in (5);



INSERT INTO entityscore (
    entityid,
    year,
    categoryid,
	ranking,
	rankingfinancetype,
	rankingdistrict ,
	score ,
	parentscore ,
	exceedquota	,
	enrolltotal  ,
	schoolallocationscore ,
	banding ,
	sixcoursesratio ,
	chipassrate ,
	engpassrate ,
	urate ,
	alpassrate ,
    hkdsepassrate,
	athleticsdivmale  ,
	athleticsposmale  ,
	athleticsdivfemale,
	athleticsposfemale,
	speechfirst ,
	speechsecond ,
	speechthird   ,
	speechscore  ,
	choirforeign   ,
	choirchinese,
	instrumentwestern,
	instrumentchinese,
    musicother,
	schoolfee,
	tuitionfee,
	schoolfeenursery,
	area    ,
	noofclassroom  ,
	noofhall     ,
	noofplayground   ,
	nooflibraryroom   ,
	noofspecialroom   ,
	noofotherroom  ,
	outdoorplayground ,
	indoorplayground ,
	musicroom  ,
	teacherexperience ,
	teachermaster   ,
	teacherbachelor  ,
	teacherpupilam  ,
	teacherpupilpm ,
	qareport,
	voucher,
	userid,
	created,
	lastmodified,
	sex,
	poaschoolnet
)
  SELECT id,2018,categoryid,ranking,
	rankingfinancetype,
	rankingdistrict ,
	score ,
	parentscore ,
	exceedquota	,
	enrolltotal  ,
	schoolallocationscore ,
	banding ,
	0,0,0,0,0,0,
	athleticsdivmale  ,
	athleticsposmale  ,
	athleticsdivfemale,
	athleticsposfemale,
	speechfirst ,
	speechsecond ,
	speechthird   ,
	speechscore  ,
	choirforeign   ,
	choirchinese  ,
	instrumentwestern  ,
	instrumentchinese,
    musicother,
	schoolfee   ,
	tuitionfee  ,
	schoolfeenursery  ,
	area    ,
	noofclassroom  ,
	noofhall     ,
	noofplayground   ,
	nooflibraryroom   ,
	noofspecialroom   ,
	noofotherroom  ,
	outdoorplayground ,
	indoorplayground ,
	musicroom  ,
	teacherexperience ,
	teachermaster   ,
	teacherbachelor  ,
	teacherpupilam  ,
	teacherpupilpm , qareport, voucher, 1,now(),now(), sex, poaschoolnet
  FROM entity where categoryid in (0,1,2,5);

  INSERT INTO comment (
  comment,userlike,userdislike,entityid,userid,subject,grade,metric1,metric2,metric3,metric4,metric5,lastmodified,created,metric6,metadesc,keywords,ip,type,year)
  select c.comment,c.userlike,c.userdislike,c.entityid,c.userid,c.subject,c.grade,c.metric1,c.metric2,c.metric3,c.metric4,c.metric5,c.lastmodified,c.created,c.metric6,c.metadesc,c.keywords,c.ip,c.type,2018 from comment c, entity e where type='system' and c.userid=1 and year=2017 and c.entityid=e.id and e.categoryid in (0,1,2,5);


update entityscore es1, entityscore es2 set
es1.musicfirst=es2.musicfirst,
es1.musicsecond=es2.musicsecond,
es1.musicthird=es2.musicthird,
es1.speechfirst=es2.speechfirst,
es1.speechsecond=es2.speechsecond,
es1.speechthird=es2.speechthird,
es1.athleticsdivmale  = es2.athleticsdivmale,
es1.athleticsposmale  =es2.athleticsposmale,
es1.athleticsdivfemale = es2.athleticsdivfemale,
es1.athleticsposfemale = es2.athleticsposfemale,
es1.basketballdivfemale   = es2.basketballdivfemale,
es1.basketballposfemale = es2.basketballposfemale,
es1.basketballdivmale  = es2.basketballdivmale,
es1.basketballposmale = es2.basketballposmale,
es1.swimmingdivfemale = es2.swimmingdivfemale,
es1.swimmingposfemale  = es2.swimmingposfemale,
es1.swimmingdivmale  = es2.swimmingdivmale,
es1.swimmingposmale  =  es2.swimmingposmale,
es1.footballdiv = es2.footballdiv,
es1.footballpos = es2.footballpos,
es1.sportntposfemale = es2.sportntposfemale,
es1.sportntposmale = es2.sportntposmale

 where es1.entityid=es2.entityid and es1.year=2018 and es2.year=2017;


update entity e,
(select
 entityid,
 IF(avg(metric1) > 0 , round(avg(metric1),1) , '0')  as metric1,
 IF(avg(metric2) > 0 , round(avg(metric2),1) , '0')  as metric2,
 IF(avg(metric3) > 0 , round(avg(metric3),1) , '0')  as metric3,
 IF(avg(metric4) > 0 , round(avg(metric4),1) , '0')  as metric4,
 IF(avg(metric5) > 0 , round(avg(metric5),1) , '0')  as metric5
 from comment where type='system' group by entityid ) c set
e.metricoverall1=c.metric1,
e.metricoverall2=c.metric2,
e.metricoverall3=c.metric3,
e.metricoverall4=c.metric4,
e.metricoverall5=c.metric5
where e.id=c.entityid;



update entity e, entity_dba d set
e.banding=d.banding,
e.teacherforeign=d.teacherforeign,
e.hkdsepassrate=d.hkdsepassrate,
e.chipassrate=d.chipassrate,
e.urate=d.urate,
e.alpassrate=d.alpassrate,
e.engpassrate = d.engpassrate
where e.id=d.id;

update entitybasic e, entity_dba d set
e.banding=d.banding,
e.teacherforeign=d.teacherforeign,
e.hkdsepassrate=d.hkdsepassrate,
e.chipassrate=d.chipassrate,
e.urate=d.urate,
e.alpassrate=d.alpassrate,
e.engpassrate = d.engpassrate
where e.entityid=d.id;
