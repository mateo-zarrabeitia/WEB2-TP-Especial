{if $filtro == 1}
    <div class="btn-group btn-group-justified">
      <a href="filtrarCategoria/todas" name="boton" class="btn btn-default filtrado" role="button">Todas</a>
        {foreach from=$categorias item=categoria}
        <a href="filtrarCategoria/{$categoria['id_categoria']}/{$categoria['nombre']}" name="boton" class="btn btn-default filtrado" role="button">{$categoria['nombre']}</a>
        {/foreach}
    </div>
{/if}
    <div class="productos">
      {foreach from=$categorias item=categoria}
      <h2>{$categoria['nombre']}</h2>
        <div class="row">
          {foreach from=$productos item=producto}
            {if $producto["id_categoria"] == $categoria["id_categoria"]}
                    <div class="col-sm-6 col-md-4">
                      <div class="thumbnail">
                        <section>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                          <div class="carousel-inner">
                              {foreach from=$imagenes item=imagen}
                                {if $producto["id_producto"] == $imagen["fk_id_producto"]}
                                 <div class="item active">
                                   <img src="{$imagen['ruta']}" alt="Chania">
                                </div>
                                {/if}
                              {/foreach}
                          </div>
                        </div>
                        </section>
                        <div class="caption">
                          <h3>{$producto['nombre']}</h3>
                          <h4>{$producto['descripcion']}</h4>
                          <p>${$producto['precio']}</p>
                          <p><a href="detalleProducto/" name="{$producto['id_producto']}"class="btn btn-info btn-xs navegacionFiltrado" role="button">Ver Mas</a></p>
                        </div>
                      </div>
                    </div>
              {/if}
          {/foreach}
            </div>
      {/foreach}
    </div>
