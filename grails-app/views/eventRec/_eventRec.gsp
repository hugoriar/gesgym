<%@ page import="org.control.calendario.EventRec" %>



<div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'horario', 'error')} ">
    <label for="horario" class="control-label"><g:message code="cursoEspecial.horario.label" default="Los días" /></label>
    <div class="controls">
        <g:select id="diaSemana" name="diaSemana.id" from="${listDiasSemana}" class="many-to-one"/>
        de
        <g:select id="horasDesde" name="horasDesde.id" from="${7..23}" class="many-to-one" style="width:64px;"/>:
        <g:select id="minutosDesde" name="minutosDesde.id" from="${["00",15,30,45]}" class="many-to-one" style="width:64px;"/>
    hasta las
        <g:select id="horasHasta" name="horasHasta.id" from="${7..23}" class="many-to-one" style="width:64px;"/>:
        <g:select id="minutosHasta" name="minutosHasta.id" from="${["00",15,30,45]}" class="many-to-one" style="width:64px;"/>

        <g:textField value="${horarioInstance?.color?:"#1796b0"}" id="color" name="color" class="minicolors" />
        <g:textField value="${horarioInstance?.textColor?:"#ffffff"}" id="textColor" name="textColor" class="minicolors"/>
        <span class="help-inline">${hasErrors(bean: cursoEspecialInstance, field: 'horario', 'error')}</span>
    </div>
</div>

%{--

<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'event_length', 'error')} required">
    <label for="event_length" class="control-label"><g:message code="eventRec.event_length.label" default="Eventlength" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:field type="number" name="event_length" required="" value="${eventRecInstance?.event_length}"/>
        <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'event_length', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'rec_type', 'error')} ">
    <label for="rec_type" class="control-label"><g:message code="eventRec.rec_type.label" default="Rectype" /></label>
    <div class="controls">
        <g:textField name="rec_type" value="${eventRecInstance?.rec_type}"/>
        <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'rec_type', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'start_date', 'error')} required">
    <label for="start_date" class="control-label"><g:message code="eventRec.start_date.label" default="Startdate" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <bs:datePicker name="start_date" precision="month"  value="${eventRecInstance?.start_date}"  />
        <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'start_date', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'end_date', 'error')} required">
    <label for="end_date" class="control-label"><g:message code="eventRec.end_date.label" default="Enddate" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <bs:datePicker name="end_date" precision="hour"  value="${eventRecInstance?.end_date}"  />
        <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'end_date', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'text', 'error')} ">
    <label for="text" class="control-label"><g:message code="eventRec.text.label" default="Text" /></label>
    <div class="controls">
        <g:textField name="text" value="${eventRecInstance?.text}"/>
        <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'text', 'error')}</span>
    </div>
</div>

--}%
