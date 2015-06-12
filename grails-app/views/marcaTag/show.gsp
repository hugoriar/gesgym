
<%@ page import="org.control.tag.MarcaTag" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'marcaTag.label', default: 'MarcaTag')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-marcaTag" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="marcaTag.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: marcaTagInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="marcaTag.modelosTags.label" default="Modelos Tags" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${marcaTagInstance.modelosTags}" var="m">
						<li><g:link controller="modeloTag" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
