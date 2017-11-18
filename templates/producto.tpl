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
    <div class="row">
        <div class="col-md-8">
          {if !isset($usuario)}
          <h2>Para comentar debe estar logueado</h2>
          {else}
          <h2>Comentar</h2>
            <label>Comentando como: <span class="user">{$usuario['USUARIO']}</span></label>
            <form id="formComentario"class="comentar" action="api/comentarios" method="POST">
              <select name="fk_puntaje" class="form-control puntaje" required>
                <option value="" selected disabled hidden>Puntaje</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
              {foreach from=$productos item=producto}
              <input class="form-control id_producto" type="hidden" name="fk_id_producto" value="{$producto['id_producto']}">
              {/foreach}
              <input class="form-control usuario" type="hidden" name="usuario"value="{$usuario['USUARIO']}">
              <textarea class="form-control textocomentario" cols="10" rows="5" name="textocomentario" placeholder="Comentario" required></textarea>

              <div class="g-recaptcha" data-sitekey="6Le2QDkUAAAAAO6MwmA-RdmjpfCcOV97d5Nx_KPp"></div>
              <button class="btn btn-lg btn-primary btn-block comentar" type="submit">Comentar</button>
            </form>
            {/if}
          </div>
      </div>
  </div>
