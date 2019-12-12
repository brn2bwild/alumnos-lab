-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2019 a las 20:05:12
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

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
  `rfid` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora_alumnos`
--

CREATE TABLE `bitacora_alumnos` (
  `id_registro` int(10) NOT NULL,
  `rfid` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `laboratorio` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_practica` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id_laboratorio` int(10) NOT NULL,
  `carrera` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `disponible` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `capacidad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`id_laboratorio`, `carrera`, `nombre`, `disponible`, `capacidad`) VALUES
(1, 'Ing. Informática', 'Multimedia', '1,2,3,4,5,6,7,8,9,10,11,12', 50),
(2, 'Ing. Informática', 'Base de datos', '1,2,3,4,5,6,7,8,9,10,11,12', 60),
(3, 'Ing. Informática', 'Redes', '1,2,3,4,5,6,7,8,9,10,11,12', 50),
(4, 'Ing. Informática', 'Multiplataforma', '1,2,3,4,5,6,7,8,9,10,11,12', 50),
(5, 'Ing. Agronomía', 'Análisis de Suelos - A', '1,2,3,4,5,6,7,8,9,10,11,12', 15),
(6, 'Ing. Agronomía', 'Análisis de Suelos - B', '1,2,3,4,5,6,7,8,9,10,11,12', 15),
(7, 'Ing. Agronomía', 'Parcela experimental - Palma Aceite', '1,2,3,4,5,6,7,8,9,10', 60),
(8, 'Ing. Agronomía', 'Parcela experimental - Plantación de Teca/ Cultivo', '1,2,3,4,5,6,7,8,9,10', 60),
(9, 'Ing. Agronomía', 'Parcela experimental - Plantación de Cacao', '1,2,3,4,5,6,7,8,9,10', 60),
(10, 'Ing. Agronomía', 'Parcela experimental - Banco de Germoplasma', '1,2,3,4,5,6,7,8,9,10', 60),
(11, 'Ing. Agronomía', 'Parcela experimental - Plantas Ornamentales', '1,2,3,4,5,6,7,8,9,10', 60),
(12, 'Ing. Agronomía', 'Parcela experimental - Cultivos Anuales', '1,2,3,4,5,6,7,8,9,10', 60),
(13, 'Ing. Agronomía', 'Laboratorio de Usos Múltiples', '1,2,3,4,5,6,7,8,9,10', 20),
(14, 'Ing. Bioquímica', 'Laboratorio de Análisis Fisicoquímicos/Microbiología', '1,2,3,4,5,6,7,8,9,10', 30),
(15, 'Ing. Bioquímica', 'Laboratorio de Química General', '1,2,3,4,5,6,7,8,9,10', 30),
(16, 'Ing. Bioquímica', 'Laboratorio de Investigación', '1,2,3,4,5,6,7,8,9,10', 30),
(17, 'Ing. Bioquímica', 'Laboratorio de Cárnicos/Cereales, Leguminosas y Oleaginosas', '1,2,3,4,5,6,7,8,9,10', 40),
(18, 'Ing. Bioquímica', 'Taller de Lácteos/Frutas y Hortalizas', '1,2,3,4,5,6,7,8,9,10', 40),
(19, 'Ing. Industrial', 'Laboratorio de Ergonomía', '1,2,3,4,5,6,7,8,9,10', 30),
(20, 'Ing. Industrial', 'Laboratorio de Estudio del Trabajo', '1,2,3,4,5,6,7,8,9,10', 30),
(21, 'Ing. Electromecánica', 'Taller de Máquinas y Herramientas', '1,2,3,4,5,6,7,8', 50),
(22, 'Ing. Electromecánica', 'Laboratorio de Automatización y Robótica', '1,2,3,4,5,6,7,8,9,10,11,12', 30),
(23, 'Ing. Administración', 'Programoteca', '1,2,3,4,5,6,7,8,9,10,11,12', 50),
(24, 'Ing. Agronomía', 'Parcela experimental - Área de Manejo de Maquinaría Agrícola', '1,2,3,4,5,6,7,8,9', 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE `maestros` (
  `id_maestro` int(10) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `maestros`
--

INSERT INTO `maestros` (`id_maestro`, `nombre`, `clave`, `carrera`, `pass`, `email`) VALUES
(3, 'M.I. AngÃ©lica Ãvalos Cano', 'infdoc0001', 'Ing. InformÃ¡tica', '1ebe191c99e8b3c4cc3dbd3b60aa8478f5eb0568', ''),
(4, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'infdoc0002', 'Ing. InformÃ¡tica', 'b3f4ce15157a19fe60499d80004347a441e66ba5', ''),
(5, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'infdoc0003', 'Ing. InformÃ¡tica', '0e6bd394853c70e43f8ed70cd318a5a16e4f8b08', ''),
(6, 'M.I. Isidro HernÃ¡ndez Castellanos', 'infdoc0004', 'Ing. InformÃ¡tica', '53fa1faa5c6595ee91c9183432d0d5e1ee2ae586', ''),
(7, 'M.T. Isidro Torres GonzÃ¡lez', 'infdoc0005', 'Ing. InformÃ¡tica', '2413bde8d1866d18874e4994fdfa3dbe3da17165', ''),
(8, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'infdoc0006', 'Ing. InformÃ¡tica', '7cf549ea3079ab39b01562f9104d3823be1666ba', ''),
(9, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'infdoc0007', 'Ing. InformÃ¡tica', '42d5e440bb8d92cdc52619fa54a5d07302eb5bf4', ''),
(10, 'Lic. Rommel Acosta FÃ©lix', 'infdoc0008', 'Ing. InformÃ¡tica', 'e09cd8e5cdf47066fd60b97daf27d6ecad20fef4', ''),
(11, 'Lic. JesÃºs Manuel May LeÃ³n', 'infdoc0009', 'Ing. InformÃ¡tica', 'b23382ee7244e29913b6b1266f3dd3c037dac1bd', ''),
(12, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'infdoc0010', 'Ing. InformÃ¡tica', 'ce163925340faf2577ed3ea0f3f297e04984d3ce', ''),
(13, 'Lic. Gloria PÃ©rez Valdivia', 'infadm0001', 'Ing. InformÃ¡tica', 'd4c592236bc376f1a7e185deb14da0bc15384abb', ''),
(14, 'Dr. Juan Carlos RodrÃ­guez Cabriales', 'diradm0002', 'DirecciÃ³n', '1c270caddea4784f9f7295b0831efef4d6f1ea9c', ''),
(15, 'M.A. RocÃ­o HernÃ¡ndez Ovando', 'infdir0001', 'Ing. InformÃ¡tica', '1e4853dc920dbb89e758fce31bbe4c2966d64b33', ''),
(16, 'M.C. Gerardo RamÃ­rez Sandoval', 'agrdoc0001', 'Ing. AgronomÃ­a', 'a185f36ec450d40c4637781187ce3b2f275bbc5b', ''),
(17, 'Ing. Ãlvaro Gil Ãlvarez', 'agrdoc0002', 'Ing. AgronomÃ­a', '95949866acc949465280d6117ca0259f9cbea27d', ''),
(18, 'Ing. Manolo SÃ¡nchez Perez', 'agrdoc0003', 'Ing. AgronomÃ­a', '29a73cbf3cd4937bb18594dc8669b3054f3f028a', ''),
(19, 'Ing. HÃ©ctor Emilio RamÃ­rez Castro', 'agrdoc0004', 'Ing. AgronomÃ­a', 'e7b09415c7d934b2db5bf318b15c81af1a013ee3', ''),
(20, 'Dra. Ana MarÃ­a RodrÃ­guez de la Cruz', 'agrdoc0005', 'Ing. AgronomÃ­a', '2f385903841884e509ce38c2bc14cd481ec68609', ''),
(21, 'M.V.Z. Carlos Mario PÃ©rez PÃ©rez	', 'agrdoc0006', 'Ing. AgronomÃ­a', 'd7b4ba668923b735e21e2401b3f0fdebc7a55cc2', ''),
(22, 'M.T.A. Manuel Ochoa Ochoa', 'agrdir0001', 'Ing. AgronomÃ­a', '0366811553cd3143e7acd585ea3e48042c8f7a87', ''),
(23, 'Ing. JesÃºs Alberto Maldonado JimÃ©nez', 'agradm0001', 'Ing. AgronomÃ­a', '2c82e64b382b71135ccfcd41fccfdb64606d7a36', ''),
(24, 'Ing. Alcibiades PÃ©rez Cuevas', 'agradm0002', 'Ing. AgronomÃ­a', 'e6993645f05326fcc875d38214dc0b093cf7566c', ''),
(25, 'QuÃ­m. JesÃºs Armando Romero GonzÃ¡lez', 'biodir0001', 'Ing. BioquÃ­mica', 'a65223716f9d9eb04acc88cdb266af3ceae26fbe', ''),
(26, 'M.C. Carolina VÃ¡zquez HernÃ¡ndez', 'biodoc0001', 'Ing. BioquÃ­mica', '09425b0aa141ea8bfc2613cc0b07bb34f456ff22', ''),
(27, 'M.C. Miriam SÃ¡nchez de Dios', 'biodoc0002', 'Ing. BioquÃ­mica', '1f0e7ee760453b50684f5544e34aa0ddff7f94cb', ''),
(28, 'M.C. Leticia Almeida LÃ³pez', 'biodoc0003', 'Ing. BioquÃ­mica', '6f67480d91b93bb9f8f127d35b0c6d7dd0b9ad3b', ''),
(29, 'IBQ. Paloma Vanessa Aguilar Tavera', 'biodoc0004', 'Ing. BioquÃ­mica', '8739e6646b7561abce71729ccad6c5d982c2929c', ''),
(30, 'M.C. JosÃ© Alfredo JimÃ©nez JuÃ¡rez', 'biodoc0005', 'Ing. BioquÃ­mica', 'b9b96001bbcb87f54f204331e8e19f9e43afda97', ''),
(31, 'M.I.P.A. Juan Carlos Aguilar Arpaiz', 'biodoc0006', 'Ing. BioquÃ­mica', 'd0aaec5ec0e3fa8d1a9d55eb28701d8373f24aa4', ''),
(32, 'Ing. Job Betuel Altamirano JarquÃ­n', 'bioadm0001', 'Ing. BioquÃ­mica', '829ee61beb63b1fa0512f70fbd4ff918b5b3dd49', ''),
(33, 'M.A. VerÃ³nica AvendaÃ±o GÃ³mez', 'inddoc0001', 'Ing. Industrial', 'e5aba3fd70c5d57d0b69c710e11b6e2fda1e36de', ''),
(34, 'Dra. MarÃ­a del Rosario GarcÃ­a VÃ¡zquez', 'inddoc0002', 'Ing. Industrial', '0ffb26fd2fb4ec91cd4af3374e6577ed34ee0056', ''),
(35, 'Ing. Maricela Utrilla DÃ­az', 'inddoc0003', 'Ing. Industrial', 'f3268b25b184d4f2df4bedd3f342aa90916af04b', ''),
(36, 'M.A. Ernesto GÃ³mez', 'inddoc0004', 'Ing. Industrial', 'ed78eb4725c08126024e83a43684f39b2d59fa3a', ''),
(37, 'Ing. JesÃºs Guadalupe Castillo Xicotenca', 'inddoc0005', 'Ing. Industrial', '58bd3aed6545081d3f1f72bbf9d3449b63e06425', ''),
(38, 'Ing. Ambrosio Arana Paredes', 'inddoc0006', 'Ing. Industrial', 'fec193a6715e8e456fc9a5f802c08d3265128f38', ''),
(39, 'Ing. Osvaldo HernÃ¡ndez GarcÃ­a', 'inddoc0007', 'Ing. Industrial', '7dbc1d154f9d87cb5b8d8195d25cd18e80962ef3', ''),
(40, 'M.A. Sara MarÃ­a LeÃ³n MartÃ­nez', 'inddoc0008', 'Ing. Industrial', 'aa65d3bb923739153ee42351f1f2ede7a184fa35', ''),
(41, 'M.A. Brasilia de los Ãngeles VÃ¡zquez I', 'inddoc0009', 'Ing. Industrial', '49761597640ed59dd93abebd86c5778df49ba016', ''),
(42, 'Ing. Ricardo de la Cruz GarcÃ­a', 'inddoc0010', 'Ing. Industrial', '6d14a762bc18cd85cdd3fdc7bbd77018b0136bef', ''),
(43, 'Ing. Gerardo Ernesto PÃ©rez GÃ³mez', 'inddoc0011', 'Ing. Industrial', '539ec958c542622fd89fe35c247c0cfeb202d9e4', ''),
(44, 'M.A. AarÃ³n EspÃ­nola Latournerie', 'inddir0001', 'Ing. Industrial', '4a49804f182850a61bf1bc3da05ff9865e214df7', ''),
(45, 'M.C. Diana Andrea Brito Picciotto', 'enrdoc0001', 'Ing. EnergÃ­as Renovables', '34ef1a4065d8c63920f41dce131a2ec6a58ed537', ''),
(46, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'enrdoc0002', 'Ing. EnergÃ­as Renovables', '439dc717d3203217c2de29ad309386333eb7d58c', ''),
(47, 'Ing. Marcos Alejandro Nigenda Aguilera', 'enrdoc0003', 'Ing. EnergÃ­as Renovables', '34a378a99b457d72fea4cc143664642898a79a15', ''),
(48, 'Lic. Ãngel Torres Torres', 'enrdoc0004', 'Ing. EnergÃ­as Renovables', '76f05744ca63571eb53414e21b970d60e5183dd6', ''),
(49, 'M.A. Marbella Mendoza SÃ¡nchez', 'enrdoc0005', 'Ing. EnergÃ­as Renovables', '3882657db3213279d1bb9f97b4c2aa840cd3d2d9', ''),
(50, 'M.A. Eduardo de la Fuente NarvÃ¡ez', 'enrdir0001', 'Ing. EnergÃ­as Renovables', '22a360438bc9fa57599821f90fd35c9f75206959', ''),
(51, 'M.C. AdÃ¡n Reyes HernÃ¡ndez', 'eledoc0001', 'Ing. ElectromecÃ¡nica', 'cd237cd62fc0f5d46829fcb10de2ab099eeaf22b', ''),
(53, 'Ing. Juan Manuel Aguilar Bastar', 'eledoc0003', 'Ing. ElectromecÃ¡nica', '90e1ed052f864fab6300c95aff5e66a02466515c', ''),
(54, 'M.I. Gabriel PÃ©rez Brindis', 'eledoc0004', 'Ing. ElectromecÃ¡nica', '31ae2d20c2b3d02b9e2393d4ced1be1031eda462', ''),
(55, 'Ing. Surisadai Castro Guichard', 'eledoc0005', 'Ing. ElectromecÃ¡nica', 'ae343a98a40b1b1fb48edde45e9687b68ed0f253', ''),
(56, 'Ing. Adelita de los Ãngeles Burelo Chan', 'eledoc0006', 'Ing. ElectromecÃ¡nica', '4ef562e27581a18363d56c68cd29317ca6d32c8d', ''),
(57, 'Ing. Eduardo Pozo Montuy', 'eledoc0007', 'Ing. ElectromecÃ¡nica', 'f533b60f98713434844cad37dd4163b0dada5986', ''),
(58, 'Ing. Ricardo NicolÃ¡s RamÃ­rez SÃ¡nchez', 'eledoc0002', 'Ing. ElectromecÃ¡nica', '43206e7a00a03d7219574f7acb61bdf5c6b8abfb', ''),
(59, 'Ing. Mauro Alejandro GonzÃ¡lez Cornelio', 'eledir0001', 'Ing. ElectromecÃ¡nica', '43206e7a00a03d7219574f7acb61bdf5c6b8abfb', ''),
(60, 'Ing. Daniel PÃ©rez Flores', 'eleadm0001', 'Ing. ElectromecÃ¡nica', 'c40b6e66de877d62b2fce86409dc0bc730b343a8', ''),
(61, 'Ing. Diego Armando Galicia LÃ³pez', 'eleadm0002', 'Ing. ElectromecÃ¡nica', '70c47d733b43d38bb7580ec8c3c39ff5dbca6287', ''),
(62, 'M.C. Fanny Adabel GonzÃ¡lez Alejo', 'biodoc0007', 'Ing. BioquÃ­mica', '687039345064ebd274c5a0d0f64cecd7818eefa9', ''),
(63, 'Ing. Isaias Alvarado SÃ¡nchez', 'indadm0001', 'Ing. Industrial', 'bc01810ac8a34e71672c9cba5211c195ecef4f11', ''),
(64, 'Mtro. Miguel Ãngel Contreras Verdugo', 'diradm0001', 'DirecciÃ³n', '89d9e715abf082b907efed114c4a1b8098b55744', ''),
(65, 'Dr. Francisco Hidalgo Notario', 'admdoc0001', 'Ing. AdministraciÃ³n', '85fb79481a1f6eb940a8860017f4ddb2b79aaa1d', ''),
(66, 'Dra. Aracely Celina SÃ¡nchez Albores', 'admdoc0002', 'Ing. AdministraciÃ³n', '6112e7ab0f56f3aa039c5b6b94c6d5bbec03e1f1', ''),
(67, 'Dra. Liliana Guadalupe JÃ¡uregui BeltrÃ¡n', 'admdoc0003', 'Ing. AdministraciÃ³n', '125ceffa98a25f081e957ea285af7e0fe2f58ca1', ''),
(68, 'Dra. Gabriela del Carmen Cornelio Cruz', 'admdoc0004', 'Ing. AdministraciÃ³n', '20e53ded9687b61ecaa1e155bd4843c823315b6f', ''),
(69, 'M.A. Tila MarÃ­a Quero Alvarado', 'admdoc0005', 'Ing. AdministraciÃ³n', 'e7f7687d83060ca053f90ae0c77c75ac10f8b336', ''),
(70, 'M.A. Claudia Gabriela Aguilar OlivÃ©', 'admdoc0006', 'Ing. AdministraciÃ³n', '8a6014237b15a8e27d8ecf7d2e0d6ebcc5a36b46', ''),
(71, 'M.A. VÃ­ctor Ulises HernÃ¡ndez Hidalgo', 'admdoc0007', 'Ing. AdministraciÃ³n', '36c76291dce74bead840cdef6d53c9dc641ff405', ''),
(72, 'M.F. Jorge Velasco Castellanos', 'admdoc0008', 'Ing. AdministraciÃ³n', '4935f0196949fc91dd8f466c1a140f99c7525312', ''),
(73, 'M.I.A. Elsa MarÃ­a Alor VelÃ¡zquez', 'admdoc0009', 'Ing. AdministraciÃ³n', '1348b63db92d947d77e50d6004e6753452e98e86', ''),
(74, 'Lic. Yara Guadalupe del S. Torres RodrÃ­guez', 'admdoc0010', 'Ing. AdministraciÃ³n', 'f6ba55756164c21b0c24283db3161a7334e8a7eb', ''),
(75, 'Lic. Juana Mercedes Mollinedo Casanova', 'admdoc0011', 'Ing. AdministraciÃ³n', '406bb186e4f27c47bf657756d9c7851dd4f75d32', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(10) NOT NULL,
  `carrera` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `carrera`, `nombre`) VALUES
(10, 'Ing. Informática', 'Administración para Informática'),
(11, 'Ing. Informática', 'Fundamentos de Investigación'),
(12, 'Ing. Informática', 'Fundamentos de Programación'),
(13, 'Ing. Informática', 'Taller de Ética'),
(14, 'Ing. Informática', 'Cálculo Diferencial'),
(15, 'Ing. Informática', 'Desarrollo Sustentable'),
(16, 'Ing. Informática', 'Administración de los Recursos y Función Informática'),
(17, 'Ing. Informática', 'Física para Informática'),
(18, 'Ing. Informática', 'Programación Orientada a Objetos'),
(19, 'Ing. Informática', 'Contabilidad Financiera'),
(20, 'Ing. Informática', 'Cálculo Integral'),
(21, 'Ing. Informática', 'Matemáticas Discretas'),
(22, 'Ing. Informática', 'Fundamentos de Sistemas de Información'),
(23, 'Ing. Informática', 'Sistemas Electrónicos para Informática'),
(24, 'Ing. Informática', 'Estructura de Datos'),
(25, 'Ing. Informática', 'Costos Empresariales'),
(26, 'Ing. Informática', 'Algebra Lineal'),
(27, 'Ing. Informática', 'Probabilidad y Estadística'),
(28, 'Ing. Informática', 'Taller de Investigación I'),
(29, 'Ing. Informática', 'Arquitectura de Computadoras'),
(30, 'Ing. Informática', 'Administración y Organización de Datos'),
(31, 'Ing. Informática', 'Fundamentos de Telecomunicaciones'),
(32, 'Ing. Informática', 'Sistemas Operativos I'),
(33, 'Ing. Informática', 'Investigación de Operaciones'),
(34, 'Ing. Informática', 'Análisis y Modelado de Sistemas de Información'),
(35, 'Ing. Informática', 'Tecnologías e Interfaces de Computadoras'),
(36, 'Ing. Informática', 'Fundamentos de Bases de Datos'),
(37, 'Ing. Informática', 'Redes de Computadoras'),
(38, 'Ing. Informática', 'Sistemas Operativos II'),
(39, 'Ing. Informática', 'Taller de Legislación Informática'),
(40, 'Ing. Informática', 'Desarrollo e Implementación de Sistemas de Información'),
(41, 'Ing. Informática', 'Auditoría en Informática'),
(42, 'Ing. Informática', 'Taller de Bases de Datos'),
(43, 'Ing. Informática', 'Interconectividad de Redes'),
(44, 'Ing. Informática', 'Desarrollo de Aplicaciones Web'),
(45, 'Ing. Informática', 'Calidad en los Sistemas de Información'),
(46, 'Ing. Informática', 'Fundamentos de Gestión de Servicios de TI'),
(47, 'Ing. Informática', 'Tópicos de Bases de Datos'),
(48, 'Ing. Informática', 'Administración de Servidores'),
(49, 'Ing. Informática', 'Programación en Ambiente Cliente/Servidor'),
(50, 'Ing. Informática', 'Taller de Investigación II'),
(51, 'Ing. Informática', 'Taller de Emprendedores'),
(52, 'Ing. Informática', 'Estrategias de Gestión de Servicios de TI'),
(53, 'Ing. Informática', 'Inteligencia de Negocios'),
(54, 'Ing. Informática', 'Desarrollo de Aplicaciones para Dispositivos Móviles'),
(55, 'Ing. Informática', 'Seguridad Informática'),
(56, 'Ing. Informática', 'Ingeniería Web'),
(57, 'Ing. Informática', 'Simulación de Sistemas'),
(58, 'Ing. Informática', 'Seminario de TI'),
(59, 'Ing. Informática', 'Diseño y desarrollo de sistemas de Código Abierto'),
(60, 'Ing. Informática', 'Administración y Desarrollo de Software'),
(61, 'Ing. Agronomía', 'Álgebra lineal'),
(62, 'Ing. Agronomía', 'Biología Celular'),
(63, 'Ing. Agronomía', 'Fundamentos de Investigación'),
(64, 'Ing. Agronomía', 'Taller de Ética'),
(65, 'Ing. Agronomía', 'Agroquímica'),
(66, 'Ing. Agronomía', 'Tecnología de la Información y las Comunicaciones'),
(67, 'Ing. Agronomía', 'Cálculo diferencial'),
(68, 'Ing. Agronomía', 'Botánica General'),
(69, 'Ing. Agronomía', 'Física'),
(70, 'Ing. Agronomía', 'Edafología'),
(71, 'Ing. Agronomía', 'Bioquímica'),
(72, 'Ing. Agronomía', 'Zoología'),
(73, 'Ing. Agronomía', 'Cálculo Integral'),
(74, 'Ing. Agronomía', 'Botánica Sistemática'),
(75, 'Ing. Agronomía', 'Mecanización Agropecuaria'),
(76, 'Ing. Agronomía', 'Agroecología'),
(77, 'Ing. Agronomía', 'Microbiología'),
(78, 'Ing. Agronomía', 'Agroclimatología'),
(79, 'Ing. Agronomía', 'Estadística'),
(80, 'Ing. Agronomía', 'Fisiología Vegetal'),
(81, 'Ing. Agronomía', 'Fisiología Animal'),
(82, 'Ing. Agronomía', 'Sistemas de Producción Agricola'),
(83, 'Ing. Agronomía', 'Socioligía Rural'),
(84, 'Ing. Agronomía', 'Topografía'),
(86, 'Ing. Agronomía', 'Diseños Experimentales'),
(87, 'Ing. Agronomía', 'Nutrición Vegetal'),
(88, 'Ing. Agronomía', 'Hidráulica'),
(89, 'Ing. Agronomía', 'Sistemas de Producción Pecuaria'),
(90, 'Ing. Agronomía', 'Gestión Empresarial'),
(91, 'Ing. Agronomía', 'Desarrollo Sustentable'),
(92, 'Ing. Agronomía', 'Genética General'),
(93, 'Ing. Agronomía', 'Nutrición Animal'),
(94, 'Ing. Agronomía', 'Entomología'),
(95, 'Ing. Agronomía', 'Geomática'),
(96, 'Ing. Agronomía', 'Taller de Investigación I'),
(97, 'Ing. Agronomía', 'Figuras Asociativas para la Producción'),
(98, 'Ing. Agronomía', 'Cultivos Energéticos'),
(99, 'Ing. Agronomía', 'Planificación y Dirección de la Empresa '),
(100, 'Ing. Agronomía', 'Modelos Matemáticos Aplicados a la Agricultura'),
(101, 'Ing. Agronomía', 'Manejo Integral de Cuencas Hidrográficas'),
(102, 'Ing. Agronomía', 'Taller de Investigación II'),
(103, 'Ing. Agronomía', 'Fitopatología'),
(104, 'Ing. Agronomía', 'Higiene Pecuaria'),
(105, 'Ing. Agronomía', 'Uso Eficiente del Agua'),
(106, 'Ing. Agronomía', 'Agronegocios'),
(107, 'Ing. Agronomía', 'Especios Agrícolas de Importancia Económica'),
(108, 'Ing. Agronomía', 'Inocuidad Agroalimentaria y Bioseguridad'),
(109, 'Ing. Agronomía', 'Reproducción de Especies Pecuaruas de Importancia Económica'),
(110, 'Ing. Agronomía', 'Zootécnia'),
(111, 'Ing. Bioquímica', 'Fundamentos de Investigación'),
(112, 'Ing. Bioquímica', 'Cálculo Diferencial'),
(113, 'Ing. Bioquímica', 'Química'),
(114, 'Ing. Bioquímica', 'Taller de Ética'),
(115, 'Ing. Bioquímica', 'Comportamiento Organizacional'),
(116, 'Ing. Bioquímica', 'Dibujo Asistido por Computadora'),
(117, 'Ing. Bioquímica', 'Administración y Legislación de Empresas'),
(118, 'Ing. Bioquímica', 'Cálculo Integral'),
(119, 'Ing. Bioquímica', 'Química Orgánica I'),
(120, 'Ing. Bioquímica', 'Biología'),
(121, 'Ing. Bioquímica', 'Química Analítica'),
(122, 'Ing. Bioquímica', 'Álgebra Lineal'),
(123, 'Ing. Bioquímica', 'Cálculo Vectorial'),
(124, 'Ing. Bioquímica', 'Ecuaciones Diferenciales'),
(125, 'Ing. Bioquímica', 'Química Orgánica II'),
(126, 'Ing. Bioquímica', 'Termodinámica'),
(127, 'Ing. Bioquímica', 'Física'),
(128, 'Ing. Bioquímica', 'Estadística'),
(129, 'Ing. Bioquímica', 'Programación y Métodos Numéricos'),
(130, 'Ing. Bioquímica', 'Electromagnetismo'),
(131, 'Ing. Bioquímica', 'Bioquímica'),
(132, 'Ing. Bioquímica', 'Balance de Materia y Energía'),
(133, 'Ing. Bioquímica', 'Análisis Instrumental'),
(134, 'Ing. Bioquímica', 'Aseguramiento de la Calidad'),
(135, 'Ing. Bioquímica', 'Ingeniería Económica'),
(136, 'Ing. Bioquímica', 'Fenómenos de Transporte I'),
(137, 'Ing. Bioquímica', 'Bioquímica del Nitrógeno y Regulación Genética'),
(138, 'Ing. Bioquímica', 'Fisicoquímica'),
(139, 'Ing. Bioquímica', 'Desarrollo Sustentable'),
(140, 'Ing. Bioquímica', 'Instrumentación y Control'),
(141, 'Ing. Bioquímica', 'Operaciones Unitarias I'),
(142, 'Ing. Bioquímica', 'Fenómenos de Transporte II'),
(143, 'Ing. Bioquímica', 'Microbiología'),
(144, 'Ing. Bioquímica', 'Seguridad e Higiene'),
(145, 'Ing. Bioquímica', 'Cinética Química y Biología'),
(146, 'Ing. Bioquímica', 'Taller de Investigación I'),
(147, 'Ing. Bioquímica', 'Taller de Investigación II'),
(148, 'Ing. Bioquímica', 'Operaciones Unitarias II'),
(149, 'Ing. Bioquímica', 'Operaciones Unitarias III'),
(150, 'Ing. Bioquímica', 'Ingeniería de Biorreactores'),
(151, 'Ing. Bioquímica', 'Ingeniería de Proyectos'),
(152, 'Ing. Bioquímica', 'Ingeniería y Gestión Ambiental'),
(153, 'Ing. Bioquímica', 'Ingeniería de Procesos'),
(154, 'Ing. Bioquímica', 'Formulación y Evalúación de Proyectos'),
(155, 'Ing. Bioquímica', 'Ciencia de Alimentos'),
(156, 'Ing. Bioquímica', 'Tecnología de Frutas y Hortalizas'),
(157, 'Ing. Bioquímica', 'Tecnología de Leche y Productos Lácteos'),
(158, 'Ing. Bioquímica', 'Tecnología de Cárnicos'),
(159, 'Ing. Bioquímica', 'Tecnología de Cereales, Leguminosas y Oleaginosas'),
(160, 'Ing. Industrial', 'Fundamentos de Investigación'),
(161, 'Ing. Industrial', 'Taller de Ética'),
(162, 'Ing. Industrial', 'Cálculo Diferencial'),
(163, 'Ing. Industrial', 'Taller de Herramientas Intelectuales'),
(164, 'Ing. Industrial', 'Química'),
(165, 'Ing. Industrial', 'Dibujo Industrial'),
(166, 'Ing. Industrial', 'Electricidad y Electrónica Industrial'),
(167, 'Ing. Industrial', 'Propiedades de los Materiales'),
(168, 'Ing. Industrial', 'Cálculo Integral'),
(169, 'Ing. Industrial', 'Probabilidad y Estadística'),
(170, 'Ing. Industrial', 'Análisis de la Realidad Nacional'),
(171, 'Ing. Industrial', 'Taller de Liderazgo'),
(172, 'Ing. Industrial', 'Metrología y Normalización'),
(173, 'Ing. Industrial', 'Álgebra Lineal'),
(174, 'Ing. Industrial', 'Cálculo Vectorial'),
(175, 'Ing. Industrial', 'Economía'),
(176, 'Ing. Industrial', 'Estadística Inferencial I'),
(177, 'Ing. Industrial', 'Estudio del Trabajo I'),
(178, 'Ing. Industrial', 'Procesos de Fabricación'),
(179, 'Ing. Industrial', 'Física'),
(180, 'Ing. Industrial', 'Algoritmos y Lenguajes de Programación'),
(181, 'Ing. Industrial', 'Investigación de Operaciones I'),
(182, 'Ing. Industrial', 'Estadística Inferencial II'),
(183, 'Ing. Industrial', 'Estudio del Trabajo II'),
(184, 'Ing. Industrial', 'Higiene y Seguridad Industrial'),
(185, 'Ing. Industrial', 'Administración de Proyectos'),
(186, 'Ing. Industrial', 'Gestión de Costos'),
(187, 'Ing. Industrial', 'Administración de las Operaciones I'),
(188, 'Ing. Industrial', 'Investigación de Operaciones II'),
(189, 'Ing. Industrial', 'Control Estadístico de la Calidad'),
(190, 'Ing. Industrial', 'Ergonomía'),
(191, 'Ing. Industrial', 'Desarrollo Sustentable'),
(192, 'Ing. Industrial', 'Taller de Investigación I'),
(193, 'Ing. Industrial', 'Ingeniería Económica'),
(194, 'Ing. Industrial', 'Administración de las Operaciones II'),
(195, 'Ing. Industrial', 'Simulación'),
(196, 'Ing. Industrial', 'Administración del Mantenimiento'),
(197, 'Ing. Industrial', 'Mercadotecnia'),
(198, 'Ing. Industrial', 'Taller de Investigación II'),
(199, 'Ing. Industrial', 'Planeación Financiera'),
(200, 'Ing. Industrial', 'Planeación y Diseño de Instalaciones'),
(201, 'Ing. Industrial', 'Sistemas de Manufactura'),
(202, 'Ing. Industrial', 'Logística y Cadenas de Suministro'),
(203, 'Ing. Industrial', 'Gestión de los Sistemas de Calidad'),
(204, 'Ing. Industrial', 'Ingeniería de Sistemas'),
(205, 'Ing. Industrial', 'Formulación y Evaluación de Proyectos'),
(206, 'Ing. Industrial', 'Relaciones Industriales'),
(207, 'Ing. Industrial', 'Ingeniería de la Calidad'),
(208, 'Ing. Industrial', 'Productividad Humana'),
(209, 'Ing. Industrial', 'Gestión de los Sistemas de Calidad Aplicados'),
(210, 'Ing. Industrial', 'Temas Selectos de Ingeniería Industrial'),
(211, 'Ing. Industrial', 'Medición y Mejoramiento de la Productividad'),
(212, 'Ing. Industrial', 'Productividad Aplicada'),
(213, 'Ing. Energías Renovables', 'Química'),
(214, 'Ing. Energías Renovables', 'Programación'),
(215, 'Ing. Energías Renovables', 'Cálculo Diferencial'),
(216, 'Ing. Energías Renovables', 'Fundamentos de Investigación'),
(217, 'Ing. Energías Renovables', 'Dibujo'),
(218, 'Ing. Energías Renovables', 'Fuentes Renovables de Energía'),
(219, 'Ing. Energías Renovables', 'Bioquímica'),
(220, 'Ing. Energías Renovables', 'Electromagnetismo'),
(221, 'Ing. Energías Renovables', 'Algebra Lineal'),
(222, 'Ing. Energías Renovables', 'Cálculo Integral'),
(223, 'Ing. Energías Renovables', 'Taller de Ética'),
(224, 'Ing. Energías Renovables', 'Estadística y Diseño de Experimentos'),
(225, 'Ing. Energías Renovables', 'Microbiología'),
(226, 'Ing. Energías Renovables', 'Taller de Sistemas de Información Geográfica'),
(227, 'Ing. Energías Renovables', 'Tecnología e Ingeniería de Materiales'),
(228, 'Ing. Energías Renovables', 'Estática y Dinámica'),
(229, 'Ing. Energías Renovables', 'Cálculo Vectorial'),
(230, 'Ing. Energías Renovables', 'Metrología Mecánica y Eléctrica'),
(231, 'Ing. Energías Renovables', 'Resistencia de Materiales'),
(232, 'Ing. Energías Renovables', 'Termodinámica'),
(233, 'Ing. Energías Renovables', 'Comportamiento Humano en las Organizaciones'),
(234, 'Ing. Energías Renovables', 'Óptica y Semiconductores'),
(235, 'Ing. Energías Renovables', 'Ecuaciones Diferenciales'),
(236, 'Ing. Energías Renovables', 'Circuitos Eléctricos I'),
(237, 'Ing. Energías Renovables', 'Biocombustibles'),
(238, 'Ing. Energías Renovables', 'Marco Jurídico en Gestión Energética'),
(239, 'Ing. Energías Renovables', 'Desarrollo Sustentable'),
(240, 'Ing. Energías Renovables', 'Mecánica de Fluidos'),
(241, 'Ing. Energías Renovables', 'Transferencia de Calor'),
(242, 'Ing. Energías Renovables', 'Circuitos Eléctricos II'),
(243, 'Ing. Energías Renovables', 'Taller de Investigación I'),
(244, 'Ing. Energías Renovables', 'Taller de Investigación II'),
(245, 'Ing. Energías Renovables', 'Máquinas Eléctricas'),
(246, 'Ing. Energías Renovables', 'Máquinas Hidráulicas'),
(247, 'Ing. Energías Renovables', 'Refrigeración y Aire Acondicionado'),
(248, 'Ing. Energías Renovables', 'Instalaciones Eléctricas e Iluminación'),
(249, 'Ing. Energías Renovables', 'Sistemas Térmicos'),
(250, 'Ing. Energías Renovables', 'Electroquímica'),
(251, 'Ing. Energías Renovables', 'Sistemas Solares Fotovoltaicos y Térmicos'),
(252, 'Ing. Energías Renovables', 'Simulación de Sistemas de Energías Renovables'),
(253, 'Ing. Energías Renovables', 'Instrumentación'),
(254, 'Ing. Energías Renovables', 'Energía Eólica'),
(255, 'Ing. Energías Renovables', 'Energía del H y celdas combustible'),
(256, 'Ing. Energías Renovables', 'Almacenamiento de Energía'),
(257, 'Ing. Energías Renovables', 'Formulación y Evaluación de Proyectos  de Energías Renovables'),
(258, 'Ing. Energías Renovables', 'Administración y Técnicas de Conservación'),
(259, 'Ing. Energías Renovables', 'Auditoría Energética'),
(260, 'Ing. Energías Renovables', 'Gestión de Empresas de Energías Renovables'),
(261, 'Ing. Energías Renovables', 'Sistemas Híbridos de Energía'),
(262, 'Ing. Energías Renovables', 'Integración de Sistemas Energéticos'),
(263, 'Ing. Electromecánica', 'Química'),
(264, 'Ing. Electromecánica', 'Cálculo Diferencial'),
(265, 'Ing. Electromecánica', 'Taller de Ética'),
(266, 'Ing. Electromecánica', 'Álgebra Lineal'),
(267, 'Ing. Electromecánica', 'Introducción a la Programación'),
(268, 'Ing. Electromecánica', 'Fundamentos de Investigación'),
(269, 'Ing. Electromecánica', 'Estática'),
(270, 'Ing. Electromecánica', 'Cálculo Integral'),
(271, 'Ing. Electromecánica', 'Desarrollo Sustentable'),
(272, 'Ing. Electromecánica', 'Metrología y Normalización'),
(273, 'Ing. Electromecánica', 'Tecnología de los Materiales'),
(274, 'Ing. Electromecánica', 'Probabilidad y Estadística'),
(275, 'Ing. Electromecánica', 'Dinámica'),
(276, 'Ing. Electromecánica', 'Cálculo Vectorial'),
(277, 'Ing. Electromecánica', 'Electricidad y Magnetísmo'),
(278, 'Ing. Electromecánica', 'Dibujo Electromecánico'),
(279, 'Ing. Electromecánica', 'Procesos de Manufactura'),
(280, 'Ing. Electromecánica', 'Análisis y Síntesis de Mecanísmos'),
(281, 'Ing. Electromecánica', 'Ecuaciones Diferenciales'),
(282, 'Ing. Electromecánica', 'Análisis de Circuitos Eléctricos de CD'),
(283, 'Ing. Electromecánica', 'Termodinámica'),
(284, 'Ing. Electromecánica', 'Mecánica de Materiales'),
(285, 'Ing. Electromecánica', 'Electrónica Analógica'),
(286, 'Ing. Electromecánica', 'Diseño de Elementos de Máquina'),
(287, 'Ing. Electromecánica', 'Mecánica de Fluidos'),
(288, 'Ing. Electromecánica', 'Análisis de Circuitos Eléctricos de CA'),
(289, 'Ing. Electromecánica', 'Transferencia de Calor'),
(290, 'Ing. Electromecánica', 'Electrónica Digital'),
(291, 'Ing. Electromecánica', 'Máquinas y Equipos Térmicos I'),
(292, 'Ing. Electromecánica', 'Sistemas y Máquinas de Fluidos'),
(293, 'Ing. Electromecánica', 'Máquinas Eléctricas'),
(294, 'Ing. Electromecánica', 'Instalaciones Eléctricas'),
(295, 'Ing. Electromecánica', 'Taller de Investigación I'),
(296, 'Ing. Electromecánica', 'Diseño e Ingeniería Asistidos por Computadora'),
(297, 'Ing. Electromecánica', 'Máquinas y Equipos Térmicos II'),
(298, 'Ing. Electromecánica', 'Sistemas Eléctricos de Potencia'),
(299, 'Ing. Electromecánica', 'Controles Eléctricos'),
(300, 'Ing. Electromecánica', 'Taller de Investigación II'),
(301, 'Ing. Electromecánica', 'Administración y Técnicas de Mantenimiento'),
(302, 'Ing. Electromecánica', 'Refrigeración y Aire Acondicionado'),
(303, 'Ing. Electromecánica', 'Sistemas Hidráulicos y Neumáticos de Potencia'),
(304, 'Ing. Electromecánica', 'Ahorro de Energía'),
(305, 'Ing. Electromecánica', 'Ingeniería de Control Clásico'),
(306, 'Ing. Electromecánica', 'Subestaciones Eléctricas'),
(307, 'Ing. Electromecánica', 'Formulación y Evaluación de Proyectos'),
(308, 'Ing. Electromecánica', 'Microcontroladores'),
(309, 'Ing. Electromecánica', 'Autómatas Programables'),
(310, 'Ing. Electromecánica', 'Medición e Instrumentación Virtual'),
(311, 'Ing. Electromecánica', 'Redes de Comunicación Industrial'),
(312, 'Ing. Electromecánica', 'Calidad en los Sistemas de Producción'),
(313, 'Ing. Informática', 'Diseño de Arquitectura de Soluciones y Administración de Proyectos'),
(314, 'Ing. Administración', 'Taller de Administración I'),
(315, 'Ing. Administración', 'Tecnologías de la Información'),
(316, 'Ing. Administración', 'Contabilidad Aplicada a la Ingeniería'),
(317, 'Ing. Administración', 'Dinámica Social'),
(318, 'Ing. Administración', 'Fundamentos de Investigación'),
(319, 'Ing. Administración', 'Cálculo Diferencial'),
(320, 'Ing. Administración', 'Taller de Administración II'),
(321, 'Ing. Administración', 'TIC´s Aplicadas a la Administración'),
(322, 'Ing. Administración', 'Contabilidad Administrativa'),
(323, 'Ing. Administración', 'Comportamiento Organizacional'),
(324, 'Ing. Administración', 'Taller de Ética'),
(325, 'Ing. Administración', 'Cálculo Integral'),
(326, 'Ing. Administración', 'Innovación Tecnológica I'),
(327, 'Ing. Administración', 'Derecho Laboral'),
(328, 'Ing. Administración', 'Matemática Financieras'),
(329, 'Ing. Administración', 'Comunicación Organizacional'),
(330, 'Ing. Administración', 'Estadística I'),
(331, 'Ing. Administración', 'Algebra Lineal'),
(332, 'Ing. Administración', 'Capital Humano I'),
(333, 'Ing. Administración', 'Economía'),
(334, 'Ing. Administración', 'Derecho Mercantil'),
(335, 'Ing. Administración', 'Mercadotécnia'),
(336, 'Ing. Administración', 'Estadística II'),
(337, 'Ing. Administración', 'Innovación Tecnológica II'),
(338, 'Ing. Administración', 'Capital Humano II'),
(339, 'Ing. Administración', 'Macroeconomía'),
(340, 'Ing. Administración', 'Administración Financiera I'),
(341, 'Ing. Administración', 'Mezcla de Mercadotécnia'),
(342, 'Ing. Administración', 'Investigación de Operaciones'),
(343, 'Ing. Administración', 'Derecho Fiscal'),
(344, 'Ing. Administración', 'Taller de Investigación I'),
(345, 'Ing. Administración', 'Administración de la Producción'),
(346, 'Ing. Administración', 'Análisis de la Problemática Nacional'),
(347, 'Ing. Administración', 'Administración Financiera II'),
(348, 'Ing. Administración', 'Investigación de Mercado'),
(349, 'Ing. Administración', 'Desarrollo Sustentable'),
(350, 'Ing. Administración', 'Taller de Investigación II'),
(351, 'Ing. Administración', 'Gestión de la Calidad en Capital Humano'),
(352, 'Ing. Administración', 'Administración de la Calidad'),
(353, 'Ing. Administración', 'Economía Internacional'),
(354, 'Ing. Administración', 'Diseño Organizacional'),
(355, 'Ing. Administración', 'Mercadotécnia Electrónica'),
(356, 'Ing. Administración', 'Planeación y Control Financiero'),
(357, 'Ing. Administración', 'Administración de Riesgos Laborales'),
(358, 'Ing. Administración', 'Modelos de Simulación'),
(359, 'Ing. Administración', 'Gestión Estratégica'),
(360, 'Ing. Administración', 'Auditoría Administrativa'),
(361, 'Ing. Administración', 'Consultoría'),
(362, 'Ing. Administración', 'Plan de Negocios'),
(363, 'Ing. Administración', 'Habilidades Directivas'),
(364, 'Ing. Administración', 'Ingeniería de Calidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id_periodo` int(5) NOT NULL,
  `periodo` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`id_periodo`, `periodo`) VALUES
(2, 'Agosto 2018 - Enero 2019'),
(3, 'Febrero 2019 - Julio 2019');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practicas`
--

CREATE TABLE `practicas` (
  `id_practica` int(10) NOT NULL,
  `maestro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `materia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `semestre` int(1) NOT NULL,
  `grupo` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `turno` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `laboratorio` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `numero` int(3) NOT NULL,
  `descripcion` varchar(345) COLLATE utf8_spanish_ci NOT NULL,
  `materiales` varchar(600) COLLATE utf8_spanish_ci NOT NULL,
  `equipo` varchar(600) COLLATE utf8_spanish_ci NOT NULL,
  `reprogramaciones` int(2) NOT NULL DEFAULT '0',
  `justificacion` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `especificacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_termino` date NOT NULL,
  `realizada` tinyint(1) NOT NULL DEFAULT '0',
  `eficiencia` int(3) NOT NULL,
  `confirma` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fallas` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `observacion_prof` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `seguimiento` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `practicas`
--

INSERT INTO `practicas` (`id_practica`, `maestro`, `materia`, `carrera`, `semestre`, `grupo`, `turno`, `laboratorio`, `nombre`, `numero`, `descripcion`, `materiales`, `equipo`, `reprogramaciones`, `justificacion`, `especificacion`, `fecha_termino`, `realizada`, `eficiencia`, `confirma`, `observaciones`, `fallas`, `observacion_prof`, `seguimiento`) VALUES
(2, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'Almacenamiento de EnergÃ­a', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Laboratorio de QuÃ­mica General', 'ElaboraciÃ³n de baterÃ­as Al-aire ', 1, 'La prÃ¡ctica reforzarÃ¡ el concepto de baterÃ­as primarÃ­as para la conversiÃ³n de energÃ­a a travÃ©s de la oxidaciÃ³n de metales. Adicionalmente, se realizarÃ¡n conexiones elÃ©ctricas serie-paralelo para elaborar un stack o apilamiento de celdas que alcance voltajes ultiles para aplicaciones de bajo voltaje (de 1.5 V a 3 V).', '4 Pipeta pasteur\r\n4 Matraces aforados de 50 mL \r\nreactivo NaOH en escamas o granos para elaborar 50 mL de soluciÃ³n sobresaturada\r\nAgua destilada\r\n4 Morteros de cerÃ¡mica \r\n4 Mascarillas de gases y polvos\r\n4 EspÃ¡tulas\r\n200 g de carbÃ³n acivado, granulado de pirolisis de coco por equipo\r\nAluminio convencional encontrado en una lata y papel alumnio\r\ncaimanes \r\nLED multi-color\r\njuego de resistencias de diferentes valores\r\n', 'multÃ­metro digital\r\nbalanza granataria\r\n', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(3, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 1: CreaciÃ³n y Manejo de algoritmos 1', 1, 'El estudiante crearÃ¡ y manipularÃ¡ algoritmos en forma de diagrama de flujo y pseudocÃ³digo.', '13 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '2018-09-05', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'Ninguna', ''),
(4, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 2: CreaciÃ³n y Manejo de algoritmos 2', 2, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '13 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '2018-09-05', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'Ninguna', ''),
(5, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 3: CreaciÃ³n y Manejo de algoritmos 3', 3, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(6, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 4: CreaciÃ³n y Manejo de algoritmos 4', 4, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(7, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 5: CreaciÃ³n y Manejo de algoritmos condicionales 1', 5, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(8, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 6: CreaciÃ³n y Manejo de algoritmos condicionales 2', 6, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(9, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 7: CreaciÃ³n y Manejo de algoritmos condicionales 3', 7, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(10, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 8: CreaciÃ³n y Manejo de algoritmos condicionales 4', 8, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(11, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 9: CreaciÃ³n y Manejo de algoritmos iterativos 1', 9, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(12, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 10: CreaciÃ³n y Manejo de algoritmos iterativos 2', 10, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(13, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 11: CreaciÃ³n y Manejo de algoritmos iterativos 3', 11, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos en forma de Diagrama de Flujo o PseudocÃ³digo.', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(14, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 12: ManipulaciÃ³n de GUIs con Visual C# 1	Computadora, proyector multimedia, pantalla, Pin', 12, 'El estudiante desarrollarÃ¡ programas bÃ¡sicos por medio del programa Visual C#, de Microsoft Visual Studio .Net', '12 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(15, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 13: ManipulaciÃ³n de GUIs con Visual C# 2', 13, 'El estudiante desarrollarÃ¡ programas bÃ¡sicos por medio del programa Visual C#, de Microsoft Visual Studio .Net', '12 equipos del laboratorio funcionando correctamente', 'Programa Visual C# de la suite MS Visual Studio .Net 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(16, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 14: ManipulaciÃ³n de GUIs con Visual C# 3', 14, 'El estudiante desarrollarÃ¡ programas bÃ¡sicos por medio del programa Visual C#, de Microsoft Visual Studio .Net', '12 equipos del laboratorio funcionando correctamente', 'Programa Visual C# de la suite MS Visual Studio .Net 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(17, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'ProgramaciÃ³n', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 15: ManipulaciÃ³n de GUIs con Visual C# 4', 15, 'El estudiante desarrollarÃ¡ programas bÃ¡sicos por medio del programa Visual C#, de Microsoft Visual Studio .Net', '12 equipos del laboratorio funcionando correctamente', 'Programa Visual C# de la suite MS Visual Studio .Net 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(19, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', '1.- Plataformas y funcionamiento del kernel', 1, 'conoce y describe elementos de los SO para su implementaciÃ³n', 'MÃ¡quinas Virtuales, Imagen de SO ', 'Virtual Box, Ubuntu 12.05 lts', 0, '', '', '2018-09-03', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'Se realizÃ³ con lo estipulado cumpliendo el objetivo.', ''),
(20, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'TÃ³picos de Bases de Datos', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', '1.- Modelado de una BD', 1, 'Identifica los elementos del diseÃ±o de una base de datos, a partir de un caso de estudio', 'Caso prÃ¡ctico', 'SGBD MariaDB y editor de texto', 0, '', '', '2018-09-03', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'Se desarrollo cumpliendo el objetivo.', ''),
(21, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'PrÃ¡ctica 1: CreaciÃ³n y Manejo de procesador de texto 1', 1, 'El estudiante realizarÃ¡ prÃ¡cticas en un procesador de textos', '21 equipos del laboratorio funcionando correctamente', 'Microsoft Word 2013 o posterior', 0, '', '', '2018-09-05', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(22, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 2: CreaciÃ³n y Manejo de procesador de texto 2', 2, 'El estudiante realizarÃ¡ prÃ¡cticas en un procesador de textos', '21 equipos del laboratorio funcionando correctamente', 'Microsoft Word 2013 o posterior', 0, '', '', '2018-09-05', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'Ninguna', ''),
(23, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 3: CreaciÃ³n y Manejo de procesador de texto 3', 3, 'El estudiante practicarÃ¡ con un procesador de textos', '21 equipos del laboratorio funcionando correctamente', 'Microsoft Word 2013 o posterior', 0, '', '', '2018-09-05', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Sin observaciones', '', 'Ninguna', ''),
(24, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 4: CreaciÃ³n y Manejo de procesador de texto 4', 4, 'El estudiante practicarÃ¡ con un procesador de textos', '21 equipos del laboratorio funcionando correctamente', 'Microsoft Word 2013 o posterior', 0, '', '', '2018-09-05', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Sin observaciones', '', 'Ninguna', ''),
(26, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'IdentificaciÃ³n de los elementos que componen un equipo de cÃ³mputo', 1, 'El alumno identificarÃ¡ los componentes de un equipo de cÃ³mputo (Hw, Externos e Internos).\nCPU,Pantalla,Teclado, Mouse, USB, Impresora.\nEncendido, Apagado adecuado de un equipo.\nUso adecuado de un Laboratorio de CÃ³mputo.', 'Proyector.', 'Equipo de CÃ³mputo. \nWindows.', 0, '', '', '2018-09-03', 1, 95, 'Lic. Ponciano GarcÃ­a', 'La practica se realizo de manera ordenada.', 'No hubo', 'Se realizÃ³ correctamente', ''),
(27, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'SimulaciÃ³n de Sistemas de EnergÃ­as Renovables', 'Ing. EnergÃ­as Renovables', 7, 'A', 'Matutino', 'Programoteca', 'SimulaciÃ³n de esfuerzos mecÃ¡nicos en SolidWorks', 1, 'SimulaciÃ³n de esfuerzos puntuales en materiales mediante la herramienta de simulaciÃ³n de esfuerzos mecÃ¡nicos de SolidWorks ', '6 computadoras', 'SolidWorks', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(28, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'SimulaciÃ³n de Sistemas de EnergÃ­as Renovables', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Programoteca', 'SimulaciÃ³n de esfuerzos mecÃ¡nicos en SolidWorks', 1, 'SimulaciÃ³n de esfuerzos puntuales en materiales mediante la herramienta de simulaciÃ³n de esfuerzos mecÃ¡nicos de SolidWorks', '6 computadoras', 'SolidWorks', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(29, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'SimulaciÃ³n de Sistemas de EnergÃ­as Renovables', 'Ing. EnergÃ­as Renovables', 1, 'A', 'Matutino', 'Programoteca', 'SimulaciÃ³n de transferencia de calor por mecanismos de conducciÃ³n y convecciÃ³n en SolidWorks', 2, 'SimulaciÃ³n de transferencia de calor por conducciÃ³n en geometrÃ­as planas utilizando la herramienta de estudio tÃ©rmico de SolidWorks', '6 computadoras', 'SolidWorks', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(30, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'SimulaciÃ³n de Sistemas de EnergÃ­as Renovables', 'Ing. EnergÃ­as Renovables', 7, 'A', 'Matutino', 'Programoteca', 'SimulaciÃ³n de transferencia de calor por mecanismos de conducciÃ³n y convecciÃ³n en SolidWorks', 2, 'SimulaciÃ³n de transferencia de calor por conducciÃ³n en geometrÃ­as planas utilizando la herramienta de estudio tÃ©rmico de SolidWorks', '6 computadoras', 'SolidWorks', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(37, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 5: CreaciÃ³n y Manejo de Formulas EstadÃ­sticas con Excel 1', 5, 'El estudiante aprenderÃ¡ a manejar un programa de hoja de cÃ¡lculo', '22 equipos del laboratorio funcionando correctamente', 'Microsoft Excel 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(38, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 6: CreaciÃ³n y Manejo de Formulas EstadÃ­sticas con Excel 2', 6, 'El estudiante manejarÃ¡ un programa de hoja de cÃ¡lculo', '22 equipos del laboratorio funcionando correctamente', 'Microsoft Excel 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(40, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 7: CreaciÃ³n y Manejo de Formulas EstadÃ­sticas con Excel 3', 7, 'El estudiante manejarÃ¡ un programa de hoja de cÃ¡lculo', '22 equipos del laboratorio funcionando correctamente', 'Microsoft Excel 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(41, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Multimedia', 'Practica 8: CreaciÃ³n y Manejo de Formulas EstadÃ­sticas con Excel 4', 8, 'El estudiante manejarÃ¡ un programa de hoja de cÃ¡lculo', '22 equipos del laboratorio funcionando correctamente', 'Microsoft Excel 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(42, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 9: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 1', 9, 'El estudiante comprederÃ¡ y manejarÃ¡ un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(43, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 10: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 2', 10, 'El estudiante comprenderÃ¡ y manejarÃ¡ el uso de un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(44, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 11: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 3', 11, 'El estudiante manejarÃ¡ un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(45, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 12: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 4', 1, 'El estudiante manejarÃ¡ un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(46, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 13: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 5', 2, 'El estudiante manejarÃ¡ un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(47, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 14: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 6', 3, 'El estudiante manejarÃ¡ un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(48, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 15: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 7', 4, 'El estudiante manejarÃ¡ un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(49, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'TecnologÃ­as de la InformaciÃ³n', 'Ing. AdministraciÃ³n', 1, 'B', 'Vespertino', 'Base de datos', 'Practica 16: CreaciÃ³n y Manejo de GrÃ¡ficas organizacionales con PowerPoint 8', 5, 'El estudiante manejarÃ¡ un programa de presentaciones efectivas', '22 equipos del laboratorio funcionando correctamente', 'Microsoft PowerPoint 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(52, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'IdentificaciÃ³n del SW', 2, 'El alumno identificarÃ¡ :\nCreaciÃ³n de carpetas, digitalizaciÃ³n de documentos, almacenamiento de archivos, respaldo de archivos en USB, Formatear una memoria USB, Identificar diferentes formatos de imÃ¡gen, Identificar extensiones de los diferentes tipos de archivos, Identificar las propiedades de los equipos, tales como Procesador, meoria, t', 'Proyector', 'Windows', 2, '7', 'Autorizan de parte de su carrera que el grupo no asista ya que tienen que ir a campo', '2018-09-26', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'Sin observaciones', ''),
(55, 'M.C. Diana Andrea Brito Picciotto', 'EnergÃ­a del H y celdas combustible', 'Ing. EnergÃ­as Renovables', 7, 'A', 'Matutino', 'AnÃ¡lisis de Suelos - A', 'ElectrÃ³lisis del agua', 1, 'Objetivo de la prÃ¡ctica: permitir que los alumnos describan, a travÃ©s de la experimentaciÃ³n, cÃ³mo se separa la molÃ©cula del agua (electrÃ³lisis).\nTambiÃ©n podrÃ¡n identificar algunas de las propiedades fÃ­sicas del hidrÃ³geno como combustible.', 'Agua destilada\nVaso de precipitado de 100 mL\nVaso de precipitado de 600 mL\nEmbudo de cristal\n100 mL de Sulfato de Sodio', 'CronÃ³metro y Origin Pro (graficador)', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(56, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'TÃ³picos de Bases de Datos', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Base de datos', '2.- ContinuaciÃ³n modelado de base de datos.', 1, 'Desarrollo del diseÃ±o de una base de datos usando herramientas para su modelado y diagramas.', 'Computadoras y red local', 'XAMPP', 0, '', '', '2018-09-03', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'Se obtuvo diseÃ±o de BD propuesta por equipos de los alumnos.', ''),
(57, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'TÃ³picos de Bases de Datos', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Base de datos', '2.- Modelado de BD distribuida.', 2, 'Formular un caso donde se implemente un diseÃ±o de DDÂ´s.', 'Computadoras y red.', 'SGBD, editor de texto y programa servidor.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(58, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'TÃ³picos de Bases de Datos', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multimedia', '2 ContinuaciÃ³n de modelado de BD distribuida.', 3, 'Implementa modelado de BDÂ´S en SGBD.', 'computadoras y red', 'XAMPP', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(62, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'ElaboraciÃ³n de documentos en word', 3, 'Abrir word\ncopiar un texto, darle formato bÃ¡sico\n    Tipo de letra \n    TamaÃ±o de letra\n     Interlineado\n     Justificado\n     Negrita\n     Margen\n     Las actividades se realizan por equipos', 'Proyector', 'Windows, word', 0, '', '', '2018-10-17', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'Realizada correctamente', ''),
(63, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'Conociendo Excel', 4, 'El alumno abrirÃ¡ excel, con la finalidad de elaborar una tabla, aplicarle formato, realizar las operaciones bÃ¡sicas, ordenar y filtrar, asÃ­ como darle formato de pÃ¡gina.\nLa prÃ¡ctica se realizarÃ¡ por equipos', 'PintarrÃ³n', 'Office', 0, '', '', '2018-10-17', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'sin observaciones', ''),
(64, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'Conociendo power point', 5, 'El alumno abrirÃ¡ PP, insertarÃ¡ informaciÃ³n, aplicarÃ¡ formato, insertarÃ¡ imÃ¡gen.\nLa prÃ¡ctica se realizarÃ¡ en equipos ', 'Proyector', 'Office', 0, '', '', '2018-10-17', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'sin observaciones', ''),
(65, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 1. CreaciÃ³n de una clase con Tipos de datos abstractos.', 1, 'Los estudiantes elaboran un programa en C# en donde identifiquen, declaren y utiicen variables, objetos y clases con tipos de datos abstractos.', 'PC/Laptop, Videoproyector, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '2018-09-07', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Se realizo de manera correcta.', '', 'La prÃ¡ctica se llevÃ³ a cabo en tiempo y forma sin contratiempo alguno.', ''),
(66, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 2. AdministraciÃ³n de memoria estÃ¡tica', 2, 'Hacer un programa en c# en donde los alumnos declaren estructuras de datos para manejo de memoria estÃ¡tica', 'PC/Laptop, videoproyector, Cable de video.', 'Visual studio 2013 o superior.', 1, '7', 'suspensiÃ³n de labores.', '2018-09-19', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Ninguna', '', 'La prÃ¡ctica se realizÃ³ correctamente. ', ''),
(67, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 3. Clase que incluya mÃ©todos donde se aplique la recursividad C#', 3, 'Hacer un programa en C# que incluya una clase con un mÃ©todo recursivo para calcular el factorial de un nÃºmero.', 'PC/Laptop, videoproyecto, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '2018-09-28', 1, 50, '', '', '', 'La prÃ¡ctica se llevÃ³ a cabo en tiempo y forma', ''),
(68, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 4.  Realizar un programa mediante el uso de arreglos.', 4, 'Hacer un programa en C# que contenga clases con mÃ©todos para el uso de arreglos.', 'PC/Laptop, videoproyecto, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '2018-10-19', 1, 50, '', '', '', '', ''),
(69, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 5. Realizar un programa en donde se incluya una clase para el uso de listas', 5, 'Realizar un programa en C# que permita el uso de listas, mediante programaciÃ³n orientada a objetos.', 'PC/Laptop, videoproyecto, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '2018-10-19', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', '', ''),
(70, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 6. Realizar un programa en donde se incluya una clase para el uso de pilas', 6, 'Hacer un programa en c# programando clases en donde se elaboren mÃ©todos para la manipulaciÃ³n de pilas. ', 'PC/Laptop, videoproyecto, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '2018-10-19', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', '', ''),
(71, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 7. Realizar un programa en donde se incluya una clase para el uso de Colas.', 7, 'Hacer un programa en c# en donde se elabore una clase con mÃ©todos para la manipulaciÃ³n de las operaciones con colas.', 'PC/Laptop, videoproyecto, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(72, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 8. Realizar un programa que utilice mÃ©todos de ordenamiento', 8, 'Hacer un programa en C# que contenga una clase con los diferentes mÃ©todos de ordenamiento.', 'PC/Laptop, videoproyecto, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(73, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'Estructura de Datos', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 9.  Realizar un programa que utilice bÃºsqueda binaria.', 9, 'Realizar un programa en c# que incluya estructuras de datos de lista y se utilice una clase con mÃ©todo de ordenamiento y bÃºsqueda binaria.', 'PC/Laptop, videoproyecto, cable de video.', 'Visual studio 2013 o superior.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(74, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 1. InstalaciÃ³n y configuraciÃ³n de servidor Apache', 1, 'ConfiguraciÃ³n del software de servidor para escuchar peticiones de los clientes, administrar bases de datos y devolver servicios.', 'PC/Laptop, Videoproyector, cable de video.', 'Servidor Apache/XAMPP/WAMP', 0, '', '', '2018-09-06', 1, 100, 'Lic. Ponciano GarcÃ­a', 'La practica se realizo sin inconveniente.', '', 'Se instalÃ³ y configurÃ³ el servidor apache y el puerto correspondiente para el servicio http y ssl.', ''),
(75, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 2. Desarrollo del lado del servidor con PHP', 2, 'Programa en PHP para devolver servicios a websites dinÃ¡micos', 'PC/Laptop, Videoproyector, Cable de video.', 'XAMPP/WAMPP\nEditor de cÃ³digo Sublime text/ Notepad++/Brackets\n', 0, '', '', '2018-09-21', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'La prÃ¡ctica se llevÃ³ a cabo en tiempo y forma de acuerdo a lo estipulado. ', ''),
(76, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 3. Desarrollo de una aplicaciÃ³n web con php y conexiÃ³n a base de datos con mysql', 3, 'Desarrollar un formulario web con conexiÃ³n a base de datos.', 'PC/Laptop, Videoproyector, Cable de video.', 'XAMPP/WAMPP\nEditor de cÃ³digo Sublime text/ Notepad++/Brackets\n', 0, '', '', '2018-09-28', 1, 50, '', '', '', 'La prÃ¡ctica se llevÃ³ a cabo en tiempo y forma', ''),
(77, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 4. InstalaciÃ³n y configuraciÃ³n de servidor IIS (Internet Information Services)', 4, 'InstalaciÃ³n del servidor Internet Information Sevices en windows.', 'PC/Laptop, Videoproyector, cable de video.', 'Windows 10 pro/7 pro/8pro/', 1, '7', 'Comisionado al ITVH por software de cÃ©dula profesional electrÃ³nica', '2018-10-19', 1, 50, '', '', '', '', ''),
(78, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 5. Desarrollo del lado del servidor con ASP.NET', 5, 'Desarrollo de una aplicaciÃ³n web con ASP .NET y C#', 'PC/Laptop, Videoproyector, Cable de video.', 'IIS,Visual Studio 2013 o superior, Sql Server 2008', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(79, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 6. Desarrollo de una aplicaciÃ³n web con conexiÃ³n a base de datos en ASP.Net', 6, 'Desarrollo de una aplicaciÃ³n web con formulario web con conectividad con base de datos sql server', 'PC/Laptop, videoproyector, cable de video.', 'IIS,Visual Studio 2013 o superior, Sql Server 2008', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(80, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 7 InstalaciÃ³n y configuraciÃ³n de servidor apache tomcat', 7, 'InstalaciÃ³n y configuraciÃ³n del servidor apache tomcat.', 'PC/Laptop, videoproyector, cable VGA', 'Apach tomcat, JVM (Java Virtual Machine)', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(81, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Multiplataforma', 'PrÃ¡ctica 8 CreaciÃ³n de un sitio web utilizando web services (servicios web)', 8, 'CreaciÃ³n y uso de web services en aplicaciones web.', 'PC/Laptop, videoproyector, Cable VGA', 'IIS, Visual Studio 2010, Sql server 2008.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(82, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', 'PrÃ¡ctica 1. InstalaciÃ³n y configuraciÃ³n de servidor Apache', 1, 'InstalaciÃ³n y configuraciÃ³n del software de servidor para escuchar peticiones de los clientes y devolver servicios.', 'PC/Laptop, videoproyector, Cable de video', 'Servidor Apache/XAMPP/WAMP', 0, '', '', '2018-09-07', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Se realizo de manera correcta.', '', 'Se llevÃ³ a cabo la instalaciÃ³n y configuraciÃ³n del servidor apache y la administraciÃ³n de los servicios en windows.', ''),
(83, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', 'PrÃ¡ctica 2. Desarrollo del lado del servidor con PHP', 2, 'Desarrollo de una aplicaciÃ³n web en PHP', 'PC/Laptop, Videoproyector, Cable VGA', 'XAMPP/WAMPP\nEditor de cÃ³digo Sublime text/ Notepad++/Brackets\n', 0, '', '', '2018-09-28', 1, 50, '', '', '', '', ''),
(84, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', 'PrÃ¡ctica 3. Desarrollo de una aplicaciÃ³n web con php y conexiÃ³n a base de datos con mysql', 3, 'Desarrollo de un formulario web con conexiÃ³n a base de datos.', 'PC/Laptop Videoproyector, Cable de video', 'XAMPP/WAMPP\nEditor de cÃ³digo Sublime text/ Notepad++/Brackets\n', 0, '', '', '2018-10-02', 1, 50, '', '', '', 'Se cumplieron los objetivos de la prÃ¡ctica.', ''),
(85, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', 'PrÃ¡ctica 4. InstalaciÃ³n y configuraciÃ³n de servidor IIS (Internet Information Services)', 4, 'ConfiguraciÃ³n de servicios de servidor en sistema operativo Windows', 'PC/Laptop, Videoproyector, Cable VGA', 'Windows 10 pro/7 pro/8pro/', 1, '1', '', '2018-10-19', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', '', ''),
(87, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', 'PrÃ¡ctica 6. Desarrollo de una aplicaciÃ³n web con conexiÃ³n a base de datos en ASP.Net', 6, 'Desarrollo de un formulario web con asp .net y C# con conectividad a base de datos de Sql Server', 'Pc/Laptop, videoproyector, Cable VGA', 'IIS,Visual Studio 2013 o superior, Sql Server 2008', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(88, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', 'PrÃ¡ctica 7 InstalaciÃ³n y configuraciÃ³n de servidor apache tomcat', 7, 'InstalaciÃ³n y configuraciÃ³n de los servicios de servidor mediante el software de apache tomcat', 'PC/Laptop, videoproyector, cable de video.', 'Apache tomcat, JVM (Java Virtual Machine)', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(89, 'M.I. JosÃ© de Jesus Lenin Valencia Cruz', 'ProgramaciÃ³n en Ambiente Cliente/Servidor', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Multiplataforma', 'PrÃ¡ctica 8 CreaciÃ³n de un sitio web utilizando web services (servicios web)', 8, 'CreaciÃ³n de una aplicaciÃ³n web con el uso de web services.', 'PC/Laptop, videoproyector, Cable VGA.', 'IIS, Visual Studio 2010, Sql server 2008.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(90, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'TecnologÃ­a e IngenierÃ­a de Materiales', 'Ing. EnergÃ­as Renovables', 3, 'A', 'Matutino', 'Laboratorio de QuÃ­mica General', 'Crecimiento de cristales de sulfato cÃºprico', 1, 'PrÃ¡ctica de crecimiento de cristales de CuSO4 y observaciÃ³n de la estructura mediante el microscopio Ã³ptico.', '4 EspÃ¡tulas\n\n4 Vidrios de reloj\n\n4 Cajas Petri \n10 g de CuSO4 X 5H2O (sulfato cÃºprico pentahidratado)\n\n\n', 'microscopio Ã³ptico', 0, '', '', '2018-09-04', 1, 50, '', '', '', 'La prÃ¡ctica se realiza en 2 sesiones, una de crecimiento de cristales y otra de observaciÃ³n en el microscopio Ã³ptico.', ''),
(91, 'Ing. Daniel Alejandro Moreno JimÃ©nez', 'TecnologÃ­a e IngenierÃ­a de Materiales', 'Ing. EnergÃ­as Renovables', 3, 'A', 'Matutino', 'Laboratorio de QuÃ­mica General', 'Crecimiento de cristales de sulfato cÃºprico', 2, 'PrÃ¡ctica de crecimiento de cristales de CuSO4 y observaciÃ³n de la estructura mediante el microscopio Ã³ptico.', '4 EspÃ¡tulas\n4 Vidrios de reloj\n4 Cajas Petri \n10 g de CuSO4 X 5H2O (sulfato cÃºprico pentahidratado)', 'microscopio Ã³ptico', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(92, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 1: CreaciÃ³n y Manejo de algoritmos 1', 1, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos con un programa simulador de algoritmos', '26 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(93, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 2: CreaciÃ³n y Manejo de algoritmos 2', 2, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos con un programa simulador de algoritmos', '26 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(94, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 3: CreaciÃ³n y Manejo de algoritmos 3', 3, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos con un programa simulador de algoritmos', '26 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(95, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 4: CreaciÃ³n y Manejo de algoritmos 4', 4, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos con un programa simulador de algoritmos', '26 equipos del laboratorio funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(96, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'AnÃ¡lisis y Modelado de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Multimedia', 'PrÃ¡ctica 1: CreaciÃ³n de un diagrama de casos de uso 1.', 1, 'El estudiante crearÃ¡ y manejarÃ¡ un diagrama de casos de uno nivel modelado del negocio', 'Se requiere que el software este instalado en los equipos del laboratorio', 'Visual Paradigm for Community Edition 3.0 o superior', 0, '', '', '2018-09-05', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'Ninguna', ''),
(97, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'AnÃ¡lisis y Modelado de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 2: CreaciÃ³n de un diagrama de casos de uso 2.', 2, 'El estudiante crearÃ¡ y manejarÃ¡ un diagrama de casos de uno nivel modelado del negocio', 'Se requiere que el software este instalado en los equipos del laboratorio', 'Visual Paradigm for Community Edition 3.0 o superior', 0, '', '', '2018-09-05', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'Ninguna', ''),
(98, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'ElaboraciÃ³n de documentos', 6, 'Crear un documento nuevo en word\nBuscar informaciÃ³n en internet sobre SW de aplicaciÃ³n especializado en el Ã¡rea de desarrollo comunitario.\nAplicar formato  usando los estilos utilizando formato APA\nCreaciÃ³n de Ã­ndices\nInsertar encabezado y pie de pÃ¡gina\nInsertar  nÃºmero.', 'Proyector', 'Oficce', 0, '', '', '2018-10-17', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'realizada sin observaciones', ''),
(99, 'Ing. Ãlvaro Gil Ãlvarez', 'FitopatologÃ­a', 'Ing. AgronomÃ­a', 7, 'A', 'Matutino', 'Parcela experimental - Banco de Germoplasma', 'cirugÃ­a de una planta de banano', 1, 'RealizaciÃ³n de cirugÃ­a de una planta de banano, con el objetivo de localizaciÃ³n de el avance del racimo en el interior del pseudotallo en la parte interna de la planta.', 'machetes y limas', 'machetes, limas,overol y cÃ¡mara fotogrÃ¡fica digital', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(100, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'CreaciÃ³n y uso de tablas en excel', 7, 'CreaciÃ³n de una tabla , insertar fotografÃ­as en excel, generar grÃ¡ficas', 'Proyector', 'Office', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(101, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'ElaboraciÃ³n de presentaciones', 8, 'Buscar informaciÃ³n sobre el uso y alcances de internet en la formaciÃ³n profesional, sobre las herramientas de comunicaciÃ³n sincrÃ³nicos', 'Proyector', 'Office', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(102, 'M.A. Alejandra Guadalupe VÃ¡zquez MartÃ­nez', 'TecnologÃ­a de la InformaciÃ³n y las Comunicaciones', 'Ing. AgronomÃ­a', 1, 'A', 'Matutino', 'Base de datos', 'ElaboraciÃ³n de Cartel CientÃ­fico', 9, 'El alumno investigarÃ¡ en diversos sitios de consulta de informaciÃ³n para el Ing. AgrÃ³nomo, tales como revistas, universidades, revistas cientÃ­ficas, para elaborar una cartel cientÃ­fico con las caracterÃ­sticas necesarias.', 'Proyector', 'Office', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(103, 'Ing. Ãlvaro Gil Ãlvarez', 'FitopatologÃ­a', 'Ing. AgronomÃ­a', 7, 'A', 'Matutino', 'Parcela experimental - PlantaciÃ³n de Cacao', 'caracterizaciÃ³n de las variedades de cacao', 2, 'se realizara una caracterizaciÃ³n de las diversas variedades de cacao establecidas en la parcela  experimental con el objetivo de registrar datos biometricos del fruto', 'machetes, limas, cubetas, costal y balanza', 'guantes, overol ', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(104, 'Ing. HÃ©ctor Emilio RamÃ­rez Castro', 'MecanizaciÃ³n Agropecuaria', 'Ing. AgronomÃ­a', 3, 'A', 'Matutino', 'Parcela experimental - Ãrea de Manejo de MaquinarÃ­a AgrÃ­c', 'Reconocimiento del tractor e implementos de la maquinaria agrÃ­cola y funcionamiento del tractor', 1, 'El alumno conocerÃ¡ de manera practica los controles e instrumentos del tractor,los implementos agrÃ­colas  asÃ­ como tambiÃ©n su funcionamiento general. ', 'DiÃ©sel 10Lts. \nAgua    20lts.\nVasos  Â·12  50pz.\n', 'Tractor, devaradora, arado, Rastra, Pasadores, Pernos. ', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(105, 'M.T. Isidro Torres GonzÃ¡lez', 'AdministraciÃ³n de Servidores', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'InstalaciÃ³n de sistema operativo', 1, 'InstalaciÃ³n de sistema operativo de servidor windows 2012', 'video proyector', '15 equipo de computo', 0, '', '', '2018-11-09', 1, 100, 'Lic. Gloria PÃ©rez Valdivia', '', '', '', ''),
(106, 'Ing. HÃ©ctor Emilio RamÃ­rez Castro', 'MecanizaciÃ³n Agropecuaria', 'Ing. AgronomÃ­a', 3, 'A', 'Matutino', 'Parcela experimental - Ãrea de Manejo de MaquinarÃ­a AgrÃ­c', 'funcionamiento del tractor con sus implementos en el campo', 2, 'El alumno aprenderÃ¡ como se debe utilizar de manera correcta el tractor con sus implemantos en el campo.', 'Diesel  20Lts.\nAgua    20Lts.\nVasos   Â· 12  50pzas', 'Tractor, Devaradora, Arado, Raztra, Pasadores, Pernos.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(107, 'M.T. Isidro Torres GonzÃ¡lez', 'Redes de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Redes', 'Identificacion de clases de IP ', 1, 'configuraciÃ³n de internases de sistema operativo', 'videoproyector', 'no aplica', 0, '', '', '2018-09-18', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Ninguna', '', 'Ninguna', ''),
(108, 'M.T. Isidro Torres GonzÃ¡lez', 'Redes de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Redes', 'Identificacion de mascara de subred', 2, 'videoproyector', 'no aplica', 'no aplica', 0, '', '', '2018-11-09', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', '', ''),
(109, 'M.T. Isidro Torres GonzÃ¡lez', 'Redes de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Redes', 'Enrutamiento Estatico', 3, 'configurar una red LAN  en enrutamiento estÃ¡tico', '10 equipo de computo', 'packettrace version 7.0', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(110, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'AnÃ¡lisis y Modelado de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'PrÃ¡ctica 1: CreaciÃ³n de un diagrama de casos de uso 1.', 1, 'El estudiante crearÃ¡ y manipularÃ¡ en un programa de modelado UML diagramas de casos de uso', '10 mÃ¡quinas funcionando de manera correcta', 'Visual Paradigm for Community Edition 3.0 o superior', 0, '', '', '2018-09-05', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Ninguna', '', 'Ninguna', ''),
(111, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'AnÃ¡lisis y Modelado de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'PrÃ¡ctica 2: CreaciÃ³n de un diagrama de casos de uso 2.', 1, 'El estudiante crearÃ¡ y manipularÃ¡ en un programa de modelado UML diagramas de casos de uso', '10 mÃ¡quinas funcionando de manera correcta', 'Visual Paradigm for Community Edition 3.0 o superior', 0, '', '', '2018-09-05', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Ninguna', '', 'Ninguna', ''),
(112, 'M.T. Isidro Torres GonzÃ¡lez', 'Redes de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Redes', 'Enrutamiento dinÃ¡mico', 4, 'crear una red lan en enrutamiento dinÃ¡mico modo interfaz grÃ¡fico', 'videoproyector', 'packet trace version 7.0 10 equipo de computo', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(113, 'M.T. Isidro Torres GonzÃ¡lez', 'Redes de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Redes', 'creaciÃ³n de una red de punto a punto', 5, 'conectar dos pcs con cable utp incriptacion en paralelo, con el estÃ¡ndar 568 B', 'videoproyector', 'equipo de computo 10', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(114, 'M.T. Isidro Torres GonzÃ¡lez', 'Redes de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Redes', 'Instalacion de una red conmutada', 6, 'crear una red lan con dispositivos intermedio y finales', 'videoproyector', 'packet trace version 7.0 y 10 computadoras', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(115, 'M.T. Isidro Torres GonzÃ¡lez', 'Redes de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Redes', 'servicios en la red', 7, 'crear una red lan con los servicios DNS, DHCP, CORREO', 'videoproyector', 'packet trace versiÃ³n 7.0 y 10 computadoras', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(116, 'M.T. Isidro Torres GonzÃ¡lez', 'AdministraciÃ³n de Servidores', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'administraciÃ³n de cuentas de usuarios', 1, 'Dar de alta a usuarios y permisos en directorios active directory', 'videoproyector', 'sistema operativo windows server 20212', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(117, 'M.T. Isidro Torres GonzÃ¡lez', 'AdministraciÃ³n de Servidores', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'AdministraciÃ³n de dispositivos', 2, 'dar de alta a usuarios en impresoras', 'videoproyector', 'sistema operativo de red windows server 2012', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(118, 'M.T. Isidro Torres GonzÃ¡lez', 'AdministraciÃ³n de Servidores', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'InstalaciÃ³n  y configuraciÃ³n de servidores WEB, DHCP y correos', 1, 'crear y configurar servidores DHCP, WEB y correos', 'videoproyector', 'sistema operativo windows server 2012 y 15 equipo de computo', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(119, 'M.T. Isidro Torres GonzÃ¡lez', 'AdministraciÃ³n de Servidores', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'instalaciÃ³n de software de virtualizacion', 2, 'instalar software de virtualizacion y configuracion', 'videoproyector', 'software de sistema operativo windows server 2012', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(120, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'A', 'Matutino', 'Redes', 'Uso de PSEINT', 1, 'Conocer el entorno de la herramienta PSEINT, para implementarlo en el desarrollo de algoritmo.', 'ninguno', 'PSEINT, 37 pc, videoproyector, pantalla.', 0, '', '', '2018-09-07', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Se llevo a cabo de manera correcta.', '', 'Se realizo de manera correcta.', ''),
(121, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'A', 'Matutino', 'Base de datos', 'DiseÃ±o de Algoritmos', 2, 'Conocer las herramientas y sÃ­mbolos para desarrollar los algoritmos.', 'Manual de programaciÃ³n.', 'PSEINT, 37 pcÂ´s, videoproyector y pantalla.', 0, '', '', '2018-09-12', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Ninguna', '', 'Ninguna', ''),
(122, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'A', 'Matutino', 'Redes', 'Estructura secuenciales.', 3, 'Conocer el proceso y comportamiento de un algoritmo de manera secuencial.', 'Manual de programaciÃ³n.', 'PSEINT, visual studio 2013, 37 pcÂ´s, videoproyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(123, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'A', 'Matutino', 'Base de datos', 'Estructuras Selectivas y condicionales.', 4, 'Conocer el proceso de selecciÃ³n o iteracion de un algoritmo en la resoluciÃ³n de un problema real.', 'Manual de programaciÃ³n.', 'PSEINT y visiual studio 2013, 37 pcÂ´s, video proyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(124, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'A', 'Matutino', 'Base de datos', 'Formalizacion de arreglos.', 5, 'Conocer el comportamiento de los vectores y matrices mediante el uso de algoritmos.', 'Manual de ProgramaciÃ³n.', 'PSEINT, visual studio 2013, 37 pcÂ´s, videoproyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(125, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'A', 'Matutino', 'Base de datos', 'Funciones y puertos', 6, 'Conocer la forma que se implementa para implementar procedimiento y funciones dentro del proceso de un algoritmo.', 'Manual de programaciÃ³n.', 'PSEINT, visual studio 2013, 37 pcÂ´s, videoproyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(126, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'B', 'Vespertino', 'Base de datos', 'Uso de PSEINT', 1, 'Conocer el entorno de PSEINT.', 'Ninguno', 'PSEINT, 22 pcÂ´s, videoproyector y pantalla.', 0, '', '', '2018-09-12', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'Ninguna', '');
INSERT INTO `practicas` (`id_practica`, `maestro`, `materia`, `carrera`, `semestre`, `grupo`, `turno`, `laboratorio`, `nombre`, `numero`, `descripcion`, `materiales`, `equipo`, `reprogramaciones`, `justificacion`, `especificacion`, `fecha_termino`, `realizada`, `eficiencia`, `confirma`, `observaciones`, `fallas`, `observacion_prof`, `seguimiento`) VALUES
(127, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'B', 'Vespertino', 'Base de datos', 'DiseÃ±o de algoritmos.', 1, 'Conocer el proceso, caracterÃ­sticas y sÃ­mbolos utilizados en los algoritmos.', 'Manual de programaciÃ³n.', 'PSEINT, 22 pcÂ´s, videoproyector y pantalla.', 0, '', '', '2018-09-17', 1, 100, 'Lic. Ponciano GarcÃ­a', 'Ninguna ', '', 'ninguna', ''),
(128, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'B', 'Vespertino', 'Base de datos', 'Estructura secuenciales.', 3, 'Conocer el proceso  paso a paso de la estructura secuenciales, aplicadas a la resoluciÃ³n de problemas.', 'Manual de programaciÃ³n.', 'PSEINT, visual studio 2013, 22pcÂ´s, videoproyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(129, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'B', 'Vespertino', 'Base de datos', 'Estructuras selectivas y condicionales.', 4, 'Conocer el comportamiento de las estructuras selectivas y condicionales.', 'Manual de programaciÃ³n.', 'PSEINT, visual studio 2013, 22 pcÂ´s, videoproyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(130, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'B', 'Vespertino', 'Base de datos', 'FormalizaciÃ³n de arreglos.', 5, 'Conocer el comportamiento de los vectores y matrices en el uso de los algoritmos.', 'Manual de programaciÃ³n.', 'PSEINT, visual studio 2013, 22 pcÂ´s, video proyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(131, 'M.A. JosuÃ© Adner SuÃ¡rez Aguilar', 'IntroducciÃ³n a la ProgramaciÃ³n', 'Ing. ElectromecÃ¡nica', 1, 'B', 'Vespertino', 'Base de datos', 'Funciones y puertos.', 6, 'Ver la utilidad que tienen las funciones, procedimientos dentro del desarrollo de un algoritmo.', 'Manual de programaciÃ³n.', 'PSEINT, visual studio, 22 pcÂ´s, video proyector y pantalla.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(132, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 5: CreaciÃ³n y Manejo de algoritmos condicionales 1', 5, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', '26 equipos funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(133, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 6: CreaciÃ³n y Manejo de algoritmos condicionales 2', 6, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', '26 equipos funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(134, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 7: CreaciÃ³n y Manejo de algoritmos condicionales 3', 7, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', '26 equipos funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(135, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 8: CreaciÃ³n y Manejo de algoritmos condicionales 4', 8, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', '26 equipos funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(136, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 9: CreaciÃ³n y Manejo de algoritmos iterativos 1', 9, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', '26 equipos funcionando correctamente', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(137, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 10: CreaciÃ³n y Manejo de algoritmos iterativos 2', 10, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', '26 equipos funcionando de manera correcta', 'Programa PSeint 8.0 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(138, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 11: CreaciÃ³n y Manejo de algoritmos iterativos 3', 11, 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', '26 equipos funcionando correctamente', 'El estudiante crearÃ¡ y manejarÃ¡ algoritmos apoyado de un simulador de compilador', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(139, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 12: ManipulaciÃ³n de GUIs con Visual C# 1', 12, 'El estudiante desarrollarÃ¡ programas bÃ¡sicos con la plataforma de programaciÃ³n MS Visual Studio .Net', '26 equipos funcionando de manera correcta', 'Programa Visual C# de la suite MS Visual Studio .Net 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(140, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 13: ManipulaciÃ³n de GUIs con Visual C# 2', 13, 'El estudiante desarrollarÃ¡ programas bÃ¡sicos con la plataforma de programaciÃ³n MS Visual Studio .Net', '26 equipos funcionando correctamente', 'Programa Visual C# de la suite MS Visual Studio .Net 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(141, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'Fundamentos de ProgramaciÃ³n', 'Ing. InformÃ¡tica', 1, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 14: ManipulaciÃ³n de GUIs con Visual C# 4', 14, 'El estudiante desarrollarÃ¡ programas bÃ¡sicos con la plataforma de programaciÃ³n MS Visual Studio .Net', '26 equipos funcionando de manera correcta', 'Programa Visual C# de la suite MS Visual Studio .Net 2013 o posterior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(142, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Redes', 'Instalacion y configuracion del entorno de Mono.NET.', 1, 'Instalacion y configuracion del entorno de Mono.NET con XamarinStudio.', 'Proyector, PintarrÃ³n,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'XamarinStudio 6.3,android-sdk-24-4-1-en-win,BuildTools_Full_2013,BuildTools_Full_2014,gtk-sharp-2.12.30,jdk-8u161-windows-x64.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(143, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Redes', 'Programa para generar cualquier tabla de multiplicar, Programa para calcular NÃ³mina.', 2, '1. Hacer un programa para generar cualquier tabla de multiplicar definiendo el numero desde cÃ³digo o introduciendo el numero por teclado.\n\n2. Hacer un programa para calcular la nÃ³mina de un trabajador y de â€œnâ€ trabajadores de acuerdo al nÃºmero de horas y al pago por horas.', 'Proyector, PintarrÃ³n,\nBorrador, Plumones,\nLaboratorio de Computo.', 'XamarinStudio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(144, 'M.I.P.A. Juan Carlos Aguilar Arpaiz', 'Operaciones Unitarias III', 'Ing. BioquÃ­mica', 7, 'A', 'Matutino', 'Laboratorio de AnÃ¡lisis FisicoquÃ­micos/MicrobiologÃ­a', 'DestilaciÃ³n de un vino', 1, 'Elaborar un vino para su posterior destilaciÃ³n', 'Kit de destilaciÃ³n con accesorios \nPlaca de calentamiento\nSoporte universal', 'kit de destilaciÃ³n', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(145, 'M.I.P.A. Juan Carlos Aguilar Arpaiz', 'FenÃ³menos de Transporte I', 'Ing. BioquÃ­mica', 5, 'A', 'Matutino', 'Multimedia', 'DeterminaciÃ³n de la viscosidad de fluidos newtonianos y no newtonianos.', 1, 'Determinar la viscosidad del tipo de fluido', 'Vaso de precipitado de 100 ml o 250 ml', 'ViscosÃ­metro digital con accesorio\nDiversas sustancias proporcionada por los alumnos  ', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(146, 'M.I.P.A. Juan Carlos Aguilar Arpaiz', 'TermodinÃ¡mica', 'Ing. BioquÃ­mica', 3, 'A', 'Matutino', 'Laboratorio de InvestigaciÃ³n', 'CalibraciÃ³n y mediciÃ³n del pH de sustancias.', 1, 'Calibrar y medir diversas sustancias', 'Vasos de precipitado de 50 ml\nVasos de precipitados de 600 ml \nPiceta de 1 L', 'Soluciones buffer pH 4,7 y 10\nMuestras a analizar \npH-metro', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(147, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Redes', 'Programa para crear pilas, colas y Ã¡rboles binarios.', 3, 'Hacer un programa para crear pilas, colas y Ã¡rboles de Datos NumÃ©ricos o de Cadenas.', 'Proyector, PintarrÃ³n,\nBorrador, Plumones,\nLaboratorio de Equipos de Computo.', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(148, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Redes', 'Programa para administrar una tienda de artÃ­culos.', 4, 'Hacer un programa para administrar una tienda de artÃ­culos, usando archivos. Usar Formularios para insertar, eliminar, modificar y consultar los artÃ­culos.', 'Proyector, PintarrÃ³n,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(149, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Redes', 'Proyecto ASP.NET. para administrar una tienda de artÃ­culos.', 5, 'Crear un proyecto ASP.NET. para administrar una tienda de artÃ­culos desde la web. Usar XAMPP Para crear la Base de Datos e insertar, eliminar, modificar y consultar los artÃ­culos.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(150, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'A', 'Matutino', 'Redes', 'AplicaciÃ³n MÃ³vil de Ejemplo', 6, 'Crear una aplicaciÃ³n MÃ³vil como ejemplo, sobre cualquier tema de interÃ©s en Xamarin Android.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(151, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'A', 'Matutino', 'Multimedia', 'ResoluciÃ³n de Modelos MatemÃ¡ticos MÃ©todo Simplex y grÃ¡fico', 1, 'Resolver los diferentes modelos de PL mediante los mÃ©todos de soluciÃ³n grÃ¡fica y simplex para la mejora en la toma de decisiones ', 'CaÃ±Ã³n, proyector de diapositivas, pc', 'Computadora, software  QM for Windows', 0, '', '', '2018-09-27', 1, 30, 'Lic. Ponciano GarcÃ­a', '', '', '', ''),
(152, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'A', 'Matutino', 'Multimedia', 'ResoluciÃ³n de problemas con el MÃ©todo de Transporte', 2, 'Resolver modelos de transporte mediante los algoritmos: esquina del noroeste, costo mÃ­nimo y Voguel', 'CaÃ±Ã³n, proyector de diapositivas, pc', 'Computadora, software  QM for Windows', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(153, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'A', 'Matutino', 'Multimedia', ' Problemas de TeorÃ­a de Colas', 3, 'Resolver problemas para comprender y mejorar un sistema bajo el enfoque de la teorÃ­a de colas.', 'CaÃ±Ã³n, proyector de diapositivas, pc', 'Computadora, software  QM for Windows', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(154, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'A', 'Matutino', 'Multimedia', ' AdministraciÃ³n de Proyectos Perp-CPM', 4, 'Plantear y resolver problemas del entorno bajo el esquema de redes.', 'CaÃ±Ã³n, proyector de diapositivas, pc', 'Computadora, software  QM for Windows', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(155, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'B', 'Vespertino', 'Multimedia', 'ResoluciÃ³n de Modelos MatemÃ¡ticos MÃ©todo Simplex y grafico', 1, 'Resolver los diferentes modelos de PL mediante los mÃ©todos de soluciÃ³n grÃ¡fica y simplex  para la mejora en la toma de decisiones ', 'CaÃ±Ã³n, proyector de diapositivas ,pc', 'Computadora, software  QM for Windows', 0, '', '', '2018-09-27', 1, 30, 'Lic. Ponciano GarcÃ­a', '', '', '', ''),
(156, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'B', 'Vespertino', 'Multimedia', 'ResoluciÃ³n de problemas con el MÃ©todo de Transporte', 2, 'Resolvera modelos de transporte mediante los algoritmos: esquina del noroeste, costo mÃ­nimo y Voguel, ', 'CaÃ±Ã³n, proyector de diapositivas, pc', 'Computadora, software  Microsoft Excel, QM for Windows', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(157, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'B', 'Vespertino', 'Multimedia', ' Problemas de TeorÃ­a de Colas', 3, 'Resolvera problemas de la vida real bajo el enfoque de la teorÃ­a de colas.', 'CaÃ±Ã³n, proyector de diapositivas ,pc', 'Computadora, software  QM for Windows', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(158, 'M.I. Isidro HernÃ¡ndez Castellanos', 'InvestigaciÃ³n de Operaciones', 'Ing. AdministraciÃ³n', 5, 'B', 'Vespertino', 'Multimedia', ' AdministraciÃ³n de Proyectos Perp-CPM', 4, 'Plantear y resolver problemas del entorno bajo el esquema de redes.', 'CaÃ±Ã³n, proyector de diapositivas ,pc', 'Computadora, software  QM for Windows', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(159, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'Instalacion y configuracion del entorno de Mono.NET con XamarinStudio.', 1, 'InstalaciÃ³n y configuraciÃ³n del entorno de Mono.NET', 'Proyector, PintarrÃ³n,\nBorrador, Plumones,\nLaboratorio de Equipos de Computo', 'XamarinStudio 6.3,android-sdk-24-4-1-en-win,BuildTools_Full_2013,BuildTools_Full_2014,gtk-sharp-2.12.30,jdk-8u161-windows-x64.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(160, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'Programa para generar cualquier tabla de multiplicar, Programa para calcular NÃ³mina.', 2, 'Crear un Programa para generar cualquier tabla de multiplicar, Crear un Programa para calcular NÃ³mina.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(161, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'Programa para crear pilas, colas y Ã¡rboles binarios.', 3, 'Escribir un programa para crear pilas, colas y Ã¡rboles binarios.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(162, 'Lic. JesÃºs Manuel May LeÃ³n', 'AdministraciÃ³n para InformÃ¡tica', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'Programa para administrar una tienda de artÃ­culos, usando archivos.', 1, 'Hacer un programa para administrar una tienda de artÃ­culos, usando archivos. Usar Formularios para insertar, eliminar, modificar y consultar los artÃ­culos.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(163, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'Crear un proyecto ASP.NET. para administrar una tienda de artÃ­culos', 4, 'Crear un proyecto ASP.NET. para administrar una tienda de artÃ­culos desde la web. Usar XAMPP Para crear la Base de Datos e insertar, eliminar, modificar y consultar los artÃ­culos.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(164, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', '7.	Crear una aplicaciÃ³n MÃ³vil,sobre cualquier tema de interÃ©s en Xamarin Android.', 5, 'Crear una aplicaciÃ³n MÃ³vil como ejemplo, sobre cualquier tema de interÃ©s en Xamarin Android.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(165, 'Lic. JesÃºs Manuel May LeÃ³n', 'DiseÃ±o y desarrollo de sistemas de CÃ³digo Abierto', 'Ing. InformÃ¡tica', 7, 'B', 'Vespertino', 'Redes', 'Programa para administrar una tienda de artÃ­culos, usando archivos.', 6, 'Hacer un programa para administrar una tienda de artÃ­culos, usando archivos. Usar Formularios para insertar, eliminar, modificar y consultar los artÃ­culos.', 'Proyector, Pintarron,\nBorrador, Plumones,\nLaboratorio de Computo.\n', 'Xamarin Studio 6.3', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(166, 'M.I. Herschell JosÃ© Serna LÃ³pez', 'AnÃ¡lisis y Modelado de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'PrÃ¡ctica 3: CreaciÃ³n de un diagrama de casos de uso 3.', 3, 'El estudiante crearÃ¡ y manipularÃ¡ Diagramas de Caso de Uso por medio del programa Visual Paradigm 3.0 o superior', 'se requiere que el software este instalado en los equipos de laboratorio', 'Visual Paradigm 3.0 o superior', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(170, 'Ing. Eduardo Pozo Montuy', 'TecnologÃ­as e Interfaces de Computadoras', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Laboratorio de AutomatizaciÃ³n y RobÃ³tica', 'Practicas con arduino', 1, 'Realizar practicas de introducciÃ³n, con tarjeta programable arduino, previamente simuladas.', 'Laptop, arduino uno, resistencias, diodo led, push boton y cable UTP.', 'Arduino IDE. Pinzas y mesa de trabajo.', 0, '', '', '2018-09-20', 1, 100, 'Ing. Daniel PÃ©rez Flores', '', '', '', ''),
(171, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 1. CreaciÃ³n de una Base de datos de una situaciÃ³n real.', 1, 'Ninguna', 'Computadora, VÃ­deo proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-21', 1, 100, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(172, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 2. RealizaciÃ³n de ejercicios de Modelo E-R y Diagrama E-R', 2, 'Ninguno', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-21', 1, 70, 'Lic. Gloria PÃ©rez Valdivia', '', '', 'ninguna', ''),
(173, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 3. DiseÃ±ar la Base de Datos de un problema del entorno con el diagrama E-R.', 3, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-21', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(174, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 4. Convertir el diagrama E-R a notaciÃ³n UML de un problema del entorno.', 4, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-25', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(175, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 5. Convertir el esquema conceptual a modelo Relacional de ejercicios planteados.', 5, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-10-11', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'NINGUNO', ''),
(176, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 6. Crear esquemas de BD utilizando un DBMS', 6, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-10-18', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(177, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 7. DiseÃ±ar eficientemente una BD planteada en curso.', 7, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(178, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 8. Realizar ejercicios de aplicaciÃ³n del algebra relacional bÃ¡sica y extendida.', 8, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Computadora, Video proyector, Internet, documento de la prÃ¡ctica.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(179, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 9. Desarrollar ejercicios de comandos bÃ¡sicos del LDD.', 9, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(180, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Base de datos', 'Practica 10. Desarrollar ejercicios de comandos bÃ¡sicos del LMD', 10, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(181, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P1. CreaciÃ³n de una BD de una situaciÃ³n real.', 1, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-21', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(182, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Multimedia', 'P2. RealizaciÃ³n de ejercicios de Modelo E-R y Diagrama E-R', 2, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-26', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(183, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P3. DiseÃ±ar la Base de Datos de un problema del entorno con el diagrama E-R.', 3, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-26', 1, 65, 'Lic. Ponciano GarcÃ­a', '', 'ninguna', 'ninguna', ''),
(184, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P4. Convertir el diagrama E-R a nota+ciÃ³n UML de un problema del entorno.', 4, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-09-26', 1, 65, 'Lic. Ponciano GarcÃ­a', '', 'ninguna', 'Se utilizÃ³ como herramienta CASE el software de Visual Paradigm', ''),
(185, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P5. Convertir el esquema conceptual a modelo Relacional de ejercicios planteados.', 5, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-10-11', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'NINGUNO', ''),
(186, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P6. Crear esquemas de BD utilizando un DBMS', 6, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-10-18', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(187, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P7. DiseÃ±ar eficientemente una BD planteada en curso.', 7, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(188, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P8. Realizar ejercicios de aplicaciÃ³n del algebra relacional bÃ¡sica y extendida.', 8, 'Ninguno', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Computadora, Video proyector, Internet,documento de la prÃ¡ctica.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(189, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P9. Desarrollar ejercicios de comandos bÃ¡sicos del LDD.', 9, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(190, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Bases de Datos', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Base de datos', 'P10. Desarrollar ejercicios de comandos bÃ¡sicos del LMD', 10, 'Ninguna', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'DBMS, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(191, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multimedia', 'Practica 1. Identificar un Ã¡rea de oportunidad para el desarrollo de un sistema de informaciÃ³n.', 1, 'Identificar un Ã¡rea de oportunidad para el desarrollo de un sistema de informaciÃ³n y presentar la propuesta en grupo.', 'Computadora, Video proyector, documento de la    prÃ¡ctica.', 'Office actualizado, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-10-18', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(192, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multimedia', 'Practica 2. Efectuar un anÃ¡lisis comparativo de los modelos prescriptivos del desarrollo.', 2, 'Efectuar un anÃ¡lisis comparativo de los modelos prescriptivos del desarrollo de sistemas de\nInformaciÃ³n\n', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Office actualizado, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '2018-10-18', 1, 70, 'Lic. Ponciano GarcÃ­a', '', '', 'ninguna', ''),
(193, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multimedia', 'Practica 3. Evaluar diferentes herramientas CASE ', 3, 'Evaluar diferentes herramientas CASE mostrando los resultados mediante un cuadro sinÃ³ptico.', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Herramienta CASE, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(194, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multimedia', 'Practica 1. Gestionar informaciÃ³n sobre los paradigmas de ingenierÃ­a de software. ', 4, 'Gestionar informaciÃ³n sobre los paradigmas de ingenierÃ­a de software. Presentar los resultados en una lÃ­nea del tiempo.', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Software, Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(195, 'M.I. AngÃ©lica Ãvalos Cano', 'Fundamentos de Sistemas de InformaciÃ³n', 'Ing. InformÃ¡tica', 3, 'A', 'Matutino', 'Multimedia', 'Practica 5. Realizar la selecciÃ³n del modelo adecuado para el desarrollo de un sistema de informaci', 5, 'Realizar la selecciÃ³n del modelo adecuado para el desarrollo de un sistema de informaciÃ³n de\nuna serie de casos seleccionados\n', 'Computadora, Video proyector, documento de la prÃ¡ctica.', 'Computadora personal y prÃ¡ctica de laboratorio.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(196, 'Ing. Eduardo Pozo Montuy', 'Electricidad y MagnetÃ­smo', 'Ing. ElectromecÃ¡nica', 3, 'B', 'Vespertino', 'Laboratorio de AutomatizaciÃ³n y RobÃ³tica', 'ConstrucciÃ³n de Circuito R-C.', 1, 'Definir la propiedad de capacitancia de un elemento y su comportamiento en \nun circuito temporizador RC.', 'Protoboart, resistencias, Capacitor, fuente de alimentaciÃ³n de VCD Y Pinzas', 'LimeWire y Laptop', 0, '', '', '2018-09-24', 1, 100, 'Ing. Daniel PÃ©rez Flores', '', '', '', ''),
(197, 'Ing. Eduardo Pozo Montuy', 'TecnologÃ­as e Interfaces de Computadoras', 'Ing. InformÃ¡tica', 5, 'A', 'Matutino', 'Laboratorio de AutomatizaciÃ³n y RobÃ³tica', 'Practicas basicas Arduino', 1, 'Conocer la tarjeta arduino de manera practica, desarrollando todas aquellas practicas estudiadas y simuladas en clases', 'Arduino 1 y dispositivos electrÃ³nicos', 'Arduino. IDE', 0, '', '', '2018-09-26', 1, 100, 'Ing. Daniel PÃ©rez Flores', '', '', '', ''),
(198, 'M.A. Sara MarÃ­a LeÃ³n MartÃ­nez', 'ErgonomÃ­a', 'Ing. Industrial', 5, 'A', 'Matutino', 'Laboratorio de ErgonomÃ­a', 'MEDIDAS ANTROPOMETRICAS', 1, 'REALIZARON LAS MEDIDAS ANTROPOMETRICAS LOS ALUMNOS EN LAS DIFERENTES SECCCIONES: MIXTAS, ANCHURAS Y ALTURAS DEL LABORATORIO', 'CINTA METRICA, HOJAS DE MEDIDAS , LAPIZ BORRADOR ', 'SECCIONES DE MEDIDAS MIXTAS, ANCHURAS Y ALTURAS, BASCULA Y ANTROPOMETRO', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(199, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'GestiÃ³n de procesos', 2, 'MODELADO DE LA GESTIÃ“N DE PROCESO EN EL CPU', 'ALGORITMOS DE GESTIÃ“N DE PROCESOS', 'Computadoras,Imagen de SO. Y mÃ¡quinas virtuales', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(200, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'ContinuaciÃ³n GestiÃ³n de procesos.', 3, 'PROGRAMACIÃ“N EN MODO VISUAL DEL REGISTRO DE INSTRUCCIONES Y SU EJECUCIÃ“N', 'Computadoras', ' Imagen de SO. Y mÃ¡quinas virtuales', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(201, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'ElaboraciÃ³n de documentos en procesador de texto.', 4, 'Uso de procesador de texto y sus herramientas', 'Computadora', 'Procesador de textos electrÃ³nico.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(202, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'DiseÃ±o de presentaciones.', 5, 'ElaboraciÃ³n de presentaciÃ³n digital.', 'Computadoras e internet', 'Programa para diseÃ±o de diapositivas', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(203, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'SimulaciÃ³n de configuraciÃ³n de LAN, estÃ¡tica y dinÃ¡mica.', 6, 'basados en un caso de estudio, diseÃ±a estrategia para el modelado de un red estructurada haciendo uso del simulador Packetracer', 'Computadoras', 'Packetracer y procesador de textos', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(204, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'InstalaciÃ³n de CMS educativo.', 7, 'instalar y configurar aplicaciones CMS para la gestiÃ³n de cursos de aprendizaje', 'Computadoras', 'Instaladores CMS, Moodle, Chamilo, etc.', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(205, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'Uso de CMS educativo', 8, 'Teniendo desarrollado material para la gestiÃ³n de curso, enviar a la plataforma CMS, y dar seguimiento a la misma.', 'Computadoras e internet', 'CMS educativos', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(206, 'M.A. Sara MarÃ­a LeÃ³n MartÃ­nez', 'ErgonomÃ­a', 'Ing. Industrial', 5, 'A', 'Matutino', 'Laboratorio de Estudio del Trabajo', 'ANALISIS DE CONDICIONES FISICAS Y AMBIENTALES DE ERGONOMIA OCUPACIONAL', 2, 'SE REALIZARAN LECTURAS SOBRE LOS FACTORES FISICOS Y AMBIENTALES DE CADA ALUMNO DENTRO DELAS CABINAS DE ESTUDIO DE TRABAJO', 'HOJAS DE LECTURAS, LAPIZ, BORRADOR ', 'CABINAS DE LECTURAS, MEDIDOR DE PULSO Y PIEZAS PARA ARMAR DE LEGO', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(207, 'M.A. Sara MarÃ­a LeÃ³n MartÃ­nez', 'ErgonomÃ­a', 'Ing. Industrial', 5, 'B', 'Matutino', 'Laboratorio de ErgonomÃ­a', 'MEDIDAS ANTROPOMETRICAS', 1, 'SE RELAIZARON LAS DIFERENTES MEDIDAS ANTROPOMETRICAS LOS ALUMNOS EN LAS DIFERENTES SECCIONES: MIXTA, ANCHURA Y ALTURA ', 'HOJA DE MEDIDAS, BORRADOR LAPIZ, CINTA METRICA ', 'SECCIONES DE MEDIDAS , MIXTAS , ANCHURAS Y ALTURAS, BASCULA, ANTROPOMETRO', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(208, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'DiseÃ±o de contenido para CMS educativos y carga de archivos.', 9, 'DiseÃ±o de contenidos para el desarrollo de conocimientos mediante CMS', 'Computadoras, red local, internet', 'Programa CMS', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(209, 'Dr. JosÃ© Antonio Mis MartÃ­n', 'Seminario de TI', 'Ing. InformÃ¡tica', 8, 'A', 'Matutino', 'Multiplataforma', 'Propuesta de diseÃ±o para AplicaciÃ³n.', 10, 'Modelado de soluciÃ³n mediante programaciÃ³n de ejercicios ', 'Computadoras', 'CMS, ', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(210, 'M.A. Sara MarÃ­a LeÃ³n MartÃ­nez', 'ErgonomÃ­a', 'Ing. Industrial', 5, 'B', 'Matutino', 'Laboratorio de Estudio del Trabajo', 'Analisis de condiciones fisicas ambientales y ergonomia ocupacional', 2, 'realizaciÃ³n de lecturas de condiciones fÃ­sicas en las cabinas del laboratorio de estudio de trabajo', 'hojas de lecturas, lÃ¡piz, borrador ', 'cabinas de condiciones fÃ­sicas y ambientales, bascula y medidor de presiÃ³n ', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(211, 'Ing. Eduardo Pozo Montuy', 'TecnologÃ­as e Interfaces de Computadoras', 'Ing. InformÃ¡tica', 5, 'B', 'Vespertino', 'Laboratorio de AutomatizaciÃ³n y RobÃ³tica', 'IntroducciÃ³n de manejo de tarjeta arduino uno', 2, 'Realizar dichas practicas en circuitos prÃ¡cticos previamente simulados y estudiados en clases', 'Protoboart, cable UTP, PINZAS y dispositivos electrÃ³nicos general.', 'Arduino.IDE', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(212, 'Ing. Eduardo Pozo Montuy', 'ElectrÃ³nica Digital', 'Ing. ElectromecÃ¡nica', 5, 'B', 'Vespertino', 'Laboratorio de AutomatizaciÃ³n y RobÃ³tica', 'Uso y configuraciÃ³n de Compuertas lÃ³gicas', 1, 'El alumno realizaras circuitos lÃ³gicos, de tipo AND, OR Y NOT.', 'Fuente alimentaciÃ³n de 5 vdc, resistencias, cable UTP, y circuitos integrados de tipo TTL.', 'LimeWire y Proteus', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(213, 'Ing. Ricardo de la Cruz GarcÃ­a', 'Procesos de FabricaciÃ³n', 'Ing. Industrial', 3, 'A', 'Matutino', 'Taller de MÃ¡quinas y Herramientas', 'Punto de Soldadura.', 1, 'PrÃ¡ctica No. 1 \n\n1. El docente impartirÃ¡ las instrucciones de seguridad y la importancia de portar el E.P.P. \n2. El alumno aprenderÃ¡ a tomar el pulso e intensidad del tiempo de soldadura para la uniÃ³n de los materiales, asÃ­ como regular el amperaje adecuado de la mÃ¡quina soldar.\n', '1. Soldadura 60/13\n2. Cincel \n3. Placa de acero\n', 'Equipos:\n1. MÃ¡quina de soldar 110 Amperes\n2. Pinza de aterrizaje (tierra)\n3. Pinza de soldar\n\nEquipo de seguridad\n1. Overol\n2. Bota industrial\n3. Gafas\n3. Careta para soldar\n4. Guantes de carnaza\n\n\n', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', ''),
(214, 'Ing. Daniel Pérez Flores', 'Sistemas', '', 0, '', '', '', '', 0, '', '', '', 0, '', '', '0000-00-00', 0, 0, '', '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`);

--
-- Indices de la tabla `bitacora_alumnos`
--
ALTER TABLE `bitacora_alumnos`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`id_maestro`),
  ADD UNIQUE KEY `id` (`id_maestro`),
  ADD KEY `clave` (`clave`),
  ADD KEY `clave_2` (`clave`),
  ADD KEY `clave_3` (`clave`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id_periodo`);

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
  MODIFY `id_alumno` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bitacora_alumnos`
--
ALTER TABLE `bitacora_alumnos`
  MODIFY `id_registro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id_laboratorio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `maestros`
--
ALTER TABLE `maestros`
  MODIFY `id_maestro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id_periodo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `practicas`
--
ALTER TABLE `practicas`
  MODIFY `id_practica` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
