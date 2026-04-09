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
