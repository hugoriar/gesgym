
<%@ page import="org.control.calendario.Event" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-event" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="end_date" title="${message(code: 'event.end_date.label', default: 'Enddate')}" />
			
				<g:sortableColumn property="start_date" title="${message(code: 'event.start_date.label', default: 'Startdate')}" />
			
				<g:sortableColumn property="text" title="${message(code: 'event.text.label', default: 'Text')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${eventInstanceList}" status="i" var="eventInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "end_date")}</g:link></td>
			
				<td><g:formatDate date="${eventInstance.start_date}" /></td>
			
				<td>${fieldValue(bean: eventInstance, field: "text")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${eventInstanceTotal}" />
	</div>
</section>

</body>

</html>
