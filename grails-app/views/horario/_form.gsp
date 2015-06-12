<%@ page import="org.control.calendario.Horario" %>


            <div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'nombre', 'error')} required">
                <label for="nombre" class="control-label"><g:message code="cursoEspecial.nombre.label" default="Curso" /></label>
                <div class="controls">
                    <g:textField disabled="disabled" name="nombre" required="" value="${cursoEspecialInstance?.nombre}"/>
                    <g:hiddenField name="curso.id" value="${cursoEspecialInstance?.id}"/>
                    <span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'nombre', 'error')}</span>
                </div>
            </div>

            <div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="horario.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${horarioInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: horarioInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

%{--			<div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'curso', 'error')} required">
				<label for="curso" class="control-label"><g:message code="horario.curso.label" default="Curso" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="curso" name="curso.id" from="${org.control.CursoEspecial.list()}" optionKey="id" required="" value="${horarioInstance?.curso?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: horarioInstance, field: 'curso', 'error')}</span>
				</div>
			</div>--}%

			%{--<div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'usuario', 'error')} ">
				<label for="usuario" class="control-label"><g:message code="horario.usuario.label" default="Usuario" /></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.control.User.list()}" optionKey="id" value="${horarioInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: horarioInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>--}%

			%{--<div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'fechas', 'error')} ">
				<label for="fechas" class="control-label"><g:message code="horario.fechas.label" default="Fechas" /></label>
				<div class="controls">
                    <ul class="one-to-many">
                        <g:each in="${horarioInstance?.fechas?}" var="f">
                            <li><g:link controller="eventRec" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                        </g:each>
                        <li class="add">
                            <g:link controller="eventRec" action="create" params="['horario.id': horarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'eventRec.label', default: 'EventRec')])}</g:link>
                        </li>
                    </ul>
					<span class="help-inline">${hasErrors(bean: horarioInstance, field: 'fechas', 'error')}</span>
				</div>
			</div>--}%

			<div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'color', 'error')} ">
				<label for="color" class="control-label"><g:message code="horario.color.label" default="Color" /></label>
				<div class="controls">
                    <g:textField value="${horarioInstance?.color?:"#1796b0"}" id="color" name="color" class="minicolors" />
					<span class="help-inline">${hasErrors(bean: horarioInstance, field: 'color', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'textColor', 'error')} ">
				<label for="textColor" class="control-label"><g:message code="horario.textColor.label" default="Text Color" /></label>
				<div class="controls">
                    <g:textField value="${horarioInstance?.textColor?:"#ffffff"}" id="textColor" name="textColor" class="minicolors" />
					<span class="help-inline">${hasErrors(bean: horarioInstance, field: 'textColor', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'usuarios', 'error')} ">
				<label for="usuarios" class="control-label"><g:message code="horario.usuarios.label" default="Usuarios" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: horarioInstance, field: 'usuarios', 'error')}</span>
				</div>
			</div>--}%

