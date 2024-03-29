<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:85:"D:\phpstudy\PHPTutorial\WWW\dy\public/../application/index\view\base\widget_edit.html";i:1572321001;}*/ ?>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>评论内容修改</title>
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
            <div class="layui-form">
                <input type="hidden" value="<?php echo \think\Request::instance()->param('id'); ?>" name="id">
                <div class="layui-form-item">
                    <label for="industry_name" class="layui-form-label">
                        <span class="x-red">*</span>输入控件ID
                    </label>
                    <div class="layui-input-inline">
                        <textarea id="widget_id" name="widget_id" required="" lay-verify="widget_id" class="layui-textarea" style="resize: none"><?php echo $widget['widget_id']; ?></textarea>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        不超过60字符
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="industry_name" class="layui-form-label">
                        <span class="x-red">*</span>输入控件描述
                    </label>
                    <div class="layui-input-inline">
                        <textarea id="widget_description" name="widget_description" required="" lay-verify="widget_description" class="layui-textarea" style="resize: none"><?php echo $widget['widget_description']; ?></textarea>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        不超过100字符
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="" class="layui-form-label">
                    </label>
                    <button class="layui-btn" id="submit" lay-filter="edit" lay-submit>
                        确认修改
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script>
        layui.use(['form', 'layer'],
            function () {
                $ = layui.jquery;
                var form = layui.form,
                    layer = layui.layer;

                //自定义验证规则
                form.verify({
                    widget_id: [/^[\S\s]{1,60}$/, '不超过60字符'],
                    widget_description: [/^[\S\s]{1,100}$/, '不超过100字符'],
                });

                $('#widget_id').select();

                //监听提交
                form.on('submit(edit)', function (data) {
                    layer.load(0);
                    $.post('./widgetEditSubmit', data.field, function (j) {
                        //layer.closeAll();
                        if (j.status == 'success') {
                            xadmin.close();
                            window.parent.updateWidget();
                        }
                        if (j.status == 'error') {
                            layer.msg('修改失败', { icon: 2, time: 2000 }, function () { });
                        }
                    }, 'json');
                    return false;
                });
            });
    </script>
</body>

</html>

