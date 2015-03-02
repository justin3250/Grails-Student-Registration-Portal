<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Error 404 Page does not exist</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
		<meta name="layout" content="main"/>
	</head>
	<body>
	<div class="container col-md-4 col-md-offset-4 text-center">
	
			<div class="alert alert-danger text-center">
        		<button type="button" class="close" data-dismiss="alert">×</button>
        		<strong>Error 404!! Are you using the right link? If you want this page then make it yourself!  DO NOT TRY TO CHANGE MY URL !! THIS IS PROTECTED!! </strong>
    		</div>  
		</div>
	</body>
</html>
