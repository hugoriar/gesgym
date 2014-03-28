<%@ page import="org.gym.ventas.Marca" %>



			<div class="control-group fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="marca.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" maxlength="50" required="" value="${marcaInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: marcaInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: marcaInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="marca.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${marcaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: marcaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: marcaInstance, field: 'productos', 'error')} ">
				<label for="productos" class="control-label"><g:message code="marca.productos.label" default="Productos" /></label>
				<div class="controls">
					<g:select name="productos" from="${org.gym.ventas.Producto.list()}" multiple="multiple" optionKey="id" size="5" value="${marcaInstance?.productos*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: marcaInstance, field: 'productos', 'error')}</span>
				</div>
			</div>

