<%@ page import="org.gym.HistorialMembresias" %>



			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'plan', 'error')} required">
				<label for="plan" class="control-label"><g:message code="historialMembresias.plan.label" default="Plan" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="plan" name="plan.id" from="${org.gym.Plan.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.plan?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'plan', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'diasCongelacion', 'error')} required">
				<label for="diasCongelacion" class="control-label"><g:message code="historialMembresias.diasCongelacion.label" default="Dias Congelacion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="diasCongelacion" required="" value="${historialMembresiasInstance.diasCongelacion}"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'diasCongelacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'promocionDeMatricula', 'error')} ">
				<label for="promocionDeMatricula" class="control-label"><g:message code="historialMembresias.promocionDeMatricula.label" default="Promocion De Matricula" /></label>
				<div class="controls">
					<g:select id="promocionDeMatricula" name="promocionDeMatricula.id" from="${org.gym.PromocionMatricula.list()}" optionKey="id" value="${historialMembresiasInstance?.promocionDeMatricula?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'promocionDeMatricula', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'fechaInicio', 'error')} required">
				<label for="fechaInicio" class="control-label"><g:message code="historialMembresias.fechaInicio.label" default="Fecha Inicio" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaInicio" precision="day"  value="${historialMembresiasInstance?.fechaInicio}"  />
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'fechaInicio', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'fechaFin', 'error')} required">
				<label for="fechaFin" class="control-label"><g:message code="historialMembresias.fechaFin.label" default="Fecha Fin" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaFin" precision="day"  value="${historialMembresiasInstance?.fechaFin}"  />
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'fechaFin', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'autorizadoPor', 'error')} required">
				<label for="autorizadoPor" class="control-label"><g:message code="historialMembresias.autorizadoPor.label" default="Autorizado Por" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="autorizadoPor" name="autorizadoPor.id" from="${org.gym.UserPersonal.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.autorizadoPor?.id}" class="many-to-one"/>
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
					<g:select id="personalTrainerAsignado" name="personalTrainerAsignado.id" from="${org.gym.UserPersonalInstructor.list()}" optionKey="id" value="${historialMembresiasInstance?.personalTrainerAsignado?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'personalTrainerAsignado', 'error')}</span>
				</div>
			</div>

%{--
			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'pago', 'error')} required">
				<label for="pago" class="control-label"><g:message code="historialMembresias.pago.label" default="Pago" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="pago" name="pago.id" from="${org.gym.Pago.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.pago?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'pago', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: historialMembresiasInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="historialMembresias.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="usuario" name="usuario.id" from="${org.gym.UserSocio.list()}" optionKey="id" required="" value="${historialMembresiasInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: historialMembresiasInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

--}%
