<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebKinmel</title>
<link type="text/css" href="/WebKinmel/resources/css/style.css" rel="stylesheet" />
<link type="text/css" href="/WebKinmel/resources/css/bootstrap.css" rel="stylesheet" />
<script src="/WebKinmel/resources/js/jquery.js"></script>  
</head>

<body>
	<div class="wrapper">
    	<div id="topbar" class="topbar">
        	<ul class="topnav">
            	<li><a id="login">&bull;Sign in</a></li>
                <li><a id="register">&bull;Register</a></li>
            </ul>
            <script>
            	jQuery("#topbar a").click(function(){
            		var url="login/"+jQuery(this).attr("id")+".htm";
            		jQuery.ajax({
            			url:url,
            			success:function(data){
            				//alert(data);
            				jQuery(".mainContent").html(data);
            			}
            		});
            	});
            </script>
		</div>
        <div class="logobar">
        	<div class="logo">
            	<img src="/WebKinmel/resources/image/logo2.png" height="100" />
            </div>
            <div class="searchBox">
            	
                <button class="search-button">GO</button>
                <input class="search-input" placeholder="Search website" />
            </div>
        </div>
        <div class="menubar">
        	<ul>
            	<li><a href="adminHome.htm" name="adminHomeContent">HOME</a></li>
                <li><a href="#" name="adminItem">ITEMS</a></li>
                <li><a href="#" name="adminCategory">CATEGORIES</a></li>
                <li><a href="#" name="adminManufacturer">MANUFACTURERS</a></li>
                <li><a href="#" name="adminUser">USERS</a></li>
            </ul>
        </div>
        <br clear="all" />
        <%-- <p>Recent Object:${recent}</p> --%>
        <div class="mainContent" id="mainContent">  
        	<div>
				<!-- ========================================================================== -->
            	<div class="side">
                        <div class="myPanel myPanel_category">
                            <div class="myPanel-heading">Categories</div>
                            <div class="myPanel-body">
                                <div class="category_list"><a href="#">Category1</a></div>
                                <div class="category_list"><a href="#">Category2</a></div>
                                <div class="category_list"><a href="#">Category3</a></div>
                                <div class="category_list"><a href="#">Category4</a></div>
                                <div class="category_list"><a href="#">Category5</a></div>
                                <div class="category_list"><a href="#">Category6</a></div>
                                <div class="category_list"><a href="#">Category7</a></div>
                            </div>
                        </div>
                        <div class="myPanel">
                                <div class="myPanel-heading">Viewed Products</div>
                                <div class="myPanel-body">
                                    <b>Test Product</b><br />
                                    <p>Lorem ispum and blah blah blah</p>
									<select>
										<option>All manufacturers</option>
										<option>to be added</option>
									</select>
                            </div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
                        
						<div class="myPanel">
                                <div class="myPanel-heading">Manufacturers</div>
                                <div class="myPanel-body">
                                    <p>>>Apple Computers Inc.</p>
                                    <p>>>Shure Incorporate</p>
                            </div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
						
                        <div class="myPanel">
                                <div class="myPanel-heading">Information</div>
                                <div class="myPanel-body">
                                    <p>Delivery</p>
                                    <p>Legal Notice</p>
									<p>Terms and conditions of use</p>
									<p>About us</p>
									<p>Secure Payment</p>
									<p>Our Stores</p>
									
                            </div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
                        
                         <div class="myPanel">
                                <div class="myPanel-heading">Tags</div>
                                <div class="myPanel-body">
                                    <p>apple ipod Ipod touch suffle superdrive nano</p>
                            </div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
                </div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
         		
                <div class="middle"></div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
                <div class="side">
                        <div class="myPanel">
                                <div class="myPanel-heading">Shoping Cart</div>
                                <div class="myPanel-body">
                                    <div class="cart-content">
                                        No Products
                                    </div>
                                    <div class="cart-content">
                                        <div>
                                            <div class="left">Shipping</div>
                                            <div class="right"><b>$0.00</b></div>
                                        </div>
                                        <div class="clear"></div>
										<div>
											<div class="left">Total</div>
											<div class="right"><b>$0.00</b></div>
										</div>
										<div class="clear"></div>
									</div>
									<div class="small">Prices are tax included</div>
									<div class="">
										<button class="myButton">Cart</button>
										<button class="myButton">Check out</button>
									</div>
								</div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
						 <div class="myPanel">
                                <div class="myPanel-heading">New Products</div>
                                <div class="myPanel-body">
                                    <p><b>Test Product</b><br/>Lorem ipsum dolor sit amet, consectetur......>></p>
									<p><b>Test Product</b><br/>Lorem ipsum dolor sit amet, consectetur......>></p>
									<p><b>Test Product</b><br/>Lorem ipsum dolor sit amet, consectetur......>></p>
									<p><b>Test Product</b><br/>Lorem ipsum dolor sit amet, consectetur......>></p>
									<p><b>Test Product</b><br/>Lorem ipsum dolor sit amet, consectetur......>></p>
									
									<p><button class="myButton full-button">All new products</button></p>
								</div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
						
						<div class="myPanel">
                                <div class="myPanel-heading">Specials</div>
                                <div class="myPanel-body">
                                    <p><b>Test Product</b><br/>Lorem ipsum dolor sit amet, consectetur......>></p>
									
									<p class="centre"><button class="myButton full-button">All specials</button></p>
								</div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
						
						<div class="myPanel">
                                <div class="myPanel-heading">Our Stores</div>
                                <div class="myPanel-body">
                                    <p>discover our stores</p>
								</div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
                </div><!-- End of side-->
				<!-- ========================================================================== -->
            </div>
        </div>
    </div>
	<div class="clear"></div>
	<div class="footer">
    	<div class="wrapper">
    		<div class="upper-footer"><img src="/WebKinmel/resources/image/footer_secure.png" height="65"/></div>
    		<div class="lower-footer">
    			<div class="lower-footer-divider">
    				Home page<br />
    				New Arrivals<br />
    				Top Sellers<br />
    				Specials<br />
    				Cart<br />
    			</div>
    			<div class="lower-footer-divider">
    				Home page<br />
    				New Arrivals<br />
    				Top Sellers<br />
    				Specials<br />
    				Cart<br />
    			</div>
    			<div class="lower-footer-divider">
    				Home page<br />
    				New Arrivals<br />
    				Top Sellers<br />
    				Specials<br />
    				Cart<br />
    			</div>
    			<div class="lower-footer-divider">
    				Home page<br />
    				New Arrivals<br />
    				Top Sellers<br />
    				Specials<br />
    				Cart<br />
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
		}
	}); 
</script>
<script>
	jQuery(".menubar a").click(function(){
		//alert("test");
		//jQuery(".nav-pills li").removeClass("active");
		//jQuery(this).parent().addClass("active");
		
		jQuery.ajax({
			url:"admin/"+jQuery(this).attr("name")+	".htm",
			success:function(data){
				jQuery("#mainContent").html(data);
			}
		}); 
	});
	
</script>
</body>
</html>
