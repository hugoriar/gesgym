<%@ page import="org.joda.time.DateTime" %>
%{--<div id="cursos">--}%
    %{--<div id="oli">--}%
        <g:each in="${userSocioInstance.horarios?.sort {it.curso?.nombre}}" var="h">
            <li><g:link controller="horario" action="show" id="${h.id}">${h.curso?.nombre+" - "+h?.nombre}</g:link></li>
        </g:each>
    %{--</div>--}%
    <g:hiddenField name="userId" value="${userSocioInstance?.id}"/>
    <g:form controller="horario" action="matricularUsuario">
        <fieldset class="form">
            <br/>
            <div class="${hasErrors(bean: componenteInstance, field: 'componentePadre', 'error')} ">

                <div>
                    <table id="tablaHorarios">
                        <tr>
                            <td valign="top">
                                <label for="componentePadre" class="control-label"><g:message code="componente.componentePadre.label" default="Cursos" /></label>
                                %{-- Value: ${userSocioInstance.horarios.curso?.id}--}%
                                <g:select size="${org.control.CursoEspecial.list()?.size()}" multiple="false" id="cursoEspecial" name="cursoEspecial.id" from="${org.control.CursoEspecial.list()?.sort {it.nombre}}" optionKey="id" value=""
                                          onchange="${remoteFunction(
                                                  action: 'refreshHorarios',
                                                  params:'\'cursoId=\'+this.value+\'&userId=\'+\'' + userSocioInstance?.id + '\'',
                                                  update : 'divHorario'
                                          )}"
                                />
                            </td>
                            <td style="vertical-align: top;">
                                <div id="divHorario">
                                    <g:render template="horario"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br/><br/>
        </fieldset>
    </g:form>
%{--</div>--}%