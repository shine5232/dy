<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:67:"D:\phpStudy\WWW\dy\public/../application/index\view\user\login.html";i:1573436054;}*/ ?>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台管理</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/login.css?12">
	  <link rel="stylesheet" href="../../static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="../../static/lib/layui/layui.js" charset="utf-8"></script> 
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">
            <img class="logo" src="../../static/images/logo.png"/>后台管理系统
        </div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="account" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录系统" lay-submit lay-filter="login" style="width:100%;font-size:20px;" type="submit">
            <hr class="hr20" >
        </form>
    </div>
    <div class="copyright">
        Copyright © 2019-2010 后台管理系统 All Rights Reserved.
    </div>
    <script>
        $(function  () {
            layui.use(['form','layer'], function(){
              var form = layui.form;
			  var layer = layui.layer;
              //监听提交
              form.on('submit(login)', function(data){
				layer.load();
                $.post('/index/User/toLogin',data.field,function(j){
					layer.closeAll();
					if(j.status == 'success'){
						layer.msg('登陆成功',{
							icon:1,
							time:1000
						},function(){
							window.location.href = '/main';
						});
					}else{
						layer.msg('登陆失败',{
							icon:2,
							time:1000
						},function(){
							//
						});
					}
				},'json');
                return false;
              });
            });
        })
    </script>
</body>
</html>