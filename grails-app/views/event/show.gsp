
<%@ page import="org.control.calendario.Event" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-event" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="event.end_date.label" default="Enddate" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${eventInstance?.end_date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="event.start_date.label" default="Startdate" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${eventInstance?.start_date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="event.text.label" default="Text" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: eventInstance, field: "text")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
