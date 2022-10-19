-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 05:01:51
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test_full_stack`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categorias` int(11) NOT NULL,
  `cat_nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categorias`, `cat_nombre`) VALUES
(1, 'Cooperaciones'),
(2, 'Lanzamiento de Productos\r\n'),
(3, 'Compras y Adquisiciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos`
--

CREATE TABLE `contenidos` (
  `id` int(11) NOT NULL,
  `id_paises` int(11) NOT NULL,
  `id_categorias` int(11) NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `referencias` varchar(120) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contenidos`
--

INSERT INTO `contenidos` (`id`, `id_paises`, `id_categorias`, `contenido`, `referencias`, `fecha_alta`) VALUES
(1, 1, 1, 'La empresa Body Health Group abrirá un centro de estética en pleno corazón de la\nciudad de Buenos Aires, con el que busca atender a más de 500 personas al día,\ngenerando empleo en Argentina y luchando contra la economía.', 'Leer mas en SteticNews.com', '2022-10-19 02:57:00'),
(2, 3, 2, 'Nueva adquisición: SteticABC acaba de anunciar un acuerdo para comprar\nSteticDEF con el objetivo de aumentar su presencia en el mercado alemán. El\nacuerdo se estima en alrededor de 2 millones de euros Lea más en SteticNews o\nNewsDaily', 'Leer mas en SteticNews.com and NewDaly.com', '2022-10-19 02:57:51'),
(3, 4, 3, 'La empresa Almalaser ha finalizado operaciones en Argentina, no ha podido\ncontinuar con sus labores dado que el mercado ha cambiado y no pudo competir\ncon la tecnología que están usando hoy en día los equipos, quedando atrás en el\nmercado.', 'Leer mas en NewDaly.com', '2022-10-19 02:58:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_paises` int(11) NOT NULL,
  `pai_nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_paises`, `pai_nombre`) VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Portugal'),
(4, 'Italia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categorias`);

--
-- Indices de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paises` (`id_paises`),
  ADD KEY `id_categorias` (`id_categorias`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_paises`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_paises` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD CONSTRAINT `contenidos_ibfk_1` FOREIGN KEY (`id_paises`) REFERENCES `paises` (`id_paises`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contenidos_ibfk_2` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
