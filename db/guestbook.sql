-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               PostgreSQL 14.5, compiled by Visual C++ build 1914, 64-bit
-- Операционная система:         
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица public.comment
DROP TABLE IF EXISTS "comment";
CREATE TABLE IF NOT EXISTS "comment" (
	"id" INTEGER NOT NULL,
	"conference_id" INTEGER NULL DEFAULT NULL,
	"author" VARCHAR(255) NOT NULL,
	"text" TEXT NOT NULL,
	"email" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"photo_filename" VARCHAR(255) NULL DEFAULT 'NULL::character varying',
	PRIMARY KEY ("id"),
	INDEX "idx_9474526c604b8382" ("conference_id"),
	CONSTRAINT "fk_9474526c604b8382" FOREIGN KEY ("conference_id") REFERENCES "conference" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Дамп данных таблицы public.comment: 3 rows
/*!40000 ALTER TABLE "comment" DISABLE KEYS */;
INSERT INTO "comment" ("id", "conference_id", "author", "text", "email", "created_at", "photo_filename") VALUES
	(4, NULL, 'Shindax', 'asd asd asd ghjfghj fghj', 'shendakov7036@gmail.com', '2022-01-01 00:00:00', 'Moscow.png'),
	(6, NULL, 'Shindax', 'hgjkghjk', 'shendakov7036@gmail.com', '2022-09-14 10:10:00', NULL),
	(5, 1, 'Shindax', 'hgjk ghjk ghjk', 'shendakov7036@gmail.com', '2022-09-14 13:13:00', NULL);
/*!40000 ALTER TABLE "comment" ENABLE KEYS */;

-- Дамп структуры для таблица public.conference
DROP TABLE IF EXISTS "conference";
CREATE TABLE IF NOT EXISTS "conference" (
	"id" INTEGER NOT NULL,
	"city" VARCHAR(255) NULL DEFAULT 'NULL::character varying',
	"year" VARCHAR(4) NOT NULL,
	"is_international" BOOLEAN NOT NULL,
	PRIMARY KEY ("id")
);

-- Дамп данных таблицы public.conference: 2 rows
/*!40000 ALTER TABLE "conference" DISABLE KEYS */;
INSERT INTO "conference" ("id", "city", "year", "is_international") VALUES
	(1, 'Amsterdam', '2022', 'true'),
	(2, 'Paris', '2021', 'false');
/*!40000 ALTER TABLE "conference" ENABLE KEYS */;

-- Дамп структуры для таблица public.doctrine_migration_versions
DROP TABLE IF EXISTS "doctrine_migration_versions";
CREATE TABLE IF NOT EXISTS "doctrine_migration_versions" (
	"version" VARCHAR(191) NOT NULL,
	"executed_at" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"execution_time" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("version")
);

-- Дамп данных таблицы public.doctrine_migration_versions: 2 rows
/*!40000 ALTER TABLE "doctrine_migration_versions" DISABLE KEYS */;
INSERT INTO "doctrine_migration_versions" ("version", "executed_at", "execution_time") VALUES
	('DoctrineMigrations\Version20220914010516', '2022-09-14 04:06:23', 1092),
	('DoctrineMigrations\Version20220914030622', '2022-09-14 06:06:37', 33);
/*!40000 ALTER TABLE "doctrine_migration_versions" ENABLE KEYS */;

-- Дамп структуры для таблица public.messenger_messages
DROP TABLE IF EXISTS "messenger_messages";
CREATE TABLE IF NOT EXISTS "messenger_messages" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''messenger_messages_id_seq''::regclass)',
	"body" TEXT NOT NULL,
	"headers" TEXT NOT NULL,
	"queue_name" VARCHAR(190) NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"available_at" TIMESTAMP NOT NULL,
	"delivered_at" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	PRIMARY KEY ("id"),
	INDEX "idx_75ea56e0fb7336f0" ("queue_name"),
	INDEX "idx_75ea56e0e3bd61ce" ("available_at"),
	INDEX "idx_75ea56e016ba31db" ("delivered_at")
);

-- Дамп данных таблицы public.messenger_messages: 0 rows
/*!40000 ALTER TABLE "messenger_messages" DISABLE KEYS */;
/*!40000 ALTER TABLE "messenger_messages" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
