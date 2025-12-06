-- SELECCIONAR BASE DE DATOS
USE Averno;

-- VERIFICAR QUE TABLAS EXISTEN EN LA BASE DE DATOS
SHOW TABLES;

-- VERIFICAR ESTRUCTURA DE LAS TABLAS PRINCIPALES
DESCRIBE contratos;
DESCRIBE demonios;
DESCRIBE souls;
DESCRIBE tormentos;

-- CONSULTAS BÁSICAS DE CONTEO
SELECT COUNT(*) FROM contratos;
SELECT COUNT(*) FROM demonios;
SELECT COUNT(*) FROM souls;
SELECT COUNT(*) FROM tormentos;

-- =================================================================
-- TABLA MAESTRA: REGISTRO_INFERNAL
-- Combina información de almas, tormentos y contratos
-- =================================================================

CREATE TABLE IF NOT EXISTS registro_infernal AS
SELECT 
    -- Información del alma
    s.id_alma,
    s.nombre AS nombre_alma,
    s.pecado_capital,
    s.nivel_corrupcion,
    s.fecha_condena,
    s.dimension_origen,
    s.estado,
    
    -- Información del tormento
    t.id_tormento,
    t.tipo_tormento,
    t.nivel_intensidad,
    t.duracion_horas,
    t.responsable_demonio AS demonio_torturador,
    t.resultado_final,
    
    -- Información del demonio torturador
    d_tort.nombre_demonio AS nombre_demonio_torturador,
    d_tort.especialidad AS especialidad_torturador,
    d_tort.nivel_ira AS ira_torturador,
    
    -- Información del contrato
    c.id_contrato,
    c.fecha_firma,
    c.valor_en_almas,
    c.clausulas,
    c.cumplido,
    c.demonio_firmante AS demonio_contratista,
    
    -- Información del demonio contratista
    d_cont.nombre_demonio AS nombre_demonio_contratista,
    d_cont.especialidad AS especialidad_contratista,
    d_cont.rango AS rango_contratista

FROM souls s
LEFT JOIN tormentos t ON s.id_alma = t.id_alma
LEFT JOIN demonios d_tort ON t.responsable_demonio = d_tort.id_demonio
LEFT JOIN contratos c ON s.id_alma = c.id_alma
LEFT JOIN demonios d_cont ON c.demonio_firmante = d_cont.id_demonio

ORDER BY s.id_alma, c.fecha_firma;

SELECT * FROM REGISTRO_INFERNAL;

-- 1. Ver qué almas existen
SELECT id_alma FROM souls;

-- 2. Ver qué almas están en tormentos
SELECT DISTINCT id_alma FROM tormentos;

-- 3. Ver qué almas están en contratos
SELECT DISTINCT id_alma FROM contratos;

-- Almas que tienen (contrato y tormento), podrías usar:
SELECT *
FROM registro_infernal
WHERE id_tormento IS NOT NULL AND id_contrato IS NOT NULL;

-- Almas sin tormentos
SELECT s.id_alma, s.nombre
FROM souls s
LEFT JOIN tormentos t ON s.id_alma = t.id_alma
WHERE t.id_tormento IS NULL;

-- Almas sin contratos
SELECT s.id_alma, s.nombre
FROM souls s
LEFT JOIN contratos c ON s.id_alma = c.id_alma
WHERE c.id_contrato IS NULL;

SELECT COUNT(*) FROM registro_infernal;
SELECT * FROM REGISTRO_INFERNAL;