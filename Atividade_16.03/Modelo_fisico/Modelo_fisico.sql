-- Tabela de Cursos
CREATE TABLE Curso (
    ID_curso INT PRIMARY KEY,
    Nome VARCHAR(100),
    Carga_h INT,
    Mensalidade DECIMAL(8, 2)
);

-- Tabela de Professores
CREATE TABLE Professor (
    ID_prof INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cpf VARCHAR(14) UNIQUE,
    Idioma VARCHAR(50),
    Horario VARCHAR(50)
);

--Tabela de Alunos
CREATE TABLE Aluno (
    ID_aluno INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Cpf VARCHAR(14) UNIQUE,
    Telefone VARCHAR(20)
);

--Tabela de Turmas
CREATE TABLE Turma (
    ID_turma INT PRIMARY KEY,
    Semestre VARCHAR(10),
    Sala VARCHAR(20),
    ID_curso INT,
    ID_prof INT,
    FOREIGN KEY (ID_curso) REFERENCES Curso(ID_curso),
    FOREIGN KEY (ID_prof) REFERENCES Professor(ID_prof)
);

--Tabela de Matrícula
CREATE TABLE Matricula (
    ID_matricula INT PRIMARY KEY,
    Data_matricula DATE,
    Status VARCHAR(20),
    ID_aluno INT,
    ID_turma INT,
    FOREIGN KEY (ID_aluno) REFERENCES Aluno(ID_aluno),
    FOREIGN KEY (ID_turma) REFERENCES Turma(ID_turma)
);