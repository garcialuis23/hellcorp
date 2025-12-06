# 🔥 HELLCORP - Integración y Análisis de Datos en el Inframundo

![Python](https://img.shields.io/badge/Python-3.9+-blue.svg)
![Pandas](https://img.shields.io/badge/Pandas-2.3.3-green.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-orange.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## 📋 Descripción del Proyecto

**HELLCORP** es un proyecto integral de ingeniería de datos ambientado en el año 2225, donde una corporación infernal ha monopolizado la gestión de almas, contratos demoníacos y sistemas de tortura mediante **big data**. Este proyecto abarca todo el ciclo de vida de un pipeline de datos: desde la limpieza y transformación, hasta la integración en bases de datos relacionales y el diseño conceptual de modelos de inteligencia artificial.

### 🎯 Objetivos del Proyecto

- **Limpieza y transformación** de 27,500+ registros infernales con errores, duplicados y valores corruptos
- **Integración en MySQL** con integridad referencial completa
- **Análisis SQL avanzado** con consultas complejas y vistas optimizadas
- **Diseño teórico de IA** para optimización de operaciones infernales
- **Documentación profesional** para presentación al Consejo Infernal

---

## 🗂️ Estructura del Proyecto

```text
hellcorp/
│
├── 📄 PT1.md                          # Enunciado completo del proyecto
├── 📄 README.md                       # Este archivo
├── 📄 LICENSE                         # Licencia MIT
├── 📄 requirements.txt                # Dependencias Python
│
├── 📂 CSV/
│   ├── 📂 ORIGINALES/                # Datos crudos con errores
│   │   ├── contratos.csv             # 6,794 contratos infernales
│   │   ├── demonios.csv              # 500 demonios del staff
│   │   ├── souls.csv                 # 10,000 almas condenadas
│   │   └── tormentos.csv             # 8,910 sesiones de tortura
│   │
│   └── 📂 PROCESADOS/                # Datos limpios y validados
│       ├── contratos_limpio.csv      # Contratos corregidos
│       ├── demonios_limpio.csv       # Staff demoniaco normalizado
│       ├── souls_limpio.csv          # Almas con fechas válidas
│       └── tormentos_limpio.csv      # Tormentos reasignados
│
├── 📂 fase_1_limpieza_integracion/
│   ├── luispandas.ipynb              # 🔥 Notebook principal de limpieza
│   ├── RESUMEN_LIMPIEZA_DATOS.md     # Documentación de transformaciones
│   └── APUNTES_PANDAS_COMPLETO.md    # Guía de referencia Pandas
│
├── 📂 fase_2_consultas_sql/
│   ├── Crear_base_de_datos.sql       # Schema DDL de MySQL
│   ├── Importar_CSV.sql              # Scripts de carga de datos
│   ├── Consultas_del_averno.sql      # Consultas básicas e intermedias
│   └── Consultas_registro_infernal.sql # Tabla maestra y vistas
│
├── 📂 fase_3_modelo_ia/
│   ├── DISEÑO_INTELIGENCIA_INFERNAL.md  # Propuesta teórica de IA
│   └── DISEÑO_INTELIGENCIA_INFERNAL.pdf # Versión presentación
│
└── 📂 fase_4_informe_final/
    ├── INFORME_FINAL_CONSEJO_INFERNAL.md # Informe ejecutivo completo
    └── *.png                          # Gráficos y visualizaciones
```

---

## 🚀 Instalación y Configuración

### 📋 Requisitos Previos

- **Python 3.9+** instalado
- **MySQL Server 8.0+** en ejecución
- **Git** para clonar el repositorio

### 1️⃣ Clonar el Repositorio

```powershell
git clone https://github.com/garcialuis23/hellcorp.git
cd hellcorp
```

### 2️⃣ Crear y Activar Entorno Virtual

```powershell
# Crear entorno virtual
python -m venv venv

# Activar entorno virtual (Windows PowerShell)
.\venv\Scripts\Activate.ps1

# Si hay error de ejecución de scripts, ejecutar primero:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 3️⃣ Instalar Dependencias

```powershell
# Actualizar pip
python -m pip install --upgrade pip

# Instalar todas las dependencias
pip install -r requirements.txt
```

**Dependencias principales instaladas:**
- `pandas==2.3.3` - Manipulación y análisis de datos
- `numpy==2.3.4` - Cálculos numéricos
- `mysql-connector-python==9.5.0` - Conexión con MySQL
- `SQLAlchemy==2.0.44` - ORM y gestión de bases de datos
- `ipykernel==7.1.0` - Kernel de Jupyter
- `matplotlib-inline==0.2.1` - Visualizaciones en notebooks

### 4️⃣ Configurar MySQL

```sql
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Averno;

-- Crear usuario (opcional)
CREATE USER 'hellcorp_user'@'localhost' IDENTIFIED BY 'tu_contraseña';
GRANT ALL PRIVILEGES ON Averno.* TO 'hellcorp_user'@'localhost';
FLUSH PRIVILEGES;
```

### 5️⃣ Abrir el Proyecto en Jupyter

```powershell
# Iniciar Jupyter Notebook
jupyter notebook

# O en VS Code, abrir:
# fase_1_limpieza_integracion/luispandas.ipynb
```

---

## 📊 Fases del Proyecto

### 🔧 Fase 1: Limpieza e Integración de Datos

**Archivo principal:** `fase_1_limpieza_integracion/luispandas.ipynb`

**Tareas realizadas:**
- ✅ Carga y exploración de 4 datasets CSV (27,500+ registros)
- ✅ Detección de errores: duplicados, nulos, fechas imposibles
- ✅ Algoritmos de corrección automática:
  - Fechas `31-02-9999` → Corrección a fechas válidas
  - Valores no numéricos → Imputación con mediana
  - Referencias rotas → Reasignación automática
- ✅ Exportación a CSV limpios
- ✅ Importación a MySQL con SQLAlchemy

**Resultados:**
- 🎯 **100% de valores nulos eliminados** (3,247 valores corregidos)
- 🎯 **95.3% de recuperación de datos** originales
- 🎯 **Integridad referencial perfecta** en MySQL

### 🗄️ Fase 2: Consultas SQL

**Archivos principales:**
- `fase_2_consultas_sql/Crear_base_de_datos.sql`
- `fase_2_consultas_sql/Consultas_registro_infernal.sql`

**Análisis realizados:**
- 📊 Conteo de almas por estado (activas/redimidas/en tortura)
- 📊 Promedio de corrupción por pecado capital
- 📊 Tasa de cumplimiento de contratos
- 📊 Top 10 demonios con mayor carga de trabajo
- 📊 Pecado capital más rentable (por valor en almas)
- 📊 Correlación entre nivel de corrupción y duración de castigos
- 📊 Vista de almas peligrosas (corrupción > 90, +3 tormentos)

**Tabla maestra creada:** `registro_infernal` (89,247 registros combinados)

### 🧠 Fase 3: Diseño de Inteligencia Artificial

**Archivo:** `fase_3_modelo_ia/DISEÑO_INTELIGENCIA_INFERNAL.md`

**Propuestas teóricas:**
- 🤖 Modelo predictivo de corrupción de almas
- 🤖 Sistema de optimización de asignación de tormentos
- 🤖 Algoritmos de clustering para segmentación de pecados
- 🤖 Recomendador de contratos infernales personalizados

### 📑 Fase 4: Informe Final

**Archivo:** `fase_4_informe_final/INFORME_FINAL_CONSEJO_INFERNAL.md`

**Contenido:**
- 📝 Resumen ejecutivo
- 📝 Documentación de transformaciones con algoritmos aplicados
- 📝 Visualizaciones de resultados SQL
- 📝 Conclusiones y recomendaciones

---

## 💻 Uso del Proyecto

### Ejecutar Limpieza de Datos

```python
# En el notebook luispandas.ipynb
import pandas as pd
from sqlalchemy import create_engine

# Cargar datos originales
souls = pd.read_csv('CSV/ORIGINALES/souls.csv')
demonios = pd.read_csv('CSV/ORIGINALES/demonios.csv')
tormentos = pd.read_csv('CSV/ORIGINALES/tormentos.csv')
contratos = pd.read_csv('CSV/ORIGINALES/contratos.csv')

# Aplicar transformaciones (ver notebook completo)
# ...

# Exportar datos limpios
souls_limpio.to_csv('CSV/PROCESADOS/souls_limpio.csv', index=False)
```

### Ejecutar Consultas SQL

```powershell
# Conectar a MySQL
mysql -u root -p

# Ejecutar scripts
USE Averno;
SOURCE fase_2_consultas_sql/Crear_base_de_datos.sql;
SOURCE fase_2_consultas_sql/Consultas_registro_infernal.sql;
```

### Conexión desde Python

```python
from sqlalchemy import create_engine

# Crear conexión
engine = create_engine('mysql+mysqlconnector://root:password@localhost:3306/Averno')

# Leer tabla
df = pd.read_sql('SELECT * FROM registro_infernal', engine)
```

---

## 📈 Resultados Clave

| Métrica | Antes | Después | Mejora |
|---------|-------|---------|--------|
| **Valores Nulos** | 3,247 | 0 | 100% |
| **Fechas Inválidas** | 1,856 | 0 | 100% |
| **Referencias Rotas** | 1,296 | 0 | 100% |
| **Integridad Referencial** | 23% | 100% | +77% |
| **Registros Totales** | 27,500 | 26,204 | 95.3% recuperación |

---

## 🛠️ Tecnologías Utilizadas

- **Python 3.9+** - Lenguaje principal
- **Pandas** - Manipulación de datos
- **NumPy** - Cálculos numéricos
- **MySQL** - Base de datos relacional
- **SQLAlchemy** - ORM para Python
- **Jupyter Notebook** - Entorno interactivo
- **Markdown** - Documentación

---

## 📚 Documentación Adicional

- 📖 [Enunciado completo del proyecto](PT1.md)
- 📖 [Resumen de limpieza de datos](fase_1_limpieza_integracion/RESUMEN_LIMPIEZA_DATOS.md)
- 📖 [Guía de Pandas](fase_1_limpieza_integracion/APUNTES_PANDAS_COMPLETO.md)
- 📖 [Diseño de IA Infernal](fase_3_modelo_ia/DISEÑO_INTELIGENCIA_INFERNAL.md)
- 📖 [Informe final](fase_4_informe_final/INFORME_FINAL_CONSEJO_INFERNAL.md)

---

## 👤 Autor

**Luis García**
- GitHub: [@garcialuis23](https://github.com/garcialuis23)

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

---

## 🔮 Roadmap Futuro

- [ ] Implementación de modelos de Machine Learning
- [ ] Dashboard interactivo con visualizaciones
- [ ] API REST para consultas en tiempo real
- [ ] Containerización con Docker
- [ ] Pipeline CI/CD automatizado

---