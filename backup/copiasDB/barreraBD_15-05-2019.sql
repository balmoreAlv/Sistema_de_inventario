DROP TABLE IF EXISTS cliente; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dui` varchar(10) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO cliente VALUES('1','&','&','','','','');
INSERT INTO cliente VALUES('2','fernado','antonio','20220121-2','2012-1212','Zacatecoluca','dar@gmail.com');
INSERT INTO cliente VALUES('3','CARLOS','RAMIREZ','20212102-1','7878-8888','Santa Ana','ramir@gmail.com');
INSERT INTO cliente VALUES('5','andrea','LINARES','05189789-5','7895-6458','san salvador','andrea@gmail.com');
INSERT INTO cliente VALUES('6','tere','MOLINA','85421452-1','7877-2534','San salvador','vanessa@gmail.com');
INSERT INTO cliente VALUES('8','Jose','MENJIVAR','85421453-2','7895-4215','San Salvador','jose@gmail.com');
INSERT INTO cliente VALUES('9','erick','MEJIA','','2225-6366','san salvador','erick@gmail');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS compra; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `fechacompra` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`,`idproveedor`,`usuario_idusuario`),
  KEY `fk_compra_proveedor1_idx` (`idproveedor`),
  KEY `fk_compra_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_compra_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO compra VALUES('1','2018-11-15','Finalizada','5','1');
INSERT INTO compra VALUES('2','2018-11-17','Finalizada','5','1');
INSERT INTO compra VALUES('3','2018-12-01','En Proceso','4','1');
INSERT INTO compra VALUES('4','2018-12-01','Finalizada','7','1');
INSERT INTO compra VALUES('5','2018-12-01','Finalizada','4','1');
INSERT INTO compra VALUES('6','2018-12-01','Finalizada','6','1');
INSERT INTO compra VALUES('7','2018-12-08','En Proceso','5','1');
INSERT INTO compra VALUES('8','2018-12-08','En Proceso','6','1');
INSERT INTO compra VALUES('9','2018-12-08','En Proceso','6','1');
INSERT INTO compra VALUES('10','2018-12-08','En Proceso','1','1');
INSERT INTO compra VALUES('11','2019-02-13','Finalizada','6','1');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS detallecompra; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `detallecompra` (
  `iddetallecompra` int(11) NOT NULL AUTO_INCREMENT,
  `fechav` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  PRIMARY KEY (`iddetallecompra`),
  KEY `producto_ibfk_1` (`idproducto`),
  KEY `compra_ibfk_1` (`idcompra`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO detallecompra VALUES('1','2018-11-15','1','1.85','1.85','1','5');
INSERT INTO detallecompra VALUES('2','2018-11-17','8','1.75','14.00','2','6');
INSERT INTO detallecompra VALUES('3','2018-12-01','478','2.00','956.00','3','5');
INSERT INTO detallecompra VALUES('4','2018-12-01','4','3.00','12.00','4','6');
INSERT INTO detallecompra VALUES('5','2018-12-01','100','0.25','25.00','5','7');
INSERT INTO detallecompra VALUES('6','2018-12-21','15','0.25','3.75','6','7');
INSERT INTO detallecompra VALUES('7','2018-12-21','35','0.20','7.00','7','8');
INSERT INTO detallecompra VALUES('8','2018-12-21','25','0.20','5.00','8','8');
INSERT INTO detallecompra VALUES('9','2018-12-08','25','5.00','125.00','9','9');
INSERT INTO detallecompra VALUES('10','2018-12-08','10','250.00','2500.00','10','10');
INSERT INTO detallecompra VALUES('11','2019-02-21','10','1.75','17.50','11','10');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS detalleventa; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `detalleventa` (
  `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  PRIMARY KEY (`iddetalleventa`),
  KEY `venta_ibfk_1` (`idventa`),
  KEY `producto_ibfk_2` (`idproducto`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO detalleventa VALUES('1','2','2.00','4.00','2','5');
INSERT INTO detalleventa VALUES('2','2','2.00','4.00','3','5');
INSERT INTO detalleventa VALUES('3','1','2.00','2.00','4','5');
INSERT INTO detalleventa VALUES('4','1','2.00','2.00','5','5');
INSERT INTO detalleventa VALUES('5','1','2.00','2.00','6','5');
INSERT INTO detalleventa VALUES('6','2','2.00','4.00','7','5');
INSERT INTO detalleventa VALUES('7','3','2.00','6.00','8','5');
INSERT INTO detalleventa VALUES('8','2','2.00','4.00','9','5');
INSERT INTO detalleventa VALUES('9','5','2.00','9.00','12','5');
INSERT INTO detalleventa VALUES('10','1','1.85','1.85','13','5');
INSERT INTO detalleventa VALUES('11','10','0.25','2.50','14','7');
INSERT INTO detalleventa VALUES('12','10','0.20','2.00','15','8');
INSERT INTO detalleventa VALUES('13','1','5.00','5.00','16','9');
INSERT INTO detalleventa VALUES('14','1','250.00','250.00','17','10');
INSERT INTO detalleventa VALUES('15','5','1.75','8.75','18','10');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS modulos; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `modulos` (
  `idmodulos` int(11) NOT NULL AUTO_INCREMENT,
  `inicio1` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inicio2` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inicio3` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `compra` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inventario` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `evento` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `restaurante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contacto` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `venta` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `reporte` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `configuracion` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `admin` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idtipousuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodulos`),
  KEY `fk_id` (`idtipousuario`),
  CONSTRAINT `fk_id` FOREIGN KEY (`idtipousuario`) REFERENCES `tipousuario` (`idtipousuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO modulos VALUES('1','1','1','1','1','1','1','1','1','1','1','1','1','1');
INSERT INTO modulos VALUES('2','1','1','1','1','1','1','1','1','1','1','1','1','2');
INSERT INTO modulos VALUES('3','','','','','','','','','','','','','3');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS perfil; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerestaurante` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `telefonos` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `correoelectronico` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `logo` longblob NOT NULL,
  `favicon` longblob NOT NULL,
  `imgenusers` longblob NOT NULL,
  `color` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO perfil VALUES('1','Sistema de Inventario y Facturacion','2020-2020','inventario_facturacion@gmail.com','Zacatecoluca','La Paz','����\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n��\0C\0\n\n\n
n���î��ٽe�՚��rE�c#��p\n6����hl��Lbm򬵈����n@�A˃e\0�Ty�ٕ�9�*U�nea��S�N%*\0lj��,r�S�,�_��C��SC��-��@qa��]����2{�u�Y8Ş���<(ڙ�9�Jw��PY�V���n���}FB(���H��_�8�C�� �,�Q��P@g�|E/��S�P
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS producto; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(350) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `preciounitario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fechav` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `idtipoproductos` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`,`idtipoproductos`),
  KEY `fk_producto_tipoproducto_idx` (`idtipoproductos`),
  CONSTRAINT `fk_producto_tipoproducto` FOREIGN KEY (`idtipoproductos`) REFERENCES `tipoproducto` (`idtipoproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO producto VALUES('1','carne azada','arroz,chimol','97','3.00','291.00','2016-12-16','Activo','1');
INSERT INTO producto VALUES('2','pollo','de arroz','29','4.00','116.00','2016-12-15','Activo','1');
INSERT INTO producto VALUES('3','conejo','arroz','27','6.00','162.00','2016-12-16','Activo','1');
INSERT INTO producto VALUES('5','soda','coca cola','484','2.00','968.00','2018-12-01','Activo','2');
INSERT INTO producto VALUES('6','fabuloso','desinfectante','12','3.00','36.00','2018-12-01','Activo','3');
INSERT INTO producto VALUES('7','manzanas','verdes','105','0.25','26.25','2018-12-21','Activo','4');
INSERT INTO producto VALUES('8','Peras','verdes y grandes','50','0.20','10.00','2018-12-21','Activo','4');
INSERT INTO producto VALUES('9','carne de cerdo','carne fresca','24','5.00','120.00','2018-12-08','Activo','5');
INSERT INTO producto VALUES('10','refri','refri linea blanca','14','1.75','24.50','2019-02-21','Activo','6');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS proveedor; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `nombrecontacto` varchar(45) NOT NULL,
  `telefonocontacto` varchar(15) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `razon` varchar(300) NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO proveedor VALUES('1','Empresa','coigo','2021-2121','empresa@gmail.com','sgdfgd','fer','2021-2102','Activo','2016-12-11','Activo Correctamente');
INSERT INTO proveedor VALUES('2','','','','','','Martind','2021-2102','Activo','2016-12-15','Activo Correctamente');
INSERT INTO proveedor VALUES('3','Carnes frescas','89788','7896-3214','carnesfrescas@gmail.com','Carretera a san vicente','Sandra nochez','7412-4536','2018-12-08','0000-00-00','dsddsf');
INSERT INTO proveedor VALUES('4','Productos Frescos','89788','7879-7475','productosfrescos@gmail.com','Carretera a Chalatenango','Noe Aragon','7974-5213','Activo','2018-12-08','dsddsf');
INSERT INTO proveedor VALUES('5','La constancia','89788','7982-5412','laconstancia@gmail.com','Carretera a Sonsonate, El Salvador','Maricela Nochez','7845-9621','Activo','2018-12-08','dsddsf');
INSERT INTO proveedor VALUES('6','Selectos','1111','7999-9999','selectos@gmail.com','San Salvador, calle poniente al Banco Central','Magaly Mena','2333-3333','Activo','2018-11-14','Activo Correctamente');
INSERT INTO proveedor VALUES('7','Diana','54545','7777-7777','diana@gmail.com','Carretera a Santa Ana','Luis Saldaña','7788-8888','Activo','2018-11-14','incumplimiento
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS tipoproducto; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `tipoproducto` (
  `idtipoproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO tipoproducto VALUES('1','comida');
INSERT INTO tipoproducto VALUES('2','bebida');
INSERT INTO tipoproducto VALUES('3','limpiezaaa');
INSERT INTO tipoproducto VALUES('4','frutas');
INSERT INTO tipoproducto VALUES('5','embutidos');
INSERT INTO tipoproducto VALUES('6','electrodomesticos');
INSERT INTO tipoproducto VALUES('7','golocinas');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS tipousuario; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tipousuario VALUES('1','administrador');
INSERT INTO tipousuario VALUES('2','usuario');
INSERT INTO tipousuario VALUES('3','estudiante');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS usuario; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `intentos` int(11) NOT NULL,
  `bloqueado` int(11) NOT NULL,
  `pregunta` varchar(75) NOT NULL,
  `respuesta` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `razon` varchar(200) NOT NULL,
  `idtipousuarios` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idtipousuarios`),
  KEY `fk_usuario_tipousuario1_idx` (`idtipousuarios`),
  CONSTRAINT `fk_usuario_tipousuario1` FOREIGN KEY (`idtipousuarios`) REFERENCES `tipousuario` (`idtipousuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO usuario VALUES('1','francisco','viscarra','Visc44@hotmail.com','francisco','827ccb0eea8a706c4c34a16891f84e7b','0','0','Su nombre','yoselin','Activo','Activo Correctamente','1');
INSERT INTO usuario VALUES('2','darwin','flores','darwin@gmail.com','darwin','827ccb0eea8a706c4c34a16891f84e7b','0','0','darwin','darwin','Activo','Activado Correctamente','2');
INSERT INTO usuario VALUES('3','Yasmin','Rivas','rivasjazmin@gmail.com','yazz','hobi94','1','0','nombre de su bias?','hoseok','Activo','Activado Correctamente','1');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS venta; SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `fechaventa` date NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `cliente_ibfk_1` (`idcliente`),
  KEY `usuario_ibfk_1` (`idusuario`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

INSERT INTO venta VALUES('1','2018-11-18','2','1');
INSERT INTO venta VALUES('2','2018-11-18','5','1');
INSERT INTO venta VALUES('3','2018-11-18','2','1');
INSERT INTO venta VALUES('4','2018-11-18','1','1');
INSERT INTO venta VALUES('5','2018-11-18','5','1');
INSERT INTO venta VALUES('6','2018-11-18','5','1');
INSERT INTO venta VALUES('7','2018-11-18','2','1');
INSERT INTO venta VALUES('8','2018-11-18','5','1');
INSERT INTO venta VALUES('9','2018-11-18','5','1');
INSERT INTO venta VALUES('10','2018-11-18','3','1');
INSERT INTO venta VALUES('11','2018-11-18','3','1');
INSERT INTO venta VALUES('12','2018-11-18','3','1');
INSERT INTO venta VALUES('13','2018-11-18','1','1');
INSERT INTO venta VALUES('14','2018-12-01','6','1');
INSERT INTO venta VALUES('15','2018-12-08','3','1');
INSERT INTO venta VALUES('16','2018-12-08','5','1');
INSERT INTO venta VALUES('17','2018-12-08','6','1');
INSERT INTO venta VALUES('18','2019-02-13','9','1');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS ver_cliente; SET FOREIGN_KEY_CHECKS=0;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_cliente` AS select `cliente`.`idcliente` AS `idcliente`,`cliente`.`nombre` AS `nombre`,`cliente`.`apellido` AS `apellido`,`cliente`.`dui` AS `dui`,`cliente`.`telefono` AS `telefono`,`cliente`.`direccion` AS `direccion`,`cliente`.`email` AS `email` from `cliente`;

INSERT INTO ver_cliente VALUES('1','&','&','','','','');
INSERT INTO ver_cliente VALUES('2','fernado','antonio','20220121-2','2012-1212','Zacatecoluca','dar@gmail.com');
INSERT INTO ver_cliente VALUES('3','CARLOS','RAMIREZ','20212102-1','7878-8888','Santa Ana','ramir@gmail.com');
INSERT INTO ver_cliente VALUES('5','andrea','LINARES','05189789-5','7895-6458','san salvador','andrea@gmail.com');
INSERT INTO ver_cliente VALUES('6','tere','MOLINA','85421452-1','7877-2534','San salvador','vanessa@gmail.com');
INSERT INTO ver_cliente VALUES('8','Jose','MENJIVAR','85421453-2','7895-4215','San Salvador','jose@gmail.com');
INSERT INTO ver_cliente VALUES('9','erick','MEJIA','','2225-6366','san salvador','erick@gmail');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS ver_producto; SET FOREIGN_KEY_CHECKS=0;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_producto` AS select `producto`.`idproducto` AS `idproducto`,`producto`.`nombre` AS `nombre`,`producto`.`descripcion` AS `descripcion`,`producto`.`cantidad` AS `cantidad`,`producto`.`preciounitario` AS `preciounitario`,`producto`.`total` AS `total`,`producto`.`fechav` AS `fechav`,`producto`.`estado` AS `estado`,`producto`.`idtipoproductos` AS `idtipoproductos`,`tipoproducto`.`nombre` AS `nombretipo` from (`producto` join `tipoproducto` on((`producto`.`idtipoproductos` = `tipoproducto`.`idtipoproducto`)));

INSERT INTO ver_producto VALUES('1','carne azada','arroz,chimol','97','3.00','291.00','2016-12-16','Activo','1','comida');
INSERT INTO ver_producto VALUES('2','pollo','de arroz','29','4.00','116.00','2016-12-15','Activo','1','comida');
INSERT INTO ver_producto VALUES('3','conejo','arroz','27','6.00','162.00','2016-12-16','Activo','1','comida');
INSERT INTO ver_producto VALUES('5','soda','coca cola','484','2.00','968.00','2018-12-01','Activo','2','bebida');
INSERT INTO ver_producto VALUES('6','fabuloso','desinfectante','12','3.00','36.00','2018-12-01','Activo','3','limpiezaaa');
INSERT INTO ver_producto VALUES('7','manzanas','verdes','105','0.25','26.25','2018-12-21','Activo','4','frutas');
INSERT INTO ver_producto VALUES('8','Peras','verdes y grandes','50','0.20','10.00','2018-12-21','Activo','4','frutas');
INSERT INTO ver_producto VALUES('9','carne de cerdo','carne fresca','24','5.00','120.00','2018-12-08','Activo','5','embutidos');
INSERT INTO ver_producto VALUES('10','refri','refri linea blanca','14','1.75','24.50','2019-02-21','Activo','6','electrodomesticos');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS ver_proveedor; SET FOREIGN_KEY_CHECKS=0;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_proveedor` AS select `proveedor`.`idproveedor` AS `idproveedor`,`proveedor`.`nombre` AS `nombre`,`proveedor`.`codigo` AS `codigo`,`proveedor`.`telefono` AS `telefono`,`proveedor`.`email` AS `email`,`proveedor`.`direccion` AS `direccion`,`proveedor`.`nombrecontacto` AS `nombrecontacto`,`proveedor`.`telefonocontacto` AS `telefonocontacto`,`proveedor`.`estado` AS `estado`,`proveedor`.`fecha` AS `fecha`,`proveedor`.`razon` AS `razon` from `proveedor`;

INSERT INTO ver_proveedor VALUES('1','Empresa','coigo','2021-2121','empresa@gmail.com','sgdfgd','fer','2021-2102','Activo','2016-12-11','Activo Correctamente');
INSERT INTO ver_proveedor VALUES('2','','','','','','Martind','2021-2102','Activo','2016-12-15','Activo Correctamente');
INSERT INTO ver_proveedor VALUES('3','Carnes frescas','89788','7896-3214','carnesfrescas@gmail.com','Carretera a san vicente','Sandra nochez','7412-4536','2018-12-08','0000-00-00','dsddsf');
INSERT INTO ver_proveedor VALUES('4','Productos Frescos','89788','7879-7475','productosfrescos@gmail.com','Carretera a Chalatenango','Noe Aragon','7974-5213','Activo','2018-12-08','dsddsf');
INSERT INTO ver_proveedor VALUES('5','La constancia','89788','7982-5412','laconstancia@gmail.com','Carretera a Sonsonate, El Salvador','Maricela Nochez','7845-9621','Activo','2018-12-08','dsddsf');
INSERT INTO ver_proveedor VALUES('6','Selectos','1111','7999-9999','selectos@gmail.com','San Salvador, calle poniente al Banco Central','Magaly Mena','2333-3333','Activo','2018-11-14','Activo Correctamente');
INSERT INTO ver_proveedor VALUES('7','Diana','54545','7777-7777','diana@gmail.com','Carretera a Santa Ana','Luis Saldaña','7788-8888','Activo','2018-11-14','incumplimiento
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS ver_tipoproducto; SET FOREIGN_KEY_CHECKS=0;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_tipoproducto` AS select `tipoproducto`.`idtipoproducto` AS `idtipoproducto`,`tipoproducto`.`nombre` AS `nombre` from `tipoproducto`;

INSERT INTO ver_tipoproducto VALUES('1','comida');
INSERT INTO ver_tipoproducto VALUES('2','bebida');
INSERT INTO ver_tipoproducto VALUES('3','limpiezaaa');
INSERT INTO ver_tipoproducto VALUES('4','frutas');
INSERT INTO ver_tipoproducto VALUES('5','embutidos');
INSERT INTO ver_tipoproducto VALUES('6','electrodomesticos');
INSERT INTO ver_tipoproducto VALUES('7','golocinas');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS ver_tipousuario; SET FOREIGN_KEY_CHECKS=0;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_tipousuario` AS select `tipousuario`.`idtipousuario` AS `idtipousuario`,`tipousuario`.`nombre` AS `nombre` from `tipousuario`;

INSERT INTO ver_tipousuario VALUES('1','administrador');
INSERT INTO ver_tipousuario VALUES('2','usuario');
INSERT INTO ver_tipousuario VALUES('3','estudiante');
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS ver_usuario; SET FOREIGN_KEY_CHECKS=0;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_usuario` AS select `usuario`.`idusuario` AS `idusuario`,`usuario`.`nombre` AS `nombre`,`usuario`.`apellido` AS `apellido`,`usuario`.`email` AS `email`,`usuario`.`usuario` AS `usuario`,`usuario`.`clave` AS `clave`,`usuario`.`intentos` AS `intentos`,`usuario`.`bloqueado` AS `bloqueado`,`usuario`.`pregunta` AS `pregunta`,`usuario`.`respuesta` AS `respuesta`,`usuario`.`estado` AS `estado`,`usuario`.`razon` AS `razon`,`usuario`.`idtipousuarios` AS `idtipousuarios`,`tipousuario`.`nombre` AS `nombretipo` from (`usuario` join `tipousuario` on((`usuario`.`idtipousuarios` = `tipousuario`.`idtipousuario`)));

INSERT INTO ver_usuario VALUES('1','francisco','viscarra','Visc44@hotmail.com','francisco','827ccb0eea8a706c4c34a16891f84e7b','0','0','Su nombre','yoselin','Activo','Activo Correctamente','1','administrador');
INSERT INTO ver_usuario VALUES('3','Yasmin','Rivas','rivasjazmin@gmail.com','yazz','hobi94','1','0','nombre de su bias?','hoseok','Activo','Activado Correctamente','1','administrador');
INSERT INTO ver_usuario VALUES('2','darwin','flores','darwin@gmail.com','darwin','827ccb0eea8a706c4c34a16891f84e7b','0','0','darwin','darwin','Activo','Activado Correctamente','2','usuario');
SET FOREIGN_KEY_CHECKS=1;
