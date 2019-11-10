<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:76:"D:\phpstudy\PHPTutorial\WWW\dy\public/../application/index\view\base\no.html";i:1572059957;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>抖音号管理</title>
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
<div class="x-nav"> <span class="layui-breadcrumb"> <a href="">首页</a> <a href="">消息内容管理</a> <a> <cite>抖音号管理</cite></a> </span> <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload();" title="刷新"> <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a> </div>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <!--<div class="layui-card-body ">
          <form class="layui-form layui-col-space5">
			<div class="layui-inline layui-show-xs-block">
				<select name="industry_id" id="industry_id" class="layui-select">
					<option value="">请选择</option>
					<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $l['industry_id']; ?>"><?php echo $l['industry_name']; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
            </div>
            <div class="layui-inline layui-show-xs-block">
              <input type="text" id="no" name="no" lay-verify="no"  placeholder="输入抖音号" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline layui-show-xs-block">
              <input type="submit" class="layui-btn" lay-filter="add" lay-submit value="添加">
            </div>
          </form>
        </div>-->
        <div class="layui-card-body">
          <table id="not" lay-filter="test">
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
				no: [/^[\S\s]{1,20}$/, '不超过20字符'],
			});
		  
		tableIns =  table.render({
						elem: '#not'
						,limit:100
						,url: './noList' //数据接口
						,page: true //开启分页
						,cols: [[ //表头
						  {field: 'no_id', title: 'ID', width:'11%', sort: true, fixed: 'left',align:'center'}
                          ,{ field: 'device_no', title: '设备号', width: '12%', align: 'center' }
                          ,{ field: 'no', title: '抖音号', width: '11%', align: 'center' }
                          ,{ field: 'v_no', title: '大V号', width: '11%', align: 'center',templet: function(d){
								return '<a href="javascaript:;" onclick="xadmin.open(\'历史记录\',\'/index/Base/history?v_no='+d.v_no+'\');">'+d.v_no+'</a>';
						  }}
                          ,{ field: 'a', title: '获赞数', width: '11%', align: 'center' }
                          ,{ field: 'b', title: '关注数', width: '11%', align: 'center' }
                          ,{ field: 'c', title: '粉丝数', width: '11%', align: 'center' }
						  ,{field: 'created_at', title: '创建时间', width:'11%', sort: true,align:'center'}
						  ,{field: 'updated_at', title: '更新时间', width:'11%',align:'center'} 
						]]
			  });
      });
	
    </script>
</html>