<%@ page import="org.control.UserPersonalInstructor" %>



			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'username', 'error')} ">
				<label for="username" class="control-label"><g:message code="userPersonalInstructor.username.label" default="Username" /></label>
				<div class="controls">
					<g:textField name="username" value="${userPersonalInstructorInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'password', 'error')} ">
				<label for="password" class="control-label"><g:message code="userPersonalInstructor.password.label" default="Password" /></label>
				<div class="controls">
					<g:field type="password" name="password" value="${userPersonalInstructorInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'password', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="userPersonalInstructor.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${userPersonalInstructorInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'apellidoPaterno', 'error')} required">
				<label for="apellidoPaterno" class="control-label"><g:message code="userPersonalInstructor.apellidoPaterno.label" default="Apellido Paterno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoPaterno" required="" value="${userPersonalInstructorInstance?.apellidoPaterno}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'apellidoPaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'apellidoMaterno', 'error')} required">
				<label for="apellidoMaterno" class="control-label"><g:message code="userPersonalInstructor.apellidoMaterno.label" default="Apellido Materno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoMaterno" required="" value="${userPersonalInstructorInstance?.apellidoMaterno}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'apellidoMaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'rut', 'error')} required">
				<label for="rut" class="control-label"><g:message code="userPersonalInstructor.rut.label" default="Rut" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="rut" required="" value="${userPersonalInstructorInstance.rut}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'rut', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'dv', 'error')} required">
				<label for="dv" class="control-label"><g:message code="userPersonalInstructor.dv.label" default="Dv" /><span class="required-indicator">*</span></label>
				<div class="controls">
                    <g:textField name="dv" required="" value="${userPersonalInstructorInstance?.dv}"/>
                    <span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'dv', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'foto', 'error')} ">
				<label for="foto" class="control-label"><g:message code="userPersonalInstructor.foto.label" default="Foto" /></label>
				<div class="controls">
					<input type="file" id="foto" name="foto" />
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'foto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'fechaNacimiento', 'error')} required">
				<label for="fechaNacimiento" class="control-label"><g:message code="userPersonalInstructor.fechaNacimiento.label" default="Fecha Nacimiento" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaNacimiento" precision="day"  value="${userPersonalInstructorInstance?.fechaNacimiento}"  noSelection="['': '']" constraints="[nullable:false, blank:false]" />
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'fechaNacimiento', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="userPersonalInstructor.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sexo" name="sexo.id" from="${org.control.Sexo.list()}" optionKey="id" required="" value="${userPersonalInstructorInstance?.sexo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'fono', 'error')} ">
				<label for="fono" class="control-label"><g:message code="userPersonalInstructor.fono.label" default="Fono" /></label>
				<div class="controls">
					<g:field type="number" name="fono" value="${userPersonalInstructorInstance.fono}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'fono', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'fonoCelular', 'error')} required">
				<label for="fonoCelular" class="control-label"><g:message code="userPersonalInstructor.fonoCelular.label" default="Fono Celular" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="fonoCelular" required="" value="${userPersonalInstructorInstance.fonoCelular}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'fonoCelular', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'fonoTrabajo', 'error')} ">
				<label for="fonoTrabajo" class="control-label"><g:message code="userPersonalInstructor.fonoTrabajo.label" default="Fono Trabajo" /></label>
				<div class="controls">
					<g:field type="number" name="fonoTrabajo" value="${userPersonalInstructorInstance.fonoTrabajo}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'fonoTrabajo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'email', 'error')} required">
				<label for="email" class="control-label"><g:message code="userPersonalInstructor.email.label" default="Email" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="email" name="email" required="" value="${userPersonalInstructorInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'email', 'error')}</span>
				</div>
			</div>

%{--			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'domicilio', 'error')} ">
				<label for="domicilio" class="control-label"><g:message code="userPersonalInstructor.domicilio.label" default="Domicilio" /></label>
				<div class="controls">
					<g:select id="domicilio" name="domicilio.id" from="${org.control.DireccionUsuario.list()}" optionKey="id" value="${userPersonalInstructorInstance?.domicilio?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'domicilio', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'condicionMedica', 'error')} ">
				<label for="condicionMedica" class="control-label"><g:message code="userPersonalInstructor.condicionMedica.label" default="Condicion Medica" /></label>
				<div class="controls">
					<g:select id="condicionMedica" name="condicionMedica.id" from="${org.control.fichaMedica.CondicionMedica.list()}" optionKey="id" value="${userPersonalInstructorInstance?.condicionMedica?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'condicionMedica', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'contactoEmergencia', 'error')} required">
				<label for="contactoEmergencia" class="control-label"><g:message code="userPersonalInstructor.contactoEmergencia.label" default="Contacto Emergencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="contactoEmergencia" name="contactoEmergencia.id" from="${org.control.ContactoEmergencia.list()}" optionKey="id" required="" value="${userPersonalInstructorInstance?.contactoEmergencia?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'contactoEmergencia', 'error')}</span>
				</div>
			</div>--}%

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'alumnos', 'error')} ">
				<label for="alumnos" class="control-label"><g:message code="userPersonalInstructor.alumnos.label" default="Alumnos" /></label>
				<div class="controls">
					<g:select name="alumnos" from="${org.control.UserSocio.list()}" multiple="multiple" optionKey="id" size="5" value="${userPersonalInstructorInstance?.alumnos*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'alumnos', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'cargo', 'error')} required">
				<label for="cargo" class="control-label"><g:message code="userPersonalInstructor.cargo.label" default="Cargo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="cargo" name="cargo.id" from="${org.control.CargoInterno.list()}" optionKey="id" required="" value="${userPersonalInstructorInstance?.cargo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'cargo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstructorInstance, field: 'esPersonalTrainer', 'error')} ">
				<label for="esPersonalTrainer" class="control-label"><g:message code="userPersonalInstructor.esPersonalTrainer.label" default="Es Personal Trainer" /></label>
				<div class="controls">
					<bs:checkBox name="esPersonalTrainer" value="${userPersonalInstructorInstance?.esPersonalTrainer}" />
					<span class="help-inline">${hasErrors(bean: userPersonalInstructorInstance, field: 'esPersonalTrainer', 'error')}</span>
				</div>
			</div>



<fieldset class="form">
    <legend>Dirección</legend>
    <g:render template="/direccionUsuario/form"/>
</fieldset>

<fieldset class="form">
    <legend>Contacto de Emergencia</legend>
    <g:render template="/contactoEmergencia/form"/>
</fieldset>

<fieldset class="form">
    <legend>Condición Médica</legend>
    <g:render template="/condicionMedica/form"/>
</fieldset>
