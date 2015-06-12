
/*$.ui.autocomplete.prototype._renderItem = function( ul, item) {
    var re = new RegExp("^" + this.term) ;
    var t = item.label.replace(re,"<span style='font-weight:bold;color:Blue;'>" +
        this.term +
        "</span>");
    return $( "<li></li>" )
        .data( "item.autocomplete", item )
        .append( "<a>" + t + "</a>" )
        .appendTo( ul );
};*/

$(document).ready(function() {

    $("#userSocioInstance").autocomplete({
        source: function(request, response){
            $.ajax({
                url: "../userSocio/ajaxBuscadorSocio", // remote datasource
                data: request,
                success: function(data){
                    response(data); // set the response
                }/*,
                 error: function(){ // handle server errors
                 $.jGrowl("Unable to retrieve Companies", {
                 theme: 'ui-state-error ui-corner-all'
                 });
                 }*/
            });
        },
        minLength: 2, // triggered only after minimum 2 characters have been entered.
        select: function(event, ui) { // event handler when user selects a company from the list.
            /*$("#company\\.id").val(ui.item.id); // update the hidden field.
             $("#empId").val(ui.item.nasSymbol + "-") // populate the employee field with the nasdaq symbol.*/
            $('#userSocioInstance').val(ui.item.id);
            $('#userSocioInstanceId').val(ui.item.id);
        }
    });
});