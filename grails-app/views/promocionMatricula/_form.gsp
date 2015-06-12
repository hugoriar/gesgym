<%@ page import="org.control.PromocionMatricula" %>



			<div class="control-group fieldcontain ${hasErrors(bean: promocionMatriculaInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="promocionMatricula.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${promocionMatriculaInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: promocionMatriculaInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: promocionMatriculaInstance, field: 'fechaInicioVigencia', 'error')} required">
				<label for="fechaInicioVigencia" class="control-label"><g:message code="promocionMatricula.fechaInicioVigencia.label" default="Fecha Inicio Vigencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaInicioVigencia" precision="day"  value="${promocionMatriculaInstance?.fechaInicioVigencia}"  />
					<span class="help-inline">${hasErrors(bean: promocionMatriculaInstance, field: 'fechaInicioVigencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: promocionMatriculaInstance, field: 'fechaTerminoVigencia', 'error')} required">
				<label for="fechaTerminoVigencia" class="control-label"><g:message code="promocionMatricula.fechaTerminoVigencia.label" default="Fecha Termino Vigencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaTerminoVigencia" precision="day"  value="${promocionMatriculaInstance?.fechaTerminoVigencia}"  />
					<span class="help-inline">${hasErrors(bean: promocionMatriculaInstance, field: 'fechaTerminoVigencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: promocionMatriculaInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="promocionMatricula.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" value="${promocionMatriculaInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: promocionMatriculaInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: promocionMatriculaInstance, field: 'vigente', 'error')} ">
				<label for="vigente" class="control-label"><g:message code="promocionMatricula.vigente.label" default="Vigente" /></label>
				<div class="controls">
					<bs:checkBox name="vigente" value="${promocionMatriculaInstance?.vigente}" />
					<span class="help-inline">${hasErrors(bean: promocionMatriculaInstance, field: 'vigente', 'error')}</span>
				</div>
			</div>

