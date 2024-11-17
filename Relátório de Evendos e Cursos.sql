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

