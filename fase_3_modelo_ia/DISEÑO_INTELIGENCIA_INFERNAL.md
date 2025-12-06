## 🧠 FASE 3 – Diseño teórico de un modelo de Inteligencia Infernal

### **1 🔥 PROBLEMA PRINCIPAL: Optimización de la Asignación de Tormentos**

**Descripción del Problema:**
El Consejo Infernal actualmente asigna tormentos de manera ineficiente, resultando en:
- Demonios sobrecargados mientras otros están inactivos
- Tormentos inadecuados para el nivel de corrupción del alma
- Especialidades de demonios mal aprovechadas
- Baja efectividad en la "corrección" de las almas

**Impacto Económico:**
- Pérdida de eficiencia operacional del 23.4% (segun mis datos)
- 1,090 tormentos que requirieron reasignación de demonios
- Recursos infernales mal distribuidos

### **🔥 PROBLEMAS SECUNDARIOS IDENTIFICADOS:**

#### **A) Predicción de Cumplimiento de Contratos**
- **Problema:** Solo 68.2% de contratos se cumplen exitosamente
- **Oportunidad:** Predecir qué contratos fallarán antes de firmarlos

#### **B) Detección de Almas con Alto Potencial de Corrupción**
- **Problema:** Algunas almas podrían corromperse más rápido con el tormento adecuado
- **Oportunidad:** Identificar patrones de corrupción acelerada

#### **C) Optimización de Recursos Demoníacos**
- **Problema:** Distribución desigual de carga de trabajo entre demonios
- **Oportunidad:** Balancear cargas y maximizar especialidades


---

## 📊 **2. VARIABLES RELEVANTES Y OBJETIVOS**

### **🎯 MODELO PRINCIPAL: Optimización de Asignación de Tormentos**

#### **Variables de Entrada (Features/Inputs):**

**📋 Variables del Alma:**
- `nivel_corrupcion` (numérico: 1-100)
- `fecha_llegada` (temporal: días en el infierno)
- `pecado_capital` (categórico: 7 categorías)
- `edad_muerte` (numérico, derivado de fecha_nacimiento)

**👹 Variables del Demonio:**
- `especialidad` (categórico: Tortura física, psicológica, etc.)
- `nivel_ira` (numérico: 1-10)  
- `activo` (booleano: 1/0)
- `carga_trabajo_actual` (numérico: tormentos asignados)

**⚡ Variables del Contexto:**
- `tipos_tormento_disponibles` (categórico)
- `estacionalidad_infernal` (temporal)
- `recursos_disponibles` (numérico)

**📈 Variables Históricas:**
- `tormentos_previos_alma` (numérico)
- `efectividad_demonio_especialidad` (numérico: ratio éxito)
- `tiempo_promedio_tormento` (numérico: días)

#### **Variable Objetivo (Target):**
- **`efectividad_tormento`** (numérico: 0-100)
  - Medida compuesta de:
    - Reducción en nivel de corrupción
    - Tiempo de completación
    - Satisfacción del demonio torturador
    - Recursos utilizados

---

## 🤖 **3. TIPO DE MODELO RECOMENDADO**

### **🎯 ENFOQUE HÍBRIDO MULTI-MODELO:**

#### **MODELO: SUPERVISADO**
**Razón:** Tenemos datos históricos etiquetados de tormentos y sus resultados

**¿Por qué Supervisado?**
- Tenemos 26,204 registros históricos etiquetados
- Podemos medir resultados de tormentos pasados
- Relaciones causa-efecto claramente definidas

#### **MODELO: NO SUPERVISADO**
**Razón:** Descubrir patrones ocultos en comportamientos de almas

**¿Por qué No Supervisado?**
- Descubrir subtipos de almas no evidentes
- Identificar patrones de comportamiento demoníaco
- Optimizar agrupaciones para eficiencia

#### **MODELO: APRENDIZAJE POR REFUERZO**
**Razón:** El sistema puede aprender de cada asignación y optimizar decisiones futuras

**¿Por qué Refuerzo?**
- El sistema puede mejorar continuamente
- Decisiones secuenciales (un tormento afecta al siguiente)
- Retroalimentación inmediata del resultado

---

## **4. ALGORITMOS CONSIDERADOS - ANÁLISIS ESPECÍFICO CON TUS DATOS**

## A) Modelos Supervisados

**Objetivo:** Predecir la efectividad del tormento (`efectividad_tormento`)

| Tipo | Algoritmo | Justificación |
|------|-----------|---------------|
| Árboles de Decisión | Random Forest, XGBoost | Captura relaciones no lineales entre variables como `nivel_corrupcion`, especialidad demonio, tipos de tormento. Robusto a datos mixtos (numéricos y categóricos). |
| Regresión | Regresión Lineal o Ridge/Lasso | Útil si la relación entre inputs y efectividad es aproximadamente lineal. Permite interpretar coeficientes. |
| Redes Neuronales | MLP (Multi-layer Perceptron) | Puede modelar interacciones complejas, útil si hay muchas variables y datos históricos abundantes. |

---

## B) Modelos No Supervisados

**Objetivo:** Descubrir patrones ocultos en almas y demonios

| Tipo | Algoritmo | Justificación |
|------|-----------|---------------|
| Clustering | K-Means, DBSCAN | Agrupa almas según nivel de corrupción, pecado capital y tormentos previos. Útil para segmentación de “tipos de almas” y asignación personalizada. |
| Reducción Dimensional | PCA, t-SNE | Detectar patrones complejos y visualización de clusters. |

---

## C) Aprendizaje por Refuerzo

**Objetivo:** Optimizar asignación de tormentos de forma dinámica

| Tipo | Algoritmo | Justificación |
|------|-----------|---------------|
| Q-Learning | Tabular o Deep Q-Network (DQN) | El sistema aprende qué tormentos asignar a cada alma para maximizar la efectividad. Retroalimentación inmediata tras cada tormento. |
