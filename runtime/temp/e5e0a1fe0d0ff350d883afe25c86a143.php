<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:65:"D:\phpStudy\WWW\dy\public/../application/index\view\msg\priv.html";i:1572059898;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>私信管理</title>
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
<div class="x-nav"> <span class="layui-breadcrumb"> <a href="">首页</a> <a href="">消息内容管理</a> <a> <cite>私信</cite></a> </span> <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> </div>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-body ">
          <form class="layui-form layui-col-space5">
			  <div class="layui-row layui-col-space10">
			  	<div class="layui-col-md1">
				  <select name="industry_id" id="industry_id" class="layui-select">
					<option value="">请选择</option>
				<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $l['industry_id']; ?>"><?php echo $l['industry_name']; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
				</div>
				  <div class="layui-col-md10">
				  <input type="text" id="priv_content" name="priv_content" lay-verify="priv_content"  placeholder="输入私信内容" autocomplete="off" class="layui-input">
				</div>
				  <div class="layui-col-md1">
				  <input type="submit" class="layui-btn" lay-filter="add" lay-submit value="添加">
				</div>
			  </div>
          </form>
        </div>
        <div class="layui-card-body">
          <table id="priv">
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
				priv_content: [/^[\S\s]{1,200}$/, '不超过200字符'],
			});
		  
		  //添加行业
		  form.on('submit(add)',function(data){
			  $('#priv_content').val('').focus();
			  layer.load(0);
				$.post('./privAddSubmit',data.field,function(j){
					layer.closeAll();
					if(j.status == 'success'){
						layer.msg('添加成功',{icon:1,time:2000},function(){});
						tableIns.reload();
					}
					if(j.status == 'have'){
						layer.msg('已存在相同的记录',{icon:21,time:2000},function(){});
					}
					if(j.status == 'error'){
						layer.msg('添加失败',{icon:2,time:2000},function(){});
					}
				},'json');
				return false;
		  });
		  
		tableIns =  table.render({
						elem: '#priv'
						,limit:10
						,url: './privList' //数据接口
						,page: true //开启分页
						,cols: [[ //表头
						  {field: 'priv_id', title: 'ID', width:'3%', sort: true, fixed: 'left',align:'center'}
						  ,{field: 'priv_content', title: '私信内容', width:'60%',align:'center'}
						  ,{field: 'industry_name', title: '行业', width: '4%',align:'center'}
						  ,{field: 'tool0', title: '是否启用', width: '6%',align:'center',templet:function(d){
							  return '<div class="layui-input-inline"><input type="checkbox" name="switch" value="" lay-skin="switch" lay-text="ON|OFF" lay-filter="cc" data-priv-id="'+d.priv_id+'" '+(d.is_can==0?'':'checked')+'>';
						  }}
						  ,{field: 'created_at', title: '创建时间', width:'9%', sort: true,align:'center'}
						  ,{field: 'updated_at', title: '更新时间', width:'9%',align:'center'} 
						  ,{field:'tool',title:'操作',width:'6%',align:'center',templet: function(d){
								return '<a href="javascaript:;" onclick="xadmin.open(\'编辑私信内容\',\'/index/Msg/privEdit?priv_id='+d.priv_id+'\',500,300);"><i class="iconfont">&#xe69e;</i></a> | <a href="javascaript:;" onclick="delPriv('+d.priv_id+');"><i class="iconfont">&#xe69d;</i></a>';
						  }}
						]]
			  });
		  
		  form.on('switch(cc)',function(data){
			  var t = data.elem;
			  var id = $(t).attr('data-priv-id');
			  
			  $.post('./setPrivCan',{id:id},function(j){
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
		function updatePriv(){
			layer.msg('修改成功',{icon:1,time:2000},function(){});
			tableIns.reload();
		}
	//删除私信
	function delPriv(id){
		layer.confirm('确定要删除该私信内容吗？',function(){
			layer.load(0);
			$.post('/index/Msg/privDel',{priv_id:id},function(j){
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