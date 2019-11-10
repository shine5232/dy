<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:80:"D:\phpstudy\PHPTutorial\WWW\dy\public/../application/index\view\base\device.html";i:1572246242;}*/ ?>
      <!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>设备管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="../../static/css/font.css">
<link rel="stylesheet" href="../../static/css/xadmin.css">
<script src="../../static/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../../static/js/xadmin.js"></script>
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
<div class="x-nav"> <span class="layui-breadcrumb"> <a href="">首页</a> <a href="">基础管理</a> <a> <cite>设备</cite></a> </span> <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> </div>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-body">
          <table id="not">
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script>
		var table,tableIns,layer;
      layui.use(['laydate','form','table','layer'], function(){
        var form = layui.form;
		table = layui.table;
		layer = layui.layer;
		  
		tableIns =  table.render({
				elem: '#not'
				,limit:10
				,url: './deviceList' //数据接口
				,page: true //开启分页
				,cols: [[ //表头
				  {field: 'device_id', title: 'ID', width:'10%', sort: true, fixed: 'left',align:'center'}
				  ,{ field: 'device_no', title: '设备编码', width: '10%', align: 'center' }
				  ,{ field: 'industry_name', title: '行业', width: '15%', align: 'center' }
				  ,{ field: 'app_name', title: 'app', width: '15%', align: 'center' }
				  ,{field: 'tool8', title: '脚本开关', width: '15%',align:'center',templet:function(d){
						return '<div class="layui-input-inline"><input type="checkbox" name="switch" value="5" lay-skin="switch" lay-text="ON|OFF" lay-filter="cc" data-device-id="'+d.device_id+'" '+(d.no == ''?'disabled':(d.is_on==0?'':'checked'))+'>';
				   }}
				  ,{field: 'created_at', title: '创建时间', width:'12%', sort: true,align:'center'}
				  ,{field: 'updated_at', title: '更新时间', width:'13%',align:'center'}
				  ,{field:'tool2',title:'操作',width:'10%',align:'center',templet: function(d){
						return '<a href="javascaript:;" onclick="xadmin.open(\'绑定行业\',\'/index/Base/industryBind?device_id='+d.device_id+'\',460,360);" title="绑定行业"><i class="iconfont">&#xe72a;</i></a>';
				  }}
				]]
			});
		  
		  form.on('switch(cc)',function(data){
			  var t = data.elem;
			  var v = data.value;
			  var deviceId = $(t).attr('data-device-id');
			  
			  $.post('./setSwitch',{device_id:deviceId,v:v},function(j){
					if(j.status == 'success'){
						if(j.msg == 0){
							$(t).removeAttr('checked');
						}
						if(j.msg == 1){
							$(t).attr('checked');
						}
					}
				    if(j.status == 'error'){
						layer.msg('设置失败');
					}
			  });
		  });
      });
	
	
	//编辑后更新单元格数据
	function updateIndustry(){
		layer.msg('绑定成功',{icon:1,time:2000},function(){});
		tableIns.reload();
	}

	
    </script>
</html>