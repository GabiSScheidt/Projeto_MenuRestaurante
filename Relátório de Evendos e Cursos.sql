--exclui a View antiga 
DROP VIEW IF EXISTS Relatorio_Eventos_Cursos;

-- Criando a View - Relatorio_Eventos_Cursos
CREATE VIEW Relatorio_Eventos_Cursos AS
SELECT
    c.nome AS cliente_nome,
    e.nome AS evento_nome,
    cu.nome AS curso_nome,
    p.data_participacao
FROM
    Participacoes_Eventos p
JOIN Clientes c ON p.cliente_id = c.cliente_id
JOIN Eventos e ON p.evento_id = e.evento_id
LEFT JOIN Inscricoes i ON i.cliente_id = c.cliente_id
LEFT JOIN Cursos cu ON i.curso_id = cu.curso_id;


--Verificar todos os registros do relatório:
SELECT * FROM Relatorio_Eventos_Cursos;


--Filtrar para um cliente específico:
SELECT * FROM Relatorio_Eventos_Cursos
WHERE cliente_nome = 'João Silva';

--Filtrar para eventos em janeiro de 2025:
SELECT * FROM Relatorio_Eventos_Cursos
WHERE data_participacao BETWEEN '2025-01-01' AND '2025-01-31';

-- Contar a quantidade de participantes por evento:
SELECT evento_nome, COUNT(cliente_nome) AS quantidade_participantes
FROM Relatorio_Eventos_Cursos
GROUP BY evento_nome;


-- Verificar todos os registros no Relatório
SELECT * FROM Relatorio_Eventos_Cursos;

-- Verificar apenas os clientes que participaram de um evento sem curso
SELECT * FROM Relatorio_Eventos_Cursos
WHERE curso_nome IS NULL;

-- Verificar apenas os clientes que se inscreveram em um curso sem evento
SELECT * FROM Relatorio_Eventos_Cursos
WHERE evento_nome IS NULL;

-- Essa consulta permite obter uma visão completa das participações dos clientes nos eventos.**Talvez deixo como um relatório separado.
SELECT 
    c.nome AS cliente_nome,                        -- Nome do cliente
    e.nome AS evento_nome,                         -- Nome do evento
    e.data_inicio AS evento_data_inicio,           -- Data de início do evento
    e.data_fim AS evento_data_fim,                 -- Data de fim do evento
    CASE 
        WHEN i.curso_id IS NOT NULL THEN 'Sim'    -- Verifica se o cliente está inscrito no curso
        ELSE 'Não' 
    END AS inscrito_no_curso                       -- Resposta se está inscrito no curso
FROM 
    Participacoes_Eventos pe
JOIN 
    Clientes c ON pe.cliente_id = c.cliente_id    -- Associa a participação do cliente
JOIN 
    Eventos e ON pe.evento_id = e.evento_id       -- Associa o evento
LEFT JOIN 
    Inscricoes i ON c.cliente_id = i.cliente_id   -- Associa o cliente à inscrição no curso
        AND i.curso_id IS NOT NULL                -- Garante que o cliente esteja inscrito em um curso
ORDER BY 
    e.data_inicio, c.nome;                        -- Ordena pela data do evento e pelo nome do cliente

    e.data_inicio, c.nome;
