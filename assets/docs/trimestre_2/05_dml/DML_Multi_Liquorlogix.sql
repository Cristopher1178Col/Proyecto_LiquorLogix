/* ******************************************************************* */
/* 01. INSERTAR                                                        */
/* ******************************************************************* */
INSERT INTO PEDIDOS (pedido_fecha, cliente_id, usuario_id) VALUES 
('2024-11-25', 1, 1);

INSERT INTO DETALLE_PEDIDO (pedido_id, producto_id, cantidad, subtotal) VALUES 
(1, 1, 5, 250000.00),
(1, 2, 3, 450000.00);

/* ******************************************************************* */
/* 02. ACTUALIZAR                                                      */
/* ******************************************************************* */
-- Actualiza el precio de un producto y recalcula el subtotal en el detalle del pedido.
UPDATE PRODUCTO 
SET producto_precio = 52000.00
WHERE producto_id = 1;

UPDATE DETALLE_PEDIDO 
SET subtotal = cantidad * (SELECT producto_precio FROM PRODUCTO WHERE producto_id = 1)
WHERE producto_id = 1 AND pedido_id = 1;

/* ******************************************************************* */
/* 03. ELIMINAR                                                        */
/* ******************************************************************* */
-- Elimina un detalle de pedido específico.
DELETE FROM DETALLE_PEDIDO 
WHERE pedido_id = 1 AND producto_id = 2;

-- Si el pedido queda sin detalles, elimina el pedido completo.
DELETE FROM PEDIDOS 
WHERE pedido_id = 1 AND NOT EXISTS (
    SELECT 1 FROM DETALLE_PEDIDO WHERE pedido_id = 1
);

/* ******************************************************************* */
/* 04. CONSULTAR                                                       */
/* ******************************************************************* */

-- ------------------------------------------------------------------- --
-- 04.01. Generales con múltiples tablas. ---------------------------- --
--        SELECT __ FROM __ JOIN __ ON __ = __ ----------------------- --
-- ------------------------------------------------------------------- --
-- Consulta los pedidos con información del cliente y usuario.
SELECT P.pedido_id, P.pedido_fecha, C.cliente_nombre, U.usuario_nombre 
FROM PEDIDOS P
JOIN CLIENTES C ON P.cliente_id = C.cliente_id
JOIN USUARIO U ON P.usuario_id = U.usuario_id;

-- ------------------------------------------------------------------- --
-- 04.02. Específicas con criterios. --------------------------------- --
-- ------------------------------------------------------------------- --
-- Lista de productos y su categoría para un pedido específico.
SELECT PR.producto_nombre, PR.producto_precio, CAT.categoria_nombre
FROM DETALLE_PEDIDO DP
JOIN PRODUCTO PR ON DP.producto_id = PR.producto_id
JOIN CATEGORIA CAT ON PR.categoria_id = CAT.categoria_id
WHERE DP.pedido_id = 1;

-- ------------------------------------------------------------------- --
-- 04.03. Agregados y cálculos. -------------------------------------- --
-- ------------------------------------------------------------------- --
-- Obtiene el total de un pedido sumando los subtotales de los productos.
SELECT P.pedido_id, SUM(DP.subtotal) AS total_pedido
FROM PEDIDOS P
JOIN DETALLE_PEDIDO DP ON P.pedido_id = DP.pedido_id
WHERE P.pedido_id = 1
GROUP BY P.pedido_id;

-- Muestra la cantidad de productos vendidos por categoría.
SELECT CAT.categoria_nombre, SUM(DP.cantidad) AS total_vendidos
FROM DETALLE_PEDIDO DP
JOIN PRODUCTO PR ON DP.producto_id = PR.producto_id
JOIN CATEGORIA CAT ON PR.categoria_id = CAT.categoria_id
GROUP BY CAT.categoria_nombre;

-- ------------------------------------------------------------------- --
-- 04.04. Con subconsultas. ------------------------------------------ --
-- ------------------------------------------------------------------- --
-- Consulta productos vendidos en más de un pedido.
SELECT PR.producto_nombre, COUNT(DP.pedido_id) AS veces_vendido
FROM PRODUCTO PR
JOIN DETALLE_PEDIDO DP ON PR.producto_id = DP.producto_id
WHERE DP.producto_id IN (
    SELECT producto_id FROM DETALLE_PEDIDO GROUP BY producto_id HAVING COUNT(pedido_id) > 1
)
GROUP BY PR.producto_nombre;
