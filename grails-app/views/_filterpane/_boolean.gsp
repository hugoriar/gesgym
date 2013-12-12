<table>
    <tr>
        <td><label for="${name}.yes"><g:message code="fp.tag.filterPane.property.boolean.true" default="Yes"/></label></td>
        <td> <g:radio id="${name}.yes" name="${name}" value="true" checked="${value == 'true'}" onClick="grailsFilterPane.selectDefaultOperator('${opName}')"/></td>
        <td> <label for="${name}.no"><g:message code="fp.tag.filterPane.property.boolean.false" default="No"/></label></td>
        <td> <g:radio id="${name}.no" name="${name}" value="false" checked="${value == 'false'}" onClick="grailsFilterPane.selectDefaultOperator('${opName}')"/></td>
    </tr>
</table>