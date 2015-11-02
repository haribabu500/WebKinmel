<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="registrationContainer">
<div class="myPanel">
   <div class="myPanel-heading">Login</div>
   <div class="myPanel-body">
				<!-- <h3>Registration</h3> -->
				<div class="jumbotron registerBox">
					<form:form modelAttribute="user" id="loginForm" class="form-horizontal" role="form">
						  <div class="form-group">
						    <label for="username" class="col-sm-2 control-label">Username</label>
						    <div class="col-sm-10">
						      <form:input path="username" type="text" class="form-control" id="username" placeholder="Username" />
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="password" class="col-sm-2 control-label">Password</label>
						    <div class="col-sm-10">
						      <form:input path="password" type="password" class="form-control" id="password" placeholder="" />
						    </div>
						  </div>
					</form:form>
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button id="submit" class="myButton">Login</button>
					    </div>
					</div>
					<script type="text/javascript">
					  	jQuery("#submit").click(function(){
					  		jQuery.post("loginAction.htm",jQuery("#loginForm").serialize(),function(data){
					  			location.href="home.htm";
					  		});
					  	});
					</script>
				</div>
	</div><!-- End of panel body-->
	</div><!-- End of myPanel-->
	<div class="clear"></div>
</div>