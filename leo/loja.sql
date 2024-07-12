CREATE IF NOT EXISTS clientes (     --se a tabela nao existir ela sera criada
    idCliente INT PRIMARY KEY AUTO_INCREMENT, --AUTO_INCREMENT coloca automaticamente a numeracação
    nome VARCHAR (100),
    telefone VARCHAR(100),
);

ALTER TABLE clientes 
    ADD email VARCHAR (100);  -- esta adicionando algo para a tabela

ALTER TABLE clientes
    MODIFY email TEXT;   -- Ira alterar uma tabela ja criada e modificar o tipo de uma coluna

ALTER TABLE clientes
     CHANGE COLUMN email emailCliente VARCHAR(100) ; --Muda o nome e tambem o tipo da coluna 

ALTER TABLE clientes
    DROP COLUMN telefone; -- REMOVER UMA COLUNA

ALTER TABLE clientes
    RENAME TO Clientes; --RENOMEIA O NOME DA CALUNA

DROP TABLE clientes; --DELETA A TABELA 

INSERT INTO Clientes (idCliente, nome, emailCliente) --INSERE DADOS EM UMA TABELA 
VALUES (1, 'João Silva', 'joao.silva@email.com');

UPDATE Clientes
SET emailCliente = 'novo.email@gmail.com'  -- ATUALIZA DADOS DE UMA TABELA
WHERE idCliente = 1; -- condição

DELETE  FROM Clientes --DELETA DADOS EM UMA TABELA
WHERE idCliente = 1;

SELECT idCliente, nome, emailCliente --CONSULTA SIMPLES- retorna todos os dados da tabela 
FROM Clientes;
WHERE idCliente = 2

SELECT *  -- IRA MOSTRAR TODOS OS DADOS DA TABELA por conta do *    
FROM Clientes;

SELECT emailCliente
FROM Clientes 
WHERE idCliente IN (1, 2, 3);-- IRA RETORNAR O VALOR NO LOCAL ESCOLHIDO


SELECT idCliente, nome, emailCliente -- CONSULTA COM ORDENAÇÃO- retorna dados ordenados (nomes)
FROM Clientes
ORDER BY nome ASC; -- OU DESC  (decrescente)


SELECT nome     -- CONSULTA COM SIMPLES COM ORDENAÇÃO- retorna os dados com as informações iguais na propriedade dada
FROM Clientes
WHERE email = 'guarana@gmail.com'
ORDER BY idCliente DESC

SELECT *
FROM Clientes --RETORNA AS INFORMAÇÕES COM LIMITE DADO 
LIMIT 3;

SELECT DISTINCT email --RETORNA VALORES UNICOS
FROM Clientes; 


CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY, --CRIAÇÃO DE UMA TABELA 
    idCliente INT, 
    numeroPedido VARCHAR(50),
    valorTotal DECIMAL (10,2),
    dataPedido DATE,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente) -- CHAVE ESTRANGEIRA 
);