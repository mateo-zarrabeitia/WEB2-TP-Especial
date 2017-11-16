<div class="wrapper">
  <h2>Productos</h2>
  {foreach from=$productos item=producto}

  <div class="panel panel-default">
      <div class="panel-heading">
            Nombre: {$producto['nombre']}
            <a href="borrarProducto/{$producto['id_producto']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
            <!-- <a href="modificarProducto/{$producto['id_producto']}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a> -->
      </div>
      {foreach from=$categorias item=categoria}
        {if $producto["id_categoria"] == $categoria["id_categoria"]}
          <div class="panel-body"><strong>Categoria: </strong>{$categoria['nombre']}</div>
        {/if}
      {/foreach}
      <div class="panel-body"><strong>Precio: $ </strong>{$producto['precio']}</div>
      <div class="panel-body"><strong>Descripcion: </strong>{$producto['descripcion']}</div>
      <div class="panel-body">
        {foreach from=$imagenes item=imagen}
          {if $producto["id_producto"] == $imagen["fk_id_producto"]}
            <img src="{$imagen['ruta']}" class="img-rounded" alt="Cinque Terre" width="200" height="200">
            <a href="borrarImagen/{$imagen['id_imagen']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
            {/if}
        {/foreach}
      </div>
  </div>





  {/foreach}
</div>
