-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2022 a las 19:18:24
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `géneros`
--

CREATE TABLE `géneros` (
  `ID` int(11) NOT NULL,
  `Descripción` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `géneros`
--

INSERT INTO `géneros` (`ID`, `Descripción`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Blues'),
(4, 'FX'),
(5, 'Country');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrumentos`
--

CREATE TABLE `instrumentos` (
  `ID` int(11) NOT NULL,
  `Descripción` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `instrumentos`
--

INSERT INTO `instrumentos` (`ID`, `Descripción`) VALUES
(1, 'Guitarra'),
(3, 'Piano'),
(4, 'Violín'),
(5, 'Percusión'),
(6, 'Voz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partituras`
--

CREATE TABLE `partituras` (
  `ID` int(11) NOT NULL COMMENT 'Clave primaria',
  `Compositor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Obra` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Estilo` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `URL` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `samples`
--

CREATE TABLE `samples` (
  `ID` int(11) NOT NULL,
  `Instrumento` int(11) NOT NULL,
  `Genero` int(11) NOT NULL,
  `BPM` int(3) DEFAULT NULL,
  `URL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `samples`
--

INSERT INTO `samples` (`ID`, `Instrumento`, `Genero`, `BPM`, `URL`) VALUES
(3, 1, 2, 130, 'Charlie Hello.mp3'),
(4, 5, 4, 0, 'Pulp Fiction 8-bit.mp3'),
(6, 1, 1, 200, 'LA pedal.mp3'),
(7, 1, 2, 100, 'Piano.wav'),
(8, 6, 4, NULL, 'Homero.wav');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `géneros`
--
ALTER TABLE `géneros`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `instrumentos`
--
ALTER TABLE `instrumentos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `partituras`
--
ALTER TABLE `partituras`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `samples`
--
ALTER TABLE `samples`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_inst` (`Instrumento`),
  ADD KEY `fk_gen` (`Genero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `géneros`
--
ALTER TABLE `géneros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `instrumentos`
--
ALTER TABLE `instrumentos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `partituras`
--
ALTER TABLE `partituras`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria';

--
-- AUTO_INCREMENT de la tabla `samples`
--
ALTER TABLE `samples`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `samples`
--
ALTER TABLE `samples`
  ADD CONSTRAINT `fk_inst` FOREIGN KEY (`Instrumento`) REFERENCES `instrumentos` (`ID`),
  ADD CONSTRAINT `samples_ibfk_1` FOREIGN KEY (`Genero`) REFERENCES `géneros` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
