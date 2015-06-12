
<%@ page import="org.control.tag.Tag" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-tag" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.modelo.label" default="Modelo" /></td>
				
				<td valign="top" class="value"><g:link controller="modeloTag" action="show" id="${tagInstance?.modelo?.id}">${tagInstance?.modelo?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.epc.label" default="Epc" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tagInstance, field: "epc")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.codigoTag.label" default="Codigo Tag" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tagInstance, field: "codigoTag")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.memoriaUsuario.label" default="Memoria Usuario" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tagInstance, field: "memoriaUsuario")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.estado.label" default="Estado" /></td>
				
				<td valign="top" class="value"><g:link controller="estadoTag" action="show" id="${tagInstance?.estado?.id}">${tagInstance?.estado?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tagInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${tagInstance?.usuario?.id}">${tagInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${tagInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="tag.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${tagInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
