<%@ page import="org.gym.Parentesco" %>



			<div class="control-group fieldcontain ${hasErrors(bean: parentescoInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="parentesco.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${parentescoInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: parentescoInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: parentescoInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="parentesco.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" value="${parentescoInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: parentescoInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

