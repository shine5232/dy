<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:67:"D:\phpStudy\WWW\dy\public/../application/index\view\menu\index.html";i:1573287486;s:60:"D:\phpStudy\WWW\dy\application\index\view\common\header.html";i:1573182143;s:60:"D:\phpStudy\WWW\dy\application\index\view\common\footer.html";i:1573115317;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <link rel="stylesheet" href="../../static/css/font.css">
        <link rel="stylesheet" href="../../static/css/xadmin.css">
        <link rel="stylesheet" href="../../static/css/formcss.css">
        <script src="../../static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="../../static/js/xadmin.js"></script>
		<script type="text/javascript" src="../../static/js/echarts.min.js"></script>
    </head>
    <body>
<div class="x-nav">
	<span class="layui-breadcrumb">
		<a href="">首页</a> <a href="">菜单管理</a> <a> <cite>菜单列表</cite></a>
	</span>
	<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
		<i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
	</a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
              <form class="layui-form">
                <div class="layui-card-header">
                  <button class="layui-btn layui-btn-danger" onclick="delAll()">
                    <i class="layui-icon layui-icon-delete"></i>批量删除
                  </button>
                  <button class="layui-btn" onclick="xadmin.open('增加菜单','/index/menu/add',550,700)">
                  	<i class="layui-icon layui-icon-add-circle-fine"></i>增加菜单
                  </button>
                  <button class="layui-btn layui-btn-normal" lay-filter="order" lay-submit="">
                    <i class="layui-icon layui-icon-refresh"></i>重新排序
                  </button>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table layui-form">
                      <thead>
                        <tr>
                          <th class="th-checkbox" width="20">
                            <input type="checkbox" name="" lay-skin="primary">
                          </th>
                          <th width="100">排序</th>
                          <th width="70">ID</th>
                          <th>菜单名称</th>
                          <th width="80">状态</th>
                          <th width="250">操作</th>
                        </tr>
                      </thead>
                      <tbody class="x-cate">
                        <?php echo $category; ?>
                      </tbody>
                    </table>
                </div>
              </form>
                <!-- <div class="layui-card-body">
                    <div class="page" id="page"></div>
                </div> -->
            </div>
        </div>
    </div>
</div>
<script>
  /*layui.use(['form','laypage'], function(){
    var form = layui.form,
        laypage = layui.laypage;
    laypage.render({
      elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
      ,count: 100
      ,layout: ['count','prev','page','next','limit','skip']
      ,jump: function(obj){
        console.log(obj)
      }
    });
  });*/
  layui.use(['form'], function(){
    var form = layui.form;
    form.on('switch(switch)', function(data){
      var id = $(data.elem).attr('data-id');
      if(data.elem.checked){
        var status = 1;
      }else{
        var status = 0;
      }
      $.post('/index/menu/update_status',{id:id,status:status},function(j){
        layer.msg(j.msg,{
          icon:1,
          time:1500
        });
      },'json');
    });
    form.on('submit(order)',function(data){
      $.post('/index/menu/list_order',data.field,function(j){
        layer.msg(j.msg,{
          icon:1,
          time:1500
        });
        setTimeout(function(){
          window.location.reload();
        },1500);
      },'json');
      return false;
    });
  });
  function close(){
      // 获得frame索引
      var index = parent.layer.getFrameIndex(window.name);
      //关闭当前frame
      parent.layer.close(index);
  }
   /*用户-删除*/
  function member_del(obj,id){
      layer.confirm('确认要删除吗？',function(index){
          //发异步删除数据
          $.post('/index/menu/delete',{id:id},function(j){
            layer.closeAll();
            if(j.status == 'success'){
              $(obj).parents("tr").remove();
            }
            layer.msg(j.msg,{
              icon:1,
              time:1500
            },function(){
              close();
            });
          },'json');
      });
  }

  // 分类展开收起的分类的逻辑
  // 
  $(function(){
    $("tbody.x-cate tr[fid!='0']").hide();
    // 栏目多级显示效果
    $('.x-show').click(function () {
        if($(this).attr('status')=='true'){
            $(this).html('&#xe625;'); 
            $(this).attr('status','false');
            cateId = $(this).parents('tr').attr('cate-id');
            $("tbody tr[fid="+cateId+"]").show();
       }else{
            cateIds = [];
            $(this).html('&#xe623;');
            $(this).attr('status','true');
            cateId = $(this).parents('tr').attr('cate-id');
            getCateId(cateId);
            for (var i in cateIds) {
                $("tbody tr[cate-id="+cateIds[i]+"]").hide().find('.x-show').html('&#xe623;').attr('status','true');
            }
       }
    })
  })

  var cateIds = [];
  function getCateId(cateId) {
      $("tbody tr[fid="+cateId+"]").each(function(index, el) {
          id = $(el).attr('cate-id');
          cateIds.push(id);
          getCateId(id);
      });
  }

</script>
</body>
</html>