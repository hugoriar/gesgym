<%@ page import="org.gym.Banco" %>



			<div class="control-group fieldcontain ${hasErrors(bean: bancoInstance, field: 'nombreBanco', 'error')} ">
				<label for="nombreBanco" class="control-label"><g:message code="banco.nombreBanco.label" default="Nombre Banco" /></label>
				<div class="controls">
					<g:textField name="nombreBanco" value="${bancoInstance?.nombreBanco}"/>
					<span class="help-inline">${hasErrors(bean: bancoInstance, field: 'nombreBanco', 'error')}</span>
				</div>
			</div>

