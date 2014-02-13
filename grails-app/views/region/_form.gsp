<%@ page import="org.gym.ubicacion.Region" %>



			<div class="control-group fieldcontain ${hasErrors(bean: regionInstance, field: 'nombre', 'error')} ">
				<label for="nombre" class="control-label"><g:message code="region.nombre.label" default="Nombre" /></label>
				<div class="controls">
					<g:textField name="nombre" value="${regionInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: regionInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: regionInstance, field: 'numero', 'error')} ">
				<label for="numero" class="control-label"><g:message code="region.numero.label" default="Numero" /></label>
				<div class="controls">
					<g:textField name="numero" value="${regionInstance?.numero}"/>
					<span class="help-inline">${hasErrors(bean: regionInstance, field: 'numero', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: regionInstance, field: 'provincias', 'error')} ">
				<label for="provincias" class="control-label"><g:message code="region.provincias.label" default="Provincias" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${regionInstance?.provincias?}" var="p">
    <li><g:link controller="provincia" action="show" id="${p.id}">${p}</g:link></li>
</g:each>
<li class="add">
<g:link controller="provincia" action="create" params="['region.id': regionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'provincia.label', default: 'Provincia')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: regionInstance, field: 'provincias', 'error')}</span>
				</div>
			</div>

