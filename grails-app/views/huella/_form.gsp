<%@ page import="org.control.Huella" %>



			<div class="control-group fieldcontain ${hasErrors(bean: huellaInstance, field: 'huerut', 'error')} required">
				<label for="huerut" class="control-label"><g:message code="huella.huerut.label" default="Huerut" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="huerut" required="" value="${huellaInstance?.huerut}"/>
					<span class="help-inline">${hasErrors(bean: huellaInstance, field: 'huerut', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: huellaInstance, field: 'huehuella', 'error')} required">
				<label for="huehuella" class="control-label"><g:message code="huella.huehuella.label" default="Huehuella" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input type="file" id="huehuella" name="huehuella" />
					<span class="help-inline">${hasErrors(bean: huellaInstance, field: 'huehuella', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: huellaInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="huella.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.control.User.list()}" optionKey="id" required="" value="${huellaInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: huellaInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

