<div class="wrapper">
<h2>Categorias</h2>
  {foreach from=$categorias item=categoria}
      <ul class="list-group">
            <li class="list-group-item">
                  <strong>Nombre:</strong> {$categoria['nombre']}
                  <strong>Descripcion:</strong> {$categoria['descripcion']}
              <a href="borrarCategoria/{$categoria['id_categoria']}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
            </li>
      </ul>
  {/foreach}
  </div>
