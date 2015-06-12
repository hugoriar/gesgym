%{--<g:set var="pagoMapSuma" value="${pagoMapSuma?:1}"/>--}%

<div class="tabbable tabs-below">
    <div class="tab-content">
        <div class="tab-pane fade in active" id="1" style="border: 1px solid #ddd; border-bottom: none; border-radius:3px;">
            <div>
                <div id="grafico2" class="loader">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>

    </div>

    <ul class="nav nav-tabs">
        <li class="active"><a href="#1" data-toggle="tab"><span class="glyphicon glyphicon-home">Ingresos</span></a></li>
    </ul>
</div>

<script type="text/javascript">
    %{--<g:javascript src="hs/highchartsInicio.js" />--}%

    Highcharts.setOptions({
        lang: {
            loading: 'Cargando...',
            months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octobre', 'Noviembre', 'Diciembre'],
            shortMonths:  ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
            weekdays: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            exportButtonTitle: "Exportar",
            printButtonTitle: "Imprimir",
            rangeSelectorFrom: "Zoom del",
            rangeSelectorTo: "al",
            rangeSelectorZoom: "Zoom:",
            downloadPNG: 'Descargar imagen PNG',
            downloadJPEG: 'Descargar imagen JPEG',
            downloadPDF: 'Descargar imagen PDF',
            downloadSVG: 'Descargar imagen SVG',
            resetZoom: "Resetear zoom",
            resetZoomTitle: "Resetear zoom",
            printChart: "Imprimir gráfico",
            thousandsSep: ".",
            decimalPoint: ','
        }
    });


    <% def userToString = { it.toString() }%>


</script>