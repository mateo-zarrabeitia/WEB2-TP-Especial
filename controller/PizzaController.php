<?php
  include_once 'view/PizzaView.php';
  include_once 'model/PizzaModel.php';

  class PizzaController extends Controller
  {
    function __construct()
    {
      $this->view = new PizzaView();
      $this->model = new PizzaModel();
    }

    public function index()
    {
      $this->view->mostrarIndex();
    }

    public function home()
    {
      $this->view->mostrarHome();
    }

    public function ubicacion()
    {
      $this->view->mostrarUbicacion();
    }

    public function menu()
    {
      $productos = $this->model->getProductos();
      $categorias = $this->model->getCategorias();
      //print_r($categorias);
      $this->view->mostrarMenu($productos,$categorias);
    }

    public function contacto()
    {
      $this->view->mostrarContacto();
    }

    public function precios()
    {
      $this->view->mostrarPrecios();
    }

  }
?>
