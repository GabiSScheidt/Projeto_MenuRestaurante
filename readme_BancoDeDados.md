
## Estrutura do Banco de Dados

Este banco de dados foi projetado para armazenar informações sobre **clientes**, **cursos**, **eventos**, **inscrições** e **participações em eventos** 
A estrutura do banco de dados foi criada com as seguintes tabelas principais:

### Tabelas Criadas:

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

4. **Inscricoes**
   - **inscricao_id** (PK): Identificador único da inscrição.
   - **cliente_id** (FK): Referência ao cliente que se inscreveu.
   - **curso_id** (FK): Referência ao curso no qual o cliente se inscreveu.
   - **data_inscricao**: Data da inscrição.

5. **Participacoes_Eventos**
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



## Relatório de Eventos

A seguir, temos a **visão** (`VIEW`) que fornece um relatório combinando informações sobre **clientes**, **eventos** e **cursos**. A visão foi criada para simplificar a consulta de dados, agregando as informações necessárias para o relatório.


## Conclusão

Este banco de dados foi projetado para gerenciar eventos, cursos e a interação dos clientes com o restaurante. A visão criada fornece um relatório simples e direto para monitorar a participação dos clientes em eventos e cursos, com a flexibilidade de aplicar filtros de acordo com as necessidades de análise.
