

<div class="wrapper">
  <form id="crearCategoria" action="crearCategoria" method="post" class="form-signin">
    <h2 class="form-signin-heading text-center">Agregar Categoria</h2>
    <div class="form-group">
              <label for="nombre">Nombre de Categoria</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Pizzas" required>
    </div>
    <div class="form-group">
              <label for="descripcion">Descripcion</label>
              <input type="text" class="form-control" id="nombre" name="descripcion" placeholder="BLABLABLA" required>
    </div>
    <!-- {if !empty($error) }
             <div class="alert alert-danger" role="alert">{$error}</div>
     {/if} -->
    <button class="btn btn-lg btn-primary btn-block login" type="submit">Crear Categoria</button>
  </form>
</div>
