<%@ page import="org.control.ConfiguracionBytes" %>



			<div class="control-group fieldcontain ${hasErrors(bean: configuracionBytesInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="configuracionBytes.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${configuracionBytesInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: configuracionBytesInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configuracionBytesInstance, field: 'valor', 'error')} required">
				<label for="valor" class="control-label"><g:message code="configuracionBytes.valor.label" default="Valor" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<input type="file" id="valor" name="valor" />
					<span class="help-inline">${hasErrors(bean: configuracionBytesInstance, field: 'valor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configuracionBytesInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="configuracionBytes.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${configuracionBytesInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: configuracionBytesInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

