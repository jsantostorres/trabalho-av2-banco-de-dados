CREATE TABLE evento (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100),
    data_inicio DATE,
    duracao VARCHAR(50),
    data_fim DATE,
    endereco VARCHAR(100),
    quant_artistas INT,
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE artista (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    repertorio_musical VARCHAR(254),
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
    data_show DATE,
    duracao VARCHAR(50),
    tipo BOOL,
    status BOOL,
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
    metodo_pagamento VARCHAR(50),
    clienteID INT,
    funcionarioID INT,
    ingressoID INT,
    FOREIGN KEY (clienteID) REFERENCES cliente (id),
    FOREIGN KEY (funcionarioID) REFERENCES funcionario (id),
    FOREIGN KEY (ingressoID) REFERENCES ingresso (id),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE evento RENAME COLUMN duracao TO duracao_dias;
ALTER TABLE evento MODIFY COLUMN duracao_dias INT;

-- insert eventos
INSERT INTO evento (nome, data_inicio, duracao_dias, data_fim, endereco, quant_artistas) VALUES
("Festival Verão Bahia", "2026-01-10", 3, "2026-01-12", "Salvador - BA, Brasil", 6),
("Rock na Praia", "2026-02-05", 2, "2026-02-06", "Florianópolis - SC, Brasil", 4),
("Sertanejo Prime", "2026-03-15", 1, "2026-03-15", "Goiânia - GO, Brasil", 3),
("Noite do Samba", "2026-04-02", 1, "2026-04-02", "Rio de Janeiro - RJ, Brasil", 5),
("Festival de Jazz & Blues", "2026-04-20", 2, "2026-04-21", "Campos do Jordão - SP, Brasil", 4),
("Eletro Beats Festival", "2026-05-10", 3, "2026-05-12", "São Paulo - SP, Brasil", 7),
("Arraiá Musical", "2026-06-20", 2, "2026-06-21", "Caruaru - PE, Brasil", 6),
("Forró das Antigas", "2026-06-25", 1, "2026-06-25", "Campina Grande - PB, Brasil", 3),
("Indie Music Fest", "2026-07-08", 2, "2026-07-09", "Curitiba - PR, Brasil", 5),
("Hip Hop Nation", "2026-08-12", 1, "2026-08-12", "São Paulo - SP, Brasil", 4),
("Pagode & Cia", "2026-09-03", 1, "2026-09-03", "Belo Horizonte - MG, Brasil", 4),
("Festival Gospel Brasil", "2026-09-18", 2, "2026-09-19", "Brasília - DF, Brasil", 6),
("Clássicos do Rock", "2026-10-05", 2, "2026-10-06", "Porto Alegre - RS, Brasil", 5),
("Axé Bahia Fest", "2026-11-10", 3, "2026-11-12", "Salvador - BA, Brasil", 8),
("Pop Explosion", "2026-11-25", 1, "2026-11-25", "Rio de Janeiro - RJ, Brasil", 4),
("Festival Multicultural", "2026-12-05", 3, "2026-12-07", "Recife - PE, Brasil", 7),
("Noite Eletrônica", "2026-12-12", 1, "2026-12-12", "Balneário Camboriú - SC, Brasil", 3),
("Réveillon Musical", "2026-12-30", 2, "2026-12-31", "Fortaleza - CE, Brasil", 6);

-- insert artistas
INSERT INTO artista (nome, idade, repertorio_musical, genero, eventoID) VALUES
('Brenda Luz', 27, 'MPB com influências de samba', 'MPB', 1),
('Caio Ribeiro', 35, 'Bossa nova e clássicos brasileiros', 'MPB', 1),
('Daniela Prado', 31, 'MPB romântica', 'MPB', 1),
('Felipe Nogueira', 29, 'MPB moderna autoral', 'MPB', 1),
('Banda Solar', 26, 'Pop rock animado', 'Pop Rock', 2),
('Julio César', 33, 'Pop internacional acústico', 'Pop', 2),
('Banda Fúria', 28, 'Rock pesado autoral', 'Rock', 3),
('Roberta Dias', 37, 'Sertanejo raiz feminino', 'Sertanejo', 4),
('Henrique Lopes', 41, 'Moda de viola tradicional', 'Sertanejo', 4),
('Trio Nordestino Raiz', 45, 'Forró tradicional instrumental', 'Forró', 5),
('DJ Flash', 34, 'EDM e remix de hits', 'Eletrônica', 6),
('MC Bruninho', 22, 'Funk paulista', 'Funk', 6),
('DJ Carla', 30, 'House e dance', 'Eletrônica', 6),
('MC Léo', 25, 'Funk consciente', 'Funk', 6),
('Grupo Raiz do Samba', 39, 'Samba tradicional', 'Samba', 7),
('Quarteto Azul', 36, 'Jazz instrumental moderno', 'Jazz', 8),
('DJ Wave', 31, 'Tech house', 'Eletrônica', 9),
('DJ Luna', 27, 'Progressive house', 'Eletrônica', 9),
('DJ Sky', 29, 'Electro house', 'Eletrônica', 9),
('DJ Fire', 35, 'Techno industrial', 'Eletrônica', 9),
('Banda Axé Power', 38, 'Axé animado carnaval', 'Axé', 10),
('Tati Bahia', 33, 'Axé e pop baiano', 'Axé', 10),
('Swing do Pelô', 40, 'Pagodão baiano', 'Axé', 10),
('Axé Mix', 36, 'Clássicos do axé', 'Axé', 10),
('Banda Energia', 37, 'Axé elétrico', 'Axé', 10),
('MC Raiz', 28, 'Rap underground', 'Hip Hop/Rap', 11),
('Banda Aurora', 26, 'Indie rock nacional', 'Indie', 12),
('Luna Reis', 24, 'Folk alternativo', 'Indie/Folk', 12),
('Old School Band', 45, 'Rock clássico anos 70', 'Rock Clássico', 13),
('Ministério Vida', 42, 'Louvor congregacional', 'Gospel', 14),
('Cantora Sara', 34, 'Gospel contemporâneo', 'Gospel', 14),
('Pop Stars BR', 23, 'Pop dançante', 'Pop', 15),
('Kelly Moraes', 29, 'Pop romântico', 'Pop', 15),
('Dance Crew', 27, 'Pop eletrônico', 'Pop', 15),
('Vitor Klein', 31, 'Pop internacional', 'Pop', 15),
('Fusion Recife', 38, 'Mistura de ritmos brasileiros', 'MPB', 16),
('Ritmo Livre', 35, 'World music', 'MPB', 16),
('Coletivo Som', 33, 'Experimental brasileiro', 'MPB', 16),
('Grupo Cultural PE', 41, 'Regional nordestino', 'MPB', 16),
('Batida Urbana', 28, 'Mistura urbana', 'Hip Hop', 16),
('Nação Musical', 37, 'Afro-brasileiro', 'MPB', 16),
('Som Brasilis', 39, 'Instrumental brasileiro', 'MPB', 16),
('DJ Night', 32, 'Eletrônica noturna', 'Eletrônica', 17),
('DJ Vibe', 29, 'Dance music', 'Eletrônica', 17),
('DJ ElectroMax', 34, 'EDM', 'Eletrônica', 17),
('Banda Virada', 40, 'Hits variados ao vivo', 'Pop', 18),
('Grupo Festa', 36, 'Música para eventos', 'Pop', 18),
('DJ Celebration', 33, 'Remixes festivos', 'Eletrônica', 18),
('Cantor Lucas', 28, 'Pop nacional', 'Pop', 18),
('Energia Show', 38, 'Show ao vivo animado', 'Pop', 18),
('Banda Réveillon', 42, 'Clássicos e atuais', 'Pop', 18);

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

-- insert funcionarios
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
SET data_fim = '2026-03-24' 
WHERE id = 1;

UPDATE evento 
SET quant_artistas = 9
WHERE nome = 'Festival Verão Bahia';

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
