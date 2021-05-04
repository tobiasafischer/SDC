
  /* SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO"; */
  /* SET FOREIGN_KEY_CHECKS=0; */

DROP TABLE IF EXISTS product;
		
CREATE SEQUENCE product_seq;

CREATE TABLE product (
  id INTEGER NULL DEFAULT NEXTVAL ('product_seq') DEFAULT NULL,
  name MEDIUMTEXT NULL DEFAULT NULL,
  slogan MEDIUMTEXT NULL DEFAULT NULL,
  description MEDIUMTEXT NULL DEFAULT NULL,
  category MEDIUMTEXT NULL DEFAULT NULL,
  default_price INTEGER NULL DEFAULT NULL,
  id_features INTEGER NULL DEFAULT NULL,
  id_styles INTEGER NULL DEFAULT NULL,
  id_related_arr INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS Characteristics;
		
CREATE SEQUENCE Characteristics_seq;

CREATE TABLE Characteristics (
  id INTEGER NULL DEFAULT NEXTVAL ('Characteristics_seq') DEFAULT NULL,
  id_product INTEGER NULL DEFAULT NULL,
  id_size INTEGER NULL DEFAULT NULL,
  id_width INTEGER NULL DEFAULT NULL,
  id_comfort INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS metadata;
		
CREATE SEQUENCE metadata_seq;

CREATE TABLE metadata (
  id INTEGER NULL DEFAULT NEXTVAL ('metadata_seq') DEFAULT NULL,
  id_product INTEGER NULL DEFAULT NULL,
  id_ratings INTEGER NULL DEFAULT NULL,
  id_recommend INTEGER NULL DEFAULT NULL,
  id_Characteristics INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS style;
		
CREATE SEQUENCE style_seq;

CREATE TABLE style (
  id INTEGER NULL DEFAULT NEXTVAL ('style_seq') DEFAULT NULL,
  name MEDIUMTEXT NULL DEFAULT NULL,
  original_price INTEGER NULL DEFAULT NULL,
  sale_price INTEGER NULL DEFAULT NULL,
  default SMALLINT NULL DEFAULT 0,
  id_photos INTEGER NULL DEFAULT NULL,
  id_skus INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS Review;
		
CREATE SEQUENCE Review_seq;

CREATE TABLE Review (
  id INTEGER NULL DEFAULT NEXTVAL ('Review_seq') DEFAULT NULL,
  id_product INTEGER NULL DEFAULT NULL,
  page INTEGER NULL DEFAULT 0,
  rating INTEGER NULL DEFAULT NULL,
  summary MEDIUMTEXT NULL DEFAULT NULL,
  recommend SMALLINT NULL DEFAULT 0,
  response MEDIUMTEXT NULL DEFAULT NULL,
  body MEDIUMTEXT NULL DEFAULT NULL,
  date TIMESTAMP(0) NULL DEFAULT NULL,
  reviewer_name MEDIUMTEXT NULL DEFAULT NULL,
  helpfulness INTEGER NULL DEFAULT NULL,
  id_photos BYTEA NULL DEFAULT NULL,
  email MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS photos;
		
CREATE SEQUENCE photos_seq;

CREATE TABLE photos (
  id INTEGER NULL DEFAULT NEXTVAL ('photos_seq') DEFAULT NULL,
  url MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS features;
		
CREATE SEQUENCE features_seq;

CREATE TABLE features (
  id INTEGER NULL DEFAULT NEXTVAL ('features_seq') DEFAULT NULL,
  id_feature INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS styles;
		
CREATE SEQUENCE styles_seq;

CREATE TABLE styles (
  id INTEGER NULL DEFAULT NEXTVAL ('styles_seq') DEFAULT NULL,
  id_style INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS skus;
		
CREATE SEQUENCE skus_seq;

CREATE TABLE skus (
  id INTEGER NULL DEFAULT NEXTVAL ('skus_seq') DEFAULT NULL,
  id_sku INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS related_arr;
		
CREATE SEQUENCE related_arr_seq;

CREATE TABLE related_arr (
  id INTEGER NULL DEFAULT NEXTVAL ('related_arr_seq') DEFAULT NULL,
  id_related INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS size;
		
CREATE SEQUENCE size_seq;

CREATE TABLE size (
  id INTEGER NULL DEFAULT NEXTVAL ('size_seq') DEFAULT NULL,
  value INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS width;
		
CREATE SEQUENCE width_seq;

CREATE TABLE width (
  id INTEGER NULL DEFAULT NEXTVAL ('width_seq') DEFAULT NULL,
  value INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS comfort;
		
CREATE SEQUENCE comfort_seq;

CREATE TABLE comfort (
  id INTEGER NULL DEFAULT NEXTVAL ('comfort_seq') DEFAULT NULL,
  value INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS ratings;
		
CREATE SEQUENCE ratings_seq;

CREATE TABLE ratings (
  id INTEGER NULL DEFAULT NEXTVAL ('ratings_seq') DEFAULT NULL,
  0 INTEGER NULL DEFAULT NULL,
  1 INTEGER NULL DEFAULT NULL,
  2 INTEGER NULL DEFAULT NULL,
  3 INTEGER NULL DEFAULT NULL,
  4 INTEGER NULL DEFAULT NULL,
  5 INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS recommend;
		
CREATE SEQUENCE recommend_seq;

CREATE TABLE recommend (
  id INTEGER NULL DEFAULT NEXTVAL ('recommend_seq') DEFAULT NULL,
  false INTEGER NULL DEFAULT NULL,
  true INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS feature;
		
CREATE SEQUENCE feature_seq;

CREATE TABLE feature (
  id INTEGER NULL DEFAULT NEXTVAL ('feature_seq') DEFAULT NULL,
  feature MEDIUMTEXT NULL DEFAULT NULL,
  value MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS sku;
		
CREATE SEQUENCE sku_seq;

CREATE TABLE sku (
  id INTEGER NULL DEFAULT NEXTVAL ('sku_seq') DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  size MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS related;
		
CREATE SEQUENCE related_seq;

CREATE TABLE related (
  id INTEGER NULL DEFAULT NEXTVAL ('related_seq') DEFAULT NULL,
  value INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS photo;
		
CREATE SEQUENCE photo_seq;

CREATE TABLE photo (
  id INTEGER NULL DEFAULT NEXTVAL ('photo_seq') DEFAULT NULL,
  thumbnail_url INTEGER NULL DEFAULT NULL,
  url MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS photos;
		
CREATE SEQUENCE photos_seq;

CREATE TABLE photos (
  id INTEGER NULL DEFAULT NEXTVAL ('photos_seq') DEFAULT NULL,
  id_photo INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);


ALTER TABLE product ADD FOREIGN KEY (id_features) REFERENCES features (id);
ALTER TABLE product ADD FOREIGN KEY (id_styles) REFERENCES styles (id);
ALTER TABLE product ADD FOREIGN KEY (id_related_arr) REFERENCES related_arr (id);
ALTER TABLE Characteristics ADD FOREIGN KEY (id_product) REFERENCES product (id);
ALTER TABLE Characteristics ADD FOREIGN KEY (id_size) REFERENCES size (id);
ALTER TABLE Characteristics ADD FOREIGN KEY (id_width) REFERENCES width (id);
ALTER TABLE Characteristics ADD FOREIGN KEY (id_comfort) REFERENCES comfort (id);
ALTER TABLE metadata ADD FOREIGN KEY (id_product) REFERENCES product (id);
ALTER TABLE metadata ADD FOREIGN KEY (id_ratings) REFERENCES ratings (id);
ALTER TABLE metadata ADD FOREIGN KEY (id_recommend) REFERENCES recommend (id);
ALTER TABLE metadata ADD FOREIGN KEY (id_Characteristics) REFERENCES Characteristics (id);
ALTER TABLE style ADD FOREIGN KEY (id_photos) REFERENCES photos (id);
ALTER TABLE style ADD FOREIGN KEY (id_skus) REFERENCES skus (id);
ALTER TABLE Review ADD FOREIGN KEY (id_product) REFERENCES product (id);
ALTER TABLE Review ADD FOREIGN KEY (id_photos) REFERENCES photos (id);
ALTER TABLE features ADD FOREIGN KEY (id_feature) REFERENCES feature (id);
ALTER TABLE styles ADD FOREIGN KEY (id_style) REFERENCES style (id);
ALTER TABLE skus ADD FOREIGN KEY (id_sku) REFERENCES sku (id);
ALTER TABLE related_arr ADD FOREIGN KEY (id_related) REFERENCES related (id);

ALTER TABLE product ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE Characteristics ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE metadata ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE style ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE Review ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE photos ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE features ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE styles ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE skus ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE related_arr ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE size ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE width ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE comfort ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE ratings ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE recommend ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE feature ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE sku ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE related ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE photo ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE photos ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;