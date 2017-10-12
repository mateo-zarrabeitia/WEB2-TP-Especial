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
      }
    });
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



  // $(".login").on("click", function (event) {
  //   event.preventDefault();
  //   $( "li" ).hide()
  //   alert("Se oculto login");
  //
  // }

});
