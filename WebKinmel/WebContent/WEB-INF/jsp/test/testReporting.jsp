<html>
  <head>
  	<script src="/WebKinmel/resources/js/jquery.js"></script>   
    <!-- <script type="text/javascript" src="/WebKinmel/resources/js/jsapi.js"></script> -->
  </head>
  <body>
    <h3>Reporting</h3>
    <div id="click">
    	<a id="pieChart">PieChart</a>
    	<a href="barChart.htm" id="barChart">BarChart</a>
    </div>
    <div id="report"></div>
    <script type="text/javascript">
    	jQuery("#click a").click(function(){
    		var url=jQuery(this).attr("id")+".htm";
    		alert(url);
    		jQuery.ajax({
    			url:url,
    			success:function(data){
    				alert(data);
    				jQuery("#report").html(data);
    			}
    		});
    	});
    </script>
  </body>
</html>