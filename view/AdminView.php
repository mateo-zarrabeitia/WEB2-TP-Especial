<?php
  class AdminView extends View
  {
    function __construct()
    {
      parent::__construct();
      $this->smarty->assign('session', 'out');
    }

    function mostrarAdmin($productos,$categorias)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/Admin/Admin.tpl');
    }

    public function mostrarAgregarCategoria($categorias)
    {
      $this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/admin/AdminAgregarCategoria.tpl');
    }

    public function mostrarAgregarProducto($categorias)
    {
  		$this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/admin/AdminAgregarProducto.tpl');
    }
    public function mostrarListarProducto($productos)
    {
  		$this->smarty->assign('productos',$productos);
      return $this->smarty->display('templates/admin/AdminListarProductos.tpl');
    }

    public function mostrarListarCategoria($categorias)
    {
  		$this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/admin/AdminListarCategorias.tpl');
    }

    function mostrarProducto($productos)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->display('templates/Admin/admin.tpl');
    }

    // function mostrarModificarProducto($id_categoria,$productos){
    //   $this->smarty->assign('productos', $productos);
    //   $this->smarty->assign('id_categorias', $id_categoria);
    //   $this->smarty->display('templates/admin/modificarProducto.tpl');
    // }


  }
 ?>
