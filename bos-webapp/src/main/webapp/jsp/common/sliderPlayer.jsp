<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link rel="stylesheet" TYPE='text/css' href="${pageContext.request.contextPath}/stylesheet/agile_carousel.css">
<script type="text/javascript" src="/school/js/agile_carousel.a1.1.min.js"></script>
<script>
    $.getJSON("/school/controller/getSliderData", function(data) {
        $(document).ready(function(){
            $("#flavor_2").agile_carousel({
                
                // required settings
                
                carousel_data: data,
                carousel_outer_height: 488,
                carousel_height: 370,
                slide_height: 370,
                carousel_outer_width: 790,
                slide_width: 790,

                // end required settings
                                                
                transition_type: "fade",
                transition_time: 600,
                timer: 6000,
                continuous_scrolling: true,
                control_set_1: "numbered_buttons,previous_button,... (continues on same line)... pause_button,next_button",
                control_set_2: "content_buttons",
                change_on_hover: "content_buttons"
            });
        });
    });
 </script>
<div class="slideshow_wrapper slideshow_wrapper_single">
					<div class="slideshow" id="flavor_2"></div>
</div>