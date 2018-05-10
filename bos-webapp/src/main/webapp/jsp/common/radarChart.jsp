<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<script src="/school/js/Chart.min.js"></script>

<!-- Radar Chart -->
  <div style="min-width: 200px; max-width: 200px; height: 200px; margin: 0px; padding-left:10px;padding-top:20px;">
    <canvas id="radarChart" width="200" height="200"></canvas>
  </div>





  <script>

  // ======================================================
  // Radar Chart
  // ======================================================

  // Radar Chart Options
  var radarOptions = {

  	    // Boolean - If we should show the scale at all
        showScale: true,

        // Boolean - If we want to override with a hard coded scale
        scaleOverride: true,

        // ** Required if scaleOverride is true **
        // Number - The number of steps in a hard coded scale
        scaleSteps: 10,
        // Number - The value jump in the hard coded scale
        scaleStepWidth: 1,
        // Number - The scale starting value
        scaleStartValue: 0,

  	    //Boolean - Whether to show lines for each scale point
        scaleShowLine : true,

        //Boolean - Whether we show the angle lines out of the radar
        angleShowLineOut : true,

        //Boolean - Whether to show labels on the scale
        scaleShowLabels : true,

        //Number - Scale label font size in pixels
	    scaleFontSize : 10,

        //String - Scale label font colour
	    scaleFontColor : "#888",

        // Boolean - Whether the scale should begin at zero
        scaleBeginAtZero : true,

        //String - Colour of the angle line
        angleLineColor : "rgba(0,0,0,.1)",

        //Number - Pixel width of the angle line
        angleLineWidth : 1,

        //String - Point label font declaration
        pointLabelFontFamily : "'Arial'",

        //String - Point label font weight
        pointLabelFontStyle : "normal",

        //Number - Point label font size in pixels
        pointLabelFontSize : 12,

        //String - Point label font colour
        pointLabelFontColor : "black",

        //Boolean - Whether to show a dot for each point
        pointDot : true,

        //Number - Radius of each point dot in pixels
        pointDotRadius : 3,

        //Number - Pixel width of point dot stroke
        pointDotStrokeWidth : 1,

        //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
        pointHitDetectionRadius : 20,

        //Boolean - Whether to show a stroke for datasets
        datasetStroke : true,

        //Number - Pixel width of dataset stroke
        datasetStrokeWidth : 2,

        //Boolean - Whether to fill the dataset with a colour
        datasetFill : true,

        //Boolean - Whether to animate the chart
	    animation : true,

	//Number - Number of animation steps
	animationSteps : 60,

	//String - Animation easing effect
	animationEasing : "easeOutQuart",

	//Function - Fires when the animation is complete
	onAnimationComplete : null,

    //String - A legend template
    legendTemplate : "<ul><li>2011</li><li>2012</li></ul>"

  }

  // Radar Data
  var radarData = {
  	labels : [${requestScope.attributename}],
  	datasets : [


                {
                  			  fillColor: "rgba(151,187,205,0.2)",
                                        strokeColor: "rgba(151,187,205,1)",
                                        pointColor: "rgba(151,187,205,1)",
                                        pointStrokeColor: "#fff",
                                        pointHighlightFill: "#fff",
                                        pointHighlightStroke: "rgba(151,187,205,1)",
                  			data : [${requestScope.attributevalue}]
                  		}
  	]
  }


  //Get the context of the Radar Chart canvas element we want to select
  var ctx = document.getElementById("radarChart").getContext("2d");

  // Create the Radar Chart
  var myRadarChart = new Chart(ctx).Radar(radarData, radarOptions);


  </script>