<?php
  class ProductosModel extends Model
  {
    function getProductos() {
      $sentencia = $this->db->prepare( "SELECT * FROM producto ORDER BY nombre");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    function getProducto($id_producto) {
      $sentencia = $this->db->prepare( "SELECT * FROM producto WHERE id_producto = ?");
      $sentencia->execute([$id_producto]);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    function getProductosCat($categoria) {
      $sentencia = $this->db->prepare( "SELECT * FROM producto WHERE id_categoria = ?");
      $sentencia->execute([$categoria]);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }


  }
?>
