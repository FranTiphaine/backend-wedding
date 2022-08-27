-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-08-2022 a las 19:38:51
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `casamiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) DEFAULT NULL,
  `subtitulo` varchar(250) DEFAULT NULL,
  `cuerpo` varchar(250) DEFAULT NULL,
  `img_id` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id`, `titulo`, `subtitulo`, `cuerpo`, `img_id`) VALUES
(1, 'La Fiesta de Casamiento', 'Se realizara el dia 29/10/2022 a las 17 hs en Estancia La Linda.', 'La ceremonia comienza puntual, por lo que solicita llegar temprano.', ''),
(2, 'El Civil', 'Se realizara el dia 27/10/2022 a las 12 hs en san Isidro.', 'La ceremonia comienza puntual, por lo que solicita llegar temprano y con barbijo.', ''),
(3, 'SAVE THE DATE!', 'Se enviaron tarjetas invitacion fiesta y civil.', 'Falta aun gente a confirmar.', NULL),
(4, 'Buscar Traje Tintoreria', 'Tintoreria El Craftus, en la calle Libertador 6655.', 'Se realizó el pago de la preseña.', 'rx9yp9tnjajrgakpppu5'),
(6, 'Estamos eligiendo la música para bailar', 'Armamos la seleccion en conjunto con el DJ de CAMISANI!', 'Y ya tenemos una preselección de playlists de Spotify.', 'dlmsphw8jv5aiwcuqdfw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'franciscotiphaine@gmail.com', '347442e3e43213c09ff3f36f39cc856b'),
(2, 'franciscotiphaine@hotmail.com', 'd2b5a601e2d39c856c8909c74ea31092'),
(3, 'francis@gmail.com', 'f3b7e5d3eb074cde5b76e26bc0fb5776');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
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
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
