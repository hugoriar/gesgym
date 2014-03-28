<%@ page import="org.gym.ventas.Detalle" %>



			<div class="control-group fieldcontain ${hasErrors(bean: detalleInstance, field: 'cantidadProducto', 'error')} required">
				<label for="cantidadProducto" class="control-label"><g:message code="detalle.cantidadProducto.label" default="Cantidad Producto" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="cantidadProducto" min="1" max="999" required="" value="${detalleInstance.cantidadProducto}"/>
					<span class="help-inline">${hasErrors(bean: detalleInstance, field: 'cantidadProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: detalleInstance, field: 'productos', 'error')} ">
				<label for="productos" class="control-label"><g:message code="detalle.productos.label" default="Productos" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: detalleInstance, field: 'productos', 'error')}</span>
				</div>
			</div>

