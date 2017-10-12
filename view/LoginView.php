<?php
  class LoginView extends View
  {
    function mostrarLogin($error='')
    {
      $this->smarty->assign('error', $error);
      $this->smarty->display('templates/Login/login.tpl');
    }

    function mostrarRegistro($error='')
    {
      $this->smarty->assign('error', $error);
      $this->smarty->display('templates/Login/register.tpl');
    }




  }
?>
