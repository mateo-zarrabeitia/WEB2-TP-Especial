<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Pizzeria - Registrarse</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/login.css">

</head>
<body>
<div class="wrapper">
  <form action="crearUsuario" method="post" class="form-signin">
    <h2 class="form-signin-heading text-center">Registrarse</h2>
    <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="juan perez" required>
    </div>
    <div class="form-group">
              <label for="password">Contraseña</label>
              <input type="password" class="form-control" id="password" name ="password" placeholder="Password" required>
    </div>
    <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="juan.perez@mail.com" required>
    </div>
    {if !empty($error) }
             <div class="alert alert-danger" role="alert">{$error}</div>
     {/if}
    <label for=""></label>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Crear</button>
    <p class="message">¿Usted esta Registrado? <a href="login">Iniciar Sesion</a></p>
  </form>
</div>




<!-- <div class="login-page">
  <div class="form">
    <form action="crearUsuario" method="post" class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Crear</button>
      <p class="message">¿Usted esta Registrado? <a href="#">Sign In</a></p>
    </form>
    <form action="verificarUsuario" method="post" class="login-form">
      <input type="text" placeholder="Juan.Perez@gmail.com"/>
      <input type="password" placeholder="password"/>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      <p class="message">¿No esta Registrado? <a href="#">Crear una Cuenta</a></p>
    </form>
  </div> -->









{include file="footer.tpl"}
