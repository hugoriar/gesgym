<%@ page import="org.gym.Visita" %>



			<div class="control-group fieldcontain ${hasErrors(bean: visitaInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="visita.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.gym.UserSocio.list()}" optionKey="id" required="" value="${visitaInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: visitaInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: visitaInstance, field: 'fechaDeVisita', 'error')} required">
				<label for="fechaDeVisita" class="control-label"><g:message code="visita.fechaDeVisita.label" default="Fecha De Visita" /><span class="required-indicator">*</span></label>
				<div class="controls">
					${visitaInstance?.fechaDeVisita?.toString()}
					<span class="help-inline">${hasErrors(bean: visitaInstance, field: 'fechaDeVisita', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: visitaInstance, field: 'horaDeEntrada', 'error')} required">
				<label for="horaDeEntrada" class="control-label"><g:message code="visita.horaDeEntrada.label" default="Hora De Entrada" /><span class="required-indicator">*</span></label>
				<div class="controls">
					${visitaInstance?.horaDeEntrada?.toString()}
					<span class="help-inline">${hasErrors(bean: visitaInstance, field: 'horaDeEntrada', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: visitaInstance, field: 'horaDeSalida', 'error')} required">
				<label for="horaDeSalida" class="control-label"><g:message code="visita.horaDeSalida.label" default="Hora De Salida" /><span class="required-indicator">*</span></label>
				<div class="controls">
					${visitaInstance?.horaDeSalida?.toString()}
					<span class="help-inline">${hasErrors(bean: visitaInstance, field: 'horaDeSalida', 'error')}</span>
				</div>
			</div>

