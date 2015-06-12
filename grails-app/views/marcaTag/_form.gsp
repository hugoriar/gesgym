<%@ page import="org.control.tag.MarcaTag" %>



			<div class="control-group fieldcontain ${hasErrors(bean: marcaTagInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="marcaTag.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${marcaTagInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: marcaTagInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: marcaTagInstance, field: 'modelosTags', 'error')} ">
				<label for="modelosTags" class="control-label"><g:message code="marcaTag.modelosTags.label" default="Modelos Tags" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${marcaTagInstance?.modelosTags?}" var="m">
    <li><g:link controller="modeloTag" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="modeloTag" action="create" params="['marcaTag.id': marcaTagInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'modeloTag.label', default: 'ModeloTag')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: marcaTagInstance, field: 'modelosTags', 'error')}</span>
				</div>
			</div>

