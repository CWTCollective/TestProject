-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2021 at 06:49 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bajira`
--
DROP DATABASE IF EXISTS `bajira`;
CREATE DATABASE IF NOT EXISTS `bajira` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bajira`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `actualizaTicket`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizaTicket` (IN `pTipo` VARCHAR(2), IN `pDescripcion` TEXT, IN `pEstado` INT, IN `pResolucion` TEXT, IN `pNotas` TEXT, IN `pUsuarioEnd` VARCHAR(10), IN `pUsuarioNivel2` VARCHAR(10), IN `inID` DOUBLE, OUT `outHasError` INT)  MODIFIES SQL DATA
BEGIN
 DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET outHasError = 1;
 
  UPDATE bajira.ticket 
     SET Tipo = pTipo, Descripcion = pDescripcion, Estado = pEstado, Resolucion = pResolucion, Notas=pNotas
	 WHERE ticket.ID = inID;
 UPDATE bajira.ticket 
     SET FechaResolucion= Curdate()
	 WHERE Ticket.ID = inID AND ticket.estado = 4;

UPDATE bajira.ticket, bajira.usuario 
     SET ticket.UsuarioEnd = usuario.username
	 WHERE Ticket.ID = inID AND usuario.username= pUsuarioEnd;
	 	 
 
END$$

DROP PROCEDURE IF EXISTS `creaTicket`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `creaTicket` (IN `pTipo` VARCHAR(2), IN `pDescripcion` TEXT, IN `pEstado` INT, IN `pResolucion` TEXT, IN `pNotas` TEXT, IN `pUsuarioEnd` VARCHAR(10), IN `pUsuarioNivel2` VARCHAR(10), OUT `idAssigned` DOUBLE, OUT `outHasError` INT)  MODIFIES SQL DATA
BEGIN
 DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET outHasError = 1;
 
INSERT INTO bajira.ticket(`Tipo`, `Descripcion`, `Estado`, `Resolucion`, `Notas`, `FechaApertura`,`UsuarioEnd`, `UsuarioNivel2`) VALUES 
(pTipo,
 pDescripcion,
 pEstado,
 pResolucion,
 pNotas,
 CURDATE(),
 pUsuarioEnd,
 pUsuarioNivel2);
 
   -- Get last assigned identity value
	  set idAssigned = LAST_INSERT_ID();
 
END$$

DROP PROCEDURE IF EXISTS `creaUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `creaUsuario` (IN `pUserName` VARCHAR(10), IN `pNivel` INT, OUT `idAssigned` DOUBLE, OUT `outHasError` INT)  MODIFIES SQL DATA
BEGIN
 DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET outHasError = 1;
 
INSERT INTO bajira.usuario(`Username`, `Nivel`) VALUES 
(pUsername,
 pNivel);
 
   -- Get last assigned identity value
	  set idAssigned = LAST_INSERT_ID();
 
END$$

DROP PROCEDURE IF EXISTS `getUserLevel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserLevel` (IN `inUserName` VARCHAR(10), OUT `outLevel` INT, OUT `outHasError` INT)  READS SQL DATA
BEGIN
 
 Select usuario.Nivel
 INTO     outLevel     
 FROM bajira.usuario 
 Where usuario.UserName = inUserName ;

 
END$$

DROP PROCEDURE IF EXISTS `muestraMisTicketsEscalados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestraMisTicketsEscalados` (IN `inUsername` VARCHAR(10), OUT `outHasError` INT)  READS SQL DATA
BEGIN
 
 Select Ticket.ID, Tipo, Descripcion, Estado, Resolucion, 
	Notas, FechaApertura, FechaResolucion, UsuarioEnd, UsuarioNivel2
 
 FROM bajira.ticket, bajira.usuario 
WHERE ticket.Estado=2 AND UsuarioNivel2 = bajira.usuario.ID AND bajira.usuario.Username= inUsername;
 
 
END$$

DROP PROCEDURE IF EXISTS `muestraTicket`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestraTicket` (OUT `outID` INT, OUT `outTipo` VARCHAR(2), OUT `outDescripcion` TEXT, OUT `outEstado` INT, OUT `outResolucion` TEXT, OUT `outNotas` TEXT, OUT `outFechaApertura` DATE, OUT `outFechaResolucion` DATE, OUT `outUserNameEnd` VARCHAR(10), OUT `outUserNameNivel2` VARCHAR(10), OUT `outHasError` INT, IN `inID` DOUBLE)  READS SQL DATA
BEGIN
 
 Select ticket.ID, ticket.tipo, ticket.Descripcion, ticket.estado, ticket.resolucion, 
	ticket.notas, ticket.FechaApertura, ticket.FechaResolucion, ticket.usuarioEnd, ticket.usuarioNivel2
 INTO     outID, outTipo, outDescripcion, outEstado, outResolucion, outNotas , outFechaApertura,outFechaResolucion,
     outUserNameEnd, outUserNameNivel2
 
 FROM bajira.ticket 
 Where ticket.ID = inID ;

 
END$$

DROP PROCEDURE IF EXISTS `muestraTickets`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestraTickets` (OUT `outHasError` INT)  READS SQL DATA
BEGIN
 
 Select ID, tipo, Descripcion, estado, resolucion, 
	notas, FechaApertura, FechaResolucion, usuarioEnd, usuarionivel2
 
 FROM bajira.ticket ;
 

 
END$$

DROP PROCEDURE IF EXISTS `muestraTicketsEscalados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestraTicketsEscalados` (OUT `outHasError` INT)  READS SQL DATA
BEGIN
 
 Select ID, tipo, Descripcion, estado, resolucion, 
	notas, FechaApertura, FechaResolucion, usuarioEnd, usuarionivel2
 
 FROM bajira.ticket 
WHERE ticket.estado=2;
 

 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(2) NOT NULL,
  `Descripcion` text NOT NULL,
  `Estado` int(11) NOT NULL,
  `Resolucion` text NOT NULL,
  `Notas` text NOT NULL,
  `FechaApertura` date NOT NULL,
  `FechaResolucion` date NOT NULL,
  `UsuarioEnd` varchar(10) NOT NULL,
  `UsuarioNivel2` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ID`, `Tipo`, `Descripcion`, `Estado`, `Resolucion`, `Notas`, `FechaApertura`, `FechaResolucion`, `UsuarioEnd`, `UsuarioNivel2`) VALUES
(6, 'OP', 'El systema no arranca    ', 3, '', '', '2021-03-01', '0000-00-00', '6', 'nivel2-1'),
(7, 'SW', 'A las 8 de la maÃ±ana no podemos hacer el update porque no estamos aqui', 1, '', '', '2021-03-01', '0000-00-00', 'test4', ''),
(8, 'HW', 'A las 8 de la maÃ±ana no podemos hacer el update porque no estamos aqui', 1, '', '', '2021-03-01', '0000-00-00', 'nivel1-1', ''),
(9, 'HW', 'Se cayo una bebida en el teclado de la unidad 4 y ahora no funciona', 1, '', '', '2021-03-01', '0000-00-00', 'test4', '');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`ID`, `username`, `nivel`) VALUES
(2, 'nivel1-1', 2),
(3, 'nivel2-1', 3),
(5, 'badmin', 1),
(6, 'test4', 4),
(7, 'test5', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `username` (`ID`,`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
