
<%@ page import="org.control.tag.ModeloTag" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'modeloTag.label', default: 'ModeloTag')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-modeloTag" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.codigoModeloTag.label" default="Codigo Modelo Tag" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: modeloTagInstance, field: "codigoModeloTag")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: modeloTagInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.marca.label" default="Marca" /></td>
				
				<td valign="top" class="value"><g:link controller="marcaTag" action="show" id="${modeloTagInstance?.marca?.id}">${modeloTagInstance?.marca?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.bitsMemoriaEpc.label" default="Bits Memoria Epc" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: modeloTagInstance, field: "bitsMemoriaEpc")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.bitsMemoriaUsuario.label" default="Bits Memoria Usuario" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: modeloTagInstance, field: "bitsMemoriaUsuario")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.foto.label" default="Foto" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: modeloTagInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modeloTag.tags.label" default="Tags" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${modeloTagInstance.tags}" var="t">
						<li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
