<%@ page import="org.control.EstadoMembresia" %>



			<div class="control-group fieldcontain ${hasErrors(bean: estadoMembresiaInstance, field: 'estado', 'error')} required">
				<label for="estado" class="control-label"><g:message code="estadoMembresia.estado.label" default="Estado" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="estado" required="" value="${estadoMembresiaInstance?.estado}"/>
					<span class="help-inline">${hasErrors(bean: estadoMembresiaInstance, field: 'estado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoMembresiaInstance, field: 'descripcion', 'error')} required">
				<label for="descripcion" class="control-label"><g:message code="estadoMembresia.descripcion.label" default="Descripcion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="descripcion" required="" value="${estadoMembresiaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: estadoMembresiaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoMembresiaInstance, field: 'color', 'error')} ">
				<label for="color" class="control-label"><g:message code="estadoMembresia.color.label" default="Color" /></label>
				<div class="controls">
					<g:textField name="color" value="${estadoMembresiaInstance?.color}"/>
					<span class="help-inline">${hasErrors(bean: estadoMembresiaInstance, field: 'color', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoMembresiaInstance, field: 'sonido', 'error')} required">
				<label for="sonido" class="control-label"><g:message code="estadoMembresia.sonido.label" default="Sonido" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input type="file" id="sonido" name="sonido" />
					<span class="help-inline">${hasErrors(bean: estadoMembresiaInstance, field: 'sonido', 'error')}</span>
				</div>
			</div>

