<%@ page import="org.gym.MedioPago" %>



			<div class="control-group fieldcontain ${hasErrors(bean: medioPagoInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="medioPago.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${medioPagoInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: medioPagoInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="medioPago.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textField name="descripcion" value="${medioPagoInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

