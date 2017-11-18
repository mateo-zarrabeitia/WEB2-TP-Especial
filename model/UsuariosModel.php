<?php
class UsuariosModel extends Model
{
  function getUser($userName){
    $sentencia = $this->db->prepare( 'SELECT * FROM usuario WHERE email = ? LIMIT 1');
    $sentencia->execute([$userName]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function getUsuarios(){
    $sentencia = $this->db->prepare( 'SELECT * FROM usuario');
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function getUsuario($id_usuario)
  {
      $sentencia = $this->db->prepare('SELECT * FROM Usuario WHERE id_usuario = ?');
      $sentencia->execute([$id_usuario]);
      return $sentencia->fetch(PDO::FETCH_ASSOC);
  }

  function getIdEmailUser($email)
  {
      $sentencia = $this->db->prepare('SELECT id_usuario FROM Usuario WHERE email = ?');
      $sentencia->execute([$email]);
      return $sentencia->fetch(PDO::FETCH_ASSOC);
  }

  function setUser($nombre, $password, $email){
    $sentencia = $this->db->prepare ('INSERT INTO usuario(nombre,password,email,rol) VALUES (?,?,?,?)');
    $sentencia->execute([$nombre,$password,$email,2]);
  }

  function setPermisoAdmin($id_usuario,$permiso){
    $sentencia = $this->db->prepare ('UPDATE usuario SET rol = ? WHERE id_usuario = ?');
    $sentencia->execute([$permiso,$id_usuario]);
  }

  function deleteUsuario($id_usuario){
    $sentencia = $this->db->prepare ('DELETE FROM usuario WHERE id_usuario = ?');
    $sentencia->execute([$id_usuario]);
  }
}
 ?>
