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
		chart.addSeries({
		    name: data.name,
		    data: data.coords
		});
		chart.addSeries({
		    name: data.name,
		    data: data.coords,
		   	xAxis:chart.xAxis.length-1,// the last X axis 
	        yAxis:chart.yAxis.length-1 // the last Y axis
		});
	};
	
	$("#select_sensors").bind("multiselectclick", function(event, ui){
		if (ui.checked){
			var values = ui.value;
			$.ajax({
			  url: "sensors/inputs.json",
			  dataType:"json",
			  data:{"ids":[values]},
			  context: document.body,
			  success: sensorSelectSuccessHandler
			});
		   }
	   }
	);
	
	chart = new Highcharts.StockChart({
		chart : {
			renderTo : 'chart'
		},
		xAxis: {
	         type: 'datetime',
	         dateTimeLabelFormats: { // don't display the dummy year
	            month: '%e. %b',
	            year: '%b'
	         },
			maxZoom : 14 * 24 * 3600000
	      },
	      yAxis: {
	         title: {
	            text: 'Y Axis'
	         },
	         min: 0
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
		    data: [[(new Date()).getTime(), 0]]
		}]
		
	});	
});