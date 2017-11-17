<table class="table table-striped">
   <thead>
     <tr>
       <th>Nombre</th>
       <th>Email</th>
       <th>Administrador</th>
       <th>Permisos Admin</th>
     </tr>
   </thead>
   <tbody>
     {foreach from=$usuarios item=usuario}
     <tr>
       <td>{$usuario['nombre']}</td>
       <td>{$usuario['email']}</td>
       <td>{if {$usuario['rol']} == 1} SI {else} NO {/if}</td>
        <td>
            <a href="darPermisoAdmin/{$usuario['id_usuario']}/1" name="boton" class="btn btn-default filtrado" role="button">Dar</a>
            <a href="darPermisoAdmin/{$usuario['id_usuario']}/0" name="boton" class="btn btn-default filtrado" role="button">Quitar</a>
        </td>
     </tr>
     {/foreach}
   </tbody>
 </table>
