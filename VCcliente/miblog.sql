-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-12-2020 a las 13:08:36
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `miblog`
--
CREATE DATABASE IF NOT EXISTS `miblog` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `miblog`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

DROP TABLE IF EXISTS `articulo`;
CREATE TABLE IF NOT EXISTS `articulo` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) NOT NULL,
  `resumen` varchar(500) NOT NULL,
  `contenido` mediumtext NOT NULL,
  `imagen` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_articulo`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id_articulo`, `titulo`, `resumen`, `contenido`, `imagen`, `fecha`, `fecha_mod`, `id_categoria`) VALUES
(1, 'Las raspas del calzoncillo', 'Un corta disertación del origen de esas manchas que aparecen en la ropa interior y las posibles soluciones a las vergüenzas que provocan.\r\n', 'Conocidos es por todos la existencia de este problema entre personas de aseo debil, ya sea por falta de elementos de higienización, descuido o por simple vagancia, y cuyo origen son los fluidos expelidos por el cuerpo humano ya sean en forma líquida o sólida, y que van dejando su rastro allá por donde pasan.\r\nNo podemos circunscribirnos únicamente a los caballeros en este ámbito, sino que es un problema igualmente común entre las damas, aunque eso sí, se considera un tema más tabú. \r\nTampoco nos podemos centrar en un único origen, a pesar de que, mencionado el tema, nos asalta rápidamente la imagen de ese churrete marrón que adorna la prenda cual cuadro renacentista y cuyo perfume acompaña al portados allá donde vaya. Debemos ser justos y considerar en este escenarios la presencia de esas gotas resultado de la micción, y que amarillean la prenda con nefastas consecuencias. Esta es una segunda causa, pero hay más. Aquellas pesonas cuya actividad física o complexión, provocan sudor, teniendo en cuenta lo cerrado y ajustado de la zona hace que ese sudor impregne la ropa y acabe amarillenadola.\r\nPor orden de facilidad de  limpieza, debemos advertir que los restos oríneos son sencillos de eliminar. Sin embargo la facilidad de expulsión del excremento es inversamente proporcional al tiempo transcurrido desde la eyección. En la misma línea, las manchas sodóreas son infatigables ante la maquina de lavar.\r\nSin embargo, no es esta únicamente la causa de estos vulgarmente conocidos como \"frenazos\", ya que el uso de determinados productos de limpieza pueden acabar deteriorando y oscureciendo el color de la prenda.\r\nComo soluciones a este problema tan triste os recomendamos el uso asiduo de papel higiénico y los labados frecuentes. No menos importante es el uso de detergente y labadero que si bien no va a hacer más fáciles vuestras vidas, sí que permitirá mejor aceptación social.\r\nEn el próximo post: Suelo pélvico: ¿Por qué me meo?', 'raspas.jpg', '2020-11-19 00:00:00', NULL, 1),
(2, 'El olor corporal', 'En este post veremos algunos aspectos interesantes sobre los olores que desprende el cuerpo, cuales potenciar y cuales combatir.', 'El olor. Qué es el olor. Por qué algunas cosas huelen maravillosamente y otras prácticamente nos provocan el vómito. \r\nLa cuestión es que en realidad el olor no es más que un simple proceso orgánico y neuronal. Una serie de receptores químicos situados en las fosas nasales identifican diferentes tipos de sustancias y transmiten esa información al cerebro que la decodifica, interpreta y procesa, almacenándola y haciendo una comparación inmediata. Lo siguiente es más parecido a una base de datos. El cerebro coge la id de esa sustancia y nos saca la tabla con toda la información sobre la misma.\r\nUn ejemplo sencillo es el de esas cocinas de gas, cuando se ha apagado el fuego y el compuesto químico volátil sigue fluyendo e impregna el ambiente. Nuestras fosas nasales detectan el compuesto, una cadena de carbono simple, de las más simples que podemos encontrar, C<sub>4</sub>H<sub>10</sub>, el butano, y lo identifican. Esa información en nuestro cerebro es asociada inmediatamente con la tabla \'olor a butano\'. En esa tabla hay cosas importantes, como que es un gas potencialmente peligroso que puede explotar con facilidad en presencia de una chispa. Por eso el cotejo rápido de la información es tan importante, puesto que este dato es motivo de alarma y puede hacer correr peligro la integridad física del individuo y urge tener esos datos de forma inmediata para actuar rápidamente.\r\nAl margen de esta disertación, lo cierto es que esa cantidad de información que almacenamos pueden provocar en nosotros muy diversas reacciones. Algo que es mal oliente para una persona no tiene por que serlo para otra, y esto se debe a las sensaciones que evocan esos olores.\r\nNo en vano, los aromas son considerados elementos fuertemente evocadores de recuerdos.\r\nAhora bien, si bien es verdad que el mundo está lleno de sustancias que somos capaces de interpretar y reconocer, no menos cierto es que como elementos vivos desprendemos un sin fin de olores.\r\nSin ir más lejos, las axilas, eso que está a 20cm de nuestra nariz, son fuente de olor persistente. En nuestra defensa deberíamos decir que no somos culpables de ese perfume fétido, sino las bacterias que nos invaden y que en sus procesos químicos con nuestro sudor y hormonas generan este olor.\r\nPara combatirlos, la industria ha desarrollado una barbaridad de productos, como perfumes, antitranspirantes, colonias,...\r\nPero lo cierto es que esto, no deja de ser el producto de un sistema en el que lo que se busca es que los productos no tengan eficacia perpetua para mantener el interés y consiguientemente la producción y los beneficios. \r\nY aquí la pregunta es ¿Hay alguna solución sencilla y casera?\r\nPues sí, la hay: el bicarbonato.', 'olores.jpg', '2020-11-20 00:00:00', '2020-11-23 02:38:20', 1),
(94, 'titulo 0', 'x\r\n', 'x', 'f27ce3bbfa.jpg', '2017-07-21 04:54:30', '2020-11-30 14:18:45', 39),
(95, 'Título 1', 'Corresponde a resumen de titulo 1', 'Datos datos datos datos datos datos datos datos datos para título 1', 'e9c0bc8838.jpg', '2020-04-12 00:37:44', '2020-11-30 14:39:16', 42),
(97, 'Título 3', 'Corresponde a resumen de titulo 3', 'Datos datos datos datos datos datos datos datos datos para título 3', 'fd3dad13f8.jpg', '2017-12-18 08:47:41', '2020-11-30 20:36:48', 42),
(98, 'Título 4', 'Corresponde a resumen de titulo 4', 'Datos datos datos datos datos datos datos datos datos para título 4', '3214f91c92.jpg', '2017-10-25 22:28:57', NULL, 42),
(99, 'Título 5', 'Corresponde a resumen de titulo 5', 'Datos datos datos datos datos datos datos datos datos para título 5', '3214f91c92.jpg', '2018-03-29 23:59:42', NULL, 42),
(101, 'Título 7', 'Corresponde a resumen de titulo 7', 'Datos datos datos datos datos datos datos datos datos para título 7', '3214f91c92.jpg', '2019-03-28 20:52:48', NULL, 39),
(102, 'Título 8', 'Corresponde a resumen de titulo 8', 'Datos datos datos datos datos datos datos datos datos para título 8', '3214f91c92.jpg', '2019-01-11 07:26:20', NULL, 42),
(103, 'Título 9', 'Corresponde a resumen de titulo 9', 'Datos datos datos datos datos datos datos datos datos para título 9', '3214f91c92.jpg', '2017-07-02 05:30:00', NULL, 44),
(104, 'Título 10', 'Corresponde a resumen de titulo 10', 'Datos datos datos datos datos datos datos datos datos para título 10', '3214f91c92.jpg', '2020-01-20 12:23:39', NULL, 43),
(105, 'Título 11', 'Corresponde a resumen de titulo 11', 'Datos datos datos datos datos datos datos datos datos para título 11', '3214f91c92.jpg', '2017-07-08 01:05:24', NULL, 42),
(106, 'Título 12', 'Corresponde a resumen de titulo 12', 'Datos datos datos datos datos datos datos datos datos para título 12', '3214f91c92.jpg', '2016-06-15 20:53:40', NULL, 40),
(107, 'Título 13', 'Corresponde a resumen de titulo 13', 'Datos datos datos datos datos datos datos datos datos para título 13', '3214f91c92.jpg', '2019-12-06 02:27:58', NULL, 42),
(108, 'Título 14', 'Corresponde a resumen de titulo 14', 'Datos datos datos datos datos datos datos datos datos para título 14', '3214f91c92.jpg', '2017-10-29 18:36:02', NULL, 39),
(109, 'Título 15', 'Corresponde a resumen de titulo 15', 'Datos datos datos datos datos datos datos datos datos para título 15', '3214f91c92.jpg', '2019-01-21 10:05:33', NULL, 43),
(111, 'Título 17', 'Corresponde a resumen de titulo 17', 'Datos datos datos datos datos datos datos datos datos para título 17', '3214f91c92.jpg', '2016-06-14 19:28:03', NULL, 42),
(112, 'Título 18', 'Corresponde a resumen de titulo 18', 'Datos datos datos datos datos datos datos datos datos para título 18', '3214f91c92.jpg', '2020-03-17 13:54:05', NULL, 39),
(113, 'Título 19', 'Corresponde a resumen de titulo 19', 'Datos datos datos datos datos datos datos datos datos para título 19', '3214f91c92.jpg', '2017-03-10 02:00:45', NULL, 42),
(114, 'Título 20', 'Corresponde a resumen de titulo 20', 'Datos datos datos datos datos datos datos datos datos para título 20', '3214f91c92.jpg', '2016-10-02 12:54:59', NULL, 39),
(115, 'Título 21', 'Corresponde a resumen de titulo 21', 'Datos datos datos datos datos datos datos datos datos para título 21', '3214f91c92.jpg', '2016-09-11 20:16:47', NULL, 40),
(116, 'Título 22', 'Corresponde a resumen de titulo 22', 'Datos datos datos datos datos datos datos datos datos para título 22', '3214f91c92.jpg', '2018-01-03 06:14:49', NULL, 39),
(117, 'Título 23', 'Corresponde a resumen de titulo 23', 'Datos datos datos datos datos datos datos datos datos para título 23', '3214f91c92.jpg', '2017-09-08 03:24:45', NULL, 43),
(118, 'Título 24', 'Corresponde a resumen de titulo 24', 'Datos datos datos datos datos datos datos datos datos para título 24', '3214f91c92.jpg', '2018-01-11 09:03:17', NULL, 43),
(119, 'Título 25', 'Corresponde a resumen de titulo 25', 'Datos datos datos datos datos datos datos datos datos para título 25', '3214f91c92.jpg', '2017-01-09 02:57:01', NULL, 44),
(120, 'Título 26', 'Corresponde a resumen de titulo 26', 'Datos datos datos datos datos datos datos datos datos para título 26', '3214f91c92.jpg', '2019-06-11 21:28:56', NULL, 42),
(121, 'Título 27', 'Corresponde a resumen de titulo 27', 'Datos datos datos datos datos datos datos datos datos para título 27', '3214f91c92.jpg', '2018-11-22 08:59:01', NULL, 39),
(123, 'Título 29', 'Corresponde a resumen de titulo 29', 'Datos datos datos datos datos datos datos datos datos para título 29', '3214f91c92.jpg', '2019-06-23 01:14:16', NULL, 41),
(124, 'Título 30', 'Corresponde a resumen de titulo 30', 'Datos datos datos datos datos datos datos datos datos para título 30', '3214f91c92.jpg', '2016-06-14 16:31:11', NULL, 41),
(125, 'Título 31', 'Corresponde a resumen de titulo 31', 'Datos datos datos datos datos datos datos datos datos para título 31', '3214f91c92.jpg', '2018-03-10 19:18:38', NULL, 40),
(126, 'Título 32', 'Corresponde a resumen de titulo 32', 'Datos datos datos datos datos datos datos datos datos para título 32', '3214f91c92.jpg', '2017-04-09 23:56:43', NULL, 44),
(127, 'Título 33', 'Corresponde a resumen de titulo 33', 'Datos datos datos datos datos datos datos datos datos para título 33', '3214f91c92.jpg', '2018-05-15 17:22:14', NULL, 41),
(128, 'Título 34', 'Corresponde a resumen de titulo 34', 'Datos datos datos datos datos datos datos datos datos para título 34', '3214f91c92.jpg', '2017-09-04 11:58:25', NULL, 44),
(129, 'Título 35', 'Corresponde a resumen de titulo 35', 'Datos datos datos datos datos datos datos datos datos para título 35', '3214f91c92.jpg', '2018-04-17 19:45:21', NULL, 42),
(130, 'Título 36', 'Corresponde a resumen de titulo 36', 'Datos datos datos datos datos datos datos datos datos para título 36', '3214f91c92.jpg', '2020-04-15 07:14:20', NULL, 40),
(131, 'Título 37', 'Corresponde a resumen de titulo 37', 'Datos datos datos datos datos datos datos datos datos para título 37', '3214f91c92.jpg', '2016-09-24 14:35:16', NULL, 40),
(132, 'Título 38', 'Corresponde a resumen de titulo 38', 'Datos datos datos datos datos datos datos datos datos para título 38', '3214f91c92.jpg', '2017-06-07 10:37:53', NULL, 39),
(133, 'Título 39', 'Corresponde a resumen de titulo 39', 'Datos datos datos datos datos datos datos datos datos para título 39', '3214f91c92.jpg', '2017-03-04 00:03:51', NULL, 41),
(134, 'Título 40', 'Corresponde a resumen de titulo 40', 'Datos datos datos datos datos datos datos datos datos para título 40', '3214f91c92.jpg', '2020-02-23 21:25:01', NULL, 39),
(135, 'Título 41', 'Corresponde a resumen de titulo 41', 'Datos datos datos datos datos datos datos datos datos para título 41', '3214f91c92.jpg', '2020-06-27 11:21:58', NULL, 40),
(136, 'Título 42', 'Corresponde a resumen de titulo 42', 'Datos datos datos datos datos datos datos datos datos para título 42', '3214f91c92.jpg', '2016-12-09 14:16:13', NULL, 39),
(137, 'Título 43', 'Corresponde a resumen de titulo 43', 'Datos datos datos datos datos datos datos datos datos para título 43', '3214f91c92.jpg', '2017-06-01 23:23:10', NULL, 42),
(138, 'Título 44', 'Corresponde a resumen de titulo 44', 'Datos datos datos datos datos datos datos datos datos para título 44', '3214f91c92.jpg', '2016-04-14 11:40:18', NULL, 42),
(139, 'Título 45', 'Corresponde a resumen de titulo 45', 'Datos datos datos datos datos datos datos datos datos para título 45', '3214f91c92.jpg', '2017-08-18 23:25:53', NULL, 42),
(140, 'Título 46', 'Corresponde a resumen de titulo 46', 'Datos datos datos datos datos datos datos datos datos para título 46', '3214f91c92.jpg', '2019-06-17 19:33:14', NULL, 41),
(141, 'Título 47', 'Corresponde a resumen de titulo 47', 'Datos datos datos datos datos datos datos datos datos para título 47', '3214f91c92.jpg', '2018-05-08 01:46:57', NULL, 39),
(142, 'Título 48', 'Corresponde a resumen de titulo 48', 'Datos datos datos datos datos datos datos datos datos para título 48', '3214f91c92.jpg', '2016-05-31 06:12:50', NULL, 39),
(143, 'Título 49', 'Corresponde a resumen de titulo 49', 'Datos datos datos datos datos datos datos datos datos para título 49', '3214f91c92.jpg', '2018-07-23 10:13:34', NULL, 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cat`, `cat`) VALUES
(1, 'Higiene'),
(2, 'Electrónica'),
(34, 'Cuidado Personal'),
(35, 'Familia'),
(36, 'Examen'),
(39, 'Cat 0'),
(40, 'Cat 1'),
(41, 'Cat 2'),
(42, 'Cat 3'),
(43, 'Cat 4'),
(44, 'Cat 5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `passwd` varchar(30) NOT NULL,
  `rol` varchar(15) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `passwd`, `rol`) VALUES
(2, 'x', 'x@x.com', 'x', 'adm');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
