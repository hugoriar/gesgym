<%@ page import="org.control.fichaMedica.Profesional" %>



			<div class="control-group fieldcontain ${hasErrors(bean: profesionalInstance, field: 'nombreProfesional', 'error')} ">
				<label for="nombreProfesional" class="control-label"><g:message code="profesional.nombreProfesional.label" default="Nombre Profesional" /></label>
				<div class="controls">
					<g:textField name="nombreProfesional" value="${profesionalInstance?.nombreProfesional}" readonly="readonly" style="background-color: #ffffff !important;"/>
					<span class="help-inline">${hasErrors(bean: profesionalInstance, field: 'nombreProfesional', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: profesionalInstance, field: 'fonoProfesional', 'error')} ">
				<label for="fonoProfesional" class="control-label"><g:message code="profesional.fonoProfesional.label" default="Fono Profesional" /></label>
				<div class="controls">
					<g:field type="number" name="fonoProfesional" value="${profesionalInstance?.fonoProfesional}" readonly="readonly" style="background-color: #ffffff !important;"/>
					<span class="help-inline">${hasErrors(bean: profesionalInstance, field: 'fonoProfesional', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: profesionalInstance, field: 'especializacionProfesional', 'error')} ">
				<label for="especializacionProfesional" class="control-label"><g:message code="profesional.especializacionProfesional.label" default="Especializacion Profesional" /></label>
				<div class="controls">
					<g:select id="especializacionProfesional" name="especializacionProfesional.id" from="${org.control.Especializacion.list()}" optionKey="id" value="${profesionalInstance?.especializacionProfesional?.id}" class="many-to-one" noSelection="['null': '']" readonly="readonly" disabled="" style="background-color: #ffffff !important;"/>
					<span class="help-inline">${hasErrors(bean: profesionalInstance, field: 'especializacionProfesional', 'error')}</span>
				</div>
			</div>

%{--
			<div class="control-group fieldcontain ${hasErrors(bean: profesionalInstance, field: 'fichasMedicasProfesional', 'error')} ">
				<label for="fichasMedicasProfesional" class="control-label"><g:message code="profesional.fichasMedicasProfesional.label" default="Fichas Medicas Profesional" /></label>
				<div class="controls">
					<g:select name="fichasMedicasProfesional" from="${org.control.fichaMedica.FichaMedica.list()}" multiple="multiple" optionKey="id" size="5" value="${profesionalInstance?.fichasMedicasProfesional*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: profesionalInstance, field: 'fichasMedicasProfesional', 'error')}</span>
				</div>
			</div>

--}%
