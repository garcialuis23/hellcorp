# 📚 APUNTES COMPLETOS DE PANDAS
## Guía práctica para resolver ejercicios con el dataset de pingüinos

---

## 🚀 1. IMPORTACIÓN Y CARGA DE DATOS

### Importar pandas
```python
import pandas as pd
```

### Cargar datos desde URL o archivo
```python
# Desde URL
url = "https://raw.githubusercontent.com/allisonhorst/palmerpenguins/main/inst/extdata/penguins.csv"
df = pd.read_csv(url)

# Desde archivo local
df = pd.read_csv('archivo.csv')
```

### Primeras visualizaciones del DataFrame
```python
df.head()        # Primeras 5 filas (por defecto)
df.head(10)      # Primeras 10 filas
df.tail()        # Últimas 5 filas
df.sample(5)     # 5 filas aleatorias
```

---

## 🔍 2. EXPLORACIÓN INICIAL DEL DATASET

### Información básica del DataFrame
```python
# Dimensiones (filas, columnas)
df.shape

# Nombres de las columnas
df.columns
df.columns.tolist()  # Como lista

# Tipos de datos
df.dtypes
df.info()  # Información completa: tipos, nulos, memoria

# Índice
df.index
```

### Estadísticas descriptivas
```python
# Solo columnas numéricas
df.describe()

# Todas las columnas (incluyendo categóricas)
df.describe(include='all')

# Estadísticas específicas
df.mean()     # Media
df.median()   # Mediana
df.std()      # Desviación estándar
df.min()      # Valor mínimo
df.max()      # Valor máximo
df.count()    # Conteo de valores no nulos
```

### Manejo de valores nulos
```python
# Detectar valores nulos
df.isnull()           # Matriz booleana
df.isnull().sum()     # Conteo por columna
df.isna()             # Igual que isnull()

# Información específica de nulos
df['columna'].isnull().sum()  # Nulos en una columna específica

# Verificar si hay nulos
df.isnull().any()     # ¿Hay algún nulo por columna?
df.isnull().any().any()  # ¿Hay algún nulo en todo el DataFrame?
```

---

## 🧹 3. LIMPIEZA DE DATOS

### Crear copias del DataFrame
```python
df_clean = df.copy()           # Copia completa
df_backup = df.copy(deep=True) # Copia profunda (recomendada)
```

### Manejar valores nulos
```python
# Eliminar filas con nulos
df.dropna()                    # Elimina filas con cualquier nulo
df.dropna(subset=['columna'])  # Solo si 'columna' tiene nulos
df.dropna(axis=0)             # Filas (por defecto)
df.dropna(axis=1)             # Columnas

# Rellenar valores nulos
df.fillna(valor)              # Rellena todos los nulos
df['columna'].fillna('desconocido')  # Rellena una columna específica
df.fillna(method='ffill')     # Forward fill (valor anterior)
df.fillna(method='bfill')     # Backward fill (valor posterior)
df.fillna(df.mean())          # Con la media (solo numéricas)
```

### Transformar texto
```python
# Cambiar a minúsculas/mayúsculas
df['columna'] = df['columna'].str.lower()
df['columna'] = df['columna'].str.upper()
df['columna'] = df['columna'].str.capitalize()

# Quitar espacios
df['columna'] = df['columna'].str.strip()    # Ambos extremos
df['columna'] = df['columna'].str.lstrip()   # Izquierda
df['columna'] = df['columna'].str.rstrip()   # Derecha
```

---

## ➕ 4. CREAR NUEVAS COLUMNAS

### Operaciones aritméticas básicas
```python
# Crear nuevas columnas con operaciones
df['nueva_col'] = df['col1'] + df['col2']     # Suma
df['nueva_col'] = df['col1'] - df['col2']     # Resta
df['nueva_col'] = df['col1'] * df['col2']     # Multiplicación
df['nueva_col'] = df['col1'] / df['col2']     # División
df['nueva_col'] = df['col1'] ** 2             # Potencia

# Operaciones con constantes
df['col_kg'] = df['col_gramos'] / 1000
df['col_ratio'] = df['col1'] / df['col2']
```

### Método assign() (más elegante)
```python
# Crear múltiples columnas a la vez
df = df.assign(
    nueva_col1 = df['col1'] * 2,
    nueva_col2 = df['col2'] / 1000,
    nueva_col3 = lambda x: x['col1'] / x['col2']  # Usando lambda
)
```

### Redondear valores
```python
# Redondear columnas específicas
df['columna'] = df['columna'].round(2)        # 2 decimales
df[['col1', 'col2']] = df[['col1', 'col2']].round(2)  # Múltiples columnas

# Redondear todo el DataFrame numérico
df = df.round(2)
```

---

## 🔽 5. FILTRADO DE FILAS

### Filtros básicos
```python
# Condición simple
df[df['columna'] > valor]
df[df['columna'] == 'valor']
df[df['columna'] != 'valor']

# Múltiples condiciones (AND)
df[(df['col1'] > valor1) & (df['col2'] == 'valor2')]

# Múltiples condiciones (OR)
df[(df['col1'] > valor1) | (df['col2'] == 'valor2')]

# Filtro con isin() (múltiples valores)
df[df['columna'].isin(['valor1', 'valor2', 'valor3'])]

# Filtro NOT con ~
df[~df['columna'].isin(['valor1', 'valor2'])]  # Que NO estén en la lista
```

### Filtros de texto
```python
# Contiene texto
df[df['columna'].str.contains('texto')]
df[df['columna'].str.contains('texto', case=False)]  # Sin distinguir mayúsculas

# Empieza/termina con
df[df['columna'].str.startswith('pre')]
df[df['columna'].str.endswith('fin')]
```

### Filtros por rango
```python
# Between (incluye extremos)
df[df['columna'].between(valor_min, valor_max)]

# Query (sintaxis SQL-like)
df.query('columna > @valor')  # @ para variables externas
df.query('col1 > 100 and col2 == "texto"')
```

---

## 📊 6. SELECCIÓN DE COLUMNAS Y FILAS

### Seleccionar columnas
```python
# Una columna (devuelve Series)
df['columna']

# Múltiples columnas (devuelve DataFrame)
df[['col1', 'col2', 'col3']]

# Por posición
df.iloc[:, 0]      # Primera columna
df.iloc[:, [0, 2]] # Columnas 0 y 2
df.iloc[:, 0:3]    # Columnas 0, 1, 2

# Por nombre
df.loc[:, 'col1':'col3']  # Desde 'col1' hasta 'col3' (inclusive)
```

### Seleccionar filas
```python
# Por posición
df.iloc[0]         # Primera fila
df.iloc[0:5]       # Primeras 5 filas
df.iloc[[0, 2, 4]] # Filas específicas

# Por índice
df.loc[0]          # Fila con índice 0
df.loc[0:4]        # Desde índice 0 hasta 4 (inclusive)
```

### Combinando filas y columnas
```python
# Filas específicas + columnas específicas
df.loc[df['condicion'], ['col1', 'col2']]
df.iloc[0:5, [0, 2]]  # 5 primeras filas, columnas 0 y 2
```

---

## 🧮 7. AGRUPACIÓN Y RESÚMENES (GROUPBY)

### Agrupar por una variable
```python
# Agrupar y aplicar función
df.groupby('columna').mean()     # Media por grupo
df.groupby('columna').sum()      # Suma por grupo
df.groupby('columna').count()    # Conteo por grupo
df.groupby('columna').std()      # Desviación estándar
df.groupby('columna').min()      # Mínimo por grupo
df.groupby('columna').max()      # Máximo por grupo

# Múltiples estadísticas a la vez
df.groupby('columna').agg(['mean', 'std', 'count'])
```

### Agrupar por múltiples variables
```python
# Múltiples columnas de agrupación
df.groupby(['col1', 'col2']).mean()

# Con reset_index() para convertir índice en columnas
df.groupby(['col1', 'col2']).mean().reset_index()
```

### Agregaciones personalizadas
```python
# Diferentes funciones por columna
df.groupby('grupo').agg({
    'col_numerica1': 'mean',
    'col_numerica2': ['mean', 'std'],
    'col_categorica': 'count'
})

# Funciones personalizadas
df.groupby('grupo').agg({
    'columna': lambda x: x.max() - x.min()  # Rango
})
```

### Ordenar resultados agrupados
```python
# Después del groupby
df.groupby('columna').mean().sort_values('otra_columna', ascending=False)
```

---

## 📈 8. CONTEOS Y FRECUENCIAS

### Contar valores únicos
```python
# Conteo de valores únicos
df['columna'].value_counts()                    # Orden descendente
df['columna'].value_counts(ascending=True)      # Orden ascendente
df['columna'].value_counts(normalize=True)      # Como proporciones
df['columna'].value_counts(dropna=False)       # Incluir nulos

# Número de valores únicos
df['columna'].nunique()
df['columna'].unique()  # Array con valores únicos
```

### Tablas de contingencia
```python
# Tabla cruzada simple
pd.crosstab(df['col1'], df['col2'])

# Con totales
pd.crosstab(df['col1'], df['col2'], margins=True)

# Con proporciones
pd.crosstab(df['col1'], df['col2'], normalize='index')  # Por filas
pd.crosstab(df['col1'], df['col2'], normalize='columns')  # Por columnas
pd.crosstab(df['col1'], df['col2'], normalize='all')  # Total
```

---

## 🗂️ 9. CATEGORIZAR DATOS

### Crear categorías con pd.cut()
```python
# Por rangos numéricos
df['categoria'] = pd.cut(
    df['columna_numerica'], 
    bins=[0, 50, 100, 200], 
    labels=['Bajo', 'Medio', 'Alto']
)

# Por quantiles
df['categoria'] = pd.cut(
    df['columna_numerica'], 
    bins=4,  # 4 grupos de igual tamaño
    labels=['Q1', 'Q2', 'Q3', 'Q4']
)
```

### Crear categorías con pd.qcut()
```python
# Por quantiles (igual frecuencia)
df['categoria'] = pd.qcut(
    df['columna_numerica'], 
    q=4, 
    labels=['Bajo', 'Medio-Bajo', 'Medio-Alto', 'Alto']
)
```

### Categorías con condiciones
```python
# Con numpy.where
import numpy as np
df['categoria'] = np.where(
    df['columna'] > 50, 
    'Alto', 
    'Bajo'
)

# Múltiples condiciones con numpy.select
conditions = [
    df['columna'] < 30,
    df['columna'].between(30, 60),
    df['columna'] > 60
]
choices = ['Bajo', 'Medio', 'Alto']
df['categoria'] = np.select(conditions, choices, default='Desconocido')
```

---

## 🔧 10. APLICAR FUNCIONES PERSONALIZADAS

### apply() en columnas (axis=0)
```python
# Aplicar función a cada columna
df.apply(lambda x: x.max() - x.min())  # Rango por columna
df.apply(np.mean)                      # Media por columna
```

### apply() en filas (axis=1)
```python
# Aplicar función a cada fila
def clasificar_fila(fila):
    if fila['columna1'] > 50:
        return 'Alto'
    elif fila['columna1'] > 25:
        return 'Medio'
    else:
        return 'Bajo'

df['nueva_columna'] = df.apply(clasificar_fila, axis=1)
```

### map() para transformaciones simples
```python
# Mapear valores
mapping = {'A': 'Excelente', 'B': 'Bueno', 'C': 'Regular'}
df['nueva_col'] = df['col_original'].map(mapping)
```

---

## 📋 11. TABLAS DINÁMICAS (PIVOT TABLES)

### Pivot table básica
```python
# Tabla dinámica simple
pd.pivot_table(
    df, 
    index='fila',           # Filas
    columns='columna',      # Columnas
    values='valor',         # Valores a agregar
    aggfunc='mean'          # Función de agregación
)
```

### Pivot table avanzada
```python
# Con múltiples agregaciones
pd.pivot_table(
    df,
    index=['grupo1', 'grupo2'],     # Múltiples filas
    columns='columna',
    values=['valor1', 'valor2'],    # Múltiples valores
    aggfunc={'valor1': 'mean', 'valor2': 'sum'},
    fill_value=0,                   # Rellenar nulos
    margins=True                    # Totales
)
```

### Añadir columnas calculadas a pivot
```python
# Crear pivot y luego añadir totales
pivot = pd.pivot_table(df, index='grupo', columns='categoria', values='valor', aggfunc='mean')
pivot['Total'] = pivot.sum(axis=1)  # Suma por filas
pivot.loc['Total'] = pivot.sum(axis=0)  # Suma por columnas
```

---

## 🔗 12. UNIR DATAFRAMES (MERGE/JOIN)

### Merge básico
```python
# Inner join (solo coincidencias)
df_merged = pd.merge(df1, df2, on='columna_comun')

# Left join (todas las filas de df1)
df_merged = pd.merge(df1, df2, on='columna_comun', how='left')

# Right join (todas las filas de df2)
df_merged = pd.merge(df1, df2, on='columna_comun', how='right')

# Outer join (todas las filas de ambos)
df_merged = pd.merge(df1, df2, on='columna_comun', how='outer')
```

### Merge con diferentes nombres de columna
```python
df_merged = pd.merge(
    df1, df2, 
    left_on='col_df1', 
    right_on='col_df2', 
    how='left'
)
```

### Añadir información agregada al DataFrame original
```python
# Calcular promedios por grupo
promedios = df.groupby('grupo')['valor'].mean().reset_index()
promedios.columns = ['grupo', 'promedio_grupo']

# Unir al DataFrame original
df_con_promedios = pd.merge(df, promedios, on='grupo')

# Calcular diferencia con el promedio del grupo
df_con_promedios['diferencia'] = df_con_promedios['valor'] - df_con_promedios['promedio_grupo']
```

---

## 📊 13. ORDENACIÓN

### Ordenar por una columna
```python
df.sort_values('columna')                    # Ascendente
df.sort_values('columna', ascending=False)   # Descendente
```

### Ordenar por múltiples columnas
```python
df.sort_values(['col1', 'col2'])  # col1 primero, luego col2
df.sort_values(['col1', 'col2'], ascending=[True, False])  # Diferentes órdenes
```

### Ordenar por índice
```python
df.sort_index()                    # Por índice ascendente
df.sort_index(ascending=False)     # Por índice descendente
```

---

## 🎯 14. CONSEJOS Y TRUCOS ÚTILES

### Encadenamiento de métodos (method chaining)
```python
resultado = (df
    .dropna()
    .groupby('grupo')
    .agg({'valor': 'mean'})
    .reset_index()
    .sort_values('valor', ascending=False)
    .head(10)
)
```

### Verificaciones útiles
```python
# Verificar duplicados
df.duplicated().sum()              # Número de filas duplicadas
df.drop_duplicates()               # Eliminar duplicados

# Información de memoria
df.info(memory_usage='deep')

# Profiling rápido
df.describe(include='all').T       # Transpuesto para mejor lectura
```

### Guardar resultados
```python
# Guardar DataFrame
df.to_csv('archivo.csv', index=False)          # CSV sin índice
df.to_excel('archivo.xlsx', index=False)       # Excel
df.to_json('archivo.json')                     # JSON
```

---

## 🧪 15. PLANTILLAS PARA LOS EJERCICIOS

### Para exploración inicial:
```python
print(f"Dimensiones: {df.shape}")
print(f"Columnas: {df.columns.tolist()}")
print(f"Tipos de datos:\n{df.dtypes}")
print(f"Estadísticas:\n{df.describe()}")
print(f"Nulos por columna:\n{df.isnull().sum()}")
```

### Para limpieza:
```python
df_clean = df.copy()
df_clean['sex'] = df_clean['sex'].fillna('unknown')
df_clean = df_clean.dropna(subset=['body_mass_g'])
df_clean['sex'] = df_clean['sex'].str.lower()
print(f"Nulos restantes: {df_clean.isnull().sum().sum()}")
```

### Para agrupación:
```python
resultado = (df
    .groupby('especie')
    .agg({
        'variable1': 'mean',
        'variable2': 'std'
    })
    .round(2)
    .sort_values('variable1', ascending=False)
)
```

### Para filtrado complejo:
```python
filtrado = df[
    (df['especie'] == 'Adelie') & 
    (df['isla'] == 'Torgersen') & 
    (df['masa'] > 3500)
][['especie', 'isla', 'masa']]
```

---

## 💡 RECORDATORIOS IMPORTANTES

1. **Siempre hacer copias**: `df_clean = df.copy()` antes de modificar
2. **Verificar tipos**: Usar `df.dtypes` para confirmar tipos de datos
3. **Manejar nulos**: Decidir si eliminar o rellenar según el contexto
4. **Redondear resultados**: `round(2)` para mejor presentación
5. **Reset index**: Usar `.reset_index()` después de `groupby` si necesitas columnas normales
6. **Filtros con paréntesis**: Siempre usar `()` en condiciones múltiples con `&` y `|`
7. **Verificar resultados**: Usar `head()`, `shape`, `info()` para confirmar operaciones

¡Con estos apuntes tendrás todo lo necesario para resolver los ejercicios de Pandas! 🐧📊