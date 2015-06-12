/*** CAMPOS DE FECHA ***/
var startDateTextBox = $('#desde');
var endDateTextBox = $('#hasta');

startDateTextBox.datetimepicker({
    onClose: function (dateText, inst) {
        if (endDateTextBox.val() != '') {
            var testStartDate = startDateTextBox.datetimepicker('getDate');
            var testEndDate = endDateTextBox.datetimepicker('getDate');
            if (testStartDate > testEndDate)
                endDateTextBox.datetimepicker('setDate', testStartDate);
        }
        else {
            endDateTextBox.val(dateText);
        }
    },
    onSelect: function (selectedDateTime) {
        endDateTextBox.datetimepicker('option', 'minDate', startDateTextBox.datetimepicker('getDate'));
    }
});

endDateTextBox.datetimepicker({
    onClose: function (dateText, inst) {
        if (startDateTextBox.val() != '') {
            var testStartDate = startDateTextBox.datetimepicker('getDate');
            var testEndDate = endDateTextBox.datetimepicker('getDate');
            if (testStartDate > testEndDate)
                startDateTextBox.datetimepicker('setDate', testEndDate);
        }
        else {
            startDateTextBox.val(dateText);
        }
    },
    onSelect: function (selectedDateTime) {
        startDateTextBox.datetimepicker('option', 'maxDate', endDateTextBox.datetimepicker('getDate'));
    }
});

function refillDateBoxes(desde, hasta){
    startDateTextBox.datetimepicker('setDate', desde);
    startDateTextBox.datetimepicker('setTime', desde);

    endDateTextBox.datetimepicker('setDate', hasta);
    endDateTextBox.datetimepicker('setTime', hasta);
    /*startDateTextBox.datetimepicker('setDate', desde);
    startDateTextBox.datetimepicker('setTime', desde);

    endDateTextBox.datetimepicker('setDate', hasta);
    endDateTextBox.datetimepicker('setTime', hasta);*/
}

function activaFechas(){
    var cbUsarFecha= document.getElementById('usarFechas');
    if (!cbUsarFecha.checked){
        cbUsarFecha.checked = true;
        toogleCamposFechas();
    }
}

function toogleCamposFechas(){
    var cbUsarFecha= document.getElementById('usarFechas');
    var cbPeriodo  = document.getElementById('periodo');
    var fieldDesde = document.getElementById('desde');
    var fieldhasta = document.getElementById('hasta');
    if (cbUsarFecha.checked){
        cbPeriodo.disabled = false;
        fieldDesde.disabled = false;
        fieldhasta.disabled = false;

//            $("#divPeriodo").fadeIn();
//            $("#periodo").fadeIn();
        /*$("#desde").fadeIn();
         $("#hasta").fadeIn();*/
    }else{
//        cbPeriodo.disabled = true;
        fieldDesde.disabled = true;
        fieldhasta.disabled = true;
//        cbPeriodo.readonly = true;
        fieldDesde.readonly = true;
        fieldhasta.readonly = true;

//            $("#divPeriodo").fadeOut();
//            $("#periodo").fadeOut();
        /*$("#desde").fadeOut();
         $("#hasta").fadeOut();*/
    }
}

function resetPeriodo(){
    $('#periodo').val('Personalizado');
}

