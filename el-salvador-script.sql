-- -----------------------------------------------------
-- Table `Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Categories` (
  `category_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `createAt` TIMESTAMP NOT NULL,
  `updateAt` TIMESTAMP NULL,
  PRIMARY KEY (`category_id`));

-- -----------------------------------------------------
-- Table `Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Authors` (
  `author_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `handle` TEXT NOT NULL,
  PRIMARY KEY (`author_id`));

-- -----------------------------------------------------
-- Table `Sources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sources` (
  `source_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_name` TEXT NOT NULL,
  `source_type` TEXT NOT NULL,
  `link` TEXT NOT NULL,
  PRIMARY KEY (`source_id`));

-- -----------------------------------------------------
-- Table `Articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Articles` (
  `article_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` TEXT NOT NULL,
  `content` LONGTEXT NULL,
  `publication_date` TIMESTAMP NOT NULL,
  `url` TEXT NOT NULL,
  `updateAt` TIMESTAMP NULL,
  `Categories_category_id` BIGINT UNSIGNED NOT NULL,
  `Authors_author_id` BIGINT UNSIGNED NOT NULL,
  `Sources_source_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`article_id`),
  FOREIGN KEY (`Categories_category_id`) REFERENCES `Categories` (`category_id`),
  FOREIGN KEY (`Authors_author_id`) REFERENCES `Authors` (`author_id`),
  FOREIGN KEY (`Sources_source_id`) REFERENCES `Sources` (`source_id`));

-- -----------------------------------------------------
-- Table `Interactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Interactions` (
  `interaction_id` INT UNSIGNED NOT NULL,
  `likes` INT NULL,
  `shares` INT NULL,
  `comments_count` INT NULL,
  `createAt` TIMESTAMP NULL,
  `updateAt` TIMESTAMP NULL,
  `articles_article_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`interaction_id`),
  FOREIGN KEY (`articles_article_id`) REFERENCES `Articles` (`article_id`));

-- -----------------------------------------------------
-- Table `Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comments` (
  `comment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` MEDIUMTEXT NOT NULL,
  `post_date` TIMESTAMP NOT NULL,
  `Interactions_interaction_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`comment_id`),
  FOREIGN KEY (`Interactions_interaction_id`) REFERENCES `Interactions` (`interaction_id`));

-- -----------------------------------------------------
-- Table `Sources_has_Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sources_has_Authors` (
  `Sources_source_id` BIGINT UNSIGNED NOT NULL,
  `Authors_author_id` BIGINT UNSIGNED NOT NULL,
  FOREIGN KEY (`Sources_source_id`) REFERENCES `Sources` (`source_id`),
  FOREIGN KEY (`Authors_author_id`) REFERENCES `Authors` (`author_id`));

