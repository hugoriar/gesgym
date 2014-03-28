<%@ page import="org.gym.ConceptoPago" %>



			<div class="control-group fieldcontain ${hasErrors(bean: conceptoPagoInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="conceptoPago.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="nombre" cols="40" rows="5" maxlength="5000" required="" value="${conceptoPagoInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: conceptoPagoInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: conceptoPagoInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="conceptoPago.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="5000" value="${conceptoPagoInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: conceptoPagoInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: conceptoPagoInstance, field: 'categoriaConceptoPago', 'error')} required">
				<label for="categoriaConceptoPago" class="control-label"><g:message code="conceptoPago.categoriaConceptoPago.label" default="Categoria Concepto Pago" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="categoriaConceptoPago" name="categoriaConceptoPago.id" from="${org.gym.CategoriaConceptoPago.list()}" optionKey="id" required="" value="${conceptoPagoInstance?.categoriaConceptoPago?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: conceptoPagoInstance, field: 'categoriaConceptoPago', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: conceptoPagoInstance, field: 'pagos', 'error')} ">
				<label for="pagos" class="control-label"><g:message code="conceptoPago.pagos.label" default="Pagos" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${conceptoPagoInstance?.pagos?}" var="p">
    <li><g:link controller="pago" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pago" action="create" params="['conceptoPago.id': conceptoPagoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pago.label', default: 'Pago')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: conceptoPagoInstance, field: 'pagos', 'error')}</span>
				</div>
			</div>

