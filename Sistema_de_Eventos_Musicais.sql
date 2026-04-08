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

SELECT * FROM evento;
