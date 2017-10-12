<?php
  class PizzaView extends View
  {
    function mostrarIndex()
    {
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

    function mostrarMenu($productos,$categorias)
    {
      $this->smarty->assign('productos',$productos);
      $this->smarty->assign('categorias',$categorias);
      return $this->smarty->display('templates/menu.tpl');
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
