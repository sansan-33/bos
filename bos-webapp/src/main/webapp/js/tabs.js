$(document).ready(function(){
	$(".menu > li").click(function(e){
		switch(e.target.id){
			case "kindergarten":
				//change status & style menu
				$("#kindergarten").addClass("active");
				$("#primary").removeClass("active");
				$("#secondary").removeClass("active");
				$("#others").removeClass("active");
				//display selected division, hide others
				$("div.kindergarten").fadeIn();
				$("div.primary").css("display", "none");
				$("div.secondary").css("display", "none");
				$("div.others").css("display", "none");
			break;
			case "primary":
				//change status & style menu
				$("#kindergarten").removeClass("active");
				$("#primary").addClass("active");
				$("#secondary").removeClass("active");
				$("#others").removeClass("active");
				//display selected division, hide others
				$("div.primary").fadeIn();
				$("div.kindergarten").css("display", "none");
				$("div.secondary").css("display", "none");
				$("div.others").css("display", "none");
			break;
			case "secondary":
				//change status & style menu
				$("#kindergarten").removeClass("active");
				$("#primary").removeClass("active");
				$("#secondary").addClass("active");
				$("#others").removeClass("active");				
				//display selected division, hide others
				$("div.secondary").fadeIn();
				$("div.kindergarten").css("display", "none");
				$("div.primary").css("display", "none");
				$("div.others").css("display", "none");
			break;
			case "others":
				//change status & style menu
				$("#kindergarten").removeClass("active");
				$("#primary").removeClass("active");
				$("#secondary").removeClass("active");
				$("#others").addClass("active");				
				//display selected division, hide others
				$("div.others").fadeIn();
				$("div.kindergarten").css("display", "none");
				$("div.primary").css("display", "none");
				$("div.secondary").css("display", "none");
			break;
		}
		//alert(e.target.id);
		return false;
	});
});


