<%@ page import="org.control.ventas.Producto" %>



			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="producto.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" maxlength="50" required="" value="${productoInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'precioBase', 'error')} required">
				<label for="precioBase" class="control-label"><g:message code="producto.precioBase.label" default="Precio Base" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="precioBase" min="0" max="9999999" required="" value="${productoInstance.precioBase}"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'precioBase', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'precioMayorista', 'error')} ">
				<label for="precioMayorista" class="control-label"><g:message code="producto.precioMayorista.label" default="Precio Mayorista" /></label>
				<div class="controls">
					<g:field type="number" name="precioMayorista" min="0" max="9999999" value="${productoInstance.precioMayorista}"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'precioMayorista', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'peso', 'error')} ">
				<label for="peso" class="control-label"><g:message code="producto.peso.label" default="Peso" /></label>
				<div class="controls">
					<g:field type="number" name="peso" step="any" value="${productoInstance.peso}"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'peso', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcionBreve', 'error')} ">
				<label for="descripcionBreve" class="control-label"><g:message code="producto.descripcionBreve.label" default="Descripcion Breve" /></label>
				<div class="controls">
					<g:textArea name="descripcionBreve" cols="40" rows="5" maxlength="1500" value="${productoInstance?.descripcionBreve}"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'descripcionBreve', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="producto.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${productoInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'gestionarStock', 'error')} ">
				<label for="gestionarStock" class="control-label"><g:message code="producto.gestionarStock.label" default="Gestionar Stock" /></label>
				<div class="controls">
					<bs:checkBox name="gestionarStock" value="${productoInstance?.gestionarStock}" />
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'gestionarStock', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'venderConStockCero', 'error')} ">
				<label for="venderConStockCero" class="control-label"><g:message code="producto.venderConStockCero.label" default="Vender Con Stock Cero" /></label>
				<div class="controls">
					<bs:checkBox name="venderConStockCero" value="${productoInstance?.venderConStockCero}" />
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'venderConStockCero', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'publicado', 'error')} ">
				<label for="publicado" class="control-label"><g:message code="producto.publicado.label" default="Publicado" /></label>
				<div class="controls">
					<bs:checkBox name="publicado" value="${productoInstance?.publicado}" />
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'publicado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'destacado', 'error')} ">
				<label for="destacado" class="control-label"><g:message code="producto.destacado.label" default="Destacado" /></label>
				<div class="controls">
					<bs:checkBox name="destacado" value="${productoInstance?.destacado}" />
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'destacado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categorias', 'error')} ">
				<label for="categorias" class="control-label"><g:message code="producto.categorias.label" default="Categorias" /></label>
				<div class="controls">
                    <g:select name="categorias" from="${org.control.ventas.Categoria.list()}" multiple="multiple" optionKey="id" size="5" value="${productoInstance?.categorias*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'categorias', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'descuentosProducto', 'error')} ">
				<label for="descuentosProducto" class="control-label"><g:message code="producto.descuentosProducto.label" default="Descuentos Producto" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${productoInstance?.descuentosProducto?}" var="d">
    <li><g:link controller="descuentoProducto" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="descuentoProducto" action="create" params="['producto.id': productoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'descuentoProducto.label', default: 'DescuentoProducto')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'descuentosProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'detallesBoleta', 'error')} ">
				<label for="detallesBoleta" class="control-label"><g:message code="producto.detallesBoleta.label" default="Detalles Boleta" /></label>
				<div class="controls">
					<g:select name="detallesBoleta" from="${org.control.ventas.Detalle.list()}" multiple="multiple" optionKey="id" size="5" value="${productoInstance?.detallesBoleta*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'detallesBoleta', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'fotosProducto', 'error')} ">
				<label for="fotosProducto" class="control-label"><g:message code="producto.fotosProducto.label" default="Fotos Producto" /></label>
				<div class="controls">
					<g:select name="fotosProducto" from="${org.control.ventas.FotoProducto.list()}" multiple="multiple" optionKey="id" size="5" value="${productoInstance?.fotosProducto*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'fotosProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'proveedores', 'error')} ">
				<label for="proveedores" class="control-label"><g:message code="producto.proveedores.label" default="Proveedores" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'proveedores', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'variantes', 'error')} ">
				<label for="variantes" class="control-label"><g:message code="producto.variantes.label" default="Variantes" /></label>
				<div class="controls">
					<g:select name="variantes" from="${org.control.ventas.Variante.list()}" multiple="multiple" optionKey="id" size="5" value="${productoInstance?.variantes*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: productoInstance, field: 'variantes', 'error')}</span>
				</div>
			</div>

