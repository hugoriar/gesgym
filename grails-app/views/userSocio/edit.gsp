<%@ page import="org.control.UserSocio" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <g:javascript src="validarut.js" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'util.css')}" type="text/css">
    <webcam:head/>
    <resource:lightBox labelImage="Bild" labelOf="von" />
</head>

<body>

<section id="edit-userSocio" class="first">

	<g:hasErrors bean="${userSocioInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${userSocioInstance}" as="list" />
	</div>
	</g:hasErrors>

	%{--<g:form method="post" class="form-horizontal">--}%
	<g:form method="post" class="form-horizontal"  enctype="multipart/form-data">
		<g:hiddenField name="id" value="${userSocioInstance?.id}" />
		<g:hiddenField name="version" value="${userSocioInstance?.version}" />
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>

</section>
			
</body>

</html>
