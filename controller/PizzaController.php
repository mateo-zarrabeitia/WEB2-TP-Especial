<?php
  require_once 'view/PizzaView.php';
  require_once 'model/ProductosModel.php';
  require_once 'model/CategoriasModel.php';
  require_once 'model/ImagenesModel.php';

  class PizzaController extends Controller
  {
    function __construct()
    {
      $this->view = new PizzaView();
      $this->modelProductos = new ProductosModel();
      $this->modelCategorias = new CategoriasModel();
      $this->modelImagenes = new ImagenesModel();
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
      $productos = $this->modelProductos->getProductos();
      $categorias = $this->modelCategorias->getCategorias();
      $imagenes = $this->modelImagenes->getImagenes();
    //  print_r($imagenes);
      $this->view->mostrarMenu($productos,$categorias,$imagenes);
    }

    public function contacto()
    {
      $this->view->mostrarContacto();
    }

    public function precios()
    {
      $this->view->mostrarPrecios();
    }

    public function filtrado()
    {
      if(isset($_POST['categoria'])) {
        $categoria = $_POST['categoria'];
        $productos = $this->modelProductos->getProductosCat($categoria);
        $categorias = $this->modelCategorias->getCategorias($categoria);
        $imagenes = $this->modelImagenes->getImagenes();
        $this->view->mostrarMenu($productos,$categorias,$imagenes);
      }
    }

    public function producto($params)
    {
      $id_producto = $params[0];
      $productos = $this->modelProductos->getProducto($id_producto);
      $imagenes = $this->modelImagenes->getImagenes();
      $this->view->mostrarProducto($productos,$imagenes);
    }

  }
?>
