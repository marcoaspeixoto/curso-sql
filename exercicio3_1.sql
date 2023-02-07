CREATE DATABASE exercicio3_1;

USE exercicio3_1;

CREATE TABLE tipo
(
	codigo int unsigned not null auto_increment,
    tipo varchar(40) not null,
    PRIMARY KEY (codigo)
);