
<%@ page import="org.control.tag.ReporteEscaneoTag" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'reporteEscaneoTag.label', default: 'ReporteEscaneoTag')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-reporteEscaneoTag" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="ROSpecID" title="${message(code: 'reporteEscaneoTag.ROSpecID.label', default: 'ROS pec ID')}" />
			
				<g:sortableColumn property="antennaID" title="${message(code: 'reporteEscaneoTag.antennaID.label', default: 'Antenna ID')}" />
			
				<g:sortableColumn property="channelIndex" title="${message(code: 'reporteEscaneoTag.channelIndex.label', default: 'Channel Index')}" />
			
				<g:sortableColumn property="epc" title="${message(code: 'reporteEscaneoTag.epc.label', default: 'Epc')}" />
			
				<g:sortableColumn property="firstSeenTimestampUTC" title="${message(code: 'reporteEscaneoTag.firstSeenTimestampUTC.label', default: 'First Seen Timestamp UTC')}" />
			
				<g:sortableColumn property="inventoryParameterSpecID" title="${message(code: 'reporteEscaneoTag.inventoryParameterSpecID.label', default: 'Inventory Parameter Spec ID')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${reporteEscaneoTagInstanceList}" status="i" var="reporteEscaneoTagInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${reporteEscaneoTagInstance.id}">${fieldValue(bean: reporteEscaneoTagInstance, field: "ROSpecID")}</g:link></td>
			
				<td>${fieldValue(bean: reporteEscaneoTagInstance, field: "antennaID")}</td>
			
				<td>${fieldValue(bean: reporteEscaneoTagInstance, field: "channelIndex")}</td>
			
				<td>${fieldValue(bean: reporteEscaneoTagInstance, field: "epc")}</td>
			
				<td>${fieldValue(bean: reporteEscaneoTagInstance, field: "firstSeenTimestampUTC")}</td>
			
				<td>${fieldValue(bean: reporteEscaneoTagInstance, field: "inventoryParameterSpecID")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${reporteEscaneoTagInstanceTotal}" />
	</div>
</section>

</body>

</html>
