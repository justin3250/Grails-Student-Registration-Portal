

<g:if test="${session.user}">
					<g:form class="navbar-form navbar-right" url='[controller: "searchable", action: "index1"]'
						id="searchableForm" name="searchableForm" method="get">
						<g:textField placeholder="Search Courses here" name="q" value="${params.q}" size="50" />
						<input type="submit" class="btn btn-success" value="SEARCH" />
					</g:form>
					</g:if>
					
	