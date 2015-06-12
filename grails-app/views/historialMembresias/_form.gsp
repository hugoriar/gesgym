<%@ page import="org.control.User; org.control.HistorialMembresias" %>


            <div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'plan', 'error')} required">
                <label for="plan" class="control-label"><g:message code="historialMembresias.plan.label" default="Plan: " /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <g:select id="plan" name="plan.id" from="${org.control.Plan.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.plan?.id}" class="many-to-one"
                              onchange="
                              ${remoteFunction(
                                      controller: 'historialMembresias',
                                      action: 'refreshDiasCongelacion',
                                      params: '\'plan.id=\' + this.value',
                                      update : 'divDiascongelacion'
                              )};
                              ${remoteFunction(
                                      controller: 'historialMembresias',
                                      action: 'refreshDiasMembresia',
                                      params: '\'plan.id=\' + this.value',
                                      update : 'divDiasmembresia',
                              )};
                              ${remoteFunction(
                                      controller: 'historialMembresias',
                                      action: 'refreshFechaFin',
                                      params: '\'plan.id=\'+this.value+\'&fechaInicio=\'+this.form.fechaInicio.value',
                                      update : 'divFechaFin',
                              )};"
                    />
                </div>
            </div>

            <div id="divDiascongelacion">
                <g:render template="/historialMembresias/diasCongelacion" model="[diasCongelacion: org.control.Plan.get(historialMembresiasInstance.plan?historialMembresiasInstance.plan.id:1).diasCongelacion]"/>
            </div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'promocionDeMatricula', 'error')} ">
				<label for="promocionDeMatricula" class="control-label"><g:message code="historialMembresias.promocionDeMatricula.label" default="Promocion De Matricula" /></label>
				<div class="controls">
					<g:select id="promocionDeMatricula" name="promocionDeMatricula.id" from="${org.control.PromocionMatricula.list()}" optionKey="id" value="${historialMembresiasInstance?.promocionDeMatricula?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'promocionDeMatricula', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'fechaInicio', 'error')} required">
				<label for="fechaInicio" class="control-label"><g:message code="historialMembresias.fechaInicio.label" default="Fecha Inicio" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaInicio" id="fechaInicio" precision="day"  value="${historialMembresiasInstance?.fechaInicio}"  />
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'fechaInicio', 'error')}</span>
				</div>
			</div>

            <div id="divFechaFin">
                <g:render template="/historialMembresias/fechaFin"/>
            </div>

            <div id="divDiasmembresia">
                <g:render template="/historialMembresias/diasMembresia" model="[diasMembresia: org.control.Plan.get(historialMembresiasInstance.plan?historialMembresiasInstance.plan.id:1).diasMembresia]"/>
            </div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'autorizadoPor', 'error')} required">
				<label for="autorizadoPor" class="control-label"><g:message code="historialMembresias.autorizadoPor.label" default="Autorizado Por" /><span class="required-indicator">*</span></label>
				<div class="controls">
					%{--<g:select id="autorizadoPor" name="autorizadoPor.id" from="${org.control.UserPersonal.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.autorizadoPor?.id}" class="many-to-one"/>--}%
                    <g:textField name="autorizadoPor" value="${User.get(sec.loggedInUserInfo(field: 'id') as Long)}" disabled="disabled"/>
                    <g:hiddenField name="autorizadoPor.id" value="${sec.loggedInUserInfo(field: 'id')}"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'autorizadoPor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'inicioBonificacion', 'error')} ">
				<label for="inicioBonificacion" class="control-label"><g:message code="historialMembresias.inicioBonificacion.label" default="Inicio Bonificacion" /></label>
				<div class="controls">
					<bs:datePicker name="inicioBonificacion" precision="day"  value="${historialMembresiasInstance?.inicioBonificacion}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'inicioBonificacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'finBonificacion', 'error')} ">
				<label for="finBonificacion" class="control-label"><g:message code="historialMembresias.finBonificacion.label" default="Fin Bonificacion" /></label>
				<div class="controls">
					<bs:datePicker name="finBonificacion" precision="day"  value="${historialMembresiasInstance?.finBonificacion}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'finBonificacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'personalTrainerAsignado', 'error')} ">
				<label for="personalTrainerAsignado" class="control-label"><g:message code="historialMembresias.personalTrainerAsignado.label" default="Personal Trainer Asignado" /></label>
				<div class="controls">
					<g:select id="personalTrainerAsignado" name="personalTrainerAsignado.id" from="${org.control.UserPersonalInstructor.list()}" optionKey="id" value="${historialMembresiasInstance?.personalTrainerAsignado?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'personalTrainerAsignado', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'pago', 'error')} required">
				<label for="pago" class="control-label"><g:message code="historialMembresias.pago.label" default="Pago" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="pago" name="pago.id" from="${org.control.Pago.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.pago?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'pago', 'error')}</span>
				</div>
			</div>--}%

%{--			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'matriculaMembresia', 'error')} required">
				<label for="matricula" class="control-label"><g:message code="historialMembresias.matricula.label" default="Matricula Membresia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="matricula" name="matricula.id" from="${org.control.Matricula.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.matricula?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'matricula', 'error')}</span>
				</div>
			</div>--}%

			%{--<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="historialMembresias.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.control.UserSocio.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>--}%

