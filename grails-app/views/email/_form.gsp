<%@ page import="org.control.Email" %>



<div class="control-group fieldcontain ${hasErrors(bean: emailInstance, field: 'de', 'error')} required">
    <label for="de" class="control-label"><g:message code="email.de.label" default="De" /></label>
    <div class="controls">
        <g:field style="width: 100%; margin-top: 0px !important;" type="email" name="de" required="" value="${emailInstance?.de}"/>
        %{--${emailInstance?.de}--}%
        <span class="help-inline">${hasErrors(bean: emailInstance, field: 'de', 'error')}</span>
    </div>
%{--</div>--}%

%{--<div class="control-group fieldcontain ${hasErrors(bean: emailInstance, field: 'para', 'error')} ">--}%
    <label for="para" class="control-label" style="margin-top: 0px !important;"><g:message code="email.para.label" default="Para" /></label>
    <div class="controls">
        <g:textField style="width: 100%; margin-top: 0px !important;" name="para" value="${emailInstance?.para}"/>
        <span class="help-inline">${hasErrors(bean: emailInstance, field: 'para', 'error')}</span>
    </div>
    %{--</div>--}%

    %{--<div class="control-group fieldcontain ${hasErrors(bean: emailInstance, field: 'cc', 'error')} ">--}%
    <label for="cc" class="control-label" style="margin-top: 0px !important;"><g:message code="email.cc.label" default="Cc" /></label>
    <div class="controls">
        <g:textField style="width: 100%; margin-top: 0px !important;" name="cc" value="${emailInstance?.cc}"/>
        <span class="help-inline">${hasErrors(bean: emailInstance, field: 'cc', 'error')}</span>
    </div>
    %{--</div>--}%

    %{--<div class="control-group fieldcontain ${hasErrors(bean: emailInstance, field: 'bcc', 'error')} ">--}%
    <label for="bcc" class="control-label" style="margin-top: 0px !important;"><g:message code="email.bcc.label" default="Bcc" /></label>
    <div class="controls">
        <g:textField style="width: 100%; margin-top: 0px !important;" name="bcc" value="${emailInstance?.bcc}"/>
        <span class="help-inline">${hasErrors(bean: emailInstance, field: 'bcc', 'error')}</span>
    </div>
    %{--</div>--}%

    %{--<div class="control-group fieldcontain ${hasErrors(bean: emailInstance, field: 'asunto', 'error')} required">--}%
    <label for="asunto" class="control-label" style="margin-top: 0px !important;"><g:message code="email.asunto.label" default="Asunto" /><span class="required-indicator">*</span></label>
    <div class="controls">
        <g:textField style="width: 100%; margin-top: 0px !important;" name="asunto" required="" value="${emailInstance?.asunto}"/>
        <span class="help-inline">${hasErrors(bean: emailInstance, field: 'asunto', 'error')}</span>
    </div>
    %{--</div>--}%

    %{--<div class="control-group fieldcontain ${hasErrors(bean: emailInstance, field: 'mensaje', 'error')} ">--}%
    <label for="mensaje" class="control-label" style="margin-top: 0px !important;"><g:message code="email.mensaje.label" default="Mensaje" /></label>
    <div class="controls">
        <g:textArea style="width: 100%; margin-top: 0px !important;" name="mensaje" cols="40" rows="15" maxlength="25000" value="${emailInstance?.mensaje}"/>
        <span class="help-inline">${hasErrors(bean: emailInstance, field: 'mensaje', 'error')}</span>
    </div>
    %{--</div>--}%

    %{--<div class="control-group fieldcontain ${hasErrors(bean: emailInstance, field: 'adjuntos', 'error')} ">--}%
    <label for="adjuntos" class="control-label" style="margin-top: 0px !important;"><g:message code="email.adjuntos.label" default="Adjuntos" /></label>
    <div class="controls">
        <table id="myTable">
            <fieldset class="form">
                <tbody>
                    %{--<tr><g:render template="adjunto"/></tr>--}%
                </tbody>
            </fieldset>
        </table>
        <g:hiddenField name="contador" value="${contAdjuntos}"/>
        <a class="action" href="javascript:addRow('myTable')" onclick="addRow('myTable'); return false" title="Add new row">+ Añadir adjunto</a><br/>

        <span class="help-inline">${hasErrors(bean: emailInstance, field: 'adjuntos', 'error')}</span>
    </div>
</div>

