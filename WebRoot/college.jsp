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
  
  <body onload="generateMap('servlet/FindCollegeAction','map','normal');">
    <h2 style="width:100%;text-align:center;font-size:36px;background:#e0e0e0;">黑龙江普通高校分布</h2>
	<div id="barshow" style="float:left;width:30%;min-height:93%;"></div>
	<div id="map" style="max-width:70%;min-height:93%;margin:0px auto;"></div>
	<div id="search" style="width:980px;height:1000px;top:80px;left:30px;position:absolute;display:none;">
		<div id="close" style="top:14px;left:-58px;position:absolute;width:980px;text-align:right;"><a href="javascript:hide()"><input type="button" value="关闭" style="width:55px;height:26px;font-size:14px;"/></a></div>
		<iframe id="iframe" name="layer_iframe" src=""
			scrolling="yes" height="100%" width="100%" frameborder="0"></iframe>
	</div>
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
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('barshow')); 
                
                var option = {
                    /* title: {
                        textStyle:{
                            fontSize:30,
                        },
                        x:'center'
                    }, */
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        },
                        formatter: function (params) {
                            var tar = params[0];
                            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
                        }
                    },
                    grid:{
                    	y:50,
                    	x:100
                    },
                    yAxis : [
                        {
                            type : 'category',
                            splitLine: {show:false},
                            data : ['总数','哈尔滨','齐齐哈尔','大庆','牡丹江','佳木斯','黑河','绥化','伊春','鸡西','双鸭山','鹤岗','七台河','大兴安岭'],
                            axisLabel:{
                            	interval:0,
                            	textStyle:{
	                            	fontSize: 20,
	                            	fontWeight: 'bolder'
	                            }
                            },
                        }
                    ],
                    xAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'辅助',
                            type:'bar',
                            stack: '总量',
                            itemStyle:{
                                normal:{
                                    barBorderColor:'rgba(0,0,0,0)',
                                    color:'rgba(0,0,0,0)'
                                },
                                emphasis:{
                                    barBorderColor:'rgba(0,0,0,0)',
                                    color:'rgba(0,0,0,0)'
                                }
                            },
                            data:[0, 26,21, 16, 12,9,7,6,5,4,3,2,1,0]
                        },
                        {
                            name:'高校数量',
                            type:'bar',
                            stack: '总量',
                            itemStyle : { normal: {label : {show: true, position: 'inside'}}},
                            data:[80, 54, 5, 5, 4, 3,1,1,1,1,1,1,1,1]
                        }
                    ]
                };
                myChart.setOption(option);
                myChart.on('click', function (param) {
                });
                window.onresize = myChart.resize;
            }
        );
        function hide(){
        	$("#search").hide();
        }
    </script>
  </body>
</html>
