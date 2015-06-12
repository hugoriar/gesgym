<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'cantidadDias', 'error')} required">
    <label for="cantDias" class="control-label"><g:message code="historialMembresias.cantidadDias.label" default="Cantidad de Días" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:field type="number" name="cantDias" id="cantDias" style="background-color: #eeeeee;" required="" value="${diasMembresia}" onChange="refreshFechaFin(this.value);" onUpdate="refreshFechaFin(this.value);"/>
    </div>
</div>
