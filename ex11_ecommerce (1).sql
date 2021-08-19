-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Maio-2021 às 14:20
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
-- Banco de dados: `ex11_ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aparelho`
--

CREATE TABLE `aparelho` (
  `Marca` varchar(60) NOT NULL,
  `Valor_de_venda` float NOT NULL,
  `Id_do_Aparelho` int(11) NOT NULL,
  `Id_venda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `aparelho`
--

INSERT INTO `aparelho` (`Marca`, `Valor_de_venda`, `Id_do_Aparelho`, `Id_venda`) VALUES
('Dell', 3500, 1, 3),
('Lenovo', 2200, 2, 2),
('Asus', 17000, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `assistencia`
--

CREATE TABLE `assistencia` (
  `Garantia` varchar(60) NOT NULL,
  `Id_de_Validação` int(11) NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `Id_fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `assistencia`
--

INSERT INTO `assistencia` (`Garantia`, `Id_de_Validação`, `Id_cliente`, `Id_fornecedor`) VALUES
('6 meses', 1, 1, 101),
('12 meses', 2, 1, 102),
('24 meses', 3, 1, 103);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `ID_atendimento` int(11) NOT NULL,
  `ID_cliente` int(11) NOT NULL,
  `ID_funcionario` int(11) NOT NULL,
  `Data_atendimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `atendimento`
--

INSERT INTO `atendimento` (`ID_atendimento`, `ID_cliente`, `ID_funcionario`, `Data_atendimento`) VALUES
(1, 1, 1, '2021-05-01'),
(2, 1, 3, '2021-04-07'),
(3, 1, 2, '2021-03-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Nome` varchar(60) NOT NULL,
  `Endereco` varchar(60) NOT NULL,
  `Telefone` varchar(60) NOT NULL,
  `Emali` varchar(60) NOT NULL,
  `RG` int(11) NOT NULL,
  `CPF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Nome`, `Endereco`, `Telefone`, `Emali`, `RG`, `CPF`) VALUES
('Matheus Bosco', 'rua ze', '99999999999', 'matheus@email.com', 999999999, 97979797),
('Nathan Iama', 'rua da esperança', '88888888888', 'nathanzin@email.com.br', 888888888, 98989898),
('Luciano da Rocha', 'rua são paulo', '11111111111', 'lucianocampeao@yspfc.com', 111111111, 01010101);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `Nome` varchar(60) NOT NULL,
  `Endereco` varchar(60) NOT NULL,
  `Telefone` varchar(60) NOT NULL,
  `Emali` varchar(60) NOT NULL,
  `CNPJ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`Nome`, `Endereco`, `Telefone`, `Emali`, `CNPJ`) VALUES
('Dell, Inc', 'rua dell', '9898799879', 'contato@dell.com', 220336874),
('Lenovo Group Ltd', 'rua lenovo', '4545644564', 'contato@lenovo.com', 553668741),
('AsusTek Computer Inc', 'rua asus', '1212311231', 'contato@asus.com', 1472589);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecimento`
--

CREATE TABLE `fornecimento` (
  `ID_Fornecimento` int(11) NOT NULL,
  `Id_aparelho` int(11) NOT NULL,
  `Id_fornecedor` int(11) NOT NULL,
  `ID_unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecimento`
--

INSERT INTO `fornecimento` (`ID_Fornecimento`, `Id_aparelho`, `Id_fornecedor`, `ID_unidade`) VALUES
(1, 1, 553668741, 1),
(2, 2, 963520147, 2),
(3, 3, 220336874, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `Nome` varchar(60) NOT NULL,
  `Endereco` varchar(60) NOT NULL,
  `Telefone` varchar(60) NOT NULL,
  `Emali` varchar(60) NOT NULL,
  `RG` int(11) NOT NULL,
  `CPF` int(11) NOT NULL,
  `ID_de_Contrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`Nome`, `Endereco`, `Telefone`, `Emali`, `RG`, `CPF`, `ID_de_Contrato`) VALUES
('Nathan Iama Merci', 'rua h', '123654789', 'nat@outlook.com', 9856452, 8541236, 1),
('Vinicius Solon', 'rua b', '741258963', 'solon@gmail.com', 52698741, 63584120, 2),
('Fernando Barbosa', 'rua ç', '195410236', 'fer@yahoo.com', 563201478, 895362014, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `local_de_trabalho`
--

CREATE TABLE `local_de_trabalho` (
  `ID_local_trabalho` int(11) NOT NULL,
  `ID_funcionario` int(11) NOT NULL,
  `ID_unidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `local_de_trabalho`
--

INSERT INTO `local_de_trabalho` (`ID_local_trabalho`, `ID_funcionario`, `ID_unidade`) VALUES
(1, 3, 3),
(2, 1, 2),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade_de_venda`
--

CREATE TABLE `unidade_de_venda` (
  `ID_unidade` int(11) NOT NULL,
  `CNPJ` int(11) NOT NULL,
  `Endereco` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `unidade_de_venda`
--

INSERT INTO `unidade_de_venda` (`ID_unidade`, `CNPJ`, `Endereco`) VALUES
(1, 112445778, 'lenovo.com.br'),
(2, 221445857, 'dell.com'),
(3, 22587441, 'asus.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `Id_de_Venda` int(11) NOT NULL,
  `Data_de_Venda` date NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `Id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`Id_de_Venda`, `Data_de_Venda`, `Id_cliente`, `Id_funcionario`) VALUES
(1, '2021-05-02', 630254784, 1),
(2, '2021-04-21', 85236974, 3),
(3, '2021-03-30', 985362418, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aparelho`
--
ALTER TABLE `aparelho`
  ADD PRIMARY KEY (`Id_do_Aparelho`),
  ADD KEY `FK-Venda` (`Id_venda`);

--
-- Índices para tabela `assistencia`
--
ALTER TABLE `assistencia`
  ADD PRIMARY KEY (`Id_de_Validação`),
  ADD KEY `Fk_clienteId` (`Id_cliente`),
  ADD KEY `Fk_fornecedorId` (`Id_fornecedor`);

--
-- Índices para tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`ID_atendimento`),
  ADD KEY `FK-Cliente` (`ID_cliente`),
  ADD KEY `FK-Funcionario` (`ID_funcionario`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`CNPJ`);

--
-- Índices para tabela `fornecimento`
--
ALTER TABLE `fornecimento`
  ADD PRIMARY KEY (`ID_Fornecimento`),
  ADD KEY `FK-fornecedor` (`Id_fornecedor`),
  ADD KEY `FK-UnidadeVenda` (`ID_unidade`),
  ADD KEY `FK-Aparelho` (`Id_aparelho`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`ID_de_Contrato`);

--
-- Índices para tabela `local_de_trabalho`
--
ALTER TABLE `local_de_trabalho`
  ADD PRIMARY KEY (`ID_local_trabalho`),
  ADD KEY `FK-unidadeDeVenda` (`ID_unidade`),
  ADD KEY `FK-ID_funcionario` (`ID_funcionario`);

--
-- Índices para tabela `unidade_de_venda`
--
ALTER TABLE `unidade_de_venda`
  ADD PRIMARY KEY (`ID_unidade`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`Id_de_Venda`),
  ADD KEY `FK-idCliente` (`Id_cliente`),
  ADD KEY `FK-idFuncionario` (`Id_funcionario`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aparelho`
--
ALTER TABLE `aparelho`
  ADD CONSTRAINT `FK-Venda` FOREIGN KEY (`Id_venda`) REFERENCES `venda` (`Id_de_Venda`);

--
-- Limitadores para a tabela `assistencia`
--
ALTER TABLE `assistencia`
  ADD CONSTRAINT `Fk_clienteId` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`CPF`),
  ADD CONSTRAINT `Fk_fornecedorId` FOREIGN KEY (`Id_fornecedor`) REFERENCES `fornecedor` (`CNPJ`);

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `FK-Cliente` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`CPF`),
  ADD CONSTRAINT `FK-Funcionario` FOREIGN KEY (`ID_funcionario`) REFERENCES `funcionario` (`ID_de_Contrato`);

--
-- Limitadores para a tabela `fornecimento`
--
ALTER TABLE `fornecimento`
  ADD CONSTRAINT `FK-Aparelho` FOREIGN KEY (`Id_aparelho`) REFERENCES `aparelho` (`Id_do_Aparelho`),
  ADD CONSTRAINT `FK-UnidadeVenda` FOREIGN KEY (`ID_unidade`) REFERENCES `unidade_de_venda` (`ID_unidade`),
  ADD CONSTRAINT `FK-fornecedor` FOREIGN KEY (`Id_fornecedor`) REFERENCES `fornecedor` (`CNPJ`);

--
-- Limitadores para a tabela `local_de_trabalho`
--
ALTER TABLE `local_de_trabalho`
  ADD CONSTRAINT `FK-ID_funcionario` FOREIGN KEY (`ID_funcionario`) REFERENCES `funcionario` (`ID_de_Contrato`),
  ADD CONSTRAINT `FK-unidadeDeVenda` FOREIGN KEY (`ID_unidade`) REFERENCES `unidade_de_venda` (`ID_unidade`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `FK-idCliente` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`CPF`),
  ADD CONSTRAINT `FK-idFuncionario` FOREIGN KEY (`Id_funcionario`) REFERENCES `funcionario` (`ID_de_Contrato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
