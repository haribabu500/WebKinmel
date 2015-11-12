<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="myPanel">
   <div class="myPanel-heading">Items</div>
   <div class="myPanel-body">
	<!-- ************************************************************************ -->
	
<div id="addItemContainer">
	<h3>Add Items</h3><hr>
	<div class="col-sm-12">
	<form:form id="addItemForm" method="post" modelAttribute="item" class="form-inline" role="form" action="admin/addItemAction.htm" enctype="multipart/form-data">
		<form:hidden path="id"/>
		<div class="form-group">
			<label for="name">Name</label><br>
			<form:input path="name" class="form-control"/>
		</div>
		
		<div class="form-group">
		    <label for="category">category</label><br>
		    <form:select path="category" id="category" class="form-control">
				<c:forEach var="category" items="${categories}">
				  <c:choose>
				  	<c:when test="${item.category==category.name }">
				  		<option selected="selected" >${category.name }</option>
				  	</c:when>
				  	<c:otherwise>
				  		<option >${category.name}</option>
				  	</c:otherwise>
				  </c:choose>			 		
				</c:forEach>
				
				
			</form:select>
		  </div>
		  
		<div class="form-group">
		    <label for="manufacturer">Manufacturer</label><br>
		    <form:select path="manufacturer" id="manufacturer" class="form-control">
				
				<c:forEach var="manufacturer" items="${manufacturers}">
				  <c:choose>
				  	<c:when test="${item.manufacturer==manufacturer.name }">
				  		<option selected="selected" >${manufacturer.name }</option>
				  	</c:when>
				  	<c:otherwise>
				  		<option >${manufacturer.name}</option>
				  	</c:otherwise>
				  </c:choose>			 		
				</c:forEach>

			</form:select>
		  </div>
		
		<div class="form-group">
			<label for="price">Price</label><br>
			<form:input path="price" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="description">Description</label><br>
			<form:input path="description" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="file">Image</label><br>
			<input name="file" type="file" />
		</div>
		<div class="form-group">
		<br>
		<!-- <button class="myButton">Add/Update</button> -->
	</div>
		
	</form:form>
	<div class="form-group">
		<br>
		<button class="myButton" id="addItem">Add/Update</button>
	</div>
	</div>
</div>
<div class="clear"></div>
<div id="itemsTable">
	<h3>Available Items</h3>
	${itemsTable}
	
	<!-- ---------------------------- -->
		<c:if test="${recent != null}">
			<script type="text/javascript">
				jQuery('#${recent.id}').css('background','red');
				location.href="#${recent.id}";
				jQuery('#${recent.id}').css('background','transparent');
			</script>
		</c:if>
		<%request.getSession().removeAttribute("recent");%>
		
</div>

<script>
	jQuery("#addItem").click(function(){
		/* jQuery.post('admin/addItemAction.htm',jQuery("#addItemForm").serialize(),function(data){
			//alert(data);
			jQuery("#mainContent").html(data);
		}); */
		 var formData = new FormData(jQuery("#addItemForm")[0]);

		    $.ajax({
		        url: 'admin/addItemAction.htm',
		        type: 'POST',
		        data: formData,
		        async: false,
		        cache: false,
		        contentType: false,
		        processData: false,
		        success: function (data) {
		        alert("Successfully added!!!");
		        $("#mainContent").html(data);
		        },
		        error: function(){
		            alert("oops something went wrong!!!!!");
		            }
		    });
		
	});
	
	
	jQuery("table tr .update").click(function(){
		 jQuery.ajax({
			url:"admin/adminItem.htm?id="+jQuery(this).parent().attr("id"),
			success:function(data){
				//location.href="#mainContent";
				jQuery('html, body').animate({
			        scrollTop: $("#mainContent").offset().top
			    }, 1000);
				jQuery("#mainContent").html(data);
			}
		}); 
	});
	
	jQuery(".delete").click(function(){
		var id=jQuery(this).attr("id");
		jQuery.ajax({
			url:"admin/removeItem.htm?id="+id,
			success:function(data){
				//alert("deleted!!");
				jQuery("#mainContent").html(data);
				//location.href="administrationDashboard.htm";
			}
		});
	});
</script>
	<!-- ************************************************************************ -->
	</div><!-- End of panel body-->
</div><!-- End of myPanel-->
<div class="clear"></div>