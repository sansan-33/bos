update entity set musicfirst=0, musicsecond=0, musicthird=0;
update entityscore set musicfirst=0, musicsecond=0, musicthird=0 where year=2018;

update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Aberdeen St. Peter''s Catholic Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+2 where lower(nameeng) = lower('Alliance Primary School, Kowloon Tong') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Asbury Methodist Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Baptist Lui Ming Choi Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+2 where lower(nameeng) = lower('Baptist Lui Ming Choi Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1,musicthird=musicthird+3 where lower(nameeng) = lower('Belilios Public School') and categoryid=2;
update entity set musicthird=musicthird+3 where lower(nameeng) = lower('Bishop Hall Jubilee School') and categoryid=2;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Bonham Road Government Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+5,musicsecond=musicsecond+2 where lower(nameeng) = lower('Carmel Pak U Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('C.C.C. Heep Woh Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+3 where lower(nameeng) = lower('C.C.C. Kei Wai Primary School (Ma Wan)') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicthird=musicthird+1 where lower(nameeng) = lower('C.C.C. Kei Wan Primary School (Aldrich Bay)') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Chiu Lut Sau Memorial Secondary School') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Chiu Yang Primary School of Hong Kong') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Christian Alliance H.C. Chan Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Christian Alliance S. C. Chan Memorial College') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Christian Alliance S.Y. Yeh Memorial Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Christian Alliance Toi Shan H C Chan Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('CNEC Christian College') and categoryid=2;
update entity set musicfirst=musicfirst+7,musicsecond=musicsecond+2,musicthird=musicthird+3 where lower(nameeng) = lower('Diocesan Boys'' School') and categoryid=2;
update entity set musicfirst=musicfirst+3,musicthird=musicthird+2 where lower(nameeng) = lower('Diocesan Boys'' School Primary Division') and categoryid=1;
update entity set musicfirst=musicfirst+4,musicsecond=musicsecond+2 where lower(nameeng) = lower('Diocesan Girls'' Junior School') and categoryid=1;
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+3,musicthird=musicthird+4 where lower(nameeng) = lower('Diocesan Girls'' School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Diocesan Preparatory School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Dr. Catherine F. Woo Memorial School') and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1,musicthird=musicthird+2 where lower(nameeng) = lower('Good Hope Primary School cum Kindergarten') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+3 where lower(nameeng) = lower('Good Hope School') and categoryid=2;
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('Heep Yunn Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+3,musicthird=musicthird+2 where lower(nameeng) = lower('Heep Yunn School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Hennessy Road Government Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+2 where lower(nameeng) = lower('HKKKWA Sun Fong Chung Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+1 where lower(nameeng) = lower('HKBUAS Wong Kam Fai Secondary and Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Hong Kong Taoist Association Tang Hin Memorial Secondary School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('HKTA Wun Tsuen Ng Lai Wo Memorial School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('HKUGA College') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Ho Fung College (Sponsored by Sik Sik Yuen)') and categoryid=2;
update entity set musicfirst=musicfirst+2 where lower(nameeng) = lower('Hoi Pa Street Government Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Hoi Ping Chamber of Commerce Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Holy Family Canossian College') and categoryid=2;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Hong Kong Student Aid Society Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Hotung Secondary School') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('International Christian Quality Music Sec. and Pri. School') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+2 where lower(nameeng) = lower('King''s College') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('King''s College Old Boys'' Association Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+2 where lower(nameeng) = lower('Kowloon Tong School (Primary Section)') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Kwok Tak Seng Catholic Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('La Salle College') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Ma On Shan Methodist Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Maryknoll Convent School (Secondary Section)') and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('Marymount Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Marymount Secondary School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('N.T. Heung Yee Kuk Yuen Long District Secondary School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('North Point Methodist Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('PLK Dr. Jimmy Wong Chi-Ho (Tin Sum Valley) Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('Po Leung Kuk Hong Kong Taoist Association Yuen Yuen Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('PLK Women''s Welfare Club (WD) Fung Lee Pui Yiu Pri. Sch.') and categoryid=1;
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('P.L.K. Camões Tan Siu Lin Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Po Leung Kuk Castar Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Po Leung Kuk Grandmont Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Po Leung Kuk Lo Kit Sing (1983) College') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Po Leung Kuk Tin Ka Ping Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Po On Commercial Association Wong Siu Ching Secondary School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Pui Ching Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('Pui Kiu College') and categoryid=1;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where lower(nameeng) = lower('Pui Kiu Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Pun U Association Wah Yan Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('Queen''s College') and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Lam Kau Mow Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+1,musicthird=musicthird+3 where lower(nameeng) = lower('S.K.H. Lam Woo Memorial Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('S.K.H. Tsang Shiu Tim Secondary School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Tsing Yi Chu Yan Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+2 where lower(nameeng) = lower('Sacred Heart Canossian College') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Sacred Heart Canossian School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Sacred Heart Canossian School, Private Section') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Salesian English School') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Sha Tin Methodist College') and categoryid=2;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Shak Chung Shan Memorial Catholic Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Shatin Methodist Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Sing Yin Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Bishop Mok Sau Tseng Secondary School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Chu Oi Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('S.K.H. Chu Yan Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Holy Spirit Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('S.K.H. Lui Ming Choi Memorial Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('S.K.H. Ma On Shan Holy Spirit Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+2 where lower(nameeng) = lower('St. Francis'' Canossian College') and categoryid=2;
update entity set musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('St. Joseph''s College') and categoryid=2;
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('St. Joseph''s Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('St. Louis School') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Mark''s School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('St. Mary''s Canossian College') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Patrick''s Catholic Primary School (Po Kong Village Road)') and categoryid=1;
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+2 where lower(nameeng) = lower('St. Paul''s Co-educational College') and categoryid=2;
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Paul''s Co-educational College Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('St. Paul''s College') and categoryid=2;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('St. Paul''s College Primary School') and categoryid=1;
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('St. Paul''s Convent School') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Paul''s Convent School (Primary Section)') and categoryid=1;
update entity set musicfirst=musicfirst+2,musicthird=musicthird+3 where lower(nameeng) = lower('St. Stephen''s College') and categoryid=2;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('St. Stephen''s College Preparatory School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Stephen''s Girls'' College') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('St. Stephen''s Girls'' Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Stewards Pooi Kei College') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Stewards Pooi Kei Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Taoist Ching Chung Primary School (Wu King Estate)') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('The Education University of Hong Kong Jockey Club Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where lower(nameeng) = lower('The ELCHK Yuen Long Lutheran Secondary School') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('H.K.E.C.A. Wu Si Chong Memorial School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('The Salvation Army Ann Wyllie Memorial School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('The True Light Middle School of Hong Kong (Primary Section)') and categoryid=1;
update entity set musicsecond=musicsecond+2 where lower(nameeng) = lower('Tin Shui Wai Catholic Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Tin Shui Wai Government Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('True Light Girls'' College') and categoryid=2;
update entity set musicsecond=musicsecond+2 where lower(nameeng) = lower('Tseung Kwan O Catholic Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Tsuen Wan Government Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1 where lower(nameeng) = lower('Tsuen Wan Government Secondary School') and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where lower(nameeng) = lower('Tsung Tsin Christian Academy') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('T.W.G.Hs. H.K. & KLN. E.A.M.A. Ltd. School') and categoryid=1;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('TWGHs Kap Yan Directors'' College') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('TWGHs Li Ka Shing College') and categoryid=2;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where lower(nameeng) = lower('T.W.G.Hs Ma Kam Chan Memorial Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('T.W.G.Hs. Yiu Dak Chi Memorial Primary School (Yuen Long)') and categoryid=1;
update entity set musicthird=musicthird+2 where lower(nameeng) = lower('Wa Ying College') and categoryid=2;
update entity set musicthird=musicthird+1 where lower(nameeng) = lower('Wah Yan College Hong Kong') and categoryid=2;
update entity set musicsecond=musicsecond+3,musicthird=musicthird+2 where lower(nameeng) = lower('Wah Yan College, Kowloon') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Yaumati Kaifong Association School') and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+2 where lower(nameeng) = lower('Ying Wa College') and categoryid=2;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Ying Wa Girls'' School') and categoryid=2;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+3,musicthird=musicthird+1 where lower(nameeng) = lower('Ying Wa Primary School') and categoryid=1;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where lower(nameeng) = lower('Yuen Long Government Primary School') and categoryid=1;
update entity set musicsecond=musicsecond+1 where lower(nameeng) = lower('Yuen Long Merchants Association Primary School') and categoryid=1;
update entity set musicthird=musicthird+1 where name = '三水同鄉會禤景榮學校' and categoryid=1;
update entity set musicthird=musicthird+2 where name = '中華基督教會協和小學（長沙灣）' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '中華基督教會基慧小學（馬灣）' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '中華基督教會基灣小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '中華基督教會基灣小學（愛蝶灣）' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '中華基督教會基真小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '九龍塘宣道小學' and categoryid=1;
update entity set musicsecond=musicsecond+3,musicthird=musicthird+1 where name = '華仁書院（九龍）' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '仁濟醫院羅陳楚思中學' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '仁濟醫院蔡衍濤小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '伊利沙伯中學' and categoryid=2;
update entity set musicsecond=musicsecond+2 where name = '何明華會督銀禧中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '何東中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '保良局朱正賢小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '保良局百周年李兆忠紀念中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '保良局莊啟程第二小學' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '保良局蕭漢森小學' and categoryid=1;
update entity set musicfirst=musicfirst+2 where name = '保良局香港道教聯合會圓玄小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '元朗商會小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '光明學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '光明英來學校' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '勵志會梁李秀娛紀念小學' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '北角循道學校' and categoryid=1;
update entity set musicsecond=musicsecond+2,musicthird=musicthird+3 where name = '協恩中學' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '協恩中學附屬小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '南亞路德會沐恩中學' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '南元朗官立小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '博愛醫院歷屆總理聯誼會梁省德中學' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '博愛醫院歷屆總理聯誼會鄭任安夫人學校' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '喇沙小學' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+2,musicthird=musicthird+1 where name = '喇沙書院' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '嘉諾撒聖家學校' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '嘉諾撒聖家書院' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '嘉諾撒聖心學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '嘉諾撒聖心書院' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '嘉諾撒聖瑪利書院' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '培僑書院' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '培基小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '基督教宣道會宣基中學' and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '基督教宣道會徐澤林紀念小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '大埔官立小學' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '天水圍天主教小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '天水圍官立小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '天神嘉諾撒學校' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '妙法寺劉金龍中學' and categoryid=2;
update entity set musicthird=musicthird+2 where name = '宣道會葉紹蔭紀念小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '寶血會伍季明紀念學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '寶血會嘉靈學校' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '寶血會思源學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '將軍澳天主教小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '將軍澳官立小學' and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '崇真小學暨幼稚園' and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '庇理羅士女子中學' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '廖寶珊紀念書院' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '循道學校' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '德望學校' and categoryid=2;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+2,musicthird=musicthird+1 where name = '德望小學暨幼稚園' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '德雅小學' and categoryid=1;
update entity set musicfirst=musicfirst+4 where name = '拔萃女小學 ' and categoryid=1;
update entity set musicfirst=musicfirst+3,musicsecond=musicsecond+2,musicthird=musicthird+2 where name = '拔萃女書院' and categoryid=2;
update entity set musicfirst=musicfirst+5,musicsecond=musicsecond+4,musicthird=musicthird+2 where name = '拔萃男書院' and categoryid=2;
update entity set musicsecond=musicsecond+2 where name = '拔萃男書院附屬小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '播道書院' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where name = '新界婦孺福利會梁省德學校' and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '新界鄉議局元朗區中學' and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '曾梅千禧學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '東華三院吳祥川紀念中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '東華三院李嘉誠中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '東華三院港九電器商聯會小學' and categoryid=1;
update entity set musicthird=musicthird+2 where name = '東華三院王余家潔紀念小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '東華三院甲寅年總理中學' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '東華三院黃笏南中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '林村公立黃福鑾紀念學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '民生書院' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '民生書院小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '沙田圍胡素貞博士紀念學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '沙田官立中學' and categoryid=2;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '沙田循道衛理中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '沙田循道衛理小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '油蔴地天主教小學（海泓道）' and categoryid=1;
update entity set musicfirst=musicfirst+2 where name = '港九街坊婦女會孫方中小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '港大同學會小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '滬江小學' and categoryid=1;
update entity set musicsecond=musicsecond+2 where name = '瑪利曼中學' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '瑪利曼小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '瑪利諾修院學校（中學部）' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '番禺會所華仁小學' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '真光女書院' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '石湖墟公立學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '石籬聖若望天主教小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '羅定邦中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '聖保祿學校' and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '聖保祿學校（小學部）' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+3 where name = '聖保羅書院' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '聖保羅書院小學' and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+2 where name = '聖保羅男女中學' and categoryid=2;
update entity set musicfirst=musicfirst+2,musicthird=musicthird+1 where name = '聖保羅男女中學附屬小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '聖公會九龍灣基樂小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '聖公會何澤芸小學' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '聖公會德田李兆強小學' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '聖公會曾肇添中學' and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '聖公會林裘謀中學' and categoryid=2;
update entity set musicfirst=musicfirst+3 where name = '聖公會林護紀念中學' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '聖公會柴灣聖米迦勒小學' and categoryid=1;
update entity set musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '聖公會田灣始南小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '聖公會聖彼得小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '聖公會聖約瑟小學' and categoryid=1;
update entity set musicfirst=musicfirst+1 where name = '聖公會莫壽增會督中學' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '聖公會青衣主恩小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '聖公會馬鞍山主風小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '聖博德學校' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '聖嘉勒小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '聖士提反書院' and categoryid=2;
update entity set musicfirst=musicfirst+1 where name = '聖士提反書院附屬小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '聖羅撒書院' and categoryid=2;
update entity set musicfirst=musicfirst+2,musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '聖若瑟書院' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '聖類斯中學（小學部）' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '英華女學校' and categoryid=2;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+2 where name = '英華小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '英華書院' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '觀塘官立中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '農圃道官立小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '迦密中學' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '迦密唐賓南紀念中學' and categoryid=2;
update entity set musicfirst=musicfirst+4,musicsecond=musicsecond+1,musicthird=musicthird+1 where name = '迦密柏雨中學' and categoryid=2;
update entity set musicthird=musicthird+2 where name = '順德聯誼總會梁銶琚中學' and categoryid=2;
update entity set musicthird=musicthird+1 where name = '順德聯誼總會胡少渠紀念小學' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicthird=musicthird+1 where name = '風采中學（教育評議會主辦）' and categoryid=2;
update entity set musicsecond=musicsecond+1 where name = '香海正覺蓮社佛教正慧小學' and categoryid=1;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '香港中國婦女會丘佐榮學校' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '香港仔聖伯多祿天主教小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '香港培正小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '香港浸會大學附屬學校王錦輝中小學' and categoryid=2;
update entity set musicfirst=musicfirst+1,musicsecond=musicsecond+1 where name = '香港浸會大學附屬學校王錦輝中小學' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '香港潮陽小學' and categoryid=1;
update entity set musicthird=musicthird+1 where name = '香港真光中學（小學部）' and categoryid=1;
update entity set musicsecond=musicsecond+1 where name = '香港華仁書院' and categoryid=2;



update entityscore es, entity e set es.musicfirst=e.musicfirst,es.musicsecond=e.musicsecond,es.musicthird=e.musicthird where es.entityid=e.id and es.year=2018;
