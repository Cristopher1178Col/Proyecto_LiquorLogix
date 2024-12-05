<div class="container is-fluid mb-6">
 <div class="has-text-centered mb-5"> 
    <h1 class="title is-3 has-text-info"> 
        <br><br> 
        <i class="fas fa-search"></i> Nueva categoria</h1>
	<h2 class="subtitle">Registra una nueva categoria en el sistema</h2>
</div>

<div class="box">

	<div class="form-rest mb-6 mt-6"></div>

	<form action="./php/categoria_guardar.php" method="POST" class="FormularioAjax" autocomplete="off" >
		<div class="columns">
		  	<div class="column">
		    	<div class="control">
					<label>Nombre</label>
				  	<input class="input" type="text" name="categoria_nombre" pattern="[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ ]{4,50}" maxlength="50" required >
				</div>
		  	</div>
		  	<div class="column">
		    	<div class="control">
					<label>Ubicación</label>
				  	<input class="input" type="text" name="categoria_ubicacion" pattern="[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ ]{5,150}" maxlength="150" >
				</div>
		  	</div>
		</div>
		<p class="has-text-centered">
			<button type="submit" class="button is-info is-rounded">Guardar</button>
		</p>
	</form>
</div>