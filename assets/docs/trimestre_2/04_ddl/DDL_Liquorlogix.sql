/* ************************************************************************************* */
/* ---------------------------------------- DDL ---------------------------------------- */
/* ----------------------------- DATA DEFINITION LANGUAGE ------------------------------ */
/* -------------------------- LENGUAJE DE DEFINICIÓN DE DATOS -------------------------- */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */

/* ------------------------------------------------------------------------------------- */
/* 01. Mostrar BBDDs. ------------------------------------------------------------------ */
/*     SHOW DATABASES : ---------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
SHOW DATABASES;

/* ------------------------------------------------------------------------------------- */
/* 02. Usar BBDD. ---------------------------------------------------------------------- */
/*     USE __ : ------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------- */
USE Compra_Explore;

/* ------------------------------------------------------------------------------------- */
/* 03. Eliminar BBDD. ------------------------------------------------------------------ */
/*     DROP DATABASE __ : -------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
DROP DATABASE Compra_Explore;

/* ------------------------------------------------------------------------------------- */
/* 04. Mostrar Tablas. ----------------------------------------------------------------- */
/*     SHOW TABLES __ : ---------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
SHOW TABLES;

/* ------------------------------------------------------------------------------------- */
/* 05. Mostrar Columnas. --------------------------------------------------------------- */
/*     SHOW COLUMNS FROM __ : ---------------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
SHOW COLUMNS FROM PRODUCTOS;
DESCRIBE PRODUCTOS;

/* ------------------------------------------------------------------------------------- */
/* 06. Crear Tabla. -------------------------------------------------------------------- */
/*     CREATE TABLE __ ( __ , __ ) : --------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCTOS (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE PROVEEDOR (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    contacto VARCHAR(50)
);

CREATE TABLE CLIENTES (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo_cliente VARCHAR(100),
    telefono_cliente VARCHAR(15)
);

CREATE TABLE PEDIDOS (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTOS(id_producto)
);

/* ------------------------------------------------------------------------------------- */
/* 07. Mostrar Creación de Tabla. ------------------------------------------------------ */
/*     SHOW CREATE TABLE __ : ---------------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
SHOW CREATE TABLE CATEGORIA;
SHOW CREATE TABLE PRODUCTOS;
SHOW CREATE TABLE PROVEEDOR;
SHOW CREATE TABLE CLIENTES;
SHOW CREATE TABLE PEDIDOS;

/* ------------------------------------------------------------------------------------- */
/* 08. Eliminar Tabla. ----------------------------------------------------------------- */
/*     DROP TABLE __ : ----------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
DROP TABLE PEDIDOS;
DROP TABLE CLIENTES;
DROP TABLE PROVEEDOR;
DROP TABLE PRODUCTOS;
DROP TABLE CATEGORIA;

/* ------------------------------------------------------------------------------------- */
/* 09. Renombrar Tabla. ---------------------------------------------------------------- */
/*     RENAME TABLE __ TO __ : --------------------------------------------------------- */
/* ------------------------------------------------------------------------------------- */
RENAME TABLE PRODUCTOS TO ARTICULOS;

/* ------------------------------------------------------------------------------------- */
/* 10. Crear Llave Primaria. ----------------------------------------------------------- */
/*     ALTER TABLE __ ADD PRIMARY KEY ( __ ) : ----------------------------------------- */
/* ------------------------------------------------------------------------------------- */
ALTER TABLE CATEGORIA ADD PRIMARY KEY (id_categoria);
ALTER TABLE PRODUCTOS ADD PRIMARY KEY (id_producto);

/* ------------------------------------------------------------------------------------- */
/* 11. Crear Restricción. -------------------------------------------------------------- */
/*     ALTER TABLE __ ADD CONSTRAINT __ FOREIGN KEY ( __ ) REFERENCES __ ( __ ) -------- */
/* ------------------------------------------------------------------------------------- */
ALTER TABLE PEDIDOS ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente) REFERENCES CLIENTES (id_cliente)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE PEDIDOS ADD CONSTRAINT fk_pedido_producto
FOREIGN KEY (id_producto) REFERENCES PRODUCTOS (id_producto)
ON DELETE CASCADE ON UPDATE CASCADE;

/* ************************************************************************************* */
/* ----------------------------------- FIN DE DDL -------------------------------------- */
/* ************************************************************************************* */
