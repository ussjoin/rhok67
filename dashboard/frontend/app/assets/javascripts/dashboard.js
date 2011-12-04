$(function() {
	
	Highcharts.setOptions({
		global : {
			useUTC : false
		}
	});
	
	$(".multiselect").multiselect().multiselect('disable');
	
	
	var companySuccessHandler = function(data){
		var output = [];
		for(company in data){
			output.push('<option value="'+ data[company].id +'">'+ data[company].name +'</option>');
		}
		$('#select_companies').html(output.join('')).multiselect('refresh').multiselect('enable');
		
	  };
	
	$.ajax({
	  url: "companies",
	  dataType:"json",
	  context: document.body,
	  success: companySuccessHandler
	});
	
	var facilitiesSuccessHandler = function(data){
		var output = [];
		for(facility in data){
			var facilityOption = new Option(data[facility].name, data[facility].id);
			$('#select_facilities').append(facilityOption).multiselect('refresh').multiselect('enable');
		}
	};
	
	$("#select_companies").bind("multiselectclick", function(event, ui){
		if (ui.checked){
			$.ajax({
			  url: "companies/" + ui.value + "/facilities.json",
			  dataType:"json",
			  context: document.body,
			  success: facilitiesSuccessHandler
			});
		   }
	   }
	);
	
	var buildingSuccessHandler = function(data){
		var output = [];
		for(building in data){
			var buildingOption = new Option(data[building].name, data[building].id);
			$('#select_buildings').append(buildingOption).multiselect('refresh').multiselect('enable');
		}
	};
	
	$("#select_facilities").bind("multiselectclick", function(event, ui){
		if (ui.checked){
			$.ajax({
			  url: "facilities/" + ui.value + "/buildings.json",
			  dataType:"json",
			  context: document.body,
			  success: buildingSuccessHandler
			});
		   }
	   }
	);
	
	var systemSuccessHandler = function(data){
		var output = [];
		for(system in data){
			var systemOption = new Option(data[system].name, data[system].id);
			$('#select_systems').append(systemOption).multiselect('refresh').multiselect('enable');
		}
	};
	
	$("#select_buildings").bind("multiselectclick", function(event, ui){
		if (ui.checked){
			$.ajax({
			  url: "buildings/" + ui.value + "/systems.json",
			  dataType:"json",
			  context: document.body,
			  success: systemSuccessHandler
			});
		   }
	   }
	);
	
	var sensorSuccessHandler = function(data){
		var output = [];
		for(sensor in data){
			var sensorOption = new Option(data[sensor].name, data[sensor].id);
			$('#select_sensors').append(sensorOption).multiselect('refresh').multiselect('enable');
		}
	};
	
	$("#select_systems").bind("multiselectclick", function(event, ui){
		if (ui.checked){
			$.ajax({
			  url: "systems/" + ui.value + "/sensors.json",
			  dataType:"json",
			  context: document.body,
			  success: sensorSuccessHandler
			});
		   }
	   }
	);
	
	var sensorSelectSuccessHandler = function(data){
		var output = [];
		for(sensor in data){
			var sensorOption = new Option(data[sensor].name, data[sensor].id);
			$('#select_sensors').append(sensorOption).multiselect('refresh').multiselect('enable');
		}
	};
	
	$("#select_sensors").bind("multiselectclick", function(event, ui){
		if (ui.checked){
			var values = $.map(ui.inputs, function(checkbox){
			 return checkbox.value;
		  });
			$.ajax({
			  url: "sensors/inputs.json",
			  dataType:"json",
			  data:{"ids":values},
			  context: document.body,
			  success: sensorSelectSuccessHandler
			});
		   }
	   }
	);
	
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