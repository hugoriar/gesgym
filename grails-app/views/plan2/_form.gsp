<%@ page import="org.control.Plan" %>



			<div class="control-group fieldcontain ${hasErrors(bean: planInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="plan.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${planInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: planInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: planInstance, field: 'diasCongelacion', 'error')} required">
				<label for="diasCongelacion" class="control-label"><g:message code="plan.diasCongelacion.label" default="Dias de Congelacion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="diasCongelacion" required="" value="${planInstance?.diasCongelacion?:0L}" />
					<span class="help-inline">${hasErrors(bean: planInstance, field: 'diasCongelacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: planInstance, field: 'fechaInicioVigencia', 'error')} required">
				<label for="fechaInicioVigencia" class="control-label"><g:message code="plan.fechaInicioVigencia.label" default="Fecha Inicio Vigencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaInicioVigencia" precision="day"  value="${planInstance?.fechaInicioVigencia}"  />
					<span class="help-inline">${hasErrors(bean: planInstance, field: 'fechaInicioVigencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: planInstance, field: 'fechaTerminoVigencia', 'error')} required">
				<label for="fechaTerminoVigencia" class="control-label"><g:message code="plan.fechaTerminoVigencia.label" default="Fecha Termino Vigencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaTerminoVigencia" precision="day"  value="${planInstance?.fechaTerminoVigencia}"  />
					<span class="help-inline">${hasErrors(bean: planInstance, field: 'fechaTerminoVigencia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: planInstance, field: 'valor', 'error')} required">
				<label for="valor" class="control-label"><g:message code="plan.valor.label" default="Valor" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="valor" required="" value="${planInstance.valor}"/>
					<span class="help-inline">${hasErrors(bean: planInstance, field: 'valor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: planInstance, field: 'descripcion', 'error')} required">
				<label for="descripcion" class="control-label"><g:message code="plan.descripcion.label" default="Descripcion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" required="" value="${planInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: planInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: planInstance, field: 'vigente', 'error')} ">
				<label for="vigente" class="control-label"><g:message code="plan.vigente.label" default="Vigente" /></label>
				<div class="controls">
					<bs:checkBox name="vigente" value="${planInstance?.vigente}" />
					<span class="help-inline">${hasErrors(bean: planInstance, field: 'vigente', 'error')}</span>
				</div>
			</div>

