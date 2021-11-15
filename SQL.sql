-- Adminer 4.8.1 MySQL 8.0.27 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `petSmile`;
CREATE DATABASE `petSmile` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petSmile`;

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `idMascota` int NOT NULL,
  `rutDuenio` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombreMascota` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  KEY `idMascota` (`idMascota`),
  KEY `rutDuenio` (`rutDuenio`),
  KEY `nombreMascota` (`nombreMascota`),
  CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`) ON DELETE CASCADE,
  CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`rutDuenio`) REFERENCES `duenio` (`rut`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `agenda` (`idMascota`, `rutDuenio`, `nombreMascota`, `hora`, `fecha`) VALUES
(8,	'24980048',	'Mario',	'10:10',	'2021-11-11'),
(2,	'24980048',	'Pepeto',	'10:00',	'2021-11-11');

DROP TABLE IF EXISTS `duenio`;
CREATE TABLE `duenio` (
  `rut` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`rut`),
  UNIQUE KEY `rut` (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `duenio` (`rut`, `nombre`, `apellido`, `direccion`, `correo`, `telefono`) VALUES
('24980047',	'David',	'Castillo',	'pp Venezuela',	'vikruzd',	'0412451541'),
('24980048',	'Julio',	'Navarro',	'pp chile',	'jnavarro',	'123123123');

DROP TABLE IF EXISTS `mascota`;
CREATE TABLE `mascota` (
  `idMascota` int NOT NULL AUTO_INCREMENT,
  `tipoMascota` varchar(20) NOT NULL,
  `edadMascota` int NOT NULL,
  `nombreMascota` varchar(20) NOT NULL,
  `rutDuenio` varchar(20) NOT NULL,
  PRIMARY KEY (`idMascota`),
  KEY `rutDuenio` (`rutDuenio`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`rutDuenio`) REFERENCES `duenio` (`rut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `mascota` (`idMascota`, `tipoMascota`, `edadMascota`, `nombreMascota`, `rutDuenio`) VALUES
(1,	'GATO',	2,	'Pepe',	'24980047'),
(2,	'PERRO',	1,	'Pepeto',	'24980048'),
(8,	'CONEJO',	2,	'BUNNY',	'24980048');

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `usuario` (`id`, `nombreUsuario`, `password`) VALUES
(1,	'siboney',	'12345'),
(2,	'pepe',	'54321'),
(3,	'felipe',	'65432');

-- 2021-11-11 06:51:49
