<%@ page import="org.control.ventas.SubCategoria" %>



			<div class="control-group fieldcontain ${hasErrors(bean: subCategoriaInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="subCategoria.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${subCategoriaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: subCategoriaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subCategoriaInstance, field: 'categoria', 'error')} required">
				<label for="categoria" class="control-label"><g:message code="subCategoria.categoria.label" default="Categoria" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="categoria" name="categoria.id" from="${org.control.ventas.Categoria.list()}" optionKey="id" required="" value="${subCategoriaInstance?.categoria?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: subCategoriaInstance, field: 'categoria', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subCategoriaInstance, field: 'descuentosSubCategoria', 'error')} ">
				<label for="descuentosSubCategoria" class="control-label"><g:message code="subCategoria.descuentosSubCategoria.label" default="Descuentos Sub Categoria" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${subCategoriaInstance?.descuentosSubCategoria?}" var="d">
    <li><g:link controller="descuentoSubCategoria" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="descuentoSubCategoria" action="create" params="['subCategoria.id': subCategoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'descuentoSubCategoria.label', default: 'DescuentoSubCategoria')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: subCategoriaInstance, field: 'descuentosSubCategoria', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subCategoriaInstance, field: 'nombre', 'error')} ">
				<label for="nombre" class="control-label"><g:message code="subCategoria.nombre.label" default="Nombre" /></label>
				<div class="controls">
					<g:textField name="nombre" value="${subCategoriaInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: subCategoriaInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: subCategoriaInstance, field: 'productos', 'error')} ">
				<label for="productos" class="control-label"><g:message code="subCategoria.productos.label" default="Productos" /></label>
				<div class="controls">
					<g:select name="productos" from="${org.control.ventas.Producto.list()}" multiple="multiple" optionKey="id" size="5" value="${subCategoriaInstance?.productos*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: subCategoriaInstance, field: 'productos', 'error')}</span>
				</div>
			</div>

