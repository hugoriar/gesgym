<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-email" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="de" title="${message(code: 'email.de.label', default: 'De')}" />
			
				<g:sortableColumn property="para" title="${message(code: 'email.para.label', default: 'Para')}" />
			
				<g:sortableColumn property="cc" title="${message(code: 'email.cc.label', default: 'Cc')}" />
			
				<g:sortableColumn property="bcc" title="${message(code: 'email.bcc.label', default: 'Bcc')}" />
			
				<g:sortableColumn property="asunto" title="${message(code: 'email.asunto.label', default: 'Asunto')}" />
			
				<g:sortableColumn property="mensaje" title="${message(code: 'email.mensaje.label', default: 'Mensaje')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${emailInstanceList}" status="i" var="emailInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${emailInstance.id}">${fieldValue(bean: emailInstance, field: "de")}</g:link></td>
			
				<td>${fieldValue(bean: emailInstance, field: "para")}</td>
			
				<td>${fieldValue(bean: emailInstance, field: "cc")}</td>
			
				<td>${fieldValue(bean: emailInstance, field: "bcc")}</td>
			
				<td>${fieldValue(bean: emailInstance, field: "asunto")}</td>
			
				<td>${fieldValue(bean: emailInstance, field: "mensaje")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${emailInstanceCount}" />
	</div>
</section>

</body>

</html>
