-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2017 a las 03:32:58
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
-- Base de datos: `basepizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(11, 'Pizzas', 'Pizzas Supremas'),
(12, 'Ensaladas', 'Para Vegetarianos'),
(13, 'Empanadas', 'De todos los gustos'),
(14, 'Pastas', 'Las mas ricas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `fk_id_producto` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `puntaje` tinyint(4) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `fk_id_producto`, `fk_id_usuario`, `comentario`, `puntaje`, `fecha`) VALUES
(1, 27, 23, 'Me cayo mal el choclo', 3, '2017-11-08 03:00:00'),
(2, 27, 24, 'Buenisima', 5, '2017-11-30 03:00:00'),
(4, 30, 23, 'Mucho QUESOOO', 4, '2017-11-23 03:00:00'),
(42, 27, 23, 'Me cayo mal el choclo q12e13', 4, '0000-00-00 00:00:00'),
(43, 27, 23, 'Me cayo mal el choclo q12e13', 4, '2017-11-15 22:45:40'),
(44, 27, 23, 'Me cayo mal el choclo q12e13', 4, '2017-11-15 22:47:29'),
(45, 27, 23, 'Me cayo mal el choclo q12e13', 4, '2017-11-15 22:47:59'),
(46, 27, 23, 'Me cayo mal el choclo q12e13', 4, '2017-11-15 22:49:37'),
(47, 27, 23, 'Me cayo mal el choclo q12e13', 4, '2017-11-15 22:50:06'),
(48, 27, 23, 'Me cayo mal el queso q12e13', 4, '2017-11-15 22:52:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id_imagen` int(11) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `fk_id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id_imagen`, `ruta`, `fk_id_producto`) VALUES
(2, 'images/5a0c616ef00f7', 34),
(5, 'images/5a0c8cd70f536', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `imagenes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria`, `nombre`, `precio`, `descripcion`, `imagenes`) VALUES
(21, 11, 'Super Suprema', 200, 'Queso mozzarella, pepperoni, jamón, salchicha italiana, champiñones, cebolla, pimiento y aceitunas.', 'images/pizza1.png'),
(22, 11, 'Chicken BBQ Suprema', 222, 'Queso mozzarella, champiñones, cebolla, fajitas de pollo, tocino y salsa BBQ.', 'images/pizza2.png'),
(23, 11, 'Meat Suprema', 223, 'Queso mozzarella, pepperoni, jamón, tocino y salchicha italiana.', 'images/pizza3.png'),
(24, 12, 'Suprema', 100, '¡Nuestra especialidad!. Lechuga, zanahoria, col morada, tomate, jamón, pepperoni, queso mozzarella, ', 'images/acom5.png'),
(25, 14, 'Lasagna de Pollo o Carne', 130, 'Suave pasta rellana de queso mozzarella y ricotta, cubierta con salla de carne o fajitas de pollo. ', 'images/acom6.png'),
(26, 13, 'Carne', 10, 'Carne picada', 'images/carne.png'),
(27, 13, 'Humita', 13, 'Choclo', 'images/humita.png'),
(30, 13, 'Jamon & Queso', 8, 'Jamon y Queso', 'images/j&q.png'),
(34, 13, 'mateo', 12, 'asd', ''),
(35, 13, 'LALALA', 123, 'ascjknwedcjkn', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rol` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `password`, `email`, `rol`) VALUES
(23, 'Mateo', '$2y$10$U4SwekSWmU7vJ5aZD2ygAe1qifaDzV4DTSXGkA5CIqFXagX.iOiYC', 'mateo@gmail.com', 1),
(24, 'jose', '$2y$10$FY2sXMtw4CeEDsJ6aCeeZ.fE0a3JMs7FkQLvnFMNzbb5lXq7lVzpm', 'jose@gmail.com', 2),
(25, 'Juan Perez', '$2y$10$IkntnvQagtDdJMgYboyjAOMqPLEsAdwCpHQ/zsrLI9HlU3jEkIjHG', 'juan@gmail.com', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `fk_id_producto` (`fk_id_producto`,`fk_id_usuario`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `fk_id_producto` (`fk_id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`fk_id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`fk_id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
