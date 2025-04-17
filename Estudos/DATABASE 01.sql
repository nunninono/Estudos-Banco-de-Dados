CREATE DATABASE IF NOT EXISTS Estudos; 
USE Estudos;
CREATE TABLE IF NOT EXISTS Estudantes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    curso VARCHAR(20) NOT NULL,
    periodo SMALLINT
);
    
INSERT INTO Estudantes (nome, cpf, curso, periodo) VALUES ('Claudio', '111.222.333-44', 'COMPUTACAO', 3);
SELECT * FROM Estudantes;

##DROP TABLE Estudantes;
