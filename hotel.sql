-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Abr-2020 às 20:27
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_acesso`
--

CREATE TABLE `nivel_acesso` (
  `id` int(100) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `nivel_acesso`
--

INSERT INTO `nivel_acesso` (`id`, `nome`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'GERENTE'),
(3, 'RECEPCIONISTA'),
(4, 'CLIENTE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
  `id` int(100) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `valor` int(10) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `desconto` double DEFAULT NULL,
  `uso` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `quarto`
--

INSERT INTO `quarto` (`id`, `nome`, `valor`, `tipo`, `desconto`, `uso`) VALUES
(1, 'Luxo', 300, 'familia', 10, 11),
(2, 'economico', 200, 'familia', 20, 3),
(3, 'suite', 400, 'sol', NULL, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorios`
--

CREATE TABLE `relatorios` (
  `id` int(100) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `relatorio` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `relatorios`
--

INSERT INTO `relatorios` (`id`, `tipo`, `relatorio`) VALUES
(1, 'financeiro', 'qwe');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `id` int(100) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` int(10) DEFAULT NULL,
  `num_q` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`id`, `nome`, `cpf`, `num_q`) VALUES
(1, '1', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `salao`
--

CREATE TABLE `salao` (
  `id` int(10) NOT NULL,
  `tamanho` double DEFAULT NULL,
  `horario` varchar(100) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `responsavel` varchar(100) DEFAULT NULL,
  `disponibilidade` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `salao`
--

INSERT INTO `salao` (`id`, `tamanho`, `horario`, `valor`, `tema`, `responsavel`, `disponibilidade`) VALUES
(1, 100, '09:00 ás 12:00', 400, 'Black_White', '2', 2),
(5, 300, '19:00 ás 22:00', 600, 'Evento', '2', 1),
(6, 100, '13:00 ás 17:00', 800, 'Casamento', '2', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(100) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `horario` time(4) DEFAULT NULL,
  `desconto` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `nome`, `preco`, `tipo`, `horario`, `desconto`) VALUES
(1, 'turismo', 100, 'familia', '09:00:00.0000', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cpf` int(10) NOT NULL,
  `rg` int(10) DEFAULT NULL,
  `horario` time(6) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `telefone` int(10) DEFAULT NULL,
  `nivel_de_acesso` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `login`, `senha`, `email`, `cpf`, `rg`, `horario`, `endereco`, `nome`, `valor`, `telefone`, `nivel_de_acesso`) VALUES
(1, '1', '1', '1', 1, 1, NULL, NULL, NULL, 1300, NULL, 1),
(2, '2', '2', '2', 2, 2, NULL, NULL, NULL, 1300, NULL, 2),
(3, '3', '3', '4', 4, 4, NULL, NULL, NULL, 12000, NULL, 3),
(5, '4', '4', NULL, 1, NULL, NULL, NULL, '1', 0, NULL, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relatorios`
--
ALTER TABLE `relatorios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_q` (`num_q`);

--
-- Indexes for table `salao`
--
ALTER TABLE `salao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`cpf`),
  ADD KEY `nivel_de_acesso` (`nivel_de_acesso`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quarto`
--
ALTER TABLE `quarto`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salao`
--
ALTER TABLE `salao`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`num_q`) REFERENCES `quarto` (`id`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`nivel_de_acesso`) REFERENCES `nivel_acesso` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
