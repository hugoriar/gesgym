<%@ page import="org.control.ventas.Boleta" %>



			<div class="control-group fieldcontain ${hasErrors(bean: boletaInstance, field: 'detalles', 'error')} ">
				<label for="detalles" class="control-label"><g:message code="boleta.detalles.label" default="Detalles" /></label>
				<div class="controls">
					<g:select name="detalles" from="${org.control.ventas.Detalle.list()}" multiple="multiple" optionKey="id" size="5" value="${boletaInstance?.detalles*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: boletaInstance, field: 'detalles', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: boletaInstance, field: 'pagos', 'error')} ">
				<label for="pagos" class="control-label"><g:message code="boleta.pagos.label" default="Pagos" /></label>
				<div class="controls">
					<g:select name="pagos" from="${org.control.Pago.list()}" multiple="multiple" optionKey="id" size="5" value="${boletaInstance?.pagos*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: boletaInstance, field: 'pagos', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: boletaInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="boleta.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.control.User.list()}" optionKey="id" required="" value="${boletaInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: boletaInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

