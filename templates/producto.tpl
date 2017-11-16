      <div class="row">
        {foreach from=$productos item=producto}
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
                      </div>
                    </div>
                  </div>
        {/foreach}
      </div>
      <div class="">
        <div class="container">
            <div class="row">
              <div class="col-md-8">
                  <div class="page-header">
                      <h1><small class="pull-right"></small> Comentarios </h1>
                  </div>
        <div class="comentarios">

        </div>
      </div>
  </div>
</div>
      </div>


        <div class="row">

          {if !isset($usuario)}
          <h2>Para comentar debe estar logueado</h2>
          {else}
          <h2>Comentar</h2>
            <p>Comentando como: <span class="user">{$usuario}</span></p>
            <form class="comentar" action="api/comentarios" method="POST">
              <select name="fk_puntaje" class="form-control puntaje">
                <option value="" selected disabled hidden>Puntaje</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
              <input class="form-control fk_id_celular" type="hidden" name="fk_id_celular" placeholder="Id celular" value="{$celular['id_celular']}">
              <input class="form-control fk_id_usuario" type="hidden" name="fk_id_usuario" placeholder="Id usuario" value="{$usuario['id_usuario']}">
              <input class="form-control fk_usuario" type="hidden" name="fk_usuario" placeholder="Usuario" value="{$usuario['usuario']}">
              <textarea class="form-control textocomentario" cols="10" rows="5" name="textocomentario" placeholder="Comentario"></textarea>
              <button class="btn btn-lg btn-primary btn-block comment" type="submit">Comentar</button>
            </form>
            {/if}
           </div>
