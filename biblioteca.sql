-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 31-Out-2019 às 23:43
-- Versão do servidor: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id`, `nome`, `sobrenome`) VALUES
(1, 'Daniel', 'Barret'),
(2, 'Gerald', 'Carter'),
(3, 'Mark', 'Sobell'),
(4, 'William', 'Stanek'),
(5, 'Richard', 'Blum');

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id`, `nome`) VALUES
(1, 'Prentice Hall'),
(2, 'O´Reilly'),
(3, 'Microsoft Press'),
(4, 'Wiley');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `data_pub` date DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `editora_id` int(11) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id`, `nome`, `isbn`, `data_pub`, `preco`, `editora_id`, `autor_id`) VALUES
(1, 'Linux Command Line and Shell Scripting', '143856969', '2009-12-21', '68.35', 1, 4),
(2, 'SSH, the Secure Shell', '127658789', '2009-12-21', '58.30', 1, 2),
(3, 'Using Samba', '123856789', '2000-12-21', '61.45', 2, 2),
(4, 'Fedora and Red Hat Linux', '123346789', '2010-11-01', '62.24', 3, 1),
(5, 'Windows Server 2012 Inside Out', '123356789', '2004-05-17', '66.80', 4, 3),
(6, 'Microsoft Exchange Server 2010', '123366789', '2000-12-21', '45.30', 4, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `editora_id` (`editora_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `editora`
--
ALTER TABLE `editora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `livro`
--
ALTER TABLE `livro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`editora_id`) REFERENCES `editora` (`id`),
  ADD CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



/*SELECT nome FROM editora WHERE nome REGEXP'[y]$'
SELECT nome FROM livro WHERE nome REGEXP '^[US]'
SELECT nome FROM autor WHERE sobrenome REGEXP'^[S]\So'
SELECT nome, isbn FROM livro WHERE isbn REGEXP'^[1]\23'
SELECT nome FROM autor WHERE nome REGEXP'^[^LM]' */