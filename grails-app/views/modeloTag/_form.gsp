<%@ page import="org.control.tag.ModeloTag" %>



			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'codigoModeloTag', 'error')} ">
				<label for="codigoModeloTag" class="control-label"><g:message code="modeloTag.codigoModeloTag.label" default="Codigo Modelo Tag" /></label>
				<div class="controls">
					<g:textField name="codigoModeloTag" value="${modeloTagInstance?.codigoModeloTag}"/>
					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'codigoModeloTag', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="modeloTag.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${modeloTagInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'marca', 'error')} required">
				<label for="marca" class="control-label"><g:message code="modeloTag.marca.label" default="Marca" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="marca" name="marca.id" from="${org.control.tag.MarcaTag.list()}" optionKey="id" required="" value="${modeloTagInstance?.marca?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'marca', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'bitsMemoriaEpc', 'error')} ">
				<label for="bitsMemoriaEpc" class="control-label"><g:message code="modeloTag.bitsMemoriaEpc.label" default="Bits Memoria Epc" /></label>
				<div class="controls">
					<g:field type="number" name="bitsMemoriaEpc" value="${modeloTagInstance.bitsMemoriaEpc}"/>
					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'bitsMemoriaEpc', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'bitsMemoriaUsuario', 'error')} ">
				<label for="bitsMemoriaUsuario" class="control-label"><g:message code="modeloTag.bitsMemoriaUsuario.label" default="Bits Memoria Usuario" /></label>
				<div class="controls">
					<g:field type="number" name="bitsMemoriaUsuario" value="${modeloTagInstance.bitsMemoriaUsuario}"/>
					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'bitsMemoriaUsuario', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'foto', 'error')} ">
				<label for="foto" class="control-label"><g:message code="modeloTag.foto.label" default="Foto" /></label>
				<div class="controls">
					<input type="file" id="foto" name="foto" />
					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'foto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="modeloTag.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="10000" value="${modeloTagInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: modeloTagInstance, field: 'tags', 'error')} ">
				<label for="tags" class="control-label"><g:message code="modeloTag.tags.label" default="Tags" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${modeloTagInstance?.tags?}" var="t">
    <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tag" action="create" params="['modeloTag.id': modeloTagInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tag.label', default: 'Tag')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: modeloTagInstance, field: 'tags', 'error')}</span>
				</div>
			</div>

