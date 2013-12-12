<%@ page import="org.gym.ContactoEmergencia" %>



			<div class="control-group fieldcontain ${hasErrors(bean: contactoEmergenciaInstance, field: 'nombreContactoEmergencia', 'error')} required">
				<label for="nombreContactoEmergencia" class="control-label"><g:message code="contactoEmergencia.nombreContactoEmergencia.label" default="Nombre Contacto Emergencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombreContactoEmergencia" required="" value="${contactoEmergenciaInstance?.nombreContactoEmergencia}"/>
					<span class="help-inline">${hasErrors(bean: contactoEmergenciaInstance, field: 'nombreContactoEmergencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactoEmergenciaInstance, field: 'apellidoPaternoContactoEmergencia', 'error')} required">
				<label for="apellidoPaternoContactoEmergencia" class="control-label"><g:message code="contactoEmergencia.apellidoPaternoContactoEmergencia.label" default="Apellido Paterno Contacto Emergencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoPaternoContactoEmergencia" required="" value="${contactoEmergenciaInstance?.apellidoPaternoContactoEmergencia}"/>
					<span class="help-inline">${hasErrors(bean: contactoEmergenciaInstance, field: 'apellidoPaternoContactoEmergencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactoEmergenciaInstance, field: 'apellidoMaternoContactoEmergencia', 'error')} required">
				<label for="apellidoMaternoContactoEmergencia" class="control-label"><g:message code="contactoEmergencia.apellidoMaternoContactoEmergencia.label" default="Apellido Materno Contacto Emergencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoMaternoContactoEmergencia" required="" value="${contactoEmergenciaInstance?.apellidoMaternoContactoEmergencia}"/>
					<span class="help-inline">${hasErrors(bean: contactoEmergenciaInstance, field: 'apellidoMaternoContactoEmergencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactoEmergenciaInstance, field: 'fonoCasaContactoEmergencia', 'error')} ">
				<label for="fonoCasaContactoEmergencia" class="control-label"><g:message code="contactoEmergencia.fonoCasaContactoEmergencia.label" default="Fono Casa Contacto Emergencia" /></label>
				<div class="controls">
					<g:field type="number" name="fonoCasaContactoEmergencia" value="${contactoEmergenciaInstance?.fonoCasaContactoEmergencia}"/>
					<span class="help-inline">${hasErrors(bean: contactoEmergenciaInstance, field: 'fonoCasaContactoEmergencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactoEmergenciaInstance, field: 'fonoCelularContactoEmergencia', 'error')} ">
				<label for="fonoCelularContactoEmergencia" class="control-label"><g:message code="contactoEmergencia.fonoCelularContactoEmergencia.label" default="Fono Celular Contacto Emergencia" /></label>
				<div class="controls">
					<g:field type="number" name="fonoCelularContactoEmergencia" value="${contactoEmergenciaInstance?.fonoCelularContactoEmergencia}"/>
					<span class="help-inline">${hasErrors(bean: contactoEmergenciaInstance, field: 'fonoCelularContactoEmergencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: contactoEmergenciaInstance, field: 'fonoTrabajoContactoEmergencia', 'error')} ">
				<label for="fonoTrabajoContactoEmergencia" class="control-label"><g:message code="contactoEmergencia.fonoTrabajoContactoEmergencia.label" default="Fono Trabajo Contacto Emergencia" /></label>
				<div class="controls">
					<g:field type="number" name="fonoTrabajoContactoEmergencia" value="${contactoEmergenciaInstance?.fonoTrabajoContactoEmergencia}"/>
					<span class="help-inline">${hasErrors(bean: contactoEmergenciaInstance, field: 'fonoTrabajoContactoEmergencia', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: contactoEmergenciaInstance, field: 'parentescoContactoEmergencia', 'error')} ">
				<label for="parentescoContactoEmergencia" class="control-label"><g:message code="contactoEmergencia.parentescoContactoEmergencia.label" default="Parentesco Contacto Emergencia" /></label>
				<div class="controls">
					<g:select id="parentescoContactoEmergencia" name="parentescoContactoEmergencia.id" from="${org.gym.Parentesco.list()}" optionKey="id" value="${contactoEmergenciaInstance?.parentescoContactoEmergencia?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: contactoEmergenciaInstance, field: 'parentescoContactoEmergencia', 'error')}</span>
				</div>
			</div>--}%

