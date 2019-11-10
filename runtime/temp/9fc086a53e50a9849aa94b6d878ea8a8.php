<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:69:"D:\phpStudy\WWW\dy\public/../application/index\view\user\modpass.html";i:1564652620;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>修改密码</title>
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
				  <div class="layui-form-item">
                      <label for="L_pass" class="layui-form-label">
                          <span class="x-red">*</span>原密码
                      </label>
                      <div class="layui-input-inline">
                          <input type="password" id="L_pass" name="oldpass" required="" lay-verify="oldpass"
                          autocomplete="off" class="layui-input">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          5到12个字符
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="L_pass" class="layui-form-label">
                          <span class="x-red">*</span>新密码
                      </label>
                      <div class="layui-input-inline">
                          <input type="password" id="L_newpass" name="newpass" required="" lay-verify="newpass"
                          autocomplete="off" class="layui-input">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          5到12个字符
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="L_repass" class="layui-form-label">
                          <span class="x-red">*</span>确认密码
                      </label>
                      <div class="layui-input-inline">
                          <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                          autocomplete="off" class="layui-input">
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="L_repass" class="layui-form-label">
                      </label>
                      <button  class="layui-btn" lay-filter="mod" lay-submit="">
                          确认修改
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

                //自定义验证规则
                form.verify({
                    oldpass: [/(.+){5,12}$/, '密码必须6到12位'],
                    newpass: [/(.+){5,12}$/, '密码必须6到12位'],
                    repass: function(value) {
                        if ($('#L_newpass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });

                //监听提交
                form.on('submit(mod)',function(data) {
                    layer.load(0);
					$.post('/index/User/modpassword',data.field,function(j){
						layer.closeAll();
						if(j.status == 'success'){
							layer.msg('修改成功',{icon:1,time:2000},function(){});
							xadmin.close();
						}
						if(j.status == 'olderror'){
							layer.msg('原密码错误',{icon:2,time:2000},function(){});
						}
						if(j.status == 'error'){
							layer.msg('密码修改失败',{icon:2,time:2000},function(){});
						}
					},'json');
                    return false;
                });

            });
		</script>
    </body>

</html>
