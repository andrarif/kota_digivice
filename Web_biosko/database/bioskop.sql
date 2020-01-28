-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 28 Jan 2020 pada 16.51
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bioskop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_cutomer` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki - laki','Perempuan') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_cutomer`, `nama`, `jenis_kelamin`, `alamat`, `email`, `no_hp`) VALUES
(1, 'Jhon fake', 'Laki - laki', 'Canada', 'jhon@fake.com', 1987766554),
(2, 'Phil Jhone', 'Laki - laki', 'Canada', 'jhonephil@fake.com', 1980734554),
(3, 'julia', 'Perempuan', 'canada', 'julia@fake.com', 1987766554);

-- --------------------------------------------------------

--
-- Struktur dari tabel `film`
--

CREATE TABLE `film` (
  `id_film` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `judul_film` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `film`
--

INSERT INTO `film` (`id_film`, `id_kategori`, `judul_film`) VALUES
(1, 1, 'fast and farious 7'),
(2, 2, 'KKN di Desa Penari'),
(3, 3, 'Warkop DKI Reborn'),
(4, 4, 'Keluarga Cemara'),
(5, 5, 'Dilan 1990');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `tgl_tayang` date NOT NULL,
  `j_mulai` time NOT NULL,
  `j_berakhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_film`, `tgl_tayang`, `j_mulai`, `j_berakhir`) VALUES
(1, 1, '2020-01-30', '20:00:00', '22:10:00'),
(2, 2, '2020-01-31', '20:00:00', '22:10:00'),
(3, 3, '2020-02-01', '20:00:00', '20:10:00'),
(4, 4, '2020-02-02', '20:00:00', '22:10:00'),
(5, 5, '2020-02-03', '20:00:00', '20:10:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nm_kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nm_kategori`) VALUES
(1, 'Action'),
(2, 'Horor'),
(3, 'Komedi'),
(4, 'Film Keluarga'),
(5, 'Romantis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kursi`
--

CREATE TABLE `kursi` (
  `id_kursi` int(11) NOT NULL,
  `id_studio` int(11) NOT NULL,
  `no_kursi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kursi`
--

INSERT INTO `kursi` (`id_kursi`, `id_studio`, `no_kursi`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `studio`
--

CREATE TABLE `studio` (
  `id_studio` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `nm_studio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `studio`
--

INSERT INTO `studio` (`id_studio`, `id_film`, `nm_studio`) VALUES
(1, 1, 'Studio 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(11) NOT NULL,
  `id_kursi` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `id_kursi`, `harga`) VALUES
(1, 1, 40000),
(2, 2, 40000),
(3, 3, 40000),
(4, 4, 40000),
(5, 5, 40000),
(6, 6, 40000),
(7, 7, 40000),
(8, 8, 40000),
(9, 9, 40000),
(10, 10, 40000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_ transaksi` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_tiket` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `qty` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_ transaksi`, `id_customer`, `id_tiket`, `id_jadwal`, `tgl_transaksi`, `qty`, `total_harga`) VALUES
(1, 1, 1, 1, '2020-01-28', 1, 40000),
(2, 2, 2, 1, '2020-01-28', 1, 40000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_cutomer`);

--
-- Indeks untuk tabel `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_film` (`id_film`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `kursi`
--
ALTER TABLE `kursi`
  ADD PRIMARY KEY (`id_kursi`),
  ADD KEY `id_studio` (`id_studio`);

--
-- Indeks untuk tabel `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`id_studio`),
  ADD KEY `id_film` (`id_film`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `id_kursi` (`id_kursi`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_ transaksi`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_tiket` (`id_tiket`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id_cutomer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kursi`
--
ALTER TABLE `kursi`
  MODIFY `id_kursi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `studio`
--
ALTER TABLE `studio`
  MODIFY `id_studio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_ transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `kursi_ibfk_1` FOREIGN KEY (`id_studio`) REFERENCES `studio` (`id_studio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `studio`
--
ALTER TABLE `studio`
  ADD CONSTRAINT `studio_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`id_kursi`) REFERENCES `kursi` (`id_kursi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_cutomer`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_tiket`) REFERENCES `tiket` (`id_tiket`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
