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

INSERT INTO perfil VALUES('1','Sistema de Inventario y Facturacion','2020-2020','inventario_facturacion@gmail.com','Zacatecoluca','La Paz','ÿØÿà\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿÛ\0C\0\n\n\nÿÛ\0C		ÿÂ\0ÊÊ\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ú¤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Æâ>L>â|!÷káyO¸ëğô§ÛŠ$>Ô|_!öcã{Ï±kñåÇØ4øşÃì7Ç6dÓã8Ï´Ä}°ø3îÃQŸt>ŒûÆ¿Ú~ƒ]ò/Öåà\0\0\0\0\0\0\0\0>añYòRy÷û{Úî6N¹”rrtãœ¿ ©¢®óXóôİ‡Q}›]9kmÚ×ÓÙ»©¡³¤¹µ…ÑUÔ§ŸYèõ‡™ÇéÃËpısÎù:4?w|!öıwg`\0\0\0\0\0\0\0\0ä/ô¯4;=¶£kì¨¯X˜½eK«eÈº;èq˜ÛÍOf¬¾·Šé4åµR¼ùÖën.¾Ûâ*¥f$–91‹©Kbku—%æş‹çUİ|ïÚßı£Ekß\0\0$Î{ëÜ†QÒµp\0\0\0|{ç>‰çGg²×g{Z«g+eKëmbn¥Äçú­Üpòâ¿f=4ºí.w]K±\\¥t‘Ê‹îµŒÖ–U2)dM¾}ßp<œïÙ¿}•çí}È^ò\nstzƒƒÕÏ³jï6’êe6ùZ9Î»U‹«dØ\\ÖŠ–Ó²ÂàëÉ‡eÅõôI*véu}f²cA‰ÔEwYÆEÕà\\ÖéoÙRÓƒ³ãØğª®X×Y³†cM\\ŠíÁ»ÓìµÎ]TÕ*Òé‹ï²è]m-‰ºû/Œ–-Mœ7qÅWõòÿ\0dümöG·ô1ò ‰ù÷k©ÜTZdÇm.*¤’Ì‹ñä2&ÃÏÍÔå>_¶Ñù»ŞJşª¼Û4=µ•­©škv:Ü¢Şw}ó\'g.g;‡ÍGaë>5®æéú^Ì{ëûpcº/¥øyn†î®h+=óO}ÑÒÉ0Ê²Rè…n¶&Åk*«deK+dÍ8şÇ®ìä¾Âø÷ë9që@C4Pùëo¨Û×X_[«e_mõ¼¶õJİhš|Y†‡s¥£¹­m¯mT¨­ºİ»,y™¾¤ùrê§iÏ°èæî¼×Ô<7†ÇÔºşc¦Ó–5³_ôo&ş¾\\kònˆÇ·*Äbß<„7H,¥ÔM$¥c+#¬S*R²¯#Öòu½¼wÖ?&ıWæî}¤ä²;n4û\n‹]Õºâª—PV”°º‘ZdË…9f¶h|õò´st\\¢ºİ»,bùûèS³›ç-Ç®aÙpù®G¤ß¯>Éa®ìºjÏôŸ	“IÓËr)nEeg©¹6\'³Ü˜!ÊÆ™ÇksY[ê˜¹¿‘®ìã>¥ùgê?5uî@Y}°ùÒHŞoĞô’hö—´“YÑ§2v)µ³Mq¼Ÿ[7eT­ÕT¨TÖìx|ğèğ0ùÚwvdS,q2%†YkoF÷.ÿ\0¢xXï’îX¬š„WMRÍH˜,È¶f*äC‰•¶!¤¶d¶ÙcL—]ÉğvqPü½ôÿ\0™»÷p-ºÓçEgÑ]u¼««›Ü\\SÇ…›¬îÑ.ïU_7a]Æeß7gQfríÇ–®¦~[¨ª´¨goˆûwÑÏÌs½¨ß§“ÇŒó2ugšo¶ø;5÷ùø¹şëÆZ’½<ÑV[¡[ˆi5°‚ëä™ÇÄÊÃÎ1¢–›b×¦(rcL‡gÇğöpNüÃô§™¼ú\nV‡Î4?5è²´‰:ø¹\\¾J[Š­Ÿqf;ròñï÷^7°“Œº·¿·“…c=W.Øeõ:Œ¯˜ı:˜5œòôúğÎÅÀÖå§¢‹[~s™}%‹±³<:Œülÿ\0ác¾[÷óÁtÔ\"¬Ô„d[1e™8“8˜YPï×Y1d²³ÙãÛ<s8ü—eÉqvy·ÑŸ9ı	æo>”•¡ó·[æ}™úíå‡œj=¦¶ÕfÛò–•Ù•¶ïQçnºË¥um©wWÎõ~/ÖTxÏZºüü±Õò}¦›.|?6ĞòÖÜNóÍzMúı»3Â=Ö¿·¯Úáí}¿Šé©¿›é.D49cM%ÆnÜqnšØcËt¬ ‡\"ÈÎ%LÃÇöœog—ûÿ\0€{×š¼ú|\nV‡Îv_g™ôWìõ™Ûôlyİç?IÂgãåzZî¶¶õw]mJâÉÖUÙcnó°<·º´­]€JÌü	Æ.O¬ã:4üãƒÕ_RsŞ±§ñux_¢y«c»£I®²ªëîä¤Û¯¬»•¼ê-æèt±ó‘(¥ĞC¡°è#ç¢:(ùØ/ŒîtëÓêu°ìİg»ø_»ëÙôø­œì’/5è¤ÌÃÍÛ§7M·Õz.&±ßí¼œ•¶íºoR¦O}ç—–ô{M}Öø_eQ¯:‚Ìü¢\'f?1ê}÷¹©ó›¢½—îœ¿WÉÑÅj>¶ŞYÖ|_wÓlÃĞkç£Ñ)çƒĞ­óñŞÛöyñ]Ÿk‰ìûn‡ÄV}À>·îQğ½Ÿu…>Ïíw \nV‡Î‘áy÷½õ—ßôhÈ‡7\"æ£¯i^îN6çMŞª–Ş=®¿.·¿!­—“«9˜ÍJÀÎÁÉRG:_Í\\²ti¥ü^û=]õ<—[i[Àş{ş„~|gTQQúe³ÖlÀ\0\0\0\0H¹8x‡úÿ\0=Ks¥ö\'±İ§i><öµ’àeù	ë9z¤Ç)ówÒ~{We‹İè·|Şm©ï9¾®oOå:Îk“«/_½æòÃĞ°3°yú\"†g=]<899G#›%z4ëpwİ~‘èo]g[¨üÿ\0û÷á­˜i«¸COMÈÓ7#ôOe«ÚH\0\0\0\0\0‹K¿CÆ0ıÍËÓà{Ï+/>ÈÆŸ«š¾íŞ0zîÏW´9nGÜñj¬ü²_BÅæèó|NÂŒ¹ıi­×ŸuYæ¾}n­¸<¤åuWğ»_bè{4ùWØAÓÏ6~ŠÚºÉ8¾/(ÊñjÇ+ÖÖÖ£û¯‘=¦©^\"C¶¯9Ö]Ìä›úê2‹RU*\0\06æ3Å\'€dùÇ¯òNçAÕ™x\0•˜[†3Ììvq§k–:oMˆrx]~1ÇAØÄ|éåÿ\0_ëÏ—öŸGH|ıŸîÒ‰ô‡ÎZï¦c>Vê›O?ï÷{#™Êèf4»–Y‰²“(®U&+-·€\0\0´ñ­]5‡­ñ]?¡y¯DjpBv`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0B±ê9s‚’Q—åŸ“/\'îºÜr»ˆzÈu“Å*@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0gD8ÌNú‡İè‚—¸#’ÙîÉŠP\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\06\0\0\0\0\0\0\0\0 2!3#014\"$56@%&PAB€ÿÚ\0\0ÿ\0ÜîIi‘Ìbcs£˜EÂ(æ‡qñ‡qÑ‡qÑÇqÑÇqÑÇqÑ‡qñ‡qñ‡0Š9„QÌ\"cs£˜ÅÆ *„Sd¢şN1Ä_.£& éd@³,Ë\"ê<#‘ƒÌÁ‘á<g\"•)\'üœ3ªI	&…²!q¨†âR8”’Ø\'Rcu#q#q#ZF²,¬4˜Ğ¡´±°±Ã¸8gà8Îƒ+e‡ÖnQ?‘âZõWˆ@l½¤¤¤¤¤””¤‰Lƒ+ZV””””””””¤‚i šHÚHÛHÛHÚH[IÓTI%ÓE{˜wù#Ÿù\nµòWKèÒ»®hZåÒY—RûjşéŒwÃ?Èñÿ\0É„käÍoÖÀ„GnŸ]K?ÃW÷F;áäx†åµòd#Rt‹¡I;—Qu«éW÷F\0õÂ½n:–‰ÚÌå)@¤ÍYOy.|¿tˆØ¿ÈQ\\œE•`D#¯Ó¤³¿J¾•px}ûOªT´ÆKÒ”ê·Fà\'8	À‡Œ„y¢n(§SŞV:¦s2aXÕórš¢óUMJ<CZX:µm`åUÖÇz‹	áÉÛI9My!l¸Ùü‰õ°°kğš}K ³¾D%\nÇxğóökV„9&kgU_zLµHsXÖ5P%X%„¬M™ŞÂ¢ws(Ÿqšûr0äÒl*C/¸ê>Ì”Ãˆéq7-#H\"ŸA|“Œ¼<ı§œcşb–”š…ÅÅÅÅÁ(‚T±1½·ç¥F½§è‹Ä½š»r«ÏfÅCI¾e*ğñØâRf¢Ö£ §5Œ‰zÆ¡piõÒ4„ú|’ÑYú|/›şÏü£Ñ=™#	P¨ÓÖ¾ĞâÉ­ÖS¨;Ş4òŠ|ç)Ò™}2Y0é~-#H°Ò4\"ÀŒ.’Ìó­}xf«áÌŞö¿ìŸ’A&%ú±Ö®ÑŠ%J8q“y¨PÜ.£áä8â«ÂÇVtÜ¤˜QzØiF‘¤iBÀ‹\"è>šßĞÇ…ê½7}¯û#é•…ºˆÄ“ø=jíè|u(ÊÇIœì%MÅ±\\OœR(Uè™†£jI‹#HÒ,,4\"ÂÂÂÀ‹#é­ö˜ğ°ïDÍÏlû™õM…º®.Ä¥~µvƒª„¨2˜Q¡Ø°•^KÅJ¤ª«4’I#	!`IF‘¤XXE†‘aaa` y[:çi\nOû>kìWtUtÜ\\j($ÃËÔ¾µvåU†ÓÎº$áTR#ïIƒ—á\"‘¤XXXiE……† yX[#ÎÁá?é9¯µ]ÈV…!Zˆ\\j°npk	PRô§ä+´ò“©IäÁÑ\"¢ÄCf(0a¢ü‘al¬4\"ÂÂÂÀ’‚ô1\\öÇ„ß¥f®Õw†^Û=w#X7\n|o‚vá£wù*í©IbL8•¶ıqê¾¶™C«ßêĞ{Îib ™*9&#ú´D,-•…………………‚‚ºLXW½±á/éy«è¾ü‰íR.ù…É0rB^5m©$I±d¥¥#}}.¥Gš»qm:l÷pÔIpaÔà¸¼_RŒRáÇ‰³QÅÆú£áå<tü.Ê‘)qİˆ_ÂÂÂÂÂÂÂÙXB‚‚²1lŒXWı±á)ÿ\0mÌş‹ïÊOÜ i{ˆu$AV¹+dİ”ë…¡!–ù³Ã™¨ÁËmÁ/…r9è´?¸Í]µ¶£=õvRSS˜òb4ÆeÉœæÛGõŠâVâ¦2K„_–¶VBÂÂÂÀŠâÁAyZÂÂÀÅŠù|!á*¿-™ı2Ü¹yƒ[Ê4¶x…Nî&Õºmı#éL’œÈ)¬‚–È)-\n„”ìqš»\\„ÚÔ˜¶8&B£4¤¦3M)æ[u[¥;L¡FÔq¿/`D…²\"‚‚‚?S\"ÈÅ|¾\0ğ•]eµ½Ã2\n+AöÉ«:¦ÎItÒê\"M¢ë2šcH>„Há‹ğøyBCoqA†}l4² m m¤Cûr+‹\\XXXXX$ƒô\nBÁBÀÅ† ûqá!ülÌ9îı]gYUhNÉDL?1¢jM•’•×mt+´Äï¶0‰	~+ø‰Äó¨˜³QÃ|¤´b~XŠÀ“aaaaaak™XXµÅ¬_PD-a`yXb\"ü±	ó™˜sÜÉƒÜl’¯JÇÀLs5#ª3{ô«´Ä†·›8EX«q’\\ïÑK¡ÕÕL‘}E?•JE‚!a` ”…zú‚H_©¥\"Àır°\"‹íŒxHÜ30ç»”EX9%H)U9)å?)H-)è½‚å!˜D¤t«´òÄ“8:H’‹ì*Só°èÂ¥L‹¨E)úÔˆ†X–Xó$±æ)@±¡æCÌG>’<Ã(!”½ sÇÇ>9ããŸÈ x‚HçòAâ	#Ì2AU*K`ñ¡6¨ìÔ	?SÌÃ¾îQ»–%#ÑÄ|~–iîÔŞmZN–[…Ò®ÓËDâ©‘)–CÒ¨t„IÊ…\" ò34mRj?p\"é0y0`ÁƒÊ>#&ijõ0H5	=j9˜wİÊ7z„Ÿ¢ıŞ˜1Ù[Ñ]ô˜³5ô«´òuâ+t¥Ò¦ÆU—¼~bY±µ‰èA4ŠµAÆeóW‡6xsg‡6xswÇ7|swÇ7xsg‡6xsg‡5xsW‡4tsGG3ts7G3ts\'G2tsW&{á…aÊVf÷²õP‘Û{™t¡JB LtÙ3Ô}*í<ŒV©ç5NQã0H\"Nˆ³§Äá1EÃ4¹ô¿\'QF2Ã4¸8_}Á¾àâCƒˆpq÷?ÑÜäê(òmy6ˆ<™DL¢&Q’ècÉt1äºòUy*„ Ğ©ôŞ§½ì£áÓp¸Û‰ä\n€9\0äF@éd“åÉ¹!	$\'©]¦›Š#¢®ë¥¸8&{+\\•1úÇ¿³úéŸ¦ÿ\0¢’\\Š–!§A~,˜ó\"GöÈt©¿²÷8ä-ä6ß1Œ\ntu­+,ÕÚy0b½PnœÔI‰Ÿ	ê2à“¯,Š†1ïìşºgé¿À1T#[Ó0RãŠN•DTom ²~JY/Q\nÜ”Cv£Œ\'Ì‘‡ñAÕã½ö8Î·6™PÃ˜ŠmF­$‡ª²cSiì*´ºtÖª4Åv˜0y(VéH©š§·˜AË®ƒ\"Ôè“c¿\\!¤iF‘¤iE3ôßë¤ÒeN5	ªø³·¦?5§†wl¤œœG°UÙnLª™¬°ÜAï±Å8w³ƒpÙÇT¸ªÆjE!º\\S¥Ò 3ˆ®Ó6ZrcŠÕvT~“	NkY4Å•O)”uCÌ5Œmda.Ç\nc…1Â˜áLp¦8SÅÓ~{¥Ò~Ó¡Ü7Zğ¥I°x~¤‘$ˆÀ§¹]‹ÚB¬—8§)î¹5×Ÿ[R	E\nd·œ*Kë€Ô7’ë³¤¤¡·]e-Â’Ê©gÚ£~]JÜ³Æ‘,FÂrŞ°|FÃæ£‘2’	4 ·†8¨qMrÒ´‡-!ËHrÒ´‡-!„ª{´Íá¼7HnÁ¬k…şf!F¨„(ı)iÕQÚAX]¹‰<aXFP^xv ª\\äÆĞ\\t,ø8£‚‡Q­KÃ•ìÅğõÃpäj5%\0åšp9Ã¬^Õ=+­“Šæéİ#›¤stn‘ÍÒ9ºD<GÁ?LÄŒÔÚãÁN8ĞRÂd‚|€”ÅşM]­Øá´o:˜|^9ú2Z–‚Ò£+…DaAÊD7Aáúxf+1IF µ˜[†é…:`İ0n˜Äx¶DI|Y8¦ö”…Sã(\"Ç$‰eÒb¤.t‡a!Å6ÅMPÃ8ÚÀ\'L¦é„8amf£	0@¾JÓ­\'iíB‚ÖôìI‡ÄÔ)MïLùV´fÌ*\nŒ*˜³\n£º`èo:ÀğóâfDåÿ\0Mãğí’@AÀ–‚L‡’ÖƒÀd`ü?Aƒğé“Óxâàå×Áa÷ÁP š3¤Jp‚`,‚b¨2d	ß*­øjFc7h˜ÌÓÍ#˜Ã„Fÿ\0û3;BFì®!C\nÎJ£Ê¨œÊ³,ã©šó†\"NL¢ÿ\0bå´<Ş‡R‚·«gUmøs£UıbË\'	§C26ÔÃ›­®3±=4Ä¥8è•Sn ßµŸPbÓ\"ºE‡ İªtˆĞ  6iÓş½ÈˆXr ¸\n\n€d81Âpˆª0Ü¶M§ıˆX…ˆX¿÷ÿ\0ÿÄ\0/\0\0\0\0\0\0\0\0 !123QR\"0AqBp@a±ÿÚ\0?ş6—W‚Ş]Ùo.ì·—v[Ë»-íİ–ôîËywe¼»²ŞÙoOì·§ö[Óû-éı”3¾xæØ³sûçSusÙyòlNXÃK¨älÌhªÙ³²dL#‚Ù°|\"ÆŸ„ÿ\0ÆÀş\'ş(G\'Ø§gñDèn7ËÔ¼+S¨ÚwÍÚF*¶aKŠšM˜N{‰Ô¡&ÌjœÖ¼j­>™œu[ëšËÔÉkøÍdéä*×\\APZ£H£ÄÎ@­]wıûV^¦KSjÊöÍpFB¦f6¦Æ[Ì*ƒî{­]wıûV^¦JTP©b1œ–xqœG†W\'<|ª7²£GÂÄ«®ÿ\0¿jËÔÈ”¦ªXÃuoqG.ÍÂ¥e4Â·ÑÙ?òQEÏ¢c±Šİ3C›BÂ´Ä°úñ ĞÖÑZºïûÍ\\–^¨È¦L\"qNx\"¯Ğ\0›!kö‹öì¿`ï+}¥¡0‹œœà>iu§®ÿ\0¿jÍÔµ·@ë­²aŠò~iÕåHÒJ|Æ”jcŞjj£“h§¬ÿ\0¼¤Ü/³u@­Än·¾¯í|63#q``ÎÖÊ’¸uÑCs°”‘E$l/&‹eŠÙGâ¶Qø­”~+cŠØÇâ¶1ø­”~)ñÈĞƒ5 SôÍÒ¿Ë¯°I¶¤ j˜ÜÊøK]QÁ6¬é„ÆaÔñOæ>ñx`ÕZXîİañ[¬>*‘Ì³ş¨lĞ@I‰´UKA^šáMuZOæ>óØ×TíÈÖ½Ñ%0<\n=9²í¿Ò.‹ÕQõsœ«]U*Ñ\0NãïD>w=¸NHåŒ0¶ÑŸä±´šâGÔ4*DÑK+j·(™åWüŠ”\\Oı»ÿÄ\05\0\0\0\0\0\0\0\0 !13Q\"Rq02A4Bap#@‘±ÁÿÚ\0?şmdJğøú•áñõ+ÃãêPìøú•áQúŠ=ú•áñõ+¸GÔ®áR»„}Jîõ+¸GÔ®áRªi›s4üvğAÜ¤_]ÊûüqÀiaÀ‹k®å}ôw†a¦BàÛ±>®KnF¢oRlÒ[ŠÚ¿ª?Ô]³Uun´óş}§K\'ê·ºkšıí8®¿“÷ÄªF]äôÕPÌ’¬1\n¶…5pNˆH·×:3å6T„¾…Ül­ğkù:(ÿ\0VªÎf€¨í”«¸YG™òYÇ‚“ç6T–Ø+«á}Uü³í×TîÏ!:‚M›‘•®àl#<˜Qş^?`¯ÕÕĞÆ»“¢ö7\nD£ELû1”qÒÁ}É¬$îWwUwÅXªOË³Øc}îAĞPqa¸TÓ™w‡ršX¶­p+ïÌ»‘ê™Ù•2ò…×¾¸µ×	²œÅÈ_*ÏäËd\\\\ëª^C=°º¾#Eo è*š!¹@¸\'™ZØÅÉNˆ:=—Ñxd}Jğ¶z”öìê7–ÿ\0õ[û«‘õCßª^C=•ô4VòN‚¨İ¼·Ï‹4×é£ñGÉ\0÷Äa8ÎÆnRÇ³*˜ÿ\0AÚ.›8ÕòN‚©¹£Íe£/ëŒõÂ\'ehºíÕ.yÄ(íœ];võ4Î\09ª@Dc1QÈğÀ.¶¯ê¶¯ê¶¯ê¶¯ê¶Òz–ÚOQ[i=Km\'¨©j*\03º2=ÂÄè*ŸšP³g[iE°¼î;”ÎâìFÌß1Ş•ß9R¿1°à™òŒ^w*fÚT7.û?©wÉıJnÒ­l„	?Òª¢¦Âg]e8ŒÈ^l¹“šˆ)Ÿ(øÑ½Ì>UÜéní|m˜æO,.»]Ã÷Lù·şÊí±÷Cœ¶º\0“Á7‡Æ4Ñ”Êv±Ù†‰!”¼¸-„ƒô¬ÙPò›®ÔlwÑ6—©M…VşâÁÀ.ÿ\0ÿÄ\0E\0\0\0\0\0!1 2A‘’\"34@Qaq#0Brs±5RbCP‚¡¢²Á$Sc€ƒ“áÑÿÚ\0\0?ÿ\0¼ş’F3Ş4]f.0ºÌ\\au˜¸Âëq…Ö\"ã¬EÆX‹Œ.±]b.0ºÄ|atññ…ÓÇÄO]<|AtññÓÇÄO]<|auˆ¸Âëq…Ö\"ã¬EÆX‹Œ.±]b.0ºÌ\\au˜¸Âë1q…Öbã¬ÅÆA¨í\\Ëò‰.g‡Št“Êé{Ïn¨4L†wº\\™æ—û(9·ƒxí93vó`°Xiâ±ZËŠÅc¥‚Áj•ªV¡Z…j¨säDãÉ7éÚ@ü¬Ï‚Á`°X,pĞÁ`°X,‚Á`°Ò²#ú;KıÑëcnl‹Èı{LŞèúfª¹éØ›#ùı{NQäß¦aÛY›#ş/î>¢®4\\Ë‚½ËŠçqõyW“~™‡mflø¿¸éßr©:WGïF)§²ñ²Šç=şL+Ğdïw¿Í\\ØX<Ö¬mù!ÉÙy®®S\'øêºÎNÏ&’¯ûL7İÿ\0¨Ë”ÊÌ²£ÊDğx²åèä#ÁÁ]GÎa­™²?ãşã çwáÙà€uœôÑ÷h#fŞuQs½M«#”nÚfo–vh\n^ïĞŠŸ‘W[fÁ\\Xö¼+Ú{;sd~oşã¡\'ºsW¿ÕãzmO’èÜº2- Ğ9Ä’ºïËù‘z5^]õóVŸY£ñV£w<\nw,W8y…p ì­Í\0î.ú	=Ó˜z¶;ÔÅÇz{ÏDßñó¹õ½µLš=˜ôÉ[ªá^ÎÜÍÎ?]ùvSšr1p±¿4N¥æÏ:Š8#kœçsES,Í%–¶ñŞQÉcm«#Ù@eÄvvæwƒôåÙNl¢:UÖIog>#G³<{ÔÉr’åÒ‹/™®Ø²vÊçHâÊ9ÏÚ\'„7\nmQ×ó»;sMñ4ä¬ÔîÊ\"m`y­ŞÉCr/ŸT`ŞõÈ—X`Õ ¥/º!¬Pà;;se?@ù\"©ØÎvZ­õ¨®(rRÀ×\05¢kä…Í½ŞŒ\\‰™Ù;½È‚iÚI%€êö†ùæÊş/øĞ(ªö3Ì­´EıEtÔWGıEz6YÎ;+<óeŸ}4\n9¼;RO<Ïg:€5Ø®R,oŒI_stór—\nÙ½Ci‹‹|S£25önp›*‰Z*K‘¨i7R‡FXw}—V‹£;Âiì¬óÍ–üQôĞ)ŞyéUqÑkœ)SE†{Í°ZÁP†;PGZßµITË²ıŠ4Ñåª°\\æŒy¾k)’Ûœ^[q÷P¹ÁÚöS[3\\×0Ù»–WQJßæ¤pPÊÓO’g—egl´Ê>š;Ï;ó_¶ô½6:ÖÓ€7•s©ùŠ¾…^ÆŸ\\üš\'y´)?ÓG¦°n\nëUMĞ*K«nKÿ\0P2Ãîm*uê²:È;~iæ)-ŞòRšVàòjšËK}-omg(-Ú&yvVfËGê.¿jÅbvg£?±kàœÉd¬4 ª÷¦=ú­ZË\\..‘»Õ–¸îìÍĞ(¸Ú©îqGZñKİU‹ÿ\0öÑ}åhcâåWcïQ°ş¤o­b8Ô~]”fËG–‹Üæ4’q¢èÛ¹tmT+³Yuáó­w¾ Û­<\n­_Äµ¤ã+ZN2µäã)Öû[*óE¯õ+FFR·ĞŠ¨–Ï…ŠªÉ8#ºÀUnåsY¹j7rÕnå—gËG€Ñwa˜òxø®}–üÕd6¼hÙê4Ngf/‘üœu¼¢2vZ§´P\"È¡­(¬å üÍBF:Ó)š?.Ï–Ğ4]çŸË6\nªÑÛ¦‘Ì[‚©}ÈÄ	û»Ş(æ‰àr\0šÂí`ª0Qù*öl·áÿ\0ùç*à¹´%IJJúßDd†‘Ï1­ádfßµQÂÍw›!63”0Ä~k“ô€(IÄ\\›)d4,FåˆÜ±–#rÄn[7-‹¹l[Å±l[Å±l[™±V!íQlA¯ÃÃ6[ğ¿Î‹üóœãJFG”6*lÚ„9VGWºÜwÅ5±ÇÉ\nê–ÒšG<´Æ>vkYD-6s]ùJvWöcÌ¹Sîc%ey?’J9gÆ‹6\'Ù/—cŒ›TUÛzèìu²pUÏ—Sùè¿Ìé;Iåù;;áQ¹Aò”^ƒq¦‘Îæœ¢sæÚïFÇ(ºJ²6íïB#!}Ÿh÷ Æà.VZK#°fåƒ7,¹`ÍËnX3rÁ›–Ü°fåƒ7,¹`ÍËnX3rÁ›–Ü°fåƒ7,¹`ÍËnMŠ0\\ç\\ÕéºÌÜçïûÇ9ÌQ:Ui¡U}İr©Ò:¯}bÖ²[‚«~Ìl´ÿ\0œ¡_±ŸåÊ”\\ÿ\0²ù9Ê›¹8ßx¸æÉæÊ2(¥•Í½ÎğØ8WÚ3ÁÅÌ­{Eák¬V¹Zåk•®V±Y3İö|%Î¤šx/Ã`Ü¿ƒrü6ËğØ7/Ã`á_†ÁÂ¿ƒ…~\nü2ød+ğÈ8Wúl’(}Ñ¥\'¼sœÄªé\né’é’×W¸­bµŠ\0`4Î…Òİ…B¯Şİ_u8»-uøÔ\"FX\\×6«Ûy>Ó®¢æ6úS’{™¾Ôø_çÔdŸ	¿NÄÖœ§ü®Iò8qc®e,Ï\"¢ëX_·Ô1¢7H\\+ÍWäóğÿ\0õUÌ•£Æ2¹G:Œï];>e]<|aU®@é:BÀùBf6†½eq\'œêÙs‰åm%’_ìæûSáŸQ’|&ı;l“!¿ºâ˜~ômá··½H]3éP+ß¢7œíMFDâw æIÈ±®´Ö4`§ÉòŠ¡¬$í(¼Ùõ\ndÓrl1ÔŠ´¨`ÊÉ#v>Œ, 4‹Báä²œªHÚùyWƒ´Õº…±Ø¶i!ÿ\0õ®ÈÇ€[ÊNr:V÷4G°mB(ªZŞT¢4åMl«7kbnPCx_j|/óê2O„ß§`©^É®¡u$­ÊW‚Óq\nÈw8‘uz:my±(fŠ9ZÃ«OšÉšÌ0ã”1¯î5N¹9ÓCiEæÏ¨M{<xWhLûBWi¼Æ…”ûÃè²Ó$aå¶»É¹  sA,IlºRÛWş¤s¬¯;s´;j©>ª2Ôî›\0…½î¹27:Û‡rîY{	¼ÇOQ’Óı¦ı;ÎsQ±,.5ßî½uB|ˆNå¡t~ö†Xïù\n£tV*ÖÒMÊHmA°Ù9¤Œ	íû¶\"—<&€Òç6ÍÁDºşRåO	… £²‡1Ö›h^<–S\'$œ£Ş=ÊtS()WB†NÇ—>2ÚóHö‘Ì|Æošô0¾O.^•í„wÊ¥¹ë7*FÆF?HWœíÈ˜vÕş¡8úH®ì­=ÎĞÊß!ÎÙyw±Ä|•ÙVö.lÑ:«ŒOòrèGÉÁuY~AsòyæÕWÀ¼ÅĞ´y\\…Ç¾–Ê*Ç¸*2Oâ*åyP¦$#şg^tqX£7wr.q©>¡²0Şcw;kV+Å î¿;YùYe4ÌÑâ€õÂÃü+“G¹ufï*‘DØü‡©“%ŒY§µµUÖ‰>+o^ŞõûMëö›Ö2ï_´Ş¿i½{{ÖŞ„—5ÃÅJÙCÑØÈïOoå4ÍkdbªG¸ĞìÌğ¿×ì[ÍëÙŞ½ëÙŞ­Mow}WV‰uxø—@Î%Ñ3‰tlâZâ]8—DÎ%|â]^>%ÕcâV`Š8Ç^Îõìï^Îõ³zØ¶zéÇêÍ$›\\å“Ó[“¿3ÉÆ—~ô%I\'æuVª’sšm\0²™}²`æ*Ö•ù]İûÈÔÑ=˜Ù4Íi¦Ë†Ğö´ÈÇ›U\n«OŠæ…5ıã÷}W3z×%Æ³À«ápWE½z]ÁQğµŞasXø½ÇQt³q+ãs½óUÌ¥wïåuëU^Õ††©\\ë•ïL‡ıÿ\0ÿÄ\0+\0\0\0\0\0\0\0!1AQaq¡ ‘±Áğ0Ñ@áñP€ÿÚ\0\0?!ÿ\0Üı­Q÷o“êŸ\'Ñ>O¶|ÿ\0†0À	,yçyë #íŸ\'Õ>O«|Ÿvù>İò5„×²ı‚ÂLÕ*®,\'2ğy*j,Š”**Cèt:£ ËTÅsc§—Éš›¯ä±®şŞcÖbß Õ£l!”[ÃÌfliLÌx{£&ä“Ñú‡½¤6“wèô£7úØç† ˜s¨õ¦òOg„¥BûhâcŒq!Â8GqÂq	ŠiIÀğ8¨œövÄn¢S¡¬8z&Tmí*,BI$’|Êº1[	[ğª•\n’#)Ûº%Ÿi&dmì„Z	’I$“WŠ\"K‘ÕUT\"Fè‹ƒ·c$|{ÿ\0É±ííDvŸÃ.‡ bğ(¨Ø„;yÚ?qø„Pòfæ>”éõEıE;y¨ß­¿ÿ\0fÑtÉ¢If’(š¦M!ÀB™±î;gî1ç©ã“v—ÀiœÆU\')Î1M‰ğÈ¡Ò‚__ıÛ§ÀæÃ«ŸÀuêæÍWpÿ\0³\'|°¯Í˜<ør‘Şâ%râ÷’nAêÿ\0’×‰ÿ\0¡­»§ø\"NÖêˆBª¦@©¸¸*ª#¨Ä˜1.pÆw^n&F2ÊD &82—Í’2ô%â­ïjÔJd–¶àã É-¾Bw§¼ö¬écF¢»¥Ñt »-rLA%«lºK#´kÄÁ%$ÑTœ¨lE¢StW&ØØö!<^ú‡‘#¯ÙR‚(/ÍÚUq¢DïĞ\'„?™Ô’iÛd)åß‚ZœB)^bÚœÉ¹ÓoıË~$ÕŸxÌ†t\0hÂr ¤4j‘bv¢BBCj61}A—»À¯¨Øy‘4BLOÀw8¤x»!ŒVÙğ5)ÙE¸Vš|¢Œ±.=‡AÁ5.Øq2’Q\"P¨ ‚Ò¸J`tCr5WÔ¢àmàî¾ÇÈÂ$$@¨† Òp×àí†o²›B–…T3)IàÆJnÅ|:…ĞWàœuäk“Ó?4H$^\0´º©2dHq½õ=ßŸy}h@‚E¥}Ë\'ÇÛGhVÄìÑm;[Ä,„±É%ÎË’TY©Úx»	¬‘œ‘ãÖ‡&*h  2ÊVuV¡Péí¼àwƒDÄHŠI4*.óü Ë”,ì,8w.NíÛCIT˜Q6\'„!¸’¢T*DàMƒ¢•¨;º&Vßz;–e+‘†]BROejÏ‡´Çƒ¤nX-†©h§9µ€h$˜¥1uxØƒnÑIrj¬‰áE‡1QA—E@±RÕEDÆ‹ÀìÎíJKXccñdef/Ä‰§iC gKt=çÓ“súroNI\\Ì¹—Rj(´:\n©‡I®ÑPå cÏ¡Şº:™	±859Èœ5Ü‘/ğöÂwXv[$-«ŸÀ¯3wœ‘5înQ8+³ŠBS\0ådŠĞ¤cÈ–Ğ¸sy-‰y…EPj•IV\\ËUfAE7	\0~{#º\n‰{=€üÅ©\"RRÙ\"`óvb)$l=GúÔÈqood<„ÃECy#4wDà›BÌ-	)öNæ¾\"L8a@tú˜²ÜRbA‡u‡3¥C+E„šÄ„AP½ˆØ)ĞĞè,CE4^Ë3<ôx±İNğfÒœA¿’„ŞĞ-ï3®t!A­,9É	ÚeÍ‹ä÷=ú´ ©”Î#>â\\Q¹öğvÃ–™¤Á—ë‚E-®ëœ\"âê¶ÒMŞÿ\0r¥&¢#©z’´å‹\nºÉu+%ğ3èĞ^Ôl­½–ŒXJãKX……B´3Îwo~‚KhœµÓÔ[OSgÇ·î4†µYÏë2% HƒÏ\\HÌÌÿ\0`šı£»ÉaïØUíˆ<²\\$Zi¯f³ÌhZMGµ`Á‘x0Ü~æÄÑ)½†Õ—ı‰\"¹³ù&ü¯ÙXÂˆnjˆµàD–B‹PåÏÀ‡päÆ„!Zçor–¶Ù\\E™ivˆ	¡!i¶¤L±¡	ƒ–%˜‰\n(…àzBÖT‘sğ@â‘N#g¬ùG«ä›$\'5æÆÉ¼`Uf$âI·eHŠ¤–SSm8Â8ôƒOê	=)(Sp¨´Su$€Ã\neª	Y´M(Bálæ«Áƒ;¿¸†±?ÉSÒšœ€³&¼†.‡wb_‡¶£¼^ô#d…³a)C\\k#ÄB7íbI¬Éf Bå\"–ipğĞ‡!	ˆ”©—PĞâˆcÌÇïşâ\0õ±“åa|¶5Ux¨¼—âí¨¸·j?4‘Keê…*ynm\"Š»…íuÔ}ãg‘*,¥2f<D™Ê”…àM”R´©½…„HËŸ¼5j›‹¥E‹³Áƒ;Ï¸„=âY™Ë×	ê-Äa	S„ B¢¤·|Á ¼ÕÃÅÚPÅ+‘õ]3Ù‚ÏAtÊrîÈÂ;õ¨ùUSå»±ÉÊ[¾ƒ”]q@)h’\\¤æÏ¤‹{/Ò?ıGş1¯ú?Ôi[´…Ñÿ\0”ÿ\0ãÖÍªA…>’z†vgƒwqì”-°…ÅD*G\0¦™KyóWjJAÑl†ïÁ{˜[ÅÄJZtœrœÙ!/²D£-%wAå8]…úÃwëgÑì$Ä‰Æ†„b1¡b=„b	ÀÓ›M	Y“d24öYy}g¬ğ`Ï¾ÜB2t¥./vÖ˜…E†ğÍ©¢ä¸/QÌi–[ş\0b{—™p3tû&%Ü¶ó\"%µº¨è‰€¿MX‰²I¡=0DP”exrÅ,Ë2À²,:Æ³¬«\nÊ°¬ëºìF—›iåğ0gÒn*-î)µÏ	IÔF¢%_y2î)¹¬k%»ø»\nO‚¹s‘Œ¹S²63>èúÛQ\0!{—¶ıÄ­=MË¡Cóun˜Ïa%~\n \0\nf<†m¤şL†%w)*Ì%ÆşáŸq¸•.Œ‰$1éÊ9C¬óäE¥tõBN}/È	Vm ]³ÓÔ¼Å ÉSÜoÃGĞ%Òì–=œ«×4ÄÇ¡wIO¯Ãğ}Şßà¼2û3\ns`’®Óˆ5‹äF¶Ï6,‚ÙÔ˜Q\"ÂtIİa%Õ“XWì¤v\\DBTIÏœw‘îdŸÓs!22CØšƒ©‹92u&DéAœiÑ‰4©„™E´R¹§×áH¬A÷{‚É+‰1R³Ü÷Ñ_QÜİ¥,</ZÀñÀ·!˜‡ñ2zÅË¸¸¬l‘%·¤G°G7«‚e«7ƒ‘±\'¬i‘fÅË®¼ÃqĞ°¡ËÕx\0ÃvÌwek˜¦ÑL§$\'I%åò´˜‹jÆÎà¡İô>×e=5úkıßàI±»—\0è*9’ËˆbS5va»u¥Á²´ptCaì\"TÚrÇÍ¯—`ƒ\nPæQ¸\0Ñ‰,6™6¸ÛN¬ú£md.S”J¨ÒnÒbÌœ,,‰r•Æz:{crÉtOªlˆ¶‚3sj4¤\'@Ÿ„DJõ×`‡hÃibÒĞİ—8‡åÊ8N„á8N„r4¨;	$ŸËtÄ-¸ğä›´¶Ô™ìÅ¸ìùFBïäB³mCLÖhCšmUYu\"òEßKšI¡‰ä¤)z7¿C»îÍL…°ÒÌz2L¾¥ÜÍ„ddX0\'~Üİª”Bödvvš¼ÕİAûF¤\"î½C˜ÿ\0@‡hz:Ğˆwœ¤Yu¹ÅÉJé{GÄqGÄ+P—*lGrˆ’ÜK½\"Oäaˆœç—ÜÁKŒ‡m$˜YgMDİ›¡ğ%õå&M6y…Û©#óCËşÏ•Ãà,ÃX9Ä‹ò‡ÄbËn9,/\0>X°Oë2[Â72´q3×-³œç9Îsœç9Æn0·Bb±Yî„	\nÜ›QoQRmIê«ğ¡å-#ä\'qX1Z–¤ê\\L¢ĞjE-¢ƒE¡G\'Ôk.ùAUÇH{ıä%JØ‡¤SÂoèn©ˆ–Ö†ÃeôF{µú3ŸÑ«ú¡ßv?£ı?Ñ‹ìşŒô?FÑˆsH/N¢{Óønø…À¦wI‹i{ˆAüƒÀ¤˜óœ.?/Ææ6tÍ›Ôşühş³D-0ĞĞüâÈ±ëÌ*¼âÄõb1_œÃzš,ãœËŸ9—wœŸ>¬cXÕt44 4BÌ÷ŸŞ“ÔÛ¡Gñ[E©	Ø_’/Ì¯“{Ğë-µÿ\0S‹ÜÁ>¦†}i“\"wíp‰ªä58Èôuô¬(Fš–KI’ºpÄ0,^Àd1¦å»ŠJŞ¡Œ•ùŠ…qñª»ÏS›^RBÜ.r†ÍØhôæ hBâävŒ]P1vM¾DyIétëß5DƒP2‹BKÿ\0Bú¯àKAO/ä¤¼1uT”t4 Ğd¢çkCeŸú‚OCˆq!Äÿ\0ßÿ\0ÿÚ\0\0\0\0\0\0óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ0ñ\n3KñË0#Á8óÏ<óÏ<óÏ<²“lhƒ}éf{jæâ³Ï<óÏ<óÏ<óÄn*ñımw*U’¢O<óËÓÏ<óÉ ¶V5«	u€œ}kO<ëõ\"@h~Œ’­Æ´íöSoÛéüó€P‹(Ï¸OfÈ“È\'#ò-“Êä€ÀªY‡·GcÃßŞ…&Ğ¹Ä+]\0âÎu=4ø&©üşŒm~e¤<è]ĞqÛ/=ZşâC\'—Õ=MÒÛ¢´óÃ|´NføénÙ¯Õrº[íËSË*×¹ØI]7ô†˜n³iàı\\’</L×“\"rn±¡’ò5I65ˆ<óx¢ú)İ2 ÿ\0æ•ÄĞm×L‘ÕÈóÉS\'ŸùkÃîÕ	$0<\n(Ïœÿ\0|f|†\"˜ÿ\0XÃ<óÏ<óÏ\' İUy&8ç8‚$²c<óÏ<»÷dñ•ƒ’P[ÆîO<óeÃÇ4óÏ<²<óËB$ ƒpÂ4‘‰ÃÏ<ó‰ëÏ<óÏ<óÏ<óÏ<óÏ<óÏ<âÜ—?<óÏ<óÏ<óÏ<óÏ<óÏ<òË6ˆ1¼óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÏ<óÿÄ\0*\0\0\0\0\0\0\0\0!1Aa¡ Qq‘±0Ñğ@ÁápñÿÚ\0?ÿ\0Q’CM¹¦4Ã^MÍ0›ÓcE¹ ÜÒni74ªJ»TI$àèÈ¨I$’I8=}>=v¨’I$ç‘#dˆX]éñÆá—\n–S‰ïò%d$;/Z ºMhşd­-õQâJ»’Ò¿ÑÄ0õ$iXdH™\"dWOŒnCR¿KŠ|Õø5¬,IO68H=GJt’\0©§Î¢$xI¼àdà’DL>ÇŠ¹9÷ş¸¯u|$”í–Áò%Õ<H|†î<àøQ\"<Oqª_§ÄÖ¿~âÍµZ´#ïFnG„‘%„‡L^¦PÈ¶O‹Mğ­eˆ¥••bŠl$RÃÏÁQ‰’[÷à±Ee1KÂ¤i*DOÛˆD”uşK%{ßÆ(bd!VCQMéû^^Â¹›‡œ K12*àÛ8%r¯1¶ÒØŞşD¹|Õ\\ÍD›®ÿ\0\"ÏNì™Ô.Z*²Ê•]HÆM\"@Òu§\"~ãÏè7n\\Gã‚Ä9¡•0KÑÁohòÿ\0XÜH´š#”\"%Í\\«¬ò<À™ˆUí§ˆ^ÇÎnMŞ3&&Âğ´Î®jğ’â&]©=$t«ÑÉMSÚÉf^F“²4‘¤ì\'dh»#EÙÈÒvBE)ÍmaüúpXŠ~ùˆw?ó1èE| ZÌ±cSB\nÜJI‹›¤ÿ\0âæãÖHo¶æ×İ†¥C&É¹öOÈ†mısïovIf*àğy,uRıXÅ›‡ê¡J2òØm°šıâÊ6¯5Ù-+©7\'7¤RErÍQ¤CJ%=F4†(P‰–®b’m!ÓwÍúÉ\"v’¡ğ6:¯\"Ì(ZÏ_èÊÒwV EÅ­Èà‰/,lÿ\0!*Ì¡±ş<ş[Æ?2?Ã?ÿÄ\0*\0\0\0\0\0\0\0\0\0!1AQa‘¡Ñğ q±0Á@páñÿÚ\0?şR6†éã§œvqÚ-¯«´ñÑ:z]§ŒvqÚyÇiç£ÿ\0´ğÓÆ;A¨m¬8åR¥J„¸2Ü£*TvŒ28ä¥l©Q©r¥@Œ©P.>Ï§jÖ0-}-óµjåÚ+5E¿/x¾pFˆyJ öT«â¯£S.÷xu€PNìtÜ¸o[TH`ö};r0™ğú‡CÏÈ-§ÇÈÎ3\næ_pj8Ö…®¸JK‹r«eJ•Œ	÷\\™Z÷¿Qé?~š¤gs\nØß»Ş55ÅQïG^bæÇ ê6¹Kgàõ™eÊ\'¢–èçÕDYW„\"ò´Œ\\½‚ÅŒ#?sk,yÄµ™êzWO4ÛR¢ºgÏxSwë3ò¬/3H°c.»Dë¿Fy|é–¸£]6HKİîÇHXı¿ØéPegˆ}Ô,S1°Ø[(Óbº²ÇõÚ;ìã\0nıGË}KÚ]!™E¨3Ã÷è­±6(Ci¢X·o5JÃ„_.—hé>D:ÄSÅÊ\0Öa¾o‹0´J¨(U°[ØŒ=Ï¨ÅËƒ…ÌLÀAÖ]ËŠş?¿FfqÙE§èØlÌ\\_Gï¦Çb®E» ìÌÔZtr”Ô»—ãl!—mM2êcøşıØ«åú„¾5t?ÛÌ¼éÊj‡UÀª	rö\n¶FÔ—S	ƒ‰‘WXBuF³‹ç8¾lâù³‹æÀr\\Ù_qœw6Übb+ÆÑ†üåñ§¿£;øéµvuë´ Bµ¶&ü}H<¢3dî<ÎTd21ù–YfbU?NÒı};F\\aÙP™gñ)Òe´Bè~¡„²xÊtåX’Ôk5’ÛL¦ ï¬!!¡r–Š+,oHÊâ¨ºW¶é’%Áàİ\"aB~Z¸…×X9[=	O#KsÍñ¹ºöÿ\0 mt”˜	ˆòàL{¾ÆÑ ½Oğ–Ì‹ØÇ©_Ê&p*?Ê¹råÿ\0Eÿ\0ÿÄ\0+\0\0\0\0\0\0!1AQaq‘¡±Áğ Ñ0áñ@P€ÿÚ\0\0?ÿ\0îvGo|U4ûwÌú§ÌûÇÌúGÌú‡Ìû\'ÌúgÌû÷Ìú·ÌúÌúÌû·Ìû÷ÌúgÌûÌ§èzÏ¤|Ï¸|Ï³|Ï·|ş]Xu(k–‰,g`ƒØùÿ\0ÔdÊRcU®”ùÆF2t¯2ƒ‘LÆš¢l³1^¨ñ¬Më5ëÆ8ZC]bj[Œ|ü)ÄyŠ6^,kLLÃxğÆÜY‚²ˆ¤q4÷-·V˜½!	:!cÿ\0Jé°6[®d†‰B/µú&­Ú€K]§Cï7l,d zÑHz’¸)*é›#²+CB´n¼¥åvâ´(¦åÇniQfÈ—â‚´¦,ƒC\"m2!w |Ò‹X#µÓóà9kSüHAè#ıÿ\02ĞOğ!ıd|‰Å–­j&`\'ø“–í9(pĞ|úÑîĞ¡‡iYğNÚXĞy@=¥fÓ‚ßIÈöŠ¤İp•ŒÖùğ ö‡>d=¿éËn,EäaÍàk¼ ‹½àË€ÖärUÃ–]&[²ø L ƒÚ,Ì¡¢Jai”}˜«ïL§CnÅÿ\0O/ŒµÎÃøiÕY¢QQ¬â‘Hm)a÷ğ!,fpq[±†\"©pò‡Í÷¼=ûñßóYÀ©‡E¼\\!.-Ãt2K·˜G+ÂÃ!Úğ.†°-›“Ê|*k;PÎå£§ø\\8İ€ÚÔ~¥>Kç›‘¤Uİ‘bæâbÅ®¼?Çm]¦áòXÖ[xB¶PÖ%J«0»’9¶I™pAQeÛ²¡8à‚¶]%Ó³xİ°şnäjr±U£‚ğ¥›³	ŸX«¬ha+ƒ,\"¸S¬ì$ª%ˆ”H¢5×\"¶LÆÏµ¹‡c¡úXÚëb¡\nÂR½“Sy4;9x%x±éß)?¹ˆØ¬–€;ª•Tí-ˆùZ:¦Â¨ÌCÄåPíóSéf\">%¤w0‚<%x4W©H¢ér½!©tE‚Ö+é.Ä»†‹eqÁb¾”òaëù<‚”2Ñp©Á’XkQ^.æ b´Ş\nõ9µŒ^1æS2æ\0HÙ/™\n<0š³ªµï* …õŠªÒıÈ5¤ğY••ï\nİs\n®Æë7j\'ÌÎb÷‰Z(Æ¸¦j.H³ şåîœ¶€:–E\\.âË‚£.ãzMRx³$1ÜºêXøY†²†­Ò:!€ÖÇà‹?¥£¾£“5®ñkãÌ™•Ve™Bf	z®§yaé˜6<ÚÍ4:¡ó	uÒ¥t|B:‰f:†5$§¨EíkvÅS8Eã\0Ù‡YXĞƒrï\\5×{„Šâ°r¤æĞq—Öu‘-ru ê˜fe¥æUFò½§\"TËs3‰tµxLÊrøKY–3Kûôšf©+×oÀÙ}-=BzÎ ¨Ú\\q×â]EJ«0IÕG?¦´•>Qx ld´k/­ÉpŸSVÂúè4Q[x%†–(jñ„ªÊ^ª¶_$še³—Ë9%PRÆêeğİIYLBÄ\n¸Â„q%¬ZKÜ¼ÌKGÓ§ƒ[”«…¯áŸßÊ&f×÷™	TÁ1ü!Y0cğé¨B¼Æê[/Â°ÊoÄÚk/À­-ÀáQ‚/h@]e¦‚X±zÀğ”²İ°¾-x˜°…ï C™R×HE¬äËİ!É2ÕMrä&³\'„J†\\e$£H±2Åa÷èÇ3mÓ®¯ÀXqöX«’ıæ|’¾ID9aà¢W,IYp@ß€ñ–x¼<ÑÃ1õ@MB#³óÄ+#¨¬ô§%ƒJA¶†¬{\n·@µ Úö·!’¶Ü+fR=ifÍ+ÚÚbÓÁ¤ Ò[2é\n4…˜ÎÙ\nÄ6—ê±¼e+A2§Ó£³3]ÅpÂşş¦\"£ç÷•¶lœX¡ğ4F‘ŠqÆQS\nİW€Ô×Æê}ôÓˆ±Â1t¸Eİªä¶’âìˆÔ)÷1.Ök#l›áŒju—È^º®ã»~Pˆ\0mªg&_´äN]N‰\\-´äLö˜%9©“r×HÕ2h‡io†ÍkéÑš\'\"ƒğıgúß4$fÓ\'I˜‰^ü>tI¼·d3á~ÆeßâÜ¥šÌD˜R¥EàebFV™À4’Íguğ˜Ü1j^Uw’_eá\0Ğš¢Äµò–ºLf!É14”K÷IU1]K%˜šô€4‚È*\\Ç-%D@\\wpçúÃá©pü0²çöŠºW¬Û[S‰2şàUBÎa˜Nòë¬b©h-³”¿¯à,R‘jú`3–Ü§A)!ãƒqÀZ²Ö¦óUšü*¾$¨˜ô•m)Ú[£i›¤ji(NL³5\nÕ†ß«\nM5à~R—ÃØş¯í>ÛŒ13Lòe@‘ Û0‹ÍÂ´µàÌ@ÀiÓ.HË¦ñŞ\\wƒ€ ª6	Ó(‰T˜d·	J­x5„Ak-¦°¬±È6•l·nĞöf†y‡)¹%E©1İZSVjÒŒ\\ÈÚ*ìoX½Âê`ä¦r¼„§;Ã.rı£Ë)-ÄqÒ7é	„ÓR Ãlj\\Ésà¡wcd/¥£àWö°ü=R}K„p’jBìe-0Á^|744w2Àà. €bUjw€7\"¡§AUÎ$~è5?@åüj¥æãP8Bâ¶™ŸìH*Yª}âÉ(ô=ß-S¶0±G¿\"Mai(áˆÔ•„¡M`VÌTÌ³¶j¢Òsë±©¶ğ&×¾eşµ™A3œ&YŠª\\¸ì%¸˜¨•@J¡eÌ²ÍTK™›‘Y¤h”}Z>\0Òß´ş±1ûb°†‘ëıÔ…›F$ƒ…ã(E€¬5apB¤4èòóc Á75¾PñD~x‰2è¼âˆ÷†…S¶.ÅÃ‘V8‚ÇŞS‡Íû7,UJ9•\nZR8G%€ğ•XmÚhZn0Sè¥ÃH:’ë	´°¸Éa	±õ†Zk&r£Wk,E]Uä™éàj8VR\\U(ë.d6ƒ¥8ãà™á”:¦`!¾UÖ\"•¤)wÛIøeÕA/&Y__ÉúÃÃô6•jY‹Q Vw¯1ˆ¢]´+§ÑJİ07uå±H¯ˆßÀ™Cå˜àÓÕE°nh} şÍ\0L‹&ãí.µF&?JXÄ«Úfõ‚âÂÄ—MkCRÛp®y¨[¤\0ÅaŠƒ¶Ê§[Fß8lI 	œ*ƒ,EG˜¸‹\"ŒâÖ™lyB…K%ú’¶˜ ©3*4M¡@”-«-ex”—Y‹vŞSx#Å¼0bgIlp4‡ª`•yF•eKNrÄíŸX±.Äş‰øaÒ`ñMJ••ˆt¼©jÔ²P0€n™¹JãÚèììœ£’]½^ø8Â!€*€cŒÊ9yÌSQZkÔ…_ ƒó9/Oİ+Ğ¾Üf½Ş#­œ˜ô7PJó¹ÀÔ½7)¥OH»güèq­ŸHN¤ùqœæ[µ®0€¦F,´âé.H\08#Ñ0¤µS4Äc¼¹¶\n¬²\\¡/Û.WX€Vc ùÍ†Ğ¡rÕÜ‰™¬~>ĞŸ‡¢`\0úÚk—ŞŞ+DÏ7ºCçiöËé5;’µ~|ek—°Ûb(5H4ÃŒ½á—œÆÜ¯ˆâ ¨©LÇèáB2áYùp„©ÉÂé`räÅÖ¬	rŞr^kœ{[+xrÁÆ0†Aœß¿y”ôHDŞsR”T¥u/¥‰I¤V¡´¸ã´eŠkiu[ÌøË¤³]QjåL¼­Ù‚5Şs*|Ê	oÑáè™ô¼S\\Ñó7ÛÒ¥=_(˜¤»€ç2ÔÚ\"ømà ÜB\\åßÉ3/oÃœLZ*ù£LÕ7@\0¬ª¾‘ÂÅõ¼j¼T¨üW:Ä*A[‹mæ@¸P4GF–d–AÈ!m¡ÂÆÒ6™ÌšfPÌêò…ËSÁ£nÁ¬3ºte(İX”¢6U¤³S=|!Õ¿è˜h>¶¼\0«iˆ§ŸN…zÌAV†GÊDUQoª0 ®ĞT£AE*+Ãhèš©/´ÛÃXMœh™Ç@£h¯ivŞó7Ú`L½H^	Š‹\0·ÎÊŒtĞİ.\0­~riåóˆÚÚJ‚–¶Îe+9?Qß­ú›ŞÃõ)üÔş€ıB¿‰úƒ¶nŸÔ>~¦²¼¿¨z-Y~ıˆB:`H!åı@ĞÓ§õkÙœgõ¿oõÃa‡Ì¥j:QHrÓqãÙÂôLÀş¶šÉª6¾\"[ŒÀ;F2a±jÚÉ2àq#¾F a¦1z‡£vÍ‘,	¼ øTôQãÁq	æ¼2b¡EêÅ†Ğ(ÆR¹ØQ­¥RÌ)ËÂ¼ñ¸ÅJŞn¸*3\0±áƒÚ¤`áÑ+F5hÊÑ¸=¡À{Eàö‹Áí8\'´àÑ³‡´ZÑí(hö•œ»JÚ=¢VŒqÕÚÑí-Zq‹«V,9e —5v•*Àa£=	øz&}WU™¨Š¾­f–8$Ì^ğk‰@ğjì\0XÖ6˜B‰[„X/ÖP,kB²ãm¡šeß†}	…ø@3Åº)‹Á§ñ4¨LëË=B;‰H²7yÊM´â¶ñ¬Ü!ªv2äk|ãŒ!‹`(€êXÚù®Uû}`¾ÿ\0yOëõŸ[ù•iôõ‡ĞüÆÏ§Ö+ôûÌ?¿¼ûïÌ£÷úÅ¿¬ÊûûÅëõõ~ŸYô÷‰×éë>Óó*}¾²‡ÙëX:h!²Ÿ7j!ĞÀWˆçJ¾wøz&¹»Àb7,X”e0å.s rİÍÀãç›´É„OÃ3$¥PİMe5—ŒŞk¦1¾if‰L’Qä.ºÖ`%ú„ouw‚ØÖ²Íéz\0ÑÁzÊ®[j—@ïi+İ\0V*ŒQŒsÒÛı^ñu.±N±½iaı”¯÷Ïõgú³ıYş¬ÿ\0Nfóßİ\':ªÏ£ıË>ÿ\0yôÿ\0¹ş¯÷>Ó÷>³÷?Ò~å¿±û‹ıòïŞıÏö_¸¯Ç×ñôÓ‘êˆì×Io	×tğ‡£r®	Qï(×¬£^Ç÷\0úzÂlG—÷•­ä?¹ı?ûZN‚TÏ€Á<}4İ‚Èã¤+Õ,2Ê4^¼‡¢‰¡ÙÒfšá\\£ƒ‹‰cb‡-æ1\\Ìˆ9 ªZG0,‘ZÆ€Â¶ê§§‡­øº~ÿ\0ßM\n´Ñ¢–—\\Ã´È¡¬R[¢8tAjÖf¸¨YA*,]#Ô‡V[s\0­»A½Ÿß`Â‹*&í<H4›!}+àÑ=8àÍÆªá…ªMŒÄË±Ôğ:¼Únü\'š*FY‚ªàÉ‚TW9{æÔWj[£\\i	ƒR˜ÀÑ«xxgÕÆ™iL§Áioø®»P¼§-¹‘›Ö°‹æ,åK.?ßšnï¼}š#%(°/ Æc©kı…Z‡5CÎ\nå‰åYRØã:A£]€åÈ5Æ,Ñ\0¯×0Ì›Ñ‹Q~i&…| 0½’&tòBÄh-èKÊ¤ìÃª‰Ú,/k–,MøÇƒj›æø*RC4WM8MD‰\n¶À&‡TÈÓ}(ô‡”Û6*(Åk0(™µğ—‹ğ—á/á/Â/øí#@­Y®€à˜v›®©2r\'Å„¢\nHŸx\0oŞ+„Ùàrj+ÌŒØí.!O\\–6çÎğp´!x\0>Q7Ş—$\":Q`ïUTbæUšÙKqÃˆ²Í¹5Ü}y,M”«­åÍi3ÑÜ¤Èga˜ ¬2ÔEhğÆWÙ®[—húeŒ­Jï¢pŞè\\À³]D0tyÃsÑ=aXj<ˆÁW¦zMaë]Ê½\'3Ús=§3Ús=§3Ús=§3Ú´;„ûJq%8’œH#£È„ÜˆÊ†À¿2[tEqZºØ‰éœSÑ™â7{¤l§(éHåŒÎ»×ÄÀ¹A‰6Üc¡Äwõ\'R…AbÈ )VØ  ÄEBƒßiFõ(¾0â¨‡ÿ\0–r˜pËWŠ´†ÅæÃòõÛ7oøÑÀµ§­5c+ò—ô #,‚›e•Êá„:ª=cİní;°ºmiì„7‚Ø|ÚM¹”ÌEËUÇ†<åûGSÚrı§/Úrı§/Úrı§/Úrı¥ÄÉ%Ë¥vkÊ7xpİâNóŒûNyçğƒ°N0	¯ñåZ­ªÖÄù™¦It†&AŸ<T1Ü62ca/Ö.å‡ÌC¾oú(‰K€ï³	VŸó)ènçÒ‚âˆôzÅWÍ‡e¾X½DJ„05€Z«H1™LA¦„7‘ğ¶†î²úGAuu\\Jş#AûÕ7ä´È(4e  ó„½>róò‡´$äÒZK^Ê­³–ï9nó–ï9nó–ï9nó–ï(š˜ŞF³/§x}Ş®?8Û?¸ÊO”?ìƒº_E‘Í@uÃü(ĞhÚ‰ÜÊcêÎm1HÚ?`ÊTú½°\0t:~tÆğ.j½{‘÷ÿ\0:Ø^ cÈT­W7WÎ`†gK¬°——Ê\négÎ%ƒâ÷/’Œ­bªö•5o‡ê†”ÂJû‘QŞndOyb&œ•Æ ^æG•ÇõEÛ6€y%fŠÂÑÂœë‰‹••LÌ\\³,¶\\UET¨XõÇa€ß±g\"‚RãÉŒ&\0¬r>O”\'u—±1e;§Jh¯øÒÔ•t–šw–tBÊˆ=ˆlkêé.)>ùM/ëéÇÙÒ*é:¥\\Øï¯‹Gµ/DÉhjK‡®zŒ9ê¹ãIŞø}øÄ¹v2u)síOh~®“VúúJ;ÃÃúJ*FŠÈÖÙå‚‹; EÑq€şi=Á}å¢åTÎ¿&Uˆ!P¢ùzÅÔÌĞylÔRßoıCsF^Sš*Î/•4Ç.!şy:ÚãIëM`µp<ˆxötÉ¿&\0P¶‹\n:»c‰ÿ\0¤ÕØaFH`øïAd9Bî.¨zÇ‘úÒç}åÛ¶è@òñ-…ClI ø?ùêÍ¬pÊh¾Pµ“w›t•9´Kß²³Â ıÂlNæ Ëjê£•²gG´e ·]’VÙ8\"]iH^†=%W\n†¹ÿ\0‚S’(ÚşEéV<1Òıçú\n=Õ©*I²ôGƒÓ(0­ƒ¼e¬@C£wuÿ\0ÓœÉşÿ\0?À”÷÷ÿÙ','\0\0\0\0\0\0\0\0\0 \0ÑÒ\0\0\0\0\0‰PNG\n\n\0\0\0IHDR\0\0\0\0\0\0\0\0\0\\r¨f\0\0€\0IDATxÚì½eœ]×uÿıİ.óˆ™%‹É–%“Ì1ÆIÇ9œ¦IÛş)<å4iÚÚ$m8qœÄÌlË–m13K£Ñh˜/Ÿ³÷óâœË0#ÙŠKÛŸ±fî=°a­µ×^ğ[p¡]hÚ…v¡]hÚ…v¡]hÚ…v¡]hÚ…v¡]hÚ…v¡]hÚ…v¡]hÚ…v¡]hÚ…v¡]hÚ|ïæÎµôîGÓ´«t¡½\'š¦iÔ—N¾ \0ÒÛáîµD­»Ûâƒşo<ñcóhïzgè„PH&U­ğšç]-¨.´m(6ë‰œ´ZvÙ~½ŒúÒéjzíjëïÖÜh}bşß2¯áVz\"\'™;â¦ß{ÏŒwjJÚó¯Ng{Ë£Ü>ëßµ=íÏTÿúWŸkèœøTÜ\\ª\\*[î~í‚\np¡ıÁ7…Rš0”DµƒmÍıÛºsÎ—õè¾Î±>¿ï•¿ü.J)õldbõÒß[¿Ş‘ukËƒÔÆóâ‘oQãŸ0Â&¾j ÒşÕîHÓTÀ§P†RòÕ\\hïÉ&„35o¬Æ?şYøá¬ºkßØÓùlxtù<–ıè{W\0¼tä?)÷6°hÔÆC{¿º \'|òk¡xÏûâ2rAÍ¿ĞÎËæÓË\"OÕ·&U_òÛæ¾»<z€;fë½\'\0;ô<ººÀ$ß±Şoîßùå`¼{ê¸ĞÎ÷&„FÜºROÃ?J{F)›Îùî{G\04÷í`oÇóÌ*oWèøWNìüÓ`¼§V¼»Ú…öûh”yëVzG|Y!Ÿ¨ğ¤±tóFÜvÎŞù{3°®˜ËªqŸáxÏÍıÛÿ$tù/´-£)$Ñö‰±Î¯WxG®h<HCé´súÎßnky˜°ÕG_äôäCİkŠÙÁ‹Ş=½»Ğ.´ß+—MöB£>0éşYõ×|¹7ÒÒnÉ8WOşê9éÎïÅXíËØÊ…ŞŸl½ë_m’ù….P–ÂÙ(KkÒ.´í]İ„@x4¿B da¢VJÒ>şÁ]mO?}Ï¼Ÿşzí‰3—Ø9ßct¯cÇ‹X2vûÉşmß	[}#ªş”¥7‡	m!Cñ·U\0ü^e‰:—«ôëÔ9ÔÙ>ô“”\0…Àá‘ÖSqNŞıV¨º\0ÍÔ0Ë|#½&”àmğ9ÅÕş±»}FÅÕ¦æ==¦bËÆÜó¶ïœk\0>£Œë§şµøÁ¦Û¯ŒÙÁ‘ÅÎıvĞ¦k]7½›z‰´E°l¸Òó^+‘¨*FÃ*ë#Uø^(åüä¹³\0Gæy^Ö•&£©<ßª,OûC©a2qá÷g>¢X¿ÄĞ,#²¯C°UÏDîgJ¤@&ó‹¡ß\'DÚ§\"ó‘¿º\0M€HŞ®ÜdÚÜ)÷^™%\0¦¦ğÓ%“J¨ZVMÅÜr„^x.{ÂÍÓ\'U[qóôzhsËoÎ‰pÎÀîög8ÔõÚbC3/¶UQÀî(#6íÏµÓ½¡‡xXQ~\"ÒÀVZ-ªšêËwyÆ]y‰\\åcl…’2‹èU.3‹q}Säç85,&-ÜwYäUP ¥ß—?öJC\0ˆ\\¾Ùœ%Ò®Ì÷Y>1í\0•óø¡H‘ş¥\0¡e]’è“ÊèŸtÇ£¹÷ëhš#L÷;hZJ#Q®P\n”(qa ,‰<8H´#†ŒKª—T‘§JŒu~ñÑıõtÜÿàÀñ-¼tô[€˜±æÜıôïè£gSñ¥Ÿˆ4°’*¸_ä§`øšì™\\{–-‡u„(°sŸag.—¨a<\'û³Ì]P(²˜ ‹í´L~ë»|>õ‡*0?i7¦‰³ZFU@h‰ãºí¾#.Óf@$şÂJ¨ÌmCB\\L¡£zât½Ö…¯ÁKÉÄ’¼6…¡#ScfSß–sB“çT\0èšÉÑõÔ&øme$\0;lÓ½®‡Xmi¾uNKü¢(F^×ş@šJg—)U>æÊŞq³=Ï1Zsb™ÚBèªÊ€yEÊéŒHöİé³P¹\\/\n	ZT¡†’ªç;±Ãg?U¤Kà2&]lSƒSaú÷àåGóˆ¼¯SÊöÌª¿fÒ3¿µå_ÿ‡%\0,;Ì?]yÄøñÖ×õFšó\0á“a\"=qB1ˆˆçÎ6¸:j1[\"¤J-RC,r¶`¸çè1Äõâ%ŒÊ!÷/•NQâ¬˜Ë*c’Œ*¤stQ™×eŞ›{È<¾:Ÿ«¬qä9	‘ÑŸY—~TÈlENWÉ7•o’£<‰áÑ…Ê3Ìä„8TŠ„BÇƒX}1<õ¾¼ô\'„æ•RÎ=Ù¿c+ç`‹:§ bõƒÂïÑ5ÅLGÑÎ‘°\"ƒŒQ`ûÊ3³çº©»PAÃ£Š\n¡ò‹1Œş3OfêÏé,”Îä©Ÿ¼òR©3ì;×2ø\\`Ü”ÏUÛ‹5‘ç´4”ıCäY¹\\i$•\"b	Â]vØ.¨o„·C#B±îs2gçT\0Ø2Æ@´ÕĞ„î+z]L¶¼(Óãrƒ(<…D{bq”Ê£â9Ó›2èå£¬•	G€ÊÚmòô¥è1#Óè§ò9DŞçG«H©*Êü…ÑPÆåßƒqähî^cæl/D\0Ès½¦¹*\n_æ~`Ñ¨BÙE{ªÙ*^W‘?<àJ°!¯Q6ØxÀ,@ì*Qç\'Ş7›û§Çëã¢EK©k•Å,éé{,¡·«ƒ÷ÑÕÑŠ“š,†`F†ü>×–•-°òÒI-Š´ñåçpõ=ÊĞùFš8>ü‡+\n-¼Èı@*ˆÆÒf(¥J+­ëIoV<ei}[›J	 À5·~ˆËW‘k /¤´±âqº;Úyî‘ûyá‘û	’õûlJ)4M0iæ\\*kêÙ¾nV,\nÃ<M)…nÌ]r)¡à\0‡voGÊw¾„\0ì\0x‡Ú;.\0 ­sOÄBÓÄãõ š¦gL<CÓ43å¨®k qôXâ±(Ï=|Ò¶~_$œìW ´ŒE+¯â£_ú¶¾ñÛÖ½RÈ‰W`vÕ0ßæì”¢à·8­¢ª†Ënx?üÔW¸ïÿÆÁ]ÛŞ å9ÚüşP@‚ğÎ%	 ³öù\'8¸gKV^ÉŒ‹&¿oi:ÆKO>„×ë§aähæ,ZFM]Aiy«où ;6¾Nó±CÅAJÏÔ>–eBHú•]ãT ¤Œ[?ö%n¾ûs”UT²kãkx]i,QYB¤\nU¶€!í;™\n|Lö+Ó`¨ÜˆC•pƒ¥G”*˜½ÖêhR©‰¯®oä?úk®¸éƒø|~7ØGå˜J‹Š((Ksì\"‹˜E¯H&ßaùú®\0ç|“‚H8ÄKO>L,¡¬¢*C\04?ÂÏ¿ûoèºaÜvÏgøèÿÓã`Ê¬¹ÔÔ5ròè¡Ü´m¤m;Z…®cÅ¦¦ëy	]J‰´m@¡k ®;Œª†¡c˜JZŒ3’ë?ğQÊ**ğhPîeêèº‘Œ#RÒFJ‰:†Çƒ´%¶@×M„&ò¼?“BuCÇ¶%¶m\'í	fÕtİ	½V+w¡œï\nM7\0eYØ–íğ„á–²–ecKåÎ¯+Ã²mtMGÓõ£™’Û¶Ò\\gNø­¦ $RJ—ÇšnddiÛŒ›0•«o½+©É©¸…‹!„†®ëBPÚ)mİ@Óâñ(*cíDYëßOĞZ2t0]D‹4ßhö&rŞk\0R9çr•bØ·‡ñ3\'W¦iyâOš¦£iÒV;°Û¶0q€ÇãÅp…AJĞ+LÉÌÅ3{árjF`&ı½=Ú³-¯¿Ì@oÒ÷¯	¦)ÆMŸÅœE+¨9Côw¶Ñ×ÕJU}#†¦sdÏVvo|Ù‹W±påuø¥ÉwN˜1÷İó\'4ÚÃÎ¯F0f,`ÆÂ‹©1¯ß´%¡Á>NŞÏÎõkè<}Êe~›±Sf±àÒ«ĞuÃ!v!èïíbó«Ï1rüd¦Í]’\0š¦qºé(ÛŞx™`_/ş’r®ıÀ]ø%î¸¶m±iÍó´µ4qÑ’L·”¶–“¼úäƒô÷öPVZÉœe+™8ó\"*jê1=â±½Ü¹•İ›Ş$8Ø‡RÚŒ7…K®¾Éî\"û{ÙµñjF0cşJ+ªèélcëk/qdÿ®¤ ½ôºÛY¼êš·dÕ5”•W²ûfölYïÚ†áaæ’eÌ^´œÚú‘h¦É@o7‡vocëk/18Ğ[”Å°™7M0$€p3Ñ²4©óQ\0A¤+ŒìË7½şNL¨\"CS¢@°Mâ	ñ(\"Ë ¤¡0‘h4Ãê›îÀôx“ßw·Ÿ&ÔÓ‰fÅJ%©®kàæ~–K¯»•Æ‘cÑÔTvw´±kÓÜÿİ¯sâÈG•VŠe«oàO…ñSgás;	â/)Å¶,ÿÅÿğÚsÏ1iŞJ®¼ã^Loªg-`Ü´¹¼úÔƒlx}-B+åª|‚«n¿›º‘cğx3½­½İ,]½“Ÿ}óï8´gñx”ú±3¸ù“_Åãõ9Æ2]§éÈvmİÎ´…—qû½_FÙ6\nĞƒÍ¯>Ï¶évà)ósİG¾HUmCòñh„^–\\u;WŞz\'õ£Æ°ùõ—yã…ç1º–üñ×˜³t5õ#r4‘îöÓ¼öô#<ø£ÿ¢»í4ÊVŒ?…|ékió)ösâĞ^êG¡nÄhtÃ$±pÅUüä›ËÁ[ĞtËn¼ƒeW^®§Öbé•×3ÿ’+xø\'ßcï¶HKQ]×À-ı+®½™†Ñã²Ö®•ë×rÿ÷¾NÓ±Coƒ!3ÀÊùÓNíO¶@ÙïœòİáˆÙ(+ş6x:†~€°¢9f×™ó—ğŸ¿yÇK ´ŒêúFG]tÛÏ=NëñÃhB§´¼’Û?şnşèç0=^ÂÁAN8‚´mFOœBu]+¯½…@I)ßşË/ĞÑŞBãØ	Üt÷ç˜>o)RJš «­…š†Œ;ÓãÅ¶-4İ$n+,ËÂ²âOr‡“¶Ä²âX–h\\´t%7|ä³TÕÖE9°c3}=]Œ8•ÆÑc)«¬fîÅ—që½Ì·¿öE\"=Ql)±­8z $¹Ëš/BhØ¶mÅñx}Éw¦™ô—+À¶,”’ÉktCgùê™³øbü%eÛ6^—Û>ù%–\\q-^¿Ÿ¾®vØBcò¬¹”UVQÛ8Š›îş4\'ìæÅGïÇ¶mÇ kÅ1=tÃQã+ªk¹héÊ¤à\00Ms—¯â²ŞÏÁ[P8G\0Û¶2¹Ò¶±¬8¶t]RVÎû?õeŞ÷‘Ï`z<„ƒƒ48R1jÂdªëYuãû	”–ğ¯ı1í§Ï­÷\'-ãô¼\0oãló’ÌëJÊ*˜–fH´pp×Ÿ}”Gş?ô÷u#„†RŠ¹ËWrÍ>ê0h}ık¼òÄïPRrÅMäî¯ü5•5õÌY|	WŞú!~ı?ßdÌÄ©4™\0@W[ßû»/sêØa,+ÎÕ·ßÍe7¾M×èíêÀ0L^{êaúº:¹ûË_£¼ª€mo¼Ìs¿û9m§šˆ„‚ìß¶‘ÿş»¯0fÒ4Úš³õW?yŸÿûÿ`æÂe\0\\´t%%eô±wË:şıÏ>ÅmŸø#æ]|Y2A7^yìwÛ·‹O|õ1nbj¾\\cÙ`_/ßı›?fâŒÙÜ|Ïç¨5]7X¸âJtÃ` ·›`m§šˆ†C<}ßÿ±oËzªÙ·uÜzÙ×ó¥ş.Ò2ÓÃôùKxãÅ\'±¬8G÷íä_ş×Üq7—\\{sòhĞÖ|’½[×cš&W®¦¤¬!c&M£¬¢šşşÉw9qx?w~á«®ğxş_°éÕçi9qiY,Z¹š«n»Óã!48À¿ş5^yâ¤’\\uËÜıå¿vÎ*®¸õN~ûƒGıÒ¬xG+ßÀğÓtCıİ½&#àåÜJÈŞníßCMãHÇŒKªû¶màgßúÿèjoM2Ye5/¹’²Š*\0z;Ûi?ÕÄè	S@)NŸ<F[s•5õø%Ì½ørùéèÇŠ;†¹Êš:>ú•¿áà-4=HóÑüè_ÿŠöSMtwu¢\'@ÓtbÑTX{ó	6®y–xÜ14vvœ¦óåÓÚ³c\'2cÁ¬xœh8Ì±ı»“Àãó(/Ck×èlk¡ıt3+®»Œèy¡Ñtdm§NğÏıY^:Ç¢l}ı%Âƒ\\}ÛİÉ¯4]çÈŞ<öóÿaßÖtw´ÒÙ~š¦#9~Õ#˜wÉåDÃAúºionbüôY\0”×Ôa&B8pı+O3{É%É^O7¿øÏ`Í“PVVÉ?ıôQ¦Îu¶7 PVF_7wo¥´¢ÊøtÚñı»Ù´æ9l))«¬fŞòU”WVĞ×İÅé¦cŒ8€SGÑÙÚBEu-¾@	³]Ì%å„CƒïHÈù!\0”\"PëÃ,-ÃŠ;É<N’†D(HwJùÆ™fÉ•4÷T¦+óèUh	ïÙÁ×¿ôQf-\\Æ§ÿæ4À¨ñ“™4ó\":OŸB7¤R”•W0vêôä½•µ|îï¾…rÃ¹”’Ô4J~_U[OÃè1œ8°›-kŸ§qÌxL—Y‹.fÖ¢‹h:´Ÿío¾ÂËüšSÇ#4á92˜P¤Â“qÎès_Âş$³,§²®+£­ådÆ9À4ÌŒ9/q9”AJ%³şR×öõpßwş…7^xÒqOºÌRRZÎU·ÜÉÊngüôYJË	ôÒŞÜDuCcò~éÍt¯fõ!ĞİÑŠ’’şâñhò;]×S*uÚq_:aàåUÕ N®M_üÇÿJ¦â*¥¨m™±vu#Fqâğşàœñ?à	Ê¼1¤‰Í&íßlwŒB¡¥Bh“¹,é¾î´Ì±¬Œ`+fã13İ0Ê!£İÜö\n{6¼Bİˆ»Ñƒ†Ñã¸ò¦÷Órh;ƒ}](¥QQæ%PRš¾1bzLTrQw;}İ} §êªRúÛñÂoş‡`÷i^vã¦]„×\0ÿôy‹™>o1õÜÿí¿%ØßKi@#Ín†ij”•x=iÃøóùÌ×ş	Óg0Ğ×KwG+£Çâó²ålÆœZ‹a-XÖ…§fûºW3˜X7®¾ı.îúã¿¦´¼€öS\'±¬8gÎÍ¸_×4r¢²Ò<„(œK9+ºcÔ4“s¸OÓu”–Òº;ZQ(tM§§³İ.çRUÜ€šİBjoÅ*2ÓAEşyk#†I×~¿Ğ,^êWÌ]qµc\0X¸òv½ù<_~ÔuáZDBÉ{›íâ¡ü3¡ÁşÔ.áî‚J)âÑ½Í&ØQ¶¯}–ãû·cxLFM`äÄéL»ŒQ“f ës–­dóËóØ½áLSË‡®×+Ğ5ÇàÒkß—dşîÖfîÿîßslÿ.FŒŸÂw}é–\'ºƒÏ«Sâ×#¿t„‰X!ĞtAi@§²LÇ_âÉ˜ÃT”DÊM4MÃ¶ ´TOBYI)é<}‚¿Â›fM/-«âú;?dşmkŸá©_~—p(ÈÌ…+¸ñî?¦¢¶Ş]Ay™Œ!°â¯/µ†BKôÏ‰7ĞÓú§ë‚²€NE©ğg\nwŸ× ¬Ä@Úà3lb.°RŠ“‡÷pÿ·ÿH8”IGš£ÉE#»š)/5k\0gˆY› À˜¾sicø\0bZ¼µÛóÿáœqı|RÌ,w™n˜”VÖ m›æ#ûØòò\\õO£¥•5,½ú6N?@_g+Ñp“‡v1sÑ¥\0ÔG<¡ùğ¬xÃ47í\"FM˜Æ‰ƒ;éio!¡:úÒ?0kéåt>ÉıßşkŸş†á¡ºa_ú·ŸÓ0f¦ÇG ¼ÊÙÕTæ„øJÊ(¯ª\'ìC×MFO~×ÕŞÂñ}[8}üÑ`/m\'¤	\0Aeu955åÄ\"a,4M%ç»´¬‚q“§ÒİzŒ‹–_IM}J6MƒòŠr‚}””f	eåeI/‰BÉ8••Ä¢aâÑRJªª«¨tàÔÑıŞ¹Áy†.ßö±¤\0ğ˜åØ‘¤´ÑKø|©5Ò4Ò²RÊ+J±bQ4‘. **Ëì	 m‘™~V]WKÃˆzÂ¡ ±P7-Çö2{ÉJ„Ô*Îéc{İµó0nêlFMšÉ‰;ö´‚Œâ/Ä ªèŸCÓªÓ¯¡ïÜñâœŠÏÿÙ]TúFút½rÕ`¬s¡(\0:&x$ˆ²ÎMÒ“RŠ’ò*nûÌ_qÓ\'¿Ê¤Y3TÁ²ª¬¼ê†‘Û¿Ö¦ÃÌ[q5²J—ÉÇ3gÙÌ[qÇì¢ãt3Óæ_BIY9¾@)“ç,F:%å•,¼ìnÿÌ×Xqã‡X~íĞ=öoß„”—İr7ã¦Í¡ª~$c§ÎAÓÊ*«™³ì\n¦/¸Óã£«½…×Ÿ~®¶ÓøJ+YyÃøK÷ZÍˆÑ\\tñ•Ô4ŒáèŞmŒ?•©sJ²%åUÄ\"!JË+¸ê{Yºú¶äÙXºQãh;‘æ#{‰˜2{1“f/BÓu¼¾\0Óæ/gÕ-÷°øŠ›”–\'çÆã0jâ<>Ñh„;>ÿ7Ì½äjÇMqc%şÒr&Ï^Hİè	4=@$Dh:ËVßFYe+¼Ê‰Ç\"Œ2››?ñçŒ23‰Éçñ5a:)–%ùàÿ–ió.¦´²Æq5êu£ÆSVÕ@óÑÃ,¾ò}Ôp44ÓëcäÄéX–¤éØa5¬¼ñÎ¤wÄÄiÌ^v%š\'Àök±-ÅôË))«À(eâ¬ÅØ\n¼¥•,¸ìFîøÜ×XqÃ¹øÚ;°ÑÙ¹yáHœ˜¥ˆÆÑ¸$“Dã’HÌ&“ÎOÔ&µ	G-ÂQ›PÔ&œï\'’ş·E<§nQ¾z_^	¢	İ®LZgè¾—ö_O¾Ç5€s)éƒÆ±“?-·,¿¤œ±SfÑÙrÃ0i=y”×Ÿş·Üûz½Œ?…ªºèe#Ù¶y¿ûÉyÿ\'>GÃˆ‘Œ8ƒüÙ×s{ìĞNÖ½±™ÎP\0Ã0±ñ&wä	3æ3aÆüŒëãñ×¾Ê½\'ˆÉ\nZÚCœ:ÙDuƒ³#—”VP2õ\"N8A_^éf-»†ñS§áó¸åŞ?O=+Ëû¬Å+)«¬áÅ‡MLv°mı,¼âVFŒ\0B$…]$B—2y¯¨©ç¢‹¯¢«³ƒ“\'šX|ÅÍ”‚úQã©5y/<úÑ.Â=ayğ×¼ÿŞ/Q^YÍØ)³¸÷o¾àøû¥JÖ¥ª¨©gşÊëèìêådsKWß–¡r{|~¦Î]F4.yö±G*¥æ—UÖpÑ²+8zğ\0Á§ŸâÄñS´jbô„É\0TV×SQUÇÖõoŠil|c-U?ú/ŞÿÉ/Ó0j,c§ÌäùÍœµÛ»m›Ö¾L(+ŸàL,(jH5U)ñ¦[7ÀÇ8q`\'†aæ5išÎÉƒ»ˆÇ¢ÄcÖ?÷£&L§´¢:yM8d°·‹x4ÆËO>Jg[;K/»Šq“§RY]éñDèlkåÀî¼úÜÓ?x\0„†àĞş}˜>‘pˆp0ÈØIS()-%ÒÑÖÊÖõoğÒã[áa dó›ı€ş~FŒ‡’’îv6¾ş&½!A×îC|ÿßş+n¼…	S!Ğß×Ë‘ı»‘¶dÒŒÙI—˜¦iœ<~„ÎAè·KØ´y;ş|›K¯¹‘†‘£±mI[ËIvoİÈ´Ùó¨¬®IÓÒG¡­3È¶oâõæâ»8®À]ô-B¶‰ˆ(|ğ×ƒ,¹ô*G!è8}Š#ûvS?r”kqwr¤äÄ‘ƒôôô°}ıkn~AÊª¯é:‡öl\'qpÏv¤Jå4hºNóñÃHiÓİÙÆ¯¾÷u®¾í.ªë±âQÚš›Ø»u=\nˆÅ¢<ûà¯ho9Å²+®güÔTÖÔaš^¢Ñ0§›Ù¿}¯=ó0GöíÌD~¶szøØİúã*V=vğo¿~zpß§N?İIûš.T<¨#vñlå¥¦ëTT×ãõ(¾	2ĞÛ‰´âè†AEM=ošÕXÚôvµ‰D‘J\'n)üe•ÔKIy5>\"Q›î®nZOÄŠÇ’;©& º¶_Àïøê#GÆç÷cÇãôturº¹	ÛŠ#„–D˜WJQ×ØHum=J)ú{»éloÃ¶œÔdKJJËÊi1ÏGpp€¶–fLÓKyMM†ù?‹ÒİÙe9qÊVÔIuMRJº:Zéîh§®q¯7c‚D‚ƒTÕ7&á¯³óè¢á0½]Xn\"RBĞÖÖ7RSïdWövvĞÕÖJUm{Ke†‡‚ÔÔÕ§âğ¥J®|4¢·«ƒÊš:¼¾L!4ØßË@o¶m£i:#ÇPQ]ƒmÅèéìp¬ûiîOÛ²(-¯¤~ÔÊ+ªœğâX”ŞÎ6Z›Åd~¾½€ÇÔ¹èO¦P5»eç^ohèŒÚÕÿá3+¾¶jügÿ°0‡+¬¨Â¶ud6ÃËÂ²ª,xŞY’>İ™n™§/B 4Ã™–8[º@uf¼T!<®PQD‚ı4Üíäuã$x¡áÑ4¼Y³;ØqŒ„aOt6%!Ç„š†©çº/úÚšèi=‘t‡éšFÂçÑÀõpòPWr^„¦aÅév$gJºïÕ„†\'¿¾ëôI:[š’ã×5ÖSÈtœª~œ:q$?5+Ç#’.½TÚoGÛiÚ[›İw8©Ìí­-YÁ^.‚€“Ç¥-UF¾´¦it´4ç \'+„@IÉé¦£´œ8(4Ms~ôT\"˜aêÄ£!šìKƒ}¡£ëŒ€§\0¥©üÄ•ó¹–A­‰Tow–Rïs”ïÿ½;²ËV(K9µVÒ\\%B¥\n@	—¶²-‡Ìi×5Ï\"+o|¸ÚŸ>œ1\nl¡#•…@*©›©¢>J`ÉÔˆ’‚*‰;Ÿ;-Ÿ«zH7“Ö9Ç§J]¤\\J”t®Ó5·ÆĞœùEºãÑ3gV%\0Øô$_Š,ašdI•z«B¡4-…¸EÏí€TúfYÚ	áş£“Ğ\nÒUtgÍB–š¸úPJ9¥)”‹zœ| †òíå…L«`\"²&.Œ”´’$?sùùœ$@Æ¶%]l´ÜL@•\0é”)úJ8È´´«2Ö$ê>}WÈd&a:™Š4´X\nÈşbt0ä\n6º°]Úwz%•@J[èØRC¢#Ó%O}ÆU1i$s¤’p™Ì¶m|ş\0µ”–—cšñXŒŞ®º;Û‘ÒFÍMTMë†t!Dv-gĞš[9\'sù†„JN	;•Å\"BÓ¡ÁUF”¤‡r1T2\"0•ú/IGEVÙ/Nñ)9R¯H¿s:«†smæ}®Â;ç|Wh\0BY;‚–åÌ@{O#¼ä|iYWeáå\'®S\"¥l¡DRxÈa%\n9¨´b“ÃıÌ±Gˆ\"‚\":_¢!@Ùôñ)T\")%ÎN*B1Í‚¬2\neªœ¾9Ç+ÁèñY±úz­¸Œñ“¦QZ^Î`_/{¶mæ™‡ïgëú×ˆÇ¢€r3ÿ	äõùš´ñ¶LzC•ÌÇ\\É|<”<aÎD$¨*„mV€)Õğ.+ú…F¡Ê_kÃïq·qåI1¬K\'\"MŠ+¥²ÊI(7­Z%NŞIø«Œš±éE*D:s²‚²’»€H\n4âÌCÕ9›]!œù´—$½é!¾*åËÁD1õñ ‰R£Ü™™`ğ)%PJKT)çú©3çñá/|•¹K.AÓ4š`Ã+OSÓ0’Å—^Î¸ÉSùîßÿ)»6½IIi³_LEM•µ”–WğÚÓqôÀ®”q&-ïB¥ñpvvFî@PkÙ\' ÛUªÜVJ^(2Ğö‚O*•²‹2äPÌù–¦¿/û#íEi~$¯Ü P¢aÇUŸ)Zî”§QHOJS›Ó÷‹Äï¶L3UÅÈ©y“Ú†îÈ9^fw/ÅÔ*ufV¤k+)VCeVQ*Ò>“IáHŸ%„HBËIô_(§@eİè±ÜóGÎœ%+\0Ø³ùM~ó½¯sxÏ6êGã?ù;^ºšÅ—¬âèL:•ÏüÅ?RZQ‰Ï_‚mÇÙğìo0e8ÏÑG¤¦,6]Å•.+KRš—s½–\\ŸŒšÈ‹t˜1÷*cŠ†UÎ¬`¨³É>-P¢pÅµäõNHõ;çj|W$yK4|¦ÄÎÆGNRôpL}ª¸rwÆE…Š—Œx;ÇïI¢Ï°K’ÂÍÍ‘t†RË\\M¥a˜\\vóÌ\\à¤‡ƒƒ<óÛŸ²kË:PŠÎ¶Ót¶¶\0P7r%å•L³Ú´¬ÆÓ\'ÒİÕfRÓÙY\nh£r÷ò{YĞN¡’†OÈcã)Â×––TØÊ›³eº<U£îÚDV­â,;È)s–ğˆŸ:Š}«Lßy,\0íWDcÊÖSuåDjAóß%²Yhxï;±ù¾í£ÎfòÜñ%<é#Õòº¥\\½BË­2$”UT°òº›“ĞWÇìâô±İø½!#GÕ3fâ$G8tğÁäé³2|Oİ‡&ƒ”xdZñË´îqfN2º8Û™ÊÿI¾ÂÁ†–®	ˆ¬Ú/b%^DVM©3íc~ZUùD­¡ŞÁ’ï \\àõXHiçÎ¦vfÏúƒlÚpÇWÌù©‘7LJG£²&…ã×ÕzŠ`ÿ `¢›f.¹‚Wèeç†µÄâŠ±Ófg„ã8´pØÂÆp?Ï5€æzÇT†ƒïÌV®›jYÑ\"¹b&ç…ÉÍD¢^?©Ò	IÎ)™šõJ™·zÓJ²<;™ GÀ¿s•AŞ¡Àâíaß÷&dCúøŠé#ù·! àÏ„÷x|¦MX‹àõèXáÖ?÷\0·¯ãğÖ—©mMmZF ’’–c»Q±>×…‘éš®Od±¿{|QéNWÒl1ùG“RÉUr\\B¨´Ï¥sDHàêf«ñyD‹”Š¸¥°,…e+d:ã«LÛeş#}E.å‰¬A--¨7ğypŞpğ9lvB%ÒèXĞzú4Ñpˆ@©“›?fÊlJjGsª¥È Å‹=È‹O<Œ”NÔÜ¬Kæ£›)ô®Î6š[:èéÉ\0™nL•dò˜|RAMBÈ¼‹îÑOÿ-³”ª£á¤ğUF/T–HÌ@ÊXè<M7%ºéúRDúµ\"¬Cú\\fÏrÂœ§btês‘|·&\n‘¶s^b`xÏc\0¸@¶@Ú¢hi÷ì³™Zš`yUÃ÷\ns\',ı*-RP©\\»u&òsmät^{™«oùš®Ó0f\"—Şt7\'N¶2ĞÓ•](003å¢H±ÓÇéïÁĞA×eÆLgïºé2‘oåÒ´=1Ì±\'ˆ\"İÁ«T.óeTSsåôLœãêÍBBœIŸòG\"d\'šek\0™BSaØšëq\n\0! ØeÓq@AEŒÌsŠÚ‘£¹ñÎO¦A@‹¼“~îYóŒF;|‚Ï÷y²x©dÛºWÙöæ¤mgZÈİĞ^\'*Ï­@dòê£?aò´iL½Mh\\vıíTT”óì¯ÿ‡c{¶&÷ZÓTL™>3+¿íÄ!ì`\'%†ÜÅ³OèJÚŒš8‹¯ı€£i¦ë­ÍEçIehù+«<‚vx½È<(¥Ø·e-_yÌ©;é“¤B&²!Ï„ÔeŸçG\0¥ ¤Î \"GFeÎÜšşÆêR.¾ò†œbçC³-‹`×Im~Î)£U€lêE^&Ï^ÀÕúc&ÏtˆM{óQö­™öÑù(*jj©1*ãY­M‡ô%K‘åc^[JÊªë™{éµTÖ4Çé{+_€&†ºÿVRÁçG(Ç‚lå!ôt½_+NûF©‰~®aßÍ\0pC`hÀ\"Ñ7_İ…0ù›ïıSª„Tz–AWï•¦¤ää¡=ƒ±ü¥ÎÓ˜éå·ğ¡/~šúQN¥Ø¹ş5~õKÓ¡İŒª”bÚè©xı%ÉÏ‚ı½´œhb` šQp#ó;tˆ~ğM<¾ÀY×ºP*·bªHãú´ÊZÉã†égï3gü·E(EËÑı t2O©¢@Z2™Üu^\n\0! ÜcpÀBÆeÆy×±’ªŒÚÄ¿}}­4øÕï¡jÀ»·ƒª–R²|ùµÜñ™¿¢¦atòó£{wò³ÿ{ömß’V/%XÇÍp1œÖvª‰ææf‚‰nwW7ÓtìßÏØqƒx4¦‘ÚuÓ™ÿl™J¥HF(Ê&/ö=*‰GÏëÒ`‚Pw”ÁA«ğdª¶œr¡¹Ìo3bÌnøğ\'©=6Å ı¼ğĞ¯Ø¿sSó\'Úø©³ğ¥á%¶<AWk‹›çÿÖ„ÒÛ>N÷¶„ø»bPg|µHë¼ÎP”Ôz©(7‘–ÌP÷ÀU÷òL\\z!•VÎZJ¶ş™?€ã<h\nf/ZÎEËVd||òğ~Şxşñ¼èËJ)*ªji=.ÃÇÕ~ê=mi(@ÚÛÕ’Û×ù\\L¾J=‹ÉÈ\nÜJøœ	8¶¥°İ )UZRPşûÿày_)Ê*ª˜>oI†*oÛ6Göí¤£õTŞİ\\)ÉÈñ“¨¨JaF#aZO\'a¦Å¼T®3ÅzĞU™\n\\=’ÍØ¹’Ÿk^İ8Ïã\0\n†qó^‘5¹Ê°×Qh(¼ÉêQC\"ÏŞv5$ØJa+•Ç‚1ùø­P¤ÈK`Ã8ê$Â]¥¢²¦šÑ“¦e|‹Fho>WÖ]ÖÃ¬¸ÅÄ©Ó¨¨©M~ÖßÕA×éã”ø#udH$ÒätAÍIÂ-Ÿ&¥[òM80b9È>Å†Z„V\n$dçôÍ1$¦â\nÎü¥@ËˆÍp—nF¦rÁ?Òc:t¿†ĞÏwÎHg¹»(¥Ÿ¸&(«¨¡´¢\ni9¯Íp*»HÛ&0ĞÛEO\'JJ4]G¦xı„ĞÓ œœ0$W4‘×–ˆ+?sI ò§.ÒÈJ÷ÏŒ²Y×‰´x÷Úš*«ÊsŞá÷iTTèŸ:­Ù–EYå]ve•)äŞNºNR^î)\0y6ë$©¨Aıè	x}¢á ­M‡èí~çêïâéj˜	ÈB[9¶-°Øîæ¢¤æ¸¹\n²ÌY^ƒóQ\0ˆ d\"ÏdØ›ªRØ¶Eyuã¦Íeô¤Œ8º‘ã¨ª¿´ÓëChvÜ\"<ØKOgíÍÇ8yx/\'ìàøşû{¨5•7İMUİˆœ¶®³eÍ“lãylËâİT#2oF€Ò¶ˆG£Ÿ{½~ÆM»7àîšãB‚Q¦qå÷2ïâÕ÷Xñ(¡ÁbÑ8¦iI*e~8¥˜8c×Şùf.YEiy5=]ì^ÿÏüúûœ<º?Ã_øU©Lp¥r„”:Û¹,µ«ƒmƒ…ËøÉ »×2Ÿ![\0H©Pöyì‚íQú{ãÎ,¦û{E˜ÈTÿ”RTT×±pÕ5\\´üJ&Ì˜Oı¨ñEßWZQEİ¨	LëäÆ·<ÊÁëYûÔXñ8‹.¿‰Æ±“2î9}²‰õ/?O<æ„*	XL8EQ·Pş8À3quJ[¡Z:9~è\0SÜ1‚ƒ<{éå\\w÷WØ¼æ9\"áÕõ#˜:góW^…´¡ùèa¦\\´ yOã¸)Üü©¿äĞÎ-¬{áIz:Û‡íPyªôÖÃ-Ÿú+®¼:ùyuÃHVŞ|7¾ò¾óÿ¾Hog’Ñ†dHÊ¶1v\"şÒ2štàÌÒ–Î^\\å^’á¢&SE¼§R<Ÿ\0\"½1‚A+o2IÆ¯iªšašÌYr	7ôsLŸ·ŒÒŠª³z{Ã˜‰4Œ™ÈÔyslÿn<iA0‰Ú†lâ1+wTùĞmÏ¾%áÎÒ¶@UøÂ¼ß†ÛÛÙôÚ‹,¹â*ªSgú²Ên¸û,¹òf,+N ¤ŒÊÚ:ZOãçßøŒ4Q\'\'Kƒ•WÕrå­÷àñØ´æt\nÕÉH‡½ÎÇRÚ,¾ìf¸õ\n³Ûœ¥«˜·l^~\"ş­0ó+Ó`ê¼ÜúÉ?cï¦µ<İzŒ¨ˆë(‘	(QX6Ø¶r² û¤C=¢¤€]ÂıHÓ¶P}\n\0…¿:€V.°-2Ñn’K“vµR%\\së¹í£Ÿ¡nÄè·¥£ÇS;btŞJ0J3†{¥ÜšòÅbÕğQb dSÂP –yòÌ•bÃÚgı«©Ü|×g)¯®M2…Ï`Ì¤©Hièãå\'Ë£?ÿ.\'ï¥öĞnf-[Åüå—£JJÚ[šX÷üûZñût4-[HH…Ím+&LŠ×ïÏOˆ†ÁÄ3Ø½î™‚Ñ‰±¢´¼še×ŞÎµw~úQ8yp~Ÿ†^\0£=½Ì€m;Æ^K:pôVÄakQË‹ı5åbhh·NVØj©™$+-Ÿ§\0”È2’d¤“¥áÓKIIy9w|ì3¼ïÎRâÍ|»Zz\\æ*	Ğ4Dv`w:~a>\"y¨FåA2ÊM”{KMp0È?ş/íßÍe×ßÁØIÓ0<””ôvw²oç&Ö½ôG÷ípÊc+EÛ©f¾ûw_bÅ5·1fÒ4úºÚYÿÒ“Ú³%­d_8×˜û»;OB#ùyb))%}ıHÛ.8Ïı½}D¢¶ã!(Àüš¦3fâ4Ş÷±/±lõ-É\"¯±˜M(l[8É9®v¹2QJDåîşé‹™Ôd†•Ë †‹|^P2J‹óÛ\0‚pW9Ğ›5©ZšºíÄ°{|>n¸ıƒÜø¡{†ÅüJJ:N7ÓÕÖÂ`V<¦ë””–QÓ8’†Ñã‡gİ¶mˆG!Í-†8\\Lùì¯Ï4G®0Z¡^|†/=‹?PJ ´”X$Bp°ß)Ğér‰F]-­<ş³ï\'S1k4Œ~*Uìh›kµJ²iíV\\ÿ!ÇŒË¹£»£-o¾N_0=G*eeÌ¿ô*îøôŸ0iÖ¼Œµ‹Ç%Áˆ$•]Ågól$ï0mF\"½ÄÁù*\0À¶pvØŒUæ0Æ’•—qÓ‡?NiYùÏl>v˜u/>ÅMoÒtä\0İí­D#aÓ¤¢º±Sg0wÙJV¬~£&LÆ\nf–b(e<Ÿ)¯a¦•§>AmLÈ”Ánú»³ö\"÷…„ÑÇšBğYŠ][^ãÑ_|—;>õ§ÔÔH~Ûqú$üø?8r`;RY9÷*¾’Vß~w~ş/¨¬©Ïyƒ …BŠìÄÛa˜ˆl·¬vx¡ìjK…R¼uã¼?(üÕ>´€©— ¤m3züDn¼ë3Hµy…‰m³}İZ~÷“ï±oûF¢‘0zÂÏï/ÁºúzéØğ:»¶nd÷¶M|à“_dÎ¢å…ª›à	80	\"Ï*X‘î–Ê`¤!˜%Åÿ²ÀWgnÈÅå&	9)TşæÏWg \0r™Âù=‹ğÄ}ß§åÄ!æ,YIeM==­ìÜ¸–më^&¤˜%YGJIieó.¹,/ó\'ÄNâ¿\\^ËÆñJgJ‘Ê,J^¢å\\Ÿ÷yI™®‘Ú°²0ùã\0ÜKåóÙ¨ÀôëİÈ¨ŞšÆş˜~KV]ÃœÅË‹?JIvn^Ï¿ùœ8v\0MÓĞ=şLh©€®f`)Å¦7Ö\n…øÔŸı-ÓçÌ/ ôš®¡I=j(\nDš€P	üDÄ™JÕ‰KP€Hsi¦$Íå`ÿ$?OUÄI|%ÓŞSÌ‰˜ä_0 )/^V×25£<‰É_£‘¯?ÿ8ÛÖ¿ŒÏ \nÑ4=‹ùs!‹DÌ8µ„nº‘….c\n\\ãmfI†Zr*\'*´vVº¦PQ™ä¸ì@I¼¶|©¤¢®a$+¯¹]/^…³£õ4¿üï§éø¡d´›\"Ï‘2+ {÷–<şëŸ0âÏÿ¿ŒXøôşI)­HRc<,‡÷LÓƒ/P‚Ï º®ÊêÃ$Ğ×ÕEOO;‘p˜phÛ¶ĞŞ…æO½Ë0=x}şÄ— \\” cÇW˜ë>	^¯Ãc¢ë:ı½]„ûÁÅ\0ôüiÀ2­,sê(¦”S^<‰&Báõğù˜†a\n0Øß—„÷úü†\'wJ…\"nÙ?ŞR‚H(ŒTÒ1¶\ngLş€¡ë”U7bxü×Ş(£¢fÑh!4,+N4ÎNéXƒJ%µ.ŸÏ×ç§¬¢‚šú+8¤«í4½=DÂ!¢áPF…&\\S Z(I;Vƒ¢VÄµzş€\"M×u&L™Î”³‹^\'¥äé~Í‘ı»Ï0¤ÔÙ6¼ú‹V\\Î7Ü–{…&’1‘ ş,¤)mÓ¤qÌ8.Z´œÅ+W3}Ö<Êªª“»ŠrIwG;ûvldıšgØ·m#­§‘R¦õ;õlMÓ˜¹p97ŞùÉÌïóœóø}?dÏÖuØ¶EIY%Sç,ä’Õ72{ÁÅÔC ¤ŒŸüç?ğàO¾ƒĞ#ÆNæc_şš“œÓş¯´lŞxñ	Ö>ûq+†×ëcÜÔ,¿ü:æ.]É¨ñ“(-«à¹‡~ÅOÿóì¥´¬’÷İùI¦Î^&àsû-„ƒA~ö¥«½…„š¦ë:·ŞóE&NŸ×çgâ´YWqÉÊ«9f<Ò–èºÎŞyì¾ÿ%Ì(-š.ĞË*«?u&KV®fÁòË5n2¦×›±ÓÇc1ZNaÛúWÙøê?´ŸşŞîT8µ*&\0Ü‚ªÅ\0Bås¿ \0Íëó3oé%ó×íTÓqÖ¯y‘H$œ?Û\\‹o:®@_/¯=÷å•Õ””–%Ïôº¡Óvª™vFÏQ(¤¤¬¢’KVßÈõw|”©³æf`êe·Qã&0jÜV^{3;Ö¯åñû~Ä–7^$îîÜd¨Ô‚†QãXqõMCcÑë^~´M44âÆ;ïåº÷ŒÊšºŒëLÃ@I” ´¼„‹¯¸¾hÁÉ8yü0ˆÇ)«ªâÊ÷}[îş,#ÇLÈ|¶×H¤e¡ë3ç.fÉå×¹Îı½İüúş+ÜM²€ˆéeæÜù,¼ôê!…ú˜‰S3qjÚÙ<u?(ÏØb•ëÆœ2{×Üv—İp;U5Ÿïõù™:gSfÏçº÷ßÃšgáÙ‡~Å‘}»PRå¹ï-$´œß •TÇãeúœyCÀ®õ¯2Ğy¿a¡	œòÓK”ØÉÓ\0¤u=^åÔá=è¦\'eäS‚şŞn„´1õ4D^¡%cÒkFrÇ\'¾ÈÕ7’òòaØãñ±xåjÆLœÆ#¿ü>Ï<ğK¢±hRË\0\'Á~Ã#*Ô5æ£_ú—ßğşü0^B 4ç™BèÃ^%-ü%nùÈg¹õÏQRV‘¿B9ÙvZv@M‘ÇnĞ=%I›fzÎ^?vÉwNÓdñÊ«ùğçşŒé-:ƒÇ	Ê«j¸éÃ÷2ı¢EÜ÷ƒgÓk/bÛqŠaÿ&†‡¼³hÖï¼\0`ÇšŠgL‡£Y)ÊK¼4:ÚïğŞô÷¢kZn0ªpªë©ìRvJ¹E&Ü¿íAúÚrŒaBJÍ\\³ŸBPVYÃ_ü+.»ñıÆÙMgãè±Üõù¿ÀôxyøßÇ¶¬¤\0pNÃ´)…ÏçåÆÜÃå7Ü^ÃOÚqd,„`[‘a>tCã’«®ç–|6?ó(eÇPVÌù÷Lê^iÉÿ¹ÁFg[8SÍô¢™>>Ş±‡,»ìZ>õÕ`äØ	gM²SgÏã3şhBgÃÚœãE\"óVvˆQ*Î?ñ½!\0pThƒ82Q3	ÔÖUbz¼Eïèé\"Ø}\n¿Iœò«Dn°N.[‹<Á!ùWÈ0½ÜvÏgYuİ-y™?qìÀØƒeÅ5vÓ.ZDiyEFS^QÉMw~’¦#ûY÷ÒSi+iÛN&¢k‹š–?€IhLœ6‡Ëo¼Ãô“¹éHš.²0I+x¡à¨šúF–]v¥•Eä„c\\sÊpI¤m#mÛÑºŠ<Û‘_\n¥lwÇV(dÚØ{i‚JÊä1M×¤Rhº‰a˜Nz·”Lš>›|şÏ‹2¿´S‘ˆš®ìïÈ±¸û‹AOGÇ\\»“³Û\'J¸&æ9»ä+)§R˜ƒ\"KõŞ\0J¯Tà÷:  á[$CN+JK‡ÌBíïë&D¡9i™ù¤0y<iy\nW³¥dùÊëX~í˜y É;Û[ùÍ¾Áæµ/	‡‡qSfpÏşŠésäsıÈ1¼ïÃŸâàŞ]ôvuº®-“\'ñÈ}?J\n…™ó2mÎüœZÃ4Yvù”WÕ_tO\0İ_‰&túû¢<~ßO’F­Qã\'2ù¥9pëš®1gÑ*êGÃ0ÌL-fÜ@j6¾¶†Öæ¤’Lœ:ƒÙ—¹†¶\\±dtOiJi:ë_}“Ç()eîÒK\n2ïİÛ8°k;¶e¡é:Çî#³\0¥ PVÉÕ·İÅ¤s\n\nŸ®¶Ól}óUŞ¦iL™uó–^š‘P•Ş&LÁµïÿ(?û¯& /¸J§®úµ{¼\n©´ó[»lúÃfFyg‚¶§‚¡Î¿±˜Å@T0`yÑÕÙi¸ë ”¢¬¼†‹¯{?Õim‰Eùİ¾Ë‹O=F,Ma„ÂômÙÈÿ~ëïùÓúOFË@œ:k/¾‚—x ÉàGöïåØÁÉ^~èŞ?fòŒ99@Ó4FÍ,Á~úz˜ «£M3Ñ4®ÎV~ùıOë’«n`Æ¼E9@†Qcr	‡èïí&\n¢lIksR*„¦‰Dxñ©ìisímw1eö¼€Œ˜	pvõŸx\0Ô6 ª®® \0Ø¹éMúÙ÷‰EÂ.ü¹DÙSsöŞ±ã\'°bõ×ôøÁ½üâ;ÿÂ¾mëQ¶³½ò¨Á¢•Ws×ş‚úQcóĞ®`ù•×³æ‰û9ºwWŞM¥X¬¦âa…ŒŸçÉ@Ø )‘çè$\\•ªxÓ„@×4t!x+Q•	£ŞPGË¶™=1SgÎÍûı‘½»ÙúúËÄÃaG…LOö‘6Çìæ…Gîçã_şëœ{+ªj˜9wë^x2@¢$H™JRÅbR}èëa×ÆµìŞ¼GÒÕŞJhpppÓ…S(¤O\n\0%‡÷ìH8Ä¾mÙ±éÜKGk¡ş>Â¡ñh3aü“6`£¤të>Ştç¾ô-QÚ(%Ñ¥Ü9óÒ\0CY(e¥˜Pwfİ0M]²Šò)ã¡Á^~ì~v­_“?\"£6ë_|‚†Qc¸í_Ê@KN´Ò²ræ_|%\'îsl79B­Àx“4÷ÎzŞ@è!ò¹O‘ĞàV €ÏëASı¬û¡”¢¼²Šş>l[\"4-_²-º¦3yúljGæ}NÓ±ƒøü~GÉ+LlÛ¢½¥™Á>JóÓÆN˜LıÈÑ4Ÿ8ŠæZéÓšÃi=m<òËòÒ£¿a ¯ÇÅti„HáègÇüéÚĞş†pp—ûÿê‡È¨ÎqÅÆ^-—ô•zqP!S˜ùî•CÅ‘‰]cš•D©†f0}î’‚y÷§NeãëkˆK‘c;RRñÚsO±|õML˜:3Wğè:Óç-F¢—*ï¦B1± Uñ*Jïuà”Ó)õÇQ1™C!‘SCZ’+jê©®*Á¯G0y–ıPx|>ğé/a+XÿÜƒ?°[J¤Lh[\nJ+«1v\\ÁgÍ]º‚Qã\'¹˜ùhU”â)`Ü¬1ŠêúN=èZ\"#µ øcÑ¯<ñ;ıíO‰F\"èZÊ–£a»Vªè.í<B²õ—xèGß¦§«]×3 Ùe’—RbËâ„n+…•^£;ñ”X¶íæŠäoR)l)±3ªÜ1k:#ÆN,¨Ùu¶¦åä	g6d.³:y‚Ó\'Oä\0NœÆX4;ó;ë—ôT9‘Êç¯\0\00ı¯!±sò¢ÑNú{:ğJŞïõù=n\"{×¢}æj•’6&OfÁ%—Ó0f\"K.½‚½›_cí¿æäá=Äc1”r`ÅªÔÔÖ|VÃÈ14ŒsÖóQY]CcMÇÌ†™™…ˆ¯^¼BOË±¼ùÄÏ0í>¼¾áS—R\nŸwµ±ü­»í¯?ş3bıÍ”ùtHfïŸs)m¼Zœb§bŸˆR¢‡³?F*¿Å…ÇíÑ,JÌ(¦Íaôª\n“@I `¿‚=§)Óƒ…ƒÍ”b ³ÛŠ£¹®U¯×ËÈšÚ\"íÃëD¬‡^z{ QÜ…çNŠFÇD8yh‹õW˜Èf,¼”uÏ?DWë©³*b!Ì\\tÕ*PÃ˜IÔÇ¼×±óÍYóèÏ8~`\'RF1=&ŸÿœÍ‡¿¤Œ’ÒR„²Ø¹¸òETF+cï¦×è<}ÓpëÔç°ZA€V´¦ƒ{8´c¦á[‰¡Ÿ\nEKÛùò1„.ºÈ-«I…!TÑãƒ¦)!‘\"W‹ø}npXu·m¢áALM¢r1\n…´hš à÷`ŠáiŸé3eèÊI<_‹ƒ\n¡îÁ8ÒR‰cjr1âv]ß`áe7}ÎÔùË9i.Í\'Næ7’‰Â0Ò¶=a³—^‘aıÖtƒªºFVŞôa<2şï¿L¸?D,^<Üs°¿ÏµFŸİœ˜¦‡Á`Œ`H¢Åì¤ZªP(‘˜,h	‡Ù½éMBa\"]é\0K\"È2\'ù®8¦a,æğ®y]çºÍ©(¯ô¼*\0ËŠ™ƒl¤‹+t]åV¥B/•¨”\"»t‘¯ï¹øR9ö°bçqqPh¦0MGõL`.ºsÛìß¾‘Ş®6*k\n>Æç/åº;?CÓİ´5vB”¯¿„‹¯¿ƒÉs\n‡†îÛ´–ğà\0J	b‘(Q×¥–¯mxñQvoXsÖS¢iGvoÃôÎ8tÜì;‘7S8“I#?|ˆpTfTV.äjF½ÍŒI! ’÷åkñxŒ¦Ã‡ˆDìLÓr+øfbºq6,¼Jƒõ*f+³,I4âüdà™(èéêuĞ‚ó4İ0)©¨%“°$ÖA*IiEmÁ|	Ë²èlï\"±óJ­œD¨4Á«âòü6\" Ä•7şW „ätK›^}Õ·}¤è£f/^Á­Ÿş\n¿ùŸoÒ×Ó•Üõ³SÀ“.%ñ«nx?×|àcıÓ\'àà®M|V<Â`owÁ~ôvfëÚçˆE#…aó0‹JƒBÃÏ3bx\ncô+ic[!JK=a%K¡©B²b­*Y\\¸HÛ¦·»›hL&%Œ”§˜s*ôu$ZBK)E!•Ÿ)Ş˜H‚wæ|¶ ×‰Åä¸9xZXÒ~º™êºyç­~ôXêG¥·£-oÂUYUcÇÜTz;Û‰[±‚ôCÖ%ë`\0†_G;ß+%$|ÔuÂ,}}½¬é)\\r95…#Ñ„¦qéõB	/ıâ¿9İtÌaÀl<Nw|\0WŞ|\'7~ø^*kömísqìXqéE ˆtõsêdSÁ~Lš³_åHZO¥…’æhh.r¦;HIÀNÏ9O	F[	§E`c¢4÷(£«<°iÙ®¤U®;Êô˜E¥€f\n<>Ó-qå\\(İÈMI¢b\"=øU)­I§_…@EÄ”IDyİ¿„;t7$XEƒ|>~¿‰FÌ	<J›8İŞ³©så=ç;™™‹¯à•\'DÓ;ˆ´mf.YM]zÒ¶9¸g1i`	o±eÎ½H“¼vÄ•8Ÿ€ŒÛÈX•9­’j¥R‚][6°æéG¸õ£Ÿ/Oîñú¸â}w0nò4^züwlYûƒ}½®+Q¢é—É3çqÕ­w1gÉŠÂ‰-À¾­ëØ²æIdl\0Ó±­8Ç÷o£»ã´³«dµó–1gñ2Ö=÷ñx,YX2‹…€)³±êæ»èîdç›/Ò|t?±h˜x<ÄHBr(…’	¦(N1¶m³ª¼M]Àè¼C%‘SbRÏ­b“F¾–2‰‘FèIt`\'†ÀI°Ê…SRá(.…=ã^|¦³Ş\"™,#3DV`Yu=º¯‚xØÂĞ@;\0£VÄbË›¯±úö{ğæ	Û®¨®eå·sôÀ.šBº©ë:fÌâª[ïÌI©N´x,Ê¶7^BZ±Lh÷‚:S èp0ÓÜ$•§†\nGxî‘_3~Ê®¸²øãtƒ)³0vònûèçi:|€Öfì¸Eymã&M£nÄhü’¢E:ÛNóÔoÎ‘ƒ˜);¡LëìÜ²ƒ»¶²ìŠÜğR¯ßÏ>ûç(	ÛŞ|‰¾nâñ˜ífPVQÅœE—pû½_aü´ÙØ–ÅU·ŒÓMGØ±a-›_™Ã{wFÑuú‘£(¯¬NBVWÕ5TGMÓdÚ¬™„û’Fúî¶ÓôtµejîÄVU×Sİ8ÒÙk•bÌ¸1èF~w˜nèŒ0;KB‘õ÷õÒÖÒŒ´lWcI\"×ƒÆQã()+Ã–’ÊãĞ4£ÀšéŒ˜4Í[Š‚Öz:ÛİèD…eKl»0{-X~]m§i>~˜úcxéáû İµ•İß`á¥ùigî²•|ú¯ş•çü%G÷ïD(ÁÔ‹²úıw3eö‚ÂÄöÜ¹™x4rV–|%EÑèËóB\0è^®»joòlœ¹“:›òğO¾Miy9Ó.Z<äs½>?õ£ÆR7rL’ø…c°¿g~ûc6¬y¡É³cBèéå•\'`ÒÌ¹Ô5æ¦+×Ë§ÿß7Ø¶n›^}ö–&”RTÕ6°pÅ,^uuRó0L†éaòì…Lšµ€ÆÑãùÙü--ÍxıeÜşñ/qÙû>ìƒ¦ÎR«¬©ç«ÿñë)Å¯ÿç<~ßˆÇc™‹o˜,ºêı|äş*ù<!´‚şğ@i9÷şÕ×3ÉkO=È¿ñ5‚±0 ’v¥¥åe|ìÿ‹V^…B¡}vúÏßE¡0“Ÿû_xèç?p ×4A<n†®WU]ïÿä¡”B×6®y–×ŸyˆxÌöñüC¿dÒ¬yTVçÆp¡1cş2¦Í]œôrè†‘†U˜Ûúzºxö·?%40à¦^Ÿym{áÕç{ypÓ£ah¥Š…‰@gï¶Íüü;_çƒŸşæ.¹dXÏBœLXwOİÿC^|àÇèvÔ›ÍJëÒa×úyáÁIÜö‰¯äTòú,»âz–]q=‘°“,ã¢Á±ı»xşÁŸÑÛÑ‚×c`š:†Ç@w+c°Á*JIt]C×$*ËOmh]IB–°ÎJ@ÒM7Ğ#ÃàØt1$ÚPêYFšp˜š“â«Dûèéh-zÆ„@\"°¬(©Ø¹éºïÜö‰/á/)ËK\'ºn.“ÖÂÁAşõÙ³ùu\'ÿ@œ!°—Êú9_€RöoêN¶ÈSF){~l_Ë¯ÿ«ƒîÛ?Æ’Õ·RR^õ¶õçÈŞ<ı›±îÅ\'\n[ñqJeØq‹çøš0¹ñ#Ÿ-š\'ïËSs0»Üµ…û¿ÿvnÙ\0x©¿eÔXM(LM¦r€x«Ô\'Üa(¡(©ˆK-\'Ãóìúv<ÌÑ};èëî,˜›!LPx5‹¸Oj|2ÜÃ+ü©sİŸ9ëz’Áş^ıÍÿñÒC?%îÃ<[+¾İc Ïu ãv,†Š+ĞŠUßMù•ìØÆÏgãš—XuÓ¹hÙ*ü¥eî.te¬]ë{gk3kŸ|€7}”ã÷ •ÊdşüÕ‰…;yì§ßãô±ÃÜxÏg™4k~*ñf˜ïyıÙGxú¾ÿãØİîó‚RÓAÚgtšÙSË’DÃ6ñ˜:Êhv`ÙoÃN×$-N\\‹‘„Cw!ÑM\"hœô²íñh[¦Š7½ö³/çª›?Rí(u¿eÅ±eİx8Úİ3÷}Ÿ¶“Ç¸ñ/2fòŒaíøàXüOİÏ?û^~’p°ßÑ:l+o\'ĞÙ3>K§c©@·mdüs¼ó\0`–øüRw!¨İÓ¿tT²Ö›“5¨	;ÖÏÏÒt`#£\'NgÆ’•Ì\\p)c\'az¼.¢‹VÅ!ziK¤m„8yx»Ö½ÄÍ¯Ò~òáĞ %şÂÕdrqy¨ Û×>ÊécÛ¸èâ«XzÕmŒ?ÓãuTc¡g¾_:(7¡Á>l{“7Ÿ}Ã»63ĞÓEyIfQ\nŸd<Ä`_Ï°åZ†^*ìX]³Pzª¾_<1ĞÛ=¼iyZ__!BƒARáDÎ8o˜Á¾^úz†{•œaš„‚Äcq&Üù®·£‹_ş×¿ĞÛÙÅ7}²Š*4·è‹’\nÛ¶ˆ„CŞ³ı-İİ}ØVª`Gbş#=¼øÄƒìŞ¾™WßÂÅWßLÃ˜ñ†é‡\\A)é’xŒ®Öf6¾ü8˜Ö“Ç±ã1¼İAQÏÑXS¬l¬\"ƒˆŒRİóÎÙ\0Î©î±»õ)ÆU,¬zìàß~ıôà¾OçEFpòáÚ_ïsı¡\"#pR\0šf£a£¹ap\"«ZRÊÁ0=˜¦—@Yc\'R]?’òªzL¯7€mÅ‰„ìé¢óôINŸ8L8ØO<ÅŠÇÜg‹a3WÎwÊ1`y|~êFeÌ”YÔš@Ye5_‰w¢·³•Öi:´›¾îâ±¨c	Î3$4*ª’%»SQrÙsÂ3H|£¤Sm©·§ƒşŞ.”tí,Ò©«€ÒòÊ$‚Öˆ35†à@½íI×Y‚ª‡IMİH|%¥Y®ÅâUu…ôt¶Óß×K¥\n¼şRjG3qúlêF£{L\"¡ í-§8yìıı½Ä¢‘´å´(Î™|œiz()-gìäéL>›ú£)-¯D\0ÁÁ>ºÛNqâà.šï\'4ØO<u6¢„V“Ê\'2è2§àKFf\nf}a4U3KPy¼†æ‰Î¨]ı>³âk«Æöm·¼;Ü€ºÀBC¦•°r¼\0N*®-…ÛUU˜4W(ÂĞ¦éTÙØó*=FT‘ÀqI!;b;mÁRÌ¦ŠÆËˆÆa0Nk×nvïŞ“$vA\"@†ÌÀU¤Ä¸ÛÇîÁ¦´=EXŠ´ØuU¨g¹UˆÓßÓ×ÓA_OGr¸ùw¦K;l;N{ë	òVPI,JÑ½(ÏqN¢‘ -\'qºéˆs¾\"	øšK=3ëi±Ğ+nÓ×ÓÃ®ÍëÙ½e™ÕšÜÕrEc#­‚p\n6ù“Åhl·˜Lbmò¬µˆ‚ŒŸçn@©AËƒe\0óTyˆÙ•¿9—*U„neaÂÎSóN%*\0ljşÈ,ršSú,£_±šCÔÿSCôï-µâ@qa]àóâ€2{u–Y8Å•§ô<(Ú™ÿ9ºJw“‡PY‰V‰ÂñnµßÄ}FB(·´¬H’²_€8ßC‡ ,æQ„ÁP@g²|E/•ÊS¯P!\0Î¤\0¨&ÃG\0È\"×¨<\'—•JJÆ=ˆ¢÷vUòó¼ ø‚¢¢‚\"5	EşëUkÔ°„ÖĞÍrÍˆºÓáØ¢Ü¸¿¹8=ÓR¥MKBóN(µ¦@»P¬ğò(¥ğùü,¾dSfÍÉÊœÊU™¥\n†qô–Á4Š3¸iHFUÃº_ù{ò£ Ÿ9Ùg÷-lÉœÍ³Ô4Ä0/RÅoN§ŠÙEš5@ˆ³éPÎ<·èŞ­Ø¸æy´¯BzÊdRb$ß¥lu×N.€²ã8!îY°UÊÆcX¸|«oı s¦:SN¸Ğ.´sLÄJIÕ^x9Áâ&RE…F}Ş\n\0ár°ß™”lpP%ñ\0B)Ç¥÷^âïw[	9õÛ¹cb¨B ¥pJÜëd^KÑ5ço•¡œ§@á-÷¢ùË°m²J«9úZ“­×…³ÎÑyjõv­¾*ğ@5ÄcÏöÈ Î²Ÿd¢_œ%ä>¢Øñd#`¼ƒ3—gÔUüùâ®-ğ(|RŠ][6 LÊÍF,~¯›×a(´ó:@á3X¹„\'€H4Æšçâ•ggH/@öA;ãq²83d1rÊğ6‘¹×ªá\054#«³1¥ªiC±–ÈEi®pX^àlŸµÛæO\nC€ÂßMvŞÃ™Ã÷ª\0(Bâ4¥in¥ÙsäÌÇÈÉBo— ‡©·ËXÌËQ8 ÓMÉ0â\0Å]gd@^e|P”!‡+\0†#†ëÔÎì9b˜‚æ¨ip=¾Ğ†¦ÿ·• /UßËí]pŞµl¸ïŒs³Èø;Q}6=Ï(»ˆNáãrJP*óï„ãLÚ\n™aHˆ3ı“¶ûgŸ´Ô;=‘g!ì”Êš´ìçdkkihÆ&}^T*L°¸!ä‚\0È şa­W± œôkRZïÌHŠsCÂ¬‘€¥Cèš¯¥k>\\\"Ä™ÍÓ[•GJÊd‰lp«ı¸A;º¯“KàÔ¶—HÛ‰¿J\" ¤‰PÙD¸›ë+OŒBåQvÜ‹Ÿ/P:eÈùÑS¼Và#Òã”zë³)\n…3§üü\nWbkYÇœôPåwX8¼;â\0,‰²m\' ßK9Ù|NvH‹ “9sŠ]Jâñ¨ƒ€£ŠÕyÏÃ¬éçä¡¶µŒ#va;ÃìÇ;ØyÓ\0C8L/Òº‘ş€ı¬r‰4Q¤Û…>«ªm ´<U•Yh½=ôt´!¥ÌˆJÄ¸èYBX%„TÄI|ÃäKÅÈc6Q””VP?bÁ~ºÚZÒÍ0&¦èLœÁñ¤àÓÃŒC%4”›Éxş\n\0‘Ş(28+aÓ0åË«ë¸ü¦;˜0}VÆî”¡¥-‰FÃôöpºé(vlátÓ±<·€KÏ­Í$)•K j8ìäBS»¸–š“„uœÉÄ‘‚vº!bUaÙ¤Šˆ¼B¶> „îùS&Î˜4]§õä1ÿùh:Ñâ¦ç…”Ïúû­l|£ÆrËÇ¾À´‹ÒßİÅ3¿ı)›×¾P„.ŞMåSYMÙçy2µPv¬p>ˆmğ™,]yó/¹üŒİ×ÕÁÉ#Xûì£¼ğĞ}„CƒgM¶oaé±3ó‚ŞI2,86…bŞ²•¬ºñ6Ê«Ü¼SGñÄ¯ş—cv#ß0ÉÛ×VßúaŞw÷§1\\è3_I	ÍÇÑ|ôPáú~ïæ&Îk`±n\"…OÕ±Ï!Ä´Üët¤ßŠš:*jê7mÕuÜÿßßpÁ%ÿğ\\6çZ4ø|®¼åÎ$óØ±‰ŸëØ±á5lÛ˜êï£Ÿc&Ow¡¿VÛ8ŠòªZ”:ø8ïâ\0Ğ}Â0İ³PvÊ¬Sã%³oÛâVŒúc˜0mVFĞEgÛiîßI<£º¶‘‘ã&RQ]“œà²Š*V¿ÿnÜÇKŞïí&mÉEKW0iö<¬xŒë^ãÇßü[wç—ïæwfïÖÌ¿ä\nÊ«ª8¶7]m-E!Ş/´w«\0PŠ’Z?Ş\n+[Ÿ^:‘mR9Ö0¥öòÈÏ¾‹\0®yÿG¹çOş¿‘Bâ=´k3ÿ÷/IW{+†a°äòkøøWÿ‰úQã’×T×5²èÒ+YÿÂãD£Q2ËÈ»5ÚÒşNjgœ:×’\\¨¦›H˜ùİ@¢DæÙpa·Tâ¾da?áÔ%H\0N$\\tp’/0\nM%Q‡œ~ˆŒ÷IéTÕ]÷Ò“ûûxş_ĞÑÚ’O>4’ºïuú)“1!´œg©4`”Ä<BqN\\÷üC¿Àãñ2ï’Ëè8}Š§îû?ÚO5ßäøİõKô%cEĞ£•”N¦iÒËä®É[>©óğ”@…7Œ-dÁÂQNsLªOîaZ×Àï‘¼ˆ±ûÍçØñÆ*VàŞŒëFŒÇ¸	ci9~¡iHÛÆã÷QÓ0ŠÒŠjÓƒR’X$Â@O;½]mHÛv±Ó&Îôàõ’;£H$$SRVIemºn2Ğ×EwGA†J!)%%eUT7Œv¡´ ì§»íƒı½MwªåØ+t<¾\0šn¤J¬¹-„‘Ò¦¤´œÚ†‘Ø¶Mgë)¬XÌ­Ùgáñù©;¾îŞxö1”’TÔÔRôt¶a[VfŠ«Rxü~¼ş@¦#ÅŒ¡bÑ0şÒrªêğzıÄ£ºÚ[ˆ„BIønÛ¶ĞM“ÊšzJË+Ğ`?=­Äc±Œó¼\0<’dõæçúÏ?øsÛŠc˜FŞLÑ„K³¬²šÊÚ:LÓC$¤»½•h$Œ¿¤¯ÏB	…ˆF\"9kŠÊš:jFâõR2Ø×Cû©“DÂ!·ŸÃ9Wiï¬+ğİaĞèê!KßfL¢Êy†ahxLñXˆ¾®¶_˜/ ¼ªŒîVÏÏì¥—3kñ*FŒŸByu¦Ç‡”6±p˜ŞÎÓ4ÜÍæ5OĞ|d_rG–¶Í”Yó¸ô}¦¤¬\"m§†X$Â›ÏüòªZf-½ŒÚc1}İíì^ÿ\në_xHp0×ğ¡%å5Ì¿ôZ¦/\\AÃ˜‰JÂ!Á^ZOfïæ×Øõæ¸‚À–TÕdåÍ÷0bÜTlÛJ\n\0İ0yí‰ûÙôÊÓ,Xy=‹.¿Ñã§pêè~ûéÒÙÒ„ÇçcÖÒ+˜½ä2FOœâ0ˆÇ‹’ŠH$Dw[+ÇìdË+Îø¥[®Ì¶,æ]ºŠK®ÿ\0º®§Å^bÑ›^zœ@i%Sç/§~Ô|şb‘§OcûÚçÙµîió/aÚ‚‹9~2åÕè†Á`Çìfİ3Ğrì€÷¥š®³üš›Y¸êzì4^MÓ9q`\'k»¾®ÌâRÚÔœÈÜ×0yöBjGbz¼„ïĞö”–W2}ÁrÓäµÇïgëÚg“k£¤¤¦q</»ió–Ò8z¾’R¤mÓßİÉ‰ÃûØ±îöl|ÅÁ”<C \0= cz/ ½}ú„«{}~Ç˜•ÅgV<J<Å(áº{ş˜K¯¿“Úc\n<o>sW\\Ã¬¥—ñëoÿGwoNî\nµ£Y|ùM”äÁ–?}åUµ”WgÖ“›¾à„.xíñû°­x)Ô™ÈÍŸü*-¿’²ÊÜÊ5Sç.cŞ¥×²uşÅ<ñóÿ¢ót(EiEó.¹’I³æÜÓz|5µÕÜrïW©=\0¯W§¢\"€)ãú{ş˜7ÜImcñÏ†%—_Ë¢•Wpÿ·ÿ†#»7£XŒŸ6U7~ ïm³-§¤¬’ÒŠêŒÏçW\\É†—QQSÏÌE+©Éóî…+¯aêì¹Ü÷IëÉ£¡¡ëÓ.ZÀÅ×Ü’s}Mm-;Ö>At°=Ã0cÁ¥\\÷‘/2}Á\n<¾@Î}+®»PT¸eçOŞÎ¾ÍÏ;Ç`â¬Å¼ï_eÆÂxóÜÑòU,¿êÖ?÷ Oß÷]z‡öô¨Lxp3 ;Ù€ïĞ1à=#\0„¦c˜L¯M7˜±`s–çÖëj;Egk3K¯ºU7İMUmJJ\"ah2ØÛÍˆ	S©©•„Ÿ<g	«?ğ~yâ0Áş^Ë²‰„BøJËÑ³ê\0Œ4#oK+ª¹â¶O°şågèéLªÌU5|ğÿóW]—<ÇJ)“^ÓãAAyU-—¾ï.û¿ı7ô÷t ¥$	9Vz×oŸh“ç,aáª’ÌŸØÕ¤”,¾â&V¾ï#TÕ5¦Æüƒ}İŒ?•šgüBÓ˜4ÛËñÃû{!‹	b˜^Ç\"Ÿ6ş†Ñ®Sİ¨ñ\\ó¡Ïa˜‚F;!s–_Éäy+hn:‰·ĞMˆD¢I{…6ÎXÜ\"UcNà”6Óç/ç/ş=gÎÏxvB{ĞuƒŠšúŒï‚a‹Ş …@cÌ¤i|ğş‰©ó–¦İë@„kšæô_jGŒáª|š¨%¹ï;ÿìŸ‰<\\Ÿ.\0Òb<<q+j¿cÇ€÷Œ\05a×~äÀ–Ô™È„órvÒÁ¾nölXC$8À‰ƒ;xüÇßdäøi”WU³uí3ì^¿)m*ëùàÿy+®I×g/^…·¬öI\\éì>ĞÂ/ÿ÷‡ŒŸ2…kn¹ µC„Ã!º;:èlo£¡q£S»\\Íˆq”˜CsçvPNüıU×œYK/O2¿eÅÙöæëlxõÃdÅµïcæÜhš†n˜,¾ò&¶m\\ÏÚ§¦µ}§û+6¼ò\"‹/»š™ó—%…À´ùc¸ŞX,ŠÓ×?@ÄÜ¿‡‡~ôŸŒœ0òÊj¶¬}ë^FÚ6Uu#øğ—şE+W\'Ç?sÑ*ô@Á® J™ìØ²•È·ÿ™Æ1¸úÖ»ğR•â±ı½ôö‰„i9ÆõÈ8Íôú¶Í@O7}=]„¨¨©£nÄ¨Œ…çåq‚‘ô¸bíKÏÓrº¥—]ÍEK.Iô°Æa0BH*«ë¹ìæ{2˜_Ú6MGö³oûFl©˜2ó\"&L›´)\0X¶\"“ø~®¼ícLN«?	yı¹GÙ¾nÕõ#¸ü}dÂ´Y\0ø%¬¸î¶¯kINÅ±#”Rè–,hL>ÿÀ°¥`î„5™DÃè	$ÊagÚl+Îæ—gëš§ĞuæÃ{s½”¦‡@i9¾@	–§ët/üæÌ½äêäs|%¥”•W¢i§Ñ´j¢µ¥…éÍçòënL\n\0)m}äAıÕÏèéì`á%—ò—ÿò-¼~?àœY«ëG¢Ø‰T’Ò²\næ/_…/M€ìÚ¼‰~ëëœn:†‚]Û·ñ§ÿğoLœæh¯Ÿe«oá•ç^¤½\'BÇKkBP=rÓç.I\n\0Ÿ?€RŠ#û÷°ùÍW9yô­ÍMœl‰t±÷@RJLÓ¤¤¬ÓS‹sôdÿê§,¼ôªäø½RŒÒz‚¶ãØ·ÿûfæÜE¬ºşıI ¥díóOòìC¿æÈ¾Ä­8WÜp;Ÿü“¿¡¬¢\"©…ìß¹•‡~ö}ölİ@08À„)3øê×ÿ›1&\'ç¡¼²M7Q\nl[±gëFönÛD]Ãf/\\NFÌO¢[*FŒÈ¢K¯ÊĞz¶­[Ã÷ÿùÏi=y€²ÊJ>ô©?áÆ|&É°š¦£”óŞåWİáUXûÌ#üè_c ¯¥$MGöñ¹¿şw\\/SıÈ1,Zy5›^{nøäş.EyW\0+¤°,Ã4Z8Å²bÈI!YÍ¶,ZNfÛëÏñÒC?e 8ˆF2Ü`Ò¬EÌ˜¿œ‘ã§SR^A4¢ãÔ1âñxÎùüüÚ Ó®c+ƒ©-Ñh”ë×Òvª	!İí­ôvwÑ0jt²Ÿ>Ÿ…R6cÆ§º¶6}[àÀÎ-´?ˆ¡ë(m\'°qíKI „`ü¤)”••bÅ\"NqJ•¿¦ÚşÛøá¿ı=‡öî$lR2mö\\æ,\\Â¸IS)-¯ ÑÚ|\"YÎ<X=>?	³¿r²ñ¢‘¯<õ0[×¿Šiz°m›C{wĞrò(Ó*æ\'5„­o¾ÊÚBw!±O;Ìş›=~RJèúüL˜¬‡ \nÇ?ë¦É¨ñ©¬©KëS˜‡úßœ:~4Ù×Ş®Nîÿá·ĞƒªšztÃàäÑhšÆ˜‰S¨¨J­‰”’7_z‚¾ÎÄèÙ±îUîÛ™\0BFŒ@yU}İhZ*#0#7Pàæ¶8$Ü»ç­\0pj*Çµ•O Ò@$r`.T.£wµµplÿN¢Ñ0v<N<c ·‡ÎÖS4ŞËÑıÛ±âBxÜjC:+®»k?øIÆO+”¬ìÈ7æ	`	O’\05aah\"+”Ó£ÇñëaP:¦Š\"3jÇ)tlÍFØUUeø|şä·ápˆşvaaè”²cƒt·Ì|‡×Kmm¡ÓnN@#\\ÒŠÅxé‘ûh:¸¯®Ò\n®+„®³êÚ[yßgÒŒYÃ¿Çc¦\n¬dU&ÊÆ¤Ê©Çb1bÑh‹ 	ô§³\nº6|òL„†IMıˆŒï\"á\'îÇ0‡Ó¿ĞÀ\0¿øÎ?a‚x,Š?PJıÈ±•†#áÁ<_R»²bqû{3ŞSZ^IMİ¢¡Â½_äìø\"ãs!ŠóÙ  n)¢(;C&!4—àDbÂò$}4ÚÍCÿû¯ôw·9%±Ü:q±hÄÂÑñ¤Õç›µè\nnıøÓ0z|ò§›èéh¥aÌDÊ*«³ºé0®AöÙÅ/\nˆĞ‚4|z8G@èš…!âØ$Òg33Ôl©·u”f’€&³³„R³5âRwæFˆBji:ÆñÃû?¹¡§±¿bŞâKøĞ§¾Hã˜Ôø;N7ÓİŞJãØ	”Wæz7<:ø„\0pæÑ³t1áf;êCs„º©	\'2‹t4wM´|» º¡;}OK‹Ö²\nihBÃçñğyñz½èz®vhè¦[6=È©”ã¶Ú¡d¿¦kH[f¬‰’¦#í”†ªd.’oR#R\n‘nJU¡J®tZğ–ad–*;ÿ€M;égN²»›ö+ÓJ.äKŠ„£´¶uÓİÑ¬Î+áw$†R°øò›’êÀ¶7^æwÿó/ôuwPQÛÀ·|˜«nûh*’-–©‚Ú2×]`KˆÛNl‚[*“`•…‡0šac&	%¿óûK©®­s¬Ù®ÅØëP7btÆ3âñ8==ıÄ•+\0”@fÚèêh§·/HL™Øvb.B]|Å4ŒNËkøù÷ş®Nªkj¹ú–rı>’±KÛÊÉl÷¼Á€šæ]Éôçì´yM˜nš¶LCw«øfJ	¡ÎH/QY×Iq4âè(Ë¦«³3SpùüÔD[G{†\0õûK˜·ôRZO5qºé˜SOPÚtwuf€ÏJË¨¨iÀÖ4wM²Ê#s(¤o Ÿ¸\")\02ÁéÇ\\õö”PÿÖ\0ñÁ±`ÔÉH•MT§ t×ô é:fUC×(÷È€Bb»¹ˆ{\nÓã£~Äè+Ìñ;8¸k#BÓh?İDye5WŞzO–š*PRd„èæ[¼äÚK•·P‰R`K%ÍGÒÓÙÆ¨	S“D1kşB¦Î˜Ìñ»šÎ¤ÉÓY|É¥i÷+NÚKd°MXBÃ°,iK÷*’µÓKÃÈÑc;´o7{wlBh:m-M”UUqİwe\n\0éXÜÓâ°óD²ÚJw¯“â2w“€%İ^)…&‘™¥liÛ©M•›>«l¤ÅŠ‡±bÎÜôvuRYãœã½^×¾ÿ.Z¤«½€òÊ*V^{w}á/±âq6¯}gø)‡vmçÄ¡]ô÷táó—$5ˆK®¾;7ÒÑrÍ0˜¿ìRÆO™Ñ–ã‡éimFhzR.-CË_ï¼\0(tŸá÷ -•¶ã¦¶)¥e•,Y¹šQã\'1~úLÓ“ñ”Æq“¹òö{ìïåÀÍìX·&Cö¦ŠB<!eÜ?nÊl&MŸGp ‡Q§qÃ]ŸÍ ~MÓ¸hÉ¥”WUsüÀBıL»”±Sfaz½Éëtİ`Îâ•JÊ8´s£“Ë¶Àº®3cşR’£{¶ròĞ^v¼ş<Sç,rl0cşRîùâWÙòÊ†‡%«ocâô”\"	³á…‡1bİTVÕ1uÁrJÊ+7ir†o½®a—®¾Ş®NšOæğ­ğ²ãÄ¢ÁŒñO>‹YÍ£¿¯—±¦qóİ÷æŒÁòUTÕÖsdßN¬xŒé-bÔ¸‰x<¾ŒñÏ_z)e¥å;¸‡cûv\"¬\"íØ¦i:“¦Ìàš›ßOëÉcÜ¾¢A´,µº¶¾‘Ë®y§›Ù½éuGgü´ÙL˜<-Ã8XS×È¥—_OÓ‘l~óN?Ê–µ/på-w:ïÓu.¹òFşR6­y…bÖ¢å,»âzü%N>ÉÕ·„Ş®vNØK_W7o>ÿ$7ôóÉ=bÅÕ7GØ±n•µ\\uË4¦Û[N²éÕP’\"ù¹ŸK‹óDîÕÑİ=OgşBÚTT×°ò¦1wÙª¼3ic&MÃ¶,¼ïìßşf¢¬€#aÓbÖ¥m³gË›\\´ür¼.Ó]´låU5öu1aÆ\\*ª3ƒDtÃà†{¾€eÅùİ÷¿AËñC|â/¿‘c+0=nøÈç°-‹şóW8yp_æ„›.¿ån.¹öîûî?rhÿ>^~ê&Ì^ÌÅ«or™HcşŠk˜¿âš\\‚±%ë”Ík&Ó0j$w}şÏSDZ?u:ŸúW(¥xö7?¢y÷:7\\X²wÃæ/]éÄóó–\\Bå_ŞN&Î˜›$£·Şó)¬xœßş÷¿\npï_}#‡Ø=7ä^¤´ùõ÷¾NÓşegÍÉÒ+®cé×ñÚ3pòØa‚iĞYN›0}6ŸúÿJëÉã|ó«÷²ê†Û¹éîÏåŒsÜ”|üÏÿã‡öqàS»èîhã©Å¸©³™<s³.^/K.¿†%—_“—~öíØÌk/<N0FÓu~è—Lš=Ÿ9‹–»ëêåš;îáš;îÉ¹7‰ğòã¿a÷Ö71|Şb•ÏsÀœSCœÏuàü™cPs‰^ÚøX•;ïó”DÃÆ£[©˜îôç)PšÆ¦fô¸ñ¬|ßGğø|¦‡É³¸ÏPt·5Sİ0:÷ùRºgÜü† Òú¬º.ZÉ¯$º^F¨¿‡ÿ÷_‰‡Xºú–¤ê™İBÁ~^æ!ÿÙw‡‚h¦¡C’()±XÎk°ö¹\'h7•«nù°3~‡É³ç\'ÇßÙÖBmÃÈ¼ó+t×X–‘—ıNÓÔü~ÃrËÓtMá÷é(KK³Òç<¡œ|‘\"M )óHl/œÜ»‰_ıç_sËÇ¿Äœ¥«’AC¹ë$Ù¿íMøßoĞq|7•%Îu}-‡øİwÿëŞ?eÎ²+1²4ÎDëílãå‡~ÂËş¿\'ÈÖ[èFYb`˜çy.€VÄ¥‘Sß>_¥ŠXŞ³%tl»0ãÙVœS\'a+“bxs=]]<øÿÅşÛYpéjF›„nt¶bÏ¦×im>ÊY6\0„ÀŠEio9AO»6½NIye&®¶ãqz:Z	‡Ù·u­\'gØâ‘0§›Â@CãÔñ£üú{ÿÊÖ7_aÁŠÕî.\\‡’6}=]Ş½ío¼ÌŞ-ëèëAh’ÁÁ{·m¤³½5w$•¼Ôrâ0¦ÏHzZ‚İ<öÓÿäØ-,¸ô*FŒŸŒa˜tµb÷ÆWim>Æ·~4Mx9º”Ñ}úÑH„]ë^r’òœamË¢ëÔ¼šŒösl÷f¬¨“™˜hš¦sêĞNÂ\'b´ŸØÇÎu/fÌ¹İí§°Â½´Ÿ8ÀM¯fåQ¤ZÇ©ãh2ŠÏRÙÚñ:?ÿf3³\\ÊÌÅ+=y&åUµ†I(ØOËñCì\\ÿ*Ûß|‰¶“G1#™r‚£ûwóãoü5s–¾ÈEË/gü”™””W8ckkáàÎÍl{ıEïŞD4D3Ì¼;\\Š<2SË m‘¿¦Ëï©SóãîÖ§W±°ê±ƒûõÓƒû>7àA@û‹]´¿ĞŒ	!4ü\']·ø~G,&\nÙ?¥$š®SRV‰ÇçCA<#4Ø‡mYy“r@‡¶¯¤4(#½Jm$8ˆmÛøKË2üÊ	ñ	‰FÂIŸ¹TMÓ()«À(IB^YVœppĞ`?RJ4÷\n\'ëÏ_Rê2bÂP–;ÉÑHØµ{¤¾—J¡k²Š¼ã/­Lª$\0‡ªÍÒA“½õÅ¢Îø4]Ç(Å0Í¯A<%D)…×_’<’%Epâ÷Ãƒ/^IAÛ¶ô9ZJb¤Ä0tü%ex|tÃtsâDÂ!úûúˆ…# ´<†ûuÃÄ_ZÏ@7ËŠÅ»X–	ˆ‚A=…ˆVÌùÊªç”£ìÜ‹ÍQ»ú?|fÅ×VÿìÛn,xw¤ë_HBàõû1<æê®\0¼‰\\õá6¥2Ò9KÊÜÕ<ïà†íŠ”Ÿ·À:ûKË’ÏÏÑnøKJ“F¨ìşÄcQâ±Hò­¦iRQ][°ÿ*\'Q€Ò~/¿7ÏhĞâAçLŠ ¼ÔŸRñ¼Û…Yâît*Z”Æ>/~¿H [IhUg×èº¹/µvbÒ‰ŸNªxyy™#€d¬à®¥kà­ªÈÚÙ”+D%ƒıA,Kf¸‘=¾2<¾²â|êªáÃ±Àğx)KË%p6A2Ëİ«ĞÔH°Ë&no „å×ŞÁô…+ŞÑÄ‰÷\\+RE-W-M‰—l0õbBŠ¡‹avQ¥]Ÿ^î!3jÜÕ²ëŠÜ‡©\"ĞÊCÖF%?ÜºRŠm¯¿ÀkOŞ¦É>¥+ˆZÚÌ% àÍrÿ2}wØ\0¢Š¸¥!í\\t)=ÀÄYKXzå-˜öB{×¶îî.¢?ˆ¡{œ\n	7Tm+¥éZQŒHñóM\0ÑE8f8g ¬*8J)b¶N$ÇŠÇ3ŒHÚ…öniJ)”ÁkØºÃÑ*ç ’úW&DÁ;ÿÎ»øÊ5^Ë1Šìjk\n\"İ¼pß·Ùøì}Ea\\hïN*ğ¹(úç»¢ã½­<!ìaQ)0KÒSÎ;\0 ™ k‘îçO1•V”–ã9ul?‰ìS•H°È:ÓÉôUªò’ªx/V!®á]‡|È[}Ä»Ü˜şì®HÈ±hgïæå™\\3•q­ÂIsJäèn¡T] kEê½€½g4šp²\0åğ\"¹$ç+\"îŒ2ĞoaÇ%J¦€ËÀR©3XQ Üß»hÏx©+ùù9óÓÒÊ\nÛVôôZ„#ª¸Ë=gƒ°qjª¹_ºpCÈEf0¡Ğ8KØnEÌAÁeÌ4(ªôÎ¥$_±amF†ß¹cí»¢6`¸/F8h é°\n©¹VYs¬’×^h¿ÏVŒÄ¥„‘&·^_Éœ™~b1ÅÆ-ƒ<ûJ?İ½öÙ½+ƒãªTÕìó>@¨öRVn¢¬<¡À9e¾Ó\\6*…N#!YÏ^*GµJ”­¾`xÇ–ŸWpÕ¥eÜtu…ğÎÄ1\0Ç}wŸ×Ò:™1x¾ñ×x()3°#v>¸ü¼-çºÄ\\*—éeê|eK…íşm[©ÚöÚ¹\0u5ófúİ52\0Ó«X0ÇÏs¯ètôØglÏ(v¹6Ì‡	‘Ïå}ÊWÀCÓ.E¾ç‹!\'H÷jó½.€\"Y–k¸|YL0èBàXR‡„v0FIZ‚J\n)AÚ$ËT9×Ñ Ò7g#PÎr÷KÅ‘Sh\"k*Eˆ‰~jdb‰\\4ŸŠÊê.²Í%w[)kMF6`)„Wİ\0	UåS\'ú‰Š¸øyoyZÎø^q&7‰á.%n°¥ƒ— •ÀVb“­\\\\	§ä%¦V(|û|\0oÇÊ± 	krÎU¾H¶Ln–8‘qÊ5S\'?*ewHX¯‡=T!r†-’nÂ­_çüŸ/†;‘ghIŒ=Q3/†ëlš-¡$ Sê×PR\"t$x<¥Cã­Tô.èY89“‹µ]Ü,E‚%]Æ—.m	áX#ój+Â~gµÑw…\0P2µ3gîbùB.ßfy#òí™oÕ!më<{ü–t$ÄÛ;–Ì÷¤¬¢Ã}…TP^¦3z„Iy¹FW·Í©–8Á$_ı!Ÿë½¤-ÒÂõá©ƒ-8õã–DJqVs)¥ƒ©\'4ˆGUÊêóªÎp^(G–K	lÛÙåSËgÊ¶É¥dG¸J©à|6\ná®(ƒqT\"…_dîØ¢\0Š|Ëfğ|‹¬†¿øÙ¹o‰ùUVÌyÁºYXr\nñª$­†Ié*…IMµÎõW•qÅ¥•|:İ=q{¹‡g^ê§»ÏÎC\n/W\0ôèXQ‰îÕğGSM· §ß¢·ÏBÓÏœ3uÓ§ú™>Ù‹i\n6ÅØ±;D8ªÒÒÈ‡Oƒo‰†ßÂ½R‘·¨éy#\0@°	‡”ëIŸ”ÇìlÃŠHgo={eDPŒI”(Lè9÷	åŞ Ş\"eÉÌgÈ*W$0…;nàŠpÔ×93KY½ª¯Ç@)“êj·\\¯#¥âÉ—ˆÅ†f§ìJêR:¾Ñ(xÍôEÔˆE!àèhÚ™M•¦Á¥KJ¸ùÚjÆŒ	€¦èéòÀİ¼òú –5|1­”ƒMh+§2K)Îl!ÅP(v!Ü@&ı¼6*¼å~D i‘l)²2µrwN™•Á•„³såıPYL•ÖVU.öU@êK8.ğ~¡òtE%ed2ÔÚ½Ì’Š’ğ4ˆYÓš¿Bçú«lš[¢lŞB×54WuÕœÿeÀygï¤R¡‚AIyIÚO)b!‹XLQV¢ŸYt¥€eóıÜqsÕu%(©ƒ£ªBãÆÕ•ìŞ¥ÀÎMLz/•£¾K×mŒ@&NYõŠ2·‚á.fDÖ(÷ø†çŸ\0PNH§ÒMÇ¯/ä°îÉ	!÷úbÛ¸bÈøà< Ug¸n€ìxÏ,mgáWN™¢#‹Z¥8‘+]İÁ>‹¿RÂğT5”qÉâv¤³7N²Mâˆ&H\néV¼qÈ] tz%İ#kÍT¤¤§7Ê‰Ó1²s»]$=2ùäâ¤±V¯¬ ºÑ‰+¶tlH¶ÂĞƒ=}V* 4í˜£ÒæZå9zAL1´Ğ-¶J¢ğêÙQÖù	(ƒmAì¾Ìj ù­s™«••6”\\œ¼¶€<ÿádso‚Ü’áf(c÷>c1 Šô^ëJCƒãMq7Å˜5Í±(øKÀ4À°p~S×öÓÕÊa¿OcÚ$?e%:{…éêI”TsvÖ~›ö&Ë$ÇÅã4ŠÑ´“¡»BÀäñ>æÏ.¡­3Î–A‚vFŸGpÅŠ&L¯¯ÏÅWƒû…ÙD-•W,9sj¸ëR,x¿±¦ğ3Õùî8¢ß±+Õ†mıâRUà&‘½c‹aR˜(BD*fr¶ƒUy¥òÀÑx·„Ùº{€©cLCCE\"Ÿ„À_SÆ¥KJÙ~°Ÿ ÌèõŠeU|ê®ü>_ÓÁ~~’pT&™ûB‚–HÒwîsèDI4™70ªŞËW>3‚±#X2Æîkå©{’ï±¥`ñô,®C”\0âqT8¶$bÁë›F-§Lb9ÏÍQÈÿ{†»Xék^D7K–@ËS?Bt]¡Ï¨À ğWùÑKjßP»äPŒ\"Rå²á\"ÿ²+Da†S¹Ì¤p}Ay„”J·HU|¯‘i§‰bG‹tŒuBA½NIÅËoö2š—Ù“¿|ÎÏü94T·1•³1cŠŸğqÑœ*¦MngË®`²<W$&iíŠa…%n©C‚=a6‡îqOÓ4®¸¸œÑc+Ñ…nÇQkàõ@$ê¼­< ±|Aã+İ`\"‰\n!Eè°nKíûCN±‘=wi®¥´#Lê³,+¤Ğ†’äYPÓÅ®(Me•ù­Á;šÚù®°˜>áÀ[Ë|„:”@„»¸yv?QD5Ï9Ñrnl%W™ş5òÍ´ªèµ©g¦ÄT®t¢°ŠÊÈ”*äs2óN¶ÆyìÅ>F×™T”Ø¨¾„ÇšFiM	‹f•q¬%†–ê;ØocÇmt]Ğ8¦œ±£KÙ´#˜Ü#èê‹ÓÙ£Ñu¢·5ÒÚÂÔ5Á¢ù5˜e~ˆ„ §·/N,æˆf[*&ñ°xq5x<Î¸ƒ¨ş~4¡8ÚdñÄš½Aİ4Ò:}÷M+Eòx™øWËYóÜMàÎıùLé¸fé¤\"/Òfm˜1™EÿÎµøgì‹bÂg5²@r\\nšÈR6N]İ;ƒ?Õp4÷á*¨S&şDue%ÒëôªL‚V\n°“ãR±~Wœ	c‚Ü~y)¦\nA „(/E/°dN)¾Ò!\0örİŠr<åFY	R3Ãv£éĞÑ\'9İ§QIâƒvcK¡;}¬®4©¬+sŒ±íqšZul£CÓxæ”Q7ªÔc$†êêEX6ıŠGÖÄ9tÊÀğ¤‡PŠ$èi¶‡EºrS:1:Xy×qH9œ.H\nÒd\"GYäşÎb;¼+ª[ƒ/½x8­L_”lƒMQc|vµ¡ì‹´ÌWCì¾y_“Ï]˜I\'CF¼‹ôÒie¹²¶pvÄ_êX\"]&—	s·J×„[MX Ğ’BX|Óft]œ‹g*´Ş~„×ƒğšŒÂúbÊ\0\0RŒIDAT]ÎØQ59²Zï;¡qºÍ¢¤\"ŠVQJIişÒGCr5°ˆ ­×‰\0Œö…Ùy\\GóT¸S­h¬7ğ”xÀ¶ fçÇ14BQS¦±dA9ü mdw/D¢„­	òò†Aâq‡Ï”PC3múÂ$÷÷0˜8³\'«V`]™d`EŞçki_«´d\"‘Œ[1Şáôõw,¸¡œ ;…É+X³Í:¢0/‰\"f•kÅÏÙ‹E!ÁáÜŸ?ËKí„òz™x|ÎM¶«Fˆ„J+4t´aîª`÷”{DH\náè£ƒƒ¿}aê’2fŒ¡üƒˆšJüUf×9ÖMx0$Y»%ÂøQ1<qCWhÄ\\ KGTD\'ÛüÄÂ’¶oîÆÊ¤8«ô—b˜BaÚZ#¼¶¹`²ºğ¸ÆRÆM*ª³ú…O¿äñ×ú±-å^+RF7á„k‰s’ 4ÒC}RùÃAYd2÷æÿ27&9¥ãÏC ˆcÄÂƒN@ÖI@¸øÉ\"Ãè’¦Wgü™ZìDAP‘‚Q¤Î€©0—]$D*áÃI2Š\"£|´Êâ\\‘—ãŠĞ…y!Òİ™*ã®D~]\";U57ö,S²8×;3#¥3}‰M[GĞÒ®¸ïÙA>~½Ÿ)Füx+ı\\4ÉË‹[ì–{l._ab]]7ğzØiİ·%´ô\nº:£lŞAj%8pú†RYÀ`u²ag”í‡$^Ó‡@à÷ÀŠ•èe%¨tõìóìæ(½G(Èp;ë%S»4*YvN)Ûzieİ³Oø‚aİuZï“J@ú*äß]½£P÷ï\n/€ğ˜_ ÓçrÊ±\'#9R>^¡’£S»»û¹SwÉÙYE8™\"«ò@‘«E1wEfTR©Ì0©¦Jİ_(°D¥<É£}ZøsÚîœ:Ÿª,£¢Êc%(øŸu¥¡&ŒuêŞ?%“IÆÖ} É÷Ş ïëEQCc£‰WĞ=˜²¶Ÿj<½ÆæscKˆ…cÄ\"aç®*­€#Í‚czÙ¶7D,’ŠòQJb¢á(÷õóôÚAâá³*Ê+t.š[éäi·uÑÛæ©a^&KÍJb¾u]¸±ª8óâSájt\"}OÈ—¦²y9±çö‰‹¤kDV÷uŞ#¹ó«éD²¾ÓÒşŸ;\"Í)–rÃ%òäÂ!]SK\n¥’Åç³ÄBêäóä_A‘%8$)`ËRQ\"åS:ıÌIVÉİ*¡=H•ÇÒ±­‹<IY4Ã.’;‡ºKæ—ğá›ëĞu×Ö÷òôË=ôÚ®ê¬Øz(ÎOŸíç“†Æ¸R?¥Õ%ŒoğÒÙK>1W¬ÛfÉö~bƒ6‘˜t}*W%‡xîÍ ÇÛ,âIW@*M)zšzyhmŒ=:ÂĞ“öi“¼”Õ— :zh?5Ècë-Ù¤áCó:ó[S®sñ</5Õk·D9Ñb+5[(òsŠ\\9Q”\';õ{nÀÌeL-œf0ÌêÀçFHœS 	¥K*;Rì:Ó+Ğ…›oŸôÜ¹¬PäŒ•-*\\¦YÑjZ¸l‹¬Ji©§_‹47’ÒpÒÓt-©‹Â–h–[¡¹j‚R*¿CåT71•% 2ãñıAU¹F0,9qïù@\'¼X8¯Œ©“ıàñ3rl¦×Ë#/¦æbëqñ¼Å\'İT*gÂ¨¶4y“PEw\\ğøëQL] ùKÑôô£˜ó¿§ÀVº/Y7MA(*xø… [ihTm@C‡åóË0\"QNîëåwk-^ß¯ˆÚ&ºél£ju>tc9+–”á3lÆä›?î\'^ !ÈMaHj/éaÇsÎ4¨ëŠ,É2Œ<©3h\nß\005hXRYá¢\0°B8È)¶Ê1ºKî‰3•œÅBw‡Áø¦†,3‘£KcKPÕpUÏ,¯³s¶ØˆÓaTSÚ\"µ!.sIö»D4e]NCI‰:æÎğò¡J©«Ğˆ[ŠƒÇc¼øf˜Ç­dªlâF[Á‘&I4Ç+4üUåÜrÛhNuœâõ-©°_l>ª°ñé›£jMgç©3·\0ö7ƒ×TÔU˜T•B}¹ 4 ğ›`·!‡Á(t÷+:¡˜bÛ1I_Ø&Ï„ê*õjŒkÔ9º­ƒ_¾aûqEÜvæY)Ey@ã–«+¸ruš² ¡¢tvs)%Ğ4¨(Ó˜3Å`Ñl“‘á˜`İ¶¯®fÍÍï©)C‚6(M3Â†æıÃ\0^³ ¶ú»(R5U3šŒ£,•3>\'.CåËr˜{¸àmÃ‘,îV,ıvkF5ÖÄ\n(1\\|=79ùw‚š}hó*1ä‘ÔTGB–ƒ(1”˜SVH,6ÔÜ{GãFzš	B0r4,eÍÚ^x©ŸSmvÒÈiÇ`Ó–8ÓÇ®\\bcj¥•eÜu{G9Õn%çÀ²[Úüà8ÓG‚_W„bNzE@ĞX¥1k¼ÁŒqG›øKM4¯fh†–t;*)Q–ŒÛD‚-§Ãì;fÇ‘\'ÛbôØ„c4ÔyØ·Ãæ±õAµÙ®@r²öt.¹¤šk®«sBi{éíóôK}Ä\"áú¨,Õ™;=ÀW–2iB	¦Çp2ğ¤Í„Ñ¦nóÄóƒ	tÂÎXãf>ˆJ6Ph¢y(Ë£û[K½5x@Ó¾ùÆ\n4¡÷›¶Òq><å~b©Ê@éğXB(Ç°£Tå7£ĞD!Ş=c‘i3OÄŒH¿Nl„Øä\nâJQ^Mdé‡/º{C­Æ‡6¿šC¨ƒ¨æ ²;ær÷ğÀòã³»ûºvŒY³|Ô×èa£0º‰fè”ù}Üğ¾\0S\'ûùÍÃ]l?\"f9sÚ×ãşÇ£D‚%\\¹Ø¢lŒ[Â-W–ğı_œ\"†Ô,•bë~ØsHµ#«æŒ÷²|†™=øëKÑËKœüödÄ$ÉÍğ%@õ¤*f-±¹e0ÊÿßŞyÇÉy•÷ş{Î[¦—íU«Uï’eKî`c›bbZÅä&´^.¹$$!	é	Ü\\\\H#	54SlŒîÆr•Õ¬®ímvúÌ[ÏıãÙ]íJ+p‘ì}>ŸùìÌîìÌ[ÎïwÎyÊï9q¬Àåyt‰c#c—ú^Ben¿P‚µ+Â¼åg{0SÆ†‹|ã‡eîÛSÁuÔLkñ5İ7]ŸâÚkÚ§\"A`ß÷ÁóPG2%Ù½#Â÷[Êûmñ;93¬æk¶4dÎº¡˜ êWB)ˆ´Jôˆv†LtßhG[£ë\'À³J\0½Éí|ô—×‹¯¼ ¾\"L$²:ë˜uï©™ç\n4˜wæ^ö¥erî9³ûä¹xš¤Ò£º.Mum\"ú™ÆÆ¹Q)‘kãĞÃ®Àáş±şx¹îk×÷ÏÍFTLLûø~,p¦xÕà8Í(˜:2l²aw˜_N|ñ¿¹ó¡ËG\nŸ¡qŸÏİRäÄ@™W_e³~k+—]ŞÂ=Œòã½å9j@­Ç5®ÛåeÅÙÜÂ¨•ğŠb%%\"©¥J+¨Ë}IDMCdõäÅ6Xßgı¶f®?ç¦ùá£y§íÂ!×ÿL;mí!œ¡	öÈóßXüø€‹ƒ	&˜º`÷¦o}MšµÛšÑH]~,®=sD­\'•ã«Y=Æs™ëÕ<°Ï0¦ò½¹u)÷Ì3Çˆ-¾\nğ•ïL”œ¼²ïŞ\n\0 )Ü‹²Z°&ü²;-r®™i–T½ÆÃi¨:S¥i6î‰ÅÜ Ø¢™´gÉ·oxé6™T6§©®Iá§ÃsÕuŸ)SAö¶2†ŞAmŒáÎbíÀ›¬,B\0óÒyg~¥8p°ÂƒD¸îÊ$By¨j	|!AQ4èÚØÎ;~A\'fàÖ»§©Ú\n)Å²Ï·ïÍqø¤Å»J¼ìšN^qMO=]¤â¨™UÙÆ•aŞpe’İ£$£Ï›mq<T¶€ï:Èt\"3Ôİ¯9L…šMÕWÔb©jvõ	Ñ»¹·ö\'Ù±}šïŞ5É]—°gKØµ)Ä®íqÆ÷qÇ}î|Üb`|¶˜*’¼òÒo|};ík›D=tZ© Ê%p„”‹pÿ£%ry§Ê9åÙ—NGŸq\"B£¨¬¢7\"gÂÁuM« ½Eœqğ}+C˜i}Ñ-‡&tu4s_ùS¿îÂ$€ÖØj·½òHÙÍô,ˆ Œfû¤Ì$€B;mÌ‹Óâ1şéøUgRÿ9C¡QıF†5ªë“T7¥ñÚÂ Ëà\"=›¡Z¥y®	´Î(ÚºÖ““XOLà—–Ú1³Töù¯ã¹×]–@—\nÊ%”eA<H$@Jšû[xëÍ’y‚¯İ1å¨™\\¤ƒ\'ªÛì9XbûÚ(k»M8n2/ÙåM×¦YÕa>NK²P\nU¬à{\nÙ”4æÜQKÅo$‚TÔˆ@DÃlŞÕNwoŒÕ+ÆøÊ÷³Lå}B:\\¶!Ì=wpÇÃ;”ªA& >$c‚7¿<Í«nê!¹\"HğªR…|ì*(%$¹|ã\"·ß]Àsı2ÅœÙÚ÷Á«ÅõEMÎ«VÎ„Å<©v£a¹_øÁJÓWAAY¬3„–øîBÉå‚d¨£`jQå©g§‡ø³N\0±¤Â]‡NåÙ¢g±÷ÅzÄ“Â]hh/ÍN+±K®2vw”ÒÎÜ(*$¦?ë¾ü4_!1V$ĞÛc„¶´P}pûğ4~Õ]R½Ôğ˜Ã¿|e‚SC¯~i’Î&ÍsP™iüR‘N!\"!R+šxãÁ²<n½;åªZ6  lÁ‡Np=I,æ¦+b¼áê-)mÖÁ&XÔ[¦*U|¥-É`AAíıRuH2pbD ˆÙ$é®¯y­Is*Äç¾9ÉxÆåKßËS¬øä«º°Yk³İüâk›yÙÏ¬ Ü–ˆ¦ZªËe„ğğª#8xÒâëwÙ{ØjèS(ÎÄÑ	Ì§	×\n˜_)*f§¯ÙÏ$Z$á”\\Üá(„ß]ùhK¤ß­¸¹geÈi<Ëö?ùnúÂåÙm»•ò/[ø<FLcô¡rC9ò¨¹¿¬×R6>Xàõ¬‚ûœ×Âf!»5Bag+Åİm¸-áZ•ÚlHJ6$É‡–,ø³ñÆK1·ô|Fë_Ì“ÏÏ=ºDO‡	­kBo	á`5àªÙ¦ *Èa›ù‰Dˆp>}ÔæÀa)±ˆ$l€î:¨b  !ƒPs”5=aJSAòŒïkH)‘¾6–-Bğš+¼éÚM	íôÁ*Ä\"¨‰î!L£Ö©³™ÉÀ›_gÜ\'iô÷Ei)¨0˜q±¼Ù\";hOé¼û-\\ûš~BéªbÃd¦¦‘–…cûLå|wø¯ïåù¯ïæ91èà:5ï\nr+ÄœñÄœçÁ!ÖŞë?ñç>TİÁ8çáãû~õWKøò=Ejm”î«ÓÈğ¢! ·#¶şï®_ó»O–íiõ©|ñÂ[¬ˆ]Ìï^ñV\"_´§püÊ‚Lk$uÂQ;Wå4‡‰?Y¯XL5H,QâG(°ÓaÊkR¶·â7‡G=ç—‰FdG;æª4Õ‡Ç°œÄ¯£şLIR><}Âæè©W™\\µ3Â¦•&=m:	gŠ%TS’¦ŞoykÅÊ1~ôhÏop¸JÅÛb¼öêé„fÄYÜcóİ*_“ÈD<ˆİ5²İl\\¼zR•ßXªS?0u®zieËãŸ¿1ÁTŞÇÁĞèjÑxçÚyÉİ02…È±ª.Ÿ±¬ÏÑa—GV9xÂ¡Zõ‹%æ,RÊ{ö»Çir^}£ˆ4\'1[ÌÓZ©ÏÌÎÂğNßÿÈG¸ÁßşÕge|=ë MÁG>‚Æc‡¦î²ıJXğ}’‹#äo-rZÃô·eéªyÉ<9ÏÀi”ûâ77QY™M Ÿç½µtˆø}„×¥©ì£¼w\n¿â, ~3û<ğ3)8â°÷X‰¾ƒÍ«Cl^i²±×¤·½‚–NĞŞçm?×C¶pŒG•g¸wmoˆ7]—¦³ÅÀóææh4vDZøF5¼·l¡t-ğÄ‹4Ê”ñkB\"uGaHãº—µ‘ÉÚüçw³”-EW³Æ;_ÛÆ5W¤Ñò¦†ŒŒVšö81îqlÄåøˆK&ç×t\\f{ˆ‹Ók}©¯AN_–‹%ô›­D¬½j(òš%H¥ Ô¬‘Z;ã=o\n÷&Bí–ëW¹zó›.L\0èNn£3¾ñ\'Ço= ñh¦ åâ\'ï.cWÅéÌ;ë6^ˆºgÓèlšï=\n«5LvKšòª8~T–ÏB£Ğš+\"´:…ÙÁ\\›¢ğà0öÉüÔ~ê@\n<õÇ‡-U¹û1ÉÊƒ•›zól^›dE_œ_¼©éÜ0G‡mš’¯iš5½¡ ó6¯±¾D^ŠFiÍ1(tä«ÓUzfXfª¬ŠhÑ07ŞĞÁá“U{ºÊK7…áó­[‡95l1šDB&rùrğyR–¦¼-æ’ÛY%À’ÿ’3uj‘·)+\"´îˆŸ±(j6}éŠï˜<•{ôYVÏ	Ø^™»\"Ÿwe«C¸¾½Ğø&Ô¤Óº9ÂĞ£ö¹Õº/áo^X\'¿>A~c«9Èc—ê™ë=æ+dÌ ¶³³7Né‘1Š{FñöYÿUÊ@U XöÙ{¬Ê¾÷ÅÍ±=m!6®qÑª9—İ›£\\±=^ëm·€¦ÀÙZpÍOÕô}T©ŠĞôZÍ„jpú1»µh(¹FÎ	ÉÖ(ozU+ÇGG¸ï Åİû-ŠUEÉ\n´ş…Ò…ëı6ãªgÃÄbC±áº)hZBk¨ETğu\"W¾÷î¿¦üç×¹°	à¢®×sïÉ¢Õ_õµÇÇ¾ù* c¡‹d&5:.‰1±·Šã>3J©J”Û#L_ÜDµ#Œ_oÅ|b_ÌìCëeªj&ì43gÖ¦(³=Bè†>bk’äî>…u\"‡oyÌæW³”\\Ñ#[ğ81î°çP	]\nÂÉë¯I‹¹[ªEÉ¥X€Á•ëBÕBDÂ5Ga-v_—ñ¯®ãÏ\'/¤`Õº4×_Ràß¾“éæ#DP@4óï~…ŒE%ñ¸†i&§=Š¥ç¯\nb-:]W¥¿B‘\nw=Ñß<Ğ™ØÂháÀ…M\0\0­Ñ5<=õ£Û4aºT;Ô\"­´â}&ÍëLFŸrf¼ñ?ÉEF€“ÔÉ¯O’İœÆ‹jçğÕ°K>®2ñ1ñ•BG)ßÓk»ÓÀCï*ª(e¿ƒjßAuÏÕıcËBz.šg#=Í­¢yšS„jß5‘à²XX(®İ§¯+ÄÜ}ï¥ÉO-˜ÙıfYS:ü\"˜ùŒyD ˜É*TRaÆt®º$Åİ—82äœÆR(ºÚvnsıKšY»:Š†Ïí?ÊğÏ_™¤\\ñŸ•èîÙ†—Ô }s³ÕXü=BÃñª_zåÚ÷xzò‡¬i¹âÂ\'€¢=ID‹¹½‰­ÿ},ûàV¥¼ÓÊ›”á6“¶Q2‡sØÎ¹‡à…ß”úbd·¤¨tFj²ÌÏ¯	R(DÍ}ï¥ê\'°T‡(Šb©8–JQõSX~‡(¶Šb«0Æóõ)ÔÉl.(åV}s½œÃ¨1í\"¡ò4¡Ê$áJ³<…ie1­<!+‡iåW³èN9¨³ğ‘¨äå—%1Ng]Ø#¸G³œ%‡91Ÿ$Ê²24«â4£å3GieÁˆA-î\'½1®ÚáèĞlš ïC2*¸lg’_ÙÁ–-h¦%¼\nkûMÚ[4NœòæÔå/|©ıÎ‘«:ı„ë‘ÑàÇj‘¤FçK›g…cO#ELOgÒ¡®_zò7Ôu«çY—Ïìêy€ÿ½ÃúçûŠ›o_ì½Í›£4­©0¶ß>Íùt6úµšr“Ö%qâFë^LÍ,ßA£¢š){í”i¡â7aÑDÅo¢¢š°ü–Š¡0æÊ-©wà¬ùèØ2O@|aïœt+D*¢•I\"•I\"å)¢•	b…âÅ’j”‡÷çxâ`¡KB† •¤â-iAkZ#“3‡¢”äÜæË”ËöJ¡¡`Ö…$–æô=XÜQ¨” 3Øº>NÇƒeÆ§åÄ½&¯yu\'/¹¶XÒDU-(Àµqm—C‡Kd§4¥şOÚ’ëLÎÁyCjd H)èÚ\"t†Ù?ØÊÈÛ^±ö?<}€Ä†\0|ÿÈß£Kcª-¶ö+¹Ç~]ÍñÕî¯¡v“öa²\'*X¥ùYZj2¼ ùBqMœéÍI*aây]Ò´J3yÕKÉï¡¤:©¨f,RX*‰£¢€6[nXôõ¹h¿³4Qó.äïñ¥A)ÖI)Ö5gó=Ìê4‘J†p%Ãí…IbS\'HN&1qˆhe‚HbaA\"&I\'$]-«ºMVõôuéÌ(r/PI£f‰ê3®rm„®‘„©VumóÆª¨†‚:9JÉŠ¾ë{M¦2Un¸<ÎÏ¼¢kÂ¨r/ëâ{“9—ãÃì·xøÉ\n…‚¿€Úï¹Şåù/Ï\\„&DZÃ´_šDšb‘bŠˆ,¶Dúîùá‰æºÛŸõñúœÀ–öWó‹_ß\\ıå]ïı×x{ÕÍ\'¼¼¾¢í’8cg™x2Ö=»“‘½¨ƒüÆ&Ü˜vnÍáJ¸»w‰Â¤¢:È©µäÔZÊ´cÇUQ<Bsg7¥´èë‰N<ƒÀWgyOıæ~©Ja‡šÈ5­¥v£šÃ¨æ‰f‡Hí£ièQbCG‘®)-‘2ñ¨¤%¥±euˆ›Â¬î1›³Ú|³™ÔóÔ|/µ!è/@õø¿¨šœÔNµµÅdÍ\n“§[D„ÏSO³ç!rÅ#Wò™Ê+²eŸBÉ\'›÷p½VqºkãNã™4M\nV¾²hwhÑû,(¥ØÒ~ãç§+ƒ\\ÚûÖg}?§›ã\'G¿EŞ¥5º*şøè7ÿz(¿÷·ÕâWƒé½EúÌI¬¬µğ‘JA¥\'Îä¥İTz(M,øµ2uYë\n#jLXÏ¬oMë}ëµ¼B\n„Ä\'Œ\'\"”é&Ë&²jUÕŠ‰‡Ae­æ•‚.\0Ê39¤*à7ŒèÓ~ç/:SÍ=FQ¯`ASšğe‡ix”–‡ˆOF«æ1œ2!İ\'dj´7ëìØf÷¶0+ÚuâQIÈrõO+Ö’Â5äK78g¼ù3¿hx]»ÿ{ïç³_\"[ğf¢“~­{›WïIZÓ€‚hDkÄc©¸†a„TT-E±è19í’Í?s{•¯è¸(Å†_ì#ÜZ4öoh‘âªô¥lÈğÇL-ÊõkŞûÂ\"\0€SÙ‡ùö¡¿&ê¸:g~µäd:ÓßS®âÈG8õƒ±Ójâ•!Émmcê’NÜ„yÎg}. ‹`/ïÅMTE\'y62Íª´ ”†ZHÒ§ÑS¦æ¥ÑÍğ‚X€ŠÓs›Õ¼zˆÓ~·øëï=øöñ×uhJX´,„e™:Ió‰Ó2ğ0ñÌqÂ…QL»ˆĞ¦¡±v¥Á¥[#l^kÒÙªÓ”)frâ ëAn@=ã§î¨ûä<ĞÏ#!GŸÎòÑåĞIg&öÏ	(¢¦ µI££-ÄúU¶m‹³jm‚X*„Ô´\0å¸ø¶ÍŞşùœ²ùiMùmÒÙøö>Z/mZ4íW ‰™Í÷tÆ6¼¼%ºÒzIÿ³“ú;ßsUà¾ônöİÎ¦ö—?üOüÒ¿Y^éı¿ğ…º`åkÚÈ/“9ZlØ\n\'f2yy7^øÙ9…ZÑ&\n\n”E/EÖPë)Ó‹B_ ‹Ç|°+$Utªè¢Š&,t4e£á á!„‡&Ü9¥ÎõDR…†R²ö\\âù®2ğ0q}O8„ğ|“™}öi,£–|æ&ğ4şİuÁv l¢ÂaT(D)¾…R÷F­7;Lë‰‡H?Abê0±Ü Oª°÷i‹æ”Îö!v¬±¾ß¤¯Ë@7ê|-Xú×WúÌmñëÏVş4Fj¡ÃÎV³V¨dA™²DÑ‘ÖX»2Ìºu1vlK°vC3cÎóÁB]‚&¹xLßäòñÏ×j#~Rôƒ¦º.o¦y{òŒYš4*}©Kş±5²Ú¾tÅÍÏŸYp_yÜrğO¬˜Ùö¥¼5vƒë[—,¶\n0S«^ß_ò±¦­š0‡Â“ŠÔX‰ÌÊÔ3|tÁ(ôˆ‘ë(Šu”YMY¬Ä#F½¯\\`rf€šä0Éù™‡I	S”0©`ˆ\nº¬bSÚè¸Há¡I­^hZŸôĞPBC)½F\n_¸„p•‰«ê?ÃØ*‚åÇ°üU?FÅ‹Sö’”Ü$î‚ä°Dà7>/[`sË€eD)Ä.¢Ğ·½0Erdé\'hÜCzl/™l‘<èrß£V÷lYbû†›×„HÄAù¨ZÅàL(­±·C}Ó®æäF,®‘Ni3«·õ+.Ş`ÓÖ›¶¤H´G‚ãnì?³?ğÀuQ®‹ğ=4ÃgíÊ†ŞO¹hZ¥ëºVdH;¨¦pïwóÖĞ7-7ÿœz®ŸØÚy#J)Şw{Çã»»ßòÕ‰Ò‘­–W-¸#‘Ğ´%wC3c·£Æ‹Ó{p’rK„jÜ|†L`ÉN\nbE±™ªìÆ¦…ÀcïnŠ¢Œ£Ä\',21E£vƒ\nº°ƒD‚˜º”³¡\")DC„SœŞCFxH<¤°g2¥f¶zWŸàòË`!A)G…p	á¨Áò£”ı%§‰œÛÂ´İNÆnÃöC3¸?KyÅ,Ømª6„Ó·*(ĞÁmj%“z)™5—3:q#‰Ñı´zˆÎûQÅqŸr8:àğĞUVõ5AˆÖ&,Ç…¤Ñ÷0G&XÕˆ`ÆQ¬\0‚¶fË6˜\\qI’[Ò¬XÅˆÕ:	gK(å#¼Z¹nm\"Ä¼’¢II¾àÍôî›™ÎA)T‘&ƒş×tíŸ9çßh*´DûÿÏM>X=9ığ¡ç‹Ï[†Ì`îINæÆW~ÓSc·~¹ìæ^®Ëàæ]F¿5ÊôÃÙÙ•¶mlãÄÎ|MÓY>\0Uã@GöRĞ® (7áÆ\'„ÀCR%¤&‰1HLÃ„EnfYo`¡	gn€˜	‡ibÖ§ĞX*/ECŠƒ3šrbN7_Ñ AP;æúq×D44B*¤T5o†šñ]Èº†§Œ™UƒåGÈ»MLY]ŒW{«vSvcøJâûşuºÂ’©C*6«ù·˜fC ‡Q˜&:yŠÁûY5p\'‰Â ÒµÊ\'ÕhmÖØ´Êd×Ö+{LÓ@Ókn×zôdË¾ÁY#Bù|ïÎ{Ÿ,²¡/D¯A{“F,¨öH©š˜Up–5©õr5¡G_ÓğLd<¾øÍ,ï-Ÿ¾ Z\"HSÒycí×¶œ1£U\nd¨ë½W­ü¥Odu;kØÑñ†>\0|ûé¿$¤EÑ„ù²}ßûÏª[è>Ó‘V*}˜òñÊÌ¬`G_ÒÅØš¦søf!”LR«(èWQkÀ)Ceˆq‚G‰©S„D‰‹.¼Z»21Û²³Ôrvá2C\0Z-¦-e uæa¢0_é¸D©ª¶ÃUQ\\Â#TÛëËZ$ÂGÇE.º°Ğ„MX–‰h%\"²ˆ©YèÂş.ƒ‡!¤ôç¦ÔÔ[	8/…ã‡˜²Ú®¬d¨ÜÇTµªÁòBø¾Î_‚\0¢aˆEfæyàŸyY#ôÚÌ­U+˜…)º`õÉ;hÎ&dçƒe·.‰„%+:5vo°¾?L:iH¤&v-ƒzµ RÜı`ÿúnrÅG×ÀĞ©¸ £Y£=%iJj¤’é¤$•èº€YóüZb<ësä¤Ã£{+LLyøç¸ÿo,ƒh½¬™®×u¢E´3Â¯5ºêÕMW¼k²|ìÈ_Üı!n|ç\0Læ©ñÛŒÑâÁ–şOO9âLG›\"ÏÈ-#Ø§æ,Vä[c¹¬‡B[ô,=9}|LÙ%7RÑ¶âˆVt\n„ı!bêu’°šB\n)ï¿ÖPˆ£Õ<ÕõÙúÏ…@?¨cQqª$qˆSñ[)ø]”U%/È\ntT˜YÉyAé…†˜j,\\‰a‘yú4	=GBÏ’Ô§HÓD´J,*„µ\nR¨™R#!µÚÄ:[~TtR–W2PZÉX¥›¼¢`\'kşˆ …±„C§ëéàçôŸ‹QÊÒ1ôı\'@ÓÄ~\"ÅQ„òQB\"$¤âW›l[g°¢+DsJ§9©¡™³ÉBõ#!|î{$Çg¿–#“ók÷ A¬”Fµ&….!SÌh…ÚNô•ByµNAªŞmşÌæĞ¬RĞ².Î¦w÷é\n/ÉU(ÂZ|<êú•¼5öÍK{ßF«±‘Õ—¼¸\0àß7¯¸ù¯ä¬áÏÖgêŞcßÅ«ÔÚ+ÓİÕƒ3¹Ü¶ìÃ½Ø²DSöOQƒ”Ğk!¨Åó\0–N\0I^õ‘÷û(ø½äı^Š~®ŠˆsçŸ)¤\'æVCTIêÓ¤Œ)ÒæMæ$)cŠ¤1MÚœ&ª[ÌÔ ÖÎKÖ# è&*÷1Xîc¬ÜÅX¥ƒ|5HäÆB6•;ÎşÆóSra•MƒÓqü>ZFŸ$;Pnm…ÂW´·h¬éÕYÛ§ÓÛ¡ÓŞlĞÖ¬‘NjhFpÅïÛSä“_Ê’Éúóº3ŸÁ³©Îğ÷E×ûg \0O‘è‰°áí}¤7&Ï¸VĞeØi\n¯øÛ·ïü—­Iâ¡Öç{çŒÓ_ËÇ>zåñéû¿·FWQ ÑVŒß1Îä\'gÔT•„áõ­œÜÙ…kÈÆK+ZqE%¢€ÀPc˜j]8Í°%KI:7ñw³ßz®ŠszXnşI-ƒ¯Nj‘¿-0¨Õ;gRl=âF”‘!eNÑlNÑ¡=<BÊœF—BÍm³^o·ÓŒU:,õr2¿ŠÁÊ\nl#@ıš/üs3ĞõÕ*©‘}´œz˜öS÷“ÌAúŞŒìc}6ND-í--iIk“NkZãäˆÃm÷–)”P¾O´Édı›zi»¢y^Ä\\“B#î¹w[ûM¿ïJl¦7õì§ı.dç½ãw^Ë‘Ìİ\\Òsóğ‰éÛ«¼ÂS–\\´;‹&w†q\n>Å7ˆ‘+pÎÁ×$ÅÖHmI«á‹IÓ ¤N\"U¾¦í^Ÿïfƒ»?ÿ4¢ EDdĞ…CÎëÅÇXd6?ğûg‡‰<şB¬¥ıúa\nv3•^Êı”Vq¼°“¥Õì4šô‰èÕš“tÆÓAD«ÒgeüıÉ“¬J\'JRÙÄ¶t”sşÁßğ\\\0†A5ÕM¶sÓ[)ÅW`Ø%Ìê4R]Œ¤™œÏ©—C\'löµÙû´ÍÑ‡rõ™¨óŸ§|$DMÀµ.÷µğu7cı¯è ãšV„!Ïøù¦9‘u¼KÆ~_ylï¼éyÃŞy#‰ñ½Ã¢ìdH-Æ‘Ì½^ñ\n¸`\'¡†#·Æm†¾5Aö©òŒ\nÑ¼¨ñµ©`‰¬õ}iÈÊû‰SÏÕ PÂdÈ¾‚ÃÎ«¨úMœ¹ªo‘™]ù,mÖWKQM[\0Œõ¼{fÖÊ¤ŒiV\'²&y˜Öğ$!ÍÁ¨\',	Qó,7BŞMp$·†\'3ÛvVà˜1”fÌ«^ z~‹‡Úk]\nÚ°ğ\'GĞO<FçÑÛiš<€îTÊ£±:°ñTf—©yúÅ,ˆg†^õèŠšÚÌª‰¥!DĞ ug„Õ7wN¿3ø¡4idûR—üÒ©ì¯uÄ7ğ¶íŸz^qw^¬\0\0şóÿŞÁµoo%îõ·vÜ´¢txµí•6éô¸F¤ÃÄ¯bMTİq‰d-ªQ“j*T‹õÎ»“súŠÙ.¾Ïà\n îXÓ„GZ$,³ıNl•\\¼ÔwÁåşO˜º»àûš…ëŞıàÒ±¼9\'Í@±§2;8ZXGÉ¢‹€Hu©ĞdŸ0„K\"T¦\'>ÂÖæô†ğª\nÛ’ØÊ2&K?Î·5‰/YÑŠê\\Ã‰ÎK™Lo@ómÂ¾…‰‹!š¡cè:†n`:†a`èºa iRê)BV\'3òf\n%ü@[ùøë¹x‡ë¹8®[{íà¸níá5<|ÏÅó\\”ïÒvqœÕ7w£GÏ~….ÃŞÊä%ŸÚÚ~ãgG‹·ïü·çwç\0üéo}š«^É“ãß*v&6–ì©Ël¯Ôv¦ÿ1R:F“IqØ¥’ñp}QU„s6NÒÀN.$ôœ@MER&®Sñ›©øÍK\0¾:;ğ•:Ãß—|\'!t±ñ|¼äD~{§v0Xê¥äÆñ•†&<ÂºUó(LÍ¥=:É¶–ıôEOa:%<[QuÂøÊ¨-ÎşºMX>aMp}[„mm)¬–>º.e8±á{H»Œrm\\®×÷q}…ë)\\_áÕ5¾WÓ.ğø*èÎ£ÁJ±ö˜Y:Ìù9û˜}¯@HAÛknîÆHœ9§NÍ‘¾ÛfûäËìè|-ŸşÈ—wÌ—Š˜?<ş),·HÑšxÛXùĞ\'ÊÎôƒüB\nŠGJü×ùãå€ç[\"^ÖC±7yš˜ës±˜Ÿ$äınW_Î°}¾29=n¾àÿ$3şœÿox]¿RÎU±i$„™¶8§_3\nô\'OÒŸ8I_b˜®ø(1£‚RÁçÔC#ÅvdÖóta=\'ª«qd,È¹jøç“Pİ‘Ô¹¾Å`eDgÄòxrÚæğT‘Ì‰}$N>DËØ4MÂ°søõ,ÂıNÊ,ªf´Ğõ›wm»v5±îôb6›g?ITOİ3šß	‰™m¼qË‡Ï¬W+€ºıÛÇ¾ÍÏşê%D¦½–—Ÿô”ó\nO9‹S¬‚P‹‰Ùf’?eSÎƒ¯4ô’G´`c¥CØqsÎôüÜ­\0æ&°Edfı8šğÉ{VÀÙ¼ûs–Î•Ÿğ¥ŠaBDja¼°	¡˜f ÛÖƒ¿›FùgêµçF ²ih8\"ÊD¥“#ÙÕœÌ÷2Xè¦à$ˆêU¢FeæÚ¦BEV¥N±*q’N}Í·È–cx¾Á\\­î…Ï}Ôò8Uõp<XÓÙ2èOEhnï¡Ø½ƒô&&b+qŒ¦SÂp«5íÿšCræ¹œ÷»úÍ‘w6B,ÚõHèÜ™fíÍ½„ÛBgÉ=˜ZôÑ„ÙñO9oÛñüîûÏûÀ<úvî™ø»›öW«nîã®ïg<!(-3xË8¥å™ñTj	sêÒ.\n±™hØó±˜MVø„²/âpåònG	à×0T²®Ê”’¹RÜgËækü¼úª ^lï(°mÂª@«9Eê$[ZÑŸÄĞ\\„PHá£” g%*v°wjr›)FµB µĞÕ^ú\"’‹’:;S&I]w£UŸCy›ƒC£”F“?@ÛğÃ¤2‘^Q#.2«ÔÂ P³Ïçô?ŠÖ­qÖŞÜC¸-tÆ\0CFõ¥v¾ç¿ú»{¾ğæócç5|ğÎ¬i¾šW¯û#ó–Cú¾\\uäÏ}åêg;£ÊÉ\nÃÿ=JñhyÆ÷_jsââ.¦» Ÿ_ ş]B#ã¬`éUL8ë‚}òiqhuÆ¦Æ‚_5lØ2öæ,ñaá<~8c6ßiÏçm<¶‹æ”‰R #2ÁÖ}lh9J2TÄĞœ\"¨¸a¦*Í<5¹‘Ç3[ÈzíØzlî2ê´cT„¥ ÙlˆklIôÔÊÁ«¾b¤â±²À‰Ñ1¼ÉÒ£Ò6òcb…!tÏBóíZ•hïÕ.‹§):Ì×† éâ7¶j28[m©E‡Öµ¼ô½¯Zû‡_ÔHqİ‰­çÆÎË-@İ¾ü‰¹²ï|ïğßz×öÿúŞáÂSfÕ+ìuÆã6Òá0ÕŒ‡•ññ}½¢ˆgª81ƒjÒÚq×nósµ˜ßT\nETËÑiA )zÍ¸~x.ğÏ5¤\'’rb!HÄkàK¿:wğÏNÁEÔ5”ÂÖâd¬4‡3«Ø;±‰L9….\\4é£k.İ\"*ÒŸ`{Ë~šµIìŠ‡ç‚ãëAÚqı|¾ÊUPp=Ê.çÉ:ŒTƒ¶ò-†ÆÚt˜m]-tt¯ÀíÙÆèŠk˜ìÜ•ìÆ7ÂÍ@!¤ÔĞU]´5ƒú5qÓú£î(ô”¦AÓÎ$=¯íÀHg¹ŠŸX×ü’¿ØØvÃ³Õaoª|’•é]Ë+€sµÙ=Dµ4ù\'h‰¬lÿáÉOüE¦rò—|åig;3kÌbì¶qòOä¨§T’&§vt0µª	¥ËZgİçc æƒR:ƒÖv—_JÆîEùgt.~CƒHmO_oÉíÏò™ÀßPKÿb¡½™2a;~…şøI64¦/5L{lŠd(zñ•Ävçz98¹–Ár/SN+9·9Ğ¬ß ü¹ÇÖ°º—ÚLÎ°¤#¤ÑjJBR±=ÆJ…*^~’hæÚÔqÌÌ)ŒÒZµˆîTĞ<é»µCøš£Å‰Škw¹ô¿¾-ªŸúŠˆÌ¬LíúPj×ÿ®UR‘nvt¾ö¼Ä×ÓkßØíµ½¤Xùã¡/}p¢|ìU€’3=e3y×$ÓMã»AèjÜ`xKcë[ğ¡¨ÿ_ŞëäHé*N–wb{qœ@)‡^48éêöœŸÓWyø]/è>â:¤ô)V\'NÒŸ¤79BwbœˆnÍ|Ôt5Å@®‹|c•vÆªLÙ-x*T»¨âtÉxuúÊ)¤AÚÔH’ˆT}EŞöÉU]Ê–‹´K„ÊS•F9‡fWQB „Ä&-ú8—÷íaËåÌ˜8s`\0EDOz[?²¶ùš¿Ÿ®”$‚«ûßsŞâê‚jŒ÷øÈ×-Ü÷ÈÈ×>8^<üvu–í\0¼‚ËÔ=&î™Â¯zNDct}Ã[:ğBúyC\0šğ±ı(ƒÕm<]ºši«7ˆ-æÙ7tˆGf—ú3-ÕıÓß»TğÃÙsùç¼gßû±D<p|p|t¿L«1FGd‚Şä}Éaz’£ÄÌJI©¹j‚ÉršL¹‰‰J3cåv&«-dªiª^´v‘k>ÆíÎ|â;M”µ&Åî¾\\wF¬P¸6k¼G¸aÍ]¬Ş˜E‹,ŞÇoüÉéîÄÖ÷¥vşCÑšÊ+/[ı›ç5¦.°Î˜ğøè×-¤;±­÷‰ÑÿşÀxéğ/)ü³:ıªÏÄıYN}\'ƒS„gH²«RLíjÅçˆšêB£àµs´´›cÅİX^PÈ4fQ›õc‘À»ßD5È‹ÍèÏ\0ø[ú³\0,”éûBºãbø%\"GÊÈÑŸ 75BO|Œöø¦æ „Âö*N˜ªkRuBd«I&+Ídª)rV’\\5AÁŠcùáÚL>«Õ¨”À÷Eà¹÷üà»•oan‰-•»¸n×£t¯®[«³8üBZ|ª/uñGÖ·\\ûñ±ÒÓ%Ç+óòµï;ïñtÁ\0À‘©{¸ÿÔ¿°«ûmñ÷¦*ÇÛWqVp™Çòß6EuÂúNhPê3vqvktxŸ/Ÿíª0“V?Oå¯c¢ºOÕÀ‹@2:[|ÓĞ9KÿÅ@}ğÏùŸgüó­®å­‚­‚t«˜ª‚é[„ô*-‘iZ£Z#Ó´D³´D¦‰šPYsØI<_ÃSÏ×)Ûa*nˆŠ¦d‡+´p2ÛM¦”=%!‚°¨¯MÊæ\n¾Íî«IvúA‹á³{ûÇW7]ù¿W$/úÇ¼5Zv}û¼Ÿù/hx|äš#+y`ğ_yiß¯%¿{ä/ÿW®:òûrÃKùÿÒÑ£ß£p¸43Ê­QÆvvQìK\"41[û¼@CäEÅOq¤t)ÇŠ;É9íşùï—~˜Óäl9çâô;ğ/HJõ§µ¸Âs¾ƒô|„h3êÒ!ªWˆ¢FCºÚÌT]“Š\"oÇ)[|¥á	%µàºiµİ£ã¢ç§XY|Œ«›~ÀÆ«*MK“Ë4µèÉu-/ı³ŞÄ/f*(®Yõk–.H\0(©ıLç,¯ÌêæËCŸ}äMï­8¹?u|+²”ÿ/TøöãOãÖ´Ú½Tˆü®N*›ÛPam çP‹]OÙ+x:¿›¡ÊJ²bá kOŠs\0ÿÄ;Îğ«3´Úªwı˜y4¦G«ÙÙ˜ò9\'Ë¯öÇƒJ•ÔøA6îæòOÑ{™‰Œëgõ_TäÀš¦+?pÃªß½õĞÔ]Î¶Î›j•‡]°P·ìãô¦v\0ˆÏ<üÆ_w”õ¡ª[ˆ-åÌi‡ÛÆ¼k«4—T!ÊÖ6Ê—tà·„êü!€º*°ÁPy=ÇŠÛ´6céÍ©¥ëdóÀÿL„û\0¼3v9íû¨‡Xô˜ÎAq–Ïš{šø¾ByØfv‚“?b³u;®ÎÑº;…Ÿ}¿/„Ä”ÑGz[Şû†Í¾g8¿—éÊ [;_}Ááç‚\'\0€‘üÊÎ4_ß÷û´\'Ö¼³ê–şwÁoYÊÙû¶ÏØ½N}wŒâ¨Ü{)°V¥(_Ö…Û—<Ï ş9>U/Áhe5G;´7á‰ ¨kÏ’Çğ/RÍ·(øOû¾s\0ÿÌqü¿O‚î¨NX\nŠ¹\n¢R¢mh½\'ng]ênJÜœšÛ:a“B\'¢%î©_şÁ±ß÷ïoTÍÜÇÚ–«/Hì¼ \0à“w¿…¦Tš/ü¼cëï½1kıÍtepı’®€§È*râ–Q&fVÅ^k„ÊîNœÍ­`jçÿÈ”ıcÕ~Î_Â°½×ˆ£\"áÙ=î3şùï;c5ßÂà¯çÙ½ETÃW.ü¢.›ª›‡Šˆ.hÒ5ÚÃ]ö†&‡r6ûÇä²yÌñ#ô¹•®ì¬Úá²âÆ¢½‘3†øê¦IÃO‡ºïJ¾ÛSÎ±w]òy†òOÑ›ÚvÁâæC\0\0_ŞûÛ„$ûî_ñÇ¯ıøKgú`¶:xšÓ˜o‘« ÀÎ8ÿÆ0£gqÊÁºV…4¬ímX»;Q©p­÷ÜùA\0Á÷„ôAh8~„‘òJæ.eÔZ‰¥§Q‘Xå4\'¿ş\0ÿbûşºªPB KĞ„¥ ®ÂBuŞl_á*°\\§VN\0à+ì!Ñ]­}^L¤I‹©×%šxJQr<öçlöŒ™œBËÑwâûôßG*œ§ïU-´^ÖŒ¾„ı>€.CÅ®Äæ[ù_Óå“Ã x÷®/\\ğ˜yA\0½bF3ï¿ÿ7ø§ë¾½âşÁşã²“{×Ë‰Ìw|ÆïÍ0|×$•‘*¾§ğ5Ó—Äº¼»\'ºœiNs>\0¢Öø¢vK]e0^^Á¡ÜÅŒVû)Èv¼P´Öû…ÁüÓ€¿VmÓI=(Öé\n	ºLIGHÒlh„51ÇCú×¨Ó¾f¡AÚXÂ=sÍEP˜w|ÆËOfª<5U¡œ™ ‘;NßèôİKÔÏ‘\\¡íúV¢ıQ„<ûğ4iô¥.ùD_ê¢Oæ˜¶ı*oŞú^xyÁ@İßE2ÜÅdù¸şàÀ¿ı¹í—ß[q³‘%²‚ÊP…‰»¦(ìÏãU<”¸q“ÜövJk›ñâf VyŞÀlBœBc¢ÒÃñüFÊıLz½Te„dÜ\"X‚jïÀ¯ ¬):C’®dUDcMT£ÕèKìÔş“Øà	\\¥ÈØ>c—¢ÍÓ‹ãÙ2QÆiÉ>Mçğ£ô?H¤<‰‘2hÚİDóUÍMÆN!…!Ã‡Z¢+ßó¶O}ûhæ>wª|œËVüÂ\'/X\0Íæpæ‡\\½ò—ÄWúßÉY£¿•·FV/å´…\'ï2ıp–ÌıìI!À×%¥ş4…­mXñ™Òâó‘\0êÚR@Öja´ÔÇHi%CÕÕLù](İSœ†Bœ“pgÊ€1µş¨F§)ÑÄÂ=FŸ9ĞCÑUŒZ£‡‘¢ÃHÁâä´EÕ)Ó¡O{šÈGI}}b¥4’ıQº_ÕAj{a,™4¡“u>¬Iıw¤Ğø…ÿrA;û^”\0ğ¥\'›d¸×}@Ü~äÃ×È>ü»%gòÕşR¼>”«()qê›£d–j+ÓÆÚÑ»½ÖÎ[¨‹\nM(,/B¶ÚÊDµƒÁÒjÊ«)xÍ(C”‚t½–]¸°Ç?¥v&u¶Å%½!Dmª÷ŸÁ{ÖøµE×gÌò«zŒ”]Æ‹Ó%›lÙ¢â84‡3lh>Æšæ!ÂCG¨Ş÷$…ãØ-¤Ñuyİ/k!±&vúŠgqğW»›¿0Z?š©îuü\nïºøó/H|¼à	\0àÎc#îåu_~#{åûÛ¦ÊÇÿªâæßm{å³ë!ÔMeÔâÔw\'y(‹[õjí_u¼5)ü+:QmÑ9 <ß\0ê¿ˆÀGb¹QÊn’‰r\'\'«(õSt“øš‰¯›(=¤ÂÖ$üÖD%74›ô†%qm¶ı†Xd0¶Ãhü©ÔœV)–¯ÈÙ>ÓÏ”å1iùŒU\nŠåbÛ6¶]Ey-ÑiÖ4²¦e€îäQ/KõÑSLİ?Bi¤\nBé	Ñvm+©­IŒ„qVåàx¦Í¦Ã½ÿkg×n94qÇ”&M^¿ùï^°ØxQ\0Àñ;ÙØú2>¿÷W@©HÔl~ÿpaß»-·Ğ«–2-ğ*>ÙC%İ2AnÈÂwü\0áÍaüİí°1¬éÂŸ·Àl’œ†BÊ w‚ã8^ˆ©JCÅ^+˜ª´âÆ–a\\Fê&ñNÜ¼ğQ]Ö ,Á”³Şò\\€!dœXSëõ”ÂQ\n×‡ª§(»Šªü,:¶«ğ\\×óñmáYH¿‚.,ÂºM[,CÓ0k[NÑÏ2\\¤gQ9™eü!\nOçñm=ª‘Ş‘¤íºVBíá%Åökû}?ê<Öâ¿õó;>óı[ı©êK_ÂÎ×¿ qñ¢!€º}î±w Ë0+Ó»Û«\\³oü;ì)çÇ·K¼Õq‹Swd~(‡•sƒVÓ!	ëÓpq+tÅ‘º:â×@ ›ßx|„\npe7Êx©“ñr;åVrVŠªÆòB8*Œ#Â8*H™5Ê*Í1Ù×¯ji¼õš}),Ll,BZ•°f5,š£9º’t%Çèˆgˆv !B(*cÆgèÃXSU”¯ˆuEèyi]7´\"CK»Ò„QN‡{¿¶¦éÊ2úÄXù\0¯Ûø×|÷Ş/ğê—üü2¼m ÷ş\'U¯ĞæzÕ(Ú¯­¸ùä’H@€o+Fœfè“ä—Qª– ÒA]ÒØÔ)3˜e/ Ì=˜.àú:y;NÎJS´”ì(%;FÙâú¯ã¸:¾Òğ•¤µfÎÁG\n]úš‹!BºMÔ,UH„J¤B%Òá<ÉpMóæuKäßİ²ËÔ¾)†îfò©i|×ÇŒj´lI²âúvR›!/qøÇŒæqC†?üîK¾ğ&~P™,å¥«~åEƒƒ-\0|îñwÓéc]Ë5É½c·¾i´xà½–[Ú¢–èÒš p¬ÌÄC÷NSÉ:ÁLV§µ¢­I2ÕÌmWu!€h8V‰¼–\nY‹0 $Òq|×ÕñÑ`¶—ÄC>ºæaj.†æ`hnÍ fòÕ<ĞÏ|€‚üÉ<Cw3úã1ªÓ6BÒıQz¯m£ãÒfŒ¤ò–ƒtöŞŞîıÌ©Ü£_{ÇÎgº2@Óù§Û·L\0Ï¢İyìã$Cìzó›ùÜ\'Şuxš®]çúö’‡„øÏôş\"ƒwM3±¿‚_šH…Óh;[Í¡vĞH\0b¦2qö½õòi!Tí!˜ßGó´æGç0ôœ¢ÃĞı#İ3DñTßó1c&½WµĞsM±Ñ%{øÂzÒÒeèo·wÜôoß?ú\'/ïı^¹î÷_”ãÿEO\0\0G3°ºér>÷Ø;éŒ¯ï)»¹ŸÌ?şÇ·ÚÔÃ…\0NÎeø,ƒ÷°\nÊU`HdG±³	¹.k5ğ½°`öØg	à§5ÏöÉÎrâ¶“LÎã4C’^aÍë{H­‹£Çõ%yøkg¢âfûŞø†ÿí(÷+†ĞìËzáü>.éyÓ2¼Øí›ûÿ€ª[à-[?¡ıç“ïÙéúÖ§²Õá­r–$4\"jªC•1‹“ß™db	+ïH3%ÚšÚ¥íÈ0ZXGÖıË0{k+ªÒH™Á{&ß“Ã.8 á¤F×î8İ×6n5ÏiÖi±BÔlº¥/¹ë÷¯ê}ÇømÇÿŞ+>ÍµmÀÆş×²™\0Î`ã…#<1öMÚbë¿û©ñoÿòteà=ouûÊ]ò%óÅÔcY”eúX§ê!4	}gÆÖô¶Èi }±€…¢<Zbâñ)ï£4ZÁwá¤AËæ+®m&µ!¾äÏT(ti¢	óÁµMWÿ«ãW>÷?¾úWÖŞùE*Nö‚RîY&€çØö}…T¸›=C_D“Æk‹öä¯å­ÑWº¾%–zÙ„\0kÚeä¾£çÈŸª¢PAšŞ8æÎŒMÈ¤‰¬-c_Œ ¤ :]eòÉ)†ï&shßñÑtIË¦$İ—·Ğ~y+Ò\\zAM¢;3šnm¯û“}cß;ñêuÂÖÎ—÷2,İ¾¼÷·Ñ„ÎæöW®¸÷ägNÁìñÖsºÂ\n\nÇËŒÜ7ÍÈCìjì}Uc[ÆÚÂ³5î/BàV=&ŸÊ2úã)2û³8%€H³ ÷%i:/o!ÒZò>š0ëÉ=Í‘ş\\Şóöïœº=ÿÊ¼Ÿ‘¿ßOW|óò ^&€s³Ç†¿FÅÉrå_¾›oşî®Ÿ®zWÎ¹Ùõí%_?¡	œ‚KáX…¡»§™ØWÄµ|”RÈ”¾:NhW;FO<h[ö\'\0ßñÉÉ2øÃ2rT³B\nÂI“+Ûhß\"ŞFò\\œ|Z8Ûßø/J©zpàßüüöÏR´\'¸võ¯/äeøÉí«O½T¸‡/î}/?·é/S%wúLVÿÏ²YsVÁ‘†«-\0;ï’;XäÄmdªø¶d:Dh[áKÚĞÒ¡ ¼¦^ P{íÛ>åá\nwO0¹7C5k¡<0\"’tŸFÿk;HôÅĞ£zPxµÄ‰_\n­ÒîÛ¯”÷×ôÿÊ¾‡†¾P¼yÛ?2\\ØGOòüjÈ¹L\0¨íû>ë[¯çÛ‡ş˜şæ+ôÉÒÑîS¹‡ÿ®dg^a{å– hi™„ø`ç†8Íè2•Œ‡ï)„.‘­!B·`®‹£%åï’\0ÄìR¿2VetÏ4£?Î`ç]|GaD%Énƒ×&Im‰¡G´%{÷Um¹oÊÈPktõÇúÒ»>÷ØØok»‰ŒqYß§n™\0Î#ûŞáÖ\\Óÿküèø\'LË+¿ápæî_ö•wå•4q.—UAi ÊĞ=9¦Ÿ¶(O8À¤@_#tQ£/Šl2À©‡\0„x–Gq°Âä“YF<5í <:${:/‰ÓvY=qîªM-ZˆMßêOíúTØHŞ{õÅïáG{>ÍDé?·õï—ê2<»öÿ5Şró›9š¹Œµ•ÿÚtõÔ›-¯´ÙSî’‹‹fR]•™x¬Hæ©2•Œ€È”è«âè›“„VÇĞâ¢A¹çü#€ ÑòÅã%¦÷å™x<Ky4hü)|E¸Ã }WœÖQ¢½á%	rÎò¥Â!b¡Ö;cFú«7oûÔgï?õ/nÙ™¾ Zq-ÀĞnÙÿÒá®ùÓ_ç+ïÿËm¿ü®éêàÍ–[ŠŸËçMàU=\n‡+L>VdüÑVY¡È˜†Ñ#¼)Ex}’µ²ãóˆ\0$à+J\'KL=–%{ @yÄª‰(Â)IÇåI’#$×êlê•D’¡Îãº}fkû«¿rÏ©O{Ë–ÿ‹@Ğs+ó.ÀÀe`UÓå|mßûØÕûÖ¦;}ôb]†?8Q>z™RÊ\\²7«¶tvò.¥*“{òd*à•ƒrZ™00zcè;šÑûHMˆ’ç\0¤@y>•á2™O’:GeÂB¹\n¡BM­»Ó¤6E‰õ†a¹ä¢º…ôx5f4.îşÔ7}è©ÿ¤·¥ãFşê¯ÿŒÿÍ,Àe8?ì¡ÁÿD)Ÿ;œK{ŞÖ1^:üŠ‚=ñ%{ªÛWy.wF\0nÙ£:\\%ó@†Â¡\"n1+1­7ÜÙè!ÃúŒ’×sA\0²¦¤ªöh™ìQJOçpò.¾ã!‰ÔI_œ¦é’¡Ö2$fúz,í4iTbzËİÉ­DùLT6¶^OÉÉpıêßYpËpşÙWş\0]m}œÈ>ÌúÖ—ß—½Ç2÷şfÖ~³å•ú}å,ıÒ×@íÛ>åãe2÷g(-aåjÎÂ°\\•DÛÑŠÙGK˜µÚõì”K´Ù.:ØCòMR:””“]iJÌƒÄÆM—6j!ôsf\nCF]V¦/ûŒëÙŸİ¦¿Ìİrğê‘á/ó+;o¥·yÓò@[&€ó×”Rˆ×îùØg¸zå{\0x`ğßwïûö¯:¾ucÙÉv)|Ä9Şe+2g™x$Gîé\"•ŒdD\'¼©‰èöVÂ«M¡`¶VÏ\0H&ÂWØ“e¬S%Šû¦¨ÍáW½@éG\nÂaââ¤w¥‰t…P:ìƒÜ}]„ö7EV|³/¹óÓ¶Wø•¯¿[Şş=bÑ8«/,UŞex‘ØÃC_Æó.ëıy¾óô_¿îdöá×+ü·”İéÈ¬ûn‰7M\nüªGæÉ<Óûòä°¦œ\"ˆlh\"¼!¹6l\núÔJÎ\0¤Ç§|ª@ñP–Â¡iª\'‹øn ¢Hô„i¾8Mbk’h_¸Ş”àœ /DŒô˜©Eÿ³+¶á«%gúÁŞäv*në×¼wy\0-À…owûq³…ÑâAzãÛ“3w¾²äL½»dg^áøqN·£æ,ôËåSe\n‹ä(`OYAêlDGï£¯Nb®M£µE‚}ûR	@\0U—ÊÑ•CÓ”Oä)—ñÜ²%D{\"4ïL“Z#±*†0Ä9äìÏZXOVãfË?ÅŒæïüÜ–¸íÛ‡şÌw}ë­Æ»L\0/bûÖ5š¸çÔÿãÒ·­ÈÙc—•íÌŸæ¬‘Jù¦:—é³–içU<¬	‹Üy2ä©f]”ëCHC¦Ã˜}	\"[Ó˜+bhF2˜O\0\0ÒWxy‡Â¾iJòXãU¼¼òBHCk×i¿<EbSœP«‰0Îİ«C†ìt¸çÖ¨‘şÌ¶¶Ÿyà®SŸÌ_¿êÑS¬H_´<P–	à…kCù§èNlá–Äë6ı·üã¥¼W—ÿaÉ™îQÊ‹,9µ¸áNú¶Â™¶É>‘gêÑ<ÕI¯êƒˆ¨Ù!¶£su#n …4„¾åaW(ï¦r(‹—·ƒı=AÖ•D{\"´\\–&¾&ŠĞÏ©P\'0…@C“F1f´<Ñ“ÜöaÛ-ÿèõ_şëÜ=ïøW÷¿‡ƒ£w±©ëºå²L\0/;>ı\'ÇÇ?Æõı¿)söTû©ìÃï¬›íUÖ»¾¥Ïm¿±D¨ù\n·à‘Û›gú‰ !ÇÊz€@è­-LlKšÈê~Á¥¸wšÊñ\"~ÕÇ÷Tà×Ó!Ô¤“\\aÒzi’Äº82$—¨µß{…Dbh‘¬.CûÖ4]ù™luøkoŞúÑÊüSÿÊŞ_`¬t˜­?³< –	àÅg‡\'~ÄÚÖ—òğĞ—ØİóVö}Pkùê/Wİüu–[Üeû•sÔÍ·|òL?U¦x¢JeÌFy^Pv,k½vU¹À-¤í_¢iGœèÊèL¶ß¹Y@\\!-^Ñ¥y_g|ã×6´^÷ù‚5Vøƒïÿÿpã7ğ|‡]=o^Ë°lu{|ä¤ĞùŞá¿åe«~sËSãßşY×·^]r¦/wüêODB\n”ãQ:Q%ÿt‰â‘•“å »Q­:QOèÄ×D‰¯_#ÜšÅñO\0~S‹y1£ù;¦ŒÜzÙŠ·ÿ÷ÑÌ½£ıM»ÉUG¸|Å/.ßèeX¶3Ù‰é=çŸäÊO¿‹ÛßùáÍãå#¯¨¸¹wì‰­>áOpÃ5rÖ„EõT…Ü¾<Ö˜ElmŒÄ†‘aŒt°ø“xôöš\"+¾ëúöç/ë¹ùŞÇF¾1¸¡õzl¯ÌU+ßµ|c—	`Ù–jO~›îÄú¯X÷~ùÕ§~wB^™³†ßŸ·FW*¥Âê\'èÍ+¤@)…›wñ*zRGjç”ª;w 	¥ËPµ%Ò÷CC‹~²3¾éÑ¯ïßÈ›·~]†¸lÅrmş2,ÛOEQ#ÍCƒŸç­Û?©}ãÀ´	´k¦*Çş `÷+Tú\\T‹çŒ€º\0Ç9&ï€@†B6Gúi®û[Û+îí¦¿ÊŞ~äïéoºœéÊ).ë}Ûò\\&€e{&ìTùA¦²cÜ{êÓ\\Ûÿ›rÚ\nç+#¯Ì?ñ_İáø•îsÒ\"8g²LØßYñÄŠäE.Ø“^³áÏìÿ>øÇjkÇí	vt¾aù†-À²=[6RÜOgl·ù0|Kºßüú#Ó÷¾V ¯®8¹u®²ŸA\"–¦U†Œ<Ö“÷­jºì?n?òwOŞ¼íÓlíx5B,§ÍôåKpáZ£ÄõÇ¯~óWw}ã›ß?ú‘—Ê>òR7–ì©Ë~šbøa=åFô·”ò´µıgn?:}ß¥<à·/_³şÔ–ïÚÈü©p7Ù=¼ü%ïã{?²õHæŞ1£å™ÊÉ—;¾m°TãšÅŒ–LÌhşPwîìú¹=·ù›áİ=oÄrgeX¶óÑOİMK´ŸNı+û&nç²·uÈîYÖ“ï/~í—c(e,Ts „D ªQ½i¼5¶úÿåª#ß¼¢çíƒ·ş³üU}ïfMóÕXÆ(+Ã×,_èeX¶óÙNŒí£Ä ¹Gùô?ä·.ıxÌö‹İe7ó‘Âş›\\ßYá+7î+M ˜ˆ­½ÉíŸÌWG¾³»û­Ó÷ü“ÕŸÚÅ5«~ƒÜãô¥w._ØeX¶Éø\"M‘^NL?È+Öı·ù°>]2#zê×r]oy#ê.vÆ7ÿ[klÕm¦ŒØ·ùÕŠw!\\½ê=Ëq™\0–í…bã…c`¸°—“Ù=X^t¨‡ä^±ö÷Ì=±\\»lË¶lË¶lË¶lË¶lË¶lËöÂ³ÿŸøË‡y\0\0\0\0IEND®B`‚','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( &!1!%)+...385-7(-.+\n\n\n-%%07------/---8/-+/-----+-----.+--------.-------/---ÿÀ\0\0á\0á\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0J\0			\0\0\0\0\0!1AQq‘\"RTa’¡Ò2Bb‚ÁÑ#34Cc¢±r“²Âğ$DSdsƒ£ÃÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0#\0\0\0\0\0\0\0\0\01!A2Q‘\"aÿÚ\0\0\0?\0î \0\0\0\0\0\0\0\0½¿·í¬)ª•ç£–êt ²«V^L!Óı[¯c(BÚ[ZÚÙeq^•üI(·Øös©Ê{ûÍR›ÙôRy]N=r©ô=[Ñ‡¥goæ©*•ÕÖ¯újõ·-w|üœg¥ØğÛí¿Wğ‹³–ên½Ëê·£9{å¢÷‘ß„8¿™³¶„—\\£ÿ\0˜Õ?*—´]Kr÷ºòòŸ{)¾VK\'mŸíôìËïR¦ÿ\0Ì]¥áÏ÷ÔomºåZ‹qïƒfÏ>·ŞU©¯¤ıoS“ÊÈÿ\0tí•Ê;¿ÙîiU~Deã®Ø=ë¸ÉœVæŞ…W­JPÉoUaú:‰®J;Ì®Êå%õ–‰NWöëÏıêšú•>Ÿc.ÃÉ—Ú¼¸lôê Æì¹o}K·Inœ%âÔ¥/&qèé#Õ.Ô€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0U©FS“QŒS”¤÷%µm†åo(éìúã\\åjÂŞ‚ãV§İÅ¿Å±Ô©R¤®n\'Ï\\ÏŒßÍ¥ùt£Â1G›SkJşæw’×ôí`ÿ\0wA?§•.,·™ÏËrº¾<:Í¤9fXÌ³;¯S„eV¬¾mk)¿WBô”ijnc2‹ı—}mM]VŒ9­t©JŸ:1|\'\'ÓéÓj5SZ§ª{Ó](hHÌfXÌfp_ÌõL˜ÌônjĞª®í¤¡^;¤¿wqšuOouMmÚWô#^±zãVŒ¾}«Œ%÷>•¡È3%ò{l½Ÿwt¡YÆ•Üz[Ò5»bŞÿ\0Cg§ƒ–ãu}*åÃsqÚAâzï=4@\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ó|*m\'JËòx½\'yQPôª\\j?eiöÈäŞ.ÜïèÑú4-œşİY´ıĞ]å\\ÙuÂ§Ç7“[‹I$¸%¢^ƒÜÈù—ö^Ï©{[˜¦Üa%^ªúòWÖfcÚ»³,«^ÍÒ¡âÂ/J·-kV+éKĞt‡°èYÇQñŸÏ­-õ*>¹KîàHÙöTèSQP„Š+ú·ÒßY-íµÓ=”“‹I¦šiïM>)£šrbËgÔÖ:»J²ı¸ó»“ò_Cÿ\0O¦¢›»JuéÎX©Óœq”_Jü}$â|¹6c2fÛäİÍ‹mFWËæÖ‚Ö¥8õTŠÿ\0İÙÀÄÓ¯-bÓ^f•í+1™1™ÇR3)¨”“‹àÓOÖYÌfYğiµ]Å„!7­[iJÚ£éj`ı‡ZfÖr¿÷˜Ş]P×uj¬—Ö§,_ºK¸ê†§]°•âÎk*\0\0\0\0\0\0\0\0\0\0\0\0\0ËÚÙm[Ï©ÌAv*oß&w‚òãvÔ¾_Ä¦ûèA\'ğ[Ãù1s¨øE9JMF\\e\'¹#§òodÆÎ„ins~=iùuØ¸.ÃHä=—=wÎIkhåÿ\0–z¨÷%\'ê:TLÎKôÑâÇãk‘.D·â9ŠUq\"[Ei—Euq­É–ç*<İGûÚš“}oMÒõ¦g5“Ú½4Ÿ³_ª¼zt*ÔÔŸµ¿¡f— +7úKÈ¨ôóTünù=ÇAe¹µ9Œj|ƒ´æ±¢êS­â×rrr—ñ#Á®Äjp”éT5)ÉÂqêk¥u§Å3³³ŸxF°Â¥+¸¯Ö~†¯¦Ik	?RkÔˆL·uLñÔÜYğwYÇjÛ%ôéÜAúW6çıbØpïrÚ¶¯È…ÄŸg3(ÿ\0™ÄÒñ¿‡›ò\0ê€\0\0\0\0\0\0\0\0\0\0\0ˆxS´t¶J…Å*U\"ú<Xóm\"ï;y«xAä¿çm)è®(ë:îRÕxÔÛèRÑzÒ*åÃ¶:O.µ©x;¶ÂÑÕ|kUœ¾Ì|T½Ï¼Ú‘‰äÅNÎŞ8Ê4ÖQ|T›m®öÌª1r»Ê¶1šÆEÄ\\E¤ÊâÉJ‹©•¦ZL©2ÙP±wSÆÊu<ÔîÑÓÖÊ=l¡²6¥#É.XÙóÖUãÓs‘şÔ_Ñ5ë3m–ªÅI8¾4û^õv·4Ñ|Ã-¡9ù6“şj;9Í<lYÒww3M\'7mI¿¤©ÎYÉz2ÑvÅ,ØášÂ2¹/û\0Õ`\0\0\0\0\0\0\0\0\0\0\0\0\06”qÊ>Lçé2â._SÂ½hõÉT]’[ıé–ÌI×;˜ŞØÊ©2´Ëi•&%,]L©2ÒeI“•5<Ô£Q©İ¹¥M”¶xÙKdmvA²‰3ÖË7Åzq{—kÜB¬‘±r~6Ô—Z”·}i9}æ@µmKBLcå¡tŞÂk™åÛ+@$@\0\0\0\0\0\0\0\0\0\0\0\0\0.QQÒTët=iK×¾>ı{Ìq³ß[*´åMı%¹õ>‡Şj°o|d´”[Œ—T‘•æñë>ß¶Ÿ‰ÉÛ¿¥g©Æõ*L«RŞ§ºÛšW¨Ô£Q¨Ù¥M6y©áÍ»¡²å….r½8tEó’ì~…¦ôŞú×\'íœ`êÉi*º4º ¾jûıg£ÆãïÉ?çÊŸ#“§ş2 e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0M»dÓü¢]•bºb¸OµC6\nù8ç&=jÎ>KÇ—hÔ×zàzHÛjİ©Çõs–œßL$Ó~/£w‚4dšÕ=Q‹ÉÇxòëZøg3Ç´z\0+L\0\0\0µJJ¥HRRÇ9bçÕè^’XËn£—âm+gÚsóÓ÷PzÔ~Sè‚ûÍ¤µmoQP‚Ò+‚ûß[.›\\3‹}²9ù¯&[úú\0Ê@\0\0\0\0\0\0\0\0\0\0\0\0\0\0GmZ[-n.hQÿ\0»R0~¤Ş¬	àÓnü&ìÈ·S­w/&Ö”§üÏEï1ï—·µd•˜éAµ­kºŠ-G]ïšÌ€Ìòç*±¦¸SZËûRèîÓ¼ÄBN;ÓÓú?Qã›“soW&äß[lœ¹÷ÊäÚÃ˜ÌgÒL.ü¥ë[Ñu\\CÊ^½ÄU¤öœî!å\"‰]Ç¡7îDM\0Ñ¸®¥YKåÔ¾óÊ50”\'äN2îe\'’àÉO˜{ø®„}_ÜQnö]yB-ÅV¶œjå¹IÁ¥¦«ÒÉö¾v\\5*U¶—“sJpşdš÷›Òí‡f›1Û;oY\\ş¢îŞ·¢HÊ]\'ª2!À\0\0\0\0\0\0\0\0\0\0ÂmîVØX¼n.#šj¨CZ•_Ø­zÍO—Üµ¨ªOgXÏ\n‘İux·ó¯ÕÓúúq}¼4;hÓ¥«‚ÖrzÎµO¤äø·\'¼sá?/ÙvmÍ^©\\J6ğíúOÜb®¹e¶*ğ•”~ªuª/\\ãY•ÌŸ>òŞ`dn«Ö­¯å;Jö¾¼iÒ—1Mú1‹B%½¥•-ôí)·Ç*¾;×¯yg1˜?ÎUÒ8Ó]PJ(±RâRùÒ”»[d<Æ`l{i­Ô¦ıoü&xçÙ™}·¥OHÔÖqëúI}çƒÈñm½°ş=ÜL×\\ÿ\0­²1.*d;-«B§	­zçÜ÷™(T‡”]|W¯{ù‹|ÙK}Ô‡”ˆW{R…?4½=Ü}Ã®ı9óöªQ1›_h*QÅ?KrêúÌÇíRë¬i->¼¾åø˜ÖrnRm·Å½í®Û¼ı~”rù3¬=¥Ó»œ~lä»/=§Q­%Œ×Tâ™ŒÌfh³—î-¬êş²Ò–ş˜xÜ]µŠ£û5íõ®œ#\n’•5öuĞ‡˜ÌŠÛ”Û^—Ì¾¶¹^MÕ%ıpÑ™[×Ôÿ\0hÙ°©š–•µ~ªr[ûÍ#2¨Ökƒk°½ÉÎZXß¾nGN¿M­Âæë.ÅÂ_e³b>}¹P­§8´”Zp­¥9.Œ–õ¼è>ye:³[:öyWQnŞåîü¦ŒeüD»×¼:\0\0\0®ò÷oşo²©ZsÕ£oÓZzèôô%)}“b8÷…Í¥ÎßQµOÅµ¢êItsÕxkéQ_Ì¥o#¦®RmÊs{ÜæŞ®Mô¶Ë™‘ó#1™1˜3‘ó#1™1˜3‘ó#2ä.¦¸Nk²Mó‹6ì¶zM•İGÆ¤ßl›ûËY‘óœ’BÛ}¤f3#æ3:âFc2>c0$f3#æ3Fc2>c0$f[®åâÎœœ*Ó”jQ¨¸Â¤^±kÖ‹yŒÀï\\’Ûq¿³£t´Rœt«ô+GtãŞŸ«C0r{K\n÷v-øµ#ªQê’Ò?ù÷\\\0\0ó·*/yí£Wşª¥%ıš/›_á×Ö}Ï—g_9Ô©åÕ«?jmıàHÌfFÌfœÆdlÆ`IÌfFÌfœÆdlÆ`IÌfFÌfœÆdlÆ`IÌfFÌfœÆdlÆ`IÌfFÌfœÆdlÆ`IÌfFÌfœÆdlÆ`l<‰¾æ6•MwN«¡/J«üØŸA.+¾jP¬¸Ñ©NªûRû¨“Ğ\0Éî}‡ÊVòñcØ}O)Ÿ<ÜòjBsŒlêN1œ”gC-w5¬¸‚Ìff>Em_2«íSø>FmO2«íCâ˜ÌË>GmO3©íCâ<ù!´üÎ§µˆVc3)òGiy¥OjçÉ=£æ³ö¡ñŒÌfd¾Jí5Ÿµˆ|–Úm?jÜÆfGä¾ĞóiûPüO>Lßù´½¨~ có“şM_ù´½¨~#äÕÿ\0›ËÚ‡âÆdï“wŞm>øş#äİ÷›O¾?ˆs“×&¯üÚ}ğüO~Lm6ŸµÄ~c3%ò[hy´ı¨|G¿%6šËÚ‡Ä31™•\\‘Ú^k/jêävÒóY{tş 19ŒÌÂä^ÓóY{tş\"¥È©æ¯Û§ñ…Ìfg!v¯š¿ï)üEK[[Í÷”¾ 5ÚïXÉu¦}G±ëgmo?.…)wÁ3€³í®ÿ\0á?öÒøåÉºu)YÚRª±©NÚŒ*GTñœi¥%ªÜ÷¦cSÒÆg zé”:$€Gn[v¤ñ ×f[v&WA w³ËrÙÆsˆ³=e#¶öIKÙÍ‚ 5w±ıŸ™½Ó‚ 5oÌŞƒÕ±½Ñ‚ 5•²\n–É6LÁ¯-”V¶g Ï`† a#³JÖÏ38Œ@Å+¸Ù™-€A©Z·%èze@­S/\0-à€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÙ','green');
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
INSERT INTO proveedor VALUES('7','Diana','54545','7777-7777','diana@gmail.com','Carretera a Santa Ana','Luis SaldaÃ±a','7788-8888','Activo','2018-11-14','incumplimiento\nsegunda oportunidad');
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
INSERT INTO ver_proveedor VALUES('7','Diana','54545','7777-7777','diana@gmail.com','Carretera a Santa Ana','Luis SaldaÃ±a','7788-8888','Activo','2018-11-14','incumplimiento\nsegunda oportunidad');
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

