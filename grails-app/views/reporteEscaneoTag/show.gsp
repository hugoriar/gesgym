
<%@ page import="org.control.tag.ReporteEscaneoTag" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-reporteEscaneoTag" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.ROSpecID.label" default="ROS pec ID" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "ROSpecID")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.antennaID.label" default="Antenna ID" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "antennaID")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.channelIndex.label" default="Channel Index" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "channelIndex")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.epc.label" default="Epc" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "epc")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.firstSeenTimestampUTC.label" default="First Seen Timestamp UTC" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "firstSeenTimestampUTC")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.inventoryParameterSpecID.label" default="Inventory Parameter Spec ID" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "inventoryParameterSpecID")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.lastSeenTimestampUTC.label" default="Last Seen Timestamp UTC" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "lastSeenTimestampUTC")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.peakRSSI.label" default="Peak RSSI" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "peakRSSI")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="reporteEscaneoTag.tagSeenCount.label" default="Tag Seen Count" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: reporteEscaneoTagInstance, field: "tagSeenCount")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
