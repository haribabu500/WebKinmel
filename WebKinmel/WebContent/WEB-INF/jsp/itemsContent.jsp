<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:forEach var="item" items="${items}" >
	<div class="tile col-sm-3">
        <div class="tile-image"><img src="${item.imagePath }" height="100" /></div>
        <div class="tile-display">${item.name}</div>
        <div class="tile-price">Rs. ${item.price }</div>
	</div>	
</c:forEach>

<!--  <div class="tile-row">
                    	**************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/ipad.jpg" height="100" /></div>
                            <div class="tile-display">Apple iPad</div>
                            <div class="tile-price">$240.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/ipod.jpg" height="100" /></div>
                            <div class="tile-display">Apple iPod</div>
                            <div class="tile-price">$650.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/laptop.jpg" height="100" /></div>
                            <div class="tile-display">Laptop</div>
                            <div class="tile-price">$240.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/apple_tv.jpg" height="100" /></div>
                            <div class="tile-display">Apple TV</div>
                            <div class="tile-price">$653.00</div>
						</div>	
                        **************************************************************************
                         <div class="clear"></div>
                    </div>
                    
                    <div class="tile-row">
                    	**************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/printer.jpg" height="100" /></div>
                            <div class="tile-display">Apple iPad</div>
                            <div class="tile-price">$240.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/camera.jpg" height="100" /></div>
                            <div class="tile-display">Apple iPod</div>
                            <div class="tile-price">$650.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/blackberry.jpg" height="100" /></div>
                            <div class="tile-display">Laptop</div>
                            <div class="tile-price">$240.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/toshiba_tv.jpg" height="100" /></div>
                            <div class="tile-display">Apple TV</div>
                            <div class="tile-price">$653.00</div>
						</div>	
                        **************************************************************************
                         <div class="clear"></div>
                    </div>
					
                    <div class="tile-row">
                    	**************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/ipod2.jpg" height="100" /></div>
                            <div class="tile-display">Apple iPad</div>
                            <div class="tile-price">$240.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/ipod3.jpg" height="100" /></div>
                            <div class="tile-display">Apple iPod</div>
                            <div class="tile-price">$650.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/apple_computer.jpg" height="100" /></div>
                            <div class="tile-display">Laptop</div>
                            <div class="tile-price">$240.00</div>
						</div>	
                        **************************************************************************
                        **************************************************************************
                    	<div class="tile col-sm-3">
                            <div class="tile-image"><img src="/WebKinmel/resources/image/items/iphone.jpg" height="100" /></div>
                            <div class="tile-display">Apple TV</div>
                            <div class="tile-price">$653.00</div>
						</div>	
                        **************************************************************************
                         <div class="clear"></div>
                    </div> -->