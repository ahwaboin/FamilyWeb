-- authorities
CREATE TABLE authorities (
	USERNAME  VARCHAR(20) NOT NULL, -- USERNAME
	AUTHORITY VARCHAR(20) NOT NULL  -- AUTHORITY
);

-- backimg
CREATE TABLE backimg (
	location VARCHAR(50)  NOT NULL, -- location
	url      VARCHAR(255) NOT NULL  -- url
);

-- backimg
ALTER TABLE backimg
	ADD CONSTRAINT
		PRIMARY KEY (
			location -- location
		);

-- gallery
CREATE TABLE gallery (
	galleryId INT(11)       NOT NULL, -- galleryId
	title     VARCHAR(100)  NOT NULL, -- title
	content   VARCHAR(1000) NOT NULL, -- content
	day       VARCHAR(100)  NOT NULL, -- day
	mainImg   VARCHAR(100)  NULL      -- mainImg
);

-- gallery
ALTER TABLE gallery
	ADD CONSTRAINT
		PRIMARY KEY (
			galleryId -- galleryId
		);

ALTER TABLE gallery
	MODIFY COLUMN galleryId INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE gallery
	AUTO_INCREMENT = 15;

-- person
CREATE TABLE person (
	id      INT(11)       NOT NULL, -- id
	name    VARCHAR(50)   NOT NULL, -- name
	profile VARCHAR(1000) NOT NULL, -- profile
	birth   VARCHAR(100)  NULL,     -- birth
	role    VARCHAR(50)   NOT NULL, -- role
	img     VARCHAR(255)  NOT NULL  -- img
);

-- person
ALTER TABLE person
	ADD CONSTRAINT
		PRIMARY KEY (
			id -- id
		);

ALTER TABLE person
	MODIFY COLUMN id INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE person
	AUTO_INCREMENT = 15;

-- picture
CREATE TABLE picture (
	picId     INT(11)      NOT NULL, -- picId
	galleryId INT(11)      NOT NULL, -- galleryId
	title     VARCHAR(100) NULL,     -- title
	img       VARCHAR(255) NOT NULL, -- img
	division  INT(11)      NULL      -- division
);

-- picture
ALTER TABLE picture
	ADD CONSTRAINT
		PRIMARY KEY (
			picId -- picId
		);

ALTER TABLE picture
	MODIFY COLUMN picId INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE picture
	AUTO_INCREMENT = 21;

-- story
CREATE TABLE story (
	id      INT(11)       NOT NULL, -- id
	title   VARCHAR(100)  NOT NULL, -- title
	content VARCHAR(1000) NOT NULL, -- content
	day     VARCHAR(100)  NOT NULL, -- day
	img     VARCHAR(255)  NOT NULL  -- img
);

-- story
ALTER TABLE story
	ADD CONSTRAINT
		PRIMARY KEY (
			id -- id
		);

ALTER TABLE story
	MODIFY COLUMN id INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE story
	AUTO_INCREMENT = 10;

-- sys_config
CREATE TABLE sys_config (
	variable VARCHAR(128) NOT NULL, -- variable
	value    VARCHAR(128) NULL,     -- value
	set_time TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP, -- set_time
	set_by   VARCHAR(128) NULL      -- set_by
);

-- sys_config
ALTER TABLE sys_config
	ADD CONSTRAINT
		PRIMARY KEY (
			variable -- variable
		);

-- users
CREATE TABLE users (
	USERNAME VARCHAR(50)  NOT NULL, -- USERNAME
	PASSWORD VARCHAR(500) NOT NULL, -- PASSWORD
	ENABLED  TINYINT(1)   NOT NULL  -- ENABLED
);

-- users
ALTER TABLE users
	ADD CONSTRAINT
		PRIMARY KEY (
			USERNAME -- USERNAME
		);

-- picture
ALTER TABLE picture
	ADD CONSTRAINT FK_gallery_TO_galleryImg -- FK_gallery_TO_galleryImg
		FOREIGN KEY (
			galleryId -- galleryId
		)
		REFERENCES gallery ( -- gallery
			galleryId -- galleryId
		),
	ADD INDEX FK_gallery_TO_galleryImg (
		galleryId -- galleryId
	);