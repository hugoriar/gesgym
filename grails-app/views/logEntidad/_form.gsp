<%@ page import="org.control.LogEntidad" %>



			<div class="control-group fieldcontain ${hasErrors(bean: logEntidadInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="logEntidad.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${logEntidadInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: logEntidadInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logEntidadInstance, field: 'nombreTabla', 'error')} required">
				<label for="nombreTabla" class="control-label"><g:message code="logEntidad.nombreTabla.label" default="Nombre Tabla" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombreTabla" required="" value="${logEntidadInstance?.nombreTabla}"/>
					<span class="help-inline">${hasErrors(bean: logEntidadInstance, field: 'nombreTabla', 'error')}</span>
				</div>
			</div>

