ALTER TABLE Cursos ADD COLUMN evento_id INT;

-- Agora, definindo a chave estrangeira para a relação com a tabela Eventos
ALTER TABLE Cursos ADD CONSTRAINT fk_evento_id FOREIGN KEY (evento_id) REFERENCES Eventos(evento_id);

UPDATE Cursos SET evento_id = 19 WHERE curso_id = 13; -- Exemplo, vinculando o curso com evento_id = 1
UPDATE Cursos SET evento_id = 20 WHERE curso_id = 14; -- Exemplo, vinculando o curso com evento_id = 2
UPDATE Cursos SET evento_id = 21 WHERE curso_id = 15; -- Exemplo, vinculando o curso com evento_id = 3


-- Inserir Clientes
INSERT INTO Clientes (nome, email) VALUES
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com'),
('Pedro Souza', 'pedro.souza@example.com'),
('Ana Costa', 'ana.costa@example.com');

-- Verificar se os clientes foram inseridos corretamente
SELECT * FROM Clientes;

-- Inserir Cursos
INSERT INTO Cursos (nome, descricao, data_inicio, data_fim) VALUES
('Curso de Sommelier de Vinhos', 'Curso completo para formação de sommeliers, com foco em vinhos nacionais e internacionais.', '2025-01-15', '2025-01-25'),
('Cozinha Colaborativa', 'Experiência de cozinha colaborativa com chefs, aprendendo a fazer pratos clássicos franceses.', '2025-01-29', '2025-02-05'),
('Curso de Harmonização', 'Curso sobre como harmonizar vinhos e pratos, com práticas e teoria.', '2025-02-10', '2025-02-20');

-- Verificar se os cursos foram inseridos corretamente
SELECT * FROM Cursos;

-- Inserir Eventos
INSERT INTO Eventos (nome, descricao, data_inicio, data_fim) VALUES
('Festival de Vinhos', 'Festival de vinhos com degustação e palestras sobre vinhos e gastronomia.', '2025-01-18 18:00:00', '2025-01-18 22:00:00'),
('Jantar Temático Francês', 'Jantar especial com pratos típicos franceses, preparados pelos nossos chefs.', '2025-01-30 19:00:00', '2025-01-30 23:00:00'),
('Noite de Harmonização', 'Noite de harmonização de vinhos e pratos, com explicações sobre combinações ideais.', '2025-02-12 20:00:00', '2025-02-12 23:00:00');

-- Verificar se os eventos foram inseridos corretamente
SELECT * FROM Eventos;

-- Inserir Inscrições (Agora as chaves estrangeiras devem estar válidas)
INSERT INTO Inscricoes (cliente_id, curso_id, data_inscricao) VALUES
(23, 13, '2024-12-10 10:00:00'),
(24, 14, '2024-12-12 14:30:00'),
(25, 15, '2024-12-13 11:15:00'),
(26, 13, '2024-12-14 16:45:00');

-- Verificar se as inscrições foram inseridas corretamente
SELECT * FROM Inscricoes;


-- Inserir Participações em Eventos
INSERT INTO Participacoes_Eventos (cliente_id, evento_id, data_participacao) VALUES
(23, 19, '2025-01-18 18:00:00'),
(24, 20, '2025-01-30 19:00:00'),
(25, 19, '2025-02-12 20:00:00'),
(26, 21, '2025-01-18 18:30:00');

-- Verificar se as participações foram inseridas corretamente
SELECT * FROM Participacoes_Eventos;


-- Inserir Feedback
INSERT INTO Feedback (cliente_id, curso_id, evento_id, comentario, rating, data_feedback) VALUES
(23, 13, NULL, 'O curso de sommelier foi excelente, aprendi muito sobre vinhos.', 5, '2025-01-20 10:00:00'),
(24, 14, NULL, 'A cozinha colaborativa foi uma experiência incrível. Adorei preparar os pratos!', 4, '2025-01-31 11:00:00'),
(25, NULL, 21, 'A noite de harmonização foi sensacional. Recomendo a todos!', 5, '2025-02-13 12:00:00'),
(26, NULL, 19, 'O festival de vinhos foi maravilhoso, gostei bastante das degustações.', 4, '2025-01-19 09:30:00');

-- Verificar se os feedbacks foram inseridos corretamente
SELECT * FROM Feedback;

-- Inserir Respostas (Formulário)
INSERT INTO Respostas (cliente_id, curso_sommelier, cozinha_colaborativa, curso_harmonizacao, receber_novidades) VALUES
(23, TRUE, FALSE, TRUE, TRUE),
(24, TRUE, TRUE, FALSE, TRUE),
(25, TRUE, FALSE, TRUE, FALSE),
(26, FALSE, TRUE, TRUE, TRUE);

-- Verificar se as respostas foram inseridas corretamente
SELECT * FROM Respostas;

-- ## Inserção de mais  Clientes:
-- Inserir clientes
INSERT INTO Clientes (nome, email) VALUES
('Carlos Pereira', 'carlos.pereira@example.com'),
('Fernanda Lima', 'fernanda.lima@example.com');

-- Verificar a inserção
SELECT * FROM Clientes;

-- Inserir Participações em Eventos (clientes participando de eventos sem cursos)
INSERT INTO Participacoes_Eventos (cliente_id, evento_id, data_participacao) VALUES
(27, 19, '2025-01-18 18:00:00'),  -- Carlos Pereira participa do "Festival de Vinhos"
(28, 20, '2025-01-30 19:00:00');  -- Fernanda Lima participa do "Jantar Temático Francês"

-- Verificar a inserção de participações
SELECT * FROM Participacoes_Eventos;

-- Inserir clientes
INSERT INTO Clientes (nome, email) VALUES
('Lucas Silva', 'lucas.silva@example.com'),
('Juliana Souza', 'juliana.souza@example.com');

-- Verificar a inserção
SELECT * FROM Clientes;

-- Inserir Inscrições (clientes se inscrevem no curso sem participar de eventos)
INSERT INTO Inscricoes (cliente_id, curso_id, data_inscricao) VALUES
(29, 13, '2024-12-10 10:00:00'),  -- Lucas Silva se inscreve no "Curso de Sommelier de Vinhos"
(30, 14, '2024-12-12 14:30:00');  -- Juliana Souza se inscreve no "Cozinha Colaborativa"

-- Verificar a inserção de inscrições
SELECT * FROM Inscricoes;
