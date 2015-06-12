<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'diasCongelacion', 'error')} required">
    <label for="diasCongelacion" class="control-label"><g:message code="historialMembresias.diasCongelacion.label" default="Dias Congelacion" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:field type="number" name="diasCongelacion" id="diasCongelacion" required="" value="${diasCongelacion}"/>
        <span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'diasCongelacion', 'error')}</span>
    </div>
</div>