<%@ page import="org.gym.ventas.Categoria" %>



			<div class="control-group fieldcontain ${hasErrors(bean: categoriaInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="categoria.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${categoriaInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: categoriaInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: categoriaInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="categoria.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${categoriaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: categoriaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: categoriaInstance, field: 'descuentosCategoria', 'error')} ">
				<label for="descuentosCategoria" class="control-label"><g:message code="categoria.descuentosCategoria.label" default="Descuentos Categoria" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${categoriaInstance?.descuentosCategoria?}" var="d">
    <li><g:link controller="descuentoCategoria" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="descuentoCategoria" action="create" params="['categoria.id': categoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'descuentoCategoria.label', default: 'DescuentoCategoria')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: categoriaInstance, field: 'descuentosCategoria', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: categoriaInstance, field: 'subCategorias', 'error')} ">
				<label for="subCategorias" class="control-label"><g:message code="categoria.subCategorias.label" default="Sub Categorias" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${categoriaInstance?.subCategorias?}" var="s">
    <li><g:link controller="categoria" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="categoria" action="create" params="['categoria.id': categoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'categoria.label', default: 'Categoria')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: categoriaInstance, field: 'subCategorias', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: categoriaInstance, field: 'categoriaPadre', 'error')} ">
				<label for="categoriaPadre" class="control-label"><g:message code="categoria.categoriaPadre.label" default="Categoria Padre" /></label>
				<div class="controls">
					<g:select id="categoriaPadre" name="categoriaPadre.id" from="${org.gym.ventas.Categoria.list()}" optionKey="id" value="${categoriaInstance?.categoriaPadre?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: categoriaInstance, field: 'categoriaPadre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: categoriaInstance, field: 'productos', 'error')} ">
				<label for="productos" class="control-label"><g:message code="categoria.productos.label" default="Productos" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${categoriaInstance?.productos?}" var="p">
    <li><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="producto" action="create" params="['categoria.id': categoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'producto.label', default: 'Producto')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: categoriaInstance, field: 'productos', 'error')}</span>
				</div>
			</div>

