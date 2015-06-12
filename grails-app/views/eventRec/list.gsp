
<%@ page import="org.control.calendario.EventRec" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'eventRec.label', default: 'EventRec')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-eventRec" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="end_date" title="${message(code: 'eventRec.end_date.label', default: 'Enddate')}" />
			
				<g:sortableColumn property="event_length" title="${message(code: 'eventRec.event_length.label', default: 'Eventlength')}" />
			
				<g:sortableColumn property="event_pid" title="${message(code: 'eventRec.event_pid.label', default: 'Eventpid')}" />
			
				<g:sortableColumn property="rec_type" title="${message(code: 'eventRec.rec_type.label', default: 'Rectype')}" />
			
				<g:sortableColumn property="start_date" title="${message(code: 'eventRec.start_date.label', default: 'Startdate')}" />
			
				<g:sortableColumn property="text" title="${message(code: 'eventRec.text.label', default: 'Text')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${eventRecInstanceList}" status="i" var="eventRecInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${eventRecInstance.id}">${fieldValue(bean: eventRecInstance, field: "end_date")}</g:link></td>
			
				<td>${fieldValue(bean: eventRecInstance, field: "event_length")}</td>
			
				<td>${fieldValue(bean: eventRecInstance, field: "event_pid")}</td>
			
				<td>${fieldValue(bean: eventRecInstance, field: "rec_type")}</td>
			
				<td><g:formatDate date="${eventRecInstance.start_date}" /></td>
			
				<td>${fieldValue(bean: eventRecInstance, field: "text")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${eventRecInstanceTotal}" />
	</div>
</section>

</body>

</html>
