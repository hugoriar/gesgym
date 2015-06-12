<%@ page import="org.control.Ocupacion" %>



			<div class="control-group fieldcontain ${hasErrors(bean: ocupacionInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="ocupacion.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textField name="descripcion" value="${ocupacionInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: ocupacionInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: ocupacionInstance, field: 'nombre', 'error')} ">
				<label for="nombre" class="control-label"><g:message code="ocupacion.nombre.label" default="Nombre" /></label>
				<div class="controls">
					<g:textField name="nombre" value="${ocupacionInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: ocupacionInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

