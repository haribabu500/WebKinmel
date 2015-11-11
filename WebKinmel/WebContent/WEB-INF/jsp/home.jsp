<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WebKinmel</title>
<link type="text/css" href="/WebKinmel/resources/css/style.css" rel="stylesheet" />
<link type="text/css" href="/WebKinmel/resources/css/bootstrap.css" rel="stylesheet" />
<script src="/WebKinmel/resources/js/jquery.js"></script>   
<script src="/WebKinmel/resources/js/bootstrap.js"></script>   
</head>

<body>
	<div class="wrapper">
    	<div class="topbar" id="topbar">
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
                	jQuery("#searchInput").on("keyup",function(e){
                		var code=e.which;
                		if(code==13){
	                		var searchKey=jQuery(this).val();
	                		jQuery.ajax({
	          					url:"itemsContent.htm?search="+searchKey,
	          					success:function(data){
	          						//alert(data);
	          						jQuery("#itemsContaiiner").html(data);
	          						//jQuery(".middle").html(data)
	          					},
	          					error:function(){
	          						alert("Oops something went wrong!!");
	          					}
	          				});
                		}
                	});
                	
                	
                	jQuery(".search-button").on('click',function(){
                		var searchKey=jQuery("#searchInput").val();
                		jQuery.ajax({
          					url:"itemsContent.htm?search="+searchKey,
          					success:function(data){
          						//alert(data);
          						jQuery("#itemsContaiiner").html(data);
          						//jQuery(".middle").html(data)
          					},
          					error:function(){
          						alert("Oops something went wrong!!");
          					}
          				});
                	});
                </script>
            </div>
        </div>
        <div class="menubar">
        	<ul>
            	<li><a href="home.htm">HOME</a></li>
            	<c:forEach var="category" items="${categories}">
            		<li><a class="category_click" href="#">${category.name }</a></li>
            	</c:forEach>
               <!--  <script>
           			jQuery(".category_click").click(function(){
           				var queryItem=jQuery(this).html();
           				//alert(queryItem);
           				jQuery.ajax({
           					url:"itemsContent.htm?category="+queryItem,
           					success:function(data){
           						//alert(data);
           						jQuery("#itemsContaiiner").html(data);
           					},
           					error:function(){
           						alert("Oops something went wrong!!");
           					}
           				});
           				
           			});
           		</script> -->
            </ul><!-- to be continued... paste the item -->
        </div>
        <br clear="all" />
        <div class="mainContent">  
        	<div>
				<!-- ========================================================================== -->
            	<div class="side">
                        <div id="categoroes" class="myPanel myPanel_category">
                            <div class="myPanel-heading">Categories</div>
                            <div class="myPanel-body">
                            	<c:forEach var="category" items="${categories}">
                            	 	<div class="category_list"><a class="category_click" href="#">${category.name }</a></div>
				            	</c:forEach>
                          		<script>
                          			jQuery(".category_click").click(function(){
                          				var queryItem=jQuery(this).html();
                          				//alert(queryItem);
                          				jQuery.ajax({
                          					url:"itemsContent.htm?category="+queryItem,
                          					success:function(data){
                          						//alert(data);
                          						jQuery("#itemsContaiiner").html(data);
                          					},
                          					error:function(){
                          						alert("Oops something went wrong!!");
                          					}
                          				});
                          				
                          			});
                          		</script>
                            </div>
                        </div>
                        
						<div id="manufacturers" class="myPanel">
                                <div class="myPanel-heading">Manufacturers</div>
                                <div class="myPanel-body">
                                	<c:forEach var="manufacturer" items="${manufacturers}">
	                            	 	<div class="category_list"><a class="manufacturer_click" href="#">${manufacturer.name }</a></div>
					            	</c:forEach>
                                    
                                    <script>
                          			jQuery(".manufacturer_click").click(function(){
                          				var queryItem=jQuery(this).html();
                          				//alert(queryItem);
                          				jQuery.ajax({
                          					url:"itemsContent.htm?manufacturer="+queryItem,
                          					success:function(data){
                          						//alert(data);
                          						jQuery("#itemsContaiiner").html(data);
                          					},
                          					error:function(){
                          						alert("Oops something went wrong!!");
                          					}
                          				});
                          				
                          			});
                          		</script>
                                    
                            </div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
						
                        <div id="information" class="myPanel">
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
                        
                         <!-- <div class="myPanel">
                                <div class="myPanel-heading">Tags</div>
                                <div class="myPanel-body">
                                    <p>apple ipod Ipod touch suffle superdrive nano</p>
                            </div>End of panel body
                        </div>End of myPanel -->
                </div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
         		
                <div class="middle">
                	<div class="banner"><img src="/WebKinmel/resources/image/banner1.jpg" width="580"/></div>
                    <div class="clear"></div>
                    <div id="itemsContaiiner">
                    	<script>
                    		jQuery.ajax({
                    			url:"itemsContent.htm",
                    			success:function(data){
                    				jQuery("#itemsContaiiner").html(data);
                    			}
                    		});
                    	</script>
                    </div>
                </div>
				<!-- ========================================================================== -->
				<!-- ========================================================================== -->
                <div class="side">
                		<div id="shoppingCart">
                		
                		</div>
                		<script>
                			jQuery.ajax({
                				url:"shoppingCart.htm",
                				success:function(data){
                					//alert(data);
                					if(data!="mustLogin")
                					jQuery("#shoppingCart").html(data);
                				},
                				error:function(){
                					alert("error loading shopping cart");
                				}
                			});
                		</script>
                       
						 <div id="newProducts" class="myPanel">
                                <div class="myPanel-heading">New Products</div>
                                <div class="myPanel-body">
                                	<c:forEach var="item" items="${newProducts}">
                                		<p class="pointer newItems" id="${item.id}"><b>${item.name}</b><br/>${item.description }</p>
                                	</c:forEach>
									
									<p><button id="allNewProducts" class="myButton full-button">All new products</button></p>
									<script>
										jQuery(".newItems").on('click',function(){
											var itemId=jQuery(this).attr('id');
											jQuery.ajax({
												url:"itemDescription.htm?itemId="+itemId,
												success:function(data){
													//jQuery(".middle").html(data);itemsContaiiner
													jQuery("#itemsContaiiner").html(data);
													//location.href="#itemsContaiiner";
													
													jQuery('html, body').animate({
												        scrollTop: $("#itemsContaiiner").offset().top
												    }, 1000);
													
													
												},
												error:function(){
													alert("oops something went wrong!!!");
												}
											});
										});
										
										jQuery("#allNewProducts").click(function(){
											jQuery.ajax({
	                          					url:"itemsContent.htm?newProducts=newProducts",
	                          					success:function(data){
	                          						//alert(data);
	                          						jQuery("#itemsContaiiner").html(data);
	                          					},
	                          					error:function(){
	                          						alert("Oops something went wrong!!");
	                          					}
	                          				});
										});
									</script>
								</div><!-- End of panel body-->
                        </div><!-- End of myPanel-->
                        
                         <div id="viewedProducts" class="myPanel">
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
						
						<!-- 
						<div class="myPanel">
                                <div class="myPanel-heading">Specials</div>
                                <div class="myPanel-body">
                                    <p><b>Test Product</b><br/>Lorem ipsum dolor sit amet, consectetur......>></p>
									
									<p class="centre"><button class="myButton full-button">All specials</button></p>
								</div>End of panel body
                        </div>End of myPanel
						 -->
						
						<div id="ourStores" class="myPanel">
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
</body>
</html>
