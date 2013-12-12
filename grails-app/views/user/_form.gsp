<%@ page import="org.gym.User" %>



			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
				<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /></label>
				<div class="controls">
					<g:textField name="username" value="${userInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
				<label for="password" class="control-label"><g:message code="user.password.label" default="Password" /></label>
				<div class="controls">
					<g:field type="password" name="password" value="${userInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'password', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="user.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${userInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'apellidoPaterno', 'error')} required">
				<label for="apellidoPaterno" class="control-label"><g:message code="user.apellidoPaterno.label" default="Apellido Paterno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoPaterno" required="" value="${userInstance?.apellidoPaterno}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'apellidoPaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'apellidoMaterno', 'error')} required">
				<label for="apellidoMaterno" class="control-label"><g:message code="user.apellidoMaterno.label" default="Apellido Materno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoMaterno" required="" value="${userInstance?.apellidoMaterno}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'apellidoMaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'rut', 'error')} required">
				<label for="rut" class="control-label"><g:message code="user.rut.label" default="Rut" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="rut" required="" value="${userInstance.rut}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'rut', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'dv', 'error')} required">
				<label for="dv" class="control-label"><g:message code="user.dv.label" default="Dv" /><span class="required-indicator">*</span></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'dv', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'foto', 'error')} ">
				<label for="foto" class="control-label"><g:message code="user.foto.label" default="Foto" /></label>
				<div class="controls">
					<input type="file" id="foto" name="foto" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'foto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'fechaNacimiento', 'error')} ">
				<label for="fechaNacimiento" class="control-label"><g:message code="user.fechaNacimiento.label" default="Fecha Nacimiento" /></label>
				<div class="controls">
					<bs:datePicker name="fechaNacimiento" precision="day"  value="${userInstance?.fechaNacimiento}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'fechaNacimiento', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="user.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sexo" name="sexo.id" from="${org.gym.Sexo.list()}" optionKey="id" required="" value="${userInstance?.sexo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'fono', 'error')} ">
				<label for="fono" class="control-label"><g:message code="user.fono.label" default="Fono" /></label>
				<div class="controls">
					<g:field type="number" name="fono" value="${userInstance.fono}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'fono', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'fonoCelular', 'error')} ">
				<label for="fonoCelular" class="control-label"><g:message code="user.fonoCelular.label" default="Fono Celular" /></label>
				<div class="controls">
					<g:field type="number" name="fonoCelular" value="${userInstance.fonoCelular}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'fonoCelular', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'fonoTrabajo', 'error')} ">
				<label for="fonoTrabajo" class="control-label"><g:message code="user.fonoTrabajo.label" default="Fono Trabajo" /></label>
				<div class="controls">
					<g:field type="number" name="fonoTrabajo" value="${userInstance.fonoTrabajo}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'fonoTrabajo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="user.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${userInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'domicilio', 'error')} ">
				<label for="domicilio" class="control-label"><g:message code="user.domicilio.label" default="Domicilio" /></label>
				<div class="controls">
					<g:select id="domicilio" name="domicilio.id" from="${org.gym.DireccionUsuario.list()}" optionKey="id" value="${userInstance?.domicilio?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'domicilio', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'condicionMedica', 'error')} ">
				<label for="condicionMedica" class="control-label"><g:message code="user.condicionMedica.label" default="Condicion Medica" /></label>
				<div class="controls">
					<g:select id="condicionMedica" name="condicionMedica.id" from="${org.gym.fichaMedica.CondicionMedica.list()}" optionKey="id" value="${userInstance?.condicionMedica?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'condicionMedica', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'contactoEmergencia', 'error')} required">
				<label for="contactoEmergencia" class="control-label"><g:message code="user.contactoEmergencia.label" default="Contacto Emergencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="contactoEmergencia" name="contactoEmergencia.id" from="${org.gym.ContactoEmergencia.list()}" optionKey="id" required="" value="${userInstance?.contactoEmergencia?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'contactoEmergencia', 'error')}</span>
				</div>
			</div>

