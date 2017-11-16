<?php
  class ImagenesModel extends Model
  {
    function getImagenes() {
      $sentencia = $this->db->prepare( "SELECT * FROM imagen");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

  }
?>
