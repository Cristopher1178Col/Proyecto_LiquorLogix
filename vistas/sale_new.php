<div class="container is-fluid mb-6">
 <div class="has-text-centered mb-5"> 
    <h1 class="title is-3 has-text-info"> 
        <br><br> 
        <i class="fas fa-search"></i> Nueva venta </h1>
    <h2 class="subtitle">Formulario de Venta</h2>
    <form action="index.php?vista=venta_guardar" method="POST">
        <div class="box">
            <div class="field">
                <label class="label">Producto</label>
                <div class="control">
                    <div class="select">
                        <select name="producto_id" required>
                            <option value="" disabled selected>Seleccione un producto</option>
                            <?php foreach ($productos as $producto) { ?>
                                <option value="<?php echo $producto['producto_id']; ?>">
                                    <?php echo $producto['producto_nombre']; ?> - $<?php echo number_format($producto['producto_precio'], 2, '.', ','); ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field">
                <label class="label">Cantidad</label>
                <div class="control">
                    <input type="number" name="cantidad" class="input" min="1" required>
                </div>
            </div>
            <div class="field">
                <label class="label">Precio Unitario</label>
                <div class="control">
                    <input type="text" name="precio_unitario" class="input" readonly>
                </div>
            </div>

            <div class="field">
                <label class="label">Total</label>
                <div class="control">
                    <input type="text" name="total" class="input" readonly>
                </div>
            </div>
            <div class="field is-grouped">
                <div class="control">
                    <button type="submit" class="button is-primary">Registrar Venta</button>
                </div>
                <div class="control">
                    <a href="index.php?vista=caja" class="button is-link">Cancelar</a>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    const selectProducto = document.querySelector('select[name="producto_id"]');
    const inputCantidad = document.querySelector('input[name="cantidad"]');
    const inputPrecioUnitario = document.querySelector('input[name="precio_unitario"]');
    const inputTotal = document.querySelector('input[name="total"]');
    selectProducto.addEventListener('change', function() {
        const productoId = this.value;
        if (productoId) {
            fetch(`get_precio_producto.php?producto_id=${productoId}`)
                .then(response => response.json())
                .then(data => {
                    inputPrecioUnitario.value = data.precio;
                    calcularTotal();
                });
        }
    });
    inputCantidad.addEventListener('input', calcularTotal);

    function calcularTotal() {
        const cantidad = parseInt(inputCantidad.value);
        const precioUnitario = parseFloat(inputPrecioUnitario.value);
        if (!isNaN(cantidad) && !isNaN(precioUnitario)) {
            inputTotal.value = (cantidad * precioUnitario).toFixed(2);
        }
    }
</script>
