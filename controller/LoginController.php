<?php

  include_once 'view/LoginView.php';
  include_once 'model/LoginModel.php';

  class LoginController extends Controller
  {
    function __construct()
    {

      $this->view = new LoginView();
      $this->model = new LoginModel();
    }

    public function index()
    {

        $this->view->mostrarLogin();
      }

    public function login(){
      $this->view->mostrarLogin();
    }


    public function verify()
    {
      $userName = $_POST['usuario'];
      $password = $_POST['password'];

      if(!empty($userName) && !empty($password)) {
        $user = $this->model->getUser($userName);
        if(!empty($user) && password_verify($password, $user[0]['password'])){
            session_start();
            $_SESSION['usuario']=$userName;
            $_SESSION['LAST_ACTIVITY'] = time(); // Comienza el contador
            header('Location: '. HOME .'admin');
          //echo("Iniciada Sesion");
        }
        else{
          $this->view->mostrarLogin('Usuario o Password incorrectos');
        }
      }

  }

    public function registrar(){
      $this->view->mostrarRegistro();
    }
    public function crear(){
      $nombre = $_POST['nombre'];
      $password = $_POST['password'];
      $email = $_POST['email'];
      $passwordsegure = password_hash($password, PASSWORD_DEFAULT);
      $this->model->setUser($nombre,$passwordsegure,$email);
      $this->view->mostrarRegistro('El Usuario se ha creado');
      sleep(5);
      header('Location: '.LOGIN);
    }

    public function destroy()
  {
    session_start();
    session_destroy();
    header('Location: '.HOME);
  }
  }

?>
