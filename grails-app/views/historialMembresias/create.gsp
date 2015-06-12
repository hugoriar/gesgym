<%@ page import="org.control.HistorialMembresias" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'historialMembresias.label', default: 'HistorialMembresias')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'util.css')}" type="text/css">
    <webcam:head/>
    <resource:lightBox labelImage="Bild" labelOf="von" />
</head>

<body>

<section id="create-historialMembresias" class="first">

	<g:hasErrors bean="${historialMembresiasInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${historialMembresiasInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" enctype="multipart/form-data">
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
