
<%@ page import="org.control.calendario.EventRec" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'eventRec.label', default: 'EventRec')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-eventRec" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventRec.end_date.label" default="Enddate" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${eventRecInstance?.end_date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventRec.event_length.label" default="Eventlength" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: eventRecInstance, field: "event_length")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventRec.event_pid.label" default="Eventpid" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: eventRecInstance, field: "event_pid")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventRec.rec_type.label" default="Rectype" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: eventRecInstance, field: "rec_type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventRec.start_date.label" default="Startdate" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${eventRecInstance?.start_date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventRec.text.label" default="Text" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: eventRecInstance, field: "text")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
