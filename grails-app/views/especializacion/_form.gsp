<%@ page import="org.gym.Especializacion" %>



			<div class="control-group fieldcontain ${hasErrors(bean: especializacionInstance, field: 'nombreEspecializacion', 'error')} required">
				<label for="nombreEspecializacion" class="control-label"><g:message code="especializacion.nombreEspecializacion.label" default="Nombre Especializacion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombreEspecializacion" required="" value="${especializacionInstance?.nombreEspecializacion}"/>
					<span class="help-inline">${hasErrors(bean: especializacionInstance, field: 'nombreEspecializacion', 'error')}</span>
				</div>
			</div>

