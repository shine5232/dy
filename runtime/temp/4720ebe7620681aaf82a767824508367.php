<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:82:"D:\phpstudy\PHPTutorial\WWW\dy\public/../application/index\view\base\position.html";i:1572060832;}*/ ?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<style type="text/css">
			#title {
				display: flex;
				align-items: center;
				position: relative;
				bottom: 0;
			}

			.left,
			.right {
				padding: 7px 10px;
				text-align: center;
			}

			.left {
				background-color: #317528;
				color: #fff;
			}

			.right {
				background-color: #5F3B3B;
				color: #fff;
			}

			.box #allmap {
				overflow: hidden;
				position: absolute;
				width: 48%;
				height: 100%;
				left: 0;
				top: 65px;
				padding: 40px 0;
				border: 4px solid #fff;
			}

			.box .layui-fluid {
				position: absolute;
				right: 0;
				width: 50%;
				top: 49px;
				padding: 15px;
				margin: 0 0 !important;
			}

			.top-box {
				display: flex;
				align-items: center;
			}

			.box-select {
				margin-right: 10px;
			}

			.right-btn {
				margin-left: 10px;
			}

			.addr-box {
				display: flex;
				align-content: center;
				padding: 5px 15px;
			}

			.addr {
				padding: 5px 10px;
				width: 100%;
				flex: 1;
				border: 1px solid #f2f2f2;
			}
		</style>
		<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=VeFpGPW4ycBTpLBivwGyvd2rYixLK5Rn"></script>
		<link rel="stylesheet" href="../../static/css/font.css">
		<link rel="stylesheet" href="../../static/css/xadmin.css">
		<script src="../../static/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="../../static/js/xadmin.js"></script>
		<title>地图展示</title>
	</head>
	<body>
		<div class="x-nav"> <span class="layui-breadcrumb"> <a href="">首页</a> <a href="">基础管理</a> <a> <cite>位置</cite></a>
			</span> <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload();"
			 title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> </div>
		<div class="box">
			<div id="allmap"></div>
			<div class="layui-fluid">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-body ">
								<form class="layui-form">
									<div class="top-box">
										<div class="box-select">
											<select name="device_id" id="device_id" class="layui-select">
												<option value="">请选择</option>
												<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?>
												<option value="<?php echo $l['device_id']; ?>"><?php echo $l['device_no']; ?></option>
												<?php endforeach; endif; else: echo "" ;endif; ?>
											</select>
										</div>
										<div id="title">
											<div class="left">经度：<font class="lng">120.009</font>
											</div>
											<div class="right">纬度：<font class="lat">37.098</font>
											</div>
											<div class="right-btn">
												<input type="submit" class="layui-btn" lay-filter="add" lay-submit value="添加">
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="addr-box">
								<div class="addr"></div>
							</div>
							<div class="layui-card-body">
								<table id="pos" lay-filter="test">
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- <div id="title">
			<div class="left">经度：<font class="lng">120.009</font>
			</div>
			<div class="right">纬度：<font class="lat">37.098</font>
			</div>
		</div> -->


	</body>
</html>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例
	map.centerAndZoom(new BMap.Point(121.43, 37.50), 14); // 初始化地图,设置中心点坐标和地图级别
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
	var mousemove = true;//是否开启鼠标滑动获取经纬度,默认true
	map.addEventListener("mousemove", move);
	map.addEventListener("click", function(e) {
		if(mousemove){
			map.removeEventListener("mousemove",move);
		}else{
			map.addEventListener("mousemove", move);
		}
		mousemove = !mousemove;
	});
	var myGeo = new BMap.Geocoder(); 
	locationAddr(121.43,37.50);
	function move(e) {
		$(".lng").text(e.point.lng);
		$(".lat").text(e.point.lat);
		locationAddr(e.point.lng,e.point.lat);
	}
	//获取位置
	function locationAddr(lng,lat){
		myGeo.getLocation(new BMap.Point(lng,lat), function(result){
		    if (result){      
				$(".addr").text(result.address);
		    }      
		});
	}
	var table, tableIns, layer;
	layui.use(['laydate', 'form', 'table', 'layer'], function() {
		var form = layui.form;
		table = layui.table;
		layer = layui.layer;
		tableIns = table.render({
			elem: '#pos',
			limit: 10,
			url: './posList' //数据接口
				,
			page: true //开启分页
				,
			cols: [
				[ //表头
					{
						field: 'pos_id',
						title: 'ID',
						width: '10%',
						sort: true,
						fixed: 'left',
						align: 'center'
					}, {
						field: 'device_code',
						title: '设备编码',
						width: '16%',
						align: 'center'
					}, {
						field: 'lng',
						title: '经度',
						width: '16%',
						align: 'center'
					}, {
						field: 'lat',
						title: '纬度',
						width: '16%',
						align: 'center'
					}, {
						field: 'created_at',
						title: '创建时间',
						width: '16%',
						sort: true,
						align: 'center'
					}, {
						field: 'updated_at',
						title: '更新时间',
						width: '16%',
						align: 'center'
					}, {
						field: 'tool1',
						title: '操作',
						width: '10%',
						align: 'center',
						templet: function(d) {
							return '<a href="javascaript:;" onclick="delPos(' + d.pos_id +
								');"><i class="iconfont">&#xe69d;</i></a>';
						}
					}
				]
			]
		});
		
		form.on('submit(add)', function(data) {
			var lng = $(".lng").text();
			var lat = $(".lat").text();
			layer.load(0);
			$.post('./poAddSubmit', {
				lng: lng,
				lat: lat,
				device_id: data.field.device_id
			}, function(j) {
				layer.closeAll();
				if (j.status == 'success') {
					layer.msg('添加成功', {
						icon: 1,
						time: 2000
					}, function() {});
					tableIns.reload();
				}
				if (j.status == 'have') {
					layer.msg('已存在相同的记录', {
						icon: 21,
						time: 2000
					}, function() {});
				}
				if (j.status == 'error') {
					layer.msg('添加失败', {
						icon: 2,
						time: 2000
					}, function() {});
				}
			}, 'json');
			return false;
		});
		//自定义验证规则
		form.verify({
			no: [/^[\S\s]{1,20}$/, '不超过20字符'],
		});
	});
	
	//删除私信
	function delPos(id) {
	    layer.confirm('确定要删除该评论内容吗？', function () {
	        layer.load(0);
	        $.post('./posDel', { pos_id: id }, function (j) {
	            layer.closeAll();
	            if (j.status == 'success') {
	                layer.msg('已删除', { icon: 1, time: 2000 }, function () { });
	                tableIns.reload();
	            }
	            if (j.status == 'error') {
	                layer.msg('删除失败', { icon: 2, time: 2000 }, function () { });
	            }
	        });
	    });
	}
</script>
