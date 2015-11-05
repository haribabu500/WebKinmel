<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="registrationContainer">
<div class="myPanel">
   <div class="myPanel-heading">Login</div>
   <div class="myPanel-body">
				<!-- <h3>Registration</h3> -->
				<div class="jumbotron registerBox">
					<div id="login-error" class="alert alert-danger hidden" role="alert">Invalid username or password</div>
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
						      <form:input path="password" type="password" class="form-control" id="password" placeholder="Password" />
						    </div>
						  </div>
					</form:form>
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button id="submit" class="myButton">Login</button>
					    </div>
					</div>
					<script type="text/javascript">
					function checkLogin(){
						var formData = new FormData(jQuery("#loginForm")[0]);
            		    $.ajax({
            		        url: 'loginAction.htm',
            		        type: 'POST',
            		        data: formData,
            		        async: false,
            		        cache: false,
            		        contentType: false,
            		        processData: false,
            		        success: function (data) {
            		        	if(data=="invalid"){
            		        		//alert('invalid username or password!!!');
            		        		jQuery("#login-error").removeClass("hidden");
            		        	}
            		        	else{
            		        		/* location.href="home.htm"; */
            		        		jQuery.ajax({
            		    				url:"topbarContent.htm",
            		    				success:function(data){
            		    					jQuery("#topbar").html(data);
            		    				},
            		    				error:function(){
            		    					alert("oops!! something went wrong");
            		    				}
            		    			});
            		        		jQuery('#myModal').modal('hide');
            		        		$('#myModal').hide();
            		        		$('.modal-backdrop').hide();
            		        	}
            		        },
            		        error: function(){
            		            alert("Oops something went wrong!!!");
            		            }
            		    });
					}
					  	jQuery("#submit").click(function(){
					  		checkLogin();
					  	});
					
					jQuery("input").on("keyup",function(e){
                		var code=e.which;
                		if(code==13){
                			checkLogin();
                		}
					});
					</script>
				</div>
	</div><!-- End of panel body-->
	</div><!-- End of myPanel-->
	<div class="clear"></div>
</div>