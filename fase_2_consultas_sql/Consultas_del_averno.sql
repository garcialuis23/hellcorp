-- =================================================================
-- 	Análisis básico:
-- =================================================================
-- Número total de almas activas, redimidas y en tortura.
SELECT estado, COUNT(DISTINCT id_alma) AS total_almas
FROM registro_infernal
GROUP BY estado;

-- Promedio de nivel de corrupción por pecado capital.
SELECT pecado_capital, 
	   AVG(nivel_corrupcion) AS promedio_corrupcion
FROM (
    SELECT DISTINCT id_alma, pecado_capital, nivel_corrupcion
    FROM registro_infernal
) AS almas_unicas
GROUP BY pecado_capital;

-- Número de contratos cumplidos frente a incumplidos.
SELECT cumplido, COUNT(DISTINCT id_contrato) AS total_contratos
FROM registro_infernal
WHERE id_contrato IS NOT NULL
GROUP BY cumplido;

-- Media de duración de los tormentos por demonio responsable.
SELECT demonio_torturador, 
	   nombre_demonio_torturador, 
       AVG(duracion_horas) AS duracion_media
FROM registro_infernal
WHERE id_tormento IS NOT NULL
GROUP BY demonio_torturador, nombre_demonio_torturador;

-- =================================================================
-- 	Análisis intermedio
-- =================================================================
-- Top 10 demonios con mayor carga de trabajo (por número de tormentos asignados).
SELECT demonio_torturador, 
       nombre_demonio_torturador, 
       COUNT(DISTINCT id_tormento) AS total_tormentos
FROM registro_infernal
WHERE id_tormento IS NOT NULL
GROUP BY demonio_torturador, nombre_demonio_torturador
ORDER BY total_tormentos DESC
LIMIT 10;

-- Pecado capital más rentable (suma de valor_en_almas en contratos).
SELECT pecado_capital, 
       SUM(valor_en_almas) AS total_valor
FROM registro_infernal
WHERE id_contrato IS NOT NULL
GROUP BY pecado_capital
ORDER BY total_valor DESC;

-- Analiza si existe una relación entre el nivel de corrupción de las almas y la duración de sus castigos
-- 		Agrupa los datos por rangos de corrupción y calcula la duración media del tormento con funciones de agregación SQL (AVG, GROUP BY).
SELECT 
    CASE
        WHEN nivel_corrupcion BETWEEN 0 AND 25 THEN 'Bajo (0-25)'
        WHEN nivel_corrupcion BETWEEN 26 AND 50 THEN 'Medio (26-50)'
        WHEN nivel_corrupcion BETWEEN 51 AND 75 THEN 'Alto (51-75)'
        ELSE 'Extremo (76-100)'
    END AS rango_corrupcion,
    AVG(duracion_horas) AS duracion_media_tormento,
    COUNT(DISTINCT id_alma) AS total_almas
FROM registro_infernal
WHERE id_tormento IS NOT NULL
GROUP BY rango_corrupcion
ORDER BY rango_corrupcion;

-- Interpreta los resultados para detectar posibles tendencias: ¿las almas más corruptas reciben castigos más prolongados?
-- 																Sí las almas más corruptas reciben torturas más largas.

-- =================================================================
-- 	Análisis avanzado
-- =================================================================
-- Generar una vista vista_almas_peligrosas con las almas cuyo nivel de corrupción > 90, que tengan contratos vigentes y hayan sobrevivido a más de 3 tormentos.
CREATE VIEW vista_almas_peligrosas AS
SELECT 
    id_alma,
    nombre_alma,
    nivel_corrupcion,
    COUNT(DISTINCT id_tormento) AS tormentos_sobrevividos,
    COUNT(DISTINCT id_contrato) AS contratos_vigentes
FROM registro_infernal
WHERE nivel_corrupcion > 90
  AND id_contrato IS NOT NULL
  AND cumplido = 0
  AND id_tormento IS NOT NULL
  AND resultado_final = 'Sobrevive'
GROUP BY id_alma, nombre_alma, nivel_corrupcion
HAVING COUNT(DISTINCT id_tormento) > 3;

-- VACIA
SELECT * FROM vista_almas_peligrosas;
