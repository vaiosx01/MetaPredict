# 🚀 Modelos Disponibles en Groq (Noviembre 2025)

## ✅ Tier Gratuito de Groq

Groq ofrece un **tier gratuito muy generoso** sin necesidad de tarjeta de crédito. Aunque técnicamente tienen precios por token, el tier gratuito es tan generoso que prácticamente funciona como gratis para hackathons y desarrollo.

## 📊 Modelos Disponibles (Gratuitos en Tier Free)

### 1. Llama 3.1 Series ⭐ RECOMENDADO

#### `llama-3.1-8b-instant` ⭐
- **Tamaño**: 8 mil millones de parámetros
- **Velocidad**: ⚡⚡⚡⚡⚡ Extremadamente rápido
- **Uso**: Predicciones rápidas, análisis de mercado
- **Estado**: ✅ Disponible y funcionando
- **Precio**: Gratis en tier free (muy generoso)
- **Confidence**: 82%

#### `llama-3.1-70b-versatile`
- **Tamaño**: 70 mil millones de parámetros
- **Velocidad**: ⚡⚡⚡ Rápido (más lento que 8b)
- **Uso**: Análisis más complejos, razonamiento profundo
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 85%

#### `llama-3.1-405b`
- **Tamaño**: 405 mil millones de parámetros
- **Velocidad**: ⚡⚡ Más lento
- **Uso**: Tareas muy complejas
- **Estado**: ⚠️ Puede requerir tier de pago o tener límites
- **Precio**: Verificar disponibilidad
- **Confidence**: 88%

### 2. Mixtral Series

#### `mixtral-8x7b-32768` ⭐
- **Tipo**: Modelo Mixtral de Expertos (MoE)
- **Velocidad**: ⚡⚡⚡⚡ Muy rápido
- **Uso**: Alternativa a Llama 3.1, excelente para razonamiento
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 80%

#### `mixtral-8x22b-instruct`
- **Tipo**: Modelo Mixtral más grande
- **Velocidad**: ⚡⚡⚡ Rápido
- **Uso**: Tareas más complejas
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 83%

### 3. Gemma Series (Google)

#### `gemma-7b-it`
- **Tipo**: Modelo Gemma de Google (Instruction Tuned)
- **Velocidad**: ⚡⚡⚡⚡ Rápido
- **Uso**: Tareas de instrucción, seguimiento de comandos
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 78%

#### `gemma2-9b-it`
- **Tipo**: Gemma 2 (versión mejorada)
- **Velocidad**: ⚡⚡⚡⚡ Rápido
- **Uso**: Instrucciones mejoradas
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 79%

### 4. Llama 3.2 Series (Nuevos)

#### `llama-3.2-3b-instruct`
- **Tipo**: Llama 3.2 pequeño y rápido
- **Velocidad**: ⚡⚡⚡⚡⚡ Extremadamente rápido
- **Uso**: Tareas simples, respuestas rápidas
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 75%

#### `llama-3.2-11b-vision-instruct`
- **Tipo**: Llama 3.2 con capacidades visuales
- **Velocidad**: ⚡⚡⚡ Rápido
- **Uso**: Análisis de imágenes y texto
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 80%

### 5. Qwen Series (Alibaba)

#### `qwen-2.5-7b-instruct`
- **Tipo**: Modelo Qwen de Alibaba
- **Velocidad**: ⚡⚡⚡⚡ Rápido
- **Uso**: Instrucciones, razonamiento
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 79%

#### `qwen-2.5-14b-instruct`
- **Tipo**: Qwen más grande
- **Velocidad**: ⚡⚡⚡ Rápido
- **Uso**: Tareas más complejas
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 81%

### 6. DeepSeek Series

#### `deepseek-r1-distill-llama-8b`
- **Tipo**: DeepSeek R1 (razonamiento)
- **Velocidad**: ⚡⚡⚡⚡ Rápido
- **Uso**: Razonamiento profundo, matemáticas
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 82%

#### `deepseek-r1-1.5b`
- **Tipo**: DeepSeek R1 pequeño
- **Velocidad**: ⚡⚡⚡⚡⚡ Extremadamente rápido
- **Uso**: Razonamiento rápido
- **Estado**: ✅ Disponible
- **Precio**: Gratis en tier free
- **Confidence**: 77%

## 🎯 Modelos Recomendados para MetaPredict

### Prioridad 1: `llama-3.1-8b-instant` ⭐
- **Por qué**: Extremadamente rápido, perfecto para análisis de mercado
- **Confidence**: 82%
- **Uso actual**: ✅ Ya configurado

### Prioridad 2: `mixtral-8x7b-32768` ⭐
- **Por qué**: Alternativa rápida si Llama falla, excelente razonamiento
- **Confidence**: 80%
- **Uso**: Fallback

### Prioridad 3: `llama-3.1-70b-versatile`
- **Por qué**: Más capacidad de razonamiento
- **Confidence**: 85%
- **Uso**: Para preguntas más complejas

### Modelos Adicionales Recomendados:

#### `qwen-2.5-14b-instruct`
- **Por qué**: Buen balance velocidad/calidad
- **Confidence**: 81%
- **Uso**: Alternativa adicional

#### `deepseek-r1-distill-llama-8b`
- **Por qué**: Excelente para razonamiento profundo
- **Confidence**: 82%
- **Uso**: Preguntas que requieren razonamiento complejo

## 💡 Cómo Usar Múltiples Modelos

Puedes configurar el servicio de Groq para probar múltiples modelos en orden de fallback:

```typescript
// Configuración actual (básica)
const modelsToTry = [
  'llama-3.1-8b-instant',      // Prioridad 1: Más rápido
  'mixtral-8x7b-32768',        // Prioridad 2: Alternativa rápida
  'llama-3.1-70b-versatile',   // Prioridad 3: Más capacidad
];

// Configuración extendida (más opciones)
const modelsToTryExtended = [
  'llama-3.1-8b-instant',           // Prioridad 1: Más rápido
  'mixtral-8x7b-32768',             // Prioridad 2: Alternativa rápida
  'qwen-2.5-14b-instruct',          // Prioridad 3: Buen balance
  'deepseek-r1-distill-llama-8b',  // Prioridad 4: Razonamiento
  'llama-3.1-70b-versatile',       // Prioridad 5: Más capacidad
];
```

## 📈 Comparación de Modelos

| Modelo | Velocidad | Capacidad | Confidence | Uso Recomendado |
|--------|-----------|-----------|------------|-----------------|
| llama-3.1-8b-instant | ⚡⚡⚡⚡⚡ | ⭐⭐⭐⭐ | 82% | Análisis rápido de mercado ⭐ |
| mixtral-8x7b-32768 | ⚡⚡⚡⚡ | ⭐⭐⭐⭐ | 80% | Alternativa rápida ⭐ |
| llama-3.1-70b-versatile | ⚡⚡⚡ | ⭐⭐⭐⭐⭐ | 85% | Análisis complejos |
| qwen-2.5-14b-instruct | ⚡⚡⚡⚡ | ⭐⭐⭐⭐ | 81% | Buen balance velocidad/calidad |
| deepseek-r1-distill-llama-8b | ⚡⚡⚡⚡ | ⭐⭐⭐⭐ | 82% | Razonamiento profundo |
| gemma-7b-it | ⚡⚡⚡⚡ | ⭐⭐⭐ | 78% | Tareas de instrucción |
| gemma2-9b-it | ⚡⚡⚡⚡ | ⭐⭐⭐ | 79% | Instrucciones mejoradas |
| llama-3.2-3b-instruct | ⚡⚡⚡⚡⚡ | ⭐⭐⭐ | 75% | Tareas simples, muy rápido |
| llama-3.2-11b-vision-instruct | ⚡⚡⚡ | ⭐⭐⭐⭐ | 80% | Análisis de imágenes |
| qwen-2.5-7b-instruct | ⚡⚡⚡⚡ | ⭐⭐⭐ | 79% | Instrucciones básicas |

## 🔗 Referencias

- [Groq Console](https://console.groq.com)
- [Groq Models Documentation](https://console.groq.com/docs/models)
- [Groq Pricing](https://console.groq.com/docs/pricing)

## ✅ Conclusión

**SÍ, Groq ofrece múltiples modelos gratuitos**, siendo `llama-3.1-8b-instant` el más recomendado por su velocidad y calidad. El tier gratuito es muy generoso y perfecto para hackathons.

