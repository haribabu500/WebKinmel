<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebKinmel</title>
<link type="text/css" href="/WebKinmel/resources/css/style.css" rel="stylesheet" />
<link type="text/css" href="/WebKinmel/resources/css/bootstrap.css" rel="stylesheet" />
<script src="/WebKinmel/resources/js/jquery.js"></script> 
<script src="/WebKinmel/resources/js/bootstrap.js"></script>  
 <!-- Custom CSS -->
    <link href="/WebKinmel/resources/css/sb-admin.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="/WebKinmel/resources/css/plugins/morris.css" rel="stylesheet">

<script type="text/javascript">
/* script to disable unwanted enter key event on form submit */
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey; 
</script> 
<script src="/WebKinmel/resources/js/validation/additional-methods.min.js"></script> 
<script src="/WebKinmel/resources/js/validation/jquery.validate.min.js"></script> 
</head>

<body>
	<div class="wrapper">
    	<div id="topbar" class="topbar">
        	<script type="text/javascript">
    			jQuery.ajax({
    				url:"topbarContent.htm",
    				success:function(data){
    					jQuery("#topbar").html(data);
    				},
    				error:function(){
    					alert("oops!! something went wrong");
    				}
    			});
    		</script>
		</div>
		<div class="clear"></div>
        <div class="logobar">
        	<div class="logo">
            	<img src="/WebKinmel/resources/image/logo2.png" height="100" />
            </div>
            <div class="searchBox">
            	
                <button class="search-button">GO</button>
                <input id="searchInput" class="search-input" placeholder="Search website" />
                <script>
                	function processSearch(){
                		var search_key=jQuery("#searchInput").val();
                		var search_url=jQuery("#mainContent").attr("name");
                		var url="admin/"+search_url+".htm?search="+search_key;
                		console.log(url);
                		
                		jQuery.ajax({
                			url:url,
                			success:function(data){
                				jQuery("#mainContent").html(data);
                				/* console.log(data); */
                			},
                			error:function(data){
                				alert("OOps sopenting went wrong@!!!!");
                			}
                		}); 
                	}
                	jQuery(".search-button").on('click',function(){
                		processSearch();
                	});
                	jQuery("#searchInput").on("keyup",function(e){
                		var code=e.which;
                		if(code==13){
                			processSearch();
                		}
                	});
                </script>
            </div>
        </div>
        <div class="clear"></div>
        <div class="menubar">
        	<ul>
            	<li><a href="adminHome.htm" name="adminHomeContent">HOME</a></li>
                <li><a href="#" name="adminItem">ITEMS</a></li>
                <li><a href="#" name="adminCategory">CATEGORIES</a></li>
                <li><a href="#" name="adminManufacturer">MANUFACTURERS</a></li>
                <li><a href="#" name="adminUser">USERS</a></li>
                <!-- <li><a href="#" name="adminOrders">ORDERS</a></li> -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Orders <b class="caret"></b></a>
                    <ul class="dropdown-menu color_report_menu">
                        <li>
                            <a href="#" name="undeliveredOrders"> Undelivered Orders</a>
                        </li>
                        <li>
                            <a href="#" name="deliveredOrders"> Delivered Orders</a>
                        </li>
                        <li>
                            <a href="#" name="adminOrders"> All Orders</a>
                        </li>
                        
                    </ul>
                </li>
                <!-- <li><a href="#" name="adminReports">REPORTS</a></li> -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Reports <b class="caret"></b></a>
                    <ul class="dropdown-menu color_report_menu">
                        <li>
                            <a href="#" name="manufacturersReport"> Manufacturers report</a>
                        </li>
                        <li>
                            <a href="#" name="categoriesReports"> Categories Report</a>
                        </li>
                        
                    </ul>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="mainContent" id="mainContent">  

        </div>
		
    </div>
	<div class="clear"></div>
       
	<div class="footer">
    	<div class="wrapper">
    		<div class="upper-footer"><img src="/WebKinmel/resources/image/footer_secure.png" height="65"/></div>
    		<div class="lower-footer">
    			<div class="lower-footer-divider">

    			</div>
    			<div class="lower-footer-divider">
    				
    			</div>
    			<div class="lower-footer-divider">
    				
    			</div>
    			<div class="lower-footer-divider">
    				
    			</div>
    			<div class="clear"></div>
    			<div class="lower-footer-centre">
    				<p>
    					Regisered Address:Anamnagar, Kathmandu, Nepal<br />
    					Office Address:Anamnagar, Kathmandu, Nepal<br />
    					All Rights Reserved
    				</p>
    			</div>
    			<div class="lower-footer-bottom">
    				<span class="lower-footer-bottom-divider">Specials </span>
    				<span class="lower-footer-bottom-divider">New Products </span>
    				<span class="lower-footer-bottom-divider">Top Sellers </span>
    				<span class="lower-footer-bottom-divider">Contact Us </span>
    				<span class="lower-footer-bottom-divider">Terms and conditions of use </span>
    				<span class="lower-footer-bottom-divider">About us </span>
    			</div>
    		</div>
        	
        </div>
    </div>
 
<script>
	jQuery.ajax({
		url:"admin/adminItem.htm",
		success:function(data){
			jQuery("#mainContent").html(data);
			jQuery("#mainContent").attr("name","adminItem");
		}
	}); 
</script>
<script>
	jQuery(".menubar a").click(function(){
		var name=jQuery(this).attr("name");
		if(name!=null){
			jQuery.ajax({
				url:"admin/"+jQuery(this).attr("name")+	".htm",
				success:function(data){
					jQuery("#mainContent").html(data);
					jQuery("#mainContent").attr("name",name);
				}
			}); 
		}
	});
</script>
</body>
</html>
