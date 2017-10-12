<div class="contenido">
  {foreach from=$categorias item=categoria}
    <h2>{$categoria['nombre']}</h2>
      <div class="row">
        {foreach from=$productos item=producto}
          {if $producto["id_categoria"] == $categoria["id_categoria"]}
                  <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                      <img src="{$producto['imagenes']}" alt="...">
                      <div class="caption">
                        <h3>{$producto['nombre']}</h3>
                        <h4>{$producto['descripcion']}</h4>
                        <p>${$producto['precio']}</p>
                        
                      </div>
                    </div>
                  </div>
            {/if}
        {/foreach}
          </div>
  {/foreach}
  </div>
