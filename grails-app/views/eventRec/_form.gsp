<%@ page import="org.joda.time.DateTime; org.control.calendario.EventRec" %>





			%{--<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'event_length', 'error')} required">
				<label for="event_length" class="control-label"><g:message code="eventRec.event_length.label" default="Eventlength" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="event_length" required="" value="${eventRecInstance?.event_length}"/>
					<span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'event_length', 'error')}</span>
				</div>
			</div>--}%

			%{--<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'rec_type', 'error')} ">
				<label for="rec_type" class="control-label"><g:message code="eventRec.rec_type.label" default="Rectype" /></label>
				<div class="controls">
					<g:textField name="rec_type" value="${eventRecInstance?.rec_type}"/>--}%
					%{--<g:hiddenField name="rec_type" value="week_1___1#no"/>--}%
					%{--<span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'rec_type', 'error')}</span>
				</div>
			</div>--}%

			%{--<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'start_date', 'error')} required">
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
            </div>--}%

            <g:hiddenField name="horarioInstanceId" value="${horarioInstance?.id}"/>

			<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'text', 'error')} ">
				<label for="text" class="control-label"><g:message code="eventRec.text.label" default="Curso" /></label>
				<div class="controls">
					<g:textField name="nombreCurso" readonly="readonly" value="${cursoEspecialInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'text', 'error')}</span>
				</div>
			</div>

            <div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'text', 'error')} ">
				<label for="text" class="control-label"><g:message code="eventRec.text.label" default="Horario" /></label>
				<div class="controls">
					<g:textField name="nombre" readonly="readonly" value="${horarioInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'text', 'error')}</span>
				</div>
			</div>

            <div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'text', 'error')} ">
                <label for="text" class="control-label"><g:message code="eventRec.text.label" default="Descripción" /></label>
                <div class="controls">
                    <g:textArea name="text" cols="40" rows="5" maxlength="255" required="" value="${cursoEspecialInstance?.nombre} - ${horarioInstance?.nombre}"/>
                    <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'text', 'error')}</span>
                </div>
            </div>

            %{--<div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'text', 'error')} ">
                <label for="text" class="control-label"><g:message code="eventRec.text.label" default="Color" /></label>
                <div class="controls">
                    <g:textField value="${horarioInstance?.color?:"#1796b0"}" id="color" name="color" class="minicolors" />
                    <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'text', 'error')}</span>
                </div>
            </div>

            <div class="control-group fieldcontain ${hasErrors(bean: eventRecInstance, field: 'text', 'error')} ">
                <label for="text" class="control-label"><g:message code="eventRec.text.label" default="Color de Texto" /></label>
                <div class="controls">
                    <g:textField value="${horarioInstance?.textColor?:"#ffffff"}" id="textColor" name="textColor" class="minicolors"/>
                    <span class="help-inline">${hasErrors(bean: eventRecInstance, field: 'text', 'error')}</span>
                </div>
            </div>--}%

<g:render template="eventRec"/>

<fieldset class="form">
    <legend>Días ya ingresados</legend>
</fieldset>


            <div class="control-group fieldcontain ${hasErrors(bean: cursoEspecialInstance, field: 'horario', 'error')} ">
                <%
                    DateTime desde
                    DateTime hasta
                %>
                <g:each in="${horarioInstance.fechas?.sort{it.start_date.day}}" var="f">
                    <%
                        desde = new DateTime(f.start_date)
                        hasta = new DateTime(f.end_date)
                    %>
                    <label for="horario" class="control-label"><g:message code="cursoEspecial.horario.label" default="Los días" /></label>
                    <div class="controls">
                        <g:textField name="diaSemana" value="${desde.dayOfWeek().asText?.toUpperCase()}" disabled="disabled"/>
                        de
                        <g:textField name="horasDesde" value="${desde.hourOfDay}" style="width:50px;" disabled="disabled"/>:
                        <g:textField name="minutosDesde" value="${(desde.minuteOfHour<10?"0":"")+desde.minuteOfHour}" style="width:50px;" disabled="disabled"/>
                        hasta las
                        <g:textField name="horasHasta" value="${hasta.hourOfDay}" style="width:50px;" disabled="disabled"/>:
                        <g:textField name="minutosHasta" value="${(hasta.minuteOfHour<10?"0":"")+hasta.minuteOfHour}" style="width:50px;" disabled="disabled"/>
                        <g:textField value="${f?.color?:"#1796b0"}" id="color" name="color" class="minicolors" disabled="disabled"/>
                        <g:textField value="${f?.textColor?:"#ffffff"}" id="textColor" name="textColor" class="minicolors" disabled="disabled"/>
                    </div>
                </g:each>
            </div>





%{--
<div class="controls">
    <table id="myTable">
        <fieldset class="form">
            <tbody>
            --}%
%{--<tr><g:render template="adjunto"/></tr>--}%%{--

            </tbody>
        </fieldset>
    </table>
    <g:hiddenField name="contador" value="${contAdjuntos}"/>
    <a class="action" href="javascript:addRow('myTable')" onclick="addRow('myTable'); return false" title="Add new row">+ Añadir día</a><br/>

    <span class="help-inline">${hasErrors(bean: emailInstance, field: 'adjuntos', 'error')}</span>
</div>--}%
