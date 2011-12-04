$(function() {
	Highcharts.setOptions({
		global : {
			useUTC : false
		}
	});
	
	$(".multiselect").multiselect().multiselect('disable');
	
	$.ajax({
	  url: "companies",
	  dataType:"json",
	  context: document.body,
	  success: function(data){
		var output = [];
		output.push('<option value="ALL">All Companies</option>');
		for(company in data){
			output.push('<option value="'+ data[company].id +'">'+ data[company].name +'</option>');
		}
		$('#select_companies').html(output.join('')).multiselect('refresh').multiselect('enable');
		
	  }
	});
	
	$("#select_companies").multiselect({
	   optgrouptoggle: function(event, ui){
		  var values = $.map(ui.inputs, function(checkbox){
			 return checkbox.value;
		  }).join(", ");
		  alert("Checkboxes " + (ui.checked ? "checked" : "unchecked") + ": " + values);
	   }
	});
	
	
	window.chart = new Highcharts.StockChart({
		chart : {
			renderTo : 'chart',
			events : {
				load : function() {

					// set up the updating of the chart each second
					var series = this.series[0];
					setInterval(function() {
						var x = (new Date()).getTime(), // current time
						y = Math.round(Math.random() * 100);
						series.addPoint([x, y], true, true);
					}, 3000);
				}
			}
		},
		
		rangeSelector: {
			buttons: [{
				count: 1,
				type: 'day',
				text: '1D'
			}, {
				count: 1,
				type: 'week',
				text: '1W'
			}, {
				count: 1,
				type: 'month',
				text: '1M'
			}, {
				count: 6,
				type: 'month',
				text: '6M'
			}, {
				type: 'all',
				text: 'All'
			}],
			inputEnabled: false,
			selected: 0
		},
		
		exporting: {
			enabled: true
		},
		
		series : [{
			name : 'Random data',
			data : (function() {
				// generate an array of random data
				var data = [], time = (new Date()).getTime(), i;

				for( i = -999; i <= 0; i++) {
					data.push({
						x : time + i * 1000,
						y : Math.round(Math.random() * 100)
					});
				}
				return data;
			})()
		}]
	});	
});