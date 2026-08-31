CREATE DATABASE IF NOT EXISTS rail_view_db;
USE rail_view_db;

CREATE TABLE Perfil (
    id_perfil INT AUTO_INCREMENT PRIMARY KEY,
    nome_perfil VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    id_perfil INT NOT NULL,

    FOREIGN KEY (id_perfil)
    REFERENCES Perfil(id_perfil)
);

CREATE TABLE Trem (
    id_trem INT AUTO_INCREMENT PRIMARY KEY,
    apelido VARCHAR(100) NOT NULL,
    tipo_trem VARCHAR(50) NOT NULL,
    empresa_operadora VARCHAR(150),
    modelo VARCHAR(100) NOT NULL,
    numero_vagoes INT NOT NULL
);

CREATE TABLE Sensor (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    tipo_sensor VARCHAR(50) NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    status_sensor VARCHAR(20) NOT NULL,
    empresa_operadora VARCHAR(100) NOT NULL,
    id_trem INT NOT NULL,

    FOREIGN KEY (id_trem)
    REFERENCES Trem(id_trem)
);

CREATE TABLE Rota (
    id_rota INT AUTO_INCREMENT PRIMARY KEY,
    nome_rota VARCHAR(150) NOT NULL,
    origem VARCHAR(150) NOT NULL,
    destino VARCHAR(150) NOT NULL,
    apelido VARCHAR(100),
    operadora VARCHAR(150) NOT NULL,
    inicio_previsto DATETIME,
    fim_previsto DATETIME,
    relatorio TEXT
);

CREATE TABLE Historico_Rota (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME,
    id_trem INT NOT NULL,
    id_rota INT NOT NULL,

    FOREIGN KEY (id_trem)
    REFERENCES Trem(id_trem),

    FOREIGN KEY (id_rota)
    REFERENCES Rota(id_rota)
);

CREATE TABLE Alerta (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    mensagem VARCHAR(255) NOT NULL,
    data_alerta DATETIME NOT NULL,
    nivel VARCHAR(20),
    id_sensor INT NOT NULL,

    FOREIGN KEY (id_sensor)
    REFERENCES Sensor(id_sensor)
);

CREATE TABLE Manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    descricao TEXT,
    id_trem INT NOT NULL,

    FOREIGN KEY (id_trem)
    REFERENCES Trem(id_trem)
);