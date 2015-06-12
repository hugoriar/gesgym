<%@ page import="org.control.Cheque" %>

                    <td><g:select id="banco" name="banco.id" from="${org.control.Banco.list()}" optionKey="id" required="" value="${chequeInstance?.banco?.id}" class="many-to-one"/></td>%{--<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'banco', 'error')}</span>--}%
                    <td><bs:datePicker name="fechaVencimiento" precision="day"  value="${chequeInstance?.fechaVencimiento}"  /></td>%{--<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'fechaVencimiento', 'error')}</span>--}%
                    <td><g:field type="number" name="montoCheque" required="" value="${chequeInstance?.montoCheque}"/></td>%{--<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'montoCheque', 'error')}</span>--}%
                    <td><g:field type="number" name="numeroCheque" required="" value="${chequeInstance?.numeroCheque}"/></td>%{--<span class="help-inline">${hasErrors(bean: chequeInstance, field: 'numeroCheque', 'error')}</span>--}%
