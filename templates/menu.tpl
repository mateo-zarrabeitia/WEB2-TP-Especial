    <form action="filtrarCategoria" method="POST">
      <div class="form-group">
      <select name="categoria" class="form-control filter" required>
        <option value="" selected disabled hidden>Ver por Categoria</option>
        {foreach from=$categorias item=categoria}
        <option value="{$categoria['id_categoria']}">{$categoria['nombre']}</option>
        {/foreach}
      </select>
        </div>
      <button id="filtrado" class="btn btn-lg btn-primary btn-block filtrado" type="submit">Filtrar</button>
    </form>

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




                      <!--
                      <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                          <div class="carousel-inner" role="listbox">
                            {foreach from=$imagenes item=imagen}
                              {if $producto["id_producto"] == $imagen["fk_id_producto"]}
                                <div class="carousel-item">
                                  <img class="d-block img-fluid" src="http://localhost/trabajo/{$imagen['ruta']}" alt="Second slide">
                                </div>
                              {/if}
                            {/foreach}
                          </div>
                        </div> -->


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
