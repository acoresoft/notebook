$(function() {
	// <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
	// Step:3 echarts & zrender as a Global Interface by the echarts-plain.js.
	// Step:3 echarts和zrender被echarts-plain.js写入为全局接口
	onloadurl();
	var myChart = echarts.init(document.getElementById('main'));
	var now = new Date();
	var res = [];
	var len = 20;
	while (len--) {
		var time = now.toLocaleTimeString().replace(/^\D*/, '');
		time = time.substr(time.indexOf(":") + 1);
		res.unshift(time);
		now = new Date(now - 1000);
	}
	option = {
		legend : {
			data : [ 'jvm内存使用率', '物理内存使用率', 'cpu使用率' ]
		},
		grid : {
			x : 40,
			y : 30,
			x2 : 10,
			y2 : 35,
			borderWidth : 0,
			borderColor : "#FFFFFF"
		},
		xAxis : [ {
			axisLabel : {
				rotate : 40,
			},
			type : 'category',// 坐标轴类型，横轴默认为类目型'category'，纵轴默认为数值型'value'
			data : res
		} ],
		yAxis : [ {
			min : 0,
			max : 100,
			axisLabel : {
				formatter : '{value}%'
			}
		} ],
		series : [
				{
					name : 'jvm内存使用率',
					type : 'line',
					data : [ 12, 25, 31, 11, 45, 50, 11, 09, 28, 35, 40, 24,
							28, 39, 23, 31, 14, 18, 08, 36 ]
				},
				{
					name : '物理内存使用率',
					type : 'line',
					data : [ 55, 41, 10, 23, 15, 44, 29, 41, 27, 05, 12, 25,
							31, 11, 45, 50, 11, 09, 28, 35 ]
				},
				{
					name : 'cpu使用率',
					type : 'line',
					data : [ 40, 24, 28, 39, 23, 31, 14, 18, 08, 36, 55, 41,
							10, 23, 15, 44, 29, 41, 27, 05 ]
				} ]
	};
	myChart.setOption(option);
	var main_one = echarts.init(document.getElementById('main_one'));
	var main_two = echarts.init(document.getElementById('main_two'));
	var main_three = echarts.init(document.getElementById('main_three'));
	one_option = {
		    tooltip : {
		        formatter: "{a} <br/>{b} : {c}%"
		    },
		    toolbox: {
		        feature: {
		            restore: {},
		            saveAsImage: {}
		        }
		    },
		    series: [
		             {	
		            	 title:{
			        	    show : true,
			        	    offsetCenter: [0, "95%"],
			        	 },
		            	 name:'监控指标',
		                 type: 'gauge',
		                 pointer: {
			                 color: '#FF0000'
			             },
			             axisLine: {            // 坐标轴线
				                lineStyle: {       // 属性lineStyle控制线条样式
				                    width: 20
				                }
				            },
				         radius:'80%',
		                 detail: {formatter:'{value}%'},
		                 data: [{value: 50, name: 'JVM使用率'}]
		             }
		         ]
		    /*series : [
		        {
		        	title:{
		        	    show : true,
		        	    offsetCenter: [0, "95%"],
		        	 },
		        	 pointer: {
		                 color: '#FF0000'
		             },
		             name:'监控指标',
		            radius:[0, 95],
		            axisLine: {            // 坐标轴线
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    width: 20
		                }
		            },
		            detail : {formatter:'{value}%'},
		            type:'gauge',
		            data:[{value: 50, name: 'JVM使用率'}]
		        }
		    ]*/
		};
	 two_option = {
			 tooltip : {
			        formatter: "{a} <br/>{b} : {c}%"
			    },
			    series : [
			        {
			            name:'监控指标',
			            type:'gauge',
			            startAngle: 180,
			            endAngle: 0,
			            center : ['50%', '90%'],    // 默认全局居中
			            radius : 180,
			            axisLine: {            // 坐标轴线
			                lineStyle: {       // 属性lineStyle控制线条样式
			                    width: 60
			                }
			            },
			            axisTick: {            // 坐标轴小标记
			                splitNumber: 10,   // 每份split细分多少段
			                length :12,        // 属性length控制线长
			            },
			            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
			               
			                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                    color: '#fff',
			                    fontSize: 15,
			                    fontWeight: 'bolder'
			                }
			            },
			          
			            pointer: {
			                width:10,
			                length: '80%',
			                color: 'rgba(255, 255, 255, 0.8)'
			            },
			            title : {
			                show : true,
			                offsetCenter: [0, 15],       // x, y，单位px
			               /* textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                    color: '#fff',
			                    fontSize: 25
			                }*/
			            },
			            detail : {
			                show : true,
			                backgroundColor: 'rgba(0,0,0,0)',
			                borderWidth: 0,
			                borderColor: '#ccc',
			                offsetCenter: [0, -40],       // x, y，单位px
			                formatter:'{value}%',
			                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                    fontSize : 20
			                }
			            },
			            data:[{value: 50, name: 'cpu使用率'}]
			        }
			    ]
			};

	 main_one.setOption(one_option);
	 main_two.setOption(two_option);
	 one_option.series[0].data[0].name ='内存使用率';
	 one_option.series[0].pointer.color='#428bca'
	 main_three.setOption(one_option);
	clearInterval(timeTicket);
	var timeTicket = setInterval(function() {
		$.ajax({
			type : "POST",
			url : $$ctx + '/monitor/usage',
			async : false,
			dataType : 'json',
			success : function(json) {
				$("#td_jvmUsage").html(json.jvmUsage);
				$("#td_serverUsage").html(json.ramUsage);
				$("#td_cpuUsage").html(json.cpuUsage);
				
				var time = new Date().toLocaleTimeString().replace(/^\D*/, '');
				time = time.substr(time.indexOf(":") + 1);
				res.push(time);
				res.shift();
				option.series[0].data.push(json.jvmUsage);
				option.series[0].data.shift();
				option.series[1].data.push(json.ramUsage);
				option.series[1].data.shift();
				option.series[2].data.push(json.cpuUsage);
				option.series[2].data.shift();
				
				myChart.setOption(option, true);
				
				one_option.series[0].data[0].value =json.jvmUsage;
				one_option.series[0].data[0].name ='JVM使用率';
				one_option.series[0].pointer.color='#FF0000'
				main_one.setOption(one_option, true);
				
				two_option.series[0].data[0].value =json.cpuUsage;
				main_two.setOption(two_option, true);
				
				one_option.series[0].data[0].value =json.ramUsage;
				 one_option.series[0].data[0].name ='内存使用率';
				 one_option.series[0].pointer.color='#428bca'
				main_three.setOption(one_option, true);
			}
		});
	}, 3000);
	
});