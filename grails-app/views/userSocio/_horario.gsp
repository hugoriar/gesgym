<table id="tablaHorarios">
    <tr>
        <td style="vertical-align: top;">
            <label for="componentePadre" class="control-label"><g:message code="componente.componentePadre.label" default="Horarios" /></label>
            <div>
                %{--${horariosInstanceList?(horariosInstanceList.first()?.id):""}--}%
                <g:select size="${org.control.CursoEspecial.list()?.size()}" multiple="false" id="horario" name="horario.id" from="${horariosInstanceList}" optionKey="id" value=""
                          onchange="${remoteFunction(
                                  action: 'refreshInfoHorarios',
                                  params: '\'horarioId=\' + this.value',
                                  update : 'divInfoHorario'
                          )}"
                />
            </div>
        </td>
        <td valign="top" style="text-align: left;" class="value" width="100%" height="100%">
            <label for="componentePadre" class="control-label"><g:message code="componente.componentePadre.label" default="Días y Horas" /></label>
            <div id="divInfoHorario">
                <g:render template="infoHorario"/>
            </div>
        </td>
    </tr>
</table>