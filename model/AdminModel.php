<?php
  class AdminModel extends Model
  {

    function getProductos() {
      $sentencia = $this->db->prepare( "SELECT * FROM producto");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    function guardarCategoria($nombre,$descripcion) {
      $sentencia = $this->db->prepare("INSERT INTO categoria(nombre,descripcion) VALUES (?,?)");
      $sentencia->execute([$nombre,$descripcion]);
    }

    private function subirImagenes($imagenes){
      $rutas = [];
      foreach ($imagenes as $imagen) {
        $destino_final = 'images/' . uniqid();
        move_uploaded_file($imagen, $destino_final);
        $rutas[]=$destino_final;
      }
      return $rutas;
    }
    function getImagenes() {
      $sentencia = $this->db->prepare( "SELECT * FROM imagen");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }
    function deleteImagen($id_imagen) {
      $sentencia = $this->db->prepare('DELETE FROM imagen WHERE id_imagen = ?');
			$sentencia->execute([$id_imagen]);
    }



    function guardarProducto($id_categoria,$nombre,$precio,$descripcion,$imagenes) {
      $sentencia = $this->db->prepare('INSERT INTO producto(id_categoria,nombre,precio,descripcion) VALUES (?,?,?,?)');
      $sentencia->execute([$id_categoria,$nombre,$precio,$descripcion]);
      $id_producto = $this->db->lastInsertId();
      $rutas = $this->subirImagenes($imagenes);
      $sentencia_imagenes = $this->db->prepare('INSERT INTO imagen(ruta,fk_id_producto) VALUES(?,?)');
      foreach ($rutas as $ruta) {
        $sentencia_imagenes->execute([$ruta,$id_producto]);
      }
    }

    function getCategorias() {
			$sentencia = $this->db->prepare('SELECT * FROM categoria ORDER BY nombre');
			$sentencia->execute();
			return $sentencia->fetchAll(PDO::FETCH_ASSOC);
		}

    function eliminarCategoria($id_categoria) {
      $sentencia = $this->db->prepare('DELETE FROM categoria WHERE id_categoria = ?');
			$sentencia->execute([$id_categoria]);
    }

    function eliminarProducto($id_producto) {
      $sentencia = $this->db->prepare('DELETE FROM producto WHERE id_producto = ?');
			$sentencia->execute([$id_producto]);
    }

    // function actualizarProducto($id_producto){
    //   $sentencia = $this->db->prepare('DELETE FROM producto WHERE id_producto = ?');
    // }

  }
?>
