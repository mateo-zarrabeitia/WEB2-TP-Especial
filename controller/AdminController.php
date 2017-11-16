<?php
  require_once 'view/AdminView.php';
  require_once 'model/AdminModel.php';

  class AdminController extends SecuredController {
    function __construct()  {
      parent::__construct();
      $this->view = new AdminView();
      $this->model = new AdminModel();
    }

    public function home()
    {
      $productos = $this->model->getProductos();
      $categorias = $this->model->getCategorias();
      $imagenes = $this->model->getImagenes();
    //print_r($producto);
      $this->view->mostrarAdmin($productos,$categorias,$imagenes);
      //header('Location: '. HOME .'admin');
    }

    public function listarAdmin(){
      home();
      header('Location: '. HOME .'admin');
    }



    public function agregarCategoria()
    {
      $categorias = $this->model->getCategorias();
      $this->view->mostrarAgregarCategoria($categorias);
    }

    public function agregarProducto()
    {
  		$categorias = $this->model->getCategorias();
      $this->view->mostrarAgregarProducto($categorias);
    }

    public function listaProducto()
    {
      $productos = $this->model->getProductos();
      $categorias = $this->model->getCategorias();
      $imagenes = $this->model->getImagenes();
      $this->view->mostrarListarProducto($productos,$categorias,$imagenes);
    }

    public function listaCategoria(){
      $categorias = $this->model->getCategorias();
      $this->view->mostrarListarCategoria($categorias);

    }

    public function guardarCategoria(){
      $nombre = $_POST['nombre'];
      $descripcion = $_POST['descripcion'];
      $this->model->guardarCategoria($nombre,$descripcion);
      $this->view->mostrarAgregarCategoria();
      header('Location: '. HOME .'admin');
    }

    private function sonExtValida($imagenesTipos){
      foreach ($imagenesTipos as $tipo) {
        if(($tipo == 'image/jpeg') || ($tipo == 'image/png')) {
          return true;
        }
      }
      return false;
    }

    public function guardarProducto(){
      $rutaTempImagenes = $_FILES['imagenes']['tmp_name'];
      $nombre = $_POST['nombre'];
      $id_categoria = $_POST['id_categoria'];
      $precio = $_POST['precio'];
      $descripcion = $_POST['descripcion'];
      if($this->sonExtValida($_FILES['imagenes']['type'])) {
        echo "SE GUARDO";
        $this->model->guardarProducto($id_categoria,$nombre,$precio,$descripcion,$rutaTempImagenes);
      }
      echo "NO SE GUARDO";
      die();
      header('Location: '. HOME .'admin');
    }

    public function eliminarCategoria($params){
      $id_categoria = $params[0];
      //echo ($id_categoria);
			$this->model->eliminarCategoria($id_categoria);
      header('Location: '. HOME .'admin');
    }

    public function eliminarProducto($params){
      $id_producto = $params[0];
      //echo ($id_categoria);
			$this->model->eliminarProducto($id_producto);
      header('Location: '. HOME .'admin');
    }

    public function eliminarImagen($params){
      $id_imagen = $params[0];
      //echo ($id_categoria);
			$this->model->deleteImagen($id_imagen);
      header('Location: '. HOME .'admin');
    }

    public function actualizarProducto($params = []){
      $id_producto = $params[0];
      $productos = $this->model->getProductos();
			$this->model->actualizarProducto($id_producto,$productos);
      header('Location: '. HOME .'admin');
    }




  }
?>
