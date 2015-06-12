<%@ page import="org.control.Cheque" %>



			<div class="control-group fieldcontain ${hasErrors(bean: chequeInstance, field: 'banco', 'error')} required">
				<label for="banco" class="control-label"><g:message code="cheque.banco.label" default="Banco" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="banco" name="banco.id" from="${org.control.Banco.list()}" optionKey="id" required="" value="${chequeInstance?.banco?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'banco', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: chequeInstance, field: 'fechaVencimiento', 'error')} required">
				<label for="fechaVencimiento" class="control-label"><g:message code="cheque.fechaVencimiento.label" default="Fecha Vencimiento" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaVencimiento" precision="day"  value="${chequeInstance?.fechaVencimiento}"  />
					<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'fechaVencimiento', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: chequeInstance, field: 'montoCheque', 'error')} required">
				<label for="montoCheque" class="control-label"><g:message code="cheque.montoCheque.label" default="Monto Cheque" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="montoCheque" required="" value="${chequeInstance?.montoCheque}"/>
					<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'montoCheque', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: chequeInstance, field: 'numeroCheque', 'error')} required">
				<label for="numeroCheque" class="control-label"><g:message code="cheque.numeroCheque.label" default="Numero Cheque" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="numeroCheque" required="" value="${chequeInstance?.numeroCheque}"/>
					<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'numeroCheque', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: chequeInstance, field: 'pago', 'error')} required">
				<label for="pago" class="control-label"><g:message code="cheque.pago.label" default="Pago" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="pago" name="pago.id" from="${org.control.Pago.list()}" optionKey="id" required="" value="${chequeInstance?.pago?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'pago', 'error')}</span>
				</div>
			</div>--}%

