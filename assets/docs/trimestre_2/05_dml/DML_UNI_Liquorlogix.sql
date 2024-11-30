/* ******************************************************************* */
/* 01. INSERTAR                                                        */
/*     INSERT INTO __ VALUES ( __ , __ )                               */
/* ******************************************************************* */
INSERT INTO CATEGORIA VALUES 
(null, 'Bebidas alcohólicas', 'Estante A');

INSERT INTO CATEGORIA (categoria_nombre, categoria_ubicacion) VALUES 
('Refrescos', 'Estante B'),
('Licores Premium', 'Estante C');

INSERT INTO PRODUCTO VALUES 
(null, 'COD001', 'Ron Medellín', 50000.00, 100, 'foto_ron_medellin.jpg', 1, 1),
(null, 'COD002', 'Whisky Johnnie Walker', 150000.00, 50, 'foto_whisky.jpg', 3, 1);

INSERT INTO USUARIO (usuario_nombre, usuario_apellido, usuario_usuario, usuario_clave, usuario_email) VALUES 
('Carlos', 'Martínez', 'carlosm', sha1('12345'), 'carlos@example.com');

/* ******************************************************************* */
/* 02. ACTUALIZAR                                                      */
/*     UPDATE __ SET __ = __ WHERE __ = __                             */
/* ******************************************************************* */
UPDATE CATEGORIA SET 
categoria_ubicacion = 'Estante D'
WHERE categoria_id = 2;

UPDATE PRODUCTO SET 
producto_precio = 48000.00, 
producto_stock = 120
WHERE producto_id = 1;

/* ******************************************************************* */
/* 03. ELIMINAR                                                        */
/*     DELETE FROM __ WHERE __ = __                                    */
/* ******************************************************************* */
DELETE FROM CATEGORIA 
WHERE categoria_id = 3;

DELETE FROM PRODUCTO 
WHERE producto_stock = 0;

/* ******************************************************************* */
/* 04. CONSULTAR                                                       */
/* ******************************************************************* */

-- ------------------------------------------------------------------- --
-- 04.01. Generales. ------------------------------------------------- --
--        SELECT * FROM __ ------------------------------------------- --
-- ------------------------------------------------------------------- --
SELECT * FROM CATEGORIA;
SELECT * FROM PRODUCTO;
SELECT * FROM USUARIO;

-- ------------------------------------------------------------------- --
-- 04.02. Específicas. ----------------------------------------------- --
--        SELECT __ , __ FROM __ ------------------------------------- --
-- ------------------------------------------------------------------- --
SELECT producto_nombre, producto_precio FROM PRODUCTO;

-- ------------------------------------------------------------------- --
-- 04.03 Con Criterios. ---------------------------------------------- --
--       SELECT __ , __ FROM __ WHERE __ = __ ------------------------ --
-- ------------------------------------------------------------------- --
SELECT producto_nombre, producto_stock FROM PRODUCTO 
WHERE categoria_id = 1;

SELECT usuario_nombre, usuario_email FROM USUARIO
WHERE usuario_id = 1;
