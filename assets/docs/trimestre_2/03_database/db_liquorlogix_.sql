SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Esquema `db_liquorlogix`
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_liquorlogix` DEFAULT CHARACTER SET utf8;
USE `db_liquorlogix`;

-- -----------------------------------------------------
-- Tabla `USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `USUARIO` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `correo_usuario` VARCHAR(45) NOT NULL,
  `contraseña_usuario` VARCHAR(45) NOT NULL,
  `rol_usuario` ENUM('admin', 'empleado') NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla `CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CATEGORIA` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla `PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PRODUCTO` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `precio_compra_producto` DECIMAL(10,2) NOT NULL,
  `precio_venta_producto` DECIMAL(10,2) NOT NULL,
  `descripcion_producto` VARCHAR(100) NOT NULL,
  `stock_producto` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `fk_producto_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `CATEGORIA` (`id_categoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla `DISTRIBUIDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DISTRIBUIDOR` (
  `id_distribuidor` INT NOT NULL AUTO_INCREMENT,
  `nombre_distribuidor` VARCHAR(45) NOT NULL,
  `contacto_distribuidor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_distribuidor`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla `TRANSACCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TRANSACCION` (
  `id_transaccion` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `fecha_transaccion` DATE NOT NULL,
  `cantidad_transaccion` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  CONSTRAINT `fk_id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla `DISTRIBUIDOR_PRODUCTO` (Tabla puente para Distribuidor y Producto)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DISTRIBUIDOR_PRODUCTO` (
  `id_distribuidor` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_distribuidor`, `id_producto`),
  CONSTRAINT `fk_distribuidor_producto_distribuidor`
    FOREIGN KEY (`id_distribuidor`)
    REFERENCES `DISTRIBUIDOR` (`id_distribuidor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_distribuidor_producto_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `PRODUCTO` (`id_producto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla `TRANSACCION_PRODUCTO` (Tabla puente para Transacción y Producto)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TRANSACCION_PRODUCTO` (
  `id_transaccion` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_transaccion`, `id_producto`),
  CONSTRAINT `fk_transaccion_producto_transaccion`
    FOREIGN KEY (`id_transaccion`)
    REFERENCES `TRANSACCION` (`id_transaccion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transaccion_producto_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `PRODUCTO` (`id_producto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
