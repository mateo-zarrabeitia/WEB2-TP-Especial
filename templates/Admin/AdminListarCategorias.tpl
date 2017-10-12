
  <div class="wrapper">
  <h2>Categorias</h2>
  <ul class="list-group">
    {foreach from=$categorias item=categoria}
        <li class="list-group-item">
              Nombre: {$categoria['nombre']} : {$categoria['descripcion']}
          <a href="borrarCategoria/{$categoria['id_categoria']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
        </li>
    {/foreach}
  </ul>
  </div>
