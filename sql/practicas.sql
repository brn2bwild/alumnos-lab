-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2019 a las 08:23:22
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practicas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(10) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `matricula` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` int(1) NOT NULL,
  `grupo` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `rfid` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `carrera`, `matricula`, `semestre`, `grupo`, `rfid`) VALUES
(1, 'Dante Al Haus', 'Ing. Electromecánica', '23E23012', 3, 'a', 'sdaad12313'),
(2, 'Juan Carlos Domínguez de la Cruz', 'Ing. Informática', '17E30325', 3, 'a', 'aosdihasod');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_alumnos`
--

CREATE TABLE `bitacora_alumnos` (
  `id_registro` int(11) NOT NULL,
  `rfid` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `laboratorio` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_practica` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `bitacora_alumnos`
--

INSERT INTO `bitacora_alumnos` (`id_registro`, `rfid`, `laboratorio`, `fecha`, `hora`, `id_practica`) VALUES
(1, 'sdaad12313', 'Automatización y Robótica', '2019-11-29', '11:00:00', 1),
(2, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '22:37:57', 1),
(3, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '22:54:44', 1),
(4, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '22:55:21', 1),
(5, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '22:55:25', 1),
(6, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '22:55:44', 1),
(7, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '22:56:11', 1),
(8, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '22:56:42', 1),
(9, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '23:01:01', 1),
(10, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '23:01:20', 1),
(11, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '23:12:47', 1),
(12, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '23:15:44', 1),
(13, 'sdaad12313', 'Automatización y Robótica', '2019-11-30', '23:16:16', 1),
(14, 'sdaad12313', 'Automatización y Robótica', '2019-12-02', '13:00:01', 1),
(15, 'aosdihasod', 'Automatización y Robótica', '2019-11-29', '11:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id_laboratorio` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`id_laboratorio`, `nombre`, `carrera`, `hora_entrada`, `hora_salida`) VALUES
(1, 'Automatización y Robótica', 'Ing. Electromecánica', '08:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practicas`
--

CREATE TABLE `practicas` (
  `id_practica` int(11) NOT NULL,
  `nombre_practica` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `maestro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `sesiones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `practicas`
--

INSERT INTO `practicas` (`id_practica`, `nombre_practica`, `carrera`, `maestro`, `sesiones`) VALUES
(1, 'práctica 1', 'Ing. Electromecánica', 'Ing. Gabriel Pérez Brindis', '{\"sesion1\":{\"fecha\":\"2019-12-01\",\"horas\":[1,2,3]},\"sesion2\":{\"fecha\":\"2019-12-02\",\"horas\":[3,4]}}'),
(2, 'practica 2', 'Ing. Electromecánica', 'Ing. Gabriel Pérez Brindis', '{\"sesion1\":{\"fecha\":\"2019-02-23\",\"horas\":[1,2,3]},\"sesion2\":{\"fecha\":\"2019-02-24\",\"horas\":[3,4]}}');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `rfid` (`rfid`);

--
-- Indices de la tabla `bitacora_alumnos`
--
ALTER TABLE `bitacora_alumnos`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `rfid` (`rfid`),
  ADD KEY `laboratorio` (`laboratorio`),
  ADD KEY `practica` (`id_practica`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id_laboratorio`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `practicas`
--
ALTER TABLE `practicas`
  ADD PRIMARY KEY (`id_practica`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bitacora_alumnos`
--
ALTER TABLE `bitacora_alumnos`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `practicas`
--
ALTER TABLE `practicas`
  MODIFY `id_practica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora_alumnos`
--
ALTER TABLE `bitacora_alumnos`
  ADD CONSTRAINT `laboratorio-registro` FOREIGN KEY (`laboratorio`) REFERENCES `laboratorios` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `practica` FOREIGN KEY (`id_practica`) REFERENCES `practicas` (`id_practica`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rfid-registro` FOREIGN KEY (`rfid`) REFERENCES `alumnos` (`rfid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
