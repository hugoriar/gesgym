<%@ page import="org.control.ventas.FotoProducto" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fotoProducto.label', default: 'FotoProducto')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

<section id="edit-fotoProducto" class="first">

	<g:hasErrors bean="${fotoProductoInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${fotoProductoInstance}" as="list" />
	</div>
	</g:hasErrors>

	<g:form method="post" class="form-horizontal"  enctype="multipart/form-data">
		<g:hiddenField name="id" value="${fotoProductoInstance?.id}" />
		<g:hiddenField name="version" value="${fotoProductoInstance?.version}" />
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
