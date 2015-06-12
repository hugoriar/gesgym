<%@ page import="org.control.ventas.FotoProducto" %>



			<div class="control-group fieldcontain ${hasErrors(bean: fotoProductoInstance, field: 'nombreFotoProducto', 'error')} required">
				<label for="nombreFotoProducto" class="control-label"><g:message code="fotoProducto.nombreFotoProducto.label" default="Nombre Foto Producto" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombreFotoProducto" required="" value="${fotoProductoInstance?.nombreFotoProducto}"/>
					<span class="help-inline">${hasErrors(bean: fotoProductoInstance, field: 'nombreFotoProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: fotoProductoInstance, field: 'descripcionFotoProducto', 'error')} ">
				<label for="descripcionFotoProducto" class="control-label"><g:message code="fotoProducto.descripcionFotoProducto.label" default="Descripcion Foto Producto" /></label>
				<div class="controls">
					<g:textField name="descripcionFotoProducto" value="${fotoProductoInstance?.descripcionFotoProducto}"/>
					<span class="help-inline">${hasErrors(bean: fotoProductoInstance, field: 'descripcionFotoProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: fotoProductoInstance, field: 'tooltipFotoProducto', 'error')} ">
				<label for="tooltipFotoProducto" class="control-label"><g:message code="fotoProducto.tooltipFotoProducto.label" default="Tooltip Foto Producto" /></label>
				<div class="controls">
					<g:textField name="tooltipFotoProducto" value="${fotoProductoInstance?.tooltipFotoProducto}"/>
					<span class="help-inline">${hasErrors(bean: fotoProductoInstance, field: 'tooltipFotoProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: fotoProductoInstance, field: 'fotoProducto', 'error')} required">
				<label for="fotoProducto" class="control-label"><g:message code="fotoProducto.fotoProducto.label" default="Foto Producto" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input type="file" id="fotoProducto" name="fotoProducto" />
					<span class="help-inline">${hasErrors(bean: fotoProductoInstance, field: 'fotoProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: fotoProductoInstance, field: 'productos', 'error')} ">
				<label for="productos" class="control-label"><g:message code="fotoProducto.productos.label" default="Productos" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: fotoProductoInstance, field: 'productos', 'error')}</span>
				</div>
			</div>

