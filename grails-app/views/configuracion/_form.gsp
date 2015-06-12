<%@ page import="org.control.Configuracion" %>



			<div class="control-group fieldcontain ${hasErrors(bean: configuracionInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="configuracion.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${configuracionInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: configuracionInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configuracionInstance, field: 'valor', 'error')} required">
				<label for="valor" class="control-label"><g:message code="configuracion.valor.label" default="Valor" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="valor" required="" value="${configuracionInstance?.valor}"/>
					<span class="help-inline">${hasErrors(bean: configuracionInstance, field: 'valor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: configuracionInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="configuracion.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${configuracionInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: configuracionInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

