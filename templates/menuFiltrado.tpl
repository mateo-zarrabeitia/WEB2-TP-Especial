<div class="row">
    <h2>{$nombreCategoria}</h2>
        {foreach from=$productos item=producto}
          {if $producto["id_categoria"] == $idCategoria}
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
