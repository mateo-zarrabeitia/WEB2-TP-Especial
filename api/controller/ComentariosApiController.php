<?php
    require_once('../model/ComentariosModel.php');
    require_once('../model/UsuariosModel.php');
    require_once('Api.php');

    class ComentariosApiController extends Api {
  	    protected $model;

        function __construct() {
            parent::__construct();
            $this->model = new ComentariosModel();
            $this->modelUsuarios = new UsuariosModel();

        }

        public function getComentarios($url_params = []) {
    	    $comentarios = $this->model->getComentarios();
    	    return $this->json_response($comentarios, 200);
        }

        public function getComentariosProducto ($url_params = []) {
    	    $fk_id_producto = $url_params[":id"];
    	    $comentarios = $this->model->getComentariosProducto($fk_id_producto);
    	    return $this->json_response($comentarios, 200);
        }

        public function getComentariosUsuario($url_params = []) {
    	    $fk_id_usuario = $url_params[":id"];
    	    $comentarios = $this->model->getComentariosUsuario($fk_id_usuario);
    	    return $this->json_response($comentarios, 200);
        }

        public function getComentario($url_params = []) {
    	    $id_comentario = $url_params[":id"];
    	    $comentario = $this->model->getComentario($id_comentario);
    	    if($comentario) {
    		    return $this->json_response($comentario, 200);
    	    }
    	    else {
    		    return $this->json_response(false, 404);
    	    }
        }

        public function createComentario() {
    	    $body = json_decode($this->raw_data);
          $email = $body->email;
          $fk_id_producto = $body->fk_id_producto;
    	    $usuario =  $this->modelUsuarios->getIdEmailUser($email);
          $fk_id_usuario = $usuario['id_usuario'];
          $textocomentario = $body->comentario;
          $puntaje = $body->puntaje;
          $fecha = date();
    	    $this->model->setComentario($fk_id_producto,$fk_id_usuario, $textocomentario, $puntaje, $fecha);
          return $this->json_response("Se ha Creado", 200);
        }

        public function deleteComentario($url_params = []) {
    	    $id_comentario = $url_params[":id"];
    	    $comentario = $this->model->getComentario($id_comentario);
    	    if($comentario) {
    		    $this->model->deleteComentario($id_comentario);
    		    return $this->json_response("Borrado exitoso", 200);
    	    }
    	    else {
    		    return $this->json_response(false, 404);
    	    }
        }
    }
 ?>
