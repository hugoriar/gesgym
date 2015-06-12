<%@ page import="org.control.Empresa" %>



			<div class="control-group fieldcontain ${hasErrors(bean: empresaInstance, field: 'nombreEmpresa', 'error')} ">
				<label for="nombreEmpresa" class="control-label"><g:message code="empresa.nombreEmpresa.label" default="Nombre Empresa" /></label>
				<div class="controls">
					<g:textField name="nombreEmpresa" value="${empresaInstance?.nombreEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: empresaInstance, field: 'nombreEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: empresaInstance, field: 'direccionEmpresa', 'error')} ">
				<label for="direccionEmpresa" class="control-label"><g:message code="empresa.direccionEmpresa.label" default="Direccion Empresa" /></label>
				<div class="controls">
					<g:select id="direccionEmpresa" name="direccionEmpresa.id" from="${org.control.DireccionEmpresa.list()}" optionKey="id" value="${empresaInstance?.direccionEmpresa?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: empresaInstance, field: 'direccionEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: empresaInstance, field: 'fonoEmpresa', 'error')} ">
				<label for="fonoEmpresa" class="control-label"><g:message code="empresa.fonoEmpresa.label" default="Fono Empresa" /></label>
				<div class="controls">
					<g:textField name="fonoEmpresa" value="${empresaInstance?.fonoEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: empresaInstance, field: 'fonoEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: empresaInstance, field: 'usuarios', 'error')} ">
				<label for="usuarios" class="control-label"><g:message code="empresa.usuarios.label" default="Usuarios" /></label>
				<div class="controls">
					<g:select name="usuarios" from="${org.control.User.list()}" multiple="multiple" optionKey="id" size="5" value="${empresaInstance?.usuarios*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: empresaInstance, field: 'usuarios', 'error')}</span>
				</div>
			</div>

