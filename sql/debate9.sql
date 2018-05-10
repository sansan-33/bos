update entity set debatechi=0 where categoryid=2;

update  entity set debatechi=1 where name = '華英中學' and categoryid=2;
update  entity set debatechi=2 where name = '拔萃男書院' and categoryid=2;
update  entity set debatechi=3 where name = '瑪利諾修院學校（中學部）' and categoryid=2;
update  entity set debatechi=4 where name = '順德聯誼總會李兆基中學' and categoryid=2;

update entityscore es, entity e set es.debatechi=e.debatechi where es.entityid=e.id and es.year=2016 and e.categoryid=2;