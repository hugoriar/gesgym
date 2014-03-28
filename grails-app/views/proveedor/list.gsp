
<%@ page import="org.gym.ventas.Proveedor" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-proveedor" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreEmpresa" title="${message(code: 'proveedor.nombreEmpresa.label', default: 'Nombre Empresa')}" />
			
				<th><g:message code="proveedor.direccionEmpresa.label" default="Direccion Empresa" /></th>
			
				<g:sortableColumn property="fonoEmpresa" title="${message(code: 'proveedor.fonoEmpresa.label', default: 'Fono Empresa')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'proveedor.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="rut" title="${message(code: 'proveedor.rut.label', default: 'Rut')}" />
			
				<g:sortableColumn property="dv" title="${message(code: 'proveedor.dv.label', default: 'Dv')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${proveedorInstanceList}" status="i" var="proveedorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${proveedorInstance.id}">${fieldValue(bean: proveedorInstance, field: "nombreEmpresa")}</g:link></td>
			
				<td>${fieldValue(bean: proveedorInstance, field: "direccionEmpresa")}</td>
			
				<td>${fieldValue(bean: proveedorInstance, field: "fonoEmpresa")}</td>
			
				<td>${fieldValue(bean: proveedorInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: proveedorInstance, field: "rut")}</td>
			
				<td>${fieldValue(bean: proveedorInstance, field: "dv")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${proveedorInstanceTotal}" />
	</div>
</section>

</body>

</html>
