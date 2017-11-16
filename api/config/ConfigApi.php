<?php
	class ConfigApi {

	    public static $RESOURCE = 'resource';
	    public static $PARAMS = 'params';
	    public static $RESOURCES = [
	   		'comentarios#GET' => 'ComentariosApiController#getComentarios',
	    	'comentarios#POST' => 'ComentariosApiController#createComentario',
	    	'comentarios#PUT' => 'ComentariosApiController#editComentario',
	    	'comentarios#DELETE' => 'ComentariosApiController#deleteComentario'
	    ];
	}
?>
