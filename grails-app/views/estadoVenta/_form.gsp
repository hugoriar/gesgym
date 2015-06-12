<%@ page import="org.control.ventas.EstadoVenta" %>



			<div class="control-group fieldcontain ${hasErrors(bean: estadoVentaInstance, field: 'codigo', 'error')} required">
				<label for="codigo" class="control-label"><g:message code="estadoVenta.codigo.label" default="Codigo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="codigo" maxlength="10" required="" value="${estadoVentaInstance?.codigo}"/>
					<span class="help-inline">${hasErrors(bean: estadoVentaInstance, field: 'codigo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoVentaInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="estadoVenta.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" maxlength="50" required="" value="${estadoVentaInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: estadoVentaInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoVentaInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="estadoVenta.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${estadoVentaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: estadoVentaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

