-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 19 2020 г., 17:43
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wow`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_descriprion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `actors`
--

INSERT INTO `actors` (`id`, `fio`, `short_descriprion`, `full_description`, `images`) VALUES
(1, 'Жуков Георгий Константинович', 'Маршал СССР', 'Описание', NULL),
(2, 'Ватутин Николай Федорович', 'Маршал СССР', 'Тут типо текст', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `actors_events`
--

CREATE TABLE `actors_events` (
  `actor_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `actors_monuments`
--

CREATE TABLE `actors_monuments` (
  `id_actor` int(11) DEFAULT NULL,
  `id_monument` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `actors_places`
--

CREATE TABLE `actors_places` (
  `actor_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `id_event` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT 'images/monument_icon.png',
  `coords` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `place_id` int(11) DEFAULT 1,
  `link` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'states/events/',
  `metadata` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id_event`, `title`, `year`, `short_description`, `icon`, `coords`, `place_id`, `link`, `metadata`) VALUES
(2, 'Первый удар немецко-фашистских захватчиков 22 июня 1941', 1941, 'Первый удар немецко-фашистских захватчиков принял 86-й Августовский пограничный отряд', 'images/event_icons/new.gif', '170;40', 1, 'states/events/id_2.html', 'Первый удар немецко-фашистских захватчиков 22 июня 1941'),
(3, 'Операция \"Багратион\" 13 июля 1944', 1944, 'В ходе этой операции Гродно был освобожден от немецко-фашистских оккупантов.', 'images/monument_icon.png', '40;80', 1, 'states/events/id_3.html', 'Операция \"Багратион\" 13 июля 1944'),
(12, 'Выселение евреев в Гродно 1 октября 1941', 1941, '1 октября 1941 года всех евреев Гродно выселили в 2 гетто.', 'images/monument_icon.png', '20;20', 1, 'states/events/id_4.html', 'Выселение евреев в Гродно 1 октября 1941'),
(13, 'Ликвидирование Гродненских гетто 5 марта 1943', 1943, 'В марте 1943 года оба гетто были ликвидированы.', 'images/monument_icon.png', '30;30', 1, 'states/events/id_5.html', 'Ликвидирование Гродненских гетто 5 марта 1943'),
(14, 'Ликвидирование Гродненских гетто 1 ноября 1942', 1942, 'С 1 ноября 1942 г. гитлеровцы начали насильственный вывоз евреев из большинства поселков не только Гродненского уезда', 'images/monument_icon.png', '35;35', 1, 'states/events/id_6.html', 'В январе 1942 года в гетто № 1 была создана подпольная антифашистская организация'),
(15, 'В январе 1943 г. группе еврейской молодежи из 18 человек удалось вырваться из гетто №1.', 1943, 'В январе 1943 г. в дни акции нацистов по отправке евреев из гетто №1 в лагерь смерти группе еврейской молодежи из 18 человек под управлением И.Т. Панкуса удалось вырваться.', 'images/monument_icon.png', '40;40', 1, 'states/events/id_7.html', 'В январе 1943 г. группе еврейской молодежи из 18 человек удалось вырваться из гетто №1. Коробчицы'),
(16, 'Освобождение 3 июля 1944 г. Островецкого  района', 1944, '3 июля 1944 г. Островецкий  район: В освобождении р-на участвовала партизанская бригада имени ЦК КП(б)Б (командир  М.И.Федоров), которая взяла и удерживала р-н до 6.7.1944 г., когда подошли войска 3-го Белорусского фронта.', 'images/monument_icon.png', '40;40', 1, 'states/events/id_8.html', '3 июля 1944 г. Островецкий  район: В освобождении р-на участвовала партизанская бригада имени ЦК КП(б)Б (командир  М.И.Федоров), которая взяла и удерживала р-н до 6.7.1944 г., когда подошли войска 3-го Белорусского фронта.'),
(17, 'Освобождение 5 июля 1944 г. Сморгонского  района', 1944, '5 июля 1944 г. Сморгонский  район: В ходе Минской операции от немецко-фашистских оккупантов освобожден город Сморгонь. В освобождении р-на участвовали 35-я гвардейская танковая бригада (генерал-майор А.А. Асланов), 7-я гвардейская механизированная бригада', 'images/monument_icon.png', '40;40', 1, 'states/events/id_9.html', 'Освобождение 5 июля 1944 г. Сморгонского  района'),
(18, 'Освобождение 7 июля 1944 г. Ошмянского район', 1944, '7 июля 1944 г. Ошмянский район: В ходе Вильнюсской операции войсками 3-го Белорусского фронта освобожден г. Ошмяны. В освобождении р-на участвовали 3-я (подполковник К.А. Гриценко) и 19-я (полковник Г.А. Походеев) гвардейские танковые бригады; 2-я гвардей', 'images/monument_icon.png', '40;40', 1, 'states/events/id_10.html', '7 июля 1944 г. Ошмянский район: В ходе Вильнюсской операции войсками 3-го Белорусского фронта освобожден г. Ошмяны. В освобождении р-на участвовали 3-я (подполковник К.А. Гриценко) и 19-я (полковник Г.А. Походеев) гвардейские танковые бригады; 2-я гвардей'),
(19, 'Освобождение 7 июля 1944 г. Юратишковского района', 1944, '7 июля 1944 г. Юратишковский район: (центр – г.п.Юратишки, ныне в Ивьевском р-не). В освобождении р-на участвовала 32-я кавалерийская дивизия (генерал-майор И.П. Калюжный) 3-го гвардейского кавалерийского корпуса 3-го Белорусского фронта.', 'images/monument_icon.png', '40;40', 1, 'states/events/id_11.html', '7 июля 1944 г. Юратишковский район: (центр – г.п.Юратишки, ныне в Ивьевском р-не). В освобождении р-на участвовала 32-я кавалерийская дивизия (генерал-майор И.П. Калюжный) 3-го гвардейского кавалерийского корпуса 3-го Белорусского фронта.'),
(20, 'Освобождение 13 июля 1944 г. Мостовского района', 1944, ' В освобождении р-на участвовала 348-я стрелковая дивизия (генерал-майор М.А. Никитин) 35-го стрелкового корпуса  3-й армии 2-го Белорусского фронта.', 'images/monument_icon.png', '40;40', 3, 'states/events/id_12.html', 'Освобождение 13 июля 1944 г. Мостовского района'),
(21, 'Освобождение 14 июля 1944 г. Волковысского района', 1944, 'Освобождение 14 июля 1944 г. Волковысского района. В ходе Белостокской операции войсками 2-го Белорусского фронта освобожден г. Волковыск.', 'images/monument_icon.png', '40;40', 1, 'states/events/id_13.html', ' В ходе Белостокской операции войсками 2-го Белорусского фронта освобожден г. Волковыск. 11 частям и соединениям, отличившимся при освобождении города, присвоены почетные наименования “Волковысских”. В освобождении р-на участвовали 129-я (генерал-майор И.'),
(22, 'Освобождение 17 июля 1944 г. Свислочского района', 1944, '17 июля 1944 г. Свислочский район: В освобождении р-на участвовала 82-я стрелковая дивизия (генерал-майор И.В. Писарев).', 'images/monument_icon.png', '40;40', 1, 'states/events/id_14.html', '17 июля 1944 г. Свислочский район: В освобождении р-на участвовала 82-я стрелковая дивизия (генерал-майор И.В. Писарев).'),
(23, 'Освобождение 12 июля 1944 г. Зельвисского района', 1944, '12 июля 1944 г. Зельвенский район: В освобождении р-на участвовала 169-я стрелковая дивизия (полковник Ф.А. Верёвкин) 40-го стрелкового корпуса 3-й армии 2-го Белорусского фронта.', 'images/monument_icon.png', '40;40', 1, 'states/events/id_15.html', '12 июля 1944 г. Зельвенский район: В освобождении р-на участвовала 169-я стрелковая дивизия (полковник Ф.А. Верёвкин) 40-го стрелкового корпуса 3-й армии 2-го Белорусского фронта.');

-- --------------------------------------------------------

--
-- Структура таблицы `events_monuments`
--

CREATE TABLE `events_monuments` (
  `id_event` int(11) DEFAULT NULL,
  `id_monument` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `monuments`
--

CREATE TABLE `monuments` (
  `monument_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plase_id` int(11) DEFAULT NULL,
  `coords` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tooltip_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `monuments`
--

INSERT INTO `monuments` (`monument_id`, `title`, `data`, `short_description`, `full_description`, `plase_id`, `coords`, `metadata`, `type_id`, `tooltip_image`, `link`) VALUES
(1, 'Памятник 1', NULL, 'Краткое описание памятника №1', NULL, NULL, '100;100', 'Памятник №1', '1', 'images/1.jpg', 'states/monuments/s2.html'),
(2, 'Памятник 2', NULL, 'Краткое описание памятника №2', NULL, NULL, '120;120', 'Памятник 2', '2', 'images/1.jpg', 'states/monuments/s2.html'),
(3, 'Памятник №3', NULL, 'Краткое описание памятника №3', NULL, NULL, '150;150', 'Памятник №3', '3', 'images/1.jpg', 'states/monuments/s2.html'),
(4, 'Памятник №4', NULL, 'Краткое описание памятника №4', NULL, NULL, '200;200', '0', '1', 'images/1.jpg', 'states/monuments/s2.html'),
(5, 'Памятник №5', NULL, 'Краткое описание памятника №5', NULL, NULL, '250;250', '0', '2', 'images/1.jpg', 'states/monuments/s2.html'),
(6, 'Памятник №6', NULL, 'Краткое описание памятника №6', NULL, NULL, '300;300', '0', '3', 'images/1.jpg', 'states/monuments/s2.html');

-- --------------------------------------------------------

--
-- Структура таблицы `places`
--

CREATE TABLE `places` (
  `id_place` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_coords` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `places`
--

INSERT INTO `places` (`id_place`, `title`, `map_image`, `map_coords`, `big_map`) VALUES
(1, 'Гродненская область', 'images/events_border/GrodnoRegion.png', '0;445', 'images/events_border/Grodno.png'),
(2, 'Берестовицкий район', 'images/events_border/GrodnoRegion.png', '0;445', 'images/events_border/Grodno.png'),
(3, 'Щучинский район', 'images/events_border/ShuchinRegion.png', '205;424', 'images/events_border/Grodno.png'),
(4, 'Вороновский район', NULL, NULL, NULL),
(5, 'Ошмянский район', NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `actors_events`
--
ALTER TABLE `actors_events`
  ADD KEY `actor_id` (`actor_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Индексы таблицы `actors_monuments`
--
ALTER TABLE `actors_monuments`
  ADD KEY `id_actor` (`id_actor`,`id_monument`),
  ADD KEY `id_monument` (`id_monument`);

--
-- Индексы таблицы `actors_places`
--
ALTER TABLE `actors_places`
  ADD KEY `place_id` (`place_id`),
  ADD KEY `actor_id` (`actor_id`,`place_id`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `place_id` (`place_id`);

--
-- Индексы таблицы `events_monuments`
--
ALTER TABLE `events_monuments`
  ADD KEY `id_event` (`id_event`,`id_monument`),
  ADD KEY `id_monument` (`id_monument`);

--
-- Индексы таблицы `monuments`
--
ALTER TABLE `monuments`
  ADD PRIMARY KEY (`monument_id`),
  ADD KEY `plase_id` (`plase_id`);

--
-- Индексы таблицы `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id_place`),
  ADD KEY `id` (`id_place`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `monuments`
--
ALTER TABLE `monuments`
  MODIFY `monument_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `places`
--
ALTER TABLE `places`
  MODIFY `id_place` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `actors_events`
--
ALTER TABLE `actors_events`
  ADD CONSTRAINT `actors_events_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actors_events_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `actors_monuments`
--
ALTER TABLE `actors_monuments`
  ADD CONSTRAINT `actors_monuments_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `actors_monuments_ibfk_2` FOREIGN KEY (`id_monument`) REFERENCES `monuments` (`monument_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `actors_places`
--
ALTER TABLE `actors_places`
  ADD CONSTRAINT `actors_places_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id_place`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actors_places_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id_place`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `events_monuments`
--
ALTER TABLE `events_monuments`
  ADD CONSTRAINT `events_monuments_ibfk_1` FOREIGN KEY (`id_monument`) REFERENCES `monuments` (`monument_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `events_monuments_ibfk_2` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `monuments`
--
ALTER TABLE `monuments`
  ADD CONSTRAINT `monuments_ibfk_1` FOREIGN KEY (`plase_id`) REFERENCES `places` (`id_place`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
