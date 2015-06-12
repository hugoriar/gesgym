<%@ page import="org.control.DireccionUsuario" %>



			<div class="control-group fieldcontain ${hasErrors(bean: direccionUsuarioInstance, field: 'calleUsuario', 'error')} required">
				<label for="calleUsuario" class="control-label"><g:message code="direccionUsuario.calleUsuario.label" default="Calle" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="calleUsuario" required="" value="${direccionUsuarioInstance?.calleUsuario}"/>
					<span class="help-inline">${hasErrors(bean: direccionUsuarioInstance, field: 'calleUsuario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionUsuarioInstance, field: 'numeroUsuario', 'error')} required">
				<label for="numeroUsuario" class="control-label"><g:message code="direccionUsuario.numeroUsuario.label" default="Número" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="numeroUsuario" required="" value="${direccionUsuarioInstance?.numeroUsuario}"/>
					<span class="help-inline">${hasErrors(bean: direccionUsuarioInstance, field: 'numeroUsuario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionUsuarioInstance, field: 'departamentoUsuario', 'error')} ">
				<label for="departamentoUsuario" class="control-label"><g:message code="direccionUsuario.departamentoUsuario.label" default="Departamento" /></label>
				<div class="controls">
					<g:textField name="departamentoUsuario" value="${direccionUsuarioInstance?.departamentoUsuario}"/>
					<span class="help-inline">${hasErrors(bean: direccionUsuarioInstance, field: 'departamentoUsuario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionUsuarioInstance, field: 'sectorUsuario', 'error')} ">
				<label for="sectorUsuario" class="control-label"><g:message code="direccionUsuario.sectorUsuario.label" default="Sector" /></label>
				<div class="controls">
					<g:select id="sectorUsuario" name="sectorUsuario.id" from="${org.control.ubicacion.Sector.list()}" optionKey="id" value="${direccionUsuarioInstance?.sectorUsuario?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: direccionUsuarioInstance, field: 'sectorUsuario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionUsuarioInstance, field: 'ciudadUsuario', 'error')} required">
				<label for="ciudadUsuario" class="control-label"><g:message code="direccionUsuario.ciudadUsuario.label" default="Ciudad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="ciudadUsuario" name="ciudadUsuario.id" from="${org.control.ubicacion.Ciudad.list()}" optionKey="id" required="" value="${direccionUsuarioInstance?.ciudadUsuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: direccionUsuarioInstance, field: 'ciudadUsuario', 'error')}</span>
				</div>
			</div>
%{--

			<div class="control-group fieldcontain ${hasErrors(bean: direccionUsuarioInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="direccionUsuario.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.control.User.list()}" optionKey="id" required="" value="${direccionUsuarioInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: direccionUsuarioInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

--}%
