<nav id="nav" class="navbar navbar-default navbar-fixed-top container-fluid">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
              <a class="navbar-brand navegacion" href="home" >Pizzeria El Campeón</a>
        </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a class="navegacion" href="home"> Home <span class="sr-only">(current)</span></a></li>
          <li><a class="navegacion ubicacion" href="ubicacion" >Donde Encontrarnos</a></li>
          <li><a class="navegacion menu" href="menu" >Menu</a></li>
          <li><a class="navegacion contacto" href="contacto" >Contacto</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          {if !isset($usuario)}
          <li class="login"><a href="login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
          {else}
            {if ({$usuario['ADMIN']} == 1)}<li><a href="admin">Panel Admin</a></li> {/if}
          <li><p class="navbar-text"><span class="glyphicon glyphicon-user"></span> <strong>{$usuario['USUARIO']}</strong></p></li>
          <li class="logout"><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
          {/if}
        </ul>
    </div>
  </div>
</nav>
