
#
# Structure for table "usuarios"
#

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `senha` varchar(255) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `token` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "usuarios"
#


#
# Structure for table "posts"
#

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL DEFAULT '',
  `imagem` varchar(255) DEFAULT NULL,
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_posts` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_posts` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "posts"
#


#
# Structure for table "comentarios"
#

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `id_post` int(11) NOT NULL DEFAULT '0',
  `comentario` text NOT NULL,
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_id_post_comentarios` (`id_post`),
  KEY `fk_id_usuario_comentarios` (`id_usuario`),
  CONSTRAINT `fk_id_post_comentarios` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_id_usuario_comentarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "comentarios"
#


#
# Structure for table "curtidas"
#

DROP TABLE IF EXISTS `curtidas`;
CREATE TABLE `curtidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_curtidas` (`id_usuario`),
  KEY `fk_id_posts_curtidas` (`id_post`),
  CONSTRAINT `fk_id_posts_curtidas` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_id_usuario_curtidas` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "curtidas"
#


#
# Structure for table "logs"
#

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `log` varchar(255) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_logs` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_logs` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "logs"
#

