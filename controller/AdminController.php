<?php
  include_once 'view/AdminView.php';
  include_once 'model/AdminModel.php';

  class AdminController extends SecuredController

  {
    private $styleModel;
    function __construct()
    {
      parent::__construct();
      $this->view = new AdminView();
      $this->model = new AdminModel();
    }

    public function home()
    {
      $productos = $this->model->getProductos();
      $categorias = $this->model->getCategorias();
    //print_r($producto);
      $this->view->mostrarAdmin($productos,$categorias);
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
      // print_r($categoria);
      $this->view->mostrarAgregarProducto($categorias);
    }

    public function listaProducto()
    {
      $productos = $this->model->getProductos();
      $this->view->mostrarListarProducto($productos);
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

    public function guardarProducto(){
      $nombre = $_POST['nombre'];
      $id_categoria = $_POST['id_categoria'];
      $precio = $_POST['precio'];
      $descripcion = $_POST['descripcion'];
      $imagenes= $_POST['imagen'];
      $this->model->guardarProducto($id_categoria,$nombre,$precio,$descripcion,$imagenes);
      $this->view->mostrarAgregarProducto();
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

    // public function actualizarProducto($params){
    //   $id_producto = $params[0];
    //   $productos = $this->model->getProductos();
		// 	$this->model->actualizarProducto($id_producto,$productos);
    //   header('Location: '. HOME .'admin');
    // }




  }
?>
