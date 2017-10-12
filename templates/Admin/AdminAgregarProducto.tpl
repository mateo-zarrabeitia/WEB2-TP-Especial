<div class="wrapper">
  <form id="crearProducto" action="crearProducto" method="post" class="form-signin">
    <h2 class="form-signin-heading text-center">Agregar Producto</h2>
    <div class="form-group">
              <label for="nombre">Nombre del Producto</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Muzzarella" required>
    </div>
    <div class="form-group">
          <label for="nombre">Categoria</label>
          <select name="id_categoria" class="form-control">
            <option value="" selected disabled hidden>Seleccionar Categoria</option>
            {foreach from=$categorias item=categoria}
            <option value="{$categoria['id_categoria']}">{$categoria['nombre']}</option>
            {/foreach}
          </select>
    </div>
    <div class="form-group">
              <label for="precio">Precio</label>
              <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <input name="precio" type="number" placeholder="$100" min="0" step="0.01" data-number-to-fixed="2" data-number-stepfactor="100" class="form-control currency"/>
              <!-- <input type="text" class="form-control" id="precio" name="precio" placeholder="$100" required> -->
              </div>
    </div>
    <div class="form-group">
              <label for="descripcion">Descripcion</label>
              <input type="textarea" class="form-control" id="descripcion" name="descripcion" placeholder="Contiene...." required>
    </div>
    <div class="form-group">
              <label for="imagen">Imagen</label>
              <input type="text" class="form-control" id="imagen" name="imagen" placeholder="images/foto.png" required>
    </div>
    <!-- {if !empty($error) }
             <div class="alert alert-danger" role="alert">{$error}</div>
     {/if} -->
    <button class="btn btn-lg btn-primary btn-block login" type="submit">Crear Producto</button>
  </form>
</div>
