<%@ page import="org.control.fichaMedica.FichaMedica" %>



<div class="fieldcontain ${hasErrors(bean: fichaMedicaInstance, field: 'condicionesMedicas', 'error')} ">
	<label for="condicionesMedicas">
		<g:message code="fichaMedica.condicionesMedicas.label" default="Condiciones Medicas" />
		
	</label>
	<g:select name="condicionesMedicas" from="${org.control.fichaMedica.CondicionMedica.list()}" multiple="multiple" optionKey="id" size="5" value="${fichaMedicaInstance?.condicionesMedicas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fichaMedicaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="fichaMedica.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${org.control.User.list()}" optionKey="id" required="" value="${fichaMedicaInstance?.usuario?.id}" class="many-to-one"/>
</div>

