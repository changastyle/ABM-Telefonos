-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2017 a las 02:38:30
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `session`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentologeo`
--

CREATE TABLE `intentologeo` (
  `id` int(11) NOT NULL,
  `nombreUsuarioQueProbo` text NOT NULL,
  `passQueProbo` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `direccionIP` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `intentologeo`
--

INSERT INTO `intentologeo` (`id`, `nombreUsuarioQueProbo`, `passQueProbo`, `timestamp`, `direccionIP`) VALUES
(2, 'admin', 'admin', '2017-01-06 23:29:10', ''),
(3, 'admin', 'admin', '2017-01-06 23:31:18', ''),
(4, 'admin', 'admin', '2017-01-06 23:32:17', ''),
(5, 'admin', 'admin', '2017-01-06 23:35:34', '0:0:0:0:0:0:0:1'),
(6, 'admin', 'admin', '2017-01-07 00:00:40', '0:0:0:0:0:0:0:1'),
(7, 'admin', 'admin', '2017-01-07 00:00:42', '0:0:0:0:0:0:0:1'),
(8, 'admin', 'admin', '2017-01-07 00:19:13', '0:0:0:0:0:0:0:1'),
(9, 'admin', 'admin', '2017-01-07 00:55:50', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemsmenu`
--

CREATE TABLE `itemsmenu` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `url` text NOT NULL,
  `fkMenu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `itemsmenu`
--

INSERT INTO `itemsmenu` (`id`, `nombre`, `url`, `fkMenu`) VALUES
(1, 'home', '../home/home.jsp', 1),
(2, 'log', '../log/log.jsp', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logeoscorrectos`
--

CREATE TABLE `logeoscorrectos` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fkUsuario` int(11) NOT NULL,
  `direccionIP` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `logeoscorrectos`
--

INSERT INTO `logeoscorrectos` (`id`, `timestamp`, `fkUsuario`, `direccionIP`) VALUES
(1, '2017-01-06 23:35:45', 2, '0:0:0:0:0:0:0:1'),
(2, '2017-01-07 00:00:47', 3, '0:0:0:0:0:0:0:1'),
(3, '2017-01-07 00:19:17', 4, '0:0:0:0:0:0:0:1'),
(4, '2017-01-07 00:55:56', 5, '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `nombre`, `orden`) VALUES
(1, 'Menu1', 1),
(2, 'Menu2', 2),
(3, 'Menu4', 5),
(4, 'Menu5', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `pass` text NOT NULL,
  `permisos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `pass`, `permisos`) VALUES
(1, 'Nicolas', '123456', 10),
(2, 'Nicolas', '123456', 10),
(3, 'Nicolas', '123456', 10),
(4, 'Nicolas', '123456', 10),
(5, 'Nicolas', '123456', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `intentologeo`
--
ALTER TABLE `intentologeo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `itemsmenu`
--
ALTER TABLE `itemsmenu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logeoscorrectos`
--
ALTER TABLE `logeoscorrectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `intentologeo`
--
ALTER TABLE `intentologeo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `itemsmenu`
--
ALTER TABLE `itemsmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `logeoscorrectos`
--
ALTER TABLE `logeoscorrectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
