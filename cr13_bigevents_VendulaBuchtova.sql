-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 15. Mai 2021 um 11:26
-- Server-Version: 10.4.18-MariaDB
-- PHP-Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr13_bigevents_VendulaBuchtova`
--
CREATE DATABASE IF NOT EXISTS `cr13_bigevents_VendulaBuchtova` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr13_bigevents_VendulaBuchtova`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210514090808', '2021-05-14 09:08:20', 47);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_and_start` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_num` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `more_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`id`, `name`, `date_and_start`, `description`, `img`, `capacity`, `email`, `phone_num`, `address`, `url`, `more_desc`) VALUES
(1, 'Lady with Fan', '2021-03-25 09:00:00', 'The last, largely completed painting by the Viennese artist icon Gustav Klimt can be seen again in Vienna after more than 100 years. The Belvedere is showing \"Lady with Fan\" as part of a special exhibition on the final phase of Klimt\'s work.', 'https://events.wien.info/media/full/Dame_mit_Fächer.jpg', 2000, 'info@belvedere.at', '+43 1 795 57-0', 'Belvedere Museum Wien | Prinz-Eugen-Straße 27 1030 Wien', 'www.belvedere.at', 'It was the last picture that Gustav Klimt (1862-1918) worked on in his studio in Vienna-Hietzing in 1917. Apart from a few details, the co-founder of the Vienna Secession was able to complete Lady with Fan before his death. It shows one of Klimt\'s favorite subjects – a \"beautiful Viennese woman\". However, not some society lady – a frequent motif in Klimt\'s work – but a supposedly unknown dancer, looking confidently into the distance and holding a fan in front of her upper body. In any case, this is \"unadorned Klimt\": because the work was never covered with the special protective layer, the varnish, usually found on oil paintings.'),
(2, 'Live through Vienna', '2021-05-09 08:00:00', 'Follow us again on May 9th for an online Vienna/Now Live Walk through the city. Enjoy an inspiring stroll through the town with our guide Alexa Brauner.', 'https://www.wien.info/resource/image/387912/1x1/700/700/da0d16e69ead3b5c01614450104af6bb/RG/40480-rosengarten-volksgarten-theseustempel.jpg', 1000, 'info@khm.at', '+43 1 525 24-0', 'Kunsthistorische Museum | Maria-Theresien-Platz 1010 Vienna', 'http://www.khm.at/', 'Honestly, how often have you thought to yourself: “A trip to Vienna – that\'s just what I need now?!” With our Instagram Live Walks we want to bring a piece of Vienna directly to your home and be an inspiration for your next visit. Our tour guide Alexa Brauner has all kinds of insider tips for you and will show you many a hidden spot.'),
(3, 'Musician\'s Memorials', '2021-06-08 18:00:00', 'In no other city in the world have so many world-renowned musicians and composers made their home. Accordingly, there are numerous occasions to walk in the footsteps of the masters, to see how they lived and to admire memorabilia.', 'https://www.wien.info/resource/image/304996/1x1/700/700/672504aa97ded4916f92a1b0f34f9c1d/bS/mozarthaus-silhoutte.jpg', 5000, 'office@mozarthausvienna.at', '+43 1 512 17 91', 'Mozart Haus Vienna | Domgasse 5 1010 Vienna', 'http://www.mozarthausvienna.at', 'The Mozarthaus Vienna and the Beethoven Museum are especially impressive. In Vienna’s musician’s memorials - apartments of famous composers which have been turned into museums – you can see the furniture and objects that were owned by the artists themselves, as well as autographs, facsimiles of scores, paintings and photos. The most important works by the composers are usually played in historic or prominently cast performances and can be listened to with earphones.'),
(4, 'Sigmund Freud Tour Vienna', '2021-06-25 09:00:00', 'There\'s currently no getting around Sigmund Freud: \"His\" museum in Vienna is being reopened, and a Netflix series about the young Freud has been broadcast around the world since March 23, 2020.', 'https://www.wien.info/resource/image/307752/1x1/700/700/98c594fd7d6c79598136d9e8118d058d/iQ/remembering-1-sigmund-freud-portrait.jpg', 40, 'cafe@landtmann.at', '+43 1 24 100-120', 'Café Landtmann | Universitätsring 4,1010 Vienna', 'http://www.landtmann.at', 'This ambitious doctor became a pop star of the academic world – a man who revolutionized thinking about the human condition from his practice in Vienna. In early 1876, nothing suggested that 19-year-old medical student Sigmund Freud would one day become a great scientist and the cartographer of the Viennese soul. Quite the opposite: he was standing – haunted by the disappointment of a first love lost and struggling with poverty – in the zoology department in Trieste and, scalpel in hand, attempting to determine the location of the sex organs of an eel. His anatomy teacher admired the zeal with which he went about this task. For his doctoral thesis in 1881, Freud wrote about the nervous systems of lower fish species.'),
(7, 'Miss Saigon', '2021-12-01 19:00:00', 'Finally in Vienna: the global musical hit Miss Saigon, from December 2021, at the freshly renovated Raimund Theater. The masterpiece has touched the world for three decades with stunning effects and Far Eastern flair.', 'https://www.wien.info/resource/image/304792/3x2/800/533/22ff5b1bd3de15ff325f373f1d55bbd1/lZ/miss-saigon-musical.jpg', 300, 'info@vbw.at', '+43 1 588 85', 'Raimund Theater | Wallgasse 18-20  1060 Vienna', 'http://www.musicalvienna.at', 'It is a love story: the young Vietnamese girl Kim (Vanessa Heinz) and the American GI Chris (Oedo Kuipers) meet each other in Vienna. Their fate is presented with gripping music, an imposing production, extravagant choreography, a set packed with effects, and breathtaking stage technology. The dramatic landing of a helicopter on an open stage is one of the most impressive images of the musical story.'),
(8, 'ImPulsTanz', '2021-07-15 10:00:00', 'Dancing is finally on again! ImPulsTanz – Europe\'s biggest dance festival – once again gathers the international dance and performance scene in Vienna from July 15 to August 15.', 'https://www.wien.info/resource/image/289862/Header/1600/440/ff77d43918846fcd28382ed0556e368/du/2-5-ballettaenzerin-40490.jpg', 2500, 'info@volkstheater.at', '+43 1 52 111 400', 'Volkstheater | Arthur-Schnitzler-Platz 1  1070 Vienna', 'http://www.volkstheater.at', 'Beyond the performances, there are 180 workshops for everyone who wants to do more than just watch. From voguing to Funktastic Jam. Hopes are high for a halfway normal summer. ImPulsTanz has knuckled down and presents a considerable performance program as well as its workshop and research projects. On Vienna\'s many stages and in the city\'s museums, ImPulsTanz 2021 will sparkle with its unique range of activities: highlights of dance history, revivals and premieres can be seen, from large stage shows to intimate formats, from icons to newcomers.  Need a couple of examples? The international star choreographer Meg Stuart is a guest at the freshly renovated Volkstheater with no fewer than two pieces: she brings both her latest work CASCADE and also VIOLET, which was last seen in Vienna ten years ago. Alain Platel celebrates the premiere of a new version of his piece Gardenia.');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
