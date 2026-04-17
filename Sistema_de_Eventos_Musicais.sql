CREATE TABLE evento (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100),
    data_inicio DATE,
    duracao VARCHAR(50), -- duracao_dias INT
    data_fim DATE,
    endereco VARCHAR(100),
    quant_artistas INT,
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE artista (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100) NOT NULL,
    aniver DATE NOT NULL,
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
    aniver DATE,
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
    tipo BOOL, -- is_vip
    status BOOL, -- is_disponivel
    eventoID INT,
    FOREIGN KEY (eventoID) REFERENCES evento (id),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE cliente (
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100),
    aniver DATE NOT NULL,
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
    ingressoID INT UNIQUE,
    FOREIGN KEY (clienteID) REFERENCES cliente (id),
    FOREIGN KEY (funcionarioID) REFERENCES funcionario (id),
    FOREIGN KEY (ingressoID) REFERENCES ingresso (id),
    createAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updateAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE evento RENAME COLUMN duracao TO duracao_dias;
ALTER TABLE evento MODIFY COLUMN duracao_dias INT;
ALTER TABLE ingresso RENAME COLUMN tipo TO is_vip;
ALTER TABLE ingresso RENAME COLUMN status TO is_disponivel;

-- insert eventos
INSERT INTO evento (nome, data_inicio, duracao_dias, data_fim, endereco, quant_artistas) VALUES
("Festival Verão Bahia", "2026-01-10", 3, "2026-01-12", "Salvador - BA, Brasil", 6), -- 1
("Rock na Praia", "2026-02-05", 2, "2026-02-06", "Florianópolis - SC, Brasil", 4), -- 2
("Sertanejo Prime", "2026-03-15", 1, "2026-03-15", "Goiânia - GO, Brasil", 3), -- 3
("Noite do Samba", "2026-04-02", 1, "2026-04-02", "Rio de Janeiro - RJ, Brasil", 5), -- 4
("Festival de Jazz & Blues", "2026-04-20", 2, "2026-04-21", "Campos do Jordão - SP, Brasil", 4), -- 5
("Eletro Beats Festival", "2026-05-10", 3, "2026-05-12", "São Paulo - SP, Brasil", 7), -- 6
("Arraiá Musical", "2026-06-20", 2, "2026-06-21", "Caruaru - PE, Brasil", 6), -- 7
("Forró das Antigas", "2026-06-25", 1, "2026-06-25", "Campina Grande - PB, Brasil", 3), -- 8
("Indie Music Fest", "2026-07-08", 2, "2026-07-09", "Curitiba - PR, Brasil", 5), -- 9
("Hip Hop Nation", "2026-08-12", 1, "2026-08-12", "São Paulo - SP, Brasil", 4), -- 10
("Pagode & Cia", "2026-09-03", 1, "2026-09-03", "Belo Horizonte - MG, Brasil", 4), -- 11
("Festival Gospel Brasil", "2026-09-18", 2, "2026-09-19", "Brasília - DF, Brasil", 6), -- 12
("Clássicos do Rock", "2026-10-05", 2, "2026-10-06", "Porto Alegre - RS, Brasil", 5), -- 13
("Axé Bahia Fest", "2026-11-10", 3, "2026-11-12", "Salvador - BA, Brasil", 8), -- 14
("Pop Explosion", "2026-11-25", 1, "2026-11-25", "Rio de Janeiro - RJ, Brasil", 4), -- 15
("Festival Multicultural", "2026-12-05", 3, "2026-12-07", "Recife - PE, Brasil", 7), -- 16
("Noite Eletrônica", "2026-12-12", 1, "2026-12-12", "Balneário Camboriú - SC, Brasil", 3), -- 17
("Réveillon Musical", "2026-12-30", 2, "2026-12-31", "Fortaleza - CE, Brasil", 6); -- 18

-- insert artistas
INSERT INTO artista (nome, aniver, repertorio_musical, genero, eventoID) VALUES
('Brenda Luz', '1999-02-12', 'MPB com influências de samba', 'MPB', 1), -- 1
('Caio Ribeiro', '1991-03-05', 'Bossa nova e clássicos brasileiros', 'MPB', 1), -- 2
('Daniela Prado', '1995-01-22', 'MPB romântica', 'MPB', 1), -- 3
('Felipe Nogueira', '1997-04-09', 'MPB moderna autoral', 'MPB', 1), -- 4
('Banda Solar', '2000-03-18', 'Pop rock animado', 'Pop Rock', 2), -- 5
('Julio César', '1993-02-27', 'Pop internacional acústico', 'Pop', 2), -- 6
('Banda Fúria', '1998-12-14', 'Rock pesado autoral', 'Rock', 3), -- 7
('Roberta Dias', '1989-04-03', 'Sertanejo raiz feminino', 'Sertanejo', 4), -- 8
('Henrique Lopes', '1985-01-25', 'Moda de viola tradicional', 'Sertanejo', 4), -- 9
('Trio Nordestino Raiz', '1981-02-10', 'Forró tradicional instrumental', 'Forró', 5), -- 10
('DJ Flash', '1992-12-07', 'EDM e remix de hits', 'Eletrônica', 6), -- 11
('MC Bruninho', '2004-01-11', 'Funk paulista', 'Funk', 6), -- 12
('DJ Carla', '1996-03-30', 'House e dance', 'Eletrônica', 6), -- 13
('MC Léo', '2001-02-21', 'Funk consciente', 'Funk', 6), -- 14
('Grupo Raiz do Samba', '1987-01-15', 'Samba tradicional', 'Samba', 7), -- 15
('Quarteto Azul', '1990-11-08', 'Jazz instrumental moderno', 'Jazz', 8), -- 16
('DJ Wave', '1995-03-19', 'Tech house', 'Eletrônica', 9), -- 17
('DJ Luna', '1999-02-06', 'Progressive house', 'Eletrônica', 9), -- 18
('DJ Sky', '1997-10-13', 'Electro house', 'Eletrônica', 9), -- 19
('DJ Fire', '1991-08-02', 'Techno industrial', 'Eletrônica', 9), -- 20
('Banda Axé Power', '1988-05-17', 'Axé animado carnaval', 'Axé', 10), -- 21
('Tati Bahia', '1993-02-28', 'Axé e pop baiano', 'Axé', 10), -- 22
('Swing do Pelô', '1986-08-09', 'Pagodão baiano', 'Axé', 10), -- 23
('Axé Mix', '1990-09-11', 'Clássicos do axé', 'Axé', 10), -- 24
('Banda Energia', '1989-03-01', 'Axé elétrico', 'Axé', 10), -- 25
('MC Raiz', '1998-01-20', 'Rap underground', 'Hip Hop/Rap', 11), -- 26
('Banda Aurora', '2000-07-07', 'Indie rock nacional', 'Indie', 12), -- 27
('Luna Reis', '2002-03-16', 'Folk alternativo', 'Indie/Folk', 12), -- 28
('Old School Band', '1981-01-12', 'Rock clássico anos 70', 'Rock Clássico', 13), -- 29
('Ministério Vida', '1984-04-05', 'Louvor congregacional', 'Gospel', 14), -- 30
('Cantora Sara', '1992-04-18', 'Gospel contemporâneo', 'Gospel', 14), -- 31
('Pop Stars BR', '2003-03-27', 'Pop dançante', 'Pop', 15), -- 32
('Kelly Moraes', '1997-08-04', 'Pop romântico', 'Pop', 15), -- 33
('Dance Crew', '1999-05-10', 'Pop eletrônico', 'Pop', 15), -- 34
('Vitor Klein', '1995-03-29', 'Pop internacional', 'Pop', 15), -- 35
('Fusion Recife', '1988-01-08', 'Mistura de ritmos brasileiros', 'MPB', 16), -- 36
('Ritmo Livre', '1991-06-14', 'World music', 'MPB', 16), -- 37
('Coletivo Som', '1993-07-22', 'Experimental brasileiro', 'MPB', 16), -- 38
('Grupo Cultural PE', '1985-01-03', 'Regional nordestino', 'MPB', 16), -- 39
('Batida Urbana', '1998-02-11', 'Mistura urbana', 'Hip Hop', 16), -- 40
('Nação Musical', '1989-10-25', 'Afro-brasileiro', 'MPB', 16), -- 41
('Som Brasilis', '1987-12-06', 'Instrumental brasileiro', 'MPB', 16), -- 42
('DJ Night', '1994-02-17', 'Eletrônica noturna', 'Eletrônica', 17), -- 43
('DJ Vibe', '1997-03-21', 'Dance music', 'Eletrônica', 17), -- 44
('DJ ElectroMax', '1992-11-09', 'EDM', 'Eletrônica', 17), -- 45
('Banda Virada', '1986-02-13', 'Hits variados ao vivo', 'Pop', 18), -- 46
('Grupo Festa', '1990-03-28', 'Música para eventos', 'Pop', 18), -- 47
('DJ Celebration', '1993-02-04', 'Remixes festivos', 'Eletrônica', 18), -- 48
('Cantor Lucas', '1998-09-15', 'Pop nacional', 'Pop', 18), -- 49
('Energia Show', '1988-09-07', 'Show ao vivo animado', 'Pop', 18), -- 50
('Banda Réveillon', '1984-12-19', 'Clássicos e atuais', 'Pop', 18); -- 51

-- insert participações
INSERT INTO participacao (artistaID, eventoID) VALUES
(1, 1), (2, 1), (3, 1), (4, 1),
(5, 2), (6, 2),
(7, 3),
(8, 4), (9, 4),
(10, 5),
(11, 6), (12, 6), (13, 6), (14, 6),
(15, 7),
(16, 8),
(17, 9), (18, 9), (19, 9), (20, 9),
(21, 10), (22, 10), (23, 10), (24, 10), (25, 10),
(26, 11),
(27, 12), (28, 12),
(29, 13),
(30, 14), (31, 14),
(32, 15), (33, 15), (34, 15), (35, 15),
(36, 16), (37, 16), (38, 16), (39, 16), (40, 16), (41, 16), (42, 16),
(43, 17), (44, 17), (45, 17),
(46, 18), (47, 18), (48, 18), (49, 18), (50, 18), (51, 18);

-- insert clientes
INSERT INTO cliente (nome, aniver, cpf, telefone, email) VALUES 
('João Santos', '2000-03-10', '111.222.333-44', '(11)91111-1111', 'joao.santos@email.com'),
('Mariana Lima', '2003-09-25', '222.333.444-55', '(71)92222-2222', 'mariana.lima@email.com'),
('Carlos Eduardo', '1996-01-18', '333.444.555-66', '(21)93333-3333', 'carlos.ed@email.com'),
('Ana Paula', '1997-11-02', '444.555.666-77', '(31)94444-4444', 'ana.paula@email.com'),
('Pedro Henrique', '1991-04-01', '555.666.777-88', '(41)95555-5555', 'pedro.h@email.com'),
('Beatriz Costa', '2006-12-12', '666.777.888-99', '(51)96666-6666', 'bia.costa@email.com'),
('Lucas Fernandes', '1999-02-27', '777.888.999-00', '(61)97777-7777', 'lucas.fer@email.com'),
('Sofia Martins', '2001-08-14', '888.999.000-11', '(81)98888-8888', 'sofia.m@email.com'),
('Tiago Ribeiro', '1994-03-05', '999.000.111-22', '(91)99999-9999', 'tiago.rib@email.com'),
('Camila Alves', '1999-10-30', '000.111.222-33', '(19)90000-0000', 'camila.alves@email.com');

-- insert funcionarios
INSERT INTO funcionario (nome, aniver, cargo, salario) VALUES 
('Marcos Silva', '1986-02-11', 'Gerente de Bilheteira', 4500.00),
('Juliana Mendes', '1996-09-03', 'Vendedora', 2500.00),
('Roberto Dias', '1991-01-27', 'Vendedor', 2500.00),
('Fernanda Gomes', '1999-11-15', 'Atendimento', 2200.00),
('Ricardo Sousa', '1993-03-08', 'Supervisor de Vendas', 3500.00),
('Cláudia Rocha', '1983-12-20', 'Gerente de Operações', 5000.00),
('Fábio Castro', '2002-02-14', 'Vendedor', 2500.00),
('Amanda Nunes', '1994-10-09', 'Vendedora VIP', 3000.00),
('Diego Monteiro', '1998-04-05', 'Suporte Técnico', 2800.00),
('Letícia Carvalho', '2000-08-22', 'Atendimento', 2200.00);

-- insert ingressos
INSERT INTO ingresso (valor, assento, data_show, duracao, is_vip, is_disponivel, eventoID) VALUES

-- EVENTO 1 (3 dias)
(150,'A1','2026-01-10','3h',FALSE,TRUE,1),(150,'A2','2026-01-10','3h',FALSE,TRUE,1),
(150,'A3','2026-01-10','3h',FALSE,FALSE,1),(150,'A4','2026-01-10','3h',FALSE,TRUE,1),
(160,'B1','2026-01-10','3h',FALSE,TRUE,1),(160,'B2','2026-01-10','3h',FALSE,FALSE,1),
(170,'C1','2026-01-10','3h',FALSE,TRUE,1),(170,'C2','2026-01-10','3h',FALSE,TRUE,1),
(200,'VIP1','2026-01-10','3h',TRUE,TRUE,1),(200,'VIP2','2026-01-10','3h',TRUE,FALSE,1),
(210,'VIP3','2026-01-10','3h',TRUE,TRUE,1),(210,'VIP4','2026-01-10','3h',TRUE,FALSE,1),
(155,'D1','2026-01-10','3h',FALSE,TRUE,1),(155,'D2','2026-01-10','3h',FALSE,TRUE,1),
(165,'E1','2026-01-10','3h',FALSE,FALSE,1),

(140,'A1','2026-01-11','3h',FALSE,TRUE,1),(140,'A2','2026-01-11','3h',FALSE,TRUE,1),
(140,'A3','2026-01-11','3h',FALSE,FALSE,1),(150,'B1','2026-01-11','3h',FALSE,TRUE,1),
(150,'B2','2026-01-11','3h',FALSE,TRUE,1),(160,'C1','2026-01-11','3h',FALSE,FALSE,1),
(160,'C2','2026-01-11','3h',FALSE,TRUE,1),(200,'VIP1','2026-01-11','3h',TRUE,TRUE,1),
(200,'VIP2','2026-01-11','3h',TRUE,FALSE,1),(210,'VIP3','2026-01-11','3h',TRUE,TRUE,1),
(210,'VIP4','2026-01-11','3h',TRUE,FALSE,1),(145,'D1','2026-01-11','3h',FALSE,TRUE,1),
(145,'D2','2026-01-11','3h',FALSE,TRUE,1),(155,'E1','2026-01-11','3h',FALSE,FALSE,1),

(130,'A1','2026-01-12','3h',FALSE,TRUE,1),(130,'A2','2026-01-12','3h',FALSE,TRUE,1),
(130,'A3','2026-01-12','3h',FALSE,FALSE,1),(140,'B1','2026-01-12','3h',FALSE,TRUE,1),
(140,'B2','2026-01-12','3h',FALSE,TRUE,1),(150,'C1','2026-01-12','3h',FALSE,FALSE,1),
(150,'C2','2026-01-12','3h',FALSE,TRUE,1),(200,'VIP1','2026-01-12','4h',TRUE,TRUE,1),
(200,'VIP2','2026-01-12','4h',TRUE,FALSE,1),(210,'VIP3','2026-01-12','4h',TRUE,TRUE,1),
(210,'VIP4','2026-01-12','4h',TRUE,FALSE,1),(135,'D1','2026-01-12','3h',FALSE,TRUE,1),
(135,'D2','2026-01-12','3h',FALSE,TRUE,1),(145,'E1','2026-01-12','3h',FALSE,FALSE,1),
(145, 'E2', '2026-01-12', '3h', FALSE, TRUE, 1),

-- EVENTO 2 (2 dias)
(160,'A1','2026-02-05','4h',FALSE,TRUE,2),(160,'A2','2026-02-05','4h',FALSE,FALSE,2),
(170,'B1','2026-02-05','4h',FALSE,TRUE,2),(170,'B2','2026-02-05','4h',FALSE,TRUE,2),
(180,'C1','2026-02-05','4h',FALSE,TRUE,2),(200,'VIP1','2026-02-05','4h',TRUE,TRUE,2),
(200,'VIP2','2026-02-05','4h',TRUE,FALSE,2),(210,'VIP3','2026-02-05','4h',TRUE,TRUE,2),
(210,'VIP4','2026-02-05','4h',TRUE,FALSE,2),(165,'D1','2026-02-05','4h',FALSE,TRUE,2),
(165,'D2','2026-02-05','4h',FALSE,TRUE,2),(175,'E1','2026-02-05','4h',FALSE,FALSE,2),

(150,'A1','2026-02-06','4h',FALSE,TRUE,2),(150,'A2','2026-02-06','4h',FALSE,TRUE,2),
(160,'B1','2026-02-06','4h',FALSE,FALSE,2),(160,'B2','2026-02-06','4h',FALSE,TRUE,2),
(170,'C1','2026-02-06','4h',FALSE,TRUE,2),(200,'VIP1','2026-02-06','4h',TRUE,TRUE,2),
(200,'VIP2','2026-02-06','4h',TRUE,FALSE,2),(210,'VIP3','2026-02-06','4h',TRUE,TRUE,2),
(210,'VIP4','2026-02-06','4h',TRUE,FALSE,2),(155,'D1','2026-02-06','4h',FALSE,TRUE,2),
(155,'D2','2026-02-06','4h',FALSE,TRUE,2),(165,'E1','2026-02-06','4h',FALSE,FALSE,2),

-- EVENTO 3 (1 dia)
(100,'A1','2026-03-15','5h',FALSE,TRUE,3),(100,'A2','2026-03-15','5h',FALSE,TRUE,3),
(110,'B1','2026-03-15','5h',FALSE,FALSE,3),(110,'B2','2026-03-15','5h',FALSE,TRUE,3),
(120,'C1','2026-03-15','5h',FALSE,TRUE,3),(120,'C2','2026-03-15','5h',FALSE,TRUE,3),
(180,'VIP1','2026-03-15','5h',TRUE,TRUE,3),(180,'VIP2','2026-03-15','5h',TRUE,FALSE,3),
(190,'VIP3','2026-03-15','5h',TRUE,TRUE,3),(190,'VIP4','2026-03-15','5h',TRUE,FALSE,3),
(95,'D1','2026-03-15','5h',FALSE,TRUE,3),(95,'D2','2026-03-15','5h',FALSE,TRUE,3),
(105,'E1','2026-03-15','5h',FALSE,FALSE,3),(100,'E2','2025-03-15','5h',FALSE,TRUE,3),

-- EVENTO 4 (1 dia)
(115, 'A1', '2026-04-02', '3h', FALSE, FALSE, 4), (120, 'A2', '2026-04-02', '3h', FALSE, TRUE, 4), -- 2
(100, 'B1', '2026-04-02', '3h', FALSE, TRUE, 4), (135, 'B2', '2026-04-02', '3h', FALSE, FALSE, 4), -- 4
(125, 'C1', '2026-04-02', '3h', FALSE, FALSE, 4), (130, 'C2', '2026-04-02', '3h', FALSE, TRUE, 4), -- 6
(150, 'VIP1', '2026-04-02', '3h', TRUE, FALSE, 4), (175, 'VIP2', '2026-04-02', '3h', TRUE, TRUE, 4), -- 8
(160, 'VIP3', '2026-04-02', '3h', TRUE, TRUE, 4), (150, 'VIP4', '2026-04-02', '3h', TRUE, FALSE, 4), -- 10
(105, 'D1', '2026-04-02', '3h', FALSE, FALSE, 4), (115, 'D2', '2026-04-02', '3h', FALSE, TRUE, 4), -- 12
(110, 'E1', '2026-04-02', '3h', FALSE, FALSE, 4), -- 13

-- EVENTO 5 (2 dias)
(105, 'A1', '2026-04-20', '4h', FALSE, TRUE, 5), (100, 'A2', '2026-04-20', '4h', FALSE, FALSE, 5), -- 2
(110, 'B1', '2026-04-20', '4h', FALSE, TRUE, 5), (120, 'B2', '2026-04-20', '4h', FALSE, TRUE, 5), -- 4
(100, 'C1', '2026-04-20', '4h', FALSE, FALSE, 5), (115, 'C2', '2026-04-20', '4h', FALSE, TRUE, 5), -- 6
(180, 'VIP1', '2026-04-20', '4h', TRUE, TRUE, 5), (170, 'VIP2', '2026-04-20', '4h', TRUE, FALSE, 5), -- 8
(190, 'VIP3', '2026-04-20', '4h', TRUE, TRUE, 5), (185, 'VIP4', '2026-04-20', '4h', TRUE, FALSE, 5), -- 10
(110, 'D1', '2026-04-20', '4h', FALSE, FALSE, 5), (115, 'D2', '2026-04-20', '4h', FALSE, FALSE, 5), -- 12
(110, 'E1', '2026-04-20', '4h', FALSE, FALSE, 5), (105, 'E2', '2026-04-20', '4h', FALSE, TRUE, 5), -- 14

(110, 'A1', '2026-04-21', '4h', FALSE, TRUE, 5), (105, 'A2', '2026-04-21', '4h', FALSE, TRUE, 5), -- 16
(130, 'A3', '2026-04-21', '4h', FALSE, TRUE, 5), (110, 'B1', '2026-04-21', '4h', FALSE, TRUE, 5), -- 18
(100, 'B2', '2026-04-21', '4h', FALSE, FALSE, 5), (120, 'C1', '2026-04-21', '4h', FALSE, FALSE, 5), -- 20
(115, 'C2', '2026-04-21', '4h', FALSE, TRUE, 5), (190, 'VIP1', '2026-04-21', '4h', TRUE, FALSE, 5), -- 22
(170, 'VIP2', '2026-04-21', '4h', TRUE, FALSE, 5), (185, 'VIP3', '2026-04-21', '4h', TRUE, TRUE, 5), -- 24
(180, 'VIP4', '2026-04-21', '4h', TRUE, FALSE, 5), (100, 'D1', '2026-04-21', '4h', FALSE, FALSE, 5), -- 26
(125, 'D2', '2026-04-21', '4h', FALSE, TRUE, 5), (120, 'E1', '2026-04-21', '4h', FALSE, TRUE, 5), -- 28
(105, 'E2', '2026-04-21', '4h', FALSE, FALSE, 5); -- 29

-- EVENTO 6 (3 dias)
INSERT INTO ingresso (valor, assento, data_show, duracao, is_vip, is_disponivel, eventoID) VALUES
(120, 'A1', '2026-05-10', '4h', FALSE, TRUE, 6), (115, 'A2', '2026-05-10', '4h', FALSE, FALSE, 6), -- 2
(100, 'A3', '2026-05-10', '4h', FALSE, TRUE, 6), (120, 'B1', '2026-05-10', '4h', FALSE, TRUE, 6), -- 4
(120, 'B2', '2026-05-10', '4h', FALSE, TRUE, 6), (110, 'C1', '2026-05-10', '4h', FALSE, FALSE, 6), -- 6
(115, 'C2', '2026-05-10', '4h', FALSE, FALSE, 6), (190, 'VIP1', '2026-05-10', '4h', TRUE, FALSE, 6), -- 8
(190, 'VIP2', '2026-05-10', '4h', TRUE, TRUE, 6), (185, 'VIP3', '2026-05-10', '4h', TRUE, TRUE, 6), -- 10
(180, 'VIP4', '2026-05-10', '4h', TRUE, FALSE, 6), (120, 'D1', '2026-05-10', '4h', FALSE, FALSE, 6), -- 12
(115, 'D2', '2026-05-10', '4h', FALSE, TRUE, 6), (110, 'E1', '2026-05-10', '4h', FALSE, TRUE, 6), -- 14
(120, 'E2', '2026-05-10', '4h', FALSE, TRUE, 6), -- 15

(130, 'A1', '2026-05-10', '5h', FALSE, TRUE, 6), (115, 'A2', '2026-05-10', '5h', FALSE, FALSE, 6), -- 17
(135, 'A3', '2026-05-10', '5h', FALSE, FALSE, 6), (120, 'B1', '2026-05-10', '5h', FALSE, TRUE, 6), -- 19
(120, 'B2', '2026-05-10', '5h', FALSE, TRUE, 6), (125, 'C1', '2026-05-10', '5h', FALSE, FALSE, 6), -- 21
(115, 'C2', '2026-05-10', '5h', FALSE, FALSE, 6), (200, 'VIP1', '2026-05-10', '5h', TRUE, FALSE, 6), -- 23
(190, 'VIP2', '2026-05-10', '5h', TRUE, FALSE, 6), (205, 'VIP3', '2026-05-10', '5h', TRUE, TRUE, 6), -- 25
(200, 'VIP4', '2026-05-10', '5h', TRUE, FALSE, 6), (130, 'D1', '2026-05-10', '5h', FALSE, TRUE, 6), -- 27
(115, 'D2', '2026-05-10', '5h', FALSE, TRUE, 6), (110, 'E1', '2026-05-10', '5h', FALSE, FALSE, 6), -- 29
(120, 'E2', '2026-05-10', '5h', FALSE, FALSE, 6), -- 31

(120, 'A1', '2026-05-10', '4h', FALSE, FALSE, 6), (115, 'A2', '2026-05-10', '4h', FALSE, TRUE, 6), -- 2
(100, 'A3', '2026-05-10', '4h', FALSE, TRUE, 6), (120, 'B1', '2026-05-10', '4h', FALSE, TRUE, 6), -- 4
(120, 'B2', '2026-05-10', '4h', FALSE, TRUE, 6), (110, 'C1', '2026-05-10', '4h', FALSE, TRUE, 6), -- 6
(115, 'C2', '2026-05-10', '4h', FALSE, FALSE, 6), (190, 'VIP1', '2026-05-10', '4h', TRUE, FALSE, 6), -- 8
(190, 'VIP2', '2026-05-10', '4h', TRUE, TRUE, 6), (185, 'VIP3', '2026-05-10', '4h', TRUE, FALSE, 6), -- 10
(180, 'VIP4', '2026-05-10', '4h', TRUE, FALSE, 6), (120, 'D1', '2026-05-10', '4h', FALSE, FALSE, 6), -- 12
(115, 'D2', '2026-05-10', '4h', FALSE, TRUE, 6), (110, 'E1', '2026-05-10', '4h', FALSE, TRUE, 6), -- 14
(120, 'E2', '2026-05-10', '4h', FALSE, FALSE, 6); -- 15

SELECT * FROM ingresso;
DESCRIBE funcionario_evento;
SELECT * FROM funcionario;

INSERT INTO funcionario_evento (eventoID, funcionarioID) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 8), (1, 9),
(2, 1), (2, 3), (2, 10), (2, 9), (2, 6), (2, 5), (2, 4), (2, 2),
(3, 1), (3, 5), (3, 6), (3, 9), (3, 2), (3, 8), (3, 10),
(4, 1), (4, 5), (4, 6), (4, 9), (4, 2), (4, 3), (4, 4),
(5, 1), (5, 5), (5, 6), (5, 9), (5, 2), (5, 8), (5, 10), (5, 4),
(6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (6, 6), (6, 7), (6, 8), (6, 9), (6, 10);
SELECT * FROM funcionario_evento;

-- insert compra_venda
INSERT INTO compra_venda (metodo_pagamento, clienteID, funcionarioID, ingressoID) VALUES
('cartão', 1, 3, 12), ('pix', 2, 7, 3),
('dinheiro', 3, 2, 27), ('cartão', 4, 8, 8),
('pix', 5, 3, 19), ('dinheiro', 6, 7, 1),
('cartão', 7, 2, 30), ('pix', 8, 8, 14),
('dinheiro', 9, 3, 6), ('cartão', 10, 7, 22),
('pix', 1, 2, 9), ('dinheiro', 2, 8, 25),
('cartão', 3, 3, 2), ('pix', 4, 7, 18),
('dinheiro', 5, 2, 11), ('cartão', 6, 8, 29),
('pix', 7, 3, 5), ('dinheiro', 8, 7, 16),
('cartão', 9, 2, 23), ('pix', 10, 8, 7),
('dinheiro', 1, 3, 20), ('cartão', 2, 7, 4),
('pix', 3, 2, 28), ('dinheiro', 4, 8, 10),
('cartão', 5, 3, 15), ('pix', 6, 7, 26),
('dinheiro', 7, 2, 13), ('cartão', 8, 8, 24),
('pix', 9, 3, 17), ('dinheiro', 10, 7, 21);

SELECT * FROM compra_venda;

-- update sugestão
UPDATE evento
SET data_fim = '2026-03-24' 
WHERE id = 1;

UPDATE evento
SET quant_artistas = 10
WHERE nome = 'Festival Verão Bahia';

-- select sugestão
-- Consultas Simples
SELECT nome, data_inicio, data_fim 
FROM evento;

-- Consultas Complexas

SELECT c.nome, i.assento, i.valor, cv.metodo_pagamento 
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
