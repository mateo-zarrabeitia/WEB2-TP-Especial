  {include file="Admin/header.tpl"}
  {include file="Admin/adminNav.tpl"}

  <div class="container contenidoAdmin">
    <!-- <div class="wrapper">
    <h2>Categorias</h2>
    <ul class="list-group">
      {foreach from=$categorias item=categoria}
          <li class="list-group-item">
                Nombre: {$categoria['nombre']} : {$categoria['descripcion']}
            <a href="borrarCategoria/{$categoria['id_categoria']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
          </li>
      {/foreach}
    </ul>
    </div> -->
    <div class="wrapper">
      <h2>Productos</h2>
        {foreach from=$categorias item=categoria}
            <h2>Categoria: {$categoria['nombre']}  <a href="borrarCategoria/{$categoria['id_categoria']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></h2>
                  {foreach from=$productos item=producto}
                    {if $producto["id_categoria"] == $categoria["id_categoria"]}
                      <div class="panel panel-default">
                          <div class="panel-heading">
                                Nombre: {$producto['nombre']}
                                <a href="borrarProducto/{$producto['id_producto']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                <!-- <a href="modificarProducto/{$producto['id_producto']}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a> -->
                          </div>
                          <div class="panel-body"><strong>Categoria: </strong>{$producto['id_categoria']}</div>
                          <div class="panel-body"><strong>Precio: $ </strong>{$producto['precio']}</div>
                          <div class="panel-body"><strong>Descripcion: </strong>{$producto['descripcion']}</div>
                          <div class="panel-body">
                            <img src="{$producto['imagenes']}" class="img-rounded" alt="Cinque Terre" width="200" height="200">

                          </div>
                      </div>
                      {/if}
                  {/foreach}

        {/foreach}
      <!-- <ul class="list-group">
        {foreach from=$productos item=producto}
            <li class="list-group-item">
                  Nombre: {$producto['nombre']} - Precio:{$producto['precio']}-Imagen:{$producto['imagenes']}-Id:{$producto['id_producto']}
              <a href="borrarTarea/{$tarea['id_tarea']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
            </li>
        {/foreach}
      </ul> -->
      </div>

    </div>

  </div>

{include file="footer.tpl"}
