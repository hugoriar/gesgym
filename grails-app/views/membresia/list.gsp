
<%@ page import="org.control.Plan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plan.label', default: 'Membresia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-membresia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-membresia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'plan.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="fechaInicioVigencia" title="${message(code: 'plan.fechaInicioVigencia.label', default: 'Fecha Inicio Vigencia')}" />
					
						<g:sortableColumn property="fechaTerminoVigencia" title="${message(code: 'plan.fechaTerminoVigencia.label', default: 'Fecha Termino Vigencia')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'plan.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'plan.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'plan.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${membresiaInstanceList}" status="i" var="membresiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${membresiaInstance.id}">${fieldValue(bean: membresiaInstance, field: "nombre")}</g:link></td>
					
						<td><g:formatDate date="${membresiaInstance.fechaInicioVigencia}" /></td>
					
						<td><g:formatDate date="${membresiaInstance.fechaTerminoVigencia}" /></td>
					
						<td>${fieldValue(bean: membresiaInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${membresiaInstance.lastUpdated}" /></td>
					
						<td><g:formatDate date="${membresiaInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${membresiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
