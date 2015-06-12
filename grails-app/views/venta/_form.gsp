<%@ page import="org.control.ventas.Venta" %>



			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'subTotal', 'error')} required">
				<label for="subTotal" class="control-label"><g:message code="venta.subTotal.label" default="Sub Total" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="subTotal" required="" value="${ventaInstance.subTotal}"/>
					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'subTotal', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'descuento', 'error')} required">
				<label for="descuento" class="control-label"><g:message code="venta.descuento.label" default="Descuento" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="descuento" required="" value="${ventaInstance.descuento}"/>
					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'descuento', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'donacion', 'error')} required">
				<label for="donacion" class="control-label"><g:message code="venta.donacion.label" default="Donacion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="donacion" required="" value="${ventaInstance.donacion}"/>
					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'donacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'total', 'error')} required">
				<label for="total" class="control-label"><g:message code="venta.total.label" default="Total" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="total" required="" value="${ventaInstance.total}"/>
					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'total', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'estadoVenta', 'error')} required">
				<label for="estadoVenta" class="control-label"><g:message code="venta.estadoVenta.label" default="Estado Venta" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="estadoVenta" name="estadoVenta.id" from="${org.control.ventas.EstadoVenta.list()}" optionKey="id" required="" value="${ventaInstance?.estadoVenta?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'estadoVenta', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'vendedor', 'error')} ">
				<label for="vendedor" class="control-label"><g:message code="venta.vendedor.label" default="Vendedor" /></label>
				<div class="controls">
					<g:select id="vendedor" name="vendedor.id" from="${org.control.User.list()}" optionKey="id" value="${ventaInstance?.vendedor?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'vendedor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="venta.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${ventaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ventaInstance, field: 'detalles', 'error')} ">
				<label for="detalles" class="control-label"><g:message code="venta.detalles.label" default="Detalles" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${ventaInstance?.detalles?}" var="d">
    <li><g:link controller="detalleProducto" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleProducto" action="create" params="['venta.id': ventaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleProducto.label', default: 'DetalleProducto')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: ventaInstance, field: 'detalles', 'error')}</span>
				</div>
			</div>

