## Estrutura do Banco de Dados

Este banco de dados foi projetado para armazenar informações sobre **clientes**, **cursos**, **eventos**, **inscrições** e **participações em eventos**. A estrutura do banco de dados foi criada com as seguintes tabelas principais:

### Tabelas Criadas

1. **Clientes**
   - **cliente_id** (PK): Identificador único do cliente.
   - **nome**: Nome completo do cliente.
   - **email**: E-mail do cliente (único).

2. **Cursos**
   - **curso_id** (PK): Identificador único do curso.
   - **nome**: Nome do curso.
   - **descricao**: Descrição detalhada do curso.
   - **data_inicio**: Data de início do curso.
   - **data_fim**: Data de término do curso.

3. **Eventos**
   - **evento_id** (PK): Identificador único do evento.
   - **nome**: Nome do evento.
   - **descricao**: Descrição detalhada do evento.
   - **data_inicio**: Data e hora de início do evento.
   - **data_fim**: Data e hora de término do evento.

4. **Inscrições**
   - **inscricao_id** (PK): Identificador único da inscrição.
   - **cliente_id** (FK): Referência ao cliente que se inscreveu.
   - **curso_id** (FK): Referência ao curso no qual o cliente se inscreveu.
   - **data_inscricao**: Data da inscrição.

5. **Participações em Eventos**
   - **participacao_id** (PK): Identificador único da participação.
   - **cliente_id** (FK): Referência ao cliente que participou do evento.
   - **evento_id** (FK): Referência ao evento em que o cliente participou.
   - **data_participacao**: Data e hora da participação no evento.

6. **Feedback**
   - **feedback_id** (PK): Identificador único do feedback.
   - **cliente_id** (FK): Referência ao cliente que deu o feedback.
   - **curso_id** (FK): Referência ao curso sobre o qual o feedback foi dado.
   - **evento_id** (FK): Referência ao evento sobre o qual o feedback foi dado.
   - **comentario**: Comentário do cliente.
   - **rating**: Avaliação (de 1 a 5).
   - **data_feedback**: Data e hora do feedback.

7. **Respostas**
   - **resposta_id** (PK): Identificador único da resposta.
   - **cliente_id** (FK): Referência ao cliente que preencheu o formulário.
   - **curso_sommelier**: Resposta sobre o interesse em curso de sommelier.
   - **cozinha_colaborativa**: Resposta sobre o interesse em cozinha colaborativa.
   - **curso_harmonizacao**: Resposta sobre o interesse em curso de harmonização.
   - **receber_novidades**: Resposta sobre o interesse em receber novidades.

### Relacionamentos

- **Clientes -> Inscrições (1:N)**: Um cliente pode ter várias inscrições, mas cada inscrição pertence a um único cliente.
- **Cursos -> Inscrições (1:N)**: Um curso pode ter várias inscrições, mas cada inscrição é para um único curso.
- **Clientes -> Participações em Eventos (1:N)**: Um cliente pode participar de vários eventos, mas cada participação é associada a um único cliente.
- **Eventos -> Participações em Eventos (1:N)**: Um evento pode ter vários participantes, mas cada participação é associada a um único evento.
- **Clientes -> Feedback (1:N)**: Um cliente pode deixar vários feedbacks, tanto para cursos quanto para eventos.
- **Cursos -> Feedback (1:N)**: Um curso pode ter vários feedbacks associados.
- **Eventos -> Feedback (1:N)**: Um evento pode ter vários feedbacks associados.
- **Clientes -> Respostas (1:1)**: Um cliente tem uma única resposta ao formulário.

---

### Diagrama Entidade-Relacionamento (DER)

#### Entidades e seus Atributos

```
+----------------+      +------------------+        +---------------------+
|    Clientes    |      |      Cursos      |        |       Eventos       |
+----------------+      +------------------+        +---------------------+
| PK cliente_id  |<---+ | PK curso_id      |        | PK evento_id        |
| nome           |      | nome             |        | nome                |
| email          |      | descricao        |        | descricao           |
+----------------+      | data_inicio      |        | data_inicio         |
                        | data_fim         |        | data_fim            |
                        +------------------+        +---------------------+
```

#### Relacionamentos (com as tabelas de junção)

```
+----------------+      +---------------------+      +------------------------+
|   Inscrições   |      |     Participações   |      |         Feedback       |
+----------------+      |       em Eventos    |      +------------------------+
| PK inscricao_id|<---+ | PK participacao_id  |<--+ | PK feedback_id          |
| FK cliente_id  |      | FK cliente_id       |      | FK cliente_id           |
| FK curso_id    |      | FK evento_id        |      | FK curso_id             |
| data_inscricao |      | data_participacao   |      | FK evento_id            |
+----------------+      +---------------------+      | comentario              |
                                                    | rating                   |
                                                    | data_feedback            |
                                                    +--------------------------+
```

### Tabela de Respostas

```
+----------------+      
|   Respostas    |      
+----------------+
| PK resposta_id |
| FK cliente_id  |
| curso_sommelier|
| cozinha_colab. |
| curso_harmonizacao|
| receber_nov.   |
+----------------+
```

---

## Relatório de Eventos

A seguir, temos a visão (`VIEW`) que fornece um relatório combinando informações sobre **clientes**, **eventos** e **cursos**. A visão foi criada para simplificar a consulta de dados, agregando as informações necessárias para o relatório.

### Exemplo de Resultados Esperados

| cliente_nome   | evento_nome            | curso_nome                     | data_participacao   |
|----------------|------------------------|--------------------------------|---------------------|
| João Silva     | Festival de Vinhos     | Curso de Sommelier de Vinhos   | 2025-01-18 18:00:00 |
| Maria Oliveira | Jantar Temático Francês| Cozinha Colaborativa           | 2025-01-30 19:00:00 |
| Pedro Souza    | Noite de Harmonização  | NULL                           | 2025-02-12 20:00:00 |
| Ana Costa      | Festival de Vinhos     | Curso de Harmonização          | 2025-01-18 18:30:00 |


---

## Conclusão

Este banco de dados foi projetado para gerenciar eventos, cursos e a interação dos clientes com o restaurante. A visão criada fornece um relatório simples e direto para monitorar a participação dos clientes em eventos e cursos, com a flexibilidade de aplicar filtros de acordo com as necessidades de análise.

---
