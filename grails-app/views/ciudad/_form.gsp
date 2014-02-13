<%@ page import="org.gym.ubicacion.Ciudad" %>



			<div class="control-group fieldcontain ${hasErrors(bean: ciudadInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="ciudad.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${ciudadInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: ciudadInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ciudadInstance, field: 'comuna', 'error')} required">
				<label for="comuna" class="control-label"><g:message code="ciudad.comuna.label" default="Comuna" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="comuna" name="comuna.id" from="${org.gym.ubicacion.Comuna.list()}" optionKey="id" required="" value="${ciudadInstance?.comuna?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: ciudadInstance, field: 'comuna', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ciudadInstance, field: 'sectores', 'error')} ">
				<label for="sectores" class="control-label"><g:message code="ciudad.sectores.label" default="Sectores" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${ciudadInstance?.sectores?}" var="s">
    <li><g:link controller="sector" action="show" id="${s.id}">${s}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sector" action="create" params="['ciudad.id': ciudadInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sector.label', default: 'Sector')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: ciudadInstance, field: 'sectores', 'error')}</span>
				</div>
			</div>

