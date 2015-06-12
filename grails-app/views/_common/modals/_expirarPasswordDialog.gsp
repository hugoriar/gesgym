<!-- 
This is the standard dialog that initiates the expirarPassword action.
-->

<!-- Modal dialog -->
<div id="ExpirarModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ExpirarModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="ExpirarModalLabel"><g:message code="default.button.expirarPassword.confirm.title" default="Expirar Password"/></h3>
    </div>
    <div class="modal-body">
        <p><g:message code="default.button.expirarPassword.confirm.message" default="¿Está seguro de querer expirar la contraseña? Esta acción implica que el sistema redirigirá al usuario a crear una nueva en su próximo inicio de sesión."/></p>
    </div>
    <div class="modal-footer">
        <g:form>
            <button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="default.button.cancel.label" default="Cancel"/></button>
            <g:hiddenField name="id" value="${userSocioInstance?.id}" />
            <span class="button">
                <g:actionSubmit class="btn btn-danger" controller="userSocio" action="expirarPassword" value="${message(code: 'default.button.expirarPassword.label', default: 'Expirar')}"/>
            </span>
        </g:form>

    </div>
</div>