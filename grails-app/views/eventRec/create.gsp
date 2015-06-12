<%@ page import="org.control.calendario.EventRec" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'eventRec.label', default: 'EventRec')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <r:require module="colorPicker"/>
    <script>
        jQuery.noConflict();
        jQuery(document).ready( function() {
            jQuery('#color, #textColor').minicolors({
                opacity:false,
                readonly:false
            });

            /*$('#textColor').each(function() {
                var c1 = document.getElementById('color').value;
                var c2 = invertColor(c1);
                $(this).value(c2);
            });*/
        });

        /*function invertColor(hexTripletColor) {
            var color = hexTripletColor;
            color = color.substring(1); // remove #
            color = parseInt(color, 16); // convert to integer
            color = 0xFFFFFF ^ color; // invert three bytes
            color = color.toString(16); // convert to hex
            color = ("000000" + color).slice(-6); // pad with leading zeros
            color = "#" + color; // prepend #
            return color;
        }*/


    </script>
    %{--<g:set var="contAdjuntos" value="${0l}" scope="session"/>
    <script>
        var contador = ${contAdjuntos} + 1;

        function addRow(table) {
//            $("#"+table).append("<input type='file' id='archivo"+contador+"' name='archivo"+contador+"'/> <br/>");
            $("#"+table).append("" +
                    "<select id='diaSemana' name='diaSemana.id' from='${["Lunes"]}' class='many-to-one'/>  +
                    "<select id='diaSemana' name='diaSemana.id' from='${["Lunes"]}' class='many-to-one'/>   +
            ");
            contador++;
            document.getElementById('contador').value = contador;
        }

    </script>--}%
</head>

<body>

<section id="create-eventRec" class="first">

	<g:hasErrors bean="${eventRecInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${eventRecInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
