<?php
  class PizzaView extends View
  {
    function mostrarIndex()
    {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION["USUARIO"]);
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

    function mostrarMenu($productos,$categorias,$imagenes)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('categorias',$categorias);
      $this->smarty->assign('imagenes',$imagenes);
      return $this->smarty->display('templates/menu.tpl');
    }

    function mostrarProducto($productos,$imagenes)
    {
      session_start();
      if (isset($_SESSION["USUARIO"]))
      $this->smarty->assign('usuario',$_SESSION["USUARIO"]);
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
