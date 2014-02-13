
<%@ page import="org.gym.fichaMedica.FichaMedica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fichaMedica.label', default: 'FichaMedica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fichaMedica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fichaMedica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fichaMedica">
			
				<g:if test="${fichaMedicaInstance?.condicionesMedicas}">
				<li class="fieldcontain">
					<span id="condicionesMedicas-label" class="property-label"><g:message code="fichaMedica.condicionesMedicas.label" default="Condiciones Medicas" /></span>
					
						<g:each in="${fichaMedicaInstance.condicionesMedicas}" var="c">
						<span class="property-value" aria-labelledby="condicionesMedicas-label"><g:link controller="condicionMedica" action="show" id="${c.id}">${c}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${fichaMedicaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="fichaMedica.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="user" action="show" id="${fichaMedicaInstance?.usuario?.id}">${fichaMedicaInstance?.usuario}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${fichaMedicaInstance?.id}" />
					<g:link class="edit" action="edit" id="${fichaMedicaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
