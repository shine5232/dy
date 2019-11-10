<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:87:"D:\phpstudy\PHPTutorial\WWW\dy\public/../application/index\view\base\industry_bind.html";i:1572318592;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>行业绑定</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../../static/css/font.css">
        <link rel="stylesheet" href="../../static/css/xadmin.css">
        <script type="text/javascript" src="../../static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../../static/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
				  <input type="hidden" value="<?php echo \think\Request::instance()->param('device_id'); ?>" name="device_id">
				  <div class="layui-form-item">
					  <label for="industry_name" class="layui-form-label">
                          <span class="x-red">*</span>选择行业
                      </label>
                      <div class="layui-input-inline">
                          <select name="industry_id" id="industry_id" class="layui-select">
							  <option value="">--解绑选择此项--</option>
								<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$l): $mod = ($i % 2 );++$i;?>
								<option value="<?php echo $l['industry_id']; ?>" <?php if($l['industry_id'] == $r['industry_id']): ?>selected<?php endif; ?>><?php echo $l['industry_name']; ?></option>
								<?php endforeach; endif; else: echo "" ;endif; ?>
							</select>
                      </div>
				  </div>
                  
                  <div class="layui-form-item">
                      <label for="" class="layui-form-label">
                      </label>
                      <button  class="layui-btn" lay-filter="bind" lay-submit>
                          确认绑定
                      </button>
                  </div>
              </form>
            </div>
        </div>
        <script>
			layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //监听提交
                form.on('submit(bind)',function(data) {
                    layer.load(0);
					$.post('/index/Base/industryBindSubmit',data.field,function(j){
						layer.closeAll();
						if(j.status == 'success'){
							xadmin.close();
							window.parent.updateIndustry();
						}
						if(j.status == 'have'){
							layer.msg('该行业已绑定设备',{icon:2,time:2000},function(){});
						}
						if(j.status == 'error'){
							layer.msg('修改失败',{icon:2,time:2000},function(){});
						}
					},'json');
                    return false;
                });

            });
		</script>
    </body>

</html>
