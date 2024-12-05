<div class="container is-fluid mb-6">
 <div class="has-text-centered mb-5"> 
    <h1 class="title is-3 has-text-info"> 
        <br><br> 
        <i class="fas fa-search"></i> Caja </h1>
    <h2 class="subtitle">Monto Actual</h2>
    
    <div class="box">
        <p class="has-text-centered is-size-3">
            <?php 
               /* echo "$" . number_format($montoCaja, 2, '.', ','); */
            ?> 
        </p>
        <h3 class="subtitle">Registrar Nuevo Monto</h3>
        <form action="index.php?vista=caja" method="POST">
            <div class="field">
                <label class="label">Nuevo Monto</label>
                <div class="control">
                    <input class="input" type="number" name="nuevoMonto" step="0.01" min="0" placeholder="Ingrese el monto" required>
                </div>
            </div>

            <div class="control">
                <button type="submit" class="button is-primary is-rounded">Registrar Monto</button>
            </div>
            <br>
        </form>

        <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $nuevoMonto = $_POST['nuevoMonto'];
            if (actualizarMontoCaja($nuevoMonto)) {
                echo '<p class="notification is-success">Monto actualizado exitosamente.</p>';
                $montoCaja = $nuevoMonto;
            } else {
                echo '<p class="notification is-danger">Hubo un error al actualizar el monto.</p>';
            }
        }
        ?>
        
        <div class="buttons is-centered">
            <a href="index.php?vista=caja_actualizar" class="button is-primary is-rounded">
                Actualizar Caja
            </a>
        </div>
    </div>
</div>
