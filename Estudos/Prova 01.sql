CREATE DATABASE IF NOT EXISTS Prova01;
USE Prova01;

CREATE TABLE IF NOT EXISTS Cliente (
ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(20) NOT NULL,
Sexo CHAR CHECK (Sexo = 'F' OR Sexo = 'M' OR Sexo = 'O'),
Idade INT NOT NULL,
Pontuacao INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Pratos (
ID_Pratos INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(20) NOT NULL,
Composicao VARCHAR(50) NOT NULL,
Valor DECIMAL(5,2) NOT NULL,
ID_Cliente INT NOT NULL,
FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

##DROP TABLE Pratos;

CREATE TABLE IF NOT EXISTS Fornecedores (
ID_Fornecedor INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(20) NOT NULL,
Cidade VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS Ingredients (
ID_Ingredient INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(20) NOT NULL,
Fabricacao VARCHAR(20) NOT NULL,
Validade VARCHAR(10) NOT NULL,
Valor_Energetico INT NOT NULL,
ID_Fornecedor INT NOT NULL,
FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedores (ID_Fornecedor)
);

CREATE TABLE IF NOT EXISTS Compoe (
ID_Pratos INT NOT NULL,
ID_Ingredient INT NOT NULL,
FOREIGN KEY (ID_Pratos) REFERENCES Pratos (ID_Pratos),
FOREIGN KEY (ID_Ingredient) REFERENCES Ingredients (ID_Ingredient)
);

## SELECTs

SELECT * FROM Ingredients WHERE Valor_Energetico > 300;

SELECT Pratos.Nome FROM Cliente, Pratos WHERE Pratos.ID_Cliente = Cliente.ID_Cliente AND 
Cliente.Sexo = 'M' AND Cliente.Idade < 18;

SELECT Cliente.Nome, Pratos.Nome FROM Cliente, Pratos WHERE Pratos.ID_Cliente = Cliente.ID_Cliente AND
 Prato.Valor < 25;
 
SELECT Pratos.Nome, Ingredientes.Valor_Energetico FROM Pratos, Cliente, Compoe, Ingredients WHERE 
Ingredients.ID_Ingredients = Compoe.ID_Ingredients AND Compoe.ID_Pratos = Pratos.ID_Pratos AND
Cliente.ID_Cliente = Pratos.ID_Cliente AND Cliente.Sexo = 'M' AND Cliente.Idade > 30; 

## DROP DATABASE Prova01;
