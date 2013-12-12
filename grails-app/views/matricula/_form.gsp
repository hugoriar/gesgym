<%@ page import="org.gym.Matricula" %>



			<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'fechaMatricula', 'error')} required">
				<label for="fechaMatricula" class="control-label"><g:message code="matricula.fechaMatricula.label" default="Fecha Matricula" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaMatricula" precision="day"  value="${matriculaInstance?.fechaMatricula}"  />
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'fechaMatricula', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'matriculadoPor', 'error')} required">
				<label for="matriculadoPor" class="control-label"><g:message code="matricula.matriculadoPor.label" default="Matriculado Por" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="matriculadoPor" name="matriculadoPor.id" from="${org.gym.UserPersonal.list()}" optionKey="id" required="" value="${matriculaInstance?.matriculadoPor?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'matriculadoPor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'referidoPor', 'error')} ">
				<label for="referidoPor" class="control-label"><g:message code="matricula.referidoPor.label" default="Referido Por" /></label>
				<div class="controls">
					<g:select id="referidoPor" name="referidoPor.id" from="${org.gym.UserSocio.list()}" optionKey="id" value="${matriculaInstance?.referidoPor?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'referidoPor', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'socio', 'error')} required">
				<label for="socio" class="control-label"><g:message code="matricula.socio.label" default="Socio" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="socio" name="socio.id" from="${org.gym.UserSocio.list()}" optionKey="id" required="" value="${matriculaInstance?.socio?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'socio', 'error')}</span>
				</div>
			</div>--}%

