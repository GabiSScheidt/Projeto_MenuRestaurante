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

SELECT * FROM Relatorio_Eventos_Cursos;

-- Verificar relatórios apenas para um cliente específico
SELECT * FROM Relatorio_Eventos_Cursos
WHERE cliente_nome = 'João Silva';

-- Verificar relatórios para eventos no mês de janeiro de 2025
SELECT * FROM Relatorio_Eventos_Cursos
WHERE data_participacao BETWEEN '2025-01-01' AND '2025-01-31';

-- Contagem de clientes por evento
SELECT evento_nome, COUNT(cliente_nome) AS quantidade_participantes
FROM Relatorio_Eventos_Cursos
GROUP BY evento_nome;



