# 🔥 PRUEBA TÉCNICA 1: "HELLCORP - Integración y Análisis de Datos en el Inframundo"

## [Enlace GitHub](https://classroom.github.com/a/_-ogne2a)

---

## 😈 Contexto

Año 2225.
El equilibrio entre el mundo humano y el inframundo se ha roto.
Una corporación multinacional llamada **HELLCORP** -propiedad de la todopoderosa división tecnológica del Infierno- ha logrado monopolizar todos los flujos de almas, pecados y contratos infernales mediante un complejo sistema de **datos masivos**.

Sin embargo, los sistemas de gestión del Averno están al borde del colapso:
las bases de datos arden (literalmente), los demonios analistas insertan duplicados sin control, y los registros de almas llegan en formatos tan caóticos como los archivos CSV del departamento de Torturas Eternas.

Tu misión, si sobrevives lo suficiente, es **poner orden en el caos infernal**.

Has sido contratado como **Data Engineer Infernalis**, y deberás demostrar en 4 días tu capacidad para:

* recibir, transformar y depurar datos provenientes de distintos dominios del inframundo,
* integrarlos en un sistema MySQL estable,
* realizar consultas que ayuden a los Señores del Fuego a tomar decisiones,
* y finalmente, diseñar un plan teórico de cómo la Inteligencia Artificial podría usarse para anticipar la corrupción del alma humana.

---

## 🔥 Escenario narrativo

HELLCORP gestiona millones de almas y recursos del inframundo.
Sus departamentos principales son:

1. **Captación de almas (souls.csv)** – donde se registran las almas adquiridas y su nivel de corrupción.
2. **Tortura y castigo (tormentos.csv)** – donde se asignan castigos personalizados según los pecados cometidos.
3. **Departamentos de recursos demoníacos (demonios.csv)** – control del personal infernal (demonios, súcubos, etc).
4. **Contratos infernales (contratos.csv)** – acuerdos firmados con humanos, incluyendo precio, duración y cláusulas infernales.

Tu trabajo consiste en limpiar, integrar y analizar estos datos para que los Señores del Consejo Infernal puedan optimizar la asignación de castigos y aumentar la rentabilidad de las almas.

---

## 📦 Material proporcionado

Los siguientes archivos CSV se te entregan en bruto.
*(Están plagados de errores, nulos, duplicados y datos inconsistentes… como corresponde al Infierno.)*

1. **souls.csv**
   Campos:
   `id_alma`, `nombre`, `pecado_capital`, `nivel_corrupcion`, `fecha_condena`, `dimension_origen`, `estado`
   *(estado: activa / en proceso de tortura / redimida)*

2. **tormentos.csv**
   Campos:
   `id_tormento`, `id_alma`, `tipo_tormento`, `nivel_intensidad`, `duracion_horas`, `responsable_demonio`, `resultado_final`

3. **demonios.csv**
   Campos:
   `id_demonio`, `nombre_demonio`, `rango`, `especialidad`, `nivel_ira`, `siglo_servicio`, `activo`
   *(rango: íncubo, súcubo, verdugo, archidemonio, etc.)*

4. **contratos.csv**
   Campos:
   `id_contrato`, `id_alma`, `fecha_firma`, `valor_en_almas`, `clausulas`, `cumplido`, `demonio_firmante`

---

## 🧩 Tareas a realizar

### 🔧 **FASE 1 – Limpieza e integración infernal de datos**

1. Carga los cuatro CSV con **pandas** y realiza una exploración básica (filas, columnas, tipos, valores únicos).
2. Detecta y documenta los errores:
   * almas duplicadas,
   * valores nulos,
   * fechas imposibles (como condenas del siglo XV con contratos del año 3000),
   * demonios inactivos asignados a tormentos, etc.
3. Aplica transformaciones:
   * limpieza y normalización de columnas,
   * conversión de fechas,
   * sustitución o eliminación de registros corruptos,
   * relaciones entre tablas (`id_alma`, `id_demonio`).
4. Crea una tabla maestra `registro_infernal` con información combinada de almas, tormentos y contratos.
5. Exporta todo el sistema limpio a **MySQL**, dentro del esquema `hellcorp`.

---

### 🔥 **FASE 2 – Consultas SQL del Averno**

Diseña y ejecuta consultas que permitan responder a las demandas del Consejo Infernal:

1. **Análisis básico:**

   * Número total de almas activas, redimidas y en tortura.
   * Promedio de nivel de corrupción por pecado capital.
   * Número de contratos cumplidos frente a incumplidos.
   * Media de duración de los tormentos por demonio responsable.

2. **Análisis intermedio:**

   * Top 10 demonios con mayor carga de trabajo (por número de tormentos asignados).
   * Pecado capital más rentable (suma de valor_en_almas en contratos).
   * Analiza si existe una relación entre el nivel de corrupción de las almas y la duración de sus castigos.
     * Agrupa los datos por rangos de corrupción y calcula la duración media del tormento con funciones de agregación SQL (AVG, GROUP BY).
     * Interpreta los resultados para detectar posibles tendencias: ¿las almas más corruptas reciben castigos más prolongados?
     * No es necesario calcular una correlación estadística exacta, basta con observar patrones o comportamientos generales en los datos.
   * Porcentaje de almas provenientes de cada dimensión de origen.

3. **Análisis avanzado:**

   * Generar una vista `vista_almas_peligrosas` con las almas cuyo nivel de corrupción > 90,
     que tengan contratos vigentes y hayan sobrevivido a más de 3 tormentos.

---

### 🧠 **FASE 3 – Diseño teórico de un modelo de Inteligencia Infernal**

En esta fase no se requiere implementación práctica de IA,
pero sí un análisis **conceptual y técnico** de cómo el Consejo Infernal podría utilizar la inteligencia artificial para optimizar sus operaciones.

Responde a las siguientes cuestiones:

1. ¿Qué problema infernal podría resolverse mediante IA o ML?
2. ¿Qué variables serían relevantes (inputs) y cuál sería la variable objetivo?
3. ¿Qué tipo de modelo usarías? (supervisado / no supervisado / reforzado / otro).
4. ¿Qué algoritmos considerarías? (árboles de decisión, regresión, clustering, redes neuronales, etc.).

---

### 🕯️ **FASE 4 – Informe y comunicación al Consejo Infernal**

Prepara un **informe final (presentación .pdf)** con:

1. Descripción del proceso de limpieza y transformación. Cuanto más gráfico y visual mejor.
2. Resultados y conclusiones de tus consultas SQL. Muestra la consulta SQL realizada y el resultado.
3. Propuesta teórica del modelo de IA infernal.
4. Se valorará mucho el orden del proyecto, la documentación realizada y la estética de la presentación.

---

## 📜 Entregables finales

1. **Notebook Jupyter (.ipynb)** con el pipeline de limpieza y carga.
2. **Export SQL (.sql)** del esquema `hellcorp` generado (incluyendo los datos limpios).
3. **Archivo de consultas SQL (.sql)** con las sentencias ejecutadas.
4. **Informe final / presentación (.pdf)** con resultados, visualizaciones y conclusiones.
5. Carpeta con los CSV originales y transformados.

## 🕯️ Reglas del Consejo Infernal

* Documenta tus decisiones: toda manipulación de datos debe estar justificada ante el Trono de Azufre.
* El uso de scripts externos está permitido, pero debes explicar su propósito.
* No se requiere ejecución de modelos de IA, solo razonamiento técnico.
* El plagio o la copia se considerará **pacto demoníaco no autorizado** y se penalizará con pérdida de puntos eternos.