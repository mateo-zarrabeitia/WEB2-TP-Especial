<?php
class LoginModel extends Model
{
  function getUser($userName){
    $sentencia = $this->db->prepare( "select * from usuario where email = ? limit 1");
    $sentencia->execute([$userName]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function setUser($nombre, $password, $email){
    $sentencia = $this->db->prepare ('INSERT INTO usuario(nombre,password,email) VALUES (?,?,?)');
    $sentencia->execute([$nombre,$password,$email]);
  }

}
 ?>
