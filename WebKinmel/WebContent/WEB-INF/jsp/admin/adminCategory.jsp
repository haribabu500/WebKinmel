<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="myPanel">
   <div class="myPanel-heading">Categories</div>
   <div class="myPanel-body">
   	<div id="addCategoryContainer">
   		<form:form id="addCategoryForm" method="post" modelAttribute="category" class="form-inline" role="form" action="addCategoryAction.htm" enctype="multipart/form-data">
			<form:hidden path="id"/>
			<div class="form-group">
				<label for="name">Name</label><br>
				<form:input path="name" class="form-control" required="required"/>
			</div>
		</form:form>
		<div class="form-group">
		<br>
		<button class="myButton" id="addCategory">Add/Update</button>
			</div>
		</div>
	</div>	
	<div class="clear"></div>
	<div id="categoriesTable">
		<h3>Available Categories</h3>
		${categoriesTable}
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
		var valid=$("#addCategoryForm").validate().form(); 
		if(valid==true){
			jQuery.post('admin/addCategoryAction.htm',jQuery("#addCategoryForm").serialize(),function(data){
				alert("Successfully added!!!");
				jQuery("#mainContent").html(data);
			});
		}
	}
	jQuery("#addCategory").click(function(){
		submitData();
	});
	
	jQuery("#addCategoryForm input").keydown(function(e){
		var code=e.which;
		if(code==13){
			submitData();
		}
	});
	
	
	jQuery("table tr .update").click(function(){
		 jQuery.ajax({
			url:"admin/adminCategory.htm?id="+jQuery(this).parent().attr("id")+"&search="+jQuery("#searchInput").val(),
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
				url:"admin/removeCategory.htm?id="+id,
				success:function(data){
					alert("successfully deleted!!");
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