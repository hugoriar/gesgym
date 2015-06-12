<%@ page import="org.control.LogOperacion" %>



			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'tipoOperacion', 'error')} required">
				<label for="tipoOperacion" class="control-label"><g:message code="logOperacion.tipoOperacion.label" default="Tipo Operacion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="tipoOperacion" name="tipoOperacion.id" from="${org.control.LogTipoOperacion.list()}" optionKey="id" required="" value="${logOperacionInstance?.tipoOperacion?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'tipoOperacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'entidad', 'error')} required">
				<label for="entidad" class="control-label"><g:message code="logOperacion.entidad.label" default="Entidad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="entidad" name="entidad.id" from="${org.control.LogEntidad.list()}" optionKey="id" required="" value="${logOperacionInstance?.entidad?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'entidad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'idEntidad', 'error')} required">
				<label for="idEntidad" class="control-label"><g:message code="logOperacion.idEntidad.label" default="Id Entidad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="idEntidad" required="" value="${logOperacionInstance.idEntidad}"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'idEntidad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'modalidad', 'error')} required">
				<label for="modalidad" class="control-label"><g:message code="logOperacion.modalidad.label" default="Modalidad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="modalidad" name="modalidad.id" from="${org.control.Modalidad.list()}" optionKey="id" required="" value="${logOperacionInstance?.modalidad?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'modalidad', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'personal', 'error')} ">
				<label for="personal" class="control-label"><g:message code="logOperacion.personal.label" default="Personal" /></label>
				<div class="controls">
					<g:select id="personal" name="personal.id" from="${org.control.UserPersonal.list()}" optionKey="id" value="${logOperacionInstance?.personal?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'personal', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'socio', 'error')} ">
				<label for="socio" class="control-label"><g:message code="logOperacion.socio.label" default="Socio" /></label>
				<div class="controls">
					<g:select id="socio" name="socio.id" from="${org.control.UserSocio.list()}" optionKey="id" value="${logOperacionInstance?.socio?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'socio', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'atributo', 'error')} ">
				<label for="atributo" class="control-label"><g:message code="logOperacion.atributo.label" default="Atributo" /></label>
				<div class="controls">
					<g:textField name="atributo" value="${logOperacionInstance?.atributo}"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'atributo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'valorAntiguo', 'error')} ">
				<label for="valorAntiguo" class="control-label"><g:message code="logOperacion.valorAntiguo.label" default="Valor Antiguo" /></label>
				<div class="controls">
					<g:textField name="valorAntiguo" value="${logOperacionInstance?.valorAntiguo}"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'valorAntiguo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'valorNuevo', 'error')} ">
				<label for="valorNuevo" class="control-label"><g:message code="logOperacion.valorNuevo.label" default="Valor Nuevo" /></label>
				<div class="controls">
					<g:textField name="valorNuevo" value="${logOperacionInstance?.valorNuevo}"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'valorNuevo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logOperacionInstance, field: 'observaciones', 'error')} ">
				<label for="observaciones" class="control-label"><g:message code="logOperacion.observaciones.label" default="Observaciones" /></label>
				<div class="controls">
					<g:textField name="observaciones" value="${logOperacionInstance?.observaciones}"/>
					<span class="help-inline">${hasErrors(bean: logOperacionInstance, field: 'observaciones', 'error')}</span>
				</div>
			</div>

