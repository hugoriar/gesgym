<%@ page import="org.control.LogTipoOperacion" %>



			<div class="control-group fieldcontain ${hasErrors(bean: logTipoOperacionInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="logTipoOperacion.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${logTipoOperacionInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: logTipoOperacionInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logTipoOperacionInstance, field: 'color', 'error')} ">
				<label for="color" class="control-label"><g:message code="logTipoOperacion.color.label" default="Color" /></label>
				<div class="controls">
					<g:textField name="color" value="${logTipoOperacionInstance?.color}"/>
					<span class="help-inline">${hasErrors(bean: logTipoOperacionInstance, field: 'color', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logTipoOperacionInstance, field: 'observaciones', 'error')} ">
				<label for="observaciones" class="control-label"><g:message code="logTipoOperacion.observaciones.label" default="Observaciones" /></label>
				<div class="controls">
					<g:textField name="observaciones" value="${logTipoOperacionInstance?.observaciones}"/>
					<span class="help-inline">${hasErrors(bean: logTipoOperacionInstance, field: 'observaciones', 'error')}</span>
				</div>
			</div>

