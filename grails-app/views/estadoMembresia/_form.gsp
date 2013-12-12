<%@ page import="org.gym.EstadoMembresia" %>



			<div class="control-group fieldcontain ${hasErrors(bean: estadoMembresiaInstance, field: 'estado', 'error')} required">
				<label for="estado" class="control-label"><g:message code="estadoMembresia.estado.label" default="Estado" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="estado" required="" value="${estadoMembresiaInstance?.estado}"/>
					<span class="help-inline">${hasErrors(bean: estadoMembresiaInstance, field: 'estado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoMembresiaInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="estadoMembresia.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textField name="descripcion" value="${estadoMembresiaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: estadoMembresiaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

