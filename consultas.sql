-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Maio-2021 às 17:57
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `consultas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `codigoconvenio` int(11) NOT NULL,
  `numeropaciente` int(11) NOT NULL,
  `CRM` int(11) NOT NULL,
  `dataHora` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`codigoconvenio`, `numeropaciente`, `CRM`, `dataHora`) VALUES
(1, 1, 3, '2021-03-02'),
(1, 5, 1, '2021-05-26'),
(2, 3, 3, '2021-05-19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `convenio`
--

CREATE TABLE `convenio` (
  `codigoconvenio` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `convenio`
--

INSERT INTO `convenio` (`codigoconvenio`, `nome`) VALUES
(1, 'UNIMED'),
(2, 'Samaritano'),
(3, 'Vera Cruz');

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

CREATE TABLE `medico` (
  `CRM` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Especialidade` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `medico`
--

INSERT INTO `medico` (`CRM`, `Nome`, `Especialidade`) VALUES
(1, 'Trophozilda da Silva', 'Cardiologista'),
(2, 'Baciclides Atanazio', 'Infectologista'),
(3, 'Epaminondas Soares', 'Otorrinolaringologista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `codigoconvenio` int(11) NOT NULL,
  `numeropaciente` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`codigoconvenio`, `numeropaciente`, `nome`) VALUES
(1, 1, 'Edward cullen'),
(1, 2, 'Anderson Barbosa'),
(1, 5, 'Valessa Maria de Souza'),
(2, 3, 'Andressa Villar'),
(3, 4, 'Maria Andressa');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`codigoconvenio`,`numeropaciente`,`CRM`,`dataHora`),
  ADD KEY `FK-medico` (`CRM`);

--
-- Índices para tabela `convenio`
--
ALTER TABLE `convenio`
  ADD PRIMARY KEY (`codigoconvenio`);

--
-- Índices para tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`CRM`);

--
-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`codigoconvenio`,`numeropaciente`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `FK-medico` FOREIGN KEY (`CRM`) REFERENCES `medico` (`CRM`),
  ADD CONSTRAINT `FK-paciente` FOREIGN KEY (`codigoconvenio`,`numeropaciente`) REFERENCES `paciente` (`codigoconvenio`, `numeropaciente`);

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `Fk-convenio` FOREIGN KEY (`codigoconvenio`) REFERENCES `convenio` (`codigoconvenio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
