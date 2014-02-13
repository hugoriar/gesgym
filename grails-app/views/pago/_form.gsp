<%@ page import="org.gym.Pago" %>



			<div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'monto', 'error')} ">
				<label for="monto" class="control-label"><g:message code="pago.monto.label" default="Monto" /></label>
				<div class="controls">
					<g:field type="number" name="monto" value="${pagoInstance?.monto}"/>
					<span class="help-inline">${hasErrors(bean: pagoInstance, field: 'monto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'medioDePago', 'error')} ">
				<label for="medioDePago" class="control-label"><g:message code="pago.medioDePago.label" default="Medio De Pago" /></label>
				<div class="controls">
					<g:select id="medioDePago" name="medioDePago.id" from="${org.gym.MedioPago.list()}" optionKey="id" value="${pagoInstance?.medioDePago?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: pagoInstance, field: 'medioDePago', 'error')}</span>
				</div>
			</div>

            %{--<div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'cheque', 'error')} ">
                <label for="cheque" class="control-label"><g:message code="pago.cheque.label" default="Cheque" /></label>
                <div class="controls">
                    <ul class="one-to-many">
                        <g:each in="${pagoInstance?.cheque?}" var="c">
                            <li><g:link controller="cheque" action="show" id="${c.id}">${c}</g:link></li>
                        </g:each>
                        <fieldset>
                            <g:render template="/cheque/formMin"/>
                            --}%%{--<g:render template="/cheque/form"/>--}%%{--
                        </fieldset>
                        --}%%{--<br/>--}%%{--
                        --}%%{--<li class="add">--}%%{--
                            <g:link controller="cheque" action="create" params="['pago.id': pagoInstance?.id]">+ ${message(code: 'default.add.label', args: [message(code: 'cheque.label', default: 'Cheque')])}</g:link>
                        --}%%{--</li>--}%%{--
                    </ul>
                    --}%%{--<span class="help-inline">${hasErrors(bean: pagoInstance, field: 'cheque', 'error')}</span>--}%%{--
                </div>
            </div>--}%

			<div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'fecha', 'error')} ">
				<label for="fecha" class="control-label"><g:message code="pago.fecha.label" default="Fecha" /></label>
				<div class="controls">
					<bs:datePicker name="fecha" precision="day"  value="${pagoInstance?.fecha}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: pagoInstance, field: 'fecha', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'numeroDeBoleta', 'error')} ">
				<label for="numeroDeBoleta" class="control-label"><g:message code="pago.numeroDeBoleta.label" default="Numero De Boleta" /></label>
				<div class="controls">
					<g:field type="number" name="numeroDeBoleta" value="${pagoInstance?.numeroDeBoleta}"/>
					<span class="help-inline">${hasErrors(bean: pagoInstance, field: 'numeroDeBoleta', 'error')}</span>
				</div>
			</div>

