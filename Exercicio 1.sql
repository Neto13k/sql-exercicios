-- 1. Criar uma tabela de usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY ,
    nome TEXT NOT NULL,
    email TEXT NOT NULL
);
-- 2. Inserir dados na tabela
INSERT INTO usuarios (nome, email) VALUES ('Paula', 'Paula@stackx.com');
INSERT INTO usuarios (nome, email) VALUES ('João', 'João@stackx.com');

-- 3. Atualizar dados de um usuário
UPDATE usuarios SET email = 'ana.souza@email.com' WHERE id = 1;

-- 4. Deletar um usuário
DELETE FROM usuarios WHERE id = 2;

-- 5. Consultar todos os usuários
SELECT * FROM usuarios;

-- 6. Criar tabela de produtos e listar apenas nomes
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR,
    preco DECIMAL(10, 2)
);

INSERT INTO produtos (nome, preco) VALUES ('Teclado Mecânico', 250.00);
INSERT INTO produtos (nome, preco) VALUES ('Mouse Gamer', 120.50);

SELECT nome FROM produtos;