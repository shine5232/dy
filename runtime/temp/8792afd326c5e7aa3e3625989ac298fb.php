<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:70:"D:\phpStudy\WWW\dy\public/../application/index\view\base\industry.html";i:1572246221;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>行业管理</title>
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
<div class="x-nav"> <span class="layui-breadcrumb"> <a href="">首页</a> <a href="">基础管理</a> <a> <cite>行业</cite></a> </span> <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> </div>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-body ">
          <form class="layui-form layui-col-space5">
            <div class="layui-inline layui-show-xs-block">
              <input type="text" id="industry_name" name="industry_name" lay-verify="industry"  placeholder="请输入行业名称" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline layui-show-xs-block">
              <input type="submit" class="layui-btn" lay-filter="add" lay-submit value="添加">
            </div>
          </form>
        </div>
        <div class="layui-card-body">
          <table id="industry">
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
		  
		  //自定义验证规则
			form.verify({
				industry: [/^\S{1,20}$/, '不超过20字符'],
			});
		  
		  //添加行业
		  form.on('submit(add)',function(data){
			  $('#industry_name').val('').focus();
			  layer.load(0);
				$.post('./industryAddSubmit',data.field,function(j){
					layer.closeAll();
					if(j.status == 'success'){
						layer.msg('添加成功',{icon:1,time:2000},function(){});
						tableIns.reload();
					}
					if(j.status == 'have'){
						layer.msg('已存在相同名称的行业分类',{icon:21,time:2000},function(){});
					}
					if(j.status == 'error'){
						layer.msg('添加失败',{icon:2,time:2000},function(){});
					}
				},'json');
				return false;
		  });
		  
		tableIns =  table.render({
						elem: '#industry'
						,limit:10
						,url: './industryList' //数据接口
						,page: true //开启分页
						,cols: [[ //表头
						  {field: 'industry_id', title: 'ID', width:'8%', sort: true, fixed: 'left',align:'center'}
						  ,{field: 'industry_name', title: '行业名称', width:'50%',align:'center'}
						  ,{field: 'created_at', title: '创建时间', width:'15%', sort: true,align:'center'}
						  ,{field: 'updated_at', title: '更新时间', width:'15%',align:'center'} 
						  ,{field:'tool',title:'操作',width:'12%',align:'center',templet: function(d){
								return '<a href="javascaript:;" onclick="xadmin.open(\'编辑行业\',\'/index/Base/industryEdit?industry_id='+d.industry_id+'\',500,170);"><i class="iconfont">&#xe69e;</i></a> | <a href="javascaript:;" onclick="delIndustry('+d.industry_id+');"><i class="iconfont">&#xe69d;</i></a>';
						  }}
						]]
			  });
      });
	//删除行业
	function delIndustry(id){
		layer.confirm('确定要删除该行业分类？',function(){
			layer.load(0);
			$.post('./industryDel',{industry_id:id},function(j){
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