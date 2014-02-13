<%@ page import="org.gym.ubicacion.Comuna" %>



			<div class="control-group fieldcontain ${hasErrors(bean: comunaInstance, field: 'ciudades', 'error')} ">
				<label for="ciudades" class="control-label"><g:message code="comuna.ciudades.label" default="Ciudades" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${comunaInstance?.ciudades?}" var="c">
    <li><g:link controller="ciudad" action="show" id="${c.id}">${c}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ciudad" action="create" params="['comuna.id': comunaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ciudad.label', default: 'Ciudad')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: comunaInstance, field: 'ciudades', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: comunaInstance, field: 'nombre', 'error')} ">
				<label for="nombre" class="control-label"><g:message code="comuna.nombre.label" default="Nombre" /></label>
				<div class="controls">
					<g:textField name="nombre" value="${comunaInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: comunaInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: comunaInstance, field: 'provincia', 'error')} required">
				<label for="provincia" class="control-label"><g:message code="comuna.provincia.label" default="Provincia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="provincia" name="provincia.id" from="${org.gym.ubicacion.Provincia.list()}" optionKey="id" required="" value="${comunaInstance?.provincia?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: comunaInstance, field: 'provincia', 'error')}</span>
				</div>
			</div>

