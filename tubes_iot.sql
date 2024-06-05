-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2024 pada 07.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes_iot`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `moisture_sensor`
--

CREATE TABLE `moisture_sensor` (
  `id` int(4) NOT NULL,
  `moisture` int(4) DEFAULT NULL,
  `pump_status` varchar(5) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `moisture_sensor`
--

INSERT INTO `moisture_sensor` (`id`, `moisture`, `pump_status`, `waktu`) VALUES
(1630, 2782, 'ON', '2024-06-04 23:09:40'),
(1631, 2735, 'ON', '2024-06-04 23:09:42'),
(1632, 2864, 'ON', '2024-06-04 23:09:44'),
(1633, 2726, 'ON', '2024-06-04 23:09:46'),
(1634, 2743, 'ON', '2024-06-04 23:09:48'),
(1635, 2800, 'ON', '2024-06-04 23:09:51'),
(1636, 2718, 'ON', '2024-06-04 23:09:53'),
(1637, 2807, 'ON', '2024-06-04 23:09:55'),
(1638, 2706, 'ON', '2024-06-04 23:09:57'),
(1639, 2755, 'ON', '2024-06-04 23:09:59'),
(1640, 2734, 'ON', '2024-06-04 23:10:01'),
(1641, 2835, 'ON', '2024-06-04 23:10:03'),
(1642, 2803, 'ON', '2024-06-04 23:10:05'),
(1643, 2832, 'ON', '2024-06-04 23:10:07'),
(1644, 2736, 'ON', '2024-06-04 23:10:10'),
(1645, 2752, 'ON', '2024-06-04 23:10:12'),
(1646, 2737, 'ON', '2024-06-04 23:10:14'),
(1647, 1470, 'OFF', '2024-06-04 23:10:16'),
(1648, 1151, 'OFF', '2024-06-04 23:10:18'),
(1649, 2759, 'ON', '2024-06-04 23:10:20'),
(1650, 2671, 'ON', '2024-06-04 23:10:22'),
(1651, 1359, 'OFF', '2024-06-04 23:10:24'),
(1652, 2622, 'ON', '2024-06-04 23:10:27'),
(1653, 2802, 'ON', '2024-06-04 23:10:29'),
(1654, 2715, 'ON', '2024-06-04 23:10:31'),
(1655, 2833, 'ON', '2024-06-04 23:10:33'),
(1656, 2768, 'ON', '2024-06-04 23:10:35'),
(1657, 2693, 'ON', '2024-06-04 23:10:37'),
(1658, 2827, 'ON', '2024-06-04 23:10:39'),
(1659, 2782, 'ON', '2024-06-04 23:10:41'),
(1660, 2791, 'ON', '2024-06-04 23:10:44'),
(1661, 2747, 'ON', '2024-06-04 23:10:46'),
(1662, 2741, 'ON', '2024-06-04 23:10:48'),
(1663, 0, 'OFF', '2024-06-04 23:10:50'),
(1664, 822, 'OFF', '2024-06-04 23:10:52'),
(1665, 783, 'OFF', '2024-06-04 23:10:54'),
(1666, 847, 'OFF', '2024-06-04 23:10:56'),
(1667, 0, 'OFF', '2024-06-04 23:10:59'),
(1668, 1023, 'OFF', '2024-06-04 23:11:01'),
(1669, 352, 'OFF', '2024-06-04 23:11:03'),
(1670, 305, 'OFF', '2024-06-04 23:11:05'),
(1671, 158, 'OFF', '2024-06-04 23:11:07'),
(1672, 701, 'OFF', '2024-06-04 23:11:09'),
(1673, 703, 'OFF', '2024-06-04 23:11:11'),
(1674, 634, 'OFF', '2024-06-04 23:11:14'),
(1675, 135, 'OFF', '2024-06-04 23:11:16'),
(1676, 829, 'OFF', '2024-06-04 23:11:18'),
(1677, 489, 'OFF', '2024-06-04 23:11:20'),
(1678, 705, 'OFF', '2024-06-04 23:11:22'),
(1679, 62, 'OFF', '2024-06-04 23:11:24'),
(1680, 630, 'OFF', '2024-06-04 23:11:26'),
(1681, 801, 'OFF', '2024-06-04 23:11:29'),
(1682, 150, 'OFF', '2024-06-04 23:11:31'),
(1683, 139, 'OFF', '2024-06-04 23:11:33'),
(1684, 914, 'OFF', '2024-06-04 23:11:35'),
(1685, 0, 'OFF', '2024-06-04 23:11:37'),
(1686, 0, 'OFF', '2024-06-04 23:11:39'),
(1687, 688, 'OFF', '2024-06-04 23:11:41'),
(1688, 720, 'OFF', '2024-06-04 23:11:44'),
(1689, 690, 'OFF', '2024-06-04 23:11:46'),
(1690, 687, 'OFF', '2024-06-04 23:11:48'),
(1691, 705, 'OFF', '2024-06-04 23:11:50'),
(1692, 0, 'OFF', '2024-06-04 23:11:52'),
(1693, 30, 'OFF', '2024-06-04 23:11:54'),
(1694, 571, 'OFF', '2024-06-04 23:11:56'),
(1695, 677, 'OFF', '2024-06-04 23:11:58'),
(1696, 0, 'OFF', '2024-06-04 23:12:01'),
(1697, 0, 'OFF', '2024-06-04 23:12:03'),
(1698, 0, 'OFF', '2024-06-04 23:12:05'),
(1699, 0, 'OFF', '2024-06-04 23:12:07'),
(1700, 816, 'OFF', '2024-06-04 23:12:09'),
(1701, 229, 'OFF', '2024-06-04 23:12:11'),
(1702, 941, 'OFF', '2024-06-04 23:12:13'),
(1703, 756, 'OFF', '2024-06-04 23:12:16'),
(1704, 88, 'OFF', '2024-06-04 23:12:18'),
(1705, 523, 'OFF', '2024-06-04 23:12:20'),
(1706, 1775, 'OFF', '2024-06-04 23:12:30'),
(1707, 0, 'OFF', '2024-06-04 23:12:45'),
(1708, 28, 'OFF', '2024-06-04 23:12:47'),
(1709, 588, 'OFF', '2024-06-04 23:12:49'),
(1710, 528, 'OFF', '2024-06-04 23:12:51'),
(1711, 1189, 'OFF', '2024-06-04 23:12:53'),
(1712, 534, 'OFF', '2024-06-04 23:12:56'),
(1713, 112, 'OFF', '2024-06-04 23:12:58'),
(1714, 732, 'OFF', '2024-06-04 23:13:00'),
(1715, 866, 'OFF', '2024-06-04 23:13:02'),
(1716, 775, 'OFF', '2024-06-04 23:13:04'),
(1717, 0, 'OFF', '2024-06-04 23:13:06'),
(1718, 0, 'OFF', '2024-06-04 23:13:08'),
(1719, 1040, 'OFF', '2024-06-04 23:13:11'),
(1720, 768, 'OFF', '2024-06-04 23:13:13'),
(1721, 0, 'OFF', '2024-06-04 23:13:15'),
(1722, 1167, 'OFF', '2024-06-04 23:13:17'),
(1723, 1084, 'OFF', '2024-06-04 23:13:19'),
(1724, 117, 'OFF', '2024-06-04 23:13:22'),
(1725, 0, 'OFF', '2024-06-04 23:13:24'),
(1726, 50, 'OFF', '2024-06-04 23:13:26'),
(1727, 0, 'OFF', '2024-06-04 23:13:28'),
(1728, 0, 'OFF', '2024-06-04 23:13:30'),
(1729, 0, 'OFF', '2024-06-04 23:13:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `realtime`
--

CREATE TABLE `realtime` (
  `id` int(5) NOT NULL,
  `moisture` int(4) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `realtime`
--

INSERT INTO `realtime` (`id`, `moisture`, `waktu`) VALUES
(1, 0, '2024-06-04 23:13:32');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `moisture_sensor`
--
ALTER TABLE `moisture_sensor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `realtime`
--
ALTER TABLE `realtime`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `moisture_sensor`
--
ALTER TABLE `moisture_sensor`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1730;

--
-- AUTO_INCREMENT untuk tabel `realtime`
--
ALTER TABLE `realtime`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;