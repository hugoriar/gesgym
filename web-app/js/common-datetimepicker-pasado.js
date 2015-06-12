function changePeriodo(valor) {
    var desdeNuevo;
    var hastaNuevo;
    var time = {hour:23, minute:59};
//        disableParametros();
    switch(valor.value) {
        case 'Personalizado':
            desdeNuevo = $('#desde').val();
            hastaNuevo = $('#hasta').val();
//                enableParametros();
            break;
        case 'Hoy':
            desdeNuevo = Date.today();
            hastaNuevo = Date.today().set(time);
            break;
        case 'Ayer':
            desdeNuevo = Date.parse('t - 1 d');
            hastaNuevo = Date.parse('t - 1 minute');
            break;
        case 'Esta semana':
            desdeNuevo = Date.today().last().monday();
            hastaNuevo = Date.today().sunday().set(time);
            break;
        case 'La semana pasada':
            desdeNuevo = Date.today().addWeeks(-2).monday();
            hastaNuevo = Date.today().addWeeks(-1).sunday().set(time);
            break;
        case 'Este mes':
            desdeNuevo = Date.today().moveToFirstDayOfMonth();
            hastaNuevo = Date.today().moveToLastDayOfMonth().set(time);
            break;
        case 'El mes pasado':
            desdeNuevo = Date.today().addMonths(-1).moveToFirstDayOfMonth();
            hastaNuevo = Date.today().addMonths(-1).moveToLastDayOfMonth().set(time);
            break;
        case 'Últimos 7 días':
            desdeNuevo = Date.parse('t - 7 d');
            hastaNuevo = Date.parse('t - 1 minute');
            break;
        case 'Últimos 30 días':
            desdeNuevo = Date.parse('t - 30 d');
            hastaNuevo = Date.parse('t - 1 minute');
            break;
        case 'Este año':
            desdeNuevo = Date.parse('january').moveToFirstDayOfMonth();
            hastaNuevo = Date.parse('december').moveToLastDayOfMonth().set(time);
            break;
        default:
        // code to be executed if n is different from case 1 and 2
    }

    refillDateBoxes(desdeNuevo, hastaNuevo);

    $('#desde').val(desdeNuevo.toString("dd-MM-yyyy HH:mm"));
    $('#hasta').val(hastaNuevo.toString("dd-MM-yyyy HH:mm"));
}