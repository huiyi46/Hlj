<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jq.js"></script>
	<script type="text/javascript" src="js/map.js"></script>
	<script type="text/javascript" src="citydata.json"></script>
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>
  </head>
  
  <body >
    <h2 style="width:100%;text-align:center;font-size:36px;background:#e0e0e0;">黑龙江省研发人员数据</h2>
	<div id="barshow" style="float:left;width:100%;min-height:93%;"></div>
	<div id="jump" style="top:10px;left:10px;position:absolute;"><a href="hlj_V2/cat/index.html"><input type="button" value="返回" style="width:70px;height:35px;font-size:18px;"/></a></div>
    <script src="build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'build/dist'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/bar'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('barshow')); 
                
                var option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend:{
				    	data:['研发人员','研究人员','基础研究','应用研究','试验发展']
				    },
				    xAxis : [
				        {
				            type : 'category',
				            splitLine: {show:false},
				            data : ['2010','2011','2012','2013'],
				            axisLabel:{
                            	interval:0,
                            	textStyle:{
	                            	fontSize: 20,
	                            	fontWeight: 'bolder'
	                            }
                            }
				        }
				    ],
				    grid:{
                    	y:50,
                    	x:100
                    },
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel:{
                            	interval:0,
                            	textStyle:{
	                            	fontSize: 20,
	                            	fontWeight: 'bolder'
	                            }
                            }
				        }
				    ],
				    series : [
				        {
				            name:'研发人员',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top'
				            		}
				            	}
				            },
				            data:[61854,66599,65118,62660]
				        },
				        {
				            name:'研究人员',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top'
				            		}
				            	}
				            },
				            data:[38587,42883,41196,41050]
				        },
				        {
				            name:'基础研究',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top'
				            		}
				            	}
				            },
				            data:[7408,7691,10168,10476]
				        },
				        {
				            name:'应用研究',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top'
				            		}
				            	}
				            },
				            data:[8397,8415,8717,8159]
				        },
				        {
				            name:'试验发展',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top'
				            		}
				            	}
				            },
				            data:[46052,50494,46233,44025]
				        }
				    ]
				};
                myChart.setOption(option);
                myChart.on('click', function (param) {
                });
                window.onresize = myChart.resize;
            }
        );
    </script>
  </body>
</html>
