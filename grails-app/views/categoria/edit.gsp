<%@ page import="org.gym.ventas.Categoria" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Categoria')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<g:javascript>
$(document).bind('keyup', 'c', function(){
    $('#agregarDescuento').dialog('open');
});

$(document).bind('keyup', 'r', function(){
    $('#EliminarDescuento').dialog('open');
});


$(document).ready(function(){

    $('#agregarDescuento').dialog({
        autoOpen: false,
        width: 300,
        resizable: false,
        title: 'Agregar descuento',
        modal: true,
        hide: 'fadeOut',
        show: 'fadeIn'
        //close: function(event, ui) { $('input[name|="code"]').focus(); }
        //buttons: {
        //    "Cerrar": function () {
        //        $(this).dialog("close");
        //    }
        //}
    });

    $('#EliminarDescuento').dialog({
    autoOpen: false,
    width: 300,
    resizable: false,
    title: 'Eliminar descuento',
    modal: true,
    hide: 'fadeOut',
    show: 'fadeIn'
    //close: function(event, ui) { $('input[name|="code"]').focus(); }
    //buttons: {
    //    "Cerrar": function () {
    //        $(this).dialog("close");
    //    }
    //}
});

 });


</g:javascript>

<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${categoriaInstance}">
        <div class="errors">
            <g:renderErrors bean="${categoriaInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${categoriaInstance?.id}"/>
        <g:hiddenField name="version" value="${categoriaInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="codigo"><g:message code="categoria.codigo.label" default="Código"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'codigo', 'errors')}">
                        <g:textField name="codigo" value="${categoriaInstance?.codigo}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="nombre"><g:message code="categoria.nombre.label" default="Nombre"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'nombre', 'errors')}">
                        <g:textField name="nombre" value="${categoriaInstance?.nombre}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="subCategorias"><g:message code="categoria.subCategorias.label" default="Sub Categorias"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: categoriaInstance, field: 'subCategorias', 'errors')}">

                        <ul>
                            <g:each in="${categoriaInstance?.subCategorias?}" var="s">
                                <li><label>${s?.nombre}</label></li>
                            </g:each>
                        </ul>
                        <g:link controller="subCategoria" action="create" params="['categoria.id': categoriaInstance?.id]"></g:link>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="descuentosCategoria"><g:message code="categoria.descuentosCategoria.label" default="Descuentos"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: categoriaInstance, field: 'descuentosCategoria', 'errors')}">
                        <div id="descuentos">
                            <ul>
                                <g:each in="${categoriaInstance.descuentosCategoria}" var="c">
                                    <li><label>${c?.descuento.tipoDescuento}</label></li>
                                </g:each>
                            </ul>
                        </div>
                        <label>[+]</label>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </div>
    </g:form>

    <div id="agregarDescuento">
        <g:formRemote name="addDiscount" on404="alert('not found!')" update="descuentos" action="addDiscount" url="${[controller: 'categoria', action:'addDiscount']}">
            <g:hiddenField name="categoriaId" value="${categoriaInstance?.id}"/>
            <tr class="prop">
                <td valign="top" class="name">
                  <label for="Descuento" style="vertical-align: top;"><g:message code="categoria.descuento.label" default="Descuentos" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'categoria.descuento.label', 'errors')}">
                   <g:select name="descuentoId" from="${org.gym.ventas.Descuento.list()}" optionKey="id" optionValue="tipoDescuento"  value="${categoriaInstance?.descuentosCategoria?.descuento.id}"   />
                </td>
            </tr>
            <tr>
                <input style="vertical-align: top;" id="inputAgregar" type="submit" value="Agregar" />
            </tr>
        </g:formRemote>
    </div>

    <div id="EliminarDescuento">
        <g:formRemote name="removeDiscount" on404="alert('not found!')" update="descuentos" action="removeDiscount" url="${[controller: 'categoria', action:'removeDiscount']}">
            <g:hiddenField name="categoriaId" value="${categoriaInstance?.id}"/>
            <tr class="prop">
                <td valign="top" class="name">
                  <label for="Descuento" style="vertical-align: top;"><g:message code="client.discount.label" default="Descuentos" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: categoriaInstance, field: 'client.discount.label', 'errors')}">
                   <g:select name="descuentoId" from="${org.gym.ventas.Descuento.list()}" optionKey="id" optionValue="tipoDescuento"  value="${categoriaInstance?.descuentosCategoria?.descuento.id}" />
                </td>
            </tr>
            <tr>
                <input style="vertical-align: top;" id="inputEliminar" type="submit" value="Eliminar" />
            </tr>
        </g:formRemote>
    </div>

</div>
</body>
</html>
