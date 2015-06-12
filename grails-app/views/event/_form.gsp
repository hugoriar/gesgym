<%@ page import="org.control.calendario.Event" %>



			<div class="control-group fieldcontain ${hasErrors(bean: eventInstance, field: 'end_date', 'error')} required">
				<label for="end_date" class="control-label"><g:message code="event.end_date.label" default="Enddate" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="end_date" precision="day"  value="${eventInstance?.end_date}"  />
					<span class="help-inline">${hasErrors(bean: eventInstance, field: 'end_date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: eventInstance, field: 'start_date', 'error')} required">
				<label for="start_date" class="control-label"><g:message code="event.start_date.label" default="Startdate" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="start_date" precision="day"  value="${eventInstance?.start_date}"  />
					<span class="help-inline">${hasErrors(bean: eventInstance, field: 'start_date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: eventInstance, field: 'text', 'error')} ">
				<label for="text" class="control-label"><g:message code="event.text.label" default="Text" /></label>
				<div class="controls">
					<g:textField name="text" value="${eventInstance?.text}"/>
					<span class="help-inline">${hasErrors(bean: eventInstance, field: 'text', 'error')}</span>
				</div>
			</div>

