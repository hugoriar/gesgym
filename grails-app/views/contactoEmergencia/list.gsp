
<%@ page import="org.control.ContactoEmergencia" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-contactoEmergencia" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreContactoEmergencia" title="${message(code: 'contactoEmergencia.nombreContactoEmergencia.label', default: 'Nombre Contacto Emergencia')}" />
			
				<g:sortableColumn property="apellidoPaternoContactoEmergencia" title="${message(code: 'contactoEmergencia.apellidoPaternoContactoEmergencia.label', default: 'Apellido Paterno Contacto Emergencia')}" />
			
				<g:sortableColumn property="apellidoMaternoContactoEmergencia" title="${message(code: 'contactoEmergencia.apellidoMaternoContactoEmergencia.label', default: 'Apellido Materno Contacto Emergencia')}" />
			
				<g:sortableColumn property="fonoCasaContactoEmergencia" title="${message(code: 'contactoEmergencia.fonoCasaContactoEmergencia.label', default: 'Fono Casa Contacto Emergencia')}" />
			
				<g:sortableColumn property="fonoCelularContactoEmergencia" title="${message(code: 'contactoEmergencia.fonoCelularContactoEmergencia.label', default: 'Fono Celular Contacto Emergencia')}" />
			
				<g:sortableColumn property="fonoTrabajoContactoEmergencia" title="${message(code: 'contactoEmergencia.fonoTrabajoContactoEmergencia.label', default: 'Fono Trabajo Contacto Emergencia')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${contactoEmergenciaInstanceList}" status="i" var="contactoEmergenciaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${contactoEmergenciaInstance.id}">${fieldValue(bean: contactoEmergenciaInstance, field: "nombreContactoEmergencia")}</g:link></td>
			
				<td>${fieldValue(bean: contactoEmergenciaInstance, field: "apellidoPaternoContactoEmergencia")}</td>
			
				<td>${fieldValue(bean: contactoEmergenciaInstance, field: "apellidoMaternoContactoEmergencia")}</td>
			
				<td>${fieldValue(bean: contactoEmergenciaInstance, field: "fonoCasaContactoEmergencia")}</td>
			
				<td>${fieldValue(bean: contactoEmergenciaInstance, field: "fonoCelularContactoEmergencia")}</td>
			
				<td>${fieldValue(bean: contactoEmergenciaInstance, field: "fonoTrabajoContactoEmergencia")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${contactoEmergenciaInstanceTotal}" />
	</div>
</section>

</body>

</html>
