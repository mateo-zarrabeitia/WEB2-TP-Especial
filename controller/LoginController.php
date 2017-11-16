<?php
  require_once 'view/LoginView.php';
  require_once 'model/UsuariosModel.php';
  require_once 'controller/SecuredController.php';

  class LoginController extends Controller
  {
    function __construct()
  {
    //  parent::__construct();
      $this->view = new LoginView();
      $this->model = new UsuariosModel();
    }

    public function index()
    {
        $this->view->mostrarLogin();
    }

    function login(){
        if(isset($_POST["email"]) && isset($_POST["password"]) && !empty($_POST["email"]) && !empty($_POST["password"])){
        $user = $this->model->getUser($_POST["email"]);
        $password = $_POST["password"];
        if(!empty($user) && password_verify($password, $user[0]['password'])){
            session_start();
            $_SESSION['USUARIO']= $_POST["email"];
            $_SESSION['LAST_ACTIVITY'] = time(); // Comienza el contador
            $_SESSION['ADMIN'] = $user[0]['rol'];
            if ($_SESSION['ADMIN'] == 1){
              header('Location: '. HOME .'admin');
            } else {
              header('Location: '.HOME);
            }
          }
        }
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
            $_SESSION['USUARIO']= $userName;
            $_SESSION['LAST_ACTIVITY'] = time(); // Comienza el contador
            $_SESSION['ADMIN'] = $user[0]['rol'];
            if ($_SESSION['ADMIN'] == 1){
              header('Location: '. HOME .'admin');
            } else {
              header('Location: '.HOME);
            }
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
      session_start();
      $_SESSION['USUARIO']= $email;
      $_SESSION['LAST_ACTIVITY'] = time(); // Comienza el contador
      $_SESSION['ADMIN'] = $user[0]['rol'];
      if ($_SESSION['ADMIN'] == 1){
        header('Location: '. HOME .'admin');
      } else {
        header('Location: '.HOME);
      }
    }

    public function destroy()
  {
    session_start();
    session_destroy();
    header('Location: '.HOME);
  }
  }

?>
