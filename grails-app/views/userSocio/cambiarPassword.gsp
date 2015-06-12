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
</head>

<body>

<section id="edit-userSocio" class="first">

	<g:hasErrors bean="${userSocioInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${userSocioInstance}" as="list" />
	</div>
	</g:hasErrors>

	%{--<g:form method="post" class="form-horizontal">--}%
	<g:form method="post" class="form-horizontal"  enctype="multipart/form-data" autocomplete='off'>
		<g:hiddenField name="id" value="${userSocioInstance?.id}" />
		<g:hiddenField name="version" value="${userSocioInstance?.version}" />
		<fieldset class="form">

            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'username', 'error')} required">
                <label for="username" class="control-label"><g:message code="user.username.label" default="Nombre de usuario" /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <g:if test="${userSocioInstance?.username}">
                        <g:textField name="username" value="${userSocioInstance?.username}" readonly="readonly"/>
                    </g:if>
                    <g:else>
                        <g:textField name="username"/>
                    </g:else>
                    <span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'username', 'error')}</span>
                </div>
            </div>

            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'password', 'error')} required">
                <label for="password" class="control-label"><g:message code="user.passwordViejo.label" default="Contraseña Actual" /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <g:field type="password" name="password" value=' ' autocomplete="off"/>
                    <span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'password', 'error')}</span>
                </div>
            </div>

            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'password_new', 'error')} required">
                <label for="password" class="control-label"><g:message code="user.passwordNuevo.label" default="Contraseña Nueva" /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <g:field type="password" name="password_new"/>
                    <span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'password_new', 'error')}</span>
                </div>
            </div>

            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'password_new_2', 'error')} required">
                <label for="password" class="control-label"><g:message code="user.passwordNuevoRepeat.label" default="Repita Contraseña Nueva" /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <g:field type="password" name="password_new_2"/>
                    <span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'password_new_2', 'error')}</span>
                </div>
            </div>

		</fieldset>
		<div class="form-actions">
			<g:actionSubmit class="btn btn-primary" action="updatePassword" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>

</section>
			
</body>

</html>
