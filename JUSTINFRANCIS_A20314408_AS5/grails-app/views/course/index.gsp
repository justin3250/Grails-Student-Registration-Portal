
<%@ page import="justinfrancis_a20314408_as5.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.user}">
		<g:if test="${message}">
			<div class="alert alert-info text-center">
        		<button type="button" class="close" data-dismiss="alert">×</button>
        		<strong>${message}</strong>
    		</div>  

		</g:if>


		<div id="list-course" class="content scaffold-list" role="main">
			<div class="alert alert-success">
				<h4>
					<g:message code="default.list.label" args="[entityName]" />
				</h4>
			</div>

			<table class="table table-bordered">
				<thead>
					<tr>

						<g:sortableColumn property="title"
							title="${message(code: 'course.id.label', default: 'Course ID')}" />

						<g:sortableColumn property="title"
							title="${message(code: 'course.title.label', default: 'Title')}" />

						<g:sortableColumn property="description"
							title="${message(code: 'course.description.label', default: 'Description')}" />

						<g:sortableColumn property="creditHours"
							title="${message(code: 'course.creditHours.label', default: 'Credit Hours')}" />
						<td> </td>

					</tr>
				</thead>
				<tbody>
					<g:each in="${courseInstanceList}" status="i" var="courseInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<!-- <td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "title")}</g:link></td>
						 -->
							<g:form class="form-signin" role="form" controller="enrolment"
								action="doRegistration">
								<g:hiddenField name="courseId"
									value="${fieldValue(bean: courseInstance, field: "id")}" />
								<td>
									${fieldValue(bean: courseInstance, field: "id")}
								</td>
								<td>
									${fieldValue(bean: courseInstance, field: "title")}
								</td>
								<td>
									${fieldValue(bean: courseInstance, field: "description")}
								</td>

								<td>
									${fieldValue(bean: courseInstance, field: "creditHours")}
								</td>

								<td><button type="submit"
										class="btn btn-lg btn-primary btn-block">ENROLL</button></td>
							</g:form>

						</tr>
					</g:each>
				</tbody>
			</table>
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
