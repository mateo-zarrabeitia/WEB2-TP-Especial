<?php
class ConfigApp{

  public static $ACTION = "action";
  public static $PARAMS = "params";
  public static $ACTIONS = [

      '' =>  'PizzaController#index',
      'home' =>  'PizzaController#home',
      'ubicacion' => 'PizzaController#ubicacion',
      'menu' => 'PizzaController#menu',
      'precios' => 'PizzaController#precios',
      'contacto' => 'PizzaController#contacto',
      'admin' => 'AdminController#home',
      'adminLista' => 'AdminController#home',
      'detalleProducto' => 'PizzaController#producto',
      'login' =>  'LoginController#login',
      'register' => 'LoginController#registrar',
      'crearUsuario' => 'LoginController#crear',
      'verificarUsuario' => 'LoginController#verify',
      'logout' => 'LoginController#destroy',
      'adminAgregarCategoria' => 'AdminController#agregarCategoria',
      'adminAgregarProducto' => 'AdminController#agregarProducto',
      'adminListaProductos' => 'AdminController#listaProducto',
      'adminListaCategorias' => 'AdminController#listaCategoria',
      'adminUsuarios' => 'AdminController#adminUsuarios',
      'eliminarUsuario' => 'AdminController#eliminarUsuario',
      'darPermisoAdmin' => 'AdminController#darPermisoAdmin',
      'crearCategoria' => 'AdminController#guardarCategoria',
      'crearProducto' => 'AdminController#guardarProducto',
      'borrarCategoria' =>'AdminController#eliminarCategoria',
      'borrarProducto' =>'AdminController#eliminarProducto',
      'borrarImagen' => 'AdminController#eliminarImagen',
      'filtrarCategoria' => 'PizzaController#filtrado'];
    //  'modificarProducto' =>'AdminController#actualizarProducto'

}

 ?>
