<%@ page import="org.control.Visita" contentType="text/html;charset=UTF-8" %>
<html>
<%
    Calendar fecha = GregorianCalendar.instance

    Calendar fechaMensual = GregorianCalendar.instance
    fechaMensual.set(2014-1900, 8, 1) // 0=Enero  11=Diciembre
    fecha.set(fechaMensual.get(Calendar.YEAR), fechaMensual.get(Calendar.MONTH), fechaMensual.get(Calendar.DATE)) // 0=Enero  11=Diciembre

    ArrayList<Integer> listVisitasMensualesHombres = new ArrayList<Integer>()
    ArrayList<Integer> listVisitasMensualesMujeres = new ArrayList<Integer>()

    for ( dia in 1..fecha.getActualMaximum(GregorianCalendar.DAY_OF_MONTH)) {
        def listVisitasMensuales = Visita.findAllByFechaDeVisita(new Date(fecha.get(Calendar.YEAR), fecha.get(Calendar.MONTH), dia))
        listVisitasMensualesHombres.add(listVisitasMensuales.findAll {it.usuario.sexoId == 1}.size())
        listVisitasMensualesMujeres.add(listVisitasMensuales.findAll {it.usuario.sexoId == 2}.size())
//        System.out.println(new Date(fecha.get(Calendar.YEAR), fecha.get(Calendar.MONTH), dia).toString()+": "+listVisitasMensuales.findAll {it.usuario.sexoId == 1}.size()+" | "+listVisitasMensuales.findAll {it.usuario.sexoId == 2}.size())
    }
%>

<script type="text/javascript">
    $(function () {
        $(${nombreDiv}).highcharts({
            chart: {
                type: 'column',
//                margin: 75,
                options3d: {
                    enabled: true,
                    alpha: 10,
                    beta: 25,
                    depth: 70
                }
            },
            title: {
                text: 'Visitas ${fecha.format("MMMM")/*+" de "+fecha.format("YY")*/}'
            },
            subtitle: {
                text: ''
            },
            tooltip: {
                headerFormat: '<b>{point.key}</b><br>',
                pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            },
            plotOptions: {
                column: {
                    stacking: '${stacking?:"normal"}',
                    depth: 25
                }
            },
            xAxis: {
                type: 'datetime',
                tickInterval: 1,
                labels: {
                    overflow: 'justify'/*,
                    rotation: 45*/
                },
                dateTimeLabelFormats: {
//                    day: '%a %d'
                    day: '%a<br/>%d'
                    /*day: '%e. %b',
                    year: '%b'*/
                }
            },
            yAxis: {
                opposite: true,
                allowDecimals: false,
                min: 0,
                %{--max: ${listVisitasHombres.max()+listVisitasMujeres.max()},--}%
                title: {
                    text: 'Cantidad de visitas'
                }
            },
            series: [
                {
                    name: 'Hombres',
                    data: [
                        <% listVisitasHombres.eachWithIndex{ it, date -> %>
                            [Date.UTC(${fecha.get(Calendar.YEAR)+1900},${fecha.get(Calendar.MONTH)},${date+1}),${it}],
                        <% } %>
                    ],
                    stack: 'si'
                }, {
                    name: 'Mujeres',
                    data: [
                        <% listVisitasMujeres.eachWithIndex{ it, date -> %>
                            [Date.UTC(${fecha.get(Calendar.YEAR)+1900},${fecha.get(Calendar.MONTH)},${date+1}),${it}],
                        <% } %>
                    ],
                    stack: '${stack?:"si"}',
                    color: 'pink'
                }]
        });
    });
</script>
<body>
<div id="${nombreDiv}" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>