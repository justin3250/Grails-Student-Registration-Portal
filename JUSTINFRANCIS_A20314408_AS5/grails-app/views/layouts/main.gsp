<!DOCTYPE html>
<html>
<head>
<title><g:layoutTitle default="Blackboard" /></title>
<asset:stylesheet src="bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<g:layoutHead />
</head>
<body>


	<div class="bs-docs-header">
		<nav class="navbar navbar-inverse" role="navigation">

			<div class="navbar-inner">
				<div class="container1">
					<!--   <a class="navbar-brand" href="">Blackboard</a>-->
					<asset:image src="Blackboard_logo.png" class="brand" />

				
					<!--<g:form class="navbar-form navbar-right" role="form">
						<div class="form-group">
							<input type="text" placeholder="Search Courses here"
								class="form-control">
						</div>
						<button type="submit" class="btn btn-success">Search</button>
					</g:form>-->
					<!--<g:if test="${session.user}">
					<g:form class="navbar-form navbar-right" url='[controller: "searchable", action: "index1"]'
						id="searchableForm" name="searchableForm" method="get">
						<g:textField placeholder="Search Courses here" name="q" value="${params.q}" size="50" />
						<input type="submit" class="btn btn-success" value="SEARCH" />
					</g:form>
					</g:if>-->
					<g:render template="/course/searchForm"></g:render>
				</div>

				<div id="navbar" class="navbar-collapse collapse">


					<g:if test="${session.user}">
						<p class="navbar-left btn btn-success">
							Hii
							${session.user.username}
						</p>
						<a class="navbar-left btn btn-primary"
							href="${createLink(uri: '/user/index.gsp')}">Home Page</a>
						<g:form role="form" controller="user" action="doLogout">
							<button type="submit" class="btn btn-danger navbar-right">Logout</button>
						</g:form>

					</g:if>
					<g:else>
						<a class="navbar-left btn btn-primary"
							href="${createLink(uri: '/')}">Home Page</a>
					</g:else>
				</div>
				<!--/.navbar-collapse -->

			</div>

		</nav>
		<div class="bs-docs-header">
			<h2 class="page-header">Welcome to Backboard!!</h2>
		</div>
	</div>
	<!-- 
<div id="grailsLogo" role="banner">
		<asset:image src="Blackboard_logo.png"
				alt="Grails" />  
	</div>-->

	<g:layoutBody />


	<footer class="row top-buffer text-center col-md-12">
		<p>© Blackboard 2014</p>
	</footer>


</body>
</html>
