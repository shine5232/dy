<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"D:\phpStudy\WWW\dy\public/../application/index\view\menu\edit.html";i:1573282059;s:60:"D:\phpStudy\WWW\dy\application\index\view\common\header.html";i:1573182143;s:60:"D:\phpStudy\WWW\dy\application\index\view\common\footer.html";i:1573115317;}*/ ?>
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
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="parent_id" class="layui-form-label">
                    <span class="x-red">*</span>上级菜单
                </label>
                <div class="layui-input-inline">
                    <select name="parent_id">
                        <option value="0">作为一级菜单</option>
                        <?php echo $select_category; ?>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    <span class="x-red">*</span>菜单名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" required="" lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入菜单名称" value="<?php echo $data['name']; ?>" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="app" class="layui-form-label">
                    <span class="x-red">*</span>应用名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="app" name="app" required="" lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入应用名称,如:app" value="<?php echo $data['app']; ?>" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="controller" class="layui-form-label">
                    <span class="x-red">*</span>控制器名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="controller" name="controller" required="" lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入控制器名,如:index" value="<?php echo $data['controller']; ?>" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="action" class="layui-form-label">
                    <span class="x-red">*</span>方法名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="action" name="action" required="" lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入方法名称,如:list" value="<?php echo $data['action']; ?>" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="icon" class="layui-form-label">显示图标</label>
                <div class="layui-input-inline">
                    <input type="text" id="icon" name="icon" autocomplete="off" class="layui-input" placeholder="请输入图标名称,如:user" value="<?php echo $data['icon']; ?>" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="param" class="layui-form-label">参数信息</label>
                <div class="layui-input-inline">
                    <input type="text" id="param" name="param" autocomplete="off" class="layui-input" placeholder="请输入传递的参数,如:id=3&p=3" value="<?php echo $data['param']; ?>" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="status" class="layui-form-label">菜单状态</label>
                <div class="layui-input-inline">
                    <select name="status">
                        <option value="1" <?php if($data['status'] == 1): ?> selected <?php endif; ?>>显示</option>
                        <option value="0" <?php if($data['status'] == 0): ?> selected <?php endif; ?>>隐藏</option>
                    </select>
                </div>
            </div>
            <!-- <div class="layui-form-item">
                <label for="type" class="layui-form-label">菜单类型</label>
                <div class="layui-input-inline">
                    <select name="type">
                        <option value="0">只作为菜单</option>
                        <option value="1">权限认证+菜单</option>
                    </select>
                </div>
            </div> -->
            <div class="layui-form-item layui-form-text">
                <label for="remark" class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="remark" name="remark" class="layui-textarea textarea"><?php echo $data['remark']; ?></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <input type="hidden" name="id" value="<?php echo $data['id']; ?>" />
                <button class="layui-btn" lay-filter="add" lay-submit="">修改</button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'layer'],function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;
        //监听提交
        form.on('submit(add)',function(data) {
            $.post('/index/menu/editPost',data.field,function(j){
                layer.closeAll();
                if(j.status == 'success'){
                    layer.msg('保存成功',{
                        icon:1,
                        time:1000
                    },function(){
                        close();
                    });
                }else{
                    layer.msg('保存失败',{
                        icon:2,
                        time:1000
                    },function(){
                        close();
                    });
                }
            },'json');
            return false;
        });
        function close(){
            // 获得frame索引
            var index = parent.layer.getFrameIndex(window.name);
            //关闭当前frame
            parent.layer.close(index);
        }
    });
</script>
</body>
</html>