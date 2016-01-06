<div class="myPanel">
   <div class="myPanel-heading">Users</div>
   <div class="myPanel-body">
   		<div id="manufacturersTable">
			<h3>List of users</h3>
			${usersTable}
		</div>
   </div>
</div>

<script>
jQuery(".delete").click(function(){
	var id=jQuery(this).attr("id");
	var n=confirm("Are you sure you want to remove user and its associated orders?");
	if(n==true){
		jQuery.ajax({
			url:"admin/removeUser.htm?id="+id,
			success:function(data){
				//alert("deleted!!");
				jQuery("#mainContent").html(data);
				//location.href="administrationDashboard.htm";
			}
		});
	}
});
</script>