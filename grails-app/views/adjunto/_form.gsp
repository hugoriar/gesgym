<%@ page import="org.control.Adjunto" %>



			<div class="control-group fieldcontain ${hasErrors(bean: adjuntoInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="adjunto.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${adjuntoInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: adjuntoInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adjuntoInstance, field: 'contentType', 'error')} required">
				<label for="contentType" class="control-label"><g:message code="adjunto.contentType.label" default="Content Type" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="contentType" required="" value="${adjuntoInstance?.contentType}"/>
					<span class="help-inline">${hasErrors(bean: adjuntoInstance, field: 'contentType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adjuntoInstance, field: 'peso', 'error')} required">
				<label for="peso" class="control-label"><g:message code="adjunto.peso.label" default="Peso" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="peso" required="" value="${adjuntoInstance.peso}"/>
					<span class="help-inline">${hasErrors(bean: adjuntoInstance, field: 'peso', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adjuntoInstance, field: 'archivo', 'error')} required">
				<label for="archivo" class="control-label"><g:message code="adjunto.archivo.label" default="Archivo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input type="file" id="archivo" name="archivo" />
					<span class="help-inline">${hasErrors(bean: adjuntoInstance, field: 'archivo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: adjuntoInstance, field: 'email', 'error')} required">
				<label for="email" class="control-label"><g:message code="adjunto.email.label" default="Email" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="email" name="email.id" from="${org.control.Email.list()}" optionKey="id" required="" value="${adjuntoInstance?.email?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: adjuntoInstance, field: 'email', 'error')}</span>
				</div>
			</div>

