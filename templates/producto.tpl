<!-- <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{$titulo}}</title>
        <link href="css/estilo.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      </head>
      <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-1">
                </div>
 -->
<!-- {include file="header.tpl"} -->
<!-- <div class="contenido"> -->
      <div class="row">
        {foreach from=$productos item=producto}
                  <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                      <img src="../{$producto['imagenes']}" alt="...">
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

<!--

            <form href="api/comentarios" class="formComentarios" enctype="multipart/form-data">
              <div class="form-group">
                <input type="hidden" id= "fk_id_producto" name="fk_id_producto" value="{$producto["id_producto"]}" class="fk_id_producto">
                </div>
                <div class="form-group">
                <label for="valoracion">Valoracion</label>
                <select class="marca" id="puntaje" name="valoracion">
                      <option class="marca" value="1" name="valoracion">1</option>
                      <option class="marca" value="2" name="valoracion">2</option>
                      <option class="marca" value="3" name="valoracion">3</option>
                      <option class="marca" value="4" name="valoracion">4</option>
                      <option class="marca" value="5" name="valoracion">5</option>
                </select>
                </div>
                <div class="form-group">
                <label for="comentario">Comentario</label>
                <textarea name="comentario" id="comentario" name="comentario" rows="8" cols="50"></textarea>
                </div>
              <button id="crearComentario" type="submit" class="btn btn-default">Crear</button>
          </form> -->









          <!-- <form href="api/comentarios" class="formComentarios" enctype="multipart/form-data">
              <div class="form-group">
                    <label for="comentario">Agregar Comentario</label>
                    <input type="text" class="form-control" id="comentario" name="comentario"  placeholder="Comentario..."></input>
                    <label for="valoracion">Valoracion</label>
                    <select class="marca" id="valoracion" name="valoracion">
                          <option class="marca" value="1" name="valoracion">1</option>
                          <option class="marca" value="2" name="valoracion">2</option>
                          <option class="marca" value="3" name="valoracion">3</option>
                          <option class="marca" value="4" name="valoracion">4</option>
                          <option class="marca" value="5" name="valoracion">5</option>
                    </select>
                      {foreach from=$productos item=producto}
                    <input type="text"  class="idProducto"  id="id_producto"name="id_producto" value="{$producto['id']}" hidden="on"></input>
                           {/foreach}
              </div>
                <input type="submit" class="btn btn-default" value="Agregar">
          </form> -->
                <!-- <form class="comentar">
               <select name="fk_puntaje" class="form-control puntaje">
                 <option value="" selected disabled hidden>Puntaje</option>
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                 <option value="5">5</option>
               </select>
               <input class="form-control fk_id_producto" type="hidden" name="fk_id_producto" placeholder="id_producto" value="{$producto['id_producto']}">
               <input class="form-control fk_id_usuario" type="hidden" name="fk_id_usuario" placeholder="Id usuario" value="{$usuario['id_usuario']}">
               <input class="form-control fk_usuario" type="hidden" name="fk_usuario" placeholder="Usuario" value="{$usuario['usuario']}">
               <textarea class="form-control textocomentario" cols="10" rows="5" name="textocomentario"></textarea>
               <button class="btn btn-lg btn-primary btn-block agregarComentario" type="submit">Comentar</button>
             </form> -->
           </div>

      <!-- </div> -->
          <!-- </div>
              </div>

              <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
              <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
              integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
              <script type="text/javascript" src="../js/pizzeria.js"></script>
              <script type="text/javascript" src="../js/comentarios.js"></script>
              <script type="text/javascript" src="../js/mustache.min.js"></script>
              <script src="../js/jquery.min.js"></script>
          </body>
      </html> -->
