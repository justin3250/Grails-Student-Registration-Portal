
<%@ page import="justinfrancis_a20314408_as5.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="Home Page" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.user}">
		<g:if test="${message}">
			
			
			<div class="alert alert-info text-center">
        		<button type="button" class="close" data-dismiss="alert">×</button>
        		<strong>${message}</strong>
    		</div>  

		</g:if>


		<div id="list-user" class="content scaffold-list text-center"
			role="main">


			<a class="btn btn-primary btn-lg"
				href="${createLink(uri: '/course/index.gsp')}">View all courses
				and register>></a>
			</li>
			<br />
			<br />
			<!--<a class="btn btn-primary btn-lg" href="${createLink(uri: '/user/index.gsp')}">Register for a course >></a></li><br/><br/>-->
			<a class="btn btn-primary btn-lg"
				href="${createLink(uri: '/enrolment/index.gsp')}">View my
				enrollments >></a>
			</li>
			<br />
			<br />

		</div>
	</g:if>
	<g:else>
		<div class="alert alert-danger text-center">
			<strong>Please login to view this page!!</strong> <br />
			<br />
			<g:link uri="/">
				<p>Click here to login</p>
			</g:link>
		</div>

	</g:else>

</body>
</html>
