<?php
namespace app\index\controller;
use think\Db;

class User extends \think\Controller

{
	//管理后台登录
	public function login(){
		if(session('admin')){
			$this->redirect('/main');
		}
		return $this->fetch('login');
	}
	
	//登录操作
	public function toLogin(){
		$account = input('account','');
		$password = input('password','');
		
		$ret = [
			'status'	=>	'error'
		];
		
		$where = [
			'admin_account'	=>	$account,
			'admin_password'	=>	md5(md5(PWD_FIX.$password))
		];
		$ar = Db::name('admin_list')->where($where)->find();
		if($ar){
			session('admin',$ar['admin_account']);
			
			$ret['status']	=	'success';
			$ret['msg']	=	$ar;
		}
		
		return json($ret);
	}
	
	//欢迎页
	public function welcome(){
		if(!session('admin')){
			$this->redirect('/');
		}
		return $this->fetch('welcome');
	}
	
	//后台首页
	public function main(){
		if(!session('admin')){
			$this->redirect('/');
		}
		
		return $this->fetch('main');
	}
	
	//修改密码
	public function modpass(){
		return $this->fetch('modpass');
	}
	
	public function modpassword(){
		$oldpass = input('oldpass','');
		$newpass = input('newpass','');
		$repass = input('repass','');
		
		$ret = [
			'status'	=>	'error'
		];
		
		if(!session('admin')){
			return json($ret);
		}
		
		$where = [
			'admin_password'	=>	md5(md5(PWD_FIX.$oldpass))
		];
		
		$ar = Db::name('admin_list')->where($where)->find();
		if($ar){
			//修改密码
			if($newpass == $repass && mb_strlen($newpass) >= 5 && mb_strlen($newpass) <= 12){
				$data = [
					'admin_password'	=>	md5(md5(PWD_FIX.$oldpass))
				];
				$r = Db::name('admin_list')->where(['admin_id'=>$ar['admin_id']])->update($data);
				if($r){
					$ret['status']	=	'success';
				}
			}
		}else{
			$ret['status'] = 'olderror';
		}
		
		return json($ret);
	}
	
	//退出登录
	public function esc(){
		session('admin',null);
		$this->redirect('/');
	}
	
	//字体图标
	public function unicode(){
		return $this->fetch('unicode');
	}
}

