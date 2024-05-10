-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Maj 2024, 23:04
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `asriders`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `magazyn`
--

CREATE TABLE `magazyn` (
  `id` int(11) NOT NULL,
  `nazwa` text COLLATE utf8mb4_polish_ci NOT NULL,
  `rzad` text COLLATE utf8mb4_polish_ci NOT NULL,
  `paleta` int(5) NOT NULL,
  `produkty` text COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby`
--

CREATE TABLE `osoby` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `haslo` text COLLATE utf8mb4_polish_ci NOT NULL,
  `login` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pojemniki`
--

CREATE TABLE `pojemniki` (
  `id` int(11) NOT NULL,
  `numer` int(5) NOT NULL,
  `rodzaj` int(5) NOT NULL,
  `wysokosc` int(5) NOT NULL,
  `szerokosc` int(5) NOT NULL,
  `dlugosc` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_polish_ci NOT NULL,
  `zdjecie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `miejsce` varchar(5) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `cena` decimal(10,0) NOT NULL,
  `cena_kupna_max` decimal(10,0) NOT NULL,
  `stan` int(10) NOT NULL,
  `stan_palety` int(10) NOT NULL,
  `kolor` text COLLATE utf8mb4_polish_ci NOT NULL,
  `waga` int(5) DEFAULT NULL,
  `dlugosc` int(5) DEFAULT NULL,
  `szerokosc` int(5) DEFAULT NULL,
  `wysokosc` int(5) DEFAULT NULL,
  `ilosc_kupionych` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `regal`
--

CREATE TABLE `regal` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(5) COLLATE utf8mb4_polish_ci NOT NULL,
  `pojemniki` varchar(5) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `kompletujacy` varchar(30) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `aktywny` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statystyki`
--

CREATE TABLE `statystyki` (
  `id` int(11) NOT NULL,
  `pracownik` text COLLATE utf8mb4_polish_ci NOT NULL,
  `kompletacja` int(10) NOT NULL,
  `kompletacja_godziny` int(10) NOT NULL,
  `pakowanie` int(10) NOT NULL,
  `pakowanie_godziny` int(10) NOT NULL,
  `donoszenie` int(10) NOT NULL,
  `donoszenie_godziny` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towar`
--

CREATE TABLE `towar` (
  `id` int(11) NOT NULL,
  `nazwa` text COLLATE utf8mb4_polish_ci NOT NULL,
  `hurtownia` text COLLATE utf8mb4_polish_ci NOT NULL,
  `stan` int(11) NOT NULL,
  `cena` decimal(10,0) NOT NULL,
  `produkty` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamówienia`
--

CREATE TABLE `zamówienia` (
  `id` int(11) NOT NULL,
  `numer` text COLLATE utf8mb4_polish_ci NOT NULL,
  `osoba` text COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `cena` decimal(10,0) NOT NULL,
  `produkty` text COLLATE utf8mb4_polish_ci NOT NULL,
  `forma_platnosci` text COLLATE utf8mb4_polish_ci NOT NULL,
  `data` date NOT NULL,
  `uwagi` text COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zatrudnieni`
--

CREATE TABLE `zatrudnieni` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `haslo` text COLLATE utf8mb4_polish_ci NOT NULL,
  `uprawnienia` int(11) NOT NULL,
  `login` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pojemniki`
--
ALTER TABLE `pojemniki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `regal`
--
ALTER TABLE `regal`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `statystyki`
--
ALTER TABLE `statystyki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `towar`
--
ALTER TABLE `towar`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamówienia`
--
ALTER TABLE `zamówienia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zatrudnieni`
--
ALTER TABLE `zatrudnieni`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `osoby`
--
ALTER TABLE `osoby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pojemniki`
--
ALTER TABLE `pojemniki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `regal`
--
ALTER TABLE `regal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `statystyki`
--
ALTER TABLE `statystyki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `towar`
--
ALTER TABLE `towar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zamówienia`
--
ALTER TABLE `zamówienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zatrudnieni`
--
ALTER TABLE `zatrudnieni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
