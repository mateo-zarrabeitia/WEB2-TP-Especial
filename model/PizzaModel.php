<?php
  class PizzaModel extends Model
  {
    function getProductos() {
      $sentencia = $this->db->prepare( "SELECT * FROM producto");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }
    function getCategorias() {
			$sentencia = $this->db->prepare('SELECT * FROM categoria');
			$sentencia->execute();
			return $sentencia->fetchAll(PDO::FETCH_ASSOC);
		}
  }
?>
