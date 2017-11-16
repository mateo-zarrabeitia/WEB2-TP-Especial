<div class="container">
  {foreach from=$categorias item=categoria}
    <div class="row">
        <div class="row">
            <div class="col-md-9">
                <h3>{$categoria['nombre']}</h3>
            </div>
            <div class="col-md-3">
                <!-- Controls -->
                <div class="controls pull-right hidden-xs">
                    <a class="left fa fa-chevron-left btn btn-success" href="#carousel-example"
                        data-slide="prev"></a><a class="right fa fa-chevron-right btn btn-success" href="#carousel-example"
                            data-slide="next"></a>
                </div>
            </div>
        </div>
        <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
              {foreach from=$productos item=producto}
              {if $producto["id_categoria"] == $categoria["id_categoria"]}
                <div class="item">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="col-item">
                                <div class="photo">
                                  {foreach from=$imagenes item=imagen}
                                    {if $producto["id_producto"] == $imagen["fk_id_producto"]}
                                      <img src="{$imagen['ruta']}" class="img-responsive" alt="a" />
                                      {/if}
                                  {/foreach}
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>{$producto['nombre']}</h5>
                                            <h5 class="price-text-color">${$producto['precio']}</h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <p class="btn-add">
                                            <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                        <p class="btn-details">
                                            <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>
                    {/if}
                    {/foreach}

                  </div>
                </div>
              </div>
              {/foreach}
      </div>
