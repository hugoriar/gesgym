<%@ page import="org.control.ubicacion.Provincia" %>



			<div class="control-group fieldcontain ${hasErrors(bean: provinciaInstance, field: 'comunas', 'error')} ">
				<label for="comunas" class="control-label"><g:message code="provincia.comunas.label" default="Comunas" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${provinciaInstance?.comunas?}" var="c">
    <li><g:link controller="comuna" action="show" id="${c.id}">${c}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comuna" action="create" params="['provincia.id': provinciaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comuna.label', default: 'Comuna')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: provinciaInstance, field: 'comunas', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: provinciaInstance, field: 'nombre', 'error')} ">
				<label for="nombre" class="control-label"><g:message code="provincia.nombre.label" default="Nombre" /></label>
				<div class="controls">
					<g:textField name="nombre" value="${provinciaInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: provinciaInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: provinciaInstance, field: 'region', 'error')} required">
				<label for="region" class="control-label"><g:message code="provincia.region.label" default="Region" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="region" name="region.id" from="${org.control.ubicacion.Region.list()}" optionKey="id" required="" value="${provinciaInstance?.region?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: provinciaInstance, field: 'region', 'error')}</span>
				</div>
			</div>

