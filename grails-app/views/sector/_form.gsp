<%@ page import="org.control.ubicacion.Sector" %>



			<div class="control-group fieldcontain ${hasErrors(bean: sectorInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="sector.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${sectorInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: sectorInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: sectorInstance, field: 'ciudad', 'error')} required">
				<label for="ciudad" class="control-label"><g:message code="sector.ciudad.label" default="Ciudad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="ciudad" name="ciudad.id" from="${org.control.ubicacion.Ciudad.list()}" optionKey="id" required="" value="${sectorInstance?.ciudad?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: sectorInstance, field: 'ciudad', 'error')}</span>
				</div>
			</div>

