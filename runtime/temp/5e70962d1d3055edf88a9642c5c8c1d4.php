<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:78:"D:\phpstudy\PHPTutorial\WWW\dy\public/../application/index\view\base\user.html";i:1567389794;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>用户统计管理</title>
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
<div class="x-nav"> <span class="layui-breadcrumb"> <a href="">首页</a> <a href="">统计管理</a> <a> <cite>采集用户统计</cite></a> </span> <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> </div>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-body">
          <table id="user">
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
						elem: '#user'
						,limit:20
						,url: '/index/Base/userList' //数据接口
						,page: true //开启分页
						,cols: [[ //表头
						  {field: 'user_id', title: 'ID', width:'10%', sort: true, fixed: 'left',align:'center'}
						  ,{field: 'no', title: '抖音号', width:'16%', fixed: 'left',align:'center'}
						  ,{field: 'sex', title: '性别', width:'12%', sort: true, fixed: 'left',align:'center',templet:function(d){
							  return d.sex == 2?'保密':(d.sex == 0?'男':'女');
						  }}
						  ,{field: 'a', title: '点赞量', width:'13%', sort: true, fixed: 'left',align:'center',templet:function(d){
							  return parseInt(d.a)>100000000?((parseInt(d.a)*0.00000001).toFixed(1) + '亿'):(parseInt(d.a)>10000?((parseInt(d.a)*0.0001).toFixed(1) + '万'):(d.a));
						  }}
						  ,{field: 'b', title: '关注量', width:'13%', sort: true, fixed: 'left',align:'center',templet:function(d){
							  return parseInt(d.a)>100000000?((parseInt(d.a)*0.00000001).toFixed(1) + '亿'):(parseInt(d.a)>10000?((parseInt(d.a)*0.0001).toFixed(1) + '万'):(d.a));
						  }}
						  ,{field: 'c', title: '粉丝量', width:'13%', sort: true, fixed: 'left',align:'center',templet:function(d){
							  return parseInt(d.a)>100000000?((parseInt(d.a)*0.00000001).toFixed(1) + '亿'):(parseInt(d.a)>10000?((parseInt(d.a)*0.0001).toFixed(1) + '万'):(d.a));
						  }}
						  ,{field: 'created_at', title: '创建时间', width:'12%', sort: true,align:'center'}
						  ,{field:'tool',title:'操作',width:'10%',align:'center',templet: function(d){
								return '<a href="javascaript:;" onclick="delUser('+d.user_id+');"><i class="iconfont">&#xe69d;</i></a>';
						  }}
						]]
			  });
      });
	
	//删除用户
	function delUser(id){
		layer.confirm('确定要删除该用户？',function(){
			layer.load(0);
			$.post('/index/Base/userDel',{user_id:id},function(j){
				layer.closeAll();
				if(j.status == 'success'){
					layer.msg('已删除',{icon:1,time:2000},function(){});
					tableIns.reload();
				}
				if(j.status == 'error'){
					layer.msg('删除失败',{icon:2,time:2000},function(){});
				}
			});
		});
	}
	
    </script>
</html>