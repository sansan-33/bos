DROP TABLE IF EXISTS  bos.cms;

CREATE TABLE bos.cms (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         imgfilename varchar(30),
	 title varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 summary varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 content varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci,
	 lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
         created TIMESTAMP 
);


insert into bos.cms (imgfilename,title,summary,content,lastmodified,created) values ('../img/casesharingads.png','分享有賞','過去一年，你選校的寶貴經驗和策略，請用文字和圖片在我們的網站紀錄下來，既可以幚助其他家長的小朋友考進心儀學校又可以得到現金獎。
','<font class="font4 d3-color-gray-1"> 過去一年，你選校的寶貴經驗和策略，請用文字和圖片在我們的網站紀錄下來，每篇字數上限五百字和三張圖片。每月會選出頭三名最多人觀看的個案，第一名賞HK$500，第二名賞HK$300，第三名賞HK$100作為鼓勵。最重要的是可以幫助其他家長的小朋友考進心儀學校。</font><br><br>
備註: <br class="clear">
	<ul>
	<!-- <li>* 惟必須達到1000人次觀看最低要求才有賞。</li> -->
	<li>* 每個月七號以支票形式寄給上一個月的得獎者。</li>
	<li>* 必須未經在網上發表。</li>
	<li>* 禁止惡意增加觀看次數，每部電腦每天只會計算一次。</li>
	</ul>
	<br class="clear"><br class="clear">
	<table style="margin: auto;"><tr>
<td><span class="button_grn"><span class="bg_grn gradient" onclick=''javascript:{window.location="/school/controller/editCaseSharingDetails?mode=add"}''>立即參加 Join Now</span></span>
				</td>
				</tr>
				</table>

',now(),now());

insert into bos.cms (imgfilename,title,summary,content,lastmodified,created) values ('../img/rankingsystemads.png','評級系統','排名根據全港，地區和校網三部份，以五大指標: 學術，體育，音樂，校舍和師資，全方位計算出各校實力。','
<font class="font4">系統以下5大類別評分,評分方法會按照每個類別不同的屬性進行比較，根據他們的排序以 Normal Distribution 計算得分, 由1至10分, 排最先的5%得10分,中間的30%得5分,最後的5%得1分. </font><font class="d3-color-orange"><br>比重方面，幼稚園的學術佔60%，其餘兩項佔20%。小學及中學的學術佔40%，其餘四項佔15%。</font><br><br><ul class="rankingsystem"><li>Academic學術:<ul><li>中學: 以入大學百份比, 高考中英文及格百份比, 6科14分百份比去排序, 百份比越高, 分數越高.</li><li>小學: 以升中結果序排序, 越多學生派去BAND 1中學, 分數越高.</li><li>幼稚園: 以升小結果序排序, 越多學生派去BAND 1小學, 分數越高.</li></ul></li><li>Sport體育:<ul><li>根據香港學界體育聯會的校際田徑,籃球,足球及游泳成績, 總分越高, 分數越高.</li></ul></li><li>Music音樂:<ul><li>根據校際音樂,朗誦節成績, 冠軍10分, 亞軍7分, 季軍5分, 總分越高, 分數越高.</li></ul></li><li>Campus校舍:<ul><li>根據校舍大小排序, 校舍越大, 分數越高.</li></ul></li><li>Teacher師資:<ul><li>根據老師"年資10年或以上", "學歷碩士、博士或以上"和"學士"百份比排序, 百份比越高, 分數越高.</li></ul></li></ul>
<hr>
<br class="clear"><br class="clear"><font class="font4">
Our system (bookofschool) rating base on below attributes and calculate the ranking of 900+ kindergarten, 500+ Primary School and 400+ Secondary School. </font><font class="d3-color-orange"><br>Academic contribute 40% and the other attributes contribute 15% on the ranking calculation.</font>
<br class="clear"><br class="clear">
<ul class="rankingsystem">
<li>Academic<ul><li> kindergarten is based on placement result of highly ranked primary schools, and primary school is based on placement result of secondary school, finally secondary school ranking is based on HKCEE ,HKAL result and acceptance of university%</li></ul> </li>
<li>Sport<ul><li> inter-school competition result of athletics, swimming and football</li></ul></li>
<li>Music<ul><li> Hong Kong Schools Music Festival and Hong Kong Schools Speech Festival</li></ul></li>
<li>Campus<ul><li> no of classroom, outdoor playground, indoor playground</li></ul></li>
<li>Teacher<ul><li> % of master degree, teacher pupil ratio and working exp.</li></ul></li>
</ul>

<br>
<font class="fontsmall d3-color-gray-3">P.S. For those school do not provide school placement result , we will manually adjust the score for them based on their reputation form other forum.</font>

<br class="clear"><br class="clear"><br class="clear"><hr><br class="clear">
<font class="fontsmall d3-color-gray-2">
我們是根據以下全港校際比賽成績去計算音樂，朗誦和體育排名: <br /><br />
<div>體育 : 香港學界體育聯會 <a target="_blank" href="http://www.hkssf-hk.org.hk/hk/pri/results%20book/6_Results-Book_1011.pdf" target="_blank">資料來源(一)</a>      <a target="_blank" href="http://www.hkssf-hk.org.hk/hk/sec/events/ath.htm" target="_blank">資料來源(二)</a></div><div>音樂 : 第六十三屆香港學校音樂節 <a target="_blank" href="http://www.hksmsa.org.hk/download/winlist/63MWinner.pdf" target="_blank">資料來源</a></div><div>朗誦 : 第六十三屆香港學校朗誦節 <a target="_blank" href="http://www.hksmsa.org.hk/download/winlist/63SWinner.pdf" target="_blank">資料來源</a></div><div><br /><br /><br /></div></font>
',now(),now());



insert into bos.cms (imgfilename,title,summary,content,lastmodified,created) values ('../img/signup.png','會員獨享','如何有效地從數百間學校中選出心儀的學校?只要成為會員，便可享有獨家功能，助你輕鬆選校!',
'
<hr><div style="padding:30px 80px 30px 80px;overflow:hidden;width:450px;">

<div style="float:left;position:relative;width:60px;"><img src="../img/favoritesample.png" style="width:60px;height:70px;"/></div>
<div style="float:right;position:relative;width:350px;">登錄後可將心儀的學校加入到"我喜愛的學校"和記低自己選校次序, "我的喜愛學校"列出心儀的學校, 選擇一間學校, 按“日曆按鈕”, 在ORDER位置填上排序, 逐間填上, 可以清楚看見自己的選校次序, 而且記錄在本網站, 方便重溫.</div><br class="clear"/><br class="clear"/><div class="line-type2-flat"></div><br class="clear"/>
<div style="float:left;position:relative;width:350px;">預測報名人數，分析熱門程度! 只要一按"預計招生"按鈕便可知道詳情</span></div>
<div style="float:right;position:relative;width:60px;"><img src="../img/enrollsample.png" style="width:50px;height:50px;"/></div>
<br class="clear"/><br class="clear"/><div class="line-type2-flat"></div><br class="clear"/>

<div style="float:left;position:relative;width:60px;"><img src="../img/reminder.png" style="width:40px;height:40px;"/></div>
<div style="float:right;position:relative;width:350px;">本網站會搜集各中小學幼稚園入學申請時間, 面試日期, 結果公報日期. 你更可將心儀學校的重要日子, 記錄在"我喜愛的學校"->“日曆"按鈕內.</div>
<br class="clear"/><br class="clear"/><div class="line-type2-flat"></div><br class="clear"/>
<div style="float:left;position:relative;width:200px;padding-top:5px;">建立起好友名單，即時和名校家長了解面試心得。最新收到的訊息會在右上角畫面顯示，提示家長和好友聯絡!</div>
<div style="float:right;position:relative;width:250px;"><img src="../img/messagesample.png" width="250px;" height="58px"/></div>
<br class="clear"/><br class="clear"/><div class="line-type2-flat"></div><br class="clear"/>
</div>
	<br class="clear"><br class="clear">
	<table style="margin: auto;"><tr>
<td><span class="button_grn"><span class="bg_grn gradient" onclick=''javascript:{window.location="/school/controller/loginForm?loginType=signup"}''>家長注册 Signup Now</span></span>
				</td>
				</tr>
				</table>

',now(),now());


insert into bos.cms (imgfilename,title,summary,content,lastmodified,created) values ('../img/roadmap.png','資料更新時間表','每年由十月至下一年二月，學校大全都會全面更新各幼稚園,小學及中學的資料，然後計算出最新的排名',
'

<font class="fontxlarge fontbold">資料更新時間表</font><br><br>

<font class="fontlarge">每年由十月至下一年二月，學校大全都會全面更新各幼稚園,小學及中學的資料，然後計算出最新的排名。</font><br><br><br>

<ul class="rankingsystem">
<li>學術 Academic:<ul>
	<li>資料由網上搜集</li>
	<li>中學: 4主科3322率 , 中文(高考及格率)/(達3率), 英文(高考及格率)/(達3率)</li>
	<li>小學: 升中派位</li>
	<li>幼稚園: 升小派位</li></ul></li>

<li>音樂 Music:<ul>
	<li>資料來源由香港學校音樂及朗誦協會</li>
	<li>只計算小學及中學成績，並不包括個人獎項。</li>
	<li>朗誦:香港學校朗誦節 </li>
   	<li>音樂:香港學校音樂節 </li></ul></li>

<li>體育 Sport:<ul>
	<li>資料來源由香港學界體育聯會 </li>
	
	<li>中學<ul>
		<li>九龍港島: <ul>
			<li>田徑(排名) 	第一組,第二組,第三組 (一區),第三組 (二區),第三組 (三區),第三組 (四區) </li>
			<li>籃球(排名)	港島區 第一組,第二組,第三組, 九龍區 第一組,第二組,第三組(k1),第三組(k2),第三組(k3)</li>
			<li>游泳(排名)	第一組,第二組,第三組(港島區),第三組 (九龍一區),第三組 (九龍二區)</li>
			<li>足球(排名)	第一組,第二組,第三組(港島區),第三組 (九龍一區),第三組 (九龍二區),第三組 (九龍三區)</li></ul></li>
		<li>新界: <ul>
			<li>大埔及北區,沙田及西貢區,元朗區,屯門區,荃灣及離島區,葵青區 </li>
			<li>全年總錦標積分(排名) 男子組 女子組 </li></ul></li>
		</ul></li>	


	<li>小學<ul>
		<li>港島及九龍地域小學體育比賽 (積分)</li>
		<li>北區,大埔區,沙田區,西貢區,元朗區,屯門區,大嶼山區,長洲區,荃灣區,葵涌區,青衣區 團體全年總錦標 (積分)<li></ul></li>
	</ul></li>
		

<li>校舍 Area:<ul>
	<li>幼稚園，小學及中學: 資料由網上搜集<li></ul></li>

<li>老師 Teacher:<ul>
	<li>幼稚園，小學及中學: 資料由網上搜集<li></ul></li>

</ul>

',now(),now());

insert into bos.cms (imgfilename,title,summary,content,lastmodified,created) values ('../img/hkej.png','信報刊登','很榮幸得到信報 獨眼香江 紀曉風 引用了學校大全的資料數據，刊登了一篇關於香港灣仔區中學的文章。','<font class="fontxxlarge d3-color-gray-1 fontbold">很榮幸得到信報 獨眼香江 紀曉風 引用了學校大全的資料數據，刊登了一篇關於香港灣仔區中學的文章。對於本網站，這是一種認同和鼓勵。我們會繼續努力，全面分析各校實力。</font><br><br><br><br>

<font class="fontlarge d3-color-gray-2">
信報紀曉風今日篇文講聖公會鄧肇堅用明報社評出題目，搞到被人批評「投共」，值得一看。
<br>
2013年2月19日 紀曉風 獨眼香江 
<br>
大題：<br>
名校習作被指似「投共」教材<br>
校長堅稱「一點不覺有偏頗」<br>
<br>
「假如我是……」是典型的中學作文題目，如果題目是「假如我是陳奕迅」，相信同學定必精神抖擻，快快交文；但港島區一間中學的同學，農曆年假收到一份「假若你是梁振英」的時事評論題目，頓時叫苦連天，隻字未出。
<br><br>
近日網上流傳一份來自聖公會鄧肇堅中學的中文科習作題，以《明報》社評評論劉夢熊披露梁振英鮮為人知事件為參考，既要求學生指出劉夢熊違反香港核心價值的不當之處，還要代表梁振英的角色回應。教材惹起校內議論、校外批評，有網民更直指習作猶如「投共洗腦」教材，亦令深怕「紅色教材」入侵學校的家長同學，儼如重見去年歌頌中國共產黨是「進步、無私與團結的執政集團」的中國國情手冊。來自學界的四位人士皆認為，題目語意不清、帶有引導性，選取的參考資料亦未全面，根本不宜給學生當答題參考。但有關中學的校長卻力撐題目無偏頗，更指同學即使要梁振英辭職下台，只要言之成理也無不妥。
<br><br><b>
被指編撰「洗腦」教材的是灣仔區Band 1（第一組別）中學聖公會鄧肇堅中學，一向深受家長歡迎，在網站《學校大全》，家長在網上對該校的評分為8.9分，比該區傳統名校如屢出狀元的香港華仁書院（8.8分）及百年女校聖保祿學校（8.6分）還要高。
</b><br><br>
惹來爭議的是一份「時事評論」習作，據悉是中五級農曆新年的功課，要求同學就政協委員劉夢熊在《陽光時務週刊》披露行政長官梁振英機密資料作評論。習作提供一篇來自《明報》的社評讓同學參考，然後要求同學回答：「劉夢熊的指控內容有什麼地方違反香港核心價值──重視法治及公平原則」，此外亦要求同學「假若你是梁振英，會如何回應指控」。題目末部分更重申，要求同學要清楚回應「重視法治」及「公平原則」兩項指控。
<br><br>
……<br><br>
……<br><br>
</font>
<a href="http://www.facebook.com/yauchingyuen60seconds/posts/331431320301841" target="_blank">查看原文</a>
<br><br><br>
',now(),now());


insert into bos.cms (imgfilename,title,summary,content,lastmodified,created) values ('../img/likeprimaryschool.png','全港最受歡迎小學','小一大抽獎填表好煩惱? 全港最受歡迎小學幫到你。','<font class="fontxxlarge d3-color-gray-1 fontbold">全港最受歡迎小學</font><br><br><br><br>

<font class="fontlarge d3-color-gray-2">

小一大抽獎填表好煩惱? 【全港最受歡迎小學】幫到你
<br><br><br>
列出超過300間小學小一學額和統一派位學額, 計算自行收生率, 統一派位學額越少, 代表自行收生人數越多, 從而劃分受歡迎程度, 幫助家長填寫小一統一派位申請表。
<br><br>
<img src="../img/hitschoolformula.png" style="width:400px;height:100px;"/>
</font>
<br><br>
<a class="fontbold" style="font-size:25px !important;" href="/school/controller/getHitSchoolReport?schoolyear=2012" target="_self"><font class="d3-color-blue">查看原文 ... </font></a>
<br><br><br>
',now(),now());


