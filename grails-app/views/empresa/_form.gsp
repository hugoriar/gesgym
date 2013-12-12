<%@ page import="org.gym.Empresa" %>



			<div class="control-group fieldcontain ${hasErrors(bean: empresaInstance, field: 'nombreEmpresa', 'error')} ">
				<label for="nombreEmpresa" class="control-label"><g:message code="empresa.nombreEmpresa.label" default="Nombre Empresa" /></label>
				<div class="controls">
					<g:textField name="nombreEmpresa" value="${empresaInstance?.nombreEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: empresaInstance, field: 'nombreEmpresa', 'error')}</span>
				</div>
			</div>


%{--<fieldset class="form">
    <g:render template="/direccionEmpresa/formDireccionEmpresa"/>
</fieldset>--}%

<fieldset class="form">
    <g:render template="/direccionEmpresa/form"/>
</fieldset>

			<div class="control-group fieldcontain ${hasErrors(bean: empresaInstance, field: 'fonoEmpresa', 'error')} ">
				<label for="fonoEmpresa" class="control-label"><g:message code="empresa.fonoEmpresa.label" default="Fono Empresa" /></label>
				<div class="controls">
					<g:textField name="fonoEmpresa" value="${empresaInstance?.fonoEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: empresaInstance, field: 'fonoEmpresa', 'error')}</span>
				</div>
			</div>

