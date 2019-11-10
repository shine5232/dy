<?php
namespace app\index\controller;
use think\Db;
use think\Tree;
use app\base\controller\Base;
use app\index\model\AdminMenu;
class Menu extends Base

{
	/**
	 * 后台菜单
	 */
	public function index(){
		$result     = Db::name('AdminMenu')->order(["list_order" => "ASC"])->select();
        $tree       = new Tree();
        $tree->icon = ['&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─', '&nbsp;&nbsp;&nbsp;└─ '];
        $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
        foreach ($result as $key => $value) {
        	$result[$key]['has_children'] = '&nbsp;&nbsp;&nbsp;&nbsp;';
            $result[$key]['status']  = 	$value['status'] ? '<input type="checkbox" name="switch" lay-text="开启|停用" checked="" lay-skin="switch" data-id='.$value['id'].' lay-filter="switch">' : '<input type="checkbox" name="switch" lay-text="开启|停用" lay-skin="switch" data-id='.$value['id'].' lay-filter="switch">';
            $result[$key]['str_manage']  =	'<button class="layui-btn layui-btn layui-btn-xs" onclick='."xadmin.open('编辑','/index/menu/edit?id=".$value['id']."',550,700)".' >'.
            									'<i class="layui-icon">&#xe642;</i>编辑'.
            								'</button>'.
                            				'<button class="layui-btn layui-btn-warm layui-btn-xs" onclick='."xadmin.open('添加子菜单','/index/menu/add?parent_id=".$value['id']."',550,700)".' >'.
                            					'<i class="layui-icon">&#xe642;</i>添加子菜单'.
                            				'</button>'.
                            				'<button class="layui-btn-danger layui-btn layui-btn-xs"  onclick='."member_del(this,".$value['id'].")".' >'.
                            					'<i class="layui-icon">&#xe640;</i>删除'.
                            				'</button>';
            $count = Db::name('AdminMenu')->where("parent_id", $value['id'])->count();
            if($count > 0){
            	$result[$key]['has_children'] = '<i class="layui-icon x-show" status="true">&#xe623;</i>';
            }
        }
        $tree->init($result);
        $str = "<tr cate-id='\$id' fid='\$parent_id' >
    				<td><input type='checkbox' name='' lay-skin='primary'></td>
    				<td><div class='order-input'>\$has_children<input type='text' class='layui-input x-sort' name='list_orders[\$id]' value='\$list_order'></div></td>
                    <td>\$id</td>
                    <td>\$spacer\$name</td>
                    <td>\$status</td>
                    <td>\$str_manage</td>
                </tr>";
        $category = $tree->getTree(0, $str);
        $this->assign("category", $category);
		return $this->fetch('index');
	}
	/**
	 * 添加后台菜单
	 */
	public function add(){
		$tree     = new Tree();
        $parentId = $this->request->param("parent_id", 0, 'intval');
        $result   = Db::name('AdminMenu')->order(["list_order" => "ASC"])->select();
        $array    = [];
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $parentId ? 'selected' : '';
            $array[]       = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$name</option>";
        $tree->init($array);
        $selectCategory = $tree->getTree(0, $str);
        $this->assign("select_category", $selectCategory);
		return $this->fetch('add');
	}
	/**
	 * 新增后台菜单保存
	 */
	public function addPost(){
		if($this->request->isPost()){
			$data = $this->request->param();
			if(!$this->validate($data,'IndexMenu')){
			    $ret = [
					'status'	=>	'error',
					'msg'		=>	'数据验证失败'
				];
			} else {
                $id = Db::name('AdminMenu')->strict(false)->field(true)->insert($data);
                if($id){
                	$ret = [
						'status'	=>	'success',
						'msg'		=>	'保存成功'
					];
                }
                /*$app          = $this->request->param("app");
                $controller   = $this->request->param("controller");
                $action       = $this->request->param("action");
                $param        = $this->request->param("param");
                $authRuleName = "$app/$controller/$action";
                $menuName     = $this->request->param("name");

                $findAuthRuleCount = Db::name('auth_rule')->where([
                    'app'  => $app,
                    'name' => $authRuleName,
                    'type' => 'admin_url'
                ])->count();
                if (empty($findAuthRuleCount)) {
                    Db::name('AuthRule')->insert([
                        "name"  => $authRuleName,
                        "app"   => $app,
                        "type"  => "admin_url", //type 1-admin rule;2-user rule
                        "title" => $menuName,
                        'param' => $param,
                    ]);
                }
                $sessionAdminMenuIndex = session('admin_menu_index');
                $to                    = empty($sessionAdminMenuIndex) ? "Menu/index" : $sessionAdminMenuIndex;
                $this->_exportAppMenuDefaultLang();
                $this->success("添加成功！", url($to));*/
            }
            return json($ret);
		}
	}
	/**
     * 编辑后台菜单
     */
    public function edit()
    {        
        $tree   = new Tree();
        $id     = $this->request->param("id", 0, 'intval');
        $rs     = Db::name('AdminMenu')->where("id", $id)->find();
        $result = Db::name('AdminMenu')->order(["list_order" => "ASC"])->select();
        $array  = [];
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $rs['parent_id'] ? 'selected' : '';
            $array[]       = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$name</option>";
        $tree->init($array);
        $selectCategory = $tree->getTree(0, $str);
        $this->assign("data", $rs);
        $this->assign("select_category", $selectCategory);
        return $this->fetch();
    }

    /**
     * 后台菜单编辑提交保存
     */
    public function editPost()
    {
        if ($this->request->isPost()) {
            $id      = $this->request->param('id', 0, 'intval');
            $oldMenu = Db::name('AdminMenu')->where('id', $id)->find();

            $result = $this->validate($this->request->param(), 'IndexMenu.edit');

            if ($result !== true) {
                $ret = [
					'status'	=>	'error',
					'msg'		=>	'数据验证失败'
				];
            } else {
                $id = Db::name('AdminMenu')->strict(false)->field(true)->update($this->request->param());
                if($id){
					$ret = [
						'status'	=>	'success',
						'msg'		=>	'保存成功'
					];
                }
                /*$app          = $this->request->param("app");
                $controller   = $this->request->param("controller");
                $action       = $this->request->param("action");
                $param        = $this->request->param("param");
                $authRuleName = "$app/$controller/$action";
                $menuName     = $this->request->param("name");

                $findAuthRuleCount = Db::name('auth_rule')->where([
                    'app'  => $app,
                    'name' => $authRuleName,
                    'type' => 'admin_url'
                ])->count();
                if (empty($findAuthRuleCount)) {
                    $oldApp        = $oldMenu['app'];
                    $oldController = $oldMenu['controller'];
                    $oldAction     = $oldMenu['action'];
                    $oldName       = "$oldApp/$oldController/$oldAction";
                    $findOldRuleId = Db::name('AuthRule')->where("name", $oldName)->value('id');
                    if (empty($findOldRuleId)) {
                        Db::name('AuthRule')->insert([
                            "name"  => $authRuleName,
                            "app"   => $app,
                            "type"  => "admin_url",
                            "title" => $menuName,
                            "param" => $param
                        ]);//type 1-admin rule;2-user rule
                    } else {
                        Db::name('AuthRule')->where('id', $findOldRuleId)->update([
                            "name"  => $authRuleName,
                            "app"   => $app,
                            "type"  => "admin_url",
                            "title" => $menuName,
                            "param" => $param]);//type 1-admin rule;2-user rule
                    }
                } else {
                    Db::name('AuthRule')->where([
                        'app'  => $app,
                        'name' => $authRuleName,
                        'type' => 'admin_url'
                    ])->update(["title" => $menuName, 'param' => $param]);//type 1-admin rule;2-user rule
                }
                $this->_exportAppMenuDefaultLang();
                Cache::clear('admin_menus');// 删除后台菜单缓存
                $this->success("保存成功！");*/
			}
            return json($ret);
        }
    }
    /**
     * 后台菜单更改状态
     */
    public function update_status(){
    	if ($this->request->isPost()) {
    		$id    = $this->request->param("id");
    		$status= $this->request->param("status");
    		$data['status'] = $status;
    		$res = Db::name('AdminMenu')->where('id',$id)->update($data);
    		if($res){
    			$ret = [
					'status'	=>	'success',
					'msg'		=>	'更新成功'
				];
    		}else{
    			$ret = [
					'status'	=>	'error',
					'msg'		=>	'更新失败'
				];
    		}
    		return json($ret);
    	}
    }
    /**
     * 后台菜单删除
     */
    public function delete()
    {
        $id    = $this->request->param("id", 0, 'intval');
        $count = Db::name('AdminMenu')->where("parent_id", $id)->count();
        if ($count > 0) {
        	$ret = [
				'status'	=>	'error',
				'msg'		=>	'该菜单下还有子菜单，无法删除！'
			];
        }else{
        	if (Db::name('AdminMenu')->delete($id) !== false) {
	            $ret = [
					'status'	=>	'success',
					'msg'		=>	'删除成功'
				];
	        } else {
	            $ret = [
					'status'	=>	'error',
					'msg'		=>	'删除失败'
				];
	        }
        }
        return json($ret);
    }

    /**
     * 后台菜单排序
     */
    public function list_order()
    {
        $adminMenuModel = new AdminMenu();
       	$res = parent::listOrders($adminMenuModel);
       	if($res){
       		$ret = [
				'status'	=>	'success',
				'msg'		=>	'更新成功'
			];
       	}else{
       		$ret = [
				'status'	=>	'error',
				'msg'		=>	'更新失败'
			];
       	}
        return json($ret);
    }
}