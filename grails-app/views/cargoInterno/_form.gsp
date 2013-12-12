<%@ page import="org.gym.CargoInterno" %>



			<div class="control-group fieldcontain ${hasErrors(bean: cargoInternoInstance, field: 'nombreCargo', 'error')} required">
				<label for="nombreCargo" class="control-label"><g:message code="cargoInterno.nombreCargo.label" default="Nombre Cargo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombreCargo" required="" value="${cargoInternoInstance?.nombreCargo}"/>
					<span class="help-inline">${hasErrors(bean: cargoInternoInstance, field: 'nombreCargo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cargoInternoInstance, field: 'descripcionCargo', 'error')} ">
				<label for="descripcionCargo" class="control-label"><g:message code="cargoInterno.descripcionCargo.label" default="Descripcion Cargo" /></label>
				<div class="controls">
					<g:textArea name="descripcionCargo" cols="40" rows="5" maxlength="10000" value="${cargoInternoInstance?.descripcionCargo}"/>
					<span class="help-inline">${hasErrors(bean: cargoInternoInstance, field: 'descripcionCargo', 'error')}</span>
				</div>
			</div>

