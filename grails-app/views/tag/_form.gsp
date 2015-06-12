<%@ page import="org.control.tag.Tag" %>



			<div class="control-group fieldcontain ${hasErrors(bean: tagInstance, field: 'modelo', 'error')} required">
				<label for="modelo" class="control-label"><g:message code="tag.modelo.label" default="Modelo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="modelo" name="modelo.id" from="${org.control.tag.ModeloTag.list()}" optionKey="id" required="" value="${tagInstance?.modelo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: tagInstance, field: 'modelo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tagInstance, field: 'epc', 'error')} required">
				<label for="epc" class="control-label"><g:message code="tag.epc.label" default="Epc" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="epc" required="" value="${tagInstance?.epc}"/>
					<span class="help-inline">${hasErrors(bean: tagInstance, field: 'epc', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tagInstance, field: 'codigoTag', 'error')} ">
				<label for="codigoTag" class="control-label"><g:message code="tag.codigoTag.label" default="Codigo Tag" /></label>
				<div class="controls">
					<g:textField name="codigoTag" value="${tagInstance?.codigoTag}"/>
					<span class="help-inline">${hasErrors(bean: tagInstance, field: 'codigoTag', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tagInstance, field: 'memoriaUsuario', 'error')} ">
				<label for="memoriaUsuario" class="control-label"><g:message code="tag.memoriaUsuario.label" default="Memoria Usuario" /></label>
				<div class="controls">
					<g:textArea name="memoriaUsuario" cols="40" rows="5" maxlength="10000" value="${tagInstance?.memoriaUsuario}"/>
					<span class="help-inline">${hasErrors(bean: tagInstance, field: 'memoriaUsuario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tagInstance, field: 'estado', 'error')} required">
				<label for="estado" class="control-label"><g:message code="tag.estado.label" default="Estado" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="estado" name="estado.id" from="${org.control.tag.EstadoTag.list()}" optionKey="id" required="" value="${tagInstance?.estado?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: tagInstance, field: 'estado', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tagInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="tag.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="10000" value="${tagInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: tagInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: tagInstance, field: 'usuario', 'error')} ">
				<label for="usuario" class="control-label"><g:message code="tag.usuario.label" default="Usuario" /></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.control.User.list()}" optionKey="id" value="${tagInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: tagInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

