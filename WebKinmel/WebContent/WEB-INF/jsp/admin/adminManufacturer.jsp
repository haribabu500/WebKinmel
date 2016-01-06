<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="myPanel">
   <div class="myPanel-heading">Manufacturers</div>
   <div class="myPanel-body">
   	<div id="addManufacturerContainer">
   		<form:form id="addManufacturerForm" method="post" modelAttribute="manufacturer" class="form-inline" role="form" action="addManufacturerAction.htm" enctype="multipart/form-data">
			<form:hidden path="id"/>
			<div class="form-group">
				<label for="name">Name</label><br>
				<form:input path="name" class="form-control" required="required"/>
			</div>
		</form:form>
		<div class="form-group">
		<br>
		<button class="myButton" id="addManufacturer">Add/Update</button>
			</div>
		</div>
	</div>	
	<div class="clear"></div>
	<div id="manufacturersTable">
		<h3>Available manufacturers</h3>
		${manufacturersTable}
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
  </div>
  

<script>
	function submitData(){
		var valid=$("#addManufacturerForm").validate().form(); 
		if(valid==true){
			jQuery.post('admin/addManufacturerAction.htm',jQuery("#addManufacturerForm").serialize(),function(data){
				jQuery("#mainContent").html(data);
			});
		}
	}
	jQuery("#addManufacturer").click(function(){
		submitData();
	});
	
	jQuery("#addManufacturerForm input").keydown(function(e){
		var code=e.which;
		if(code==13){
			submitData();
		}
	});
	
	
	jQuery("table tr .update").click(function(){
		 jQuery.ajax({
			url:"admin/adminManufacturer.htm?id="+jQuery(this).parent().attr("id")+"&search="+jQuery("#searchInput").val(),
			success:function(data){
				jQuery("#mainContent").html(data);
			},
			error:function(){
				 alert("Oops something went wrong");
			 }
		}); 
	});
	
	jQuery(".delete").click(function(){
		var id=jQuery(this).attr("id");
		var n=confirm("Are you sure you want to remove?");
		if(n==true){
			jQuery.ajax({
				url:"admin/removeManufacturer.htm?id="+id,
				success:function(data){
					alert("Sccesssfuly deleted!!");
					jQuery("#mainContent").html(data);
					//location.href="administrationDashboard.htm";
				},
				error:function(){
					 alert("Oops something went wrong");
				 }
			});
		}
	});
</script>