<%@ page import="org.control.CursoEspecial" %>



			<div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="cursoEspecial.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${cursoEspecialInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'descripcion', 'error')} required">
				<label for="descripcion" class="control-label"><g:message code="cursoEspecial.descripcion.label" default="Descripcion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" required="" value="${cursoEspecialInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'vigente', 'error')} ">
				<label for="vigente" class="control-label"><g:message code="cursoEspecial.vigente.label" default="Vigente" /></label>
				<div class="controls">
					<bs:checkBox name="vigente" value="${cursoEspecialInstance?.vigente}" />
					<span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'vigente', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'foto', 'error')} ">
				<label for="foto" class="control-label"><g:message code="cursoEspecial.foto.label" default="Foto" /></label>
				<div class="controls">
					<input type="file" id="foto" name="foto" />
					<span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'foto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'horario', 'error')} ">
				<label for="horario" class="control-label"><g:message code="cursoEspecial.horario.label" default="Horario" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${cursoEspecialInstance?.horario?}" var="h">
    <li><g:link controller="horario" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="horario" action="create" params="['cursoEspecial.id': cursoEspecialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'horario.label', default: 'Horario')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'horario', 'error')}</span>
				</div>
			</div>

