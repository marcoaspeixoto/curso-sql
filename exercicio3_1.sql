CREATE DATABASE exercicio3_1;

USE exercicio3_1;

CREATE TABLE tipos
(
	codigo int unsigned not null auto_increment,
    tipo varchar(40) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE instrutores
(
	codigo int unsigned not null auto_increment,
    instrutor varchar(45) not null,
    telefone char(9) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE cursos
(
	codigo int unsigned not null auto_increment,
    curso varchar(45) not null,
    tipo_codigo int unsigned default null,
    instrutor_codigo int unsigned default null,
    valor double not null,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_cursos_tipos FOREIGN KEY (tipo_codigo) REFERENCES tipos (codigo),
    CONSTRAINT fk_cursos_instrutores FOREIGN KEY (instrutor_codigo) REFERENCES instrutores (codigo)
);

RENAME TABLE tipo TO tipos;
RENAME TABLE instrutor TO instrutores;

CREATE TABLE alunos
(
	codigo int unsigned not null auto_increment,
    aluno varchar(45) not null,
    endereco varchar(60) not null,
    email varchar(40) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE pedidos
(
	codigo int unsigned not null auto_increment,
    aluno_codigo int unsigned default null,
    data date not null,
    hora time not null,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_pedidos_alunos FOREIGN KEY (aluno_codigo) REFERENCES alunos (codigo)
);

CREATE TABLE pedido_detalhe
(
	pedido_codigo int unsigned default null,
    curso_codigo int unsigned default null,
    valor double not null,
    CONSTRAINT fk_pedido_detalhe_pedido FOREIGN KEY (pedido_codigo) REFERENCES pedidos (codigo),
    CONSTRAINT fk_pedido_detalhe_curso FOREIGN KEY (curso_codigo) REFERENCES cursos (codigo)
);

ALTER TABLE instrutores MODIFY telefone varchar(9) null;
ALTER TABLE cursos MODIFY tipo_codigo int unsigned not null;
CREATE INDEX fk_tipo ON cursos (tipo_codigo);
CREATE INDEX fk_instrutor ON cursos (instrutor_codigo);
ALTER TABLE pedidos MODIFY aluno_codigo int unsigned not null;
ALTER TABLE pedidos CHANGE data data_hora datetime not null;
CREATE INDEX fk_aluno ON pedidos (aluno_codigo);
ALTER TABLE pedido_detalhe MODIFY pedido_codigo int unsigned not null;
ALTER TABLE pedido_detalhe MODIFY curso_codigo int unsigned not null;
CREATE INDEX fk_pedido ON pedido_detalhe (pedido_codigo);
CREATE INDEX fk_curso ON pedido_detalhe (curso_codigo);
ALTER TABLE pedido_detalhe ADD PRIMARY KEY (pedido_codigo, curso_codigo);
ALTER TABLE alunos ADD data_nascimento char(10);