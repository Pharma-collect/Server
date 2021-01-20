CREATE TABLE `user_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `lastname` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` decimal(10,0) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

CREATE TABLE `pharmacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `has_shop` tinyint(1) DEFAULT NULL,
  `road_nb` int(11) DEFAULT NULL,
  `road` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` decimal(10,0) DEFAULT NULL,
  `post_code` decimal(10,0) DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `boss` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `user_pro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_pro_pharmacy_id` (`pharmacy_id`),
  CONSTRAINT `user_pro_pharmacy_id` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `prescription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('pending','ready','container','finish') CHARACTER SET utf8 NOT NULL DEFAULT 'pending',
  `id_client` int(11) DEFAULT NULL,
  `id_pharmacy` int(11) DEFAULT NULL,
  `id_preparator` int(11) DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prescription_client_id` (`id_client`),
  KEY `prescription_pharmacy_id` (`id_pharmacy`),
  KEY `prescription_pro_id` (`id_preparator`),
  CONSTRAINT `prescription_client_id` FOREIGN KEY (`id_client`) REFERENCES `user_client` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `prescription_pharmacy_id` FOREIGN KEY (`id_pharmacy`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prescription_pro_id` FOREIGN KEY (`id_preparator`) REFERENCES `user_pro` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` float NOT NULL,
  `description` longtext CHARACTER SET utf8 DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `capacity` float DEFAULT NULL,
  `id_pharmacy` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `product_pharmacy_id` (`id_pharmacy`),
  CONSTRAINT `product_pharmacy_id` FOREIGN KEY (`id_pharmacy`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `container_number` int(11) DEFAULT NULL,
  `id_pharmacy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `container_pharmacy_id` (`id_pharmacy`),
  CONSTRAINT `container_pharmacy_id` FOREIGN KEY (`id_pharmacy`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

CREATE TABLE `order_global` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('pending','ready','container','finish') CHARACTER SET utf8 NOT NULL DEFAULT 'pending',
  `total_price` float DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_preparator` int(11) DEFAULT NULL,
  `id_container` int(11) DEFAULT NULL,
  `id_pharmacy` int(11) DEFAULT NULL,
  `id_prescription` int(11) unsigned DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_client_id` (`id_client`),
  KEY `order_container` (`id_container`),
  KEY `order_preparator` (`id_preparator`),
  KEY `order_pharmacie_id` (`id_pharmacy`) USING BTREE,
  KEY `order_prescription` (`id_prescription`) USING BTREE,
  CONSTRAINT `order_client_id` FOREIGN KEY (`id_client`) REFERENCES `user_client` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_container` FOREIGN KEY (`id_container`) REFERENCES `container` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_pharmacy_id` FOREIGN KEY (`id_pharmacy`) REFERENCES `pharmacy` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_preparator` FOREIGN KEY (`id_preparator`) REFERENCES `user_pro` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_prescription` FOREIGN KEY (`id_prescription`) REFERENCES `prescription` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_detail_product_id` (`id_product`),
  KEY `order_detail_order_id` (`id_order`),
  CONSTRAINT `order_detail_order_id` FOREIGN KEY (`id_order`) REFERENCES `order_global` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_detail_product_id` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=latin1;

CREATE TABLE `qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qr_order_id` (`id_order`),
  CONSTRAINT `qr_order_id` FOREIGN KEY (`id_order`) REFERENCES `order_global` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

GRANT SELECT, INSERT, UPDATE, DELETE ON pharmadb.* TO 'web'@'%' IDENTIFIED BY 'password';
