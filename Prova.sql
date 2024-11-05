CREATE DATABASE SistemaEscola

CREATE TABLE Alunos(
	ID_Aluno INT IDENTITY(1,1) PRIMARY KEY,
	CPF VARCHAR(11),
	NomeAluno VARCHAR(30),
	SobrenomeAluno VARCHAR(80),
	DataNascimento DATE,
	Serie VARCHAR(20),
	MensalidadePreco FLOAT,
	DataMatricula DATE,
	DataDesmatricula DATE,
	ID_Notas INT, 
	ID_Responsavel INT, 
);

CREATE TABLE Boletim(
	ID_Notas INT IDENTITY(1,1) PRIMARY KEY,
	ID_Aluno INT, 
	NomeAluno VARCHAR(30),
	SobrenomeAluno VARCHAR(80),
	Serie VARCHAR(20),
	Portugues FLOAT,
	Matematica FLOAT,
	Fisica FLOAT,
	Quimica FLOAT,
	Biologia FLOAT,
	Ingles FLOAT,
	Artes FLOAT,
	EducacaoFisica FLOAT,
	Recuperacao FLOAT,
	FaltasTotal INT
);

CREATE TABLE Responsaveis(
	ID_Responsavel INT IDENTITY(1,1) PRIMARY KEY,
	CPF VARCHAR(11),
	NomeResponsavel VARCHAR(30),
	SobrenomeResponsavel VARCHAR(80),
	DataNascimento DATE,
	DataMatricula DATE,
	DataDesmatricula DATE,
	Renda FLOAT,
	Telefone VARCHAR(11),
	ContatoEmergencia VARCHAR(11),
	ID_Aluno INT
);

--INSERE VALORES NA TABELA ALUNOS
INSERT INTO Alunos(CPF, NomeAluno, SobrenomeAluno, DataNascimento, Serie, MensalidadePreco, DataMatricula, ID_Notas, ID_Responsavel)
VALUES (51592930293, 'Lucas', 'Santos de Lima', '2003/08/19', 'Primeiro E.M', 1200, '2024/01/13', 1, 1 )



--INSERE VALORES NA TABELA BOLETIM
INSERT INTO Boletim(ID_Aluno, NomeAluno, SobrenomeAluno , Serie , Portugues , Matematica , Fisica , Quimica , Biologia , Ingles , Artes , EducacaoFisica , FaltasTotal)
VALUES (1, 'Lucas', 'Santos de Lima', 'Primeiro E.M', 6.5, 8, 7, 6, 6, 9, 6, 7, 46)

--INSERE VALORES NA TABELA RESPONSAVEIS
INSERT INTO Responsaveis(CPF , NomeResponsavel ,SobrenomeResponsavel ,DataNascimento ,DataMatricula ,Renda,Telefone,ContatoEmergencia ,ID_Aluno 	)
VALUES (83458592042, 'Marcelo', 'Melo Santos', '1993/07/23', '2023/01/18', 5500, '11949532892', '11992534942', 1)

--INSERE VALORES NA TABELA ALUNOS
INSERT INTO Alunos(CPF, NomeAluno, SobrenomeAluno, DataNascimento, Serie, MensalidadePreco, DataMatricula, ID_Notas, ID_Responsavel)
VALUES (43592930293, 'Pedro', 'Santos', '2005/08/19', 'Primeiro E.M', 1200, '2023/01/13', 2, 2 );



--INSERE VALORES NA TABELA BOLETIM
INSERT INTO Boletim(ID_Aluno, NomeAluno, SobrenomeAluno , Serie , Portugues , Matematica , Fisica , Quimica , Biologia , Ingles , Artes , EducacaoFisica , FaltasTotal)
VALUES (2, 'Pedro', 'Santos', 'Primeiro E.M', 5, 8, 4, 6, 6, 9, 6, 7, 89);

--INSERE VALORES NA TABELA RESPONSAVEIS
INSERT INTO Responsaveis(CPF , NomeResponsavel ,SobrenomeResponsavel ,DataNascimento ,DataMatricula ,Renda,Telefone,ContatoEmergencia ,ID_Aluno 	)
VALUES (83408592042, 'Daniel', 'Melo Santos', '1983/07/23', '2023/01/13', 4500, '11949012892', '11902544942', 2);


--INSERE VALORES NA TABELA ALUNOS
INSERT INTO Alunos(CPF, NomeAluno, SobrenomeAluno, DataNascimento, Serie, MensalidadePreco, DataMatricula, ID_Notas, ID_Responsavel)
VALUES (23902930293, 'Marcio', 'Pires', '2003/08/19', 'Segundo E.M', 1400, '2022/01/13', 3, 3 );

--INSERE VALORES NA TABELA BOLETIM
INSERT INTO Boletim(ID_Aluno, NomeAluno, SobrenomeAluno , Serie , Portugues , Matematica , Fisica , Quimica , Biologia , Ingles , Artes , EducacaoFisica , FaltasTotal)
VALUES (3, 'Marcio', 'Pires', 'Primeiro E.M', 5, 8, 4, 2, 3, 1, 10, 7, 9);

--INSERE VALORES NA TABELA RESPONSAVEIS
INSERT INTO Responsaveis(CPF , NomeResponsavel ,SobrenomeResponsavel ,DataNascimento ,DataMatricula ,Renda,Telefone,ContatoEmergencia ,ID_Aluno 	)
VALUES (83468392042, 'Lucio', 'Fraga', '1983/07/23', '2023/01/13', 10500, '11949012892', '11907844952', 3);

--ADICIONA A COLUNA ID_Notas COMO ESTRANGEIRA  NA TABELA ALUNOS
ALTER TABLE Alunos
ADD CONSTRAINT FK_ID_Notas
FOREIGN KEY (ID_Notas)
REFERENCES Boletim(ID_Notas)

--ADICIONA A COLUNA ID_Responsavel COMO ESTRANGEIRA NA TABELA ALUNOS
ALTER TABLE Alunos
ADD CONSTRAINT FK_ID_Responsavel
FOREIGN KEY (ID_Responsavel)
REFERENCES Responsaveis(ID_Responsavel)

--ADICIONA A COLUNA ID_Aluno COMO ESTRANGEIRA NA TABELA RESPONSAVEIS
ALTER TABLE Responsaveis
ADD CONSTRAINT FK_ID_Aluno
FOREIGN KEY (ID_Aluno)
REFERENCES Alunos(ID_Aluno)

--ADICIONA A COLUNA ID_Aluno COMO ESTRANGEIRA NA TABELA BOLETIM
ALTER TABLE Boletim
ADD CONSTRAINT FK2_ID_Aluno
FOREIGN KEY (ID_Aluno)
REFERENCES Alunos(ID_Aluno)


--TRIGGER

--CRIA RESTRIÇOES PARA IMPEDIR O DELETE DAS TABELAS 
CREATE OR ALTER TRIGGER SegurancaDelete
ON Alunos
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Esses dados não podem ser deletados'
END
GO

CREATE OR ALTER TRIGGER SegurancaDeleteResp
ON Responsaveis
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Esses dados não podem ser deletados'
END
GO

CREATE OR ALTER TRIGGER SegurancaDeleteBoletim
ON Boletim
INSTEAD OF DELETE
AS
BEGIN
	PRINT 'Esses dados não podem ser deletados'
END
GO

DELETE FROM Responsaveis
WHERE ID_Responsavel = 1

SELECT *
FROM Responsaveis




--FUNCTION

--CONSULTA O TELEFONE DO RESPONSÁVEL DO ALUNO
CREATE FUNCTION ConsultarTelefone (@Telefone INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
	Alunos.ID_Aluno,
	NomeAluno,
	Telefone,
	ContatoEmergencia
    FROM Alunos
    INNER JOIN Responsaveis
	ON Responsaveis.ID_Responsavel = Alunos.ID_Responsavel 
    WHERE Alunos.ID_Aluno = @Telefone
);


SELECT *
FROM dbo.ConsultarTelefone(3); 




--WINDOW FUNCTION

IF EXISTS (SELECT 1 FROM SYS.objects WHERE TYPE = 'P' AND NAME = 'SP_ADD_ALUNO')
	BEGIN
		DROP PROCEDURE SP_ADD_ALUNO
	END
GO

CREATE PROCEDURE SP_ADD_ALUNO
    @CPF VARCHAR(11),
    @NomeAluno VARCHAR(30),
    @SobrenomeAluno VARCHAR(80),
    @DataNascimento DATE,
	@Serie VARCHAR(20),
	@MensalidadePreco FLOAT,
	@DataMatricula DATE, 
	@DataDesmatricula DATE, 
	@ID_Notas INT, 
	@ID_Responsavel INT
AS
    INSERT INTO Alunos(CPF, NomeAluno, SobrenomeAluno, DataNascimento, Serie, MensalidadePreco, DataMatricula, DataDesmatricula, ID_Notas, ID_Responsavel)
    VALUES (@CPF, @NomeAluno, @SobrenomeAluno, @DataNascimento, @Serie, @MensalidadePreco, @DataMatricula, @DataDesmatricula, @ID_Notas, @ID_Responsavel);
GO

EXEC SP_ADD_ALUNO
    @CPF = 69385038513,
    @NomeAluno = 'Pedro',
    @SobrenomeAluno = 'Alcantra',
	@DataNascimento = '2007/02/23',
    @Serie = 'Terceiro E.M',
	@MensalidadePreco = 1400,
	@DataMatricula = '2022/01/12',
	@DataDesmatricula = NULL,
	@ID_Notas = 2,
	@ID_Responsavel = 2

SELECT *
FROM Alunos	

--VIEW

--VER QUAIS ALUNOS FICARAM COM NOTA ABAIXO DE 6 EM PORTUGUES
CREATE VIEW vw_notas_portugues AS
SELECT 
	NomeAluno
FROM Boletim
INNER JOIN Responsaveis
ON Boletim.ID_Aluno = Responsaveis.ID_Aluno
WHERE Portugues < 6

SELECT *
FROM vw_notas_portugues
