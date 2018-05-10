insert into entity (categoryid,nameeng,ranking,chscid,lastmodified,addresseng,address,url,telephone,email,schoolmission,poaschoolnet,financetype,schoolfee)
values ('0','ABC Pathways International Kindergarten',0,999,now(),
'Ground Floor of Block 8&9, Kornhill Garden, 1124 King’s Road, Quarry Bay, Hong Kong (MTR Tai Koo Station Exit E2)',
'香港鰂魚涌英皇道1124號康山花園第8及9座地下 (港鐵太古站E2出口)','http://abcpathways.edu.hk/?page_id=2508&lang=en',
'21101211',
'enquiry.tk@ABCpathways.edu.hk',
'ABC Pathways International Kindergarten 推動「快樂學習」，提供PN-K3課程，語言包括英語、粵語及普通話。秉承ABC Pathways School「零壓力教學法」，推行「中、英、數按能力（而非按年齡）編班」機制，英文科更設7級劍橋英語程度，甚具優勢！',
'East','私立獨立',1);

insert into entity (categoryid,nameeng,ranking,chscid,lastmodified,addresseng,address,url,telephone,email,schoolmission,poaschoolnet,financetype)
values ('0','ABC Pathways International Kindergarten',0,999,now(),
'Shop No.25, G/F, Site 11, Whampoa Garden, Hung Hom, Hong Kong (MTR Whampoa Station Exit A)',
'香港紅磡黃埔花園11期地下25號 (港鐵黃埔站A出口)','http://abcpathways.edu.hk/?page_id=2508&lang=en',
'21109993',
'enquiry.wp@ABCpathways.edu.hk',
'ABC Pathways International Kindergarten 推動「快樂學習」，提供PN-K3課程，語言包括英語、粵語及普通話。秉承ABC Pathways School「零壓力教學法」，推行「中、英、數按能力（而非按年齡）編班」機制，英文科更設7級劍橋英語程度，甚具優勢！',
'Kowloon City','私立獨立',1);


insert into entitybasic (entityid,lastmodified,notshowyahoo,isclosed) values (13123,now(),'y','n');

insert into entityscore (entityid,year,lastmodified,categoryid,ranking,noofclassroom,area,teacherpupilam,teacherpupilpm,schoolfee) values (13123,'2011',now(),'0',999,5,5,'1 : 6.6','1 : 6.6',1);
insert into entityscore (entityid,year,lastmodified,categoryid,ranking,noofclassroom,area,teacherpupilam,teacherpupilpm,schoolfee) values (13123,'2012',now(),'0',999,5,5,'1 : 6.6','1 : 6.6',1);
insert into entityscore (entityid,year,lastmodified,categoryid,ranking,noofclassroom,area,teacherpupilam,teacherpupilpm,schoolfee) values (13123,'2013',now(),'0',999,5,5,'1 : 6.6','1 : 6.6',1);
insert into entityscore (entityid,year,lastmodified,categoryid,ranking,noofclassroom,area,teacherpupilam,teacherpupilpm,schoolfee) values (13123,'2014',now(),'0',999,5,5,'1 : 6.6','1 : 6.6',1);
insert into entityscore (entityid,year,lastmodified,categoryid,ranking,noofclassroom,area,teacherpupilam,teacherpupilpm,schoolfee) values (13123,'2015',now(),'0',999,5,5,'1 : 6.6','1 : 6.6',1);
insert into entityscore (entityid,year,lastmodified,categoryid,ranking,noofclassroom,area,teacherpupilam,teacherpupilpm,schoolfee) values (13123,'2016',now(),'0',999,5,5,'1 : 6.6','1 : 6.6',1);

insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values (13123,7,7,7,7,7,'2011','new school','system',1,now(),now());
insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values (13123,7,7,7,7,7,'2012','new school','system',1,now(),now());
insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values (13123,7,7,7,7,7,'2013','new school','system',1,now(),now());
insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values (13123,7,7,7,7,7,'2014','new school','system',1,now(),now());
insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values (13123,7,7,7,7,7,'2015','new school','system',1,now(),now());
insert into comment (entityid,metric1,metric2,metric3,metric4,metric5,year,comment,type,userid,lastmodified,created) values (13123,7,7,7,7,7,'2016','new school','system',1,now(),now());

