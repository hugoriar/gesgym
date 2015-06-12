<%@ page import="org.control.DireccionEmpresa" %>



			<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'calleEmpresa', 'error')} ">
				<label for="calleEmpresa" class="control-label"><g:message code="direccionEmpresa.calleEmpresa.label" default="Calle Empresa" /></label>
				<div class="controls">
					<g:textField name="calleEmpresa" value="${direccionEmpresaInstance?.calleEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'calleEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'numeroEmpresa', 'error')} ">
				<label for="numeroEmpresa" class="control-label"><g:message code="direccionEmpresa.numeroEmpresa.label" default="Numero Empresa" /></label>
				<div class="controls">
					<g:field type="number" name="numeroEmpresa" value="${direccionEmpresaInstance?.numeroEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'numeroEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'oficinaEmpresa', 'error')} ">
				<label for="oficinaEmpresa" class="control-label"><g:message code="direccionEmpresa.oficinaEmpresa.label" default="Oficina Empresa" /></label>
				<div class="controls">
					<g:textField name="oficinaEmpresa" value="${direccionEmpresaInstance?.oficinaEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'oficinaEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'sectorEmpresa', 'error')} ">
				<label for="sectorEmpresa" class="control-label"><g:message code="direccionEmpresa.sectorEmpresa.label" default="Sector Empresa" /></label>
				<div class="controls">
					<g:select id="sectorEmpresa" name="sectorEmpresa.id" from="${org.control.ubicacion.Sector.list()}" optionKey="id" value="${direccionEmpresaInstance?.sectorEmpresa?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'sectorEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'ciudadEmpresa', 'error')} ">
				<label for="ciudadEmpresa" class="control-label"><g:message code="direccionEmpresa.ciudadEmpresa.label" default="Ciudad Empresa" /></label>
				<div class="controls">
					<g:select id="ciudadEmpresa" name="ciudadEmpresa.id" from="${org.control.ubicacion.Ciudad.list()}" optionKey="id" value="${direccionEmpresaInstance?.ciudadEmpresa?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'ciudadEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'codigoPostalEmpresa', 'error')} ">
				<label for="codigoPostalEmpresa" class="control-label"><g:message code="direccionEmpresa.codigoPostalEmpresa.label" default="Codigo Postal Empresa" /></label>
				<div class="controls">
					<g:field type="number" name="codigoPostalEmpresa" value="${direccionEmpresaInstance?.codigoPostalEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'codigoPostalEmpresa', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'empresa', 'error')} required">
				<label for="empresa" class="control-label"><g:message code="direccionEmpresa.empresa.label" default="Empresa" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="empresa" name="empresa.id" from="${org.control.Empresa.list()}" optionKey="id" required="" value="${direccionEmpresaInstance?.empresa?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'empresa', 'error')}</span>
				</div>
			</div>--}%

