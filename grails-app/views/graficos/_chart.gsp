%{--<g:set var="tipoSensor" value="${sensorHasComponente.sensor?.tipoSensor}"/>--}%
%{--<g:set var="abreviacionMedida" value="${tipoSensor.abreviacionMedida}"/>--}%
%{--<g:set var="nombreTipoSensor" value="${tipoSensor.nombreTipo}"/>--}%

%{--<div class="col-md-10 col-sm-10">
    <h2>
        ${sensorHasComponente?.componente?.nombreComponente?.toUpperCase()}
        <strong><g:img uri="/images/icons/${nombreTipoSensor.toLowerCase().replaceAll(" ","_")}-icon-reverse.svg" />${nombreTipoSensor?.toUpperCase()}</strong>
        <div class="btn-group">
            <a type="button" class="btn btn-theme" data-toggle="tooltip" title="Ir al componente" href="${createLink(controller: 'dashboard', action: 'resumen', params: ['componenteId': sensorHasComponente?.componente?.id])}">Ir al componente</a>
            <a type="button" class="btn btn-info"  data-toggle="tooltip" title="Ir a reporte de mediciones del sensor" href="${createLink(controller: 'medicionTemporal', action: 'list', params: ['componenteId': sensorHasComponente?.componente?.id, 'sensorHasComponente':sensorHasComponente?.id, 'usarFechas': Boolean.TRUE])}">Ir a reporte</a>
        </div>
    </h2>
    <h6>${sensorHasComponente?.descripcion}</h6>
</div>--}%

%{--<div id="divGrafico" style="width: 100%;">--}%
    <g:render template="/graficos/pago/grafico" model="[
            pagoInstanceList: pagoMapList/*,
            abreviacionMedida: abreviacionMedida,
            nombreTipoSensor: nombreTipoSensor,
            ultimaMedicion: ultimaMedicion,
            fechaUltimaMedicion: fechaUltimaMedicion,
            max:max,
            minn: min,
            promedio: promedio,
            listMediciones: listMediciones*/
    ]" />
%{--</div>--}%


%{--<script>

    $(document).ready(function(){
        $('#divValorMedicionYFecha').fadeIn(2000);
        $('#divValorMedicionMaximo').fadeIn(2000);
        $('#divValorMedicionMinimo').fadeIn(2000);
        $('#divValorMedicionPromedio').fadeIn(2000);
    });

    var $els = $('#fechaUltimaMedicion');
    setInterval(function () {
        $els.fadeOut(function () {
            $els.fadeIn();
        })
    }, 2500)
</script>--}%
