<%@ page import="org.gym.ventas.DetalleProducto" %>



			<div class="control-group fieldcontain ${hasErrors(bean: detalleProductoInstance, field: 'cantidad', 'error')} required">
				<label for="cantidad" class="control-label"><g:message code="detalleProducto.cantidad.label" default="Cantidad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="cantidad" step="any" required="" value="${detalleProductoInstance.cantidad}"/>
					<span class="help-inline">${hasErrors(bean: detalleProductoInstance, field: 'cantidad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: detalleProductoInstance, field: 'precioUnitario', 'error')} required">
				<label for="precioUnitario" class="control-label"><g:message code="detalleProducto.precioUnitario.label" default="Precio Unitario" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="precioUnitario" step="any" required="" value="${detalleProductoInstance.precioUnitario}"/>
					<span class="help-inline">${hasErrors(bean: detalleProductoInstance, field: 'precioUnitario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: detalleProductoInstance, field: 'producto', 'error')} required">
				<label for="producto" class="control-label"><g:message code="detalleProducto.producto.label" default="Producto" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="producto" name="producto.id" from="${org.gym.ventas.Producto.list()}" optionKey="id" required="" value="${detalleProductoInstance?.producto?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: detalleProductoInstance, field: 'producto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: detalleProductoInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="detalleProducto.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${detalleProductoInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: detalleProductoInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: detalleProductoInstance, field: 'venta', 'error')} required">
				<label for="venta" class="control-label"><g:message code="detalleProducto.venta.label" default="Venta" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="venta" name="venta.id" from="${org.gym.ventas.Venta.list()}" optionKey="id" required="" value="${detalleProductoInstance?.venta?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: detalleProductoInstance, field: 'venta', 'error')}</span>
				</div>
			</div>

