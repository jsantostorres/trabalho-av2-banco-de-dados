CREATE TABLE evento (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100),
    dataInicio DATE,
    duracao VARCHAR(50),
    dataFim DATE,
    endereco VARCHAR(100),
    quantArtistas INT,
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE artista (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    playlist VARCHAR(254),
    genero VARCHAR(100),
    eventoID INT,
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (eventoID) REFERENCES evento (id)
);

CREATE TABLE participacao (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    artistaID INT,
    eventoID INT,
    FOREIGN KEY (artistaID) REFERENCES artista (id),
    FOREIGN KEY (eventoID) REFERENCES evento (id),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE funcionario (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    cargo VARCHAR(50) NOT NULL,
    salario DOUBLE,
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE funcionario_evento (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    eventoID INT,
    funcionarioID INT,
    FOREIGN KEY (eventoID) REFERENCES evento (id),
    FOREIGN KEY (funcionarioID) REFERENCES funcionario (id),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ingresso (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    valor DOUBLE,
    assento VARCHAR(10),
    dataShow DATE,
    duracao VARCHAR(50),
    eventoID INT,
    FOREIGN KEY (eventoID) REFERENCES evento (id),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE cliente (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100),
    idade INT,
    cpf CHAR(14),
    telefone VARCHAR(14),
    email VARCHAR(100),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE compra_venda (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    metodoPagamento VARCHAR(50),
    clienteID INT,
    funcionarioID INT,
    ingressoID INT,
    FOREIGN KEY (clienteID) REFERENCES cliente (id),
    FOREIGN KEY (funcionarioID) REFERENCES funcionario (id),
    FOREIGN KEY (ingressoID) REFERENCES ingresso (id),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- USE sistemas_de_eventos_musicais;

SHOW TABLES;

DESCRIBE ingresso;
DESCRIBE evento;

ALTER TABLE ingresso ADD tipo BOOL;
ALTER TABLE ingresso ADD status BOOL;

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Lollapalooza",
    "2026-03-20",
    "3 dias",
    "2026-03-22",
    "Autódromo de Interlagos, São Paulo",
    15
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Bainha de Facão",
    "2026-04-11",
    "1 dia",
    "2026-04-11",
    "Discodelia - Pub & Records",
    7
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Nhl Festival 18",
    "2026-05-22",
    "1 dia",
    "2026-05-22",
    "Discodelia - Pub & Records",
    4
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Nhl Emo Fest",
    "2026-07-05",
    "1 dia",
    "2026-07-22",
    "Discodelia - Pub & Records",
    3
);

-- USE sistemas_de_eventos_musicais;

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Festival de Verão Salvador 2026",
    "2026-01-24",
    "2 dias",
    "2026-01-25",
    "Arena Festival - Wet'n Wild, Avenida Paralela",
    14
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"The Black Parade 2026 Stadium Tour",
    "2026-02-05",
    "2 dias",
    "2026-02-06",
    "Allianz Parque, São Paulo",
    2
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"DTMF World Tour",
    "2026-02-20",
    "2 dias",
    "2026-02-21",
    "Allianz Parque, São Paulo",
    1
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"PWR UP TOUR",
    "2026-02-24",
    "1 dia",
    "2026-02-24",
    "Estádio MorumBIS, São Paulo",
    2
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"PWR UP TOUR",
    "2026-02-28",
    "1 dia",
    "2026-02-28",
    "Estádio MorumBIS, São Paulo",
    2
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"PWR UP TOUR",
    "2026-03-04",
    "1 dia",
    "2026-03-04",
    "Estádio MorumBIS, São Paulo",
    2
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Monsters of Rock 2026",
    "2026-04-04",
    "1 dia",
    "2026-04-04",
    "Allianz Parque, São Paulo",
    7
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Coolritiba 2026",
    "2026-05-23",
    "1 dia",
    "2026-05-23",
    "Pedreira Paulo Leminski, Curitiba - PR",
    21
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"João Rock",
    "2026-08-01",
    "1 dia",
    "2026-08-01",
    "Parque Permanente de Exposições, Ribeirão Preto",
    27
);

INSERT INTO evento (nome, dataInicio, duracao, dataFim, endereco, quantArtistas) VALUES (
	"Rock in Rio",
    "2026-09-04",
    "7 dias",
    "2026-09-13",
    "Parque dos Atletas, Rio de Janeiro",
    91
);
-- insert clientes
INSERT INTO cliente (nome, idade, cpf, telefone, email) VALUES 
('João Santos', 25, '111.222.333-44', '(11)91111-1111', 'joao.santos@email.com'),
('Mariana Lima', 22, '222.333.444-55', '(71)92222-2222', 'mariana.lima@email.com'),
('Carlos Eduardo', 30, '333.444.555-66', '(21)93333-3333', 'carlos.ed@email.com'),
('Ana Paula', 28, '444.555.666-77', '(31)94444-4444', 'ana.paula@email.com'),
('Pedro Henrique', 35, '555.666.777-88', '(41)95555-5555', 'pedro.h@email.com'),
('Beatriz Costa', 19, '666.777.888-99', '(51)96666-6666', 'bia.costa@email.com'),
('Lucas Fernandes', 27, '777.888.999-00', '(61)97777-7777', 'lucas.fer@email.com'),
('Sofia Martins', 24, '888.999.000-11', '(81)98888-8888', 'sofia.m@email.com'),
('Tiago Ribeiro', 32, '999.000.111-22', '(91)99999-9999', 'tiago.rib@email.com'),
('Camila Alves', 26, '000.111.222-33', '(19)90000-0000', 'camila.alves@email.com');
--insert funcionarios
INSERT INTO funcionario (nome, idade, cargo, salario) VALUES 
('Marcos Silva', 40, 'Gerente de Bilheteira', 4500.00),
('Juliana Mendes', 29, 'Vendedora', 2500.00),
('Roberto Dias', 35, 'Vendedor', 2500.00),
('Fernanda Gomes', 26, 'Atendimento', 2200.00),
('Ricardo Sousa', 33, 'Supervisor de Vendas', 3500.00),
('Cláudia Rocha', 42, 'Gerente de Operações', 5000.00),
('Fábio Castro', 23, 'Vendedor', 2500.00),
('Amanda Nunes', 31, 'Vendedora VIP', 3000.00),
('Diego Monteiro', 28, 'Suporte Técnico', 2800.00),
('Letícia Carvalho', 25, 'Atendimento', 2200.00);


-- update sugestão

UPDATE evento 
SET dataFim = '2026-03-24' 
WHERE id = 1;

UPDATE evento 
SET quantArtistas = 16 
WHERE nome = 'Lollapalooza';

-- select sugestão
-- Consultas Simples
SELECT nome, dataInicio, dataFim 
FROM evento;

SELECT nome, genero 
FROM artista 
WHERE idade > 30;

SELECT e.nome, l.nome, l.endereco 
FROM evento e
JOIN local l ON e.localID = l.id;

-- Consultas Complexas

SELECT c.nome, i.assento, i.valor, cv.metodoPagamento 
FROM compra_venda cv
JOIN cliente c ON cv.clienteID = c.id
JOIN ingresso i ON cv.ingressoID = i.id;

SELECT eventoID, COUNT(id) 
FROM ingresso 
GROUP BY eventoID;

SELECT e.nome, SUM(i.valor) 
FROM compra_venda cv
JOIN ingresso i ON cv.ingressoID = i.id
JOIN evento e ON i.eventoID = e.id
GROUP BY e.nome;
