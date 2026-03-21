-- Criação das tabelas
CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE pedidos (
id SERIAL PRIMARY KEY,
compra VARCHAR(200),
clientes_id integer REFERENCES clientes(id),
valor INT
);

-- Inserção de dados.

INSERT INTO clientes (nome) VALUES ('Pedro');
INSERT INTO clientes (nome) VALUES ('Ana');
INSERT INTO clientes (nome) VALUES ('Larissa');
INSERT INTO clientes (nome) VALUES ('Fernado');

INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('Notebook', '3450', 1);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('Mesa Gamer', '1000', 1);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('Cadeira', '750', 1);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('Tapete', '550', 2);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('TV', '2250', 2);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('Ar condicionado', '1875', 2);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('Sofa retratil', '1499', 2);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('AirPods', '1550', 3);
INSERT INTO pedidos (compra, valor, clientes_id) VALUES ('Iphone 17', '6500', 3);

-- 1. LEFT JOIN (clientes + pedidos)

SELECT clientes.nome, pedidos.valor
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.clientes_id;

--2. CONTAGEM DE PEDIDOS POR CLIENTE

SELECT clientes.nome, COUNT(pedidos.id) AS quantidade_pedidos
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.clientes_id
GROUP BY clientes.nome;

--3. Soma total dos pedidos

SELECT SUM (valor) AS valor_total
FROM pedidos;

--4.pedidos acima de 500

SELECT clientes.id, clientes.nome, COUNT(pedidos_acima_media.id)
FROM clientes
INNER JOIN(
SELECT * FROM pedidos WHERE pedidos.valor >500
) pedidos_acima_media ON clientes.id = pedidos_acima_media.clientes_id

GROUP BY clientes.id, clientes.nome;

SELECT AVG (valor) FROM PEDIDOS

SELECT clientes.nome, AVG(pedidos.valor) AS media_valor
FROM clientes
LEFT JOIN pedidos
ON clientes.id = pedidos.clientes_id
GROUP BY clientes.nome;

-- 5. Media total.

SELECT AVG(valor) 
FROM pedidos;


-- 6. Media dos valores por clientes.

SELECT clientes.nome, AVG(pedidos.valor) AS media_valor
FROM clientes
LEFT JOIN pedidos
ON clientes.id = pedidos.clientes_id
GROUP BY clientes.nome;


