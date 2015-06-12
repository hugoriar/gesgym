<%@ page import="org.control.LogAtributo" %>



			<div class="control-group fieldcontain ${hasErrors(bean: logAtributoInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="logAtributo.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${logAtributoInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: logAtributoInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logAtributoInstance, field: 'nombreReal', 'error')} required">
				<label for="nombreReal" class="control-label"><g:message code="logAtributo.nombreReal.label" default="Nombre Real" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombreReal" required="" value="${logAtributoInstance?.nombreReal}"/>
					<span class="help-inline">${hasErrors(bean: logAtributoInstance, field: 'nombreReal', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logAtributoInstance, field: 'esIndice', 'error')} ">
				<label for="esIndice" class="control-label"><g:message code="logAtributo.esIndice.label" default="Es Indice" /></label>
				<div class="controls">
					<bs:checkBox name="esIndice" value="${logAtributoInstance?.esIndice}" />
					<span class="help-inline">${hasErrors(bean: logAtributoInstance, field: 'esIndice', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: logAtributoInstance, field: 'entidad', 'error')} required">
				<label for="entidad" class="control-label"><g:message code="logAtributo.entidad.label" default="Entidad" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="entidad" name="entidad.id" from="${org.control.LogEntidad.list()}" optionKey="id" required="" value="${logAtributoInstance?.entidad?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: logAtributoInstance, field: 'entidad', 'error')}</span>
				</div>
			</div>

