<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="registrationContainer">
<div class="myPanel">
   <div class="myPanel-heading">Registration</div>
   <div class="myPanel-body">
				<!-- <h3>Registration</h3> -->
				<div class="jumbotron registerBox">
					<form:form modelAttribute="user" id="registerForm" class="form-horizontal" role="form">
						<div class="form-group">
						    <label for="firstname" class="col-sm-2 control-label">First Name</label>
						    <div class="col-sm-10">
						      <form:input path="firstname" type="text" class="form-control" id="firstname" placeholder="First Name" required="required"/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="lastname" class="col-sm-2 control-label">Last Name</label>
						    <div class="col-sm-10">
						      <form:input path="lastname" type="text" class="form-control" id="lastname" placeholder="Last name" required="required"/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="email" class="col-sm-2 control-label">Email</label>
						    <div class="col-sm-10">
						      <form:input path="email" type="email" class="form-control" id="email" placeholder="Email" required="required"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="telephone" class="col-sm-2 control-label">Phone</label>
						    <div class="col-sm-10">
						      <form:input path="telephone" type="text" class="form-control" id="telephone" placeholder="Phone" required="required"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="street" class="col-sm-2 control-label">Street</label>
						    <div class="col-sm-10">
						      <form:input path="street" type="text" class="form-control" id="street" placeholder="street" required="required"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="area" class="col-sm-2 control-label">area</label>
						    <div class="col-sm-10">
						      <form:input path="area" type="text" class="form-control" id="area" placeholder="area" required="required"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="city" class="col-sm-2 control-label">city</label>
						    <div class="col-sm-10">
						      <form:input path="city" type="text" class="form-control" id="city" placeholder="city" required="required"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="country" class="col-sm-2 control-label">Country</label>
						    <div class="col-sm-10">
						      <form:select path="country" type="text" class="form-control" id="country" placeholder="city" required="required" value="nepal">
						      	<option value="nepal">Nepal</option>
						      </form:select>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="username" class="col-sm-2 control-label">Username</label>
						    <div class="col-sm-10">
						      <form:input path="username" type="text" class="form-control" id="username" placeholder="Username" required="required"/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="password" class="col-sm-2 control-label">Password</label>
						    <div class="col-sm-10">
						      <form:input path="password" type="password" class="form-control" name="password" id="password" placeholder="" required="required"/>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="rePassword" class="col-sm-2 control-label">Re-enter Password</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="" required="required">
						    </div>
						  </div>
						  <form:hidden path="role" value="user" />
						  <form:hidden path="id" />
						  
					</form:form>
					
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button id="submit" class="myButton">Register</button>
					    </div>
					</div>
					<script type="text/javascript">
					jQuery("#submit").click(function(){
						var valid=$("#registerForm").validate({
							rules: {
								username:{
									remote:"checkUsername.htm"
								},
								email:{
									remote:"checkEmail.htm"
								},
								telephone:{
									digits:true,
									maxlength:10,
									minlength:10
								},
							    password: "required",
							    rePassword: {
							      equalTo: password
							    }
							  },
							  messages:{
							    	username:{
							    		remote:"Useranme already exists"
							    	},
							    	email:{
							    		remote:"Email already exists"
							    	},
							    	rePassword:"passwords do not match"
							    }
							  
						}).form(); 
						if(valid==true){
							jQuery.post("registerAction.htm",jQuery("#registerForm").serialize(),function(data){
					  			location.href="home.htm";
					  		});
						}
					});
					</script>
				</div>
	</div><!-- End of panel body-->
	</div><!-- End of myPanel-->
	<div class="clear"></div>
</div>