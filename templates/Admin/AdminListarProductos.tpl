<div class="wrapper">
  <h2>Productos</h2>
  {foreach from=$productos item=producto}
  <div class="panel panel-default">
      <div class="panel-heading">
            Nombre: {$producto['nombre']}
            <a href="borrarProducto/{$producto['id_producto']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
            <!-- <a href="modificarProducto/{$producto['id_producto']}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a> -->
      </div>
      <div class="panel-body"><strong>Categoria: </strong>{$producto['id_categoria']}</div>
      <div class="panel-body"><strong>Precio: </strong>{$producto['precio']}</div>
      <div class="panel-body"><strong>Descripcion: </strong>{$producto['descripcion']}</div>
      <div class="panel-body"><strong>Imagen: </strong>{$producto['imagenes']}</div>
  </div>
  {/foreach}
</div>
