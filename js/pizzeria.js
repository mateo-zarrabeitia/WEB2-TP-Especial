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
          alert(window.location.origin + window.location.pathname+dir+id);
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
        $(".filtrado").submit(function(event){
          event.preventDefault();
          let dir = $(this).attr("href")
          alert( window.location.origin + window.location.pathname+dir)
          $.ajax({
            "url" : window.location.origin + window.location.pathname+dir,
            "method" : "GET",
            "data-type" : "HTML",
            success: function(textoCargado, status){
              $(".contenido").html(textoCargado);
              $( "li" ).removeClass( "active" );
            }
          });
        });
      }
    });
  });


  //////////////////////////////

  let templateComentario;

  $.ajax({url: 'trabajo/js/templates/comentarios.mst'}).done(template => templateComentario = template);

  function crearComentario(comentario){
      let rendered = Mustache.render(templateComentario, {arreglo:comentario});
      $('.comentarios').append(rendered);
  }

  function cargarComentarios(id){
      alert(window.location.origin+"/trabajo/api/comentarios/producto/"+id)
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




  $("#filtrado").submit(function (event) {
     event.preventDefault();
     let dir = $(this).attr("href");

  });


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

//Comentarios

// getComments();
//
// intervalo = setInterval(getComments, 2000);
//
// function getComments(){
//
//     $.get( "api/comentarios", function(data) {
//     let datos = [];
//     for (let i = 0; i < data.length; i++) {
//       if (id_producto == data[i].fk_id_producto) {
//         datos.push(data[i]);
//       }
//     }
//     console.log(datos);
//     let rendered = Mustache.render(template,{comentarios:datos});
//     $(".comentarios").html(rendered);
//
//   });
// }
//
//
// //ELIMINAR COMENTARIO
//  $(document).on('click', '.eliminarComentario', function(ev) {
//       ev.preventDefault();
//       var comentario = $(this).parents(".comentario");
//       var id =  $(this).attr("data-id");
//       $.ajax({
//           type: "DELETE",
//           url: 'api/comentario/' + id,
//           success: function(){
//             $(comentario).html("");
//           }
//         });
//
//       });
//  //AGREGAR COMENTARIO
//  $(document).on('submit', '.agregarComentario', function(ev) {
//     ev.preventDefault();
//     var comentario = $(this).serialize();
//     $.post( "api/comentario", comentario, function( comentarios ) {
//       var rendered = Mustache.render(template,{comentarios});
//       $( ".comentarios" ).append(rendered);
//     });
//   });

});
