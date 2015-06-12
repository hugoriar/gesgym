
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-email" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.de.label" default="De" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: emailInstance, field: "de")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.para.label" default="Para" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: emailInstance, field: "para")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.cc.label" default="Cc" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: emailInstance, field: "cc")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.bcc.label" default="Bcc" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: emailInstance, field: "bcc")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.asunto.label" default="Asunto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: emailInstance, field: "asunto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.mensaje.label" default="Mensaje" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: emailInstance, field: "mensaje")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="email.adjuntos.label" default="Adjuntos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${emailInstance.adjuntos}" var="a">
						<li><g:link controller="adjunto" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
