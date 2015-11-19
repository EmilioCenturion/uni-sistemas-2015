// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require jquery_nested_form
//= require bootstrap-datepicker
//= require rails.validations
//= require jquery-ui
//= require_tree .



$(document).ready(function() {
	
	
	$('.input-group.date').datepicker({
		closeText: 'Cerrar',
		prevText: '<Ant',
 		nextText: 'Sig>',
 		currentText: 'Hoy',
 		monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
 		monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
 		dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
 		dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
 		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
 		weekHeader: 'Sm',
 		dateFormat: 'dd/mm/yy',
 		firstDay: 1,
 		isRTL: false,
 		showMonthAfterYear: false,
 		yearSuffix: ''
	});
	

	$("#btn1").click(function(){
		$('#form-toggle').fadeToggle();
		if($('#gbtn1').hasClass('glyphicon glyphicon-plus')){
			$('#gbtn1').removeClass('glyphicon glyphicon-plus');
			$('#gbtn1').addClass('glyphicon glyphicon-chevron-up');
		}else{
			$('#gbtn1').removeClass('glyphicon glyphicon-chevron-up');
			$('#gbtn1').addClass('glyphicon glyphicon-plus');
		}
	});
	$('#table').DataTable({
	  // ajax: ...,
	  // autoWidth: false,
	  // pagingType: 'full_numbers',
	  // processing: true,
	  // serverSide: true,

	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType
		 "language": {
	        "sProcessing":    "Procesando...",
	        "sLengthMenu":    "Mostrar _MENU_ registros",
	        "sZeroRecords":   "No se encontraron resultados",
	        "sEmptyTable":    "Ningún dato disponible en esta tabla",
	        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
	        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
	        "sInfoPostFix":   "",
	        "sSearch":        "Buscar:",
	        "sUrl":           "",
	        "sInfoThousands":  ",",
	        "sLoadingRecords": "Cargando...",
	        "oPaginate": {
	            "sFirst":    "Primero",
	            "sLast":    "Último",
	            "sNext":    "Siguiente",
	            "sPrevious": "Anterior"
	        },
	        "oAria": {
	            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
			}
	    }
	});
});
jQuery(function ($) {
  window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
    if($(link).hasClass('insert_in_table')){
      return $(content).insertBefore($(link).parent().parent());
    }
    else{
      return $(content).insertBefore(link);
    }
  };
});

$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field; 
  // it's a jQuery object already! Now you can find date input
  var dateField = field.find('.datepicker');
  // and activate datepicker on it
  dateField.datepicker();
});