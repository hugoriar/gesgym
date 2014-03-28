
<%@ page import="org.gym.ventas.Proveedor" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-proveedor" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.nombreEmpresa.label" default="Nombre Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proveedorInstance, field: "nombreEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.direccionEmpresa.label" default="Direccion Empresa" /></td>
				
				<td valign="top" class="value"><g:link controller="direccionEmpresa" action="show" id="${proveedorInstance?.direccionEmpresa?.id}">${proveedorInstance?.direccionEmpresa?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.fonoEmpresa.label" default="Fono Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proveedorInstance, field: "fonoEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proveedorInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.rut.label" default="Rut" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proveedorInstance, field: "rut")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.dv.label" default="Dv" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proveedorInstance, field: "dv")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.logo.label" default="Logo" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proveedorInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.contacto.label" default="Contacto" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${proveedorInstance?.contacto?.id}">${proveedorInstance?.contacto?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${proveedorInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${proveedorInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.productos.label" default="Productos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${proveedorInstance.productos}" var="p">
						<li><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.usuarios.label" default="Usuarios" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${proveedorInstance.usuarios}" var="u">
						<li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proveedor.variantesProductos.label" default="Variantes Productos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${proveedorInstance.variantesProductos}" var="v">
						<li><g:link controller="variante" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
