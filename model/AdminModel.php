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

    function guardarProducto($id_categoria,$nombre,$precio,$descripcion,$imagenes) {
      $sentencia = $this->db->prepare('INSERT INTO producto(id_categoria,nombre,precio,descripcion,imagenes) VALUES (?,?,?,?,?)');
      $sentencia->execute([$id_categoria,$nombre,$precio,$descripcion,$imagenes]);
    }

    function getCategorias() {
			$sentencia = $this->db->prepare('SELECT * FROM categoria');
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
