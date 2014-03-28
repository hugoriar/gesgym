<%@ page import="org.gym.Modalidad" %>



			<div class="control-group fieldcontain ${hasErrors(bean: modalidadInstance, field: 'modalidad', 'error')} required">
				<label for="modalidad" class="control-label"><g:message code="modalidad.modalidad.label" default="Modalidad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="modalidad" required="" value="${modalidadInstance?.modalidad}"/>
					<span class="help-inline">${hasErrors(bean: modalidadInstance, field: 'modalidad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modalidadInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="modalidad.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${modalidadInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: modalidadInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

