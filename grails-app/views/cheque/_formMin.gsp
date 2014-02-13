<%@ page import="org.gym.Cheque" %>

            <table>
                <tr>
                    <td><label for="banco" ><g:message code="cheque.banco.label" default="Banco" />%{--<span class="required-indicator">*</span>--}%</label></td>
                    <td><label for="fechaVencimiento"><g:message code="cheque.fechaVencimiento.label" default="Fecha Vencimiento" />%{--<span class="required-indicator">*</span>--}%</label></td>
                    <td><label for="montoCheque"><g:message code="cheque.montoCheque.label" default="Monto Cheque" />%{--<span class="required-indicator">*</span>--}%</label></td>
                    <td><label for="numeroCheque"><g:message code="cheque.numeroCheque.label" default="Numero Cheque" />%{--<span class="required-indicator">*</span>--}%</label></td>
                </tr>
                <tr>
                    <g:render template="/cheque/formCheque"/>
                </tr>
            </table>
