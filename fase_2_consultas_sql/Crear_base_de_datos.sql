DROP DATABASE IF EXISTS Averno;
CREATE DATABASE IF NOT EXISTS Averno;
USE Averno;

CREATE TABLE souls (
    id_alma INT PRIMARY KEY,
    nombre VARCHAR(100),
    pecado_capital VARCHAR(50),
    nivel_corrupcion INT,
    fecha_condena DATE,
    dimension_origen VARCHAR(100),
    estado ENUM('activa', 'en proceso de tortura', 'redimida')
);

CREATE TABLE demonios (
    id_demonio INT PRIMARY KEY,
    nombre_demonio VARCHAR(100),
    rango VARCHAR(50),
    especialidad VARCHAR(100),
    nivel_ira INT,
    siglo_servicio INT,
    activo BOOLEAN
);

CREATE TABLE tormentos (
    id_tormento INT PRIMARY KEY,
    id_alma INT,
    tipo_tormento VARCHAR(100),
    nivel_intensidad INT,
    duracion_horas INT,
    responsable_demonio INT,
    resultado_final VARCHAR(255),
    FOREIGN KEY (id_alma) REFERENCES souls(id_alma),
    FOREIGN KEY (responsable_demonio) REFERENCES demonios(id_demonio)
);

CREATE TABLE contratos (
    id_contrato INT PRIMARY KEY,
    id_alma INT,
    fecha_firma DATE,
    valor_en_almas DECIMAL(10,2),
    clausulas TEXT,
    cumplido BOOLEAN,
    demonio_firmante INT,
    FOREIGN KEY (id_alma) REFERENCES souls(id_alma),
    FOREIGN KEY (demonio_firmante) REFERENCES demonios(id_demonio)
);


SELECT DATABASE();
SHOW TABLES;

SELECT * FROM CONTRATOS;
SELECT * FROM DEMONIOS;
SELECT * FROM SOULS;
SELECT * FROM TORMENTOS;

SELECT DIMENSION_ORIGEN FROM SOULS;
