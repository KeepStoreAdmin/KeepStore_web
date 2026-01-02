/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.42 : Database - taikun
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taikun` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `taikun`;

/*Table structure for table `_buoni_sconti` */

DROP TABLE IF EXISTS `_buoni_sconti`;

CREATE TABLE `_buoni_sconti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DataCreazione` date DEFAULT NULL,
  `idAzienda` int DEFAULT '0',
  `buonoSconto` varchar(20) DEFAULT '',
  `scontoFisso` int DEFAULT '0',
  `scontoPercentuale` int DEFAULT '0',
  `scontoVettore` int DEFAULT '0',
  `valore` double(15,3) DEFAULT '0.000',
  `sogliaPrezzo` double(15,3) DEFAULT '0.000',
  `descrizione1` varchar(200) DEFAULT '',
  `descrizione2` varchar(200) DEFAULT '',
  `dataInizio` date DEFAULT NULL,
  `dataFine` date DEFAULT NULL,
  `img` varchar(200) DEFAULT '',
  `UtilizzaSoloUnaVolta` int DEFAULT '0',
  `ListaUtentiId` varchar(500) DEFAULT NULL,
  `ListaListini` varchar(100) DEFAULT NULL,
  `sSQl` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `_documentitrasformati` */

DROP TABLE IF EXISTS `_documentitrasformati`;

CREATE TABLE `_documentitrasformati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocOrigineId` int DEFAULT '0',
  `TipoDocDestinazione` int DEFAULT '0',
  `DocDestinazioneId` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `_vofferte` */

DROP TABLE IF EXISTS `_vofferte`;

CREATE TABLE `_vofferte` (
  `id` int DEFAULT '0',
  `AziendeId` int DEFAULT '0',
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataInizio` date DEFAULT NULL,
  `DataFine` date DEFAULT NULL,
  `DaListino` int DEFAULT '0',
  `AListino` int DEFAULT '0',
  `RagioneSociale` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `QntMinima` double(15,3) DEFAULT '0.000',
  `Multipli` int DEFAULT '0',
  `Prezzo` double(15,3) DEFAULT '0.000',
  `Sconto` double(15,3) DEFAULT '0.000',
  `Abilitato` int DEFAULT '0',
  KEY `DataInizio` (`DataInizio`,`DataFine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `_voffertedettagli` */

DROP TABLE IF EXISTS `_voffertedettagli`;

CREATE TABLE `_voffertedettagli` (
  `id` int DEFAULT '0',
  `MarcheId` int DEFAULT '0',
  `SettoriId` int DEFAULT '0',
  `CategorieId` int DEFAULT '0',
  `TipologieId` int DEFAULT '0',
  `GruppiId` int DEFAULT '0',
  `SottoGruppiId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `OfferteId` int DEFAULT '0',
  `AziendeId` int DEFAULT '0',
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataInizio` date DEFAULT NULL,
  `DataFine` date DEFAULT NULL,
  `DaListino` int DEFAULT '0',
  `AListino` int DEFAULT '0',
  `UtentiId` int DEFAULT '0',
  `QntMinima` double(15,3) DEFAULT '0.000',
  `Multipli` int DEFAULT '0',
  `Prezzo` double(15,3) DEFAULT '0.000',
  `Sconto` double(15,3) DEFAULT '0.000',
  `Abilitato` int DEFAULT '0',
  KEY `MarcheId` (`MarcheId`),
  KEY `SettoriId` (`SettoriId`),
  KEY `CategorieId` (`CategorieId`),
  KEY `TipologieId` (`TipologieId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `accessi` */

DROP TABLE IF EXISTS `accessi`;

CREATE TABLE `accessi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `UtentiId` int DEFAULT '0',
  `Pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`Pwd`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `acconti` */

DROP TABLE IF EXISTS `acconti`;

CREATE TABLE `acconti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PntesteId` int DEFAULT NULL,
  `Importo` double(15,5) DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataAcconto` date DEFAULT NULL,
  `AccontiId` int DEFAULT NULL,
  `ScadenziarioId` int DEFAULT NULL,
  `Prelevato` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=latin1;

/*Table structure for table `agentiprovvigioni` */

DROP TABLE IF EXISTS `agentiprovvigioni`;

CREATE TABLE `agentiprovvigioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtenteId` int DEFAULT '0',
  `SubAgenteId` int DEFAULT '0',
  `Provvigione` double(10,3) DEFAULT '0.000',
  `ArtProvv1` int DEFAULT '0',
  `ArtProvv2` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `agentiprovvigionivariazioni` */

DROP TABLE IF EXISTS `agentiprovvigionivariazioni`;

CREATE TABLE `agentiprovvigionivariazioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AgentiId` int DEFAULT NULL,
  `ClientiId` int DEFAULT NULL,
  `ArticoliId` int DEFAULT NULL,
  `Provvigione` double(15,3) DEFAULT NULL,
  `Dal` date DEFAULT NULL,
  `Al` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `aggiornamentodb` */

DROP TABLE IF EXISTS `aggiornamentodb`;

CREATE TABLE `aggiornamentodb` (
  `UltimoAggiornamento` datetime NOT NULL,
  PRIMARY KEY (`UltimoAggiornamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `anteprimehtml` */

DROP TABLE IF EXISTS `anteprimehtml`;

CREATE TABLE `anteprimehtml` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tabella` varchar(50) DEFAULT NULL,
  `Vista` varchar(50) DEFAULT NULL,
  `TestoHtml` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `articoli` */

DROP TABLE IF EXISTS `articoli`;

CREATE TABLE `articoli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Codice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ean` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DescrizioneLunga` longtext CHARACTER SET latin1,
  `DescrizioneHTML` longtext CHARACTER SET latin1,
  `isHtml` int DEFAULT '0',
  `MarcheId` int DEFAULT '0',
  `SettoriId` int DEFAULT '0',
  `CategorieId` int DEFAULT '0',
  `TipologieId` int DEFAULT '0',
  `GruppiId` int DEFAULT '0',
  `SottoGruppiId` int DEFAULT '0',
  `iva` int DEFAULT '27',
  `UmId` int DEFAULT '0',
  `Peso` double(15,3) DEFAULT '0.000',
  `PrezzoAcquisto` double(15,8) DEFAULT '0.00000000',
  `ListinoUfficiale` double(15,8) DEFAULT '0.00000000',
  `Img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Img3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Img4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `LinkProduttore` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Brochure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Vetrina` int DEFAULT '1',
  `NormeGaranzia` text COLLATE utf8mb4_vi_0900_ai_ci,
  `Mesi` int DEFAULT '0',
  `Garanzia` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataCreazione` date DEFAULT NULL,
  `Fornitore1` int DEFAULT '0',
  `Fornitore2` int DEFAULT '0',
  `Visite` int DEFAULT '0',
  `NoPromo` int DEFAULT '0' COMMENT 'Se 1 non si applicano le promozioni',
  `Export` int DEFAULT '1' COMMENT '0=Non Esporta ; 1=Esporta',
  `SpedizioneGratis_Listini` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SpedizioneGratis_Data_Inizio` date DEFAULT NULL,
  `SpedizioneGratis_Data_Fine` date DEFAULT NULL,
  `IdIvaReverseCharge` int DEFAULT '-1',
  `Ricondizionato` int DEFAULT '0',
  `IvaAcq` int DEFAULT '35',
  `ContoAcq` int DEFAULT '503',
  `ContoVend` int DEFAULT '436',
  `Asin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NoteRicondizionato` longtext CHARACTER SET latin1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `Codice` (`Codice`),
  UNIQUE KEY `Ean` (`Ean`),
  KEY `MarcheId` (`MarcheId`),
  KEY `SettoriId` (`SettoriId`),
  KEY `CategorieId` (`CategorieId`),
  KEY `TipologieId` (`TipologieId`),
  KEY `GruppiId` (`GruppiId`),
  KEY `SottogruppiId` (`SottoGruppiId`)
) ENGINE=InnoDB AUTO_INCREMENT=21701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_ai_ci;

/*Table structure for table `articoli_arrivi` */

DROP TABLE IF EXISTS `articoli_arrivi`;

CREATE TABLE `articoli_arrivi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int NOT NULL DEFAULT '0',
  `TCid` int DEFAULT NULL,
  `FornitoriId` int NOT NULL DEFAULT '0',
  `DocumentiId` int DEFAULT NULL,
  `Arrivi` double(15,5) DEFAULT '0.00000',
  `DataArrivo` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `idx_ArticoliId` (`ArticoliId`),
  KEY `cosDocumenti` (`DocumentiId`),
  CONSTRAINT `cosDocumenti` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_collegati` */

DROP TABLE IF EXISTS `articoli_collegati`;

CREATE TABLE `articoli_collegati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int NOT NULL DEFAULT '0',
  `ArticoliCollegatiId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ArticoliId` (`ArticoliId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_comparatori` */

DROP TABLE IF EXISTS `articoli_comparatori`;

CREATE TABLE `articoli_comparatori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int DEFAULT '0',
  `Comparatore` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Visite` int DEFAULT '0',
  `DataOra` datetime DEFAULT NULL,
  `Ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ArticoliId` (`ArticoliId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_compatibili` */

DROP TABLE IF EXISTS `articoli_compatibili`;

CREATE TABLE `articoli_compatibili` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int NOT NULL DEFAULT '0',
  `ArticoliCompatibiliId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ArticoliId` (`ArticoliId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_correlati` */

DROP TABLE IF EXISTS `articoli_correlati`;

CREATE TABLE `articoli_correlati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoloPadreId` int DEFAULT '0',
  `MarcheId` int DEFAULT '0',
  `SettoriId` int DEFAULT '0',
  `CategorieId` int DEFAULT '0',
  `TipologieId` int DEFAULT '0',
  `GruppiId` int DEFAULT '0',
  `SottogruppiId` int DEFAULT '0',
  `ArticoloFiglioId` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ArticoloPadreId` (`ArticoloPadreId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_distinta` */

DROP TABLE IF EXISTS `articoli_distinta`;

CREATE TABLE `articoli_distinta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pArticoliId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `Qnt` double(15,3) DEFAULT '0.000',
  `DataOperazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_pArticoliId` (`pArticoliId`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `articoli_giacenze` */

DROP TABLE IF EXISTS `articoli_giacenze`;

CREATE TABLE `articoli_giacenze` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MagazziniId` int NOT NULL DEFAULT '0',
  `ArticoliId` int NOT NULL DEFAULT '0',
  `Giacenza` double(15,5) NOT NULL DEFAULT '0.00000',
  `InOrdine` double(15,5) DEFAULT '0.00000',
  `Disponibilita` double(15,5) DEFAULT '0.00000',
  `Impegnata` double(15,5) DEFAULT '0.00000',
  `ScortaMinima` double(15,5) DEFAULT '0.00000',
  `TCid` int DEFAULT '-1' COMMENT 'Id della taglia e del colore',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxTC` (`MagazziniId`,`ArticoliId`,`TCid`),
  KEY `id` (`id`),
  KEY `ArticoloId` (`ArticoliId`),
  KEY `idx_ArticoliId` (`ArticoliId`)
) ENGINE=InnoDB AUTO_INCREMENT=34149 DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_inventariati` */

DROP TABLE IF EXISTS `articoli_inventariati`;

CREATE TABLE `articoli_inventariati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int NOT NULL,
  `DataInventario` date DEFAULT NULL,
  `Sede` double(15,3) DEFAULT NULL,
  `Deposito` double(15,3) DEFAULT NULL,
  `Somma` double(15,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Articolo` (`ArticoliId`),
  CONSTRAINT `IdARticolo` FOREIGN KEY (`ArticoliId`) REFERENCES `articoli` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6168 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `articoli_listini` */

DROP TABLE IF EXISTS `articoli_listini`;

CREATE TABLE `articoli_listini` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int NOT NULL DEFAULT '0',
  `NListino` int DEFAULT '0',
  `PrezzoAcquisto` double(15,8) DEFAULT '0.00000000',
  `Ricarico` double(15,8) DEFAULT '0.00000000',
  `PrezzoVendita` double(15,8) DEFAULT '0.00000000',
  `sconto1` double(15,8) DEFAULT '0.00000000',
  `sconto2` double(15,8) DEFAULT '0.00000000',
  `iva` int DEFAULT '0',
  `Prezzo` double(15,8) DEFAULT '0.00000000',
  `PrezzoIvato` double(15,8) DEFAULT '0.00000000',
  `PrezzoRC` double(15,8) DEFAULT '0.00000000',
  `TCid` int DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxArticoloListino` (`ArticoliId`,`NListino`),
  KEY `id` (`id`),
  KEY `ArticoloId` (`ArticoliId`),
  KEY `NListino` (`NListino`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=271474 DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_listini_descrizione` */

DROP TABLE IF EXISTS `articoli_listini_descrizione`;

CREATE TABLE `articoli_listini_descrizione` (
  `NListino` int NOT NULL,
  `Descrizione` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AziendeId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`NListino`),
  KEY `idx_AziendeId` (`AziendeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_padcom` */

DROP TABLE IF EXISTS `articoli_padcom`;

CREATE TABLE `articoli_padcom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `articoliid` int DEFAULT '0',
  `Tipo` char(1) DEFAULT 'C',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16626 DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_provvigioni` */

DROP TABLE IF EXISTS `articoli_provvigioni`;

CREATE TABLE `articoli_provvigioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int NOT NULL,
  `Provvigione1` double(15,5) DEFAULT '0.00000',
  `Provvigione2` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `ArticoliId` (`ArticoliId`),
  CONSTRAINT `articoli_provvigioni_ibfk_1` FOREIGN KEY (`ArticoliId`) REFERENCES `articoli` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13662 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `articoli_seriali` */

DROP TABLE IF EXISTS `articoli_seriali`;

CREATE TABLE `articoli_seriali` (
  `ArticoliId` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `Seriale` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`ArticoliId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_tag` */

DROP TABLE IF EXISTS `articoli_tag`;

CREATE TABLE `articoli_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '0',
  `Tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CategorieId` int DEFAULT '0',
  `TipologieId` int DEFAULT '0',
  `GruppiId` int DEFAULT '0',
  `SottoGruppiId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idxTag` (`Tag`),
  KEY `idxCategoria` (`CategorieId`),
  KEY `idxTipologia` (`TipologieId`),
  KEY `idxGruppo` (`GruppiId`),
  KEY `idxSottoGruppo` (`SottoGruppiId`),
  KEY `idxArticolo` (`ArticoliId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `articoli_tagliecolori` */

DROP TABLE IF EXISTS `articoli_tagliecolori`;

CREATE TABLE `articoli_tagliecolori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ArticoliId` int DEFAULT NULL,
  `TagliaId` int DEFAULT NULL,
  `ColoreId` int DEFAULT NULL,
  `Barcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `immaginiId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxT&G` (`ArticoliId`,`TagliaId`,`ColoreId`),
  UNIQUE KEY `idxBarcode` (`Barcode`),
  CONSTRAINT `articoli_tagliecolori_ibfk_1` FOREIGN KEY (`ArticoliId`) REFERENCES `articoli` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `aziende` */

DROP TABLE IF EXISTS `aziende`;

CREATE TABLE `aziende` (
  `id` int NOT NULL AUTO_INCREMENT,
  `RagioneSociale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CognomeNome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Indirizzo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Citta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Provincia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cap` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Piva` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CodiceFiscale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Fax` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `URL1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `URL2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Iban` varchar(27) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `LogoWeb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Listini` int DEFAULT '1' COMMENT 'Numero di listini gestiti',
  `ListinoDefault` int DEFAULT '1' COMMENT 'Listino per utenti non registrati',
  `ListinoUser` int DEFAULT '1' COMMENT 'Listino di partenza per utenti registrati',
  `CanOrder` int DEFAULT '1' COMMENT 'Se gli utenti che si registrano, possono compraare subito',
  `MagazzinoDefault` int DEFAULT '1' COMMENT 'Magazzino di default nuovi utenti',
  `IvaTipo` int NOT NULL DEFAULT '1' COMMENT '1=senza iva - 2=con iva',
  `DispoTipo` int DEFAULT '1' COMMENT '1=pallini - 2=numeri',
  `DispoMinima` int DEFAULT '10' COMMENT 'Soglia tra disponibile e scarso',
  `ScadenzaPassword` int DEFAULT '3' COMMENT 'Numero di mesi per scadenza password',
  `RigheArticoli` int DEFAULT '10' COMMENT 'Numero di articoli visualizzati in ogni pagina',
  `VetrinaArticoliNovita` int DEFAULT '4' COMMENT 'N° box vetrina con articoli fissi',
  `VetrinaArticoliUltimiArriviPuntoVendita` int DEFAULT '4' COMMENT 'N° box vetrina con articoli random',
  `VetrinaArticoliImpatto` int DEFAULT '4' COMMENT 'N° box vetrina con articoli ultimi arrivi',
  `VetrinaArticoliPiuVenduti` int DEFAULT '4' COMMENT 'N° box vetrina con articoli fissi piu cliccati',
  `VetrinaPromoFissi` int DEFAULT '4' COMMENT 'N° box vetrina con promo fisse',
  `VetrinaPromoRandom` int DEFAULT '4' COMMENT 'N° box vetrina con promo random',
  `VetrinaPromoScadenza` int DEFAULT '4' COMMENT 'N° box vetrina con promo in scadenza',
  `VetrinaPromoInizio` int DEFAULT '4' COMMENT 'N° box vetrina con promo appena iniziate',
  `VetrinaDispoMinima` int DEFAULT '10' COMMENT 'Soglia di disponibilita minima x articoli random',
  `Path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `GPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Css` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Smtp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password_smtp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `User_smtp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Organization` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Event` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `OrganizationPangora` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EventPangora` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FtpInt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ftp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FtpUser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FtpPwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FtpPath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AccountPaypal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AccountIwBank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TC` int DEFAULT '0',
  `TCInFattura` int DEFAULT '0',
  `Distinta` int DEFAULT '0',
  `Groupon` int DEFAULT '0',
  `Coupon` int DEFAULT '0',
  `Condizioni_vendita` varchar(1100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Condizioni_privacy` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Icona_web` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descrizione_servizio_coupon` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Copyright` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo_verific_site1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo_verific_site2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo_verific_site3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo_verific_site4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_logo_verific_site1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_logo_verific_site2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_logo_verific_site3` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_logo_verific_site4` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo_footer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `statistiche_visite` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `facebookLink` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AbilitaBuoniScontiCarrello` int DEFAULT '0',
  `SwiftCode` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NomeBanca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AutoContabilizza` int DEFAULT '0',
  `OrdinamentoRigheDoc` int DEFAULT '0',
  `Decimali` int DEFAULT '2',
  `SL_Indirizzo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SL_Citta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SL_CAP` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SL_Provincia` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SL_Telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SL_Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Annotazione1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Annotazione2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Annotazione3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Annotazione4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_pec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codice_sdi` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_IdPaese` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_IdCodice` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_regimefiscale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_NumeroCivico` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_InvioAutomatico` int DEFAULT '1' COMMENT '1=Sì;0=No',
  `FE_IdPaeseTrasmittente` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_IdCodiceTrasmittente` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_RagioneSocialeTrasmittente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `facebook_pixel_id` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Amazon` int DEFAULT '0',
  `eBay` int DEFAULT '0',
  `PreviewArticolo` int DEFAULT '0',
  PRIMARY KEY (`id`,`IvaTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `aziendegestite` */

DROP TABLE IF EXISTS `aziendegestite`;

CREATE TABLE `aziendegestite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '0',
  `AziendaGestita` int NOT NULL DEFAULT '0',
  `Descrizione` char(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `bancasella_impostazioni_azienda` */

DROP TABLE IF EXISTS `bancasella_impostazioni_azienda`;

CREATE TABLE `bancasella_impostazioni_azienda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT NULL,
  `PagamentiTipoId` int DEFAULT '0',
  `shopLogin` varchar(20) DEFAULT 'GESPAY',
  `Attivo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `bancasella_log` */

DROP TABLE IF EXISTS `bancasella_log`;

CREATE TABLE `bancasella_log` (
  `idLog` int NOT NULL AUTO_INCREMENT,
  `Ip` varchar(20) DEFAULT '',
  `Log` varchar(1000) DEFAULT '',
  `XML` varchar(1000) DEFAULT '',
  `Time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLog`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `bancasella_ordini_pagati` */

DROP TABLE IF EXISTS `bancasella_ordini_pagati`;

CREATE TABLE `bancasella_ordini_pagati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int DEFAULT NULL,
  `numeroDocumento` varchar(20) DEFAULT '',
  `codiceAutorizzazione` varchar(50) DEFAULT '',
  `dataTransizione` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `banche` */

DROP TABLE IF EXISTS `banche`;

CREATE TABLE `banche` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Iban` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Banca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Agenzia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `banche_italia` */

DROP TABLE IF EXISTS `banche_italia`;

CREATE TABLE `banche_italia` (
  `Banca` varchar(85) DEFAULT NULL,
  `Abi` varchar(5) DEFAULT '',
  `Cab` varchar(5) DEFAULT '',
  `Indirizzo` varchar(100) DEFAULT '',
  `Cap` varchar(5) DEFAULT '',
  `Comune` varchar(40) DEFAULT '',
  `Provincia` varchar(2) DEFAULT '',
  `Sportello` varchar(40) DEFAULT '',
  UNIQUE KEY `idxAbiCab` (`Abi`,`Cab`),
  KEY `idxAbi` (`Abi`),
  KEY `idxBanca` (`Banca`),
  KEY `idxCab` (`Cab`),
  KEY `idxProvincia` (`Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `banner` */

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `Posizione` int DEFAULT '0',
  `Ordinamento` int DEFAULT '0',
  `Descrizione` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Link` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Html` mediumtext,
  `Target` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Coupon` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Table structure for table `bannerv2` */

DROP TABLE IF EXISTS `bannerv2`;

CREATE TABLE `bannerv2` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `Posizione` int DEFAULT '0',
  `Ordinamento` int DEFAULT '0',
  `Descrizione` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Link` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Html` mediumtext,
  `Target` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Coupon` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Table structure for table `bollini_vetrina` */

DROP TABLE IF EXISTS `bollini_vetrina`;

CREATE TABLE `bollini_vetrina` (
  `idBollino` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idBollino`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `buoni_acquisto` */

DROP TABLE IF EXISTS `buoni_acquisto`;

CREATE TABLE `buoni_acquisto` (
  `idBuono` int NOT NULL AUTO_INCREMENT,
  `idArticolo` int DEFAULT '0',
  `listini_abilitati` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prezzo_fisso` double DEFAULT '-1',
  `sconto` double DEFAULT '-1',
  `spese_spedizione` double DEFAULT '-1',
  `valido_da` date DEFAULT NULL,
  `valido_a` date DEFAULT NULL,
  `imgBuono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idAzienda` int DEFAULT '1',
  PRIMARY KEY (`idBuono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `buoni_sconti` */

DROP TABLE IF EXISTS `buoni_sconti`;

CREATE TABLE `buoni_sconti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DataCreazione` date DEFAULT NULL,
  `idAzienda` int DEFAULT '0',
  `buonoSconto` varchar(20) DEFAULT '',
  `scontoFisso` int DEFAULT '0',
  `scontoPercentuale` int DEFAULT '0',
  `scontoVettore` int DEFAULT '0',
  `valore` double(15,3) DEFAULT '0.000',
  `sogliaPrezzo` double(15,3) DEFAULT '0.000',
  `descrizione1` varchar(90) DEFAULT '',
  `descrizione2` varchar(90) DEFAULT '',
  `dataInizio` date DEFAULT NULL,
  `dataFine` date DEFAULT NULL,
  `img` varchar(200) DEFAULT '',
  `UtilizzaSoloUnaVolta` int DEFAULT '0',
  `ListaUtentiId` varchar(500) DEFAULT NULL,
  `ListaListini` varchar(100) DEFAULT NULL,
  `sSQl` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idarticoli` */

DROP TABLE IF EXISTS `buoni_sconti_idarticoli`;

CREATE TABLE `buoni_sconti_idarticoli` (
  `idBuonoSconto` int DEFAULT NULL,
  `idArticolo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idcategoria` */

DROP TABLE IF EXISTS `buoni_sconti_idcategoria`;

CREATE TABLE `buoni_sconti_idcategoria` (
  `idBuonoSconto` int DEFAULT NULL,
  `idCategoria` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idgruppo` */

DROP TABLE IF EXISTS `buoni_sconti_idgruppo`;

CREATE TABLE `buoni_sconti_idgruppo` (
  `idBuonoSconto` int DEFAULT NULL,
  `idGruppo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idlistinoutente` */

DROP TABLE IF EXISTS `buoni_sconti_idlistinoutente`;

CREATE TABLE `buoni_sconti_idlistinoutente` (
  `idBuonoSconto` int DEFAULT NULL,
  `idListino` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idmarca` */

DROP TABLE IF EXISTS `buoni_sconti_idmarca`;

CREATE TABLE `buoni_sconti_idmarca` (
  `idBuonoSconto` int DEFAULT NULL,
  `idMarca` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idsettore` */

DROP TABLE IF EXISTS `buoni_sconti_idsettore`;

CREATE TABLE `buoni_sconti_idsettore` (
  `idBuonoSconto` int DEFAULT NULL,
  `idSettore` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idsottogruppo` */

DROP TABLE IF EXISTS `buoni_sconti_idsottogruppo`;

CREATE TABLE `buoni_sconti_idsottogruppo` (
  `idBuonoSconto` int DEFAULT NULL,
  `idSottogruppo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idtipologia` */

DROP TABLE IF EXISTS `buoni_sconti_idtipologia`;

CREATE TABLE `buoni_sconti_idtipologia` (
  `idBuonoSconto` int DEFAULT NULL,
  `idTipologia` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idtipoutente` */

DROP TABLE IF EXISTS `buoni_sconti_idtipoutente`;

CREATE TABLE `buoni_sconti_idtipoutente` (
  `idBuonoSconto` int DEFAULT NULL,
  `idTipoUtente` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_idutente` */

DROP TABLE IF EXISTS `buoni_sconti_idutente`;

CREATE TABLE `buoni_sconti_idutente` (
  `idBuonoSconto` int DEFAULT NULL,
  `idUtente` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `buoni_sconti_righe` */

DROP TABLE IF EXISTS `buoni_sconti_righe`;

CREATE TABLE `buoni_sconti_righe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idBuonoSconto` int NOT NULL,
  `MarcheId` int DEFAULT NULL,
  `SettoriId` int DEFAULT NULL,
  `CategorieId` int DEFAULT NULL,
  `TipologieId` int DEFAULT NULL,
  `GruppiId` int DEFAULT NULL,
  `SottoGruppiId` int DEFAULT NULL,
  `ArticoliId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `carrello` */

DROP TABLE IF EXISTS `carrello`;

CREATE TABLE `carrello` (
  `id` int NOT NULL AUTO_INCREMENT,
  `LoginId` int DEFAULT '0',
  `SessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataOra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ArticoliId` int DEFAULT '0',
  `TCId` int DEFAULT '-1',
  `Codice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Qnt` double(15,8) DEFAULT '0.00000000',
  `NListino` int DEFAULT '0',
  `Prezzo` double(15,8) DEFAULT '0.00000000',
  `PrezzoIvato` double(15,8) DEFAULT '0.00000000',
  `OfferteDettaglioId` int DEFAULT '0',
  `PrezzoOfferta` double(15,8) DEFAULT '0.00000000',
  `PrezzoOffertaIvato` double(15,8) DEFAULT '0.00000000',
  `Prodotto_Gratis` int DEFAULT '0',
  `DescrizioneIvaRC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ValoreIvaRC` double(15,8) DEFAULT '-1.00000000',
  `IdIvaRC` int DEFAULT '-1',
  `idEsenzioneIva` int DEFAULT '-1',
  `ValoreEsenzioneIva` double(15,8) DEFAULT '-1.00000000',
  `DescrizioneEsenzioneIva` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3263 DEFAULT CHARSET=latin1;

/*Table structure for table `categorie` */

DROP TABLE IF EXISTS `categorie`;

CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SettoriId` int DEFAULT '0',
  `Codice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Ordinamento` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;

/*Table structure for table `causaliaspetto` */

DROP TABLE IF EXISTS `causaliaspetto`;

CREATE TABLE `causaliaspetto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `causalicontabili` */

DROP TABLE IF EXISTS `causalicontabili`;

CREATE TABLE `causalicontabili` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `Descrizione` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Pagamento` int DEFAULT '0',
  `Incasso` int DEFAULT '0',
  `Acconto` int DEFAULT '0',
  `Segno` char(1) DEFAULT '' COMMENT 'D=dare; A=Avere',
  `Apertura` int DEFAULT '0',
  `Chiusura` int DEFAULT '0',
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

/*Table structure for table `causalicontabilidefault` */

DROP TABLE IF EXISTS `causalicontabilidefault`;

CREATE TABLE `causalicontabilidefault` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CausaliContabiliId` int NOT NULL,
  `Acquisto` int DEFAULT '0',
  `Vendita` int DEFAULT '0',
  `Incasso` int DEFAULT '0',
  `Pagamento` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `causaliporto` */

DROP TABLE IF EXISTS `causaliporto`;

CREATE TABLE `causaliporto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `causalispesa` */

DROP TABLE IF EXISTS `causalispesa`;

CREATE TABLE `causalispesa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `causalitrasporto` */

DROP TABLE IF EXISTS `causalitrasporto`;

CREATE TABLE `causalitrasporto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `cf_comuni` */

DROP TABLE IF EXISTS `cf_comuni`;

CREATE TABLE `cf_comuni` (
  `Comune` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Provincia` char(2) NOT NULL,
  `Regione` char(3) NOT NULL,
  `CAP` char(5) NOT NULL,
  `Prefisso` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Codice_Comune` char(4) NOT NULL,
  `Codice_ISTAT` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cf_province` */

DROP TABLE IF EXISTS `cf_province`;

CREATE TABLE `cf_province` (
  `Provincia` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TargaProvincia` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `cf_stati` */

DROP TABLE IF EXISTS `cf_stati`;

CREATE TABLE `cf_stati` (
  `Stato` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Codice_ISTAT` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `codici_buono` */

DROP TABLE IF EXISTS `codici_buono`;

CREATE TABLE `codici_buono` (
  `idCodiceBuono` int NOT NULL AUTO_INCREMENT,
  `idBuono` int DEFAULT NULL,
  `associazione_groupon` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_convalida` date DEFAULT NULL,
  PRIMARY KEY (`idCodiceBuono`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `codici_promozionali` */

DROP TABLE IF EXISTS `codici_promozionali`;

CREATE TABLE `codici_promozionali` (
  `idCodicePromozione` int NOT NULL AUTO_INCREMENT,
  `CodiceSconto` varchar(10) DEFAULT '',
  `ScontoFisso` double DEFAULT NULL,
  `ScontoPercentuale` double DEFAULT NULL,
  `Descrizione1` varchar(200) DEFAULT '',
  `Descrizione2` varchar(500) DEFAULT '',
  `DataInizio` date DEFAULT NULL,
  `DataFine` date DEFAULT NULL,
  `idMarca` int DEFAULT NULL,
  `idSettore` int DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  `idTipologia` int DEFAULT NULL,
  `idGruppo` int DEFAULT NULL,
  `idSottogruppo` int DEFAULT NULL,
  `idArticolo` int DEFAULT NULL,
  `img` varchar(500) DEFAULT '',
  PRIMARY KEY (`idCodicePromozione`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `colori` */

DROP TABLE IF EXISTS `colori`;

CREATE TABLE `colori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxColoriDescr` (`Descrizione`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `comuni` */

DROP TABLE IF EXISTS `comuni`;

CREATE TABLE `comuni` (
  `Cap` varchar(5) DEFAULT NULL,
  `Comune` varchar(60) DEFAULT NULL,
  `Capoluogo` varchar(60) DEFAULT NULL,
  `Provincia` varchar(2) DEFAULT NULL,
  `Prefisso` varchar(4) DEFAULT NULL,
  `Fiscale` varchar(4) DEFAULT NULL,
  `Catastale` varchar(4) DEFAULT NULL,
  KEY `idx1` (`Comune`,`Provincia`),
  KEY `idxCap` (`Cap`),
  KEY `idxComune` (`Comune`),
  KEY `idxFiscale` (`Fiscale`),
  KEY `idxProvincia` (`Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `comuni_istat` */

DROP TABLE IF EXISTS `comuni_istat`;

CREATE TABLE `comuni_istat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Comune` varchar(50) DEFAULT NULL,
  `Provincia` varchar(20) DEFAULT NULL,
  `CAP` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8049 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `configuratore` */

DROP TABLE IF EXISTS `configuratore`;

CREATE TABLE `configuratore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Ordinamento` int DEFAULT '0',
  `TipodocumentiId` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `configuratoredettaglio` */

DROP TABLE IF EXISTS `configuratoredettaglio`;

CREATE TABLE `configuratoredettaglio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ConfiguratoreId` int NOT NULL DEFAULT '0',
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int NOT NULL DEFAULT '1',
  `Ordinamento` int NOT NULL DEFAULT '0',
  `MarcheId` int NOT NULL DEFAULT '0',
  `SettoriId` int NOT NULL DEFAULT '0',
  `CategorieId` int NOT NULL DEFAULT '0',
  `TipologieId` int NOT NULL DEFAULT '0',
  `GruppiId` int NOT NULL DEFAULT '0',
  `SottogruppiId` int NOT NULL DEFAULT '0',
  `ArticoliId` int NOT NULL DEFAULT '0',
  `Icona` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

/*Table structure for table `configurazionereportdocumenti` */

DROP TABLE IF EXISTS `configurazionereportdocumenti`;

CREATE TABLE `configurazionereportdocumenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TipoDocumentiId` int NOT NULL,
  `MovimentitipoId` int DEFAULT '2',
  `NomeReport` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `cont_scad` */

DROP TABLE IF EXISTS `cont_scad`;

CREATE TABLE `cont_scad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `PagamentiTipoId` int DEFAULT '0',
  `Contabilita` int DEFAULT '0',
  `Scadenza` int DEFAULT '0',
  `Itermediario` int DEFAULT '0',
  `Cassa` int DEFAULT '0',
  `Banca` int DEFAULT '0',
  `DataReg` date DEFAULT NULL,
  `UtentiTipoId` int DEFAULT '0',
  `UtenteId` int DEFAULT '0',
  `Segno` int DEFAULT '1',
  `Importo` double(15,2) DEFAULT '0.00',
  `Titolo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NDoc` int DEFAULT '0',
  `AnnoDoc` int DEFAULT '0',
  `DocumentiTipoId` int DEFAULT '0',
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `contatori` */

DROP TABLE IF EXISTS `contatori`;

CREATE TABLE `contatori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` char(30) DEFAULT '',
  `MovimentiTipoId` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `contatorianno` */

DROP TABLE IF EXISTS `contatorianno`;

CREATE TABLE `contatorianno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ContatoriId` int NOT NULL DEFAULT '0',
  `Anno` int NOT NULL DEFAULT '0',
  `ProssimoNumero` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `conti` */

DROP TABLE IF EXISTS `conti`;

CREATE TABLE `conti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Conto` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Dare` int NOT NULL DEFAULT '0',
  `Avere` int NOT NULL DEFAULT '0',
  `Iva` int NOT NULL DEFAULT '0',
  `Trasporto` int NOT NULL DEFAULT '0',
  `Enasarco` int NOT NULL DEFAULT '0',
  `Assicurazione` int NOT NULL DEFAULT '0',
  `Spese` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Table structure for table `conti2` */

DROP TABLE IF EXISTS `conti2`;

CREATE TABLE `conti2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PCMastro4` varchar(8) DEFAULT NULL,
  `Codice` varchar(11) DEFAULT NULL,
  `Descrizione` varchar(100) DEFAULT NULL,
  `Tipo` varchar(1) DEFAULT 'E',
  `Clienti` int DEFAULT '0',
  `Fornitori` int DEFAULT '0',
  `BeneServizio` varchar(1) DEFAULT '' COMMENT 'B=Bene; S=Servizio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=911 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contidefault` */

DROP TABLE IF EXISTS `contidefault`;

CREATE TABLE `contidefault` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL,
  `IvaAcquisti` int NOT NULL,
  `IvaVendite` int NOT NULL,
  `Spese` int NOT NULL,
  `Trasporto` int NOT NULL,
  `SpeseAcquisti` int NOT NULL,
  `TrasportoAcquisti` int NOT NULL,
  `ArtAcquisto` int NOT NULL,
  `ArtVendita` int NOT NULL,
  `Clienti` int DEFAULT NULL,
  `Fornitori` int DEFAULT NULL,
  `Agenti` int DEFAULT NULL,
  `Operatori` int DEFAULT NULL,
  `Corrispettivi` int DEFAULT NULL,
  `Corrispettivi2` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `contratto` */

DROP TABLE IF EXISTS `contratto`;

CREATE TABLE `contratto` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `NProgressivo` int NOT NULL,
  `Suffisso` varchar(1) DEFAULT NULL,
  `DataCreazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TipoContratto` int NOT NULL COMMENT 'Tabellato',
  `Agente` int NOT NULL COMMENT 'Tabellato',
  `DataInserimento` date NOT NULL,
  `NomeCognome` varchar(50) DEFAULT NULL,
  `CodiceFiscale` varchar(16) DEFAULT NULL,
  `Partitaiva` varchar(15) DEFAULT NULL,
  `NCellulareAom` varchar(20) DEFAULT NULL,
  `IccdAom` varchar(20) DEFAULT NULL,
  `OperatoreAom` int DEFAULT NULL COMMENT 'Tabellato',
  `OperatoreDef` int DEFAULT NULL COMMENT 'Tabellato',
  `TipoAbbonamento` int DEFAULT NULL COMMENT 'Tabellato',
  `NuovoNumeroProv` varchar(20) DEFAULT NULL,
  `IccdProv` varchar(20) DEFAULT NULL,
  `TipoOfferta` int DEFAULT NULL COMMENT 'Tabellato',
  `NuovoNumeroDef` varchar(20) DEFAULT NULL,
  `IccdDef` varchar(20) DEFAULT NULL,
  `Importo` double(15,5) DEFAULT NULL,
  `ScontoCash` int DEFAULT '0' COMMENT 'Vero o Falso',
  `Rateizzo` int DEFAULT '0' COMMENT 'Vero o Falso',
  `TipoRateizzo` int DEFAULT NULL COMMENT 'Tabellato',
  `ProdottoAssociato` int DEFAULT NULL COMMENT 'Tabellato',
  `CodiceNmu` varchar(10) DEFAULT NULL,
  `Imei` varchar(15) DEFAULT NULL,
  `Prezzo` double(15,5) DEFAULT NULL,
  `Acconto` double(15,5) DEFAULT NULL,
  `ScontoProdotto` double(15,5) DEFAULT NULL COMMENT 'Valore',
  `InfoNote` varchar(250) DEFAULT NULL,
  `StatoContratto` int DEFAULT NULL COMMENT 'Tabellato',
  `DataStato` date DEFAULT NULL,
  `Documentazione` date DEFAULT NULL,
  `Compenso` double(15,5) DEFAULT NULL,
  `Liquidato` date DEFAULT NULL,
  `Utente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `TipoContratto` (`TipoContratto`),
  KEY `Agente` (`Agente`),
  KEY `OperatoreAom` (`OperatoreAom`),
  KEY `OperatoreDef` (`OperatoreDef`),
  KEY `ProdottoAssociato` (`ProdottoAssociato`),
  KEY `StatoContratto` (`StatoContratto`),
  KEY `TipoAbbonamento` (`TipoAbbonamento`),
  KEY `TipoOfferta` (`TipoOfferta`),
  KEY `TipoRateizzo` (`TipoRateizzo`),
  CONSTRAINT `contratto_ibfk_1` FOREIGN KEY (`TipoContratto`) REFERENCES `contratto_tipocontratto` (`id`),
  CONSTRAINT `contratto_ibfk_2` FOREIGN KEY (`Agente`) REFERENCES `contratto_agente` (`id`),
  CONSTRAINT `contratto_ibfk_3` FOREIGN KEY (`OperatoreAom`) REFERENCES `contratto_operatoreaom` (`id`),
  CONSTRAINT `contratto_ibfk_4` FOREIGN KEY (`OperatoreDef`) REFERENCES `contratto_operatoredef` (`id`),
  CONSTRAINT `contratto_ibfk_5` FOREIGN KEY (`ProdottoAssociato`) REFERENCES `contratto_prodottoassociato` (`id`),
  CONSTRAINT `contratto_ibfk_6` FOREIGN KEY (`StatoContratto`) REFERENCES `contratto_statocontratto` (`id`),
  CONSTRAINT `contratto_ibfk_7` FOREIGN KEY (`TipoAbbonamento`) REFERENCES `contratto_tipoabbonamento` (`id`),
  CONSTRAINT `contratto_ibfk_8` FOREIGN KEY (`TipoOfferta`) REFERENCES `contratto_tipoofferta` (`id`),
  CONSTRAINT `contratto_ibfk_9` FOREIGN KEY (`TipoRateizzo`) REFERENCES `contratto_tiporateizzo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_agente` */

DROP TABLE IF EXISTS `contratto_agente`;

CREATE TABLE `contratto_agente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Codice` varchar(20) DEFAULT NULL,
  `Descrizione` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_operatoreaom` */

DROP TABLE IF EXISTS `contratto_operatoreaom`;

CREATE TABLE `contratto_operatoreaom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_operatoredef` */

DROP TABLE IF EXISTS `contratto_operatoredef`;

CREATE TABLE `contratto_operatoredef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(20) DEFAULT NULL,
  `Default` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_prodottoassociato` */

DROP TABLE IF EXISTS `contratto_prodottoassociato`;

CREATE TABLE `contratto_prodottoassociato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_statocontratto` */

DROP TABLE IF EXISTS `contratto_statocontratto`;

CREATE TABLE `contratto_statocontratto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_tipoabbonamento` */

DROP TABLE IF EXISTS `contratto_tipoabbonamento`;

CREATE TABLE `contratto_tipoabbonamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_tipocontratto` */

DROP TABLE IF EXISTS `contratto_tipocontratto`;

CREATE TABLE `contratto_tipocontratto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) DEFAULT NULL,
  `Suffisso` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_tipoofferta` */

DROP TABLE IF EXISTS `contratto_tipoofferta`;

CREATE TABLE `contratto_tipoofferta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `contratto_tiporateizzo` */

DROP TABLE IF EXISTS `contratto_tiporateizzo`;

CREATE TABLE `contratto_tiporateizzo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `controllaarrotondamento` */

DROP TABLE IF EXISTS `controllaarrotondamento`;

CREATE TABLE `controllaarrotondamento` (
  `DocumentiId` int NOT NULL,
  `daControllare` int DEFAULT '1',
  PRIMARY KEY (`DocumentiId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `corrispettivi` */

DROP TABLE IF EXISTS `corrispettivi`;

CREATE TABLE `corrispettivi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtentiId` int NOT NULL,
  `DataChiusura` date DEFAULT NULL,
  `TotaleGiorno` double(15,5) DEFAULT '0.00000',
  `Imponibile1` double(15,5) DEFAULT '0.00000',
  `TotaleIva1` double(15,5) DEFAULT '0.00000',
  `IvaId1` int DEFAULT '0',
  `Imponibile2` double(15,5) DEFAULT '0.00000',
  `TotaleIva2` double(15,5) DEFAULT '0.00000',
  `IvaId2` int DEFAULT '0',
  `Imponibile3` double(15,5) DEFAULT '0.00000',
  `TotaleIva3` double(15,5) DEFAULT '0.00000',
  `IvaId3` int DEFAULT '0',
  `Imponibile4` double(15,5) DEFAULT '0.00000',
  `TotaleIva4` double(15,5) DEFAULT '0.00000',
  `IvaId4` int DEFAULT '0',
  `Imponibile5` double(15,5) DEFAULT '0.00000',
  `TotaleIva5` double(15,5) DEFAULT '0.00000',
  `IvaId5` int DEFAULT NULL,
  `Imponibile6` double(15,5) DEFAULT '0.00000',
  `TotaleIva6` double(15,5) DEFAULT '0.00000',
  `IvaId6` int DEFAULT NULL,
  `Imponibile7` double(15,5) DEFAULT '0.00000',
  `TotaleIva7` double(15,5) DEFAULT '0.00000',
  `IvaId7` int DEFAULT '0',
  `Imponibile8` double(15,5) DEFAULT '0.00000',
  `TotaleIva8` double(15,5) DEFAULT '0.00000',
  `IvaId8` int DEFAULT NULL,
  `Contabilizzato` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3046 DEFAULT CHARSET=latin1;

/*Table structure for table `corrispettivicontabilizzati` */

DROP TABLE IF EXISTS `corrispettivicontabilizzati`;

CREATE TABLE `corrispettivicontabilizzati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CorrispettiviId` int DEFAULT NULL,
  `DataChiusura` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2281 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `coupon_buonisconto` */

DROP TABLE IF EXISTS `coupon_buonisconto`;

CREATE TABLE `coupon_buonisconto` (
  `idBuono` int NOT NULL AUTO_INCREMENT,
  `DataInizioValidita` date DEFAULT NULL,
  `DataFineValidita` date DEFAULT NULL,
  `ValoreBuono` double(11,2) DEFAULT NULL,
  `Cumulabile` int DEFAULT NULL,
  `Attivo_Disattivo` int DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idBuono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_categorie` */

DROP TABLE IF EXISTS `coupon_categorie`;

CREATE TABLE `coupon_categorie` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idSettore` int DEFAULT NULL,
  `OrdinamentoCategoria` int DEFAULT '0',
  `Attiva_Disattiva_Categoria` int DEFAULT '1',
  `imgCategoria` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `linkCategoria` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_commenti` */

DROP TABLE IF EXISTS `coupon_commenti`;

CREATE TABLE `coupon_commenti` (
  `idCommento` int NOT NULL AUTO_INCREMENT,
  `Commento` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idCoupon` int DEFAULT '0',
  `idUtente` int DEFAULT '0',
  PRIMARY KEY (`idCommento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_coupon_storico` */

DROP TABLE IF EXISTS `coupon_coupon_storico`;

CREATE TABLE `coupon_coupon_storico` (
  `idCouponStorico` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Prezzo` double(11,2) DEFAULT NULL,
  `DataScadenza` date DEFAULT NULL,
  `NumeroAcquisti` int DEFAULT '0',
  `Attiva_Disattiva` int DEFAULT '0',
  `Min_Ordinabile` int DEFAULT '0',
  `Max_Ordinabile` int DEFAULT '0',
  `Img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Sintesi` longtext,
  `Condizioni` longtext,
  `ComeOrdinare` longtext,
  `DescrizioneLunga` longtext,
  `DescrizioneTecnica` longtext,
  `Regione` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Citta` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idPartner` int DEFAULT '0',
  `PrezzoDiListino` double(11,2) DEFAULT NULL,
  `idSettore` int DEFAULT '0',
  `idCategoria` int DEFAULT '0',
  `idGruppo` int DEFAULT '0',
  `CodiceVerificaCoupon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Raggiungimento_Minimo` int DEFAULT '0',
  `Raggiungimento_Massimo` int DEFAULT '0',
  PRIMARY KEY (`idCouponStorico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_inserzione` */

DROP TABLE IF EXISTS `coupon_inserzione`;

CREATE TABLE `coupon_inserzione` (
  `idCoupon` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Prezzo` double(11,2) DEFAULT NULL,
  `DataInizio` date DEFAULT NULL,
  `DataFine` date DEFAULT NULL,
  `NumeroAcquisti` int DEFAULT '0',
  `Attiva_Disattiva` int DEFAULT '1',
  `Min_Ordinabile` int DEFAULT '0',
  `Max_Ordinabile` int DEFAULT '0',
  `Img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Sintesi` longtext,
  `Condizioni` longtext,
  `ComeOrdinare` longtext,
  `DescrizioneLunga` longtext,
  `DescrizioneHtml` longtext,
  `DescrizioneTecnica` longtext,
  `RegioneCoupon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CittaCoupon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idPartner` int DEFAULT '0',
  `PrezzoDiListino` double(11,2) DEFAULT '0.00',
  `idSettore` int DEFAULT '0',
  `idCategoria` int DEFAULT '0',
  `idGruppo` int DEFAULT '0',
  `CodiceVerificaCoupon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Raggiungimento_Minimo` int DEFAULT '0',
  `Raggiungimento_Massimo` int DEFAULT '0',
  `idArticolo` int DEFAULT '0',
  `visite` int DEFAULT '0',
  `opzione1_descrizione` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `opzione1_qnt` int DEFAULT '0',
  `opzione1_prezzo` double(11,2) DEFAULT '0.00',
  `opzione1_prezzodilistino` double(11,2) DEFAULT '0.00',
  `opzione1_qnt_min` int DEFAULT '0',
  `opzione1_qnt_max` int DEFAULT '0',
  `opzione2_descrizione` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `opzione2_qnt` int DEFAULT '0',
  `opzione2_prezzo` double(11,2) DEFAULT '0.00',
  `opzione2_prezzodilistino` double(11,2) DEFAULT '0.00',
  `opzione2_qnt_min` int DEFAULT '0',
  `opzione2_qnt_max` int DEFAULT '0',
  `opzione3_descrizione` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `opzione3_qnt` int DEFAULT '0',
  `opzione3_prezzo` double(11,2) DEFAULT '0.00',
  `opzione3_prezzodilistino` double(11,2) DEFAULT '0.00',
  `opzione3_qnt_min` int DEFAULT '0',
  `opzione3_qnt_max` int DEFAULT '0',
  `VettoreId` int DEFAULT '0',
  `Iva_Coupon` int DEFAULT '0',
  PRIMARY KEY (`idCoupon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_partners` */

DROP TABLE IF EXISTS `coupon_partners`;

CREATE TABLE `coupon_partners` (
  `idPartner` int NOT NULL AUTO_INCREMENT,
  `RagioneSociale` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cognome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Via` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Citta` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Provincia` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CAP` int DEFAULT '0',
  `Telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Fax` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StatoUtente` int DEFAULT '1',
  `SitoWeb` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `GoogleMaps_iFrame` longtext,
  `Descrizione_Partner` longtext,
  PRIMARY KEY (`idPartner`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_settori` */

DROP TABLE IF EXISTS `coupon_settori`;

CREATE TABLE `coupon_settori` (
  `idSettore` int NOT NULL AUTO_INCREMENT,
  `NomeSettore` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `OrdinamentoSettore` int DEFAULT '0',
  `Attiva_Disattiva_Settore` int DEFAULT '1',
  `imgSettore` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `linkSettore` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idSettore`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_storico` */

DROP TABLE IF EXISTS `coupon_storico`;

CREATE TABLE `coupon_storico` (
  `idCouponStorico` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Prezzo` double(11,2) DEFAULT NULL,
  `DataScadenza` date DEFAULT NULL,
  `NumeroAcquisti` int DEFAULT '0',
  `Attiva_Disattiva` int DEFAULT '0',
  `Min_Ordinabile` int DEFAULT '0',
  `Max_Ordinabile` int DEFAULT '0',
  `Img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Sintesi` longtext,
  `Condizioni` longtext,
  `ComeOrdinare` longtext,
  `DescrizioneLunga` longtext,
  `DescrizioneTecnica` longtext,
  `Regione` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Citta` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idPartner` int DEFAULT '0',
  `PrezzoDiListino` double(11,2) DEFAULT NULL,
  `idSettore` int DEFAULT '0',
  `idCategoria` int DEFAULT '0',
  `idGruppo` int DEFAULT '0',
  `CodiceVerificaCoupon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Raggiungimento_Minimo` int DEFAULT '0',
  `Raggiungimento_Massimo` int DEFAULT '0',
  PRIMARY KEY (`idCouponStorico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `coupon_tabella_temporanea` */

DROP TABLE IF EXISTS `coupon_tabella_temporanea`;

CREATE TABLE `coupon_tabella_temporanea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Datainserimento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idCoupon` int DEFAULT '0',
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idUtente` int DEFAULT '0',
  `prezzo` double DEFAULT '0',
  `qnt_coupon` int DEFAULT '0',
  `qnt_pezzi` int DEFAULT '0',
  `idTransazione` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StatoPagamento` int DEFAULT '0',
  `AziendaId` int DEFAULT '0',
  `cod_controllo` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

/*Table structure for table `data_amazon` */

DROP TABLE IF EXISTS `data_amazon`;

CREATE TABLE `data_amazon` (
  `AWSAccessKeyId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MWSAuthToken` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SellerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SecretKey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `dettagli_listino_personalizzato` */

DROP TABLE IF EXISTS `dettagli_listino_personalizzato`;

CREATE TABLE `dettagli_listino_personalizzato` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Listino_Personalizzato` int DEFAULT '0',
  `ID_Settore` int DEFAULT '0',
  `ID_Categoria` int DEFAULT '0',
  `ID_Tipologia` int DEFAULT '0',
  `Promo` int DEFAULT '0',
  `Ricarico` double DEFAULT '0',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=58633 DEFAULT CHARSET=latin1;

/*Table structure for table `documenti` */

DROP TABLE IF EXISTS `documenti`;

CREATE TABLE `documenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `TipoDocumentiId` int DEFAULT '0',
  `NDocumento` int DEFAULT '0',
  `Bis` int DEFAULT '0',
  `DataDocumento` date DEFAULT NULL,
  `UtentiId` int DEFAULT '0',
  `Utente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AgentiId` int DEFAULT '0',
  `Provvigione` double(15,3) DEFAULT '0.000',
  `SubAgentiId` int DEFAULT '0',
  `Provvigione2` double(15,3) DEFAULT '0.000',
  `SedeLegale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DestinazioneMerci` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Piva` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CodiceFiscale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ScontoExtra` double(15,5) DEFAULT '0.00000',
  `Fido` double(15,5) DEFAULT '0.00000',
  `PagamentiTipoId` int DEFAULT '0',
  `Listino` int DEFAULT '0',
  `Punti` int DEFAULT '0',
  `NoteInterne` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `NoteEsterne` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `NProtocollo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataProtocollo` date DEFAULT NULL,
  `StatiId` int DEFAULT '0',
  `Pagato` int DEFAULT '0' COMMENT '0=NO;1=SI;-1=Documento Interno',
  `IdTransazione` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tracking` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ordine_Web` int DEFAULT '0',
  `Coupon_IdCoupon` int DEFAULT '0',
  `Coupon_NumeroOpzione` int DEFAULT '0',
  `Coupon_CodControllo` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Arrotondamento` double(15,5) DEFAULT '0.00000',
  `CodiceBuonoSconto` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ValoreBuonoSconto` double(15,5) DEFAULT '0.00000',
  `Anno` year DEFAULT NULL,
  `UtentiIndirizziId` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `DocUnivoco` (`TipoDocumentiId`,`NDocumento`,`Bis`,`Anno`),
  KEY `idxNDocumento` (`NDocumento`),
  KEY `idxTipoDocumento` (`TipoDocumentiId`),
  KEY `idx_documenti_datadocumento` (`DataDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=164778 DEFAULT CHARSET=latin1;

/*Table structure for table `documentiagenti` */

DROP TABLE IF EXISTS `documentiagenti`;

CREATE TABLE `documentiagenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int NOT NULL DEFAULT '0',
  `DocumentiRigheId` int NOT NULL DEFAULT '0',
  `AgenteId` int DEFAULT '0',
  `Provvigione1` double(15,3) DEFAULT '0.000',
  `SubAgenteId` int DEFAULT '0',
  `Provvigione2` double(15,3) DEFAULT '0.000',
  `Pagato` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `DocumentiRigheId` (`DocumentiRigheId`),
  KEY `DocumentiId` (`DocumentiId`),
  CONSTRAINT `documentiagenti_ibfk_1` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=373106 DEFAULT CHARSET=latin1;

/*Table structure for table `documenticollegati` */

DROP TABLE IF EXISTS `documenticollegati`;

CREATE TABLE `documenticollegati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int NOT NULL,
  `Amazon_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ebay_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Purchase_date` date DEFAULT NULL,
  `EPAY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxUniqueDoc` (`DocumentiId`,`Amazon_order_id`,`Ebay_order_id`),
  KEY `idxDocumentiId` (`DocumentiId`),
  CONSTRAINT `fkDocumenti` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=latin1;

/*Table structure for table `documenticontabilizzati` */

DROP TABLE IF EXISTS `documenticontabilizzati`;

CREATE TABLE `documenticontabilizzati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxDocumenti` (`DocumentiId`),
  CONSTRAINT `documenticontabilizzati_ibfk_1` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29512 DEFAULT CHARSET=latin1;

/*Table structure for table `documentidestinazioni` */

DROP TABLE IF EXISTS `documentidestinazioni`;

CREATE TABLE `documentidestinazioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int NOT NULL DEFAULT '0',
  `UtentiId` int NOT NULL DEFAULT '0',
  `UtentiIndirizziId` int NOT NULL DEFAULT '0',
  `RagioneSocialeA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NomeA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IndirizzoA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CittaA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CapA` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProvinciaA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NazioneA` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DocumentiId` (`DocumentiId`),
  CONSTRAINT `documentidestinazioni_ibfk_1` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52929 DEFAULT CHARSET=latin1;

/*Table structure for table `documentifatturapa` */

DROP TABLE IF EXISTS `documentifatturapa`;

CREATE TABLE `documentifatturapa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int DEFAULT NULL,
  `ExportDate` date DEFAULT NULL,
  `NotificationDate` date DEFAULT NULL,
  `TrasmissionDate` date DEFAULT NULL,
  `Filename` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `documentipie` */

DROP TABLE IF EXISTS `documentipie`;

CREATE TABLE `documentipie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int DEFAULT '0',
  `CausaliTrasportoId` int DEFAULT '0',
  `CausaliPortoId` int DEFAULT '0',
  `DataTrasporto` date DEFAULT NULL,
  `OraTrasporto` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VettoriId` int DEFAULT '0',
  `Colli` int DEFAULT '0',
  `Peso` double(15,5) DEFAULT '0.00000',
  `CausaliAspettoId` int DEFAULT '0',
  `Rdap` double(15,5) DEFAULT '0.00000',
  `Enasarcop` double(15,5) DEFAULT '0.00000',
  `CICP` double(15,5) DEFAULT '0.00000',
  `Note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Tracking` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `costoassicurazione` double(15,5) DEFAULT '0.00000',
  `costospedizione` double(15,5) DEFAULT '0.00000',
  `costopagamento` double(15,5) DEFAULT '0.00000',
  `TotImponibile` double(15,5) DEFAULT '0.00000',
  `TotSpese` double(15,5) DEFAULT '0.00000',
  `TotSconto` double(15,5) DEFAULT '0.00000',
  `TotEnasarco` double(15,5) DEFAULT '0.00000',
  `TotIva` decimal(15,5) DEFAULT '0.00000',
  `TotRda` double(15,5) DEFAULT '0.00000',
  `TotaleDocumento` double(15,5) DEFAULT '0.00000',
  `TotMerce` double(15,5) DEFAULT '0.00000',
  `TotServizi` double(15,5) DEFAULT '0.00000',
  `ScontoMerce` double(15,5) DEFAULT '0.00000',
  `ScontoServizi` double(15,5) DEFAULT '0.00000',
  `NettoMerce` double(15,5) DEFAULT '0.00000',
  `NettoServizi` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `idx_DocumentiId` (`DocumentiId`),
  CONSTRAINT `documentipie_ibfk_1` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165390 DEFAULT CHARSET=latin1;

/*Table structure for table `documentiplus` */

DROP TABLE IF EXISTS `documentiplus`;

CREATE TABLE `documentiplus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int DEFAULT '0',
  `Assicurazione` tinyint(1) DEFAULT '0',
  `Spedizione` tinyint(1) DEFAULT '0',
  `Pagamento` tinyint(1) DEFAULT '0',
  `CalcolaAssicurazione` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `DocumentiId` (`DocumentiId`)
) ENGINE=InnoDB AUTO_INCREMENT=201815 DEFAULT CHARSET=latin1;

/*Table structure for table `documentirapidi` */

DROP TABLE IF EXISTS `documentirapidi`;

CREATE TABLE `documentirapidi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '1',
  `UtentiId` int NOT NULL DEFAULT '0',
  `DocumentiId` int NOT NULL DEFAULT '0',
  `ShortCut` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `documentirighe` */

DROP TABLE IF EXISTS `documentirighe`;

CREATE TABLE `documentirighe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `Ean` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Codice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione2` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `um` int DEFAULT '0',
  `peso` double(15,5) DEFAULT '0.00000',
  `prezzo` double(15,8) DEFAULT '0.00000000',
  `Qnt` double(15,5) DEFAULT '0.00000',
  `sc1` double(15,5) DEFAULT '0.00000',
  `sc2` double(15,5) DEFAULT '0.00000',
  `sc3` double(15,5) DEFAULT '0.00000',
  `importo` double(15,8) DEFAULT '0.00000000',
  `iva` int DEFAULT '0',
  `omaggio` int DEFAULT '0',
  `movimento` int DEFAULT '0',
  `movimentato` int DEFAULT '0',
  `SpGratis` int DEFAULT '0',
  `MagazziniId` int DEFAULT NULL,
  `QntEvadibile` double(15,5) DEFAULT '0.00000',
  `QntEvasa` double(15,5) DEFAULT '0.00000',
  `IdRigaEvasa` int DEFAULT NULL,
  `TCid` int DEFAULT '-1',
  `IdConto` int DEFAULT '0',
  `TipoRiga` char(1) DEFAULT 'A' COMMENT 'A=Articolo; D=Descrizione',
  `Seriali` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIDX` (`DocumentiId`,`ArticoliId`,`Ean`,`Codice`,`Descrizione1`,`um`,`peso`,`prezzo`,`Qnt`,`iva`,`omaggio`,`IdRigaEvasa`,`TCid`),
  KEY `DocumentiIdx` (`DocumentiId`),
  KEY `idx_documentirighe_idRigaEvasa` (`IdRigaEvasa`),
  CONSTRAINT `documentirighe_ibfk_1` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=546327 DEFAULT CHARSET=latin1;

/*Table structure for table `documentirighe_fepa` */

DROP TABLE IF EXISTS `documentirighe_fepa`;

CREATE TABLE `documentirighe_fepa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentirigheId` int NOT NULL,
  `Convenzione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cup` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cig` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TipoDocumenti_FE_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fkDocFepa` (`DocumentirigheId`),
  CONSTRAINT `fkDocFepa` FOREIGN KEY (`DocumentirigheId`) REFERENCES `documentirighe` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58926 DEFAULT CHARSET=latin1;

/*Table structure for table `documentispese` */

DROP TABLE IF EXISTS `documentispese`;

CREATE TABLE `documentispese` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DocumentiId` int DEFAULT '0',
  `Descrizione` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Importo` double(15,5) DEFAULT '0.00000',
  `iva` int DEFAULT '0',
  `TotIva` double(15,5) DEFAULT '0.00000',
  `ContiId` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idxSpese` (`DocumentiId`),
  CONSTRAINT `documentispese_ibfk_1` FOREIGN KEY (`DocumentiId`) REFERENCES `documenti` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `documentistati` */

DROP TABLE IF EXISTS `documentistati`;

CREATE TABLE `documentistati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione2` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` double DEFAULT '0',
  `Web` double DEFAULT '0',
  `Fisso` int DEFAULT '0' COMMENT 'i fissi non possono mai essere cambiati. Tutti i successivi saranno sempre = a 0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `documentistati_contatori` */

DROP TABLE IF EXISTS `documentistati_contatori`;

CREATE TABLE `documentistati_contatori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TipoDocumentiId` int DEFAULT NULL,
  `DocumentiStatiId` int DEFAULT NULL,
  `Contatore` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `documentiwizard` */

DROP TABLE IF EXISTS `documentiwizard`;

CREATE TABLE `documentiwizard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aziendeid` int DEFAULT '0',
  `DocumentiId` int DEFAULT '0',
  `Nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Numero` int DEFAULT '0',
  `Data` date DEFAULT NULL,
  `ConfiguratoreId` int DEFAULT '0',
  `ConfiguratoreDettaglioId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `Qnt` int DEFAULT '0',
  `Prezzo` double(15,3) DEFAULT NULL,
  `ConfigDes` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConfigDetDes` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Codice` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Numero` (`Numero`,`Data`,`ConfiguratoreId`,`ConfiguratoreDettaglioId`,`ArticoliId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `export` */

DROP TABLE IF EXISTS `export`;

CREATE TABLE `export` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FormatString` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NListino` int DEFAULT '0',
  `IvaTipo` int DEFAULT '0',
  `Giacenza` double(15,3) DEFAULT '0.000',
  `SpeseSpedizione` double(15,3) DEFAULT '0.000',
  `GiorniSpedizione` int DEFAULT '0',
  `Azienda` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tipo` char(3) DEFAULT '',
  `IdVettore` int DEFAULT '0',
  `NListino2` int DEFAULT '0',
  `Tutto_in_minuscolo` int DEFAULT '0',
  `Google` int DEFAULT '0',
  `Amazon` int DEFAULT '0',
  `NoVettoreSuGratis` int DEFAULT '0',
  `Abilitato` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

/*Table structure for table `export_amazon` */

DROP TABLE IF EXISTS `export_amazon`;

CREATE TABLE `export_amazon` (
  `Abilitato` int NOT NULL DEFAULT '0',
  `nuovo_inserimento` int NOT NULL DEFAULT '9',
  `Aggiornamenti` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avvio_forzato_aggiornamento` int NOT NULL DEFAULT '0',
  `avvio_forzato_nuovo_inserimento` int NOT NULL DEFAULT '0',
  `stato_esecuzione` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Mode` int NOT NULL DEFAULT '2',
  `Note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NListino` int NOT NULL DEFAULT '0',
  `IvaTipo` int NOT NULL DEFAULT '0',
  `Giacenza` double(15,3) NOT NULL DEFAULT '0.000',
  `SpeseSpedizione` double(15,3) NOT NULL DEFAULT '0.000',
  `GiorniSpedizione` int NOT NULL DEFAULT '0',
  `Azienda` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IdVettore` int NOT NULL DEFAULT '0',
  `NListino2` int NOT NULL DEFAULT '0',
  `NoVettoreSuGratis` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `export_filtri` */

DROP TABLE IF EXISTS `export_filtri`;

CREATE TABLE `export_filtri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ExportId` int DEFAULT NULL,
  `MarcheId` int DEFAULT '-1',
  `SettoriId` int DEFAULT '-1',
  `CategorieId` int DEFAULT '-1',
  `TipologieId` int DEFAULT '-1',
  `GruppiId` int DEFAULT '-1',
  `SottogruppiId` int DEFAULT '-1',
  `ArticoliId` int DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

/*Table structure for table `exportcampi` */

DROP TABLE IF EXISTS `exportcampi`;

CREATE TABLE `exportcampi` (
  `NomeCampo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`NomeCampo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `fatturaelettronica_documento` */

DROP TABLE IF EXISTS `fatturaelettronica_documento`;

CREATE TABLE `fatturaelettronica_documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `XmlData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `DocumentiId` int NOT NULL,
  `DataEmissione` datetime NOT NULL,
  `Esito` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Modificabile` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7586 DEFAULT CHARSET=latin1;

/*Table structure for table `fatturaelettronica_natura` */

DROP TABLE IF EXISTS `fatturaelettronica_natura`;

CREATE TABLE `fatturaelettronica_natura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Codice` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `fatturaelettronica_utenti` */

DROP TABLE IF EXISTS `fatturaelettronica_utenti`;

CREATE TABLE `fatturaelettronica_utenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtentiId` int NOT NULL,
  `Privato` int NOT NULL DEFAULT '1' COMMENT '1=Privato; 0=Pubblica Amministrazione',
  `Nazione` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CodiceSDI` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RegimeFiscale` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TipoDocumento` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Esigibilita` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `fatturaelettronica_xml` */

DROP TABLE IF EXISTS `fatturaelettronica_xml`;

CREATE TABLE `fatturaelettronica_xml` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Valore` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Unico` int NOT NULL DEFAULT '0',
  `idPadre` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `fileexcel` */

DROP TABLE IF EXISTS `fileexcel`;

CREATE TABLE `fileexcel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeProfilo` varchar(50) DEFAULT NULL,
  `File` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `gruppi` */

DROP TABLE IF EXISTS `gruppi`;

CREATE TABLE `gruppi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategorieId` int DEFAULT '0',
  `Codice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Ordinamento` int DEFAULT '0',
  `IdPadre` int DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=latin1;

/*Table structure for table `immagini` */

DROP TABLE IF EXISTS `immagini`;

CREATE TABLE `immagini` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Immagine1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `impostazionifileexcel` */

DROP TABLE IF EXISTS `impostazionifileexcel`;

CREATE TABLE `impostazionifileexcel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeProfilo` varchar(80) DEFAULT NULL,
  `NomeFile` varchar(200) DEFAULT NULL,
  `NomeFoglio` varchar(50) DEFAULT NULL,
  `CampoFile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `impostazioniimportexcel` */

DROP TABLE IF EXISTS `impostazioniimportexcel`;

CREATE TABLE `impostazioniimportexcel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeProfilo` varchar(80) NOT NULL,
  `AcquistoVendita` int DEFAULT '1' COMMENT '0=Acquisto; 1=Vendita',
  `NomeFoglio` varchar(50) DEFAULT NULL,
  `TabellaDest` varchar(50) DEFAULT NULL,
  `CampoFile` varchar(50) NOT NULL,
  `CampoDb` varchar(20) NOT NULL,
  `ValoreDefault` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Univoco` (`NomeProfilo`,`CampoFile`,`CampoDb`)
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `impostazionistampanti` */

DROP TABLE IF EXISTS `impostazionistampanti`;

CREATE TABLE `impostazionistampanti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeComputer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Stampante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ModuloId` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `inviadocumenti` */

DROP TABLE IF EXISTS `inviadocumenti`;

CREATE TABLE `inviadocumenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '1',
  `DocumentiId` int DEFAULT '0',
  `UtentiId` int DEFAULT '0',
  `DataRichiesta` datetime DEFAULT NULL,
  `Evasa` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

/*Table structure for table `iva` */

DROP TABLE IF EXISTS `iva`;

CREATE TABLE `iva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Codice` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Valore` double(15,3) DEFAULT '0.000',
  `Abilitato` int DEFAULT '1',
  `ContiId` int DEFAULT '0',
  `AcquistoVendita` int DEFAULT '0' COMMENT '1=Vendita; 0=Acquisto',
  `Natura` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Rivalsa` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Table structure for table `ivadefault` */

DROP TABLE IF EXISTS `ivadefault`;

CREATE TABLE `ivadefault` (
  `id` int NOT NULL AUTO_INCREMENT,
  `IvaVId` int DEFAULT NULL COMMENT 'Iva Vendita',
  `IvaAid` int DEFAULT NULL COMMENT 'Iva Acquisto',
  `Dal` datetime DEFAULT NULL,
  `Al` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_agent_agents` */

DROP TABLE IF EXISTS `ks_agent_agents`;

CREATE TABLE `ks_agent_agents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `code` int NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_amazon_data` */

DROP TABLE IF EXISTS `ks_amazon_data`;

CREATE TABLE `ks_amazon_data` (
  `enabled` int NOT NULL DEFAULT '0',
  `update` int NOT NULL DEFAULT '0',
  `partialupdates` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `force_partialupdate` int NOT NULL DEFAULT '0',
  `force_update` int NOT NULL DEFAULT '0',
  `mode` int NOT NULL DEFAULT '0',
  `min_quantity` int NOT NULL DEFAULT '0',
  `price_list_id` int NOT NULL DEFAULT '0',
  `carrier_id` int NOT NULL DEFAULT '0',
  `no_carrier_on_gratis` int NOT NULL DEFAULT '0',
  `execution_status_export_feeds` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `execution_status_import_orders` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aws_access_key_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mws_auth_token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `seller_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hach_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `marketplaces` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `document_type_id` int NOT NULL DEFAULT '0',
  `company_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ks_amazon_orders` */

DROP TABLE IF EXISTS `ks_amazon_orders`;

CREATE TABLE `ks_amazon_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_id` int NOT NULL,
  `amazon_order_id` varchar(50) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `destination` varchar(512) NOT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_amazon_products` */

DROP TABLE IF EXISTS `ks_amazon_products`;

CREATE TABLE `ks_amazon_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `tc_id` int DEFAULT '-1',
  `item_sku` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `external_product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `standard_price` double(15,8) DEFAULT '0.00000000',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `condition_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `condition_note` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `item_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `product_description` varchar(2000) DEFAULT '',
  `brand_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `manufacturer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `main_image_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `other_image_url1` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `other_image_url2` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `other_image_url3` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `other_image_url4` varchar(2000) DEFAULT '',
  `other_image_url5` varchar(2000) DEFAULT '',
  `bullet_point1` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bullet_point2` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bullet_point3` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bullet_point4` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bullet_point5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `generic_keywords1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `generic_keywords2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `generic_keywords3` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `generic_keywords4` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `generic_keywords5` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platinum_keywords1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platinum_keywords2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platinum_keywords3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platinum_keywords4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platinum_keywords5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `package_weight` double(15,2) DEFAULT '0.00',
  `package_weight_unit_of_measure` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `recommended_browse_nodes` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parent_child` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parent_sku` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `color_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `color_map` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size_map` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `merchant_shipping_group_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `enabled` int DEFAULT '1',
  `offer_price` double(15,8) DEFAULT '0.00000000',
  `date_offer_begin` date DEFAULT NULL,
  `date_offer_end` date DEFAULT NULL,
  `external_product_id_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_quantity_exported` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `fk_Articoli` (`product_id`),
  CONSTRAINT `fk_Articoli` FOREIGN KEY (`product_id`) REFERENCES `articoli` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=428131 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_ebay_data` */

DROP TABLE IF EXISTS `ks_ebay_data`;

CREATE TABLE `ks_ebay_data` (
  `enabled` int NOT NULL DEFAULT '0',
  `updates` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `force_update` int NOT NULL DEFAULT '0',
  `mode` int NOT NULL DEFAULT '0',
  `min_quantity` int NOT NULL DEFAULT '0',
  `price_list_id` int NOT NULL DEFAULT '0',
  `carrier_id` int NOT NULL DEFAULT '0',
  `execution_status_export_feeds` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `execution_status_import_orders` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `document_type_id` int NOT NULL DEFAULT '0',
  `company_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `ebay_db_company_id` int NOT NULL DEFAULT '0',
  `access_token` varchar(2024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dispatch_time_max` int NOT NULL DEFAULT '5' COMMENT 'valori validi : 1,2,3,4,5,10,15,20',
  `countries` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `secret` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `payment_profile_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `return_policy_profile_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shipping_policy_profile_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ks_ebay_orders` */

DROP TABLE IF EXISTS `ks_ebay_orders`;

CREATE TABLE `ks_ebay_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_id` int NOT NULL,
  `ebay_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `order_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `buyer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `destination` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ks_ebay_products` */

DROP TABLE IF EXISTS `ks_ebay_products`;

CREATE TABLE `ks_ebay_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `tc_id` int DEFAULT '-1',
  `sku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ean` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` double(15,8) DEFAULT '0.00000000',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `condition_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `subtitle` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `picture_url1` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture_url2` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture_url3` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture_url4` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture_url5` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture_url6` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `site` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parent_child` char(1) DEFAULT 'P' COMMENT 'P=parent;C=Child',
  `parent_sku` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `enabled` int DEFAULT '1',
  `offer_price` double(15,8) DEFAULT '0.00000000',
  `date_offer_begin` date DEFAULT NULL,
  `date_offer_end` date DEFAULT NULL,
  `dispatch_time_max` int DEFAULT '5',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postal_code` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `category_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `shipping_profile_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `payment_profile_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `return_profile_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `package_weight` double(15,2) DEFAULT '0.00',
  `country_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Articoli` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_fb_pixel` */

DROP TABLE IF EXISTS `ks_fb_pixel`;

CREATE TABLE `ks_fb_pixel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_company` int DEFAULT NULL,
  `id_pixel` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `start_date` date DEFAULT '1970-01-01',
  `stop_date` date DEFAULT '1970-01-01',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_fb_pixel_products` */

DROP TABLE IF EXISTS `ks_fb_pixel_products`;

CREATE TABLE `ks_fb_pixel_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int DEFAULT NULL,
  `id_fb_pixel` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_keywords` */

DROP TABLE IF EXISTS `ks_keywords`;

CREATE TABLE `ks_keywords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `word` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `counter` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ks_keywords_relations` */

DROP TABLE IF EXISTS `ks_keywords_relations`;

CREATE TABLE `ks_keywords_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword_id` int NOT NULL,
  `level_type_id` int NOT NULL,
  `level_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ks_levels` */

DROP TABLE IF EXISTS `ks_levels`;

CREATE TABLE `ks_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_relation_document_status` */

DROP TABLE IF EXISTS `ks_relation_document_status`;

CREATE TABLE `ks_relation_document_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `documentistatiid` int DEFAULT NULL,
  `doctype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_relation_payment_methods` */

DROP TABLE IF EXISTS `ks_relation_payment_methods`;

CREATE TABLE `ks_relation_payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `local_payment_method_id` int NOT NULL,
  `remote_payment_method_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `ks_updates` */

DROP TABLE IF EXISTS `ks_updates`;

CREATE TABLE `ks_updates` (
  `updates` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `listabanche` */

DROP TABLE IF EXISTS `listabanche`;

CREATE TABLE `listabanche` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Iban` varchar(30) DEFAULT '',
  `Banca` varchar(100) DEFAULT '',
  `Agenzia` varchar(100) DEFAULT '',
  `Ente` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `listini_personalizzati` */

DROP TABLE IF EXISTS `listini_personalizzati`;

CREATE TABLE `listini_personalizzati` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome_Listino` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ID_Utente` int DEFAULT '0',
  `IVA` int DEFAULT '1',
  `Data_Creazione` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Arrotonda` int DEFAULT '0' COMMENT '(0)-Niente (1)-Eccesso (-1)-Difetto',
  UNIQUE KEY `ID_Listino` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

/*Table structure for table `livellitipo` */

DROP TABLE IF EXISTS `livellitipo`;

CREATE TABLE `livellitipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `locktable` */

DROP TABLE IF EXISTS `locktable`;

CREATE TABLE `locktable` (
  `Tabella` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idTabella` int NOT NULL DEFAULT '0',
  `Utente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  UNIQUE KEY `idxUnivoco` (`Tabella`,`idTabella`,`Utente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataOra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Evento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `log_gestpay` */

DROP TABLE IF EXISTS `log_gestpay`;

CREATE TABLE `log_gestpay` (
  `idLog` int NOT NULL AUTO_INCREMENT,
  `Ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Log` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `XML` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLog`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtentiId` int DEFAULT '0',
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CognomeNome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataRegistrazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UltimoAccesso` datetime DEFAULT NULL,
  `UltimoIp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Privacy` int DEFAULT '0',
  `DataPassword` datetime DEFAULT NULL,
  `NumeroAccessi` bigint DEFAULT '0',
  `AbilitaListino` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `UtentiId` (`UtentiId`),
  KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=19801 DEFAULT CHARSET=latin1;

/*Table structure for table `logmovimentiarticoli` */

DROP TABLE IF EXISTS `logmovimentiarticoli`;

CREATE TABLE `logmovimentiarticoli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `TCId` int DEFAULT '-1',
  `Qnt` double(15,5) DEFAULT '0.00000',
  `Impegnato` int DEFAULT '0',
  `Ordinato` int DEFAULT '0',
  `Caricato` int DEFAULT '0',
  `Scaricato` int DEFAULT '0',
  `DocumentiId` int DEFAULT '0',
  `PrezzoAcquisto` double(15,3) DEFAULT '0.000',
  `PrezzoVendita` double(15,3) DEFAULT '0.000',
  `Utente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataOperazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=589732 DEFAULT CHARSET=latin1;

/*Table structure for table `logoperazioni` */

DROP TABLE IF EXISTS `logoperazioni`;

CREATE TABLE `logoperazioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NDoc` int DEFAULT '0',
  `Datadoc` date DEFAULT NULL,
  `AziendeId` int DEFAULT '0',
  `Utente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dataoperazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1164477 DEFAULT CHARSET=latin1;

/*Table structure for table `logtrigger` */

DROP TABLE IF EXISTS `logtrigger`;

CREATE TABLE `logtrigger` (
  `Tempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Testo` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `magazzini` */

DROP TABLE IF EXISTS `magazzini`;

CREATE TABLE `magazzini` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '0',
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Predefinito` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `mailconfig` */

DROP TABLE IF EXISTS `mailconfig`;

CREATE TABLE `mailconfig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeConfig` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AziendeId` int NOT NULL DEFAULT '0',
  `Smtp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Oggetto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tracking` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Contrassegno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Corriere` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Testo` mediumtext,
  `Firma` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `mailing` */

DROP TABLE IF EXISTS `mailing`;

CREATE TABLE `mailing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mailing_struttureid` int NOT NULL,
  `img_intestazione1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_intestazione1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_intestazione2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_intestazione2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_pie1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_pie1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_pie2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_pie2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `listino` int DEFAULT '1',
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descrizione` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AziendeId` int DEFAULT NULL,
  `IvaTipo` int DEFAULT '1' COMMENT '1 senza Iva 2 con Iva',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Table structure for table `mailing_articoli` */

DROP TABLE IF EXISTS `mailing_articoli`;

CREATE TABLE `mailing_articoli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mailingId` int DEFAULT NULL,
  `articoliId` int DEFAULT NULL,
  `PrezzoOfferta` double(15,3) DEFAULT '0.000',
  `Prezzo` double(15,3) DEFAULT '0.000',
  `Ordinamento` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Table structure for table `mailing_strutture` */

DROP TABLE IF EXISTS `mailing_strutture`;

CREATE TABLE `mailing_strutture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '1',
  `contenitore` longtext,
  `corpo` longtext,
  `data_creazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nome_mailing` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `anteprima_layout` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_intestazione1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_intestazione1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_intestazione2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_intestazione2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_pie1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_pie1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_pie2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_pie2` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fontcolor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `backgroundcolor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `marche` */

DROP TABLE IF EXISTS `marche`;

CREATE TABLE `marche` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Ordinamento` int NOT NULL DEFAULT '0',
  `img` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tooltip` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=latin1;

/*Table structure for table `modulistampa` */

DROP TABLE IF EXISTS `modulistampa`;

CREATE TABLE `modulistampa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeModulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `movimenticontabili` */

DROP TABLE IF EXISTS `movimenticontabili`;

CREATE TABLE `movimenticontabili` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '0',
  `Data` date NOT NULL,
  `UtenteId` int NOT NULL DEFAULT '0',
  `CausaliId` int DEFAULT '0',
  `ScadenzeId` int DEFAULT '0',
  `Descrizione` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Segno` smallint DEFAULT '-1',
  `Imponibile` double(15,3) DEFAULT '0.000',
  `Imposta` double(15,3) DEFAULT '0.000',
  `Totale` double(15,3) DEFAULT '0.000',
  `Cassa` tinyint(1) DEFAULT '0',
  `Banca` tinyint(1) DEFAULT '0',
  `Clienti` tinyint(1) DEFAULT '0',
  `Fornitore` tinyint(1) DEFAULT '0',
  `Agente` tinyint(1) DEFAULT '0',
  `BancheId` int DEFAULT '0',
  `nTitolo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dTitolo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DocumentiId` int DEFAULT '0',
  `TipoMovimento` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Movimento` (`AziendeId`,`Data`,`UtenteId`,`CausaliId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `movimentimagazzino` */

DROP TABLE IF EXISTS `movimentimagazzino`;

CREATE TABLE `movimentimagazzino` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `MovimentiTipoId` int NOT NULL DEFAULT '0',
  `ArticoliId` int NOT NULL DEFAULT '0',
  `MagazziniId` int DEFAULT '0',
  `TCId` int DEFAULT '0',
  `DataMovimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TipoDocumentiId` int DEFAULT '0',
  `DocumentiId` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269708 DEFAULT CHARSET=latin1;

/*Table structure for table `movimentitipo` */

DROP TABLE IF EXISTS `movimentitipo`;

CREATE TABLE `movimentitipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `offerte` */

DROP TABLE IF EXISTS `offerte`;

CREATE TABLE `offerte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '0',
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Immagine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  `DaListino` int DEFAULT '0',
  `AListino` int DEFAULT '0',
  `UtentiId` int DEFAULT '0',
  `QntMinima` double(15,3) DEFAULT '0.000',
  `Multipli` int DEFAULT '0',
  `Prezzo` double(15,8) DEFAULT '0.00000000',
  `Sconto` double(15,3) DEFAULT '0.000',
  `Abilitato` int DEFAULT '0',
  `Ordinamento` int DEFAULT '0',
  `Vetrina` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `DaListino` (`DaListino`) USING BTREE,
  KEY `AListino` (`AListino`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18899 DEFAULT CHARSET=latin1;

/*Table structure for table `offertedettaglio` */

DROP TABLE IF EXISTS `offertedettaglio`;

CREATE TABLE `offertedettaglio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `OfferteId` int NOT NULL DEFAULT '0',
  `MarcheId` int DEFAULT '0',
  `SettoriId` int DEFAULT '0',
  `CategorieId` int DEFAULT '0',
  `TipologieId` int DEFAULT '0',
  `GruppiId` int DEFAULT '0',
  `SottoGruppiId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `TcId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OfferteId` (`OfferteId`),
  KEY `MarcheId` (`MarcheId`),
  KEY `SettoriId` (`SettoriId`),
  KEY `CategorieId` (`CategorieId`),
  KEY `TipologieId` (`TipologieId`),
  KEY `GruppiId` (`GruppiId`),
  KEY `SottogruppiId` (`SottoGruppiId`),
  KEY `ArticoliId` (`ArticoliId`),
  KEY `TcId` (`TcId`)
) ENGINE=InnoDB AUTO_INCREMENT=26217 DEFAULT CHARSET=latin1;

/*Table structure for table `operazioni` */

DROP TABLE IF EXISTS `operazioni`;

CREATE TABLE `operazioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) NOT NULL,
  `Abilitato` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `pagamentimodalita` */

DROP TABLE IF EXISTS `pagamentimodalita`;

CREATE TABLE `pagamentimodalita` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PagamentiTipoId` int NOT NULL DEFAULT '0',
  `Ngg` int DEFAULT '0',
  `FineMese` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `pagamentitipo` */

DROP TABLE IF EXISTS `pagamentitipo`;

CREATE TABLE `pagamentitipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeID` int DEFAULT '1',
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Informazioni` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Web` int NOT NULL DEFAULT '0',
  `Ordinamento` int DEFAULT '0',
  `Predefinito` int DEFAULT '0',
  `CostoPercentuale` double(15,2) DEFAULT '0.00' COMMENT 'Spese aggiuntive in %',
  `CostoFisso` double(15,2) DEFAULT '0.00' COMMENT 'Spese aggiuntive in Euro',
  `CostoMassimo` double(15,2) DEFAULT '0.00' COMMENT 'Importo massimo pagamento accettato',
  `NumeroOrdini` int DEFAULT '0' COMMENT 'Numero minimo di ordini per poter utilizzare questo pagamento',
  `Contrassegno` int DEFAULT '0' COMMENT 'O=NO - 1=SI',
  `OnLine` int DEFAULT '0' COMMENT '0=NO - 1=IwBank - 2=PayPal - 3=BancaSella',
  `Cassa` int DEFAULT '0',
  `Banca` int DEFAULT '0',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ContoSpedizione` int DEFAULT NULL,
  `ContoSpesa` int DEFAULT NULL,
  `ContoAssicurazione` int DEFAULT NULL,
  `FE_Pagamento` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

/*Table structure for table `pagine` */

DROP TABLE IF EXISTS `pagine`;

CREATE TABLE `pagine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `Nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_esterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `html` mediumtext,
  `Ordinamento` int DEFAULT '0',
  `Abilitato` int DEFAULT '1',
  `Tipo` int DEFAULT '0' COMMENT '1-Top 2-Footer',
  `div_position` int DEFAULT '0' COMMENT 'Rappresenta la posizione del div su cui andare ad inserire il link alla pagina (DIV da 1 a 4)',
  `ordinamento_footer` int DEFAULT '0',
  `ordinamento_coupon` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Table structure for table `parametri_vb` */

DROP TABLE IF EXISTS `parametri_vb`;

CREATE TABLE `parametri_vb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `OperazioniId` int NOT NULL,
  `DocumentiTipoId` int NOT NULL,
  `UtentiId` int NOT NULL,
  `Default` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `parametristampa` */

DROP TABLE IF EXISTS `parametristampa`;

CREATE TABLE `parametristampa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `TipoDocumentoId` int DEFAULT '0',
  `Stampante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NCopie` int DEFAULT '1',
  `NCopiePdf` int DEFAULT '0',
  `NCopieHtml` int DEFAULT '0',
  `NCopieRtf` int DEFAULT '0',
  `NCopieTesto` int DEFAULT '0',
  `NCopieExcel` int DEFAULT '0',
  `Email` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `partitarioprelevato` */

DROP TABLE IF EXISTS `partitarioprelevato`;

CREATE TABLE `partitarioprelevato` (
  `pnTesteId` int NOT NULL,
  `pnNewId` int NOT NULL,
  PRIMARY KEY (`pnTesteId`),
  KEY `idx_partitarioprelevato` (`pnNewId`),
  CONSTRAINT `idx_partitarioprelevato` FOREIGN KEY (`pnNewId`) REFERENCES `pnteste` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `partners` */

DROP TABLE IF EXISTS `partners`;

CREATE TABLE `partners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `html` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ordinamento` int DEFAULT '1',
  `AziendaId` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `payment_event` */

DROP TABLE IF EXISTS `payment_event`;

CREATE TABLE `payment_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idDocumento` int DEFAULT '0',
  `Data_Evento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idTransazione` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Stato_Transazione` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

/*Table structure for table `pcmastro1` */

DROP TABLE IF EXISTS `pcmastro1`;

CREATE TABLE `pcmastro1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Codice` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tipo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `pcmastro2` */

DROP TABLE IF EXISTS `pcmastro2`;

CREATE TABLE `pcmastro2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PCMastro1` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Codice` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tipo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Table structure for table `pcmastro3` */

DROP TABLE IF EXISTS `pcmastro3`;

CREATE TABLE `pcmastro3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PCMastro2` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Codice` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tipo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

/*Table structure for table `pcmastro4` */

DROP TABLE IF EXISTS `pcmastro4`;

CREATE TABLE `pcmastro4` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PCMastro3` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Codice` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tipo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=latin1;

/*Table structure for table `pnrighe` */

DROP TABLE IF EXISTS `pnrighe`;

CREATE TABLE `pnrighe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PnTesteId` int DEFAULT NULL,
  `Scadenzeid` int DEFAULT NULL,
  `ContiId` int DEFAULT NULL,
  `UtentiId` int DEFAULT NULL,
  `DocumentiId` int DEFAULT NULL,
  `Dare` decimal(15,5) DEFAULT NULL,
  `Avere` decimal(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ch_Righe` (`PnTesteId`),
  CONSTRAINT `ch_Righe` FOREIGN KEY (`PnTesteId`) REFERENCES `pnteste` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112751 DEFAULT CHARSET=latin1;

/*Table structure for table `pnrighe2` */

DROP TABLE IF EXISTS `pnrighe2`;

CREATE TABLE `pnrighe2` (
  `id` int NOT NULL,
  `PnTesteId` int DEFAULT NULL,
  `Scadenzeid` int DEFAULT NULL,
  `ContiId` int DEFAULT NULL,
  `UtentiId` int DEFAULT NULL,
  `DocumentiId` int DEFAULT NULL,
  `Dare` double(15,5) DEFAULT NULL,
  `Avere` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `pnrigheextra` */

DROP TABLE IF EXISTS `pnrigheextra`;

CREATE TABLE `pnrigheextra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pnrigheid` int DEFAULT NULL,
  `pagamentitipoid` int DEFAULT NULL,
  `Descrizione` varchar(300) DEFAULT NULL,
  `Descrizione2` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38477 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `pnteste` */

DROP TABLE IF EXISTS `pnteste`;

CREATE TABLE `pnteste` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DataReg` date DEFAULT NULL,
  `CausaliContabiliid` int DEFAULT NULL,
  `Importo` decimal(15,5) DEFAULT NULL COMMENT 'Lordo',
  `DocumentiId` int DEFAULT NULL,
  `UtentiId` int DEFAULT NULL,
  `ContiId` int DEFAULT NULL,
  `Descrizione` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37405 DEFAULT CHARSET=latin1;

/*Table structure for table `popup` */

DROP TABLE IF EXISTS `popup`;

CREATE TABLE `popup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Azienda` int DEFAULT '0',
  `Data_Inizio` date DEFAULT NULL,
  `Data_Fine` date DEFAULT NULL,
  `Messaggio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `idAzData` (`Azienda`,`Data_Inizio`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `pos` */

DROP TABLE IF EXISTS `pos`;

CREATE TABLE `pos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomePos` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PosNumber` int NOT NULL DEFAULT '0',
  `BancaTransazione` int DEFAULT '0',
  `BancaCollegata` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `produzione` */

DROP TABLE IF EXISTS `produzione`;

CREATE TABLE `produzione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NProduzione` int NOT NULL DEFAULT '0',
  `DataProduzione` date NOT NULL,
  `pArticoliId` int NOT NULL DEFAULT '0',
  `Qnt` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `produzione_righe` */

DROP TABLE IF EXISTS `produzione_righe`;

CREATE TABLE `produzione_righe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ProduzioneId` int DEFAULT '0',
  `pArticoliId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `Qnt` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `produzione_seriali` */

DROP TABLE IF EXISTS `produzione_seriali`;

CREATE TABLE `produzione_seriali` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ProduzioneId` int NOT NULL DEFAULT '0',
  `ArticoliId` int NOT NULL DEFAULT '0',
  `Seriale` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `progressivi` */

DROP TABLE IF EXISTS `progressivi`;

CREATE TABLE `progressivi` (
  `NomeTabella` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Prog_int` int DEFAULT '1',
  `Prog_car` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`NomeTabella`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `provvigioni` */

DROP TABLE IF EXISTS `provvigioni`;

CREATE TABLE `provvigioni` (
  `idAgente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idCliente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Percentuale` float DEFAULT '0',
  `IdSubAgente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Percentuale2` float DEFAULT '0',
  PRIMARY KEY (`idAgente`,`idCliente`,`IdSubAgente`),
  KEY `idAgente` (`idAgente`),
  KEY `idCliente` (`idCliente`),
  KEY `IdSubAgente` (`IdSubAgente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pubblicita` */

DROP TABLE IF EXISTS `pubblicita`;

CREATE TABLE `pubblicita` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_Azienda` bigint DEFAULT '0',
  `data_inizio_pubblicazione` date DEFAULT NULL,
  `data_fine_pubblicazione` date DEFAULT NULL,
  `limite_click` int DEFAULT '0',
  `limite_impressioni` int DEFAULT '0',
  `id_posizione_banner` int DEFAULT '0',
  `ordinamento` int DEFAULT NULL,
  `numero_click_attuale` bigint DEFAULT '0',
  `numero_impressioni_attuale` bigint DEFAULT '0',
  `link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `titolo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descrizione` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `abilitato` int DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

/*Table structure for table `pubblicita_aziende` */

DROP TABLE IF EXISTS `pubblicita_aziende`;

CREATE TABLE `pubblicita_aziende` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Nome` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_Tipo` bigint DEFAULT '0',
  `id_Regione` bigint DEFAULT '0',
  `Logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `pubblicita_click` */

DROP TABLE IF EXISTS `pubblicita_click`;

CREATE TABLE `pubblicita_click` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_utente` bigint DEFAULT '0',
  `data_click` date NOT NULL,
  `ip_utente` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_pubblicita` bigint DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1348791 DEFAULT CHARSET=latin1;

/*Table structure for table `pubblicitav2` */

DROP TABLE IF EXISTS `pubblicitav2`;

CREATE TABLE `pubblicitav2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_Azienda` bigint DEFAULT '0',
  `data_inizio_pubblicazione` date DEFAULT NULL,
  `data_fine_pubblicazione` date DEFAULT NULL,
  `limite_click` int DEFAULT '0',
  `limite_impressioni` int DEFAULT '0',
  `id_posizione_banner` int DEFAULT '0',
  `ordinamento` int DEFAULT NULL,
  `numero_click_attuale` bigint DEFAULT '0',
  `numero_impressioni_attuale` bigint DEFAULT '0',
  `link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `img_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `titolo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descrizione` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `abilitato` int DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Table structure for table `puntifedelta` */

DROP TABLE IF EXISTS `puntifedelta`;

CREATE TABLE `puntifedelta` (
  `id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Punti` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `query_string` */

DROP TABLE IF EXISTS `query_string`;

CREATE TABLE `query_string` (
  `QString` longtext,
  `Conteggio` int DEFAULT '1',
  `Data` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `scadenziario` */

DROP TABLE IF EXISTS `scadenziario`;

CREATE TABLE `scadenziario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DataReg` date DEFAULT NULL,
  `DataScad` date DEFAULT NULL,
  `UtentiId` int DEFAULT '0',
  `ContiId` int DEFAULT '0',
  `DocumentiId` int DEFAULT '0',
  `NRata` int DEFAULT '0',
  `TotRate` int DEFAULT '0',
  `DocumentiTipoId` int DEFAULT '0',
  `Descrizione` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Dare` decimal(15,3) DEFAULT '0.000',
  `Avere` decimal(15,3) DEFAULT '0.000',
  `InfoNote` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StatoScadenzaId` int DEFAULT '0',
  `DataStato` date DEFAULT NULL,
  `PagamentiTipoId` int DEFAULT NULL,
  `cScadenze` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38507 DEFAULT CHARSET=latin1;

/*Table structure for table `schedadocumenti` */

DROP TABLE IF EXISTS `schedadocumenti`;

CREATE TABLE `schedadocumenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SchedaId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Qnt` double(15,3) DEFAULT '0.000',
  `Importo` double(15,3) DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `schedainterventoin_varianti` */

DROP TABLE IF EXISTS `schedainterventoin_varianti`;

CREATE TABLE `schedainterventoin_varianti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schedeinterventoinid` int NOT NULL,
  `Schedatipobenevarianteid` int NOT NULL,
  `Variante` varchar(50) DEFAULT NULL,
  `PrezzoManuale` double(15,3) DEFAULT NULL,
  `PrezzoManualeIvato` double(15,3) DEFAULT NULL,
  `ivavalore` double(15,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `schedatipobene` */

DROP TABLE IF EXISTS `schedatipobene`;

CREATE TABLE `schedatipobene` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `schedatipobenevariante` */

DROP TABLE IF EXISTS `schedatipobenevariante`;

CREATE TABLE `schedatipobenevariante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schedatipobeneid` int NOT NULL,
  `Variante` varchar(50) DEFAULT NULL,
  `Prezzo` double(15,3) DEFAULT '0.000',
  `Attivo` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idschedatipobene` (`schedatipobeneid`),
  CONSTRAINT `schedatipobenevariante_ibfk_1` FOREIGN KEY (`schedatipobeneid`) REFERENCES `schedatipobene` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `schedeinterventoin` */

DROP TABLE IF EXISTS `schedeinterventoin`;

CREATE TABLE `schedeinterventoin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `NumUnivoco` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NumIntervento` int DEFAULT '0',
  `DataIngresso` date DEFAULT NULL,
  `DataPrevista` date DEFAULT NULL,
  `UtentiId` int DEFAULT '0',
  `OperatoriId` int DEFAULT '0',
  `Nominativo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Piva` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cellulare` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Garanzia` int DEFAULT '0',
  `DocAcquisto` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DataDoc` date DEFAULT NULL,
  `Sms` int DEFAULT '0',
  `NumSms` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `backupdati` int DEFAULT '0',
  `elencobackup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TipoBeneId` int DEFAULT NULL,
  `Marca` int DEFAULT NULL,
  `Articolo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Seriale1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Seriale2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `InfoVarianti` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Accessori` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StatoUsura` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Difetto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Firma` mediumblob,
  `CostoMinimo` double(15,3) DEFAULT '0.000',
  `MaxSpesa` double(15,3) DEFAULT '0.000',
  `Acconto` double(15,3) DEFAULT '0.000',
  `Avviso` int DEFAULT '0',
  `Privacy` int DEFAULT '1',
  `InfoNote` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxNumUnivoco` (`NumUnivoco`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `schedeinterventoout` */

DROP TABLE IF EXISTS `schedeinterventoout`;

CREATE TABLE `schedeinterventoout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SchedaId` int DEFAULT '0',
  `DataConsegna` date DEFAULT NULL,
  `OreLavoro` int DEFAULT '0',
  `Manodopera` double(15,3) DEFAULT '0.000',
  `TotLavorazione` double(15,3) DEFAULT '0.000',
  `TotRicambi` double(15,3) DEFAULT '0.000',
  `Sconto` double(15,3) DEFAULT '0.000',
  `Arrotonda` double(15,3) DEFAULT '0.000',
  `PrezzoTotale` double(15,3) DEFAULT '0.000',
  `PersonaDifferente` int DEFAULT '0',
  `Documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Dichiarazione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DatiAnagrafici` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `schedeinterventotipodocumento` */

DROP TABLE IF EXISTS `schedeinterventotipodocumento`;

CREATE TABLE `schedeinterventotipodocumento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(20) DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `schedelavorazione` */

DROP TABLE IF EXISTS `schedelavorazione`;

CREATE TABLE `schedelavorazione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SchedaId` int DEFAULT '0',
  `StatoInterventoId` int DEFAULT '0',
  `Data` datetime DEFAULT CURRENT_TIMESTAMP,
  `OperatoriId` int DEFAULT '0',
  `InSede` int DEFAULT '1',
  `SedeEsterna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Motivazione` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Costo` double(15,3) DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Table structure for table `schedelavorazionefoto` */

DROP TABLE IF EXISTS `schedelavorazionefoto`;

CREATE TABLE `schedelavorazionefoto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SchedaId` int DEFAULT '0',
  `LinkFoto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idxSchedaId` (`SchedaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `segno` */

DROP TABLE IF EXISTS `segno`;

CREATE TABLE `segno` (
  `Segno` smallint NOT NULL DEFAULT '-1',
  `Descrizione` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Opposto` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Simbolo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SimboloOpposto` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Segno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sequence` */

DROP TABLE IF EXISTS `sequence`;

CREATE TABLE `sequence` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `seriali` */

DROP TABLE IF EXISTS `seriali`;

CREATE TABLE `seriali` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '1',
  `DocumentiId` int NOT NULL DEFAULT '0',
  `Seriale` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ArticoliId` int NOT NULL DEFAULT '0',
  `DataOperazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DocumentiRigheId` int DEFAULT NULL,
  PRIMARY KEY (`id`,`AziendeId`,`DocumentiId`,`Seriale`,`ArticoliId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `settori` */

DROP TABLE IF EXISTS `settori`;

CREATE TABLE `settori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Codice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Ordinamento` int DEFAULT '0',
  `Predefinito` int DEFAULT '0',
  `Img` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Table structure for table `sfondi` */

DROP TABLE IF EXISTS `sfondi`;

CREATE TABLE `sfondi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aziendaid` int DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `abilitato` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `slideparametri` */

DROP TABLE IF EXISTS `slideparametri`;

CREATE TABLE `slideparametri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL,
  `Testa` text,
  `Corpo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `slideshow_new` */

DROP TABLE IF EXISTS `slideshow_new`;

CREATE TABLE `slideshow_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aziendeId` int DEFAULT NULL,
  `caption` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `stop_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `slideshows` */

DROP TABLE IF EXISTS `slideshows`;

CREATE TABLE `slideshows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aziendeId` int DEFAULT NULL,
  `placeholder` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `limiteClick` int DEFAULT '0',
  `limiteImpressioni` int DEFAULT '0',
  `numeroClickAttuale` bigint DEFAULT '0',
  `numeroImpressioniAttuale` bigint DEFAULT '0',
  `titolo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descrizione` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `dataInizioPubblicazione` date DEFAULT NULL,
  `dataFinePubblicazione` date DEFAULT NULL,
  `abilitato` int DEFAULT '0',
  `Priorita` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `slideshows_parts` */

DROP TABLE IF EXISTS `slideshows_parts`;

CREATE TABLE `slideshows_parts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slideshowid` int DEFAULT NULL,
  `caption` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `startDate` date NOT NULL,
  `stopDate` date DEFAULT NULL,
  `orderPosition` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Table structure for table `social_buttons` */

DROP TABLE IF EXISTS `social_buttons`;

CREATE TABLE `social_buttons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` tinyint(1) NOT NULL,
  `social_name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `key` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `button_order` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Table structure for table `social_buttons_rules` */

DROP TABLE IF EXISTS `social_buttons_rules`;

CREATE TABLE `social_buttons_rules` (
  `company_id` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `callToAction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `buttonColor` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `position` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sottogruppi` */

DROP TABLE IF EXISTS `sottogruppi`;

CREATE TABLE `sottogruppi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategorieId` int DEFAULT '0',
  `Codice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Ordinamento` int DEFAULT '0',
  `IdPadre` int DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=latin1;

/*Table structure for table `spedizioni_gls` */

DROP TABLE IF EXISTS `spedizioni_gls`;

CREATE TABLE `spedizioni_gls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Testa` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Corpo` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Piede` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DocumentiId` int NOT NULL,
  `Inserito` int DEFAULT '0',
  `Chiuso` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `stagioni` */

DROP TABLE IF EXISTS `stagioni`;

CREATE TABLE `stagioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `statointerventi` */

DROP TABLE IF EXISTS `statointerventi`;

CREATE TABLE `statointerventi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Colore` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `statoscadenze` */

DROP TABLE IF EXISTS `statoscadenze`;

CREATE TABLE `statoscadenze` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `Stato` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Pagata` int DEFAULT '0',
  `Incassata` int DEFAULT '0',
  `Insoluta` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `strutturatabelleexcel` */

DROP TABLE IF EXISTS `strutturatabelleexcel`;

CREATE TABLE `strutturatabelleexcel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AcquistoVendita` int DEFAULT '1' COMMENT '0=Acquisto; 1=Vendita',
  `Tabella` varchar(50) DEFAULT NULL,
  `Campo` varchar(50) DEFAULT NULL,
  `Etichetta` varchar(50) DEFAULT NULL,
  `Obbligatorio` int DEFAULT '0',
  `ValoreDefault` varchar(50) DEFAULT NULL,
  `TestoDefault` varchar(50) DEFAULT NULL,
  `CollegamentoQry` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `sysappversion` */

DROP TABLE IF EXISTS `sysappversion`;

CREATE TABLE `sysappversion` (
  `AppName` varchar(50) NOT NULL,
  `AppVersion` varchar(50) DEFAULT NULL,
  `LastProcedureUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`AppName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `syshelpform` */

DROP TABLE IF EXISTS `syshelpform`;

CREATE TABLE `syshelpform` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeMaschera` varchar(100) NOT NULL,
  `Titolo` varchar(100) NOT NULL,
  `Testo` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `sysimpostazioniform` */

DROP TABLE IF EXISTS `sysimpostazioniform`;

CREATE TABLE `sysimpostazioniform` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT NULL,
  `Utente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NomeForm` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Controllo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Impostazione1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Impostazione2` int DEFAULT NULL,
  `Impostazione3` int DEFAULT NULL,
  `Impostazione4` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxImpostazioni` (`AziendeId`,`Utente`,`NomeForm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sysmenuitems` */

DROP TABLE IF EXISTS `sysmenuitems`;

CREATE TABLE `sysmenuitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SysMenuRootId` int NOT NULL DEFAULT '0',
  `NomeMaschera` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NomeMenu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Posizione` int DEFAULT '0',
  `Icona` int DEFAULT '0',
  `Proprieta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Valore` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SysMenuRootId` (`SysMenuRootId`),
  CONSTRAINT `sysmenuitems_ibfk_1` FOREIGN KEY (`SysMenuRootId`) REFERENCES `sysmenuroot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

/*Table structure for table `sysmenuroot` */

DROP TABLE IF EXISTS `sysmenuroot`;

CREATE TABLE `sysmenuroot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TitoloMenu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NomeMenu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Posizione` int DEFAULT '0',
  `Icona` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `sysparametrigriglia` */

DROP TABLE IF EXISTS `sysparametrigriglia`;

CREATE TABLE `sysparametrigriglia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Profile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `View` int DEFAULT '0',
  `AlternatingColors` int DEFAULT '0',
  `RecordNavigator` int DEFAULT '0',
  `FontName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FontSize` int DEFAULT '0',
  `FontStyle` int DEFAULT '0',
  `FocusCellFormatStyleBackColor` int DEFAULT '0',
  `FocusCellFormatStyleFontBold` int DEFAULT '0',
  `FocusCellFormatStyleForeColor` int DEFAULT '0',
  `BackColor` int DEFAULT '0',
  `RowFormatStyleBackColor` int DEFAULT '0',
  `AlternatingRowFormatStyleBackColor` int DEFAULT '0',
  `RowHeight` int DEFAULT '0',
  `GridLines` int DEFAULT '0',
  `GridLineStyle` int DEFAULT '0',
  `GridLineColor` int DEFAULT '0',
  `RootTableGridLineColor` int DEFAULT '0',
  `RootTableGridLines` int DEFAULT '0',
  `RootTableGridLineStyle` int DEFAULT '0',
  `EnterKeyBehavior` int DEFAULT '0',
  `CardViewGridlines` int DEFAULT '0',
  `HideSelection` int DEFAULT '0',
  `SelectedFormatStyleBackColor` int DEFAULT '0',
  `SelectedFormatStyleAppearance` int DEFAULT '0',
  `SelectedInactiveFormatStyleBackColor` int DEFAULT '0',
  `SelectedInactiveFormatStyleForeColor` int DEFAULT '0',
  `SelectedInactiveFormatStyleAppearance` int DEFAULT '0',
  `VisualStyle` int DEFAULT '0',
  `ShowEmptyFields` int DEFAULT '0',
  `NewRowPosition` int DEFAULT '0',
  `ColumnAutoResize` int DEFAULT '0',
  `ColumnAutoSizeMode` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sysparametristored` */

DROP TABLE IF EXISTS `sysparametristored`;

CREATE TABLE `sysparametristored` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeStore` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NomeParametro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Lunghezza` double(15,3) DEFAULT '-1.000',
  `Direzione` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`NomeStore`,`NomeParametro`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32356 DEFAULT CHARSET=latin1;

/*Table structure for table `sysprofiloutenti` */

DROP TABLE IF EXISTS `sysprofiloutenti`;

CREATE TABLE `sysprofiloutenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeProfilo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `btnName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `btnTesto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `btnTooltip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `btnTag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `btnHeight` int DEFAULT NULL,
  `btnWidth` int DEFAULT NULL,
  `btnImageNumber` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `sysvisualizzazione` */

DROP TABLE IF EXISTS `sysvisualizzazione`;

CREATE TABLE `sysvisualizzazione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '0',
  `Verticale` int DEFAULT '0',
  `Orizzontale` int DEFAULT '0',
  `Larghezza` int DEFAULT '0',
  `Altezza` int DEFAULT '0',
  `NomeForm` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `InUso` int DEFAULT '0',
  `ColoreRGB` int DEFAULT '0',
  `SfondoGriglia` int DEFAULT '0',
  `TestoGriglia` int DEFAULT '0',
  PRIMARY KEY (`id`,`AziendeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `sysvisualizzazioneiniziale` */

DROP TABLE IF EXISTS `sysvisualizzazioneiniziale`;

CREATE TABLE `sysvisualizzazioneiniziale` (
  `id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Verticale` int DEFAULT '0',
  `Orizzontale` int DEFAULT '0',
  `Larghezza` int DEFAULT '0',
  `Altezza` int DEFAULT '0',
  `NomeForm` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `InUso` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `taglie` */

DROP TABLE IF EXISTS `taglie`;

CREATE TABLE `taglie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxTaglieDescr` (`Descrizione`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `tempiconsegna` */

DROP TABLE IF EXISTS `tempiconsegna`;

CREATE TABLE `tempiconsegna` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `tempiconsegnaperlivello` */

DROP TABLE IF EXISTS `tempiconsegnaperlivello`;

CREATE TABLE `tempiconsegnaperlivello` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TempiConsegnaId` int DEFAULT NULL,
  `LivelliTipoId` int DEFAULT NULL,
  `LivelloId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1363 DEFAULT CHARSET=latin1;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `tipodocumenti` */

DROP TABLE IF EXISTS `tipodocumenti`;

CREATE TABLE `tipodocumenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MovimentiTipoId` int DEFAULT '0' COMMENT '1=Movimenta;0=Non Movimenta',
  `Segno` int DEFAULT '0' COMMENT 'Utilizzato per il carico e lo scarico del magazzino',
  `ImpegnaQnt` int DEFAULT '0',
  `ImpegnaArrivo` int DEFAULT '0',
  `Abilitato` int DEFAULT '0',
  `Web` int NOT NULL DEFAULT '0',
  `Ordinamento` int NOT NULL DEFAULT '0',
  `ContatoreId` int NOT NULL,
  `GestioneStato` int DEFAULT '0',
  `StatiId` int DEFAULT NULL,
  `CausaliContabiliId` int DEFAULT NULL,
  `Contabilita` int DEFAULT '0',
  `CausaliAspettoId` int DEFAULT NULL,
  `CausaliPortoId` int DEFAULT NULL,
  `CausaliTrasportoId` int DEFAULT NULL,
  `VettoriId` int DEFAULT NULL,
  `SegnoCont` int DEFAULT '1' COMMENT '1=Dare 0=Avere',
  `SegnoCont2` int DEFAULT '1' COMMENT 'moltiplica il totale per -1 o per 1',
  `ContoIva` int DEFAULT NULL COMMENT 'id del conto iva',
  `SegnoCont3` int DEFAULT '0' COMMENT '1=Dare 0=Avere per gestire il segno in incasso e pagamento',
  `Azzeramento` int DEFAULT '0',
  `FE_TipoDocumento` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FE_Valuta` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipodocumentistandardid` int NOT NULL DEFAULT '1',
  `GestioneArrivi` int DEFAULT '0',
  `ObbligoNumerazione` int DEFAULT '0' COMMENT 'Se impostato a 1 nei documenti dovrai impostare anche il numero documento',
  PRIMARY KEY (`id`),
  KEY `idxStatiId` (`StatiId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `tipodocumenti_fe` */

DROP TABLE IF EXISTS `tipodocumenti_fe`;

CREATE TABLE `tipodocumenti_fe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `tipodocumenticollegati` */

DROP TABLE IF EXISTS `tipodocumenticollegati`;

CREATE TABLE `tipodocumenticollegati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '0',
  `TipoDocumentiId` int DEFAULT '0',
  `CollegatoId` int DEFAULT '0',
  `DocumentiStatiId` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

/*Table structure for table `tipodocumenticontabili` */

DROP TABLE IF EXISTS `tipodocumenticontabili`;

CREATE TABLE `tipodocumenticontabili` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TipoDocumentiId` int DEFAULT '0',
  `FatturaClienti` int DEFAULT '0',
  `FatturaFornitori` int DEFAULT '0',
  `NotaCreditoClienti` int DEFAULT '0',
  `NotaCreditoFornitori` int DEFAULT '0',
  `NotaDebitoClienti` int DEFAULT '0',
  `NotaDebitoFornitori` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Table structure for table `tipodocumentisegno` */

DROP TABLE IF EXISTS `tipodocumentisegno`;

CREATE TABLE `tipodocumentisegno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TipoDocumentiId` int NOT NULL,
  `Segno` int NOT NULL DEFAULT '1' COMMENT 'Valori Ammessi 1 per il segno +; -1 per il segno -',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `tipodocumentistandard` */

DROP TABLE IF EXISTS `tipodocumentistandard`;

CREATE TABLE `tipodocumentistandard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Table structure for table `tipologie` */

DROP TABLE IF EXISTS `tipologie`;

CREATE TABLE `tipologie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategorieId` int DEFAULT '0',
  `Codice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Ordinamento` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=831 DEFAULT CHARSET=latin1;

/*Table structure for table `tipoordineweb` */

DROP TABLE IF EXISTS `tipoordineweb`;

CREATE TABLE `tipoordineweb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `triggerstatus` */

DROP TABLE IF EXISTS `triggerstatus`;

CREATE TABLE `triggerstatus` (
  `DisableTrigger` smallint NOT NULL DEFAULT '0',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `truefalsevalue` */

DROP TABLE IF EXISTS `truefalsevalue`;

CREATE TABLE `truefalsevalue` (
  `Descrizione` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Valore` int DEFAULT '0',
  PRIMARY KEY (`Descrizione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ultimocodicearticolo` */

DROP TABLE IF EXISTS `ultimocodicearticolo`;

CREATE TABLE `ultimocodicearticolo` (
  `UltimoCodice` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`UltimoCodice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `unitadimisura` */

DROP TABLE IF EXISTS `unitadimisura`;

CREATE TABLE `unitadimisura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `utenti` */

DROP TABLE IF EXISTS `utenti`;

CREATE TABLE `utenti` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int NOT NULL DEFAULT '1',
  `Codice` int DEFAULT '0',
  `UtentiTipoId` int DEFAULT '0',
  `RagioneSociale` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CognomeNome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Piva` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Indirizzo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Citta` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Provincia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cap` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CodiceFiscale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cellulare` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Msn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Skype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Fax` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Listino` int DEFAULT '1',
  `Url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Privacy` int DEFAULT '0',
  `Abilitato` int DEFAULT '1',
  `DataRegistrazione` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CanOrder` int DEFAULT '1' COMMENT 'Se l''utente può ordinare',
  `IvaTipo` int DEFAULT '1' COMMENT '1=senza iva - 2=con iva',
  `MagazziniID` int DEFAULT '1' COMMENT 'Magazzino di default',
  `InfoNote` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idEsenzioneIva` int DEFAULT NULL,
  `genera_html_mail` int DEFAULT '0',
  `NewsLetter` int DEFAULT '0',
  `genera_html_ebay` int DEFAULT '0',
  `ContiId` int DEFAULT '0' COMMENT 'Conto associato all''utente',
  `AbilitatoIvaReverseCharge` int DEFAULT '0',
  `Nazione` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email_pec` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codice_sdi` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `privato` int DEFAULT '1' COMMENT '1=Privato; 0=Pubb.Amm.',
  `Esigibilita` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id` (`Id`),
  KEY `idxUtentiTipoId` (`UtentiTipoId`),
  KEY `idx_Codice` (`Codice`),
  KEY `idx_RagioneSociale` (`RagioneSociale`)
) ENGINE=InnoDB AUTO_INCREMENT=20508 DEFAULT CHARSET=latin1;

/*Table structure for table `utentiagenti` */

DROP TABLE IF EXISTS `utentiagenti`;

CREATE TABLE `utentiagenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtentiId` int DEFAULT '0',
  `AgenteId` int DEFAULT '0',
  `Provvigione1` double(10,3) DEFAULT '0.000',
  `SubAgenteId` int DEFAULT '0',
  `Provvigione2` double(10,3) DEFAULT '0.000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxUtente` (`UtentiId`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;

/*Table structure for table `utenticontabili` */

DROP TABLE IF EXISTS `utenticontabili`;

CREATE TABLE `utenticontabili` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtenteId` int DEFAULT '0',
  `Iban` varchar(27) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abi` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cab` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CC` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cin` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Swift` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NumeroControllo` int DEFAULT '0',
  `SiglaInt` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Agenzia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Banca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Predefinito` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Abi` (`Abi`),
  KEY `Cab` (`Cab`),
  KEY `CC` (`CC`),
  KEY `id` (`UtenteId`),
  KEY `id_2` (`UtenteId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `utentiindirizzi` */

DROP TABLE IF EXISTS `utentiindirizzi`;

CREATE TABLE `utentiindirizzi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtenteId` int DEFAULT '0',
  `RagioneSocialeA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `NomeA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IndirizzoA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CittaA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CapA` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ProvinciaA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `Zona` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Predefinito` int DEFAULT '0',
  `TelefonoA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `FaxA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CellulareA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NazioneA` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UtenteUnico` (`UtenteId`,`RagioneSocialeA`,`NomeA`,`IndirizzoA`,`CittaA`,`CapA`,`ProvinciaA`,`Zona`,`Predefinito`,`TelefonoA`,`FaxA`,`CellulareA`),
  KEY `UtenteId` (`UtenteId`)
) ENGINE=InnoDB AUTO_INCREMENT=32015 DEFAULT CHARSET=latin1;

/*Table structure for table `utentirapporto` */

DROP TABLE IF EXISTS `utentirapporto`;

CREATE TABLE `utentirapporto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UtenteId` int DEFAULT '0',
  `Extra` double(15,2) DEFAULT '0.00',
  `ConOfferta` int DEFAULT '0',
  `Settore` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Fido` double(15,2) DEFAULT '0.00',
  `DataInizio` datetime DEFAULT NULL,
  `DataFine` datetime DEFAULT NULL,
  `TipoPagamento` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7086 DEFAULT CHARSET=latin1;

/*Table structure for table `utentitipo` */

DROP TABLE IF EXISTS `utentitipo`;

CREATE TABLE `utentitipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Clienti` int DEFAULT '0',
  `Fornitori` int DEFAULT '0',
  `Agenti` int DEFAULT '0',
  `Operatori` int DEFAULT '0',
  `Aggregato` int DEFAULT '0',
  `Corrispettivi` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `utility` */

DROP TABLE IF EXISTS `utility`;

CREATE TABLE `utility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `varticolilistinipromozioni_vetrina` */

DROP TABLE IF EXISTS `varticolilistinipromozioni_vetrina`;

CREATE TABLE `varticolilistinipromozioni_vetrina` (
  `id` int DEFAULT NULL,
  `visite` int DEFAULT '0',
  `Disponibilita` int DEFAULT '0',
  `DataCreazione` date DEFAULT NULL,
  `Descrizione1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Descrizione2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DescrizioneLunga` longtext,
  `ListinoUfficiale` double(15,3) DEFAULT '0.000',
  `Img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NListino` int DEFAULT '0',
  `Vetrina` int DEFAULT '0',
  `iva` int DEFAULT '0',
  `Prezzo` double(15,2) DEFAULT '0.00',
  `PrezzoIvato` double(15,2) DEFAULT '0.00',
  `InOfferta` int DEFAULT '0',
  `OfferteDataFine` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `OfferteDataInizio` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PrezzoPromo` double(23,6) DEFAULT '0.000000',
  `PrezzoPromoIvato` double(36,7) DEFAULT '0.0000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `venditabancor` */

DROP TABLE IF EXISTS `venditabancor`;

CREATE TABLE `venditabancor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VenditaBancoTId` int NOT NULL,
  `CUO` varchar(35) NOT NULL,
  `ArticoliId` int NOT NULL,
  `EAN` varchar(50) DEFAULT NULL,
  `Codice` varchar(50) DEFAULT NULL,
  `Descrizione1` varchar(255) DEFAULT NULL,
  `Qnt` double(15,5) DEFAULT NULL,
  `Prezzo` double(15,5) DEFAULT NULL,
  `sc1` double(15,5) DEFAULT NULL,
  `iva` int DEFAULT NULL,
  `Omaggio` int DEFAULT '0',
  `TipoRiga` char(1) DEFAULT 'A',
  `Seriali` varchar(5000) DEFAULT NULL,
  `tcid` int DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxUnique` (`VenditaBancoTId`,`CUO`,`Codice`,`Descrizione1`,`Qnt`,`Prezzo`,`sc1`,`iva`,`Omaggio`,`EAN`),
  KEY `idxCUO` (`CUO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `venditabancot` */

DROP TABLE IF EXISTS `venditabancot`;

CREATE TABLE `venditabancot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Cuo` varchar(35) NOT NULL,
  `OperazioniId` int NOT NULL,
  `TipoDocumentiId` int NOT NULL,
  `UtentiId` int NOT NULL,
  `PagamentiTipoId` int NOT NULL,
  `CausaliPortoId` int NOT NULL,
  `VettoriId` int NOT NULL,
  `CausaliAspettoId` int NOT NULL,
  `Colli` int DEFAULT '0',
  `TotaleDocumento` double(15,5) DEFAULT '0.00000',
  `Abbuono` double(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxCUO` (`Cuo`),
  CONSTRAINT `FKCUO` FOREIGN KEY (`Cuo`) REFERENCES `venditabancor` (`CUO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Table structure for table `vetrinainterna` */

DROP TABLE IF EXISTS `vetrinainterna`;

CREATE TABLE `vetrinainterna` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idArticolo` int NOT NULL,
  `frequenza` int DEFAULT NULL,
  `id_bollino` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=latin1;

/*Table structure for table `vettori` */

DROP TABLE IF EXISTS `vettori`;

CREATE TABLE `vettori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AziendeId` int DEFAULT '1',
  `Descrizione` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Informazioni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Abilitato` int DEFAULT '1',
  `Web` int DEFAULT '0',
  `Ordinamento` int DEFAULT '0',
  `Predefinito` int DEFAULT '0',
  `AssicurazionePercentuale` double(15,3) DEFAULT '0.000' COMMENT 'Costo assicurazione Percentuale',
  `AssicurazioneMinimo` double(15,3) DEFAULT '0.000' COMMENT 'Costo minimo assicurazione',
  `ContrassegnoPercentuale` double(15,3) DEFAULT '0.000' COMMENT 'Costo contrassegno Percentuale',
  `ContrassegnoFisso` double(15,3) DEFAULT '0.000' COMMENT 'Costo contrassegno Euro',
  `ContrassegnoMinimo` double(15,3) DEFAULT '0.000' COMMENT 'Costo minimo contrassegno',
  `Img` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CostoMinimo` double(15,3) DEFAULT '0.000',
  `Promo` int DEFAULT '0',
  `Listini_Abilitati` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Promo_Data_Inizio` date DEFAULT NULL,
  `Promo_Data_Fine` date DEFAULT NULL,
  `Link_Tracking` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Iva` int DEFAULT '-1',
  `username_sped` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password_sped` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CodiceSede` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CodiceCliente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nazione` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `piva` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ragionesociale` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Table structure for table `vettori_operazioni` */

DROP TABLE IF EXISTS `vettori_operazioni`;

CREATE TABLE `vettori_operazioni` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MarcheId` int DEFAULT '0',
  `SettoriId` int DEFAULT '0',
  `CategorieId` int DEFAULT '0',
  `TipologieId` int DEFAULT '0',
  `GruppiId` int DEFAULT '0',
  `SottogruppiId` int DEFAULT '0',
  `ArticoliId` int DEFAULT '0',
  `Listino` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Data_Inizio` date DEFAULT NULL,
  `Data_Fine` date DEFAULT NULL,
  `Operazione` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

/*Table structure for table `vettoricosti` */

DROP TABLE IF EXISTS `vettoricosti`;

CREATE TABLE `vettoricosti` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `VettoriId` int DEFAULT '0',
  `PesoMax` int DEFAULT '0' COMMENT 'Peso massimo consentito',
  `CostoFisso` double(15,2) DEFAULT '0.00' COMMENT 'Costo spedizione Euro',
  `Costo_Percentuale` double(15,2) DEFAULT '0.00',
  `Soglia_Minima` double(15,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=latin1;

/*Table structure for table `voffertearticoli` */

DROP TABLE IF EXISTS `voffertearticoli`;

CREATE TABLE `voffertearticoli` (
  `id` int DEFAULT NULL,
  `OfferteID` int DEFAULT '0',
  `OfferteDettagliId` int DEFAULT '0',
  `OfferteDescrizione` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `OfferteImmagine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `OfferteDataInizio` date DEFAULT NULL,
  `OfferteDataFine` date DEFAULT NULL,
  `OfferteDaListino` int DEFAULT '0',
  `OfferteAListino` int DEFAULT '0',
  `OfferteQntMinima` double(15,5) DEFAULT '0.00000',
  `OfferteMultipli` int DEFAULT '0',
  `OffertePrezzo` double(15,3) DEFAULT '0.000',
  `OfferteSconto` double(15,3) DEFAULT '0.000',
  KEY `OfferteID` (`OfferteID`),
  KEY `OfferteDettagliId` (`OfferteDettagliId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `id_wishlist` int NOT NULL AUTO_INCREMENT,
  `id_utente` int DEFAULT '0',
  `id_articolo` int DEFAULT '0',
  PRIMARY KEY (`id_wishlist`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `xdefault` */

DROP TABLE IF EXISTS `xdefault`;

CREATE TABLE `xdefault` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tabella` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Campo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ValoreDefault` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `zone` */

DROP TABLE IF EXISTS `zone`;

CREATE TABLE `zone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Zona` varchar(50) DEFAULT NULL,
  `Provincia` varchar(50) DEFAULT NULL,
  `Citta` varchar(50) DEFAULT NULL,
  `InfoNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8mb3;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
