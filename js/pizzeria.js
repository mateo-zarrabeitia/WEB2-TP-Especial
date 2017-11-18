$(document).ready(function() {
  "use strict"
  mostrarInicio();
  function mostrarInicio() {
    event.preventDefault();
    $.ajax({
      "url" : window.location.origin + window.location.pathname+"home",
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $(".contenido").html(textoCargado);
      }
    });
  }

  $(".navegacion").on("click", function (event) {
    event.preventDefault();
    let dir = $(this).attr("href")
    $.ajax({
      "url" : window.location.origin + window.location.pathname+dir,
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $(".contenido").html(textoCargado);
        $( "li" ).removeClass( "active" );
        $(".navegacionFiltrado").on("click", function(event){
        event.preventDefault();
          let id = $(this).attr("name")
          let dir = $(this).attr("href")
          $.ajax({
            "url" : window.location.origin + window.location.pathname+dir+id,
            "method" : "GET",
            "data-type" : "HTML",
            success: function(textoCargado, status){
              cargarComentarios(id);
              $(".contenido").html(textoCargado);
              $(".comentar").submit(function(event){
                  event.preventDefault();
                  guardarComentario();
              });
            }
          });
        });
        $(".filtrado").on("click", function(event){
          event.preventDefault();
          let dir = $(this).attr("href")
          $.ajax({
            "url" : window.location.origin + window.location.pathname+dir,
            "method" : "GET",
            "data-type" : "HTML",
            success: function(textoCargado, status){
              $(".productos").html(textoCargado);
              $(".navegacionFiltrado").on("click", function(event){
              event.preventDefault();
                let id = $(this).attr("name")
                let dir = $(this).attr("href")
                $.ajax({
                  "url" : window.location.origin + window.location.pathname+dir+id,
                  "method" : "GET",
                  "data-type" : "HTML",
                  success: function(textoCargado, status){
                    cargarComentarios(id);
                    $(".contenido").html(textoCargado);
                    $( "li" ).removeClass( "active" );
                  }
                });
              });
            }
          });
        });
      }
    });
  });


  //////////////////////////////

  let templateComentario;

  $.ajax({url: 'js/templates/comentarios.mst'}).done(template => templateComentario = template);

  function crearComentario(comentario){
      let rendered = Mustache.render(templateComentario, {arreglo:comentario});
      $('.comentarios').append(rendered);
  }

  function cargarComentarios(id){
      $.ajax("api/comentarios/producto/"+id)
      .done(function(comentarios) {
          for (var key in comentarios) {
              $('.comentarios').append(crearComentario(comentarios[key]));
          }
          $(".borrarComentario").on("click", function(event){
              event.preventDefault();
              let id_comentario = $(this).attr("href")
              let id_producto = $(this).attr("name")
              let usuarioSesion = $(".usuario").val()
              let usuarioRol = $(".usuarioRol").val()
              let usuarioComentario = $(this).attr("rel")
              if ((usuarioSesion === usuarioComentario)|| usuarioRol == 1 ) {
                $.ajax({
                      method: "DELETE",
                      url: window.location.origin + window.location.pathname+"api/comentarios/"+id_comentario,
                      data:"HTML"
                    })
                  .done(function(data) {
                    $(".comentarios").empty();
                    cargarComentarios(id_producto);
                    alert("Se elimino correctamente");
                  })
                  .fail(function(data) {
                      alert("No se ha podido eliminar el comentario");
                  });
              } else {
                alert("No tiene permisos para borrar comentarios de otros Usuarios")
              }

          });
      })
      .fail(function() {
          $('.comentarios').append('<td>Imposible cargar los comentarios</td>');
      });
  }

  function guardarComentario() {
      let comentario ={
       "fk_id_producto": $('.id_producto').val(),
       "email": $('.usuario').val(),
       "comentario": $('.textocomentario').val(),
       "puntaje": $('.puntaje').val()
      }
       console.log(JSON.stringify(comentario));
      $.ajax({
            method: "POST",
            url: "api/comentarios",
            data: JSON.stringify(comentario)
          })
        .done(function(data) {
          $(".comentarios").empty();
          cargarComentarios($('.id_producto').val());
          $("#formComentario")[0].reset();
        })
        .fail(function(data) {
            alert("No se ha podido crear el comentario");
        });


  }


  $(".navegacionAdmin").on("click", function (event) {
    event.preventDefault();
    let dir = $(this).attr("href")
    $.ajax({
      "url" : window.location.origin + window.location.pathname+dir,
      "method" : "GET",
      "data-type" : "HTML",
      success: function(textoCargado, status){
        $(".contenidoAdmin").html(textoCargado);

      }
    });
  });

//LOGIN FORMULARIO
  $('.message a').click(function(){
     $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
  });

  $( "#login" ).submit(function( event ) {
    $('li').siblings('.login').hide();
});

});
