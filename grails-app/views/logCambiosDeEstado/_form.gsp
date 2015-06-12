<%@ page import="org.control.LogCambiosDeEstado" %>



			<div class="control-group fieldcontain ${hasErrors(bean: logCambiosDeEstadoInstance, field: 'fechaDeOperacion', 'error')} required">
				<label for="fechaDeOperacion" class="control-label"><g:message code="logCambiosDeEstado.fechaDeOperacion.label" default="Fecha De Operacion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaDeOperacion" precision="day"  value="${logCambiosDeEstadoInstance?.fechaDeOperacion}"  />
					<span class="help-inline">${hasErrors(bean: logCambiosDeEstadoInstance, field: 'fechaDeOperacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logCambiosDeEstadoInstance, field: 'modalidad', 'error')} required">
				<label for="modalidad" class="control-label"><g:message code="logCambiosDeEstado.modalidad.label" default="Modalidad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="modalidad" name="modalidad.id" from="${org.control.Modalidad.list()}" optionKey="id" required="" value="${logCambiosDeEstadoInstance?.modalidad?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logCambiosDeEstadoInstance, field: 'modalidad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logCambiosDeEstadoInstance, field: 'socio', 'error')} required">
				<label for="socio" class="control-label"><g:message code="logCambiosDeEstado.socio.label" default="Socio" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="socio" name="socio.id" from="${org.control.UserSocio.list()}" optionKey="id" required="" value="${logCambiosDeEstadoInstance?.socio?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logCambiosDeEstadoInstance, field: 'socio', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logCambiosDeEstadoInstance, field: 'estadoAntiguo', 'error')} required">
				<label for="estadoAntiguo" class="control-label"><g:message code="logCambiosDeEstado.estadoAntiguo.label" default="Estado Antiguo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="estadoAntiguo" name="estadoAntiguo.id" from="${org.control.EstadoMembresia.list()}" optionKey="id" required="" value="${logCambiosDeEstadoInstance?.estadoAntiguo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logCambiosDeEstadoInstance, field: 'estadoAntiguo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logCambiosDeEstadoInstance, field: 'estadoNuevo', 'error')} required">
				<label for="estadoNuevo" class="control-label"><g:message code="logCambiosDeEstado.estadoNuevo.label" default="Estado Nuevo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="estadoNuevo" name="estadoNuevo.id" from="${org.control.EstadoMembresia.list()}" optionKey="id" required="" value="${logCambiosDeEstadoInstance?.estadoNuevo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logCambiosDeEstadoInstance, field: 'estadoNuevo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logCambiosDeEstadoInstance, field: 'observaciones', 'error')} ">
				<label for="observacion" class="control-label"><g:message code="logCambiosDeEstado.observacion.label" default="Observacion" /></label>
				<div class="controls">
					<g:textField name="observacion" value="${logCambiosDeEstadoInstance?.observacion}"/>
					<span class="help-inline">${hasErrors(bean: logCambiosDeEstadoInstance, field: 'observaciones', 'error')}</span>
				</div>
			</div>

