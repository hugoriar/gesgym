
<%@ page import="org.control.Adjunto" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'adjunto.label', default: 'Adjunto')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-adjunto" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="adjunto.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adjuntoInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="adjunto.contentType.label" default="Content Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adjuntoInstance, field: "contentType")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="adjunto.peso.label" default="Peso" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: adjuntoInstance, field: "peso")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="adjunto.archivo.label" default="Archivo" /></td>
                <richui:lightBox href="${createLink(controller:'adjunto', action:'avatar_image', id:"${adjuntoInstance?.id}")}">
                    <img class="avatar" id="img1" style="" src="${createLink(controller:'adjunto', action:'avatar_image', id:"${adjuntoInstance?.id}")}"/>
                </richui:lightBox>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="adjunto.email.label" default="Email" /></td>
				
				<td valign="top" class="value"><g:link controller="email" action="show" id="${adjuntoInstance?.email?.id}">${adjuntoInstance?.email?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
