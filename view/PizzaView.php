<?php
  class PizzaView extends View
  {
    function mostrarIndex()
    {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      return $this->smarty->display('templates/index.tpl');
    }

    function mostrarHome()
    {
      return $this->smarty->display('templates/home.tpl');
    }

    function mostrarUbicacion()
    {
      return $this->smarty->display('templates/ubicacion.tpl');
    }

    function mostrarMenu($productos,$categorias,$imagenes,$filtro)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('categorias',$categorias);
      $this->smarty->assign('imagenes',$imagenes);
      $this->smarty->assign('filtro',$filtro);
      return $this->smarty->display('templates/menu.tpl');
    }
    function mostrarMenuFiltrado($productos,$id_categorias,$nombre_categoria,$imagenes)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('nombreCategoria',$nombre_categoria);
      $this->smarty->assign('idCategoria',$id_categorias);
      $this->smarty->assign('imagenes',$imagenes);
      return $this->smarty->display('templates/menuFiltrado.tpl');
    }

    function mostrarProducto($productos,$imagenes)
    {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION);
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('imagenes',$imagenes);
      return $this->smarty->display('templates/producto.tpl');
    }

    function mostrarContacto()
    {
      return $this->smarty->display('templates/contacto.tpl');
    }

    function mostrarPrecios()
    {
      return $this->smarty->display('templates/precios.tpl');
    }
  }
 ?>
