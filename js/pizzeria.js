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
              let repeticion = window.setInterval("refreshComentarios",2000);
              // setTimeout('refreshComentarios',2000);
              // setInterval('refreshComentarios',2000);
              $(".contenido").html(textoCargado);
              $( "li" ).removeClass( "active" );
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
                alert(window.location.origin + window.location.pathname+dir+id)
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

  function refreshComentarios(){
    let id = $(this).attr("name")
    alert(id);
    window.clearInterval(repeticion);
    cargarComentarios();
  }

  function crearComentario(comentario){
      let rendered = Mustache.render(templateComentario, {arreglo:comentario});
      $('.comentarios').append(rendered);
  }

  function cargarComentarios(id){
      $.ajax("api/comentarios/producto/"+id)
      .done(function(comentarios) {
        console.log(comentarios);
          for (var key in comentarios) {
              $('.comentarios').append(crearComentario(comentarios[key]));
          }
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
      // console.log(comentario);
      $.ajax({
            method: "POST",
            url: "api/comentarios",
            data: JSON.stringify(comentario)
          })
        .done(function(data) {
          console.log(JSON.stringify(comentario));
        })
        .fail(function(data) {
            console.log(data);
            let time = new Date().toLocaleString();
            let coment ={
             "email": $('.usuario').val(),
             "comentario": $('.textocomentario').val(),
             "puntaje": $('.puntaje').val(),
             "fecha" : time
            }
            $(".comentarios").empty();
            cargarComentarios($('.id_producto').val());
            // crearComentario(coment);
            $("#formComentario")[0].reset();
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
