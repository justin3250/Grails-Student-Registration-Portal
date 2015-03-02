
<%@ page import="justinfrancis_a20314408_as5.Enrolment"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'enrolment.label', default: 'Enrolment')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.user}">
		<div id="list-enrolment" class="content scaffold-list" role="main">
			<g:set var="counterEnroll" value="${0}" />
			<g:each in="${enrolmentInstanceList}" status="i"
				var="enrolmentInstance">
				<g:if
							test="${session.user.username.toString().equals(fieldValue(bean: enrolmentInstance, field: "user.username").toString())}">
				<g:set var="counterEnroll" value="${counterEnroll + 1}" />
				</g:if>
			</g:each>

		</div>

		<g:if test="${counterEnroll == 0}">
			<div class="alert alert-danger alert-dismissible text-center">
				<h3>You have not enrolled for any course!</h3>
			</div>
		</g:if>
		<g:else>
			<div class="alert alert-success alert-dismissible">
				<h4>
					<g:message code="default.list.label" args="[entityName]" />
				</h4>
			</div>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th><g:message code="enrolment.course.id.label"
								default="Course ID" /></th>
						<th><g:message code="enrolment.course.title.label"
								default="Title" /></th>
						<th><g:message code="enrolment.course.description.label"
								default="Description" /></th>
						<th><g:message code="enrolment.course.creditHours.label"
								default="Credit Hours" /></th>
						<!--<th><g:message code="enrolment.user.username.label" default="User" /></th>-->

					</tr>
				</thead>
				<tbody>
					<g:each in="${enrolmentInstanceList}" status="i"
						var="enrolmentInstance">

						<g:if
							test="${session.user.username.toString().equals(fieldValue(bean: enrolmentInstance, field: "user.username").toString())}">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


								<!--<td><g:link action="show" id="${enrolmentInstance.id}">${fieldValue(bean: enrolmentInstance, field: "course")}</g:link></td>
						 -->
								<td>
									${fieldValue(bean: enrolmentInstance, field: "course.id")}
								</td>
								<td>
									${fieldValue(bean: enrolmentInstance, field: "course.title")}
								</td>
								<td>
									${fieldValue(bean: enrolmentInstance, field: "course.description")}
								</td>
								<td>
									${fieldValue(bean: enrolmentInstance, field: "course.creditHours")}
								</td>
								<!--<td>${fieldValue(bean: enrolmentInstance, field: "user.username")}</td>-->

							</tr>
						</g:if>
						
					</g:each>
				</tbody>
			</table>
		</g:else>
		
	</g:if>
	<g:else>
		<div class="alert alert-danger text-center">
			<strong>You must be logged in to access this page!</strong> <br /> <br />
			<g:link uri="/">
				<p>Click here to login</p>
			</g:link>
		</div>

	</g:else>
</body>
</html>
