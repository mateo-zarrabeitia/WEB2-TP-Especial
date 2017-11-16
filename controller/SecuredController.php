<?php
require_once 'view/LoginView.php';
require_once 'model/UsuariosModel.php';

class SecuredController extends Controller
{
  function __construct()
  {
    session_start();
    if(isset($_SESSION['USUARIO'])){
      if ((time() - $_SESSION['LAST_ACTIVITY'] > 3000) || ($_SESSION['ADMIN'] != 1)) {
      header('Location: '. HOME);
      die();
      }
      $_SESSION['LAST_ACTIVITY'] = time();
    }

    else{
      header('Location: '. LOGIN);
      die();
    }
  }
}

 ?>
