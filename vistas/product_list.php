<div class="container is-fluid mb-6">
 <div class="has-text-centered mb-5"> 
    <h1 class="title is-3 has-text-info"> 
        <br><br> 
        <i class="fas fa-search"></i>Lista de productos</h1>
    <h2 class="subtitle">¿Que producto buscas?</h2>
</div>

<div class="box">
    <?php
        require_once "./php/main.php";

        # Eliminar producto #
        if(isset($_GET['product_id_del'])){
            require_once "./php/producto_eliminar.php";
        }

        if(!isset($_GET['page'])){
            $pagina=1;
        }else{
            $pagina=(int) $_GET['page'];
            if($pagina<=1){
                $pagina=1;
            }
        }

        $categoria_id = (isset($_GET['category_id'])) ? $_GET['category_id'] : 0;

        $pagina=limpiar_cadena($pagina);
        $url="index.php?vista=product_list&page="; /* <== */
        $registros=15;
        $busqueda="";

        # Paginador producto #
        require_once "./php/producto_lista.php";
    ?>
</div>