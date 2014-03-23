<%@ page import="org.gym.UserSocio" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <g:javascript src="validarut.js" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <webcam:head/>
</head>

<body>

<section id="create-userSocio" class="first">

	<g:hasErrors bean="${userSocioInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${userSocioInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal"  enctype="multipart/form-data">
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="createAndContinue" class="btn btn-primary" value="${message(code: 'default.button.createAndContinue.label', default: 'Crear y Continuar')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
