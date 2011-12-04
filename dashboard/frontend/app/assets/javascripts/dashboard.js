

$(function() {
	$( ".datepicker" ).datepicker();
	$( ".selector" ).slider({ range: 'min' });
	$( "#slider" ).slider({
		range: true,
		min: 0,
		max: 500,
		values: [ 75, 300 ],
		slide: function( event, ui ) {
			$( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
		}
	});
	$( "#amount" ).val( "$" + $( "#slider" ).slider( "values", 0 ) +
		" - $" + $( "#slider" ).slider( "values", 1 ) );
});
	
$(function() {
	$( ".datepicker" ).datepicker();
	});
$.elycharts.templates['line_basic'] = {
 type : "line",
 margins : [10, 10, 20, 50],
 defaultSeries : {
  plotProps : {
   "stroke-width" : 4
  },
  dot : true,
  dotProps : {
   stroke : "white",
   "stroke-width" : 2
  }
 },
 series : {
  serie1 : {
   color : "red"
  },
  serie2 : {
   color : "blue"
  }
 },
 defaultAxis : {
  labels : true
 },
 features : {
  grid : {
   draw : [true, false],
   props : {
    "stroke-dasharray" : "-"
   }
  },
  legend : {
   horizontal : false,
   width : 80,
   height : 50,
   x : 210,
   y : 220,
   dotType : "circle",
   dotProps : {
    stroke : "white",
    "stroke-width" : 2
   },
   borderProps : {
    opacity : 0.3,
    fill : "#c0c0c0",
    "stroke-width" : 0,
    "stroke-opacity" : 0
   }
  }
 }
}
