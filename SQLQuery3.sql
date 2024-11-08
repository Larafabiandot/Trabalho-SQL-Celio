USE sg_projetos;

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(40),
    email VARCHAR(100),
    departamento INT,
);

CREATE TABLE departamentos (
    id_dpt INT PRIMARY KEY,
    nome_dpt VARCHAR(30),
    descricao VARCHAR(200),
    responsavel VARCHAR(50)
);

CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY,
    gerente_id INT,
    nome VARCHAR(100),
    descricao VARCHAR(200),
    data_inicio DATE,
    data_fim DATE,
    status_projeto VARCHAR(30),
    FOREIGN KEY (gerente_id) REFERENCES usuarios(id_usuario)
);

CREATE TABLE tasks (
    id_task INT PRIMARY KEY,
    id_projeto INT,
    descricao_tasks VARCHAR(200),
    data_inicio_planejada DATE,
    data_fim_planejada DATE,
    data_inicio_real DATE,
    data_fim_real DATE,
    status_task VARCHAR(30),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id_projeto)
);

CREATE TABLE recursos (
    id_recurso INT PRIMARY KEY,
    tipo_recurso VARCHAR(100),
    descricao VARCHAR(200)
);

CREATE TABLE historico (
    cod_registro INT PRIMARY KEY,
    tabela_alterada VARCHAR(30),
    campo_alterado VARCHAR(30)
);

CREATE TABLE equipes (
    nome_equipe VARCHAR(50) PRIMARY KEY,
    id_dpt INT,
    id_projeto INT,
    FOREIGN KEY (id_dpt) REFERENCES departamentos(id_dpt),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id_projeto)
);
