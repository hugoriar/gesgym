<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'fechaFin', 'error')} required">
    <label for="fechaFin" class="control-label"><g:message code="historialMembresias.fechaFin.label" default="Fecha Fin" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <bs:datePicker name="fechaFin" precision="day"  value="${fechaFin?:historialMembresiasInstance?.fechaFin}"  /> %{--<g:checkBox name="sumarCongelacion" onchange="javascipt= this.fechaFin.value =+ this.diasCongelacion.value"/> sumar días de congelacion--}%
        <span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'fechaFin', 'error')}</span>
    </div>
</div>