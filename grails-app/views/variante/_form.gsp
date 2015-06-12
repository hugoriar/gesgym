<%@ page import="org.control.ventas.Variante" %>



			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'sku', 'error')} ">
				<label for="sku" class="control-label"><g:message code="variante.sku.label" default="Sku" /></label>
				<div class="controls">
					<g:textField name="sku" value="${varianteInstance?.sku}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'sku', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="variante.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" maxlength="50" required="" value="${varianteInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'precio', 'error')} required">
				<label for="precio" class="control-label"><g:message code="variante.precio.label" default="Precio" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="precio" min="0" max="9999999" required="" value="${varianteInstance.precio}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'precio', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'precioMayorista', 'error')} ">
				<label for="precioMayorista" class="control-label"><g:message code="variante.precioMayorista.label" default="Precio Mayorista" /></label>
				<div class="controls">
					<g:field type="number" name="precioMayorista" min="0" max="9999999" value="${varianteInstance.precioMayorista}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'precioMayorista', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'peso', 'error')} ">
				<label for="peso" class="control-label"><g:message code="variante.peso.label" default="Peso" /></label>
				<div class="controls">
					<g:field type="number" name="peso" step="any" value="${varianteInstance.peso}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'peso', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'codigoBarras', 'error')} ">
				<label for="codigoBarras" class="control-label"><g:message code="variante.codigoBarras.label" default="Codigo Barras" /></label>
				<div class="controls">
					<g:textField name="codigoBarras" value="${varianteInstance?.codigoBarras}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'codigoBarras', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'descripcionBreve', 'error')} ">
				<label for="descripcionBreve" class="control-label"><g:message code="variante.descripcionBreve.label" default="Descripcion Breve" /></label>
				<div class="controls">
					<g:textArea name="descripcionBreve" cols="40" rows="5" maxlength="1500" value="${varianteInstance?.descripcionBreve}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'descripcionBreve', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="variante.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${varianteInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'gestionarStock', 'error')} ">
				<label for="gestionarStock" class="control-label"><g:message code="variante.gestionarStock.label" default="Gestionar Stock" /></label>
				<div class="controls">
					<bs:checkBox name="gestionarStock" value="${varianteInstance?.gestionarStock}" />
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'gestionarStock', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'venderConStockCero', 'error')} ">
				<label for="venderConStockCero" class="control-label"><g:message code="variante.venderConStockCero.label" default="Vender Con Stock Cero" /></label>
				<div class="controls">
					<bs:checkBox name="venderConStockCero" value="${varianteInstance?.venderConStockCero}" />
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'venderConStockCero', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'publicado', 'error')} ">
				<label for="publicado" class="control-label"><g:message code="variante.publicado.label" default="Publicado" /></label>
				<div class="controls">
					<bs:checkBox name="publicado" value="${varianteInstance?.publicado}" />
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'publicado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'destacado', 'error')} ">
				<label for="destacado" class="control-label"><g:message code="variante.destacado.label" default="Destacado" /></label>
				<div class="controls">
					<bs:checkBox name="destacado" value="${varianteInstance?.destacado}" />
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'destacado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'descuentosVariante', 'error')} ">
				<label for="descuentosVariante" class="control-label"><g:message code="variante.descuentosVariante.label" default="Descuentos Variante" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${varianteInstance?.descuentosVariante?}" var="d">
    <li><g:link controller="descuentoVariante" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="descuentoVariante" action="create" params="['variante.id': varianteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'descuentoVariante.label', default: 'DescuentoVariante')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'descuentosVariante', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'detallesBoleta', 'error')} ">
				<label for="detallesBoleta" class="control-label"><g:message code="variante.detallesBoleta.label" default="Detalles Boleta" /></label>
				<div class="controls">
					<g:select name="detallesBoleta" from="${org.control.ventas.Detalle.list()}" multiple="multiple" optionKey="id" size="5" value="${varianteInstance?.detallesBoleta*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'detallesBoleta', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'fotosProducto', 'error')} ">
				<label for="fotosProducto" class="control-label"><g:message code="variante.fotosProducto.label" default="Fotos Producto" /></label>
				<div class="controls">
					<g:select name="fotosProducto" from="${org.control.ventas.FotoProducto.list()}" multiple="multiple" optionKey="id" size="5" value="${varianteInstance?.fotosProducto*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'fotosProducto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: varianteInstance, field: 'proveedores', 'error')} ">
				<label for="proveedores" class="control-label"><g:message code="variante.proveedores.label" default="Proveedores" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: varianteInstance, field: 'proveedores', 'error')}</span>
				</div>
			</div>

