-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2022 a las 01:04:42
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `unlimited`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ID` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `ID` int(11) NOT NULL,
  `nombres` varchar(20) DEFAULT NULL,
  `apellidos` varchar(20) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `Codigo_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

CREATE TABLE `carrito_compras` (
  `ID` int(11) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `Codigo_curso` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificado`
--

CREATE TABLE `certificado` (
  `ID` int(11) NOT NULL,
  `ID_certificador` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL,
  `Codigo_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificador`
--

CREATE TABLE `certificador` (
  `ID` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `Codigo` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `Duracion` varchar(20) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Horario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquietudes`
--

CREATE TABLE `inquietudes` (
  `ID` int(11) NOT NULL,
  `tipo_inquietud` varchar(100) NOT NULL,
  `solucion` varchar(100) NOT NULL,
  `ID_asesor` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_apoyo`
--

CREATE TABLE `material_apoyo` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `Codigo_curso` int(11) NOT NULL,
  `ID_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_de_pago`
--

CREATE TABLE `metodo_de_pago` (
  `ID` int(11) NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `valor` bigint(20) NOT NULL,
  `ID_usuario` int(11) NOT NULL,
  `Codigo_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina_web`
--

CREATE TABLE `pagina_web` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `ID` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `curriculum_vitae` varchar(100) NOT NULL,
  `telefono` int(11) NOT NULL,
  `Codigo_curso` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_en_linea`
--

CREATE TABLE `sesiones_en_linea` (
  `ID` int(11) NOT NULL,
  `tema` varchar(50) NOT NULL,
  `hora` int(11) NOT NULL,
  `link` varchar(50) NOT NULL,
  `ID_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `edad` smallint(6) DEFAULT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `Codigo_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Codigo_curso` (`Codigo_curso`);

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `Codigo_curso` (`Codigo_curso`);

--
-- Indices de la tabla `certificado`
--
ALTER TABLE `certificado`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_certificador` (`ID_certificador`),
  ADD KEY `Codigo_curso` (`Codigo_curso`);

--
-- Indices de la tabla `certificador`
--
ALTER TABLE `certificador`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `inquietudes`
--
ALTER TABLE `inquietudes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_asesor` (`ID_asesor`);

--
-- Indices de la tabla `material_apoyo`
--
ALTER TABLE `material_apoyo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_profesor` (`ID_profesor`);

--
-- Indices de la tabla `metodo_de_pago`
--
ALTER TABLE `metodo_de_pago`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `Codigo_curso` (`Codigo_curso`);

--
-- Indices de la tabla `pagina_web`
--
ALTER TABLE `pagina_web`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Codigo_curso` (`Codigo_curso`);

--
-- Indices de la tabla `sesiones_en_linea`
--
ALTER TABLE `sesiones_en_linea`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_profesor` (`ID_profesor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Codigo_curso` (`Codigo_curso`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `asesor_ibfk_1` FOREIGN KEY (`Codigo_curso`) REFERENCES `cursos` (`Codigo`);

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `carrito_compras_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `carrito_compras_ibfk_2` FOREIGN KEY (`Codigo_curso`) REFERENCES `cursos` (`Codigo`);

--
-- Filtros para la tabla `certificado`
--
ALTER TABLE `certificado`
  ADD CONSTRAINT `certificado_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `certificado_ibfk_2` FOREIGN KEY (`ID_certificador`) REFERENCES `certificador` (`ID`),
  ADD CONSTRAINT `certificado_ibfk_3` FOREIGN KEY (`Codigo_curso`) REFERENCES `cursos` (`Codigo`);

--
-- Filtros para la tabla `inquietudes`
--
ALTER TABLE `inquietudes`
  ADD CONSTRAINT `inquietudes_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `inquietudes_ibfk_2` FOREIGN KEY (`ID_asesor`) REFERENCES `asesor` (`ID`);

--
-- Filtros para la tabla `material_apoyo`
--
ALTER TABLE `material_apoyo`
  ADD CONSTRAINT `material_apoyo_ibfk_1` FOREIGN KEY (`ID_profesor`) REFERENCES `asesor` (`ID`),
  ADD CONSTRAINT `material_apoyo_ibfk_2` FOREIGN KEY (`ID_profesor`) REFERENCES `profesor` (`ID`);

--
-- Filtros para la tabla `metodo_de_pago`
--
ALTER TABLE `metodo_de_pago`
  ADD CONSTRAINT `metodo_de_pago_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `metodo_de_pago_ibfk_2` FOREIGN KEY (`Codigo_curso`) REFERENCES `cursos` (`Codigo`);

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`Codigo_curso`) REFERENCES `cursos` (`Codigo`);

--
-- Filtros para la tabla `sesiones_en_linea`
--
ALTER TABLE `sesiones_en_linea`
  ADD CONSTRAINT `sesiones_en_linea_ibfk_1` FOREIGN KEY (`ID_profesor`) REFERENCES `profesor` (`ID`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Codigo_curso`) REFERENCES `cursos` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
