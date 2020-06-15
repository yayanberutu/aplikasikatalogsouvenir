/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.1.31-MariaDB : Database - spmb_itdel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`spmb_itdel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `spmb_itdel`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id_admin` varchar(10) NOT NULL,
  `nama_admin` varchar(45) DEFAULT NULL,
  `id_akun` varchar(10) DEFAULT NULL,
  `Akun_username` varchar(25) NOT NULL,
  PRIMARY KEY (`id_admin`,`Akun_username`),
  KEY `fk_Admin_Akun1_idx` (`Akun_username`),
  CONSTRAINT `fk_Admin_Akun1` FOREIGN KEY (`Akun_username`) REFERENCES `akun` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

/*Table structure for table `akun` */

DROP TABLE IF EXISTS `akun`;

CREATE TABLE `akun` (
  `username` varchar(25) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `akun` */

/*Table structure for table `berita` */

DROP TABLE IF EXISTS `berita`;

CREATE TABLE `berita` (
  `id_berita` varchar(10) NOT NULL,
  `isi_berita` text,
  `tanggal_pembuatan` date DEFAULT NULL,
  `tanggal_expired` date DEFAULT NULL,
  `id_pembuat` varchar(45) CHARACTER SET big5 DEFAULT NULL,
  `gambar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_berita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `berita` */

/*Table structure for table `calon_mahasiswa` */

DROP TABLE IF EXISTS `calon_mahasiswa`;

CREATE TABLE `calon_mahasiswa` (
  `id_Akun` varchar(10) NOT NULL,
  `id_cln_mhs` varchar(10) NOT NULL,
  `id_data_pribadi` int(11) DEFAULT NULL,
  `id_data_ortu` int(11) DEFAULT NULL,
  `id_data_akademis` int(11) DEFAULT NULL,
  `id_data_wali` int(11) DEFAULT NULL,
  `Data_Akademis_id` int(11) NOT NULL,
  `Akun_username` varchar(25) NOT NULL,
  `Data_Pribadi_id` int(11) NOT NULL,
  `Data_Wali_id` int(11) NOT NULL,
  `Data_OrangTua_id_data_ortu` int(11) NOT NULL,
  PRIMARY KEY (`id_Akun`,`id_cln_mhs`,`Data_Akademis_id`,`Akun_username`,`Data_Pribadi_id`,`Data_Wali_id`,`Data_OrangTua_id_data_ortu`),
  KEY `fk_Calon_Mahasiswa_Data_Akademis1_idx` (`Data_Akademis_id`),
  KEY `fk_Calon_Mahasiswa_Akun1_idx` (`Akun_username`),
  KEY `fk_Calon_Mahasiswa_Data_Pribadi1_idx` (`Data_Pribadi_id`),
  KEY `fk_Calon_Mahasiswa_Data_Wali1_idx` (`Data_Wali_id`),
  KEY `fk_Calon_Mahasiswa_Data_OrangTua1_idx` (`Data_OrangTua_id_data_ortu`),
  CONSTRAINT `fk_Calon_Mahasiswa_Akun1` FOREIGN KEY (`Akun_username`) REFERENCES `akun` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calon_Mahasiswa_Data_Akademis1` FOREIGN KEY (`Data_Akademis_id`) REFERENCES `data_akademis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calon_Mahasiswa_Data_OrangTua1` FOREIGN KEY (`Data_OrangTua_id_data_ortu`) REFERENCES `data_orangtua` (`id_data_ortu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calon_Mahasiswa_Data_Pribadi1` FOREIGN KEY (`Data_Pribadi_id`) REFERENCES `data_pribadi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calon_Mahasiswa_Data_Wali1` FOREIGN KEY (`Data_Wali_id`) REFERENCES `data_wali` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `calon_mahasiswa` */

/*Table structure for table `calon_mahasiswa_has_survei` */

DROP TABLE IF EXISTS `calon_mahasiswa_has_survei`;

CREATE TABLE `calon_mahasiswa_has_survei` (
  `Calon_Mahasiswa_id_Akun` varchar(10) NOT NULL,
  `Calon_Mahasiswa_id_cln_mhs` varchar(10) NOT NULL,
  `Calon_Mahasiswa_Data_Akademis_id` int(11) NOT NULL,
  `Calon_Mahasiswa_Akun_username` varchar(25) NOT NULL,
  `Calon_Mahasiswa_Data_Pribadi_id` int(11) NOT NULL,
  `Calon_Mahasiswa_Data_Wali_id` int(11) NOT NULL,
  `Calon_Mahasiswa_Data_OrangTua_id_data_ortu` int(11) NOT NULL,
  `survei_id_survei` varchar(10) NOT NULL,
  `survei_Admin_id_admin` varchar(10) NOT NULL,
  `survei_Admin_Akun_username` varchar(25) NOT NULL,
  PRIMARY KEY (`Calon_Mahasiswa_id_Akun`,`Calon_Mahasiswa_id_cln_mhs`,`Calon_Mahasiswa_Data_Akademis_id`,`Calon_Mahasiswa_Akun_username`,`Calon_Mahasiswa_Data_Pribadi_id`,`Calon_Mahasiswa_Data_Wali_id`,`Calon_Mahasiswa_Data_OrangTua_id_data_ortu`,`survei_id_survei`,`survei_Admin_id_admin`,`survei_Admin_Akun_username`),
  KEY `fk_Calon_Mahasiswa_has_survei_survei1_idx` (`survei_id_survei`,`survei_Admin_id_admin`,`survei_Admin_Akun_username`),
  KEY `fk_Calon_Mahasiswa_has_survei_Calon_Mahasiswa1_idx` (`Calon_Mahasiswa_id_Akun`,`Calon_Mahasiswa_id_cln_mhs`,`Calon_Mahasiswa_Data_Akademis_id`,`Calon_Mahasiswa_Akun_username`,`Calon_Mahasiswa_Data_Pribadi_id`,`Calon_Mahasiswa_Data_Wali_id`,`Calon_Mahasiswa_Data_OrangTua_id_data_ortu`),
  CONSTRAINT `fk_Calon_Mahasiswa_has_survei_Calon_Mahasiswa1` FOREIGN KEY (`Calon_Mahasiswa_id_Akun`, `Calon_Mahasiswa_id_cln_mhs`, `Calon_Mahasiswa_Data_Akademis_id`, `Calon_Mahasiswa_Akun_username`, `Calon_Mahasiswa_Data_Pribadi_id`, `Calon_Mahasiswa_Data_Wali_id`, `Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) REFERENCES `calon_mahasiswa` (`id_Akun`, `id_cln_mhs`, `Data_Akademis_id`, `Akun_username`, `Data_Pribadi_id`, `Data_Wali_id`, `Data_OrangTua_id_data_ortu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calon_Mahasiswa_has_survei_survei1` FOREIGN KEY (`survei_id_survei`, `survei_Admin_id_admin`, `survei_Admin_Akun_username`) REFERENCES `survei` (`id_survei`, `Admin_id_admin`, `Admin_Akun_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `calon_mahasiswa_has_survei` */

/*Table structure for table `data_akademis` */

DROP TABLE IF EXISTS `data_akademis`;

CREATE TABLE `data_akademis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sekolah` varchar(10) DEFAULT NULL,
  `jurusan` varchar(25) DEFAULT NULL,
  `tahun_lulus` char(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `data_akademis` */

/*Table structure for table `data_orangtua` */

DROP TABLE IF EXISTS `data_orangtua`;

CREATE TABLE `data_orangtua` (
  `id_data_ortu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_ayah` varchar(45) DEFAULT NULL,
  `nama_ibu` varchar(45) DEFAULT NULL,
  `Alamat` varchar(45) DEFAULT NULL,
  `Kode_Pos` varchar(45) DEFAULT NULL,
  `No_HP_Ayah` varchar(45) DEFAULT NULL,
  `No_HP_Ibu` varchar(45) DEFAULT NULL,
  `Pekerjaan_Ayah` varchar(45) DEFAULT NULL,
  `Keterangan_pekerjaan_ayah` varchar(45) DEFAULT NULL,
  `Pekerjaan_Ibu` varchar(45) DEFAULT NULL,
  `Keterangan_pekerjaan_ibu` varchar(45) DEFAULT NULL,
  `Penghasilan_ayah` double DEFAULT NULL,
  `Penghasilan_ibu` double DEFAULT NULL,
  `table1col` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_data_ortu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `data_orangtua` */

/*Table structure for table `data_pribadi` */

DROP TABLE IF EXISTS `data_pribadi`;

CREATE TABLE `data_pribadi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) DEFAULT NULL,
  `Jenis Kelamin` char(1) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Tempat_Lahir` varchar(45) DEFAULT NULL,
  `Golongan_Darah` char(2) DEFAULT NULL,
  `Agama` varchar(45) DEFAULT NULL,
  `Anak_ke` int(11) DEFAULT NULL,
  `jlh_saudara` int(11) DEFAULT NULL,
  `jlh_tanggungan_ortu` int(11) DEFAULT NULL,
  `Alamat` varchar(45) DEFAULT NULL,
  `Kode_Pos` char(5) DEFAULT NULL,
  `no_telepon` varchar(45) DEFAULT NULL,
  `no_hp` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `data_pribadi` */

/*Table structure for table `data_wali` */

DROP TABLE IF EXISTS `data_wali`;

CREATE TABLE `data_wali` (
  `id` int(11) NOT NULL,
  `Nama_Wali` varchar(45) DEFAULT NULL,
  `Pekerjaan_Wali` varchar(45) DEFAULT NULL,
  `Keterangan` varchar(45) DEFAULT NULL,
  `Penghasilan` double DEFAULT NULL,
  `Data_Walicol` varchar(45) CHARACTER SET big5 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `data_wali` */

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_pendaftaran` varchar(45) DEFAULT NULL,
  `tanggal_pendaftaran` varchar(45) DEFAULT NULL,
  `status_verifikasi` int(11) DEFAULT NULL,
  `id_verifikator` varchar(10) DEFAULT NULL,
  `pendaftaran_no_pendaftaran` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_id_Akun` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_id_cln_mhs` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Akademis_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Akun_username` varchar(25) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Pribadi_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Wali_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu` int(11) NOT NULL,
  `Admin_id_admin` varchar(10) NOT NULL,
  `Admin_Akun_username` varchar(25) NOT NULL,
  PRIMARY KEY (`id_pembayaran`,`pendaftaran_no_pendaftaran`,`pendaftaran_Calon_Mahasiswa_id_Akun`,`pendaftaran_Calon_Mahasiswa_id_cln_mhs`,`pendaftaran_Calon_Mahasiswa_Data_Akademis_id`,`pendaftaran_Calon_Mahasiswa_Akun_username`,`pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`,`pendaftaran_Calon_Mahasiswa_Data_Wali_id`,`pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`,`Admin_id_admin`,`Admin_Akun_username`),
  KEY `fk_pembayaran_pendaftaran1_idx` (`pendaftaran_no_pendaftaran`,`pendaftaran_Calon_Mahasiswa_id_Akun`,`pendaftaran_Calon_Mahasiswa_id_cln_mhs`,`pendaftaran_Calon_Mahasiswa_Data_Akademis_id`,`pendaftaran_Calon_Mahasiswa_Akun_username`,`pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`,`pendaftaran_Calon_Mahasiswa_Data_Wali_id`,`pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`),
  KEY `fk_pembayaran_Admin1_idx` (`Admin_id_admin`,`Admin_Akun_username`),
  CONSTRAINT `fk_pembayaran_Admin1` FOREIGN KEY (`Admin_id_admin`, `Admin_Akun_username`) REFERENCES `admin` (`id_admin`, `Akun_username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pembayaran_pendaftaran1` FOREIGN KEY (`pendaftaran_no_pendaftaran`, `pendaftaran_Calon_Mahasiswa_id_Akun`, `pendaftaran_Calon_Mahasiswa_id_cln_mhs`, `pendaftaran_Calon_Mahasiswa_Data_Akademis_id`, `pendaftaran_Calon_Mahasiswa_Akun_username`, `pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`, `pendaftaran_Calon_Mahasiswa_Data_Wali_id`, `pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) REFERENCES `pendaftaran` (`no_pendaftaran`, `Calon_Mahasiswa_id_Akun`, `Calon_Mahasiswa_id_cln_mhs`, `Calon_Mahasiswa_Data_Akademis_id`, `Calon_Mahasiswa_Akun_username`, `Calon_Mahasiswa_Data_Pribadi_id`, `Calon_Mahasiswa_Data_Wali_id`, `Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pembayaran` */

/*Table structure for table `pendaftaran` */

DROP TABLE IF EXISTS `pendaftaran`;

CREATE TABLE `pendaftaran` (
  `no_pendaftaran` varchar(10) NOT NULL,
  `id_pilihan1_prodi` varchar(10) DEFAULT NULL,
  `id_pilihan2_prodi` varchar(10) DEFAULT NULL,
  `tanggal_pendaftaran` datetime DEFAULT NULL,
  `id_cln_mahasiswa` varchar(10) DEFAULT NULL,
  `id_jalur_usm` varchar(10) DEFAULT NULL,
  `Calon_Mahasiswa_id_Akun` varchar(10) NOT NULL,
  `Calon_Mahasiswa_id_cln_mhs` varchar(10) NOT NULL,
  `Calon_Mahasiswa_Data_Akademis_id` int(11) NOT NULL,
  `Calon_Mahasiswa_Akun_username` varchar(25) NOT NULL,
  `Calon_Mahasiswa_Data_Pribadi_id` int(11) NOT NULL,
  `Calon_Mahasiswa_Data_Wali_id` int(11) NOT NULL,
  `Calon_Mahasiswa_Data_OrangTua_id_data_ortu` int(11) NOT NULL,
  `status_kelulusan` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_pendaftaran`,`Calon_Mahasiswa_id_Akun`,`Calon_Mahasiswa_id_cln_mhs`,`Calon_Mahasiswa_Data_Akademis_id`,`Calon_Mahasiswa_Akun_username`,`Calon_Mahasiswa_Data_Pribadi_id`,`Calon_Mahasiswa_Data_Wali_id`,`Calon_Mahasiswa_Data_OrangTua_id_data_ortu`),
  KEY `fk_pendaftaran_Calon_Mahasiswa1_idx` (`Calon_Mahasiswa_id_Akun`,`Calon_Mahasiswa_id_cln_mhs`,`Calon_Mahasiswa_Data_Akademis_id`,`Calon_Mahasiswa_Akun_username`,`Calon_Mahasiswa_Data_Pribadi_id`,`Calon_Mahasiswa_Data_Wali_id`,`Calon_Mahasiswa_Data_OrangTua_id_data_ortu`),
  CONSTRAINT `fk_pendaftaran_Calon_Mahasiswa1` FOREIGN KEY (`Calon_Mahasiswa_id_Akun`, `Calon_Mahasiswa_id_cln_mhs`, `Calon_Mahasiswa_Data_Akademis_id`, `Calon_Mahasiswa_Akun_username`, `Calon_Mahasiswa_Data_Pribadi_id`, `Calon_Mahasiswa_Data_Wali_id`, `Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) REFERENCES `calon_mahasiswa` (`id_Akun`, `id_cln_mhs`, `Data_Akademis_id`, `Akun_username`, `Data_Pribadi_id`, `Data_Wali_id`, `Data_OrangTua_id_data_ortu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pendaftaran` */

/*Table structure for table `pendaftaran_has_usm` */

DROP TABLE IF EXISTS `pendaftaran_has_usm`;

CREATE TABLE `pendaftaran_has_usm` (
  `pendaftaran_no_pendaftaran` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_id_Akun` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_id_cln_mhs` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Akademis_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Akun_username` varchar(25) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Pribadi_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Wali_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu` int(11) NOT NULL,
  `USM_id` int(11) NOT NULL,
  PRIMARY KEY (`pendaftaran_no_pendaftaran`,`pendaftaran_Calon_Mahasiswa_id_Akun`,`pendaftaran_Calon_Mahasiswa_id_cln_mhs`,`pendaftaran_Calon_Mahasiswa_Data_Akademis_id`,`pendaftaran_Calon_Mahasiswa_Akun_username`,`pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`,`pendaftaran_Calon_Mahasiswa_Data_Wali_id`,`pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`,`USM_id`),
  KEY `fk_pendaftaran_has_USM_USM1_idx` (`USM_id`),
  KEY `fk_pendaftaran_has_USM_pendaftaran1_idx` (`pendaftaran_no_pendaftaran`,`pendaftaran_Calon_Mahasiswa_id_Akun`,`pendaftaran_Calon_Mahasiswa_id_cln_mhs`,`pendaftaran_Calon_Mahasiswa_Data_Akademis_id`,`pendaftaran_Calon_Mahasiswa_Akun_username`,`pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`,`pendaftaran_Calon_Mahasiswa_Data_Wali_id`,`pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`),
  CONSTRAINT `fk_pendaftaran_has_USM_USM1` FOREIGN KEY (`USM_id`) REFERENCES `usm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pendaftaran_has_USM_pendaftaran1` FOREIGN KEY (`pendaftaran_no_pendaftaran`, `pendaftaran_Calon_Mahasiswa_id_Akun`, `pendaftaran_Calon_Mahasiswa_id_cln_mhs`, `pendaftaran_Calon_Mahasiswa_Data_Akademis_id`, `pendaftaran_Calon_Mahasiswa_Akun_username`, `pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`, `pendaftaran_Calon_Mahasiswa_Data_Wali_id`, `pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) REFERENCES `pendaftaran` (`no_pendaftaran`, `Calon_Mahasiswa_id_Akun`, `Calon_Mahasiswa_id_cln_mhs`, `Calon_Mahasiswa_Data_Akademis_id`, `Calon_Mahasiswa_Akun_username`, `Calon_Mahasiswa_Data_Pribadi_id`, `Calon_Mahasiswa_Data_Wali_id`, `Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pendaftaran_has_usm` */

/*Table structure for table `pendaftaran_ulang` */

DROP TABLE IF EXISTS `pendaftaran_ulang`;

CREATE TABLE `pendaftaran_ulang` (
  `id_daful` varchar(10) NOT NULL,
  `id_pendaftaran` varchar(10) DEFAULT NULL,
  `id_prodi` varchar(45) DEFAULT NULL,
  `uang_pembangunan` double DEFAULT NULL,
  `pendaftaran_no_pendaftaran` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_id_Akun` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_id_cln_mhs` varchar(10) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Akademis_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Akun_username` varchar(25) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Pribadi_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_Wali_id` int(11) NOT NULL,
  `pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu` int(11) NOT NULL,
  PRIMARY KEY (`id_daful`,`pendaftaran_no_pendaftaran`,`pendaftaran_Calon_Mahasiswa_id_Akun`,`pendaftaran_Calon_Mahasiswa_id_cln_mhs`,`pendaftaran_Calon_Mahasiswa_Data_Akademis_id`,`pendaftaran_Calon_Mahasiswa_Akun_username`,`pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`,`pendaftaran_Calon_Mahasiswa_Data_Wali_id`,`pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`),
  KEY `fk_pendaftaran_ulang_pendaftaran1_idx` (`pendaftaran_no_pendaftaran`,`pendaftaran_Calon_Mahasiswa_id_Akun`,`pendaftaran_Calon_Mahasiswa_id_cln_mhs`,`pendaftaran_Calon_Mahasiswa_Data_Akademis_id`,`pendaftaran_Calon_Mahasiswa_Akun_username`,`pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`,`pendaftaran_Calon_Mahasiswa_Data_Wali_id`,`pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`),
  CONSTRAINT `fk_pendaftaran_ulang_pendaftaran1` FOREIGN KEY (`pendaftaran_no_pendaftaran`, `pendaftaran_Calon_Mahasiswa_id_Akun`, `pendaftaran_Calon_Mahasiswa_id_cln_mhs`, `pendaftaran_Calon_Mahasiswa_Data_Akademis_id`, `pendaftaran_Calon_Mahasiswa_Akun_username`, `pendaftaran_Calon_Mahasiswa_Data_Pribadi_id`, `pendaftaran_Calon_Mahasiswa_Data_Wali_id`, `pendaftaran_Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) REFERENCES `pendaftaran` (`no_pendaftaran`, `Calon_Mahasiswa_id_Akun`, `Calon_Mahasiswa_id_cln_mhs`, `Calon_Mahasiswa_Data_Akademis_id`, `Calon_Mahasiswa_Akun_username`, `Calon_Mahasiswa_Data_Pribadi_id`, `Calon_Mahasiswa_Data_Wali_id`, `Calon_Mahasiswa_Data_OrangTua_id_data_ortu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pendaftaran_ulang` */

/*Table structure for table `pengumuman` */

DROP TABLE IF EXISTS `pengumuman`;

CREATE TABLE `pengumuman` (
  `id_Pengumuman` varchar(10) NOT NULL,
  `id_pembuat` varchar(45) DEFAULT NULL,
  `tanggal_pembuatan` datetime DEFAULT NULL,
  `tanggal_expired` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `Admin_id_admin` varchar(10) NOT NULL,
  `Admin_Akun_username` varchar(25) NOT NULL,
  PRIMARY KEY (`id_Pengumuman`,`Admin_id_admin`,`Admin_Akun_username`),
  KEY `fk_Pengumuman_Admin1_idx` (`Admin_id_admin`,`Admin_Akun_username`),
  CONSTRAINT `fk_Pengumuman_Admin1` FOREIGN KEY (`Admin_id_admin`, `Admin_Akun_username`) REFERENCES `admin` (`id_admin`, `Akun_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pengumuman` */

/*Table structure for table `pertanyaan` */

DROP TABLE IF EXISTS `pertanyaan`;

CREATE TABLE `pertanyaan` (
  `id_pertanyaan` varchar(10) NOT NULL,
  `pertanyaan` varchar(100) DEFAULT NULL,
  `jawaban` varchar(100) DEFAULT NULL,
  `id_survei` varchar(10) DEFAULT NULL,
  `survei_id_survei` varchar(10) NOT NULL,
  `survei_Admin_id_admin` varchar(10) NOT NULL,
  `survei_Admin_Akun_username` varchar(25) NOT NULL,
  PRIMARY KEY (`id_pertanyaan`,`survei_id_survei`,`survei_Admin_id_admin`,`survei_Admin_Akun_username`),
  KEY `fk_pertanyaan_survei1_idx` (`survei_id_survei`,`survei_Admin_id_admin`,`survei_Admin_Akun_username`),
  CONSTRAINT `fk_pertanyaan_survei1` FOREIGN KEY (`survei_id_survei`, `survei_Admin_id_admin`, `survei_Admin_Akun_username`) REFERENCES `survei` (`id_survei`, `Admin_id_admin`, `Admin_Akun_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pertanyaan` */

/*Table structure for table `survei` */

DROP TABLE IF EXISTS `survei`;

CREATE TABLE `survei` (
  `id_survei` varchar(10) NOT NULL,
  `id_admin` varchar(10) DEFAULT NULL,
  `tanggal_pembuatan` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `status_expired` int(11) DEFAULT NULL,
  `tanggal_expired` datetime DEFAULT NULL,
  `Admin_id_admin` varchar(10) NOT NULL,
  `Admin_Akun_username` varchar(25) NOT NULL,
  PRIMARY KEY (`id_survei`,`Admin_id_admin`,`Admin_Akun_username`),
  KEY `fk_survei_Admin1_idx` (`Admin_id_admin`,`Admin_Akun_username`),
  CONSTRAINT `fk_survei_Admin1` FOREIGN KEY (`Admin_id_admin`, `Admin_Akun_username`) REFERENCES `admin` (`id_admin`, `Akun_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `survei` */

/*Table structure for table `usm` */

DROP TABLE IF EXISTS `usm`;

CREATE TABLE `usm` (
  `id` int(11) NOT NULL,
  `nama_jalur` varchar(45) DEFAULT NULL,
  `tgl_pendaftaran_start` date DEFAULT NULL,
  `tgl_pendaftaran_end` date DEFAULT NULL,
  `tgl_pengumuman` date DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usm` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
