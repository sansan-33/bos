
update entity set musicfirst=0, musicsecond=0, musicthird=0;


update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Alliance Primary School, Sheung Shui');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Elegantia College (Sponsored by Education Convergence)');
update entity set musicsecond=musicsecond+4,musicthird=musicthird+1 where lower(nameeng) = lower('G.T. (Ellen Yeung) College') and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('HKKKWA Sun Fong Chung Primary School');
update entity set musicsecond=musicsecond+2,musicthird=musicthird+1 where lower(nameeng) = lower('International Christian Quality Music Secondary and Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('NT Heung Yee Kuk Yuen Long District Secondary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('P.L.K. Camões Tan Siu Lin Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('P.L.K. Fong Wong Kam Chuen Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('P.L.K. Wong Wing Shu Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('PLK Dr. Jimmy Wong Chi-Ho ( Tin Sum Valley ) Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('PLK Fung Ching Memorial Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('PLK Mrs. Ma Kam Ming-Cheung Fook Sien College');
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where lower(nameeng) = lower('Po Leung Kuk Hong Kong Taoist Association Yuen Yuen Pri. Sch.');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Po Leung Kuk Lam Man Chan English Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Po Leung Kuk No.1 W.H. Cheung College');
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('Po On Commercial Association Wong Siu Ching Secondary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('S.K.H. Chu Oi Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('S.K.H. Chu Yan Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Fung Kei Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('S.K.H. Kei Tak Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('S.K.H. Kei Wing Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Kei Yan Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('SKH Lam Kau Mow Secondary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Tsing Yi Chu Yan Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Yan Laap Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('SA Ann Wyllie Memorial School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('Sha Tin Methodist College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Sheung Shui Government Secondary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('St. Catharine''s School For Girls (Kwun Tong)');
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where lower(nameeng) = lower('St. Francis Of Assisi''s English Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('St. Joseph''s Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('St. Margaret''s Co-educational English Secondary & Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Taoist Ching Chung Primary School (Wu King Estate)');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+2 where lower(nameeng) = lower('The Evangelical Lutheran Church of Hong Kong Wo Che Lutheran School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('The Salvation Army Lam Butt Chung Memorial School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('The True Light Middle School of Hong Kong (Primary Section)');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('Tung Wah Group of Hospitals Lo Kon Ting Memorial College');
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where lower(nameeng) = lower('TWGHs Wong Fut Nam College');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Wah Yan College Hong Kong');
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('Y.O.T. Tin Ka Ping Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Yuen Long Merchants Association Secondary School');
update entity set musicsecond=musicsecond+1 where name = '九龍塘官立小學';
update entity set musicsecond=musicsecond+2 where name = '九龍塘宣道小學';
update entity set musicfirst=musicfirst+5 where name = '九龍塘學校（小學部）';
update entity set musicthird=musicthird+1 where name = '九龍灣聖若翰天主教小學';
update entity set musicsecond=musicsecond+1 where name = '中華基督教會扶輪中學';
update entity set musicthird=musicthird+1 where name = '中華基督教會協和小學(長沙灣)';
update entity set musicsecond=musicsecond+1 where name = '五旬節林漢光中學';
update entity set musicthird=musicthird+1 where name = '元朗公立中學校友會小學';
update entity set musicthird=musicthird+1 where name = '天水圍官立小學';
update entity set musicthird=musicthird+1 where name = '北角循道學校';
update entity set musicfirst=musicfirst+1 where name = '妙法寺劉金龍中學';
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '庇理羅士女子中學';
update entity set musicfirst=musicfirst+1,musicthird=musicthird+2 where name = '李志達紀念學校';
update entity set musicthird=musicthird+1 where name = '沙田官立中學';
update entity set musicfirst=musicfirst+2,musicthird=musicthird+1 where name = '沙田循道衛理中學';
update entity set musicfirst=musicfirst+5 where name = '拔萃女小學 ';
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+4,musicthird=musicthird+2 where name = '拔萃女書院';
update entity set musicfirst=musicfirst+1 where name = '拔萃男書院附屬小學';
update entity set musicsecond=musicsecond+1 where name = '東華三院高可寧紀念小學';
update entity set musicthird=musicthird+1 where name = '保良局方王錦全小學';
update entity set musicsecond=musicsecond+1 where name = '保良局朱正賢小學';
update entity set musicthird=musicthird+1 where name = '保良局百周年李兆忠紀念中學';
update entity set musicfirst=musicfirst+1 where name = '保良局馬錦明中學';
update entity set musicsecond=musicsecond+1 where name = '保良局馬錦明夫人章馥仙中學';
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '保良局陳守仁小學';
update entity set musicsecond=musicsecond+1 where name = '保良局馮晴紀念小學';
update entity set musicthird=musicthird+1 where name = '保良局蔡繼有學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '保良局錦泰小學';
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where name = '南亞路德會沐恩中學';
update entity set musicthird=musicthird+1 where name = '皇仁書院';
update entity set musicfirst=musicfirst+1 where name = '香港浸信會聯會小學';
update entity set musicthird=musicthird+1 where name = '香港真光中學（小學部）';
update entity set musicsecond=musicsecond+2 where name = '香港華人基督教聯會真道書院' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '香港道教聯合會圓玄學院第二中學';
update entity set musicfirst=musicfirst+1 where name = '香港嘉諾撒學校';
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '旅港開平商會中學';
update entity set musicsecond=musicsecond+1 where name = '真光女書院';
update entity set musicthird=musicthird+1 where name = '馬鞍山循道衛理小學';
update entity set musicthird=musicthird+1 where name = '馬鞍山靈糧小學';
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where name = '馬頭涌官立小學';
update entity set musicthird=musicthird+1 where name = '馬頭涌官立小學（紅磡灣）';
update entity set musicsecond=musicsecond+1 where name = '國際基督教優質音樂中學暨小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '基督教宣道會徐澤林紀念小學';
update entity set musicsecond=musicsecond+1 where name = '救世軍韋理夫人紀念學校';
update entity set musicthird=musicthird+1 where name = '博愛醫院歷屆總理聯誼會梁省德中學';
update entity set musicsecond=musicsecond+1 where name = '喇沙小學';
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where name = '喇沙書院';
update entity set musicfirst=musicfirst+2 where name = '港九街坊婦女會孫方中小學';
update entity set musicsecond=musicsecond+1 where name = '番禺會所華仁小學';
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+1 where name = '華仁書院（九龍）';
update entity set musicthird=musicthird+1 where name = '華英中學';
update entity set musicfirst=musicfirst+1 where name = '順德聯誼總會胡少渠紀念小學';
update entity set musicfirst=musicfirst+1 where name = '黃大仙官立小學 ';
update entity set musicthird=musicthird+1 where name = '新界鄉議局元朗區中學';
update entity set musicfirst=musicfirst+1 where name = '聖公會仁立小學';
update entity set musicfirst=musicfirst+1 where name = '聖公會主愛小學（梨木樹）';
update entity set musicthird=musicthird+1 where name = '聖公會阮鄭夢芹銀禧小學';
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '聖公會林裘謀中學';
update entity set musicsecond=musicsecond+5,musicthird=musicthird+1 where name = '聖公會林護紀念中學';
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '聖公會莫壽增會督中學';
update entity set musicthird=musicthird+1 where name = '聖公會聖米迦勒小學';
update entity set musicthird=musicthird+1 where name = '聖公會聖彼得小學(下午)';
update entity set musicthird=musicthird+1 where name = '聖保祿天主教小學';
update entity set musicthird=musicthird+1 where name = '聖保祿學校（小學部）';
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where name = '聖保羅男女中學' and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '聖保羅男女中學附屬小學';
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '聖保羅書院';
update entity set musicfirst=musicfirst+2 where name = '聖保羅書院小學';
update entity set musicthird=musicthird+1 where name = '嘉諾撒聖心書院';
update entity set musicthird=musicthird+1 where name = '嘉諾撒聖心學校';
update entity set musicsecond=musicsecond+1 where name = '嘉諾撒聖心學校私立部';
update entity set musicsecond=musicsecond+1 where name = '嘉諾撒聖家書院';
update entity set musicthird=musicthird+1 where name = '嘉諾撒聖瑪利書院';
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where name = '瑪利曼中學';
update entity set musicsecond=musicsecond+1 where name = '瑪利諾神父教會學校(小學部)';
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '德望學校（小學部）';
update entity set musicthird=musicthird+1 where name = '勵志會梁李秀娛紀念小學';
update entity set musicthird=musicthird+1 where name = '藍田循道衛理小學';
update entity set musicthird=musicthird+1 where name = '寶血女子中學';
update entity set musicfirst=musicfirst+1 where name = '寶血會嘉靈學校';
update entity set musicthird=musicthird+1 where name = '觀塘官立中學';
update entity set musicfirst=musicfirst+6,musicsecond=musicsecond+2,musicthird=musicthird+5 where lower(nameeng) = lower('Diocesan Boys'' School') and categoryid=2;
update entity set musicfirst=musicfirst+4,musicsecond=musicsecond+3,musicthird=musicthird+1 where name = '拔萃男書院' and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Po Leung Kuk Choi Kai Yau School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('The Hong Kong Chinese Christian Churches Union Logos Academy') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Good Hope School') and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '德望學校' and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Kowloon Rhenish School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Munsang College (Primary Section)') and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+2 where lower(nameeng) = lower('Pui Kiu College') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Tung Chung Catholic School') and categoryid=2;
update entity set musicthird=musicthird+1 where name = '東涌天主教學校' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '東涌天主教學校' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '培僑書院' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '崇真小學暨幼稚園' and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Aberdeen St. Peter''s Catholic Primary School');
update entity set musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('Alliance Primary School, Kowloon Tong');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Baptist Lui Ming Choi Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Baptist Lui Ming Choi Secondary School');
update entity set musicfirst=musicfirst+1,musicthird=musicthird+2 where lower(nameeng) = lower('Belilios Public School');
update entity set musicsecond=musicsecond+2 where lower(nameeng) = lower('Bishop Hall Jubilee School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Bonham Road Government Primary School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('Canossa Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Carmel Divine Grace Foundation Secondary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Carmel Holy Word Secondary School');
update entity set musicfirst=musicfirst+2,musicthird=musicthird+1 where lower(nameeng) = lower('Carmel Pak U Secondary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('CCC Heep Woh College');
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('CCC Kei Chun Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('C.C.C. Kei Wa Primary School');
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+1 where lower(nameeng) = lower('C.C.C. Kei Wai Primary School (Ma Wan)');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+2 where lower(nameeng) = lower('C.C.C. Kei Wan Primary School (Aldrich Bay)');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('C.C.C. Mong Wong Far Yok Memorial Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Chan Sui Ki (La Salle) College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Chan''s Creative School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Chinese Methodist School (North Point)');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Chinese YMCA College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Chiu Yang Primary School of Hong Kong');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Christian & Missionary Alliance Sun Kei Secondary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Christian Alliance S. C. Chan Memorial College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Christian Alliance Toi Shan H C Chan Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Clementi Secondary School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+2 where lower(nameeng) = lower('Diocesan Boys'' School Primary Division');
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+2 where lower(nameeng) = lower('Diocesan Girls'' Junior School');
update entity set musicfirst=musicfirst+5,musicsecond=musicsecond+3,musicthird=musicthird+3 where lower(nameeng) = lower('Diocesan Girls'' School');
update entity set musicfirst=musicfirst+3,musicthird=musicthird+1 where lower(nameeng) = lower('Heep Yunn Primary School');
update entity set musicsecond=musicsecond+2,musicthird=musicthird+2 where lower(nameeng) = lower('Heep Yunn School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('HKBU Affiliated School Wong Kam Fai Secondary & Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('HKTA Wun Tsuen Ng Lai Wo Memorial School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Holy Family Canossian College');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Holy Family Canossian School (Kowloon Tong)');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Hotung Secondary School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('King''s College');
update entity set musicfirst=musicfirst+3 where lower(nameeng) = lower('Kowloon Tong School (Primary Section)');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('Kwok Tak Seng Catholic Secondary School');
update entity set musicfirst=musicfirst+4 where lower(nameeng) = lower('La Salle College');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Lam Tin Methodist Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Law Ting Pong Secondary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Lee Chi Tat Memorial School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Ling Liang Church Sau Tak Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Ma On Shan Methodist Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Maryknoll Convent School (Primary Section)');
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('Marymount Primary School');
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+1 where lower(nameeng) = lower('Marymount Secondary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Methodist School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('North Point Government Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Notre Dame College');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Po Leung Kuk 1984 College');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Po Leung Kuk Chee Jing Yin Primary School');
update entity set musicfirst=musicfirst+2 where lower(nameeng) = lower('Po Leung Kuk Grandmont Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Po Leung Kuk Luk Hing Too Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Po Leung Kuk Tin Ka Ping Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Pui Ching Middle School');
update entity set musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('Queen''s College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Raimondi College');
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where lower(nameeng) = lower('Sacred Heart Canossian College');
update entity set musicsecond=musicsecond+1,musicthird=musicthird+2 where lower(nameeng) = lower('Sacred Heart Canossian School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Sham Shui Po Government Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Shatin Government Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Shatin Methodist Primary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Shatin Tsung Tsin Secondary School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('SKH Bishop Mok Sau Tseng Secondary School');
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+2,musicthird=musicthird+2 where lower(nameeng) = lower('SKH Lam Woo Memorial Secondary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('SKH Tsang Shiu Tim Secondary School');
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('St. Edward''s Catholic Primary School');
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('St. Francis'' Canossian College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('St. Francis Xavier''s College');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('St. Joseph''s Anglo-Chinese School');
update entity set musicsecond=musicsecond+2 where lower(nameeng) = lower('St. Joseph''s College');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Louis School');
update entity set musicfirst=musicfirst+2 where lower(nameeng) = lower('St. Mark''s School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('St. Mary''s Canossian School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('St. Paul''s Co-educational College') and categoryid=2;
update entity set musicfirst=musicfirst+4,musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('St. Paul''s Co-educational College Primary School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('St. Paul''s College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('St. Paul''s College Primary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Paul''s Primary Catholic School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Paul''s Secondary School');
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('St. Stephen''s College');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Stephen''s College Preparatory School');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Stephen''s Girls'' College');
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('St. Stephen''s Girls'' Primary School');
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('Stewards Pooi Kei Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('STFA Seaward Woo College');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Tai Po Methodist School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Tai Po Old Market Public School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Tai Po Old Market Public School (Plover Cove)');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Tak Nga Secondary School');
update entity set musicsecond=musicsecond+2 where lower(nameeng) = lower('Tin Shui Wai Government Primary School');
update entity set musicsecond=musicsecond+2 where lower(nameeng) = lower('True Light Girls'' College');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Tseung Kwan O Catholic Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Tseung Kwan O Methodist Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Tuen Mun Catholic Secondary School');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Tuen Mun Government Secondary School');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('TWGHs Kap Yan Directors'' College');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('TWGHs Lee Ching Dea Memorial College');
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('Wa Ying College');
update entity set musicfirst=musicfirst+4,musicsecond=musicsecond+4,musicthird=musicthird+2 where lower(nameeng) = lower('Wah Yan College Kowloon');
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Ying Wa College');
update entity set musicfirst=musicfirst+4,musicsecond=musicsecond+1,musicthird=musicthird+2 where lower(nameeng) = lower('Ying Wa Primary School');
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('YMCA of Hong Kong Christian College');
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Yuen Long Government Primary School');
update entity set musicthird=musicthird+1 where name = '中華基督教會全完中學';
update entity set musicthird=musicthird+1 where name = '中華基督教會全完第二小學';
update entity set musicthird=musicthird+1 where name = '中華基督教會協和書院';
update entity set musicfirst=musicfirst+1 where name = '中華基督教會基慧小學（馬灣）';
update entity set musicsecond=musicsecond+2 where name = '中華基督教會基灣小學';
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+2 where name = '中華基督教會基灣小學（愛蝶灣）';
update entity set musicsecond=musicsecond+1 where name = '五旬節靳茂生小學';
update entity set musicsecond=musicsecond+2 where name = '天水圍天主教小學';
update entity set musicsecond=musicsecond+2 where name = '何明華會督銀禧中學';
update entity set musicfirst=musicfirst+1 where name = '佛教榮茵學校';
update entity set musicthird=musicthird+2 where name = '沙田崇真中學';
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '協恩中學';
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '協恩中學附屬小學';
update entity set musicthird=musicthird+1 where name = '東華三院鄧肇堅小學';
update entity set musicfirst=musicfirst+1 where name = '油蔴地天主教小學（海泓道）';
update entity set musicthird=musicthird+1 where name = '英皇書院';
update entity set musicfirst=musicfirst+5,musicthird=musicthird+2 where name = '迦密柏雨中學';
update entity set musicsecond=musicsecond+1 where name = '荃灣天主教小學';
update entity set musicthird=musicthird+1 where name = '高主教書院小學部';
update entity set musicfirst=musicfirst+1 where name = '培基小學';
update entity set musicfirst=musicfirst+1 where name = '基督教宣道會宣基小學';
update entity set musicthird=musicthird+1 where name = '深井天主教小學';
update entity set musicfirst=musicfirst+1 where name = '循道學校';
update entity set musicthird=musicthird+1 where name = '港島民生書院';
update entity set musicthird=musicthird+1 where name = '港澳信義會小學';
update entity set musicthird=musicthird+1 where name = '港澳信義會明道小學';
update entity set musicthird=musicthird+2 where name = '筲箕灣崇真學校';
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '聖士提反書院附屬小學';
update entity set musicthird=musicthird+1 where name = '聖公會田灣始南小學';
update entity set musicthird=musicthird+1 where name = '聖公會青衣主恩小學';
update entity set musicsecond=musicsecond+1 where name = '聖公會基榮小學';
update entity set musicfirst=musicfirst+3 where name = '聖公會曾肇添中學';
update entity set musicthird=musicthird+1 where name = '聖公會置富始南小學';
update entity set musicfirst=musicfirst+1 where name = '聖公會聖三一堂中學';
update entity set musicthird=musicthird+1 where name = '聖公會聖雅各小學';
update entity set musicsecond=musicsecond+2 where name = '聖公會蒙恩小學';
update entity set musicsecond=musicsecond+2,musicthird=musicthird+2 where name = '聖方濟各英文小學';
update entity set musicthird=musicthird+1 where name = '鳳溪第一小學';
update entity set musicthird=musicthird+1 where name = '德信學校';
update entity set musicsecond=musicsecond+1 where name = '潮陽百欣小學';







update entityscore es, entity e set es.musicfirst=e.musicfirst,es.musicsecond=e.musicsecond,es.musicthird=e.musicthird where es.entityid=e.id and es.year=2013;

