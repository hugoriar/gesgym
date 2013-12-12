<%@ page import="org.gym.fichaMedica.CondicionMedica" %>



			<div class="control-group fieldcontain ${hasErrors(bean: condicionMedicaInstance, field: 'condicion', 'error')} ">
				<label for="condicion" class="control-label"><g:message code="condicionMedica.condicion.label" default="Condicion" /></label>
				<div class="controls">
					<g:textField name="condicion" value="${condicionMedicaInstance?.condicion}"/>
					<span class="help-inline">${hasErrors(bean: condicionMedicaInstance, field: 'condicion', 'error')}</span>
				</div>
			</div>

%{--
			<div class="control-group fieldcontain ${hasErrors(bean: condicionMedicaInstance, field: 'profesional', 'error')} ">
				<label for="profesional" class="control-label"><g:message code="condicionMedica.profesional.label" default="Profesional" /></label>
				<div class="controls">
					<g:select id="profesional" name="profesional.id" from="${org.gym.fichaMedica.Profesional.list()}" optionKey="id" value="${condicionMedicaInstance?.profesional?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: condicionMedicaInstance, field: 'profesional', 'error')}</span>
				</div>
			</div>
--}%

			<div class="control-group fieldcontain ${hasErrors(bean: condicionMedicaInstance, field: 'medicamento', 'error')} ">
				<label for="medicamento" class="control-label"><g:message code="condicionMedica.medicamento.label" default="Medicamento" /></label>
				<div class="controls">
					<g:textField name="medicamento" value="${condicionMedicaInstance?.medicamento}"/>
					<span class="help-inline">${hasErrors(bean: condicionMedicaInstance, field: 'medicamento', 'error')}</span>
				</div>
			</div>

<g:render template="/profesional/form"/>

