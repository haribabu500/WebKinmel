<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:forEach var="item" items="${items}" >
	<div id="${item.id}" class="tile item_description col-sm-3">
        <div class="tile-image"><img src="${item.imagePath }" height="100" /></div>
        <div class="tile-display">${item.name}</div>
        <div class="tile-price">Rs. ${item.price }</div>
	</div>
</c:forEach>

<script>
	jQuery(".item_description").click(function(){
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
</script>