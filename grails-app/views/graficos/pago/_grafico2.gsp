<table style="width: 100%;">
    <tr>
        <td style="width: 33%;"><div id="grafico1"></div></td>
        <td style="width: 33%;"><div id="grafico2"></div></td>
        <td style="width: 33%;"><div id="grafico3"></div></td>
    </tr>
    <tr>
        <td style="width: 33%;"><div id="grafico4"></div></td>
        <td style="width: 33%;"><div id="grafico5"></div></td>
        <td style="width: 33%;"><div id="grafico6"></div></td>
    </tr>
</table>

<script type="text/javascript">

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


    $(function () {

        $('#grafico1').highcharts({
            chart: {
                plotBackgroundColor: '${pagoMapSuma>0?'#EEFFAA':(pagoMapSuma<0?'#FF3366':'')}',
                plotBorderWidth: 1,
                plotShadow: true
            },
            title: {
                text: 'Ingresos',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                formatter: function() {
                    return this.series.name+': <b>$' + Highcharts.numberFormat(this.y, 0) + '</b>';
                }
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: -50,
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: 'Ingresos',
                innerSize: '50%',
                data: [
                        [ '${mesPrimero} ${anioPrimero}',  ${pagoMapSuma1} ],
                        [ '${mesSegundo} ${anioSegundo}',  ${pagoMapSuma2} ]
                ]
            }]
        });

    });

    $(function () {

        $('#grafico2').highcharts({
            chart: {
                plotBackgroundColor: '${contMem>0?'#EEFFAA':(contMem<0?'#FF3366':'')}',
                plotBorderWidth: 1,
                plotShadow: true
            },
            title: {
                text: 'Membresías',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                formatter: function() {
                    return this.series.name+': <b>' + this.y + '</b>';
                }
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: -50,
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: 'Membresías',
                innerSize: '50%',
                data: [
                        [ '${mesPrimero} ${anioPrimero}',  ${contMem1} ],
                        [ '${mesSegundo} ${anioSegundo}',  ${contMem2} ]
                ]
            }]
        });

    });

    $(function () {

        $('#grafico3').highcharts({
            chart: {
                plotBackgroundColor: '${contMat>0?'#EEFFAA':(contMat<0?'#FF3366':'')}',
                plotBorderWidth: 1,
                plotShadow: true
            },
            title: {
                text: 'Matrículas',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                formatter: function() {
                    return this.series.name+': <b>' + this.y + '</b>';
                }
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: -50,
                        format: '{point.y}',
//                        format: '{point.name}: {point.y}',
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    allowPointSelect: true,
                    cursor: 'pointer',
                    showInLegend: true,
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: 'Matrículas',
                innerSize: '50%',
                data: [
                        [ '${mesPrimero} ${anioPrimero}',  ${contMat1} ],
                        [ '${mesSegundo} ${anioSegundo}',  ${contMat2} ]
                ]
            }]
        });

    });


    $(function () {

        $('#grafico4').highcharts({
            chart: {
                plotBackgroundColor: '${contNuevos>0?'#EEFFAA':(contNuevos<0?'#FF3366':'')}',
                plotBorderWidth: 1,
                plotShadow: true
            },
            title: {
                text: 'Socios<br/>Nuevos',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                formatter: function() {
                    return this.series.name+': <b>' + this.y + '</b>';
                }
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: -50,
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: 'Nuevos',
                innerSize: '50%',
                data: [
                        [ '${mesPrimero} ${anioPrimero}',  ${contNuevos1} ],
                        [ '${mesSegundo} ${anioSegundo}',  ${contNuevos2} ]
                ]
            }]
        });

    });

    $(function () {

        $('#grafico5').highcharts({
            chart: {
                plotBackgroundColor: '${contRen>0?'#EEFFAA':(contRen<0?'#FF3366':'')}',
                plotBorderWidth: 1,
                plotShadow: true/*,
                width: 567,
                height: 400*/
            },
            title: {
                text: 'Socios<br/>Renovados',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                formatter: function() {
                    return this.series.name+': <b>' + this.y + '</b>';
                }
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: -50,
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: 'Renovados',
                innerSize: '50%',
                data: [
                        [ '${mesPrimero} ${anioPrimero}',  ${contRen1} ],
                        [ '${mesSegundo} ${anioSegundo}',  ${contRen2} ]
                ]
            }]
        });

    });

/*
    $(function () {

        $('#grafico6').highcharts({
            chart: {
                plotBackgroundColor: '${(contMat1-contMat2)>0?'#EEFFAA':'#FF3366'}',
                plotBorderWidth: 1,
                plotShadow: true*/
/*,
                width: 567,
                height: 400*//*

            },
            title: {
                text: 'Matrículas',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                formatter: function() {
                    return this.series.name+': <b>' + this.y + '</b>';
                }
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: -50,
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: 'Matrículas',
                innerSize: '50%',
                data: [
                        [ '${mesPrimero} ${anioPrimero}',  ${(contMat1)} ],
                        [ '${mesSegundo} ${anioSegundo}',  ${(contMat2)} ]
                ]
            }]
        });

    });
*/


</script>