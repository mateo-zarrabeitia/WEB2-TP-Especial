<?php
  class CategoriasModel extends Model
  {
    function getCategorias() {
			$sentencia = $this->db->prepare('SELECT * FROM categoria ORDER BY nombre');
			$sentencia->execute();
			return $sentencia->fetchAll(PDO::FETCH_ASSOC);
		}
    function getCategoria($categoria) {
			$sentencia = $this->db->prepare('SELECT * FROM categoria WHERE id_categoria = ?');
			$sentencia->execute([$categoria]);
			return $sentencia->fetchAll(PDO::FETCH_ASSOC);
		}
  }
?>
