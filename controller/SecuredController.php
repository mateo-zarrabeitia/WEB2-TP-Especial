<?php
include_once 'view/LoginView.php';
include_once 'model/LoginModel.php';

class SecuredController extends Controller
{
  function __construct()
  {
    session_start();
    if(isset($_SESSION['usuario'])){
      if (time() - $_SESSION['LAST_ACTIVITY'] > 3000) {
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
