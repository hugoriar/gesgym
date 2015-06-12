
<%@ page import="org.control.LogAtributo" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logAtributo.label', default: 'LogAtributo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-logAtributo" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'logAtributo.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="nombreReal" title="${message(code: 'logAtributo.nombreReal.label', default: 'Nombre Real')}" />
			
				<g:sortableColumn property="esIndice" title="${message(code: 'logAtributo.esIndice.label', default: 'Es Indice')}" />
			
				<th><g:message code="logAtributo.entidad.label" default="Entidad" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${logAtributoInstanceList}" status="i" var="logAtributoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${logAtributoInstance.id}">${fieldValue(bean: logAtributoInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: logAtributoInstance, field: "nombreReal")}</td>
			
				<td><g:formatBoolean boolean="${logAtributoInstance.esIndice}" /></td>
			
				<td>${fieldValue(bean: logAtributoInstance, field: "entidad")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${logAtributoInstanceTotal}" />
	</div>
</section>

</body>

</html>
