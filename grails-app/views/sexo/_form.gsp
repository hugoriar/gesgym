<%@ page import="org.gym.Sexo" %>



<div class="fieldcontain ${hasErrors(bean: sexoInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="sexo.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sexo" required="" value="${sexoInstance?.sexo}"/>
</div>

