<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/highcharts-more.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<div id="container" style="min-width: 300px; max-width: 300px; height: 300px; margin: 0px "></div>

<script>

$(function () {

	$('#container').highcharts({

	    chart: {
	        polar: true,
	        type: 'area'
	    },

	    title: {
	        text: ' ',
	        x: -80,
	        floating: true
	    },

	    pane: {
	    	size: '80%'
	    },

	    xAxis: {
	        categories: [${requestScope.attributename} ],
	        tickmarkPlacement: 'on',
	        lineWidth: 0
	    },

	    yAxis: {
	        gridLineInterpolation: 'polygon',
	        lineWidth: 0,
	        ceiling: 10,
	        min: 0,
	        max:10,
	        tickPixelInterval:20
	    },

	    tooltip: {
	    	shared: true,
	        pointFormat: '<span style="color:{series.color}"><b>{point.y}</b><br/>'


	    },

        legend: {
	        align: 'right',
	        verticalAlign: 'top',
	        y: 70,
	        layout: 'vertical',
	        enabled: false
	    },

	    series: [{
	        name: '',
	        data: [${requestScope.attributevalue}],
	        pointPlacement: 'on'
	    }]

	});
});

</script>



