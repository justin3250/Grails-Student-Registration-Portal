<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Blackboard</title>
		
	</head>
	<body>
		
		<g:if test="${session.user}">
			<div class="alert alert-info text-center">
        		<button type="button" class="close" data-dismiss="alert">×</button>
        		<strong>You are already logged in! Click on the Home page link! </strong>
    		</div>  
		</g:if>
		<g:else>
		<div class="container col-md-4 col-md-offset-4 text-center">
		
		
		<g:if test="${message}">
		<div class="alert alert-info text-center">
        		<button type="button" class="close" data-dismiss="alert">×</button>
        		<strong>${message}</strong>
    		</div>  
      		
      	</g:if>
      <!--<g:form class="form-signin" role="form" controller="course" action="doLogin">-->
      <!--<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>-->
      <g:form class="form-signin" role="form" method="post" controller="user">
        <h2 class="form-signin-heading">Please sign in or register</h2>
        <label for="username" class="sr-only">Username</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Username" required="required">
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required="required">
       	<br/>
        <g:actionSubmit  class="btn btn-lg btn-primary btn-block" controller="course" action="doLogin" value="LOGIN"/>
      	<br/><br/>  
        <g:actionSubmit  class="btn btn-lg btn btn-success btn-block" controller="user" action="userRegister" value="REGISTER"/>
      </g:form>
      <br/><br/>
      <!-- g:form class="form-signin" role="form" controller="user" action="userRegister">
      		<button class="btn btn-lg btn btn-success btn-block" type="submit">Register</button>
      </g:form>
       -->

    </div>
		
		</g:else>
	</body>
</html>
