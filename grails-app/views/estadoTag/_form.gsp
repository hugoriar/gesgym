<%@ page import="org.control.tag.EstadoTag" %>



			<div class="control-group fieldcontain ${hasErrors(bean: estadoTagInstance, field: 'nombreEstado', 'error')} required">
				<label for="nombreEstado" class="control-label"><g:message code="estadoTag.nombreEstado.label" default="Nombre Estado" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombreEstado" required="" value="${estadoTagInstance?.nombreEstado}"/>
					<span class="help-inline">${hasErrors(bean: estadoTagInstance, field: 'nombreEstado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoTagInstance, field: 'habilitado', 'error')} ">
				<label for="habilitado" class="control-label"><g:message code="estadoTag.habilitado.label" default="Habilitado" /></label>
				<div class="controls">
					<bs:checkBox name="habilitado" value="${estadoTagInstance?.habilitado}" />
					<span class="help-inline">${hasErrors(bean: estadoTagInstance, field: 'habilitado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: estadoTagInstance, field: 'descripcionEstado', 'error')} required">
				<label for="descripcionEstado" class="control-label"><g:message code="estadoTag.descripcionEstado.label" default="Descripcion Estado" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="descripcionEstado" cols="40" rows="5" maxlength="10000" required="" value="${estadoTagInstance?.descripcionEstado}"/>
					<span class="help-inline">${hasErrors(bean: estadoTagInstance, field: 'descripcionEstado', 'error')}</span>
				</div>
			</div>

