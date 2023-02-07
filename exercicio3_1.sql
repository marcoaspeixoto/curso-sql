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
