--CRIAÇÃO DAS TABELAS--
-- Tabela Clientes
CREATE TABLE Clientes (
    cliente_id SERIAL PRIMARY KEY,        
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela Cursos
CREATE TABLE Cursos (
    curso_id SERIAL PRIMARY KEY,           
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE
);

-- Tabela Inscrições
CREATE TABLE Inscricoes (
    inscricao_id SERIAL PRIMARY KEY,       
    cliente_id INT,
    curso_id INT,
    data_inscricao TIMESTAMP,              
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);

-- Tabela Eventos
CREATE TABLE Eventos (
    evento_id SERIAL PRIMARY KEY,          
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio TIMESTAMP,                
    data_fim TIMESTAMP                    
);

-- Tabela Participações em Eventos
CREATE TABLE Participacoes_Eventos (
    participacao_id SERIAL PRIMARY KEY,    
    cliente_id INT,
    evento_id INT,
    data_participacao TIMESTAMP,          
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (evento_id) REFERENCES Eventos(evento_id)
);

-- Tabela Newsletters
CREATE TABLE Newsletters (
    newsletter_id SERIAL PRIMARY KEY,    
    assunto VARCHAR(200),
    data_envio TIMESTAMP,                 
    conteudo TEXT
);

-- Tabela Feedback
CREATE TABLE Feedback (
    feedback_id SERIAL PRIMARY KEY,       
    cliente_id INT,
    curso_id INT,
    evento_id INT,
    comentario TEXT,
    rating INT,
    data_feedback TIMESTAMP,             
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id),
    FOREIGN KEY (evento_id) REFERENCES Eventos(evento_id)
);

-- Tabela Respostas (Formulário)
CREATE TABLE Respostas (
    resposta_id SERIAL PRIMARY KEY,
    cliente_id INT,
    curso_sommelier BOOLEAN NOT NULL,
    cozinha_colaborativa BOOLEAN NOT NULL,
    curso_harmonizacao BOOLEAN NOT NULL,
    receber_novidades BOOLEAN NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
