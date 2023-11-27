CREATE DATABASE IF NOT EXISTS `ermakus_wt_02`;
USE `ermakus_wt_02`;
CREATE TABLE IF NOT EXISTS `authors` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `imagePath` VARCHAR(50) NOT NULL,
    INDEX `name_indx` (`name`)
);

CREATE TABLE IF NOT EXISTS `users` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `email` VARCHAR(90) NOT NULL UNIQUE,
    `birthDate` DATE NOT NULL,
    `registrationDate` DATE NOT NULL,
    `balance` DECIMAL(26, 2) NOT NULL,
    `password` VARCHAR(64) NOT NULL,
    `address` VARCHAR(90),
    `phoneNumber` VARCHAR(20),
    `banned` INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `orders` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`userId` INT NOT NULL,
	`date` TIMESTAMP NOT NULL,
    `price` DECIMAL(24, 2) NOT NULL,
    CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
    INDEX `userId_indx` (`userId`)
);

CREATE TABLE IF NOT EXISTS `books` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(350) NOT NULL,
    `imagePath` VARCHAR(50) NOT NULL,
    `author` VARCHAR(50) NOT NULL,
    `price` DECIMAL(24, 2) NOT NULL,
    CONSTRAINT `fk_author` FOREIGN KEY (`author`) REFERENCES `authors` (`name`),
    INDEX `author_indx` (`author`)
);

CREATE TABLE IF NOT EXISTS `orders_books` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `orderId` INT NOT NULL,
    `bookId` INT NOT NULL,
    CONSTRAINT `fk_orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
    CONSTRAINT `fk_bookId` FOREIGN KEY (`bookId`) REFERENCES `books` (`id`),
    INDEX `orderId_indx` (`orderId`),
    INDEX `bookId_indx` (`bookId`)
);

CREATE TABLE IF NOT EXISTS `roles`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `users_roles`
(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `userId` INT NOT NULL,
    `roleId` INT NOT NULL,
    CONSTRAINT `fk_uId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
    CONSTRAINT `fk_roleId` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`)
);

/*===TEST DATA===*/

/*AUTHORS INSERT*/
INSERT INTO `authors` (`name`, `imagePath`) VALUES ('Iгар Дабралюбау', 'assets/authors/Dabralubov.jpg');
INSERT INTO `authors` (`name`, `imagePath`) VALUES ('Нiкалай Лукьянау', 'assets/authors/Lukyanov.jpg');
INSERT INTO `authors` (`name`, `imagePath`) VALUES ('Уладзiмир Мароз', 'assets/authors/Moroz.jpg');
INSERT INTO `authors` (`name`, `imagePath`) VALUES ('Уладзiмир Арлоу', 'assets/authors/Orlov.jpg');
INSERT INTO `authors` (`name`, `imagePath`) VALUES ('Юрый Тарыч', 'assets/authors/Tarich.jpg');

/*BOOKS INSERT*/
INSERT INTO `books` (`name`, `description`, `imagePath`, `author`, `price`) VALUES
   ('Дзіўныя прыгоды Дзяніса Караблёва',
	'«Дзіўныя прыгоды Дзяніса Караблёва» — савецкі двухсерыйны дзіцячы тэлефільм, зняты паводле апавяданняў Віктара Драгунскага ў пастаноўцы Ігара Дабралюбава рэжысёрамі-пастаноўшчыкамі Ігарам Пушкаровым і Уладзімірам Коласам у 1979 годзе.',
	'assets/books/id_bizzard.jpg',
    'Iгар Дабралюбау',
    4.99
   );
INSERT INTO `books` (`name`, `description`, `imagePath`, `author`, `price`) VALUES
    ('Блакітны карбункул',
     '«Блакітны карбункул» — савецкі мастацкі фільм у жанры музычнага дэтэктыва-камедыі, пастаўлены ў 1979 годзе на кінастудыі «Беларусьфільм» рэжысёрам Мікалаем Лукьянавым паводле аднайменнага апавядання Артура Конан Дойла.',
     'assets/books/nl_blue.jpg',
     'Нiкалай Лукьянау',
     7.99
    );
INSERT INTO `books` (`name`, `description`, `imagePath`, `author`, `price`) VALUES
    ('Чалавек з чорнай "Волгі',
     'Чалавек з чорнай "Волгі" - савецкі мастацкі фільм 1990 года. Зняты кінакампаніяй "Дыялог" на кінастудыі Беларусьфільм паводле рамана Андрэя Малчанава "Новы год у кастрычніку".',
     'assets/books/um_volga.jpg',
     'Уладзiмир Мароз',
     3.49
    );
INSERT INTO `books` (`name`, `description`, `imagePath`, `author`, `price`) VALUES
    ('Пракляты затульны дом',
     'Серыял зняты паводле рамана (сямейнага аддання) Стэфана Жаромскага "Верная рака". Заходняя Беларусь, 1863 год. Царскія драгуны адсочваюць удзельнікаў польскага паўстання.',
     'assets/books/ua_dom.jpg',
     'Уладзiмир Арлоу',
     1.99
    );
INSERT INTO `books` (`name`, `description`, `imagePath`, `author`, `price`) VALUES
    ('Стэпавыя віцязі',
     '"Стэпавыя віцязі" - двухсерыйная гістарычная драма аб падзеях XVII стагоддзя ў Халхе, знятая ў 1945 годзе ў Манголіі.',
     'assets/books/ut_vitjazi.jpg',
     'Юрый Тарыч',
     9.99
    );

INSERT INTO `roles` (`id`, `name`) VALUES ('1', 'ROLE_ADMIN');

INSERT INTO `users` (`id`, `name`, `lastName`, `email`, `birthDate`, `registrationDate`, `balance`, `password`, `address`, `phoneNumber`, `banned`) VALUES ('1', 'Dmitriy', 'Ermolovich', 'ermakus@gmail.com', '2004-05-08', '2023-11-20', '300.00', '00dd303d42a48b12b4f948e1eb821e9848cba34a5397715debe6266c6c1db2fc', NULL, NULL, '0');

INSERT INTO `users_roles` (`id`, `userId`, `roleId`) VALUES ('1', '1', '1');