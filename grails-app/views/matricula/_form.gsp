<%@ page import="org.control.Matricula" %>



			<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'fechaMatricula', 'error')} required">
				<label for="fechaMatricula" class="control-label"><g:message code="matricula.fechaMatricula.label" default="Fecha Matricula" /><span class="required-indicator">*</span></label>
				<div class="controls">
					%{--<bs:datePicker name="fechaMatricula" id="fechaMatricula" value="${matriculaInstance?.fechaMatricula}" />--}%
                        %{--<g:field type="text" name="fechaMatricula" id="fechaMatricula" value="${matriculaInstance?.fechaMatricula} />--}%
                        %{--<g:textField name="fechaMatricula" id="fechaMatricula" value="${matriculaInstance?.fechaMatricula}" />--}%
                    <bs:datePicker name="fechaMatricula" id="fechaMatricula" precision="day"  value="${matriculaInstance?.fechaMatricula}"/>
                    %{--<g:textField name="fechaMatricula" id="fechaMatricula" value="${matriculaInstance?.fechaMatricula}"/>--}%
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'fechaMatricula', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'matriculadoPor', 'error')} required">
				<label for="matriculadoPor" class="control-label"><g:message code="matricula.matriculadoPor.label" default="Matriculado Por" /><span class="required-indicator">*</span></label>
				<div class="controls">
                    <g:textField name="matriculadoPor" value="${usuarioActual}" disabled="disabled"/>
                    <g:hiddenField name="matriculadoPor.id" value="${usuarioActual?.id}"/>
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'matriculadoPor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'referidoPor', 'error')} ">
				<label for="referidoPor" class="control-label"><g:message code="matricula.referidoPor.label" default="Referido Por" /></label>
				<div class="controls">
					<g:select id="referidoPor" name="referidoPor.id" from="${org.control.UserSocio.list()}" optionKey="id" value="${matriculaInstance?.referidoPor?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'referidoPor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'observacionesMatricula', 'error')} ">
				<label for="observacionesMatricula" class="control-label"><g:message code="matricula.observacionesMatricula.label" default="Observaciones Matricula" /></label>
				<div class="controls">
					<g:textArea name="observacionesMatricula" cols="40" rows="5" maxlength="1000" value="${matriculaInstance?.observacionesMatricula}"/>
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'observacionesMatricula', 'error')}</span>
				</div>
			</div>

<fieldset class="form">
    <legend>Detalles del pago de Matrícula</legend>
    <div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'vigente', 'error')} ">
        <label for="pagaMatricula" class="control-label"><g:message code="cursoEspecial.vigente.label" default="Paga matrícula" /></label>
        <div class="controls">
            <g:checkBox name="pagaMatricula" checked="${pagaMatricula}" onchange="tooglePago();"/>
            <span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'vigente', 'error')}</span>
        </div>
    </div>
    <div id="divPago" style="display: none;">
        <g:render template="/pago/form" model="[pagaMatricula: Boolean.FALSE]"/>
    </div>
</fieldset>

