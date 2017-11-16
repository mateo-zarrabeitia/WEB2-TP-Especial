<?php
  class AdminView extends View
  {
    function __construct()
    {
      parent::__construct();
      $this->smarty->assign('session', 'out');
    }

    function mostrarAdmin($productos,$categorias,$imagenes)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('categorias',$categorias);
      $this->smarty->assign('imagenes',$imagenes);
      return $this->smarty->display('templates/Admin/Admin.tpl');
    }

    public function mostrarAgregarCategoria()
    {
      //$this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/Admin/AdminAgregarCategoria.tpl');
    }

    public function mostrarAgregarProducto($categorias)
    {
  		$this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/Admin/AdminAgregarProducto.tpl');
    }
    public function mostrarListarProducto($productos,$categorias,$imagenes)
    {
  		$this->smarty->assign('productos',$productos);
      $this->smarty->assign('categorias',$categorias);
      $this->smarty->assign('imagenes',$imagenes);
      return $this->smarty->display('templates/Admin/AdminListarProductos.tpl');
    }

    public function mostrarListarCategoria($categorias)
    {
  		$this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/Admin/AdminListarCategorias.tpl');
    }

    function mostrarProducto($productos)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->display('templates/Admin/Admin.tpl');
    }

    // function mostrarModificarProducto($id_categoria,$productos){
    //   $this->smarty->assign('productos', $productos);
    //   $this->smarty->assign('id_categorias', $id_categoria);
    //   $this->smarty->display('templates/admin/modificarProducto.tpl');
    // }


  }
 ?>
