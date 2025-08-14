--
select * from users;
select * from authorities;
--
--user 추가는 자바 main 에서

insert into authorities values('root','ROLE_ADMIN');
insert into authorities values('admin','ROLE_ADMIN');

--root제외 검색
SELECT * FROM users where username!='root'

--backImg 데이터 삽입
insert into backImg values('index','index.jpg');
insert into backImg values('about','about.jpg');
insert into backImg values('story','story.jpg');
insert into backImg values('gallery','gallery.jpg');

select * from backImg;

--person data insert
INSERT INTO `family`.`person` (`id`, `name`, `profile`, `birth`, `role`, `img`) 
VALUES (NULL, 'Jaime Gemstone', 
'Modify on the Administrator page.
To go to the Administrator page,
click Sign in the upper-right corner.
On the Administrator page,<br/>you can modify many things.
Even the background image!', 
'2017-07-19', 'father', 'groom.jpg');
INSERT INTO `family`.`person` (`id`, `name`, `profile`, `birth`, `role`, `img`) 
VALUES (NULL, 'Jaime Gemstone', 
'Modify on the Administrator page.
To go to the Administrator page,
click Sign in the upper-right corner.
On the Administrator page,
you can modify many things.
Even the background image!', 
'2017-07-19', 'mother', 'bride.jpg');
INSERT INTO `family`.`person` (`id`, `name`, `profile`, `birth`, `role`, `img`) 
VALUES (NULL, 'Jaime Gemstone', 
'Modify on the Administrator page.
To go to the Administrator page,
click Sign in the upper-right corner.
On the Administrator page,
you can modify many things.
Even the background image!', 
'2017-07-19', 'child', 'child01.jpg');
INSERT INTO `family`.`person` (`id`, `name`, `profile`, `birth`, `role`, `img`) 
VALUES (NULL, 'Jaime Gemstone', 
'Modify on the Administrator page.
To go to the Administrator page,
click Sign in the upper-right corner.
On the Administrator page,
you can modify many things.
Even the background image!', 
'2017-07-19', 'child', 'child02.jpg');
INSERT INTO `family`.`person` (`id`, `name`, `profile`, `birth`, `role`, `img`) 
VALUES (NULL, 'Jaime Gemstone', 
'Modify on the Administrator page.
To go to the Administrator page,
click Sign in the upper-right corner.
On the Administrator page,
you can modify many things.
Even the background image!', 
'2017-07-19', 'child', 'child03.jpg');

--
select * from person;

--story table data insert
INSERT INTO `family`.`story` (`id`, `title`, `content`, `day`, `img`) VALUES (NULL, 'First We Meet', 'Modify on the Administrator page. 
To go to the Administrator page, 
click Sign in the upper-right corner. 
On the Administrator page, 
you can modify many things. 
Even the background image!', 'DECEMBER 25, 2015', 'couple-1.jpg');
INSERT INTO `family`.`story` (`id`, `title`, `content`, `day`, `img`) VALUES (NULL, 'First Date', 'Modify on the Administrator page. 
To go to the Administrator page, 
click Sign in the upper-right corner. 
On the Administrator page, 
you can modify many things. 
Even the background image!', 'DECEMBER 28, 2015', 'couple-2.jpg');
INSERT INTO `family`.`story` (`id`, `title`, `content`, `day`, `img`) VALUES (NULL, 'In A Relationship', 'Modify on the Administrator page. 
To go to the Administrator page, 
click Sign in the upper-right corner. 
On the Administrator page, 
you can modify many things. 
Even the background image!', 'JANUARY 1, 2016', 'couple-3.jpg');

--
SELECT * FROM story;

--gallery data insert
INSERT INTO `family`.`gallery` (`galleryId`, `title`, `content`, `day`,mainImg) 
VALUES (NULL, 'Gallery Example01', 'Modify on the Administrator page. 
To go to the Administrator page, 
click Sign in the upper-right corner. 
On the Administrator page, 
you can modify many things. 
Even the background image!', '2017년 7월 20일','gallery-1.jpg');
INSERT INTO `family`.`gallery` (`galleryId`, `title`, `content`, `day`,mainImg) 
VALUES (NULL, 'Gallery Example02', 'Modify on the Administrator page. 
To go to the Administrator page, 
click Sign in the upper-right corner. 
On the Administrator page, 
you can modify many things. 
Even the background image!', '2017년 7월 20일','gallery-2.jpg');
INSERT INTO `family`.`gallery` (`galleryId`, `title`, `content`, `day`,mainImg) 
VALUES (NULL, 'Gallery Example03', 'Modify on the Administrator page. 
To go to the Administrator page, 
click Sign in the upper-right corner. 
On the Administrator page, 
you can modify many things. 
Even the background image!', '2017년 7월 20일','gallery-3.jpg');

--
select * from gallery;

--picture data insert
INSERT INTO `family`.`picture` (`picId`, `galleryId`, `division`, `title`, `img`) 
VALUES (NULL, '1', '1', 'picture title example Main', 'gallery-1.jpg');
INSERT INTO `family`.`picture` (`picId`, `galleryId`, `division`, `title`, `img`) 
VALUES (NULL, '1', '2', 'picture title example01', 'gallery-1.jpg');
INSERT INTO `family`.`picture` (`picId`, `galleryId`, `division`, `title`, `img`) 
VALUES (NULL, '1', '2', 'picture title example02', 'gallery-2.jpg');
INSERT INTO `family`.`picture` (`picId`, `galleryId`, `division`, `title`, `img`) 
VALUES (NULL, '1', '2', 'picture title example03', 'gallery-3.jpg');
INSERT INTO `family`.`picture` (`picId`, `galleryId`, `division`, `title`, `img`) 
VALUES (NULL, '1', '2', 'picture title example04', 'gallery-4.jpg');
INSERT INTO `family`.`picture` (`picId`, `galleryId`, `division`, `title`, `img`) 
VALUES (NULL, '1', '2', 'picture title example05', 'gallery-5.jpg');
INSERT INTO `family`.`picture` (`picId`, `galleryId`, `division`, `title`, `img`) 
VALUES (NULL, '1', '2', 'picture title example06', 'gallery-6.jpg');

