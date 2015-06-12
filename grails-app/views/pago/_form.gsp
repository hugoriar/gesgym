<%@ page import="org.control.Pago" %>

        <div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'monto', 'error')} required">
            <label for="monto" class="control-label"><g:message code="pago.monto.label" default="Monto" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <g:field type="number" name="monto" value="${pagoInstance?.monto}"/>
                <span class="help-inline">${hasErrors(bean: pagoInstance, field: 'monto', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'medioDePago', 'error')} required">
            <label for="medioDePago" class="control-label"><g:message code="pago.medioDePago.label" default="Medio De Pago" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <g:select id="medioDePago" name="medioDePago.id" from="${org.control.MedioPago.list()}" optionKey="id" value="${pagoInstance?.medioDePago?.id}" class="many-to-one" noSelection="['null': '']"/>
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

        <div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'fecha', 'error')} required">
            <label for="fecha" class="control-label"><g:message code="pago.fecha.label" default="Fecha" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <bs:datePicker name="fecha" precision="day"  value="${pagoInstance?.fecha}"/>
                %{--<bs:datePicker name="fecha" precision="day"  value="${pagoInstance?.fecha}" default="none" noSelection="['': '']" />--}%
                <span class="help-inline">${hasErrors(bean: pagoInstance, field: 'fecha', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'numeroDeBoleta', 'error')} required">
            <label for="numeroDeBoleta" class="control-label"><g:message code="pago.numeroDeBoleta.label" default="Numero De Boleta" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <g:field type="number" name="numeroDeBoleta" value="${pagoInstance?.numeroDeBoleta}"/>                         
                <span class="help-inline">${hasErrors(bean: pagoInstance, field: 'numeroDeBoleta', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'fotoBoleta', 'error')} ">
            <label for="fotoBoleta" class="control-label"><g:message code="userSocio.fotoBoleta.label" default="Foto de Boleta" /></label>
            <div class="controls">
                %{--<webcam:webcamAnchor/>--}%
                <input type="file" id="fotoBoleta" name="fotoBoleta" />
                <div id="nozoom" style="text-align: center; display: block; max-width: 300px;">
                    <g:if test="${pagoInstance?.fotoBoleta}">
                        <richui:lightBox href="${createLink(controller:'userSocio', action:'avatar_image', id:pagoInstance.id)}">
                            <img class="avatar" id="img1" style="" src="${createLink(controller:'userSocio', action:'avatar_image', id:pagoInstance.id)}"/>
                        </richui:lightBox>
                    </g:if>
                </div>
                <span class="help-inline">${hasErrors(bean: pagoInstance, field: 'fotoBoleta', 'error')}</span>
            </div>
        </div>

<script>

    function tooglePago(){
        var cdPagaMatricula= document.getElementById('pagaMatricula');
        if (cdPagaMatricula.checked){
            $("#divPago").fadeIn();
        }else{
            $("#divPago").fadeOut();
        }
    }

</script>