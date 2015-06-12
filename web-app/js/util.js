function getValue(id){
    return parseFloat(document.getElementById(id).value);
}

function setValue(id, value){
    document.getElementById(id).value = value;
}

function procDiv(e, show, hide){
    if (e.value == 1){
        if (show != "") showDiv(show);
        if (hide != "") hideDiv(hide);
    } else if (e.value == 2){
        if (show != "") hideDiv(show);
        if (hide != "") showDiv(hide);
    }
    refreshAll()
}

function showHideFaq(div, mas, menos){
    if ((document.getElementById(div).style.display === "none")) {
        showDiv(div);
        document.getElementById(mas).style.display = "none";
        document.getElementById(menos).style.display = "";
    }
    else {
        hideDiv(div);
        document.getElementById(mas).style.display = "";
        document.getElementById(menos).style.display = "none";
    }
}

function showHideVideos(div, counter){
    for(i=0;i<counter;i=i+1){
        hideDiv('v'+i);
    }
    showDiv(div);
}

function refreshAll(){
    calcularQ();
    calcularRotacion();
    calcularLeadTime();
    calcularDl();
    updateMsg();
}

function showDiv(si){
    if (Object.prototype.toString.call(si) === "[object Array]") {
        showDivs(si)
    } else {
        document.getElementById(si).style.display = "";
    }
}

function hideDiv(no){
    if ((Object.prototype.toString.call(no) === "[object Array]")) {
        hideDivs(no)
    } else {
        document.getElementById(no).style.display = "none";
    }
}

function showDivs(si){
    si.forEach(
        function(item) {
            document.getElementById(item).style.display = "";
        }
    );
}

function hideDivs(no){
    no.forEach(
        function(item) {
            document.getElementById(item).style.display = "none";
        }
    );
}

function traerSubcomponentes(e){
    document.forms["myform"].submit();

}