<%@ page import="org.control.Plan" %>



<div class="fieldcontain ${hasErrors(bean: membresiaInstance, field: 'nombre', 'error')} required">
    <label for="nombre">
        <g:message code="membresia.nombre.label" default="Nombre"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombre" required="" value="${membresiaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membresiaInstance, field: 'fechaInicioVigencia', 'error')} required">
    <label for="fechaInicioVigencia">
        <g:message code="membresia.fechaInicioVigencia.label" default="Fecha Inicio Vigencia"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaInicioVigencia" precision="day" value="${membresiaInstance?.fechaInicioVigencia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membresiaInstance, field: 'fechaTerminoVigencia', 'error')} required">
    <label for="fechaTerminoVigencia">
        <g:message code="membresia.fechaTerminoVigencia.label" default="Fecha Termino Vigencia"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaTerminoVigencia" precision="day" value="${membresiaInstance?.fechaTerminoVigencia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membresiaInstance, field: 'descripcion', 'error')} required">
    <label for="descripcion">
        <g:message code="membresia.descripcion.label" default="Descripcion"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="descripcion" cols="40" rows="5" maxlength="1000" required=""
                value="${membresiaInstance?.descripcion}"/>
</div>

