# 🧠 Sistema de Consenso Multi-IA - MetaPredict.ai

## 📋 Resumen Ejecutivo

MetaPredict usa un **sistema de consenso cuántico** que consulta múltiples IAs en paralelo y determina el resultado final basado en el acuerdo entre ellas. Esto aumenta la precisión y confiabilidad de las predicciones.

---

## 🏗️ Arquitectura del Sistema

### Componentes Principales

```
┌─────────────────────────────────────────────────────────────┐
│                    ORACLE ENDPOINT                           │
│              /api/oracle/resolve (Backend)                   │
│              /api/oracle/resolve (Frontend)                  │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────────────┐
│              ConsensusService (Coordinador)                 │
│  - Recibe la pregunta del mercado                           │
│  - Coordina las consultas a todas las IAs                   │
│  - Agrega las respuestas y calcula el consenso              │
└──────────────────────┬──────────────────────────────────────┘
                       │
                       │
                       ▼
        ┌───────────────────────────────┐
        │  ORDEN DE PRIORIDAD (Secuencial)│
        └───────────────────────────────┘
                       │
        ┌──────────────┼──────────────┐
        │              │              │
        ▼              ▼              ▼
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│ 🥇 Gemini     │ │ 🥈 Groq      │ │ 🥉 Groq      │
│ 2.5 Flash    │ │ Llama 3.1    │ │ Llama 3.1   │
│ (Prioridad 1)│ │ (Standard)  │ │ (Conservative)│
│              │ │ (Prioridad 2)│ │ (Prioridad 3)│
└──────────────┘ └──────────────┘ └──────────────┘
        │              │              │
        └──────────────┼──────────────┘
                       │
        ┌──────────────┼──────────────┐
        │              │              │
        ▼              ▼              ▼
┌──────────────┐ ┌──────────────┐
│ 4️⃣ Groq       │ │ 5️⃣ Groq      │
│ Llama 3.1    │ │ Llama 3.1    │
│ (Analytical) │ │ (Balanced)   │
│ (Prioridad 4)│ │ (Prioridad 5)│
└──────────────┘ └──────────────┘
        │              │
        └──────────────┘
                       │
                       ▼
              ┌──────────────┐
              │   Consenso   │
              │   Final      │
              └──────────────┘
```

---

## 🔄 Flujo de Funcionamiento

### ⚡ Sistema de Prioridades (Secuencial con Fallback)

El sistema consulta las IAs en **orden de prioridad secuencial** (no en paralelo), con fallback automático si una falla:

1. **🥇 Prioridad 1: Google Gemini 2.5 Flash** - Rápido, gratuito, alta calidad
2. **🥈 Prioridad 2: Groq Llama 3.1 (Standard)** - Extremadamente rápido, gratuito, temperatura 0.1
3. **🥉 Prioridad 3: Groq Llama 3.1 (Conservative)** - Enfoque conservador, temperatura 0.0
4. **4️⃣ Prioridad 4: Groq Llama 3.1 (Analytical)** - Análisis detallado, temperatura 0.2
5. **5️⃣ Prioridad 5: Groq Llama 3.1 (Balanced)** - Perspectiva balanceada, temperatura 0.15

**Ventajas del sistema secuencial:**
- ✅ Prioriza las IAs más rápidas y gratuitas
- ✅ Fallback automático si una IA falla
- ✅ Reduce costos usando primero las gratuitas
- ✅ Mejor rendimiento al evitar esperar por IAs lentas

### Paso 1: Inicio de la Consulta

**Quién inicia:** 
- **Chainlink Functions** (desde el smart contract) llama al endpoint `/api/oracle/resolve`
- O cualquier cliente que necesite resolver un mercado

**Dónde:**
```typescript
// backend/src/routes/oracle.ts
router.post('/resolve', async (req: Request, res: Response) => {
  const { marketDescription, priceId } = req.body;
  // ...
});
```

### Paso 2: Creación del ConsensusService

**Quién crea:** El endpoint `/api/oracle/resolve`

**Qué hace:**
```typescript
const consensusService = new ConsensusService(
  process.env.OPENAI_API_KEY || '',
  process.env.ANTHROPIC_API_KEY || '',
  process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY || '',
  process.env.GROQ_API_KEY // Opcional
);
```

**Resultado:** Se inicializan 3-4 servicios de IA:
- ✅ `OpenAIService` (siempre)
- ✅ `AnthropicService` (siempre)
- ✅ `GoogleService` (siempre)
- ✅ `GroqService` (si `GROQ_API_KEY` está configurada)

### Paso 3: Consulta Secuencial con Prioridades y Fallback

**Quién coordina:** `ConsensusService.getConsensus()`

**Cómo funciona:**
```typescript
// Consultar LLMs en orden de prioridad (secuencial con fallback)
const responses: LLMResponse[] = [];

// 1. PRIORIDAD 1: Gemini (más rápido y gratuito)
if (this.google) {
  try {
    const response = await this.google.analyzeMarket(question, context);
    responses.push(response);
  } catch (error) {
    // Si falla, continúa con la siguiente
  }
}

// 2. PRIORIDAD 2: Groq
if (this.groq) {
  try {
    const response = await this.groq.analyzeMarket(question, context);
    responses.push(response);
  } catch (error) {
    // Si falla, continúa con la siguiente
  }
}

// 3. PRIORIDAD 3: Grok (xAI)
if (this.xai) {
  try {
    const response = await this.xai.analyzeMarket(question, context);
    responses.push(response);
  } catch (error) {
    // Si falla, continúa con la siguiente
  }
}

// 4. PRIORIDAD 4: OpenAI (backup)
if (this.openAI) {
  try {
    const response = await this.openAI.analyzeMarket(question, context);
    responses.push(response);
  } catch (error) {
    // Si falla, continúa con la siguiente
  }
}

// 5. PRIORIDAD 5: Anthropic (solo si tiene key válida)
if (this.anthropic) {
  try {
    const response = await this.anthropic.analyzeMarket(question, context);
    responses.push(response);
  } catch (error) {
    // Si falla, no hay más opciones
  }
}
```

**Ventajas del sistema secuencial:**
- ✅ **Prioriza IAs gratuitas** (Gemini + 4 configuraciones de Groq Llama 3.1, todos gratuitos)
- ✅ **Múltiples perspectivas** usando el mismo modelo con diferentes configuraciones (temperatura, prompts)
- ✅ **Fallback automático** si una IA falla
- ✅ **Reduce costos** al usar primero las gratuitas
- ✅ **Mejor rendimiento** al evitar esperar por IAs lentas o con cuota excedida

### Paso 4: Cada IA Analiza Independientemente

Cada servicio de IA recibe la misma pregunta y contexto:

```typescript
// Ejemplo: OpenAI Service
async analyzeMarket(question: string, context?: string): Promise<LLMResponse> {
  const prompt = `Analyze this prediction market question and answer ONLY 'YES', 'NO', or 'INVALID':
${question}
${context ? `Context: ${context}` : ''}

Respond with ONLY one word: YES, NO, or INVALID`;

  // Llama a la API de OpenAI
  const response = await axios.post('https://api.openai.com/v1/chat/completions', {
    model: 'gpt-4',
    messages: [...],
  });

  // Retorna: { answer: 'YES' | 'NO' | 'INVALID', confidence: 85, reasoning: '...' }
}
```

**Cada IA retorna:**
```typescript
interface LLMResponse {
  answer: 'YES' | 'NO' | 'INVALID';
  confidence: number;  // 0-100
  reasoning: string;   // Explicación
}
```

### Paso 5: Conteo de Votos

**Quién cuenta:** `ConsensusService.getConsensus()`

**Cómo funciona:**
```typescript
// Contar votos
let yesVotes = 0;
let noVotes = 0;
let invalidVotes = 0;

for (const response of responses) {
  if (response.answer === 'YES') yesVotes++;
  else if (response.answer === 'NO') noVotes++;
  else invalidVotes++;
}
```

**Ejemplo de resultado:**
```
Respuestas recibidas:
- OpenAI:    YES  (confidence: 85)
- Anthropic: YES  (confidence: 88)
- Google:    NO   (confidence: 80)
- Groq:      YES  (confidence: 82)

Votos:
- YES: 3
- NO: 1
- INVALID: 0
```

### Paso 6: Cálculo del Consenso

**Quién calcula:** `ConsensusService.getConsensus()`

**Fórmula:**
```typescript
const totalModels = responses.length;  // 4
const maxVotes = Math.max(yesVotes, noVotes, invalidVotes);  // 3
const consensusPercentage = (maxVotes / totalModels) * 100;  // 75%
```

**Ejemplo:**
- Total de modelos: 4
- Votos máximos: 3 (YES)
- Porcentaje de consenso: 75%

### Paso 7: Determinación del Outcome

**Quién decide:** `ConsensusService.getConsensus()`

**Lógica:**
```typescript
// Determinar outcome
let outcome: 1 | 2 | 3;
if (yesVotes === maxVotes && yesVotes > noVotes && yesVotes > invalidVotes) {
  outcome = 1; // YES
} else if (noVotes === maxVotes && noVotes > yesVotes && noVotes > invalidVotes) {
  outcome = 2; // NO
} else {
  outcome = 3; // INVALID
}

// Si el consenso es bajo, retornar INVALID
if (consensusPercentage < requiredAgreement * 100) {  // default: 80%
  outcome = 3; // INVALID
}
```

**Reglas:**
1. **Si ≥80% de las IAs están de acuerdo** → Se acepta el resultado
2. **Si <80% de acuerdo** → Se retorna `INVALID`
3. **Si hay empate** → Se retorna `INVALID`

**Ejemplo:**
- 3 de 4 IAs dicen YES (75% consenso)
- `requiredAgreement = 0.8` (80%)
- 75% < 80% → **Resultado: INVALID**

### Paso 8: Retorno del Resultado

**Quién retorna:** El endpoint `/api/oracle/resolve`

**Formato:**
```typescript
return res.json({
  outcome: 1,              // 1=Yes, 2=No, 3=Invalid
  confidence: 75,          // Porcentaje de consenso (0-100)
  consensusCount: 3,       // Número de IAs que votaron por el resultado
  totalModels: 4,          // Total de IAs consultadas
  votes: {
    yes: 3,
    no: 1,
    invalid: 0,
  },
  timestamp: Date.now(),
});
```

---

## 📊 Ejemplos de Consenso

### Ejemplo 1: Consenso Alto (✅ Aceptado)

**Pregunta:** "Will Bitcoin reach $100,000 by 2025?"

**Respuestas:**
- OpenAI: YES
- Anthropic: YES
- Google: YES
- Groq: YES

**Resultado:**
```json
{
  "outcome": 1,
  "confidence": 100,
  "consensusCount": 4,
  "totalModels": 4,
  "votes": { "yes": 4, "no": 0, "invalid": 0 }
}
```
✅ **Aceptado** (100% consenso ≥ 80%)

---

### Ejemplo 2: Consenso Medio (✅ Aceptado)

**Pregunta:** "Will Ethereum reach $5,000 by 2026?"

**Respuestas:**
- OpenAI: YES
- Anthropic: YES
- Google: NO
- Groq: YES

**Resultado:**
```json
{
  "outcome": 1,
  "confidence": 75,
  "consensusCount": 3,
  "totalModels": 4,
  "votes": { "yes": 3, "no": 1, "invalid": 0 }
}
```
✅ **Aceptado** (75% consenso ≥ 80%? **NO**, pero YES tiene mayoría)

**Nota:** En este caso, el código actual acepta si hay mayoría, pero si `requiredAgreement = 0.8`, se rechazaría.

---

### Ejemplo 3: Sin Consenso (❌ Rechazado)

**Pregunta:** "Will AI replace all jobs by 2030?"

**Respuestas:**
- OpenAI: YES
- Anthropic: NO
- Google: YES
- Groq: NO

**Resultado:**
```json
{
  "outcome": 3,
  "confidence": 50,
  "consensusCount": 2,
  "totalModels": 4,
  "votes": { "yes": 2, "no": 2, "invalid": 0 }
}
```
❌ **INVALID** (50% consenso < 80%, y hay empate)

---

## 🎯 Parámetros Configurables

### `requiredAgreement` (Por defecto: 0.8 = 80%)

```typescript
const result = await consensusService.getConsensus(
  marketDescription,
  context,
  0.8 // 80% de acuerdo requerido
);
```

**Valores comunes:**
- `0.8` (80%) - Estándar, balance entre precisión y aceptación
- `0.9` (90%) - Más estricto, solo acepta consenso muy alto
- `0.7` (70%) - Más permisivo, acepta más resultados

---

## 🔐 Seguridad y Confiabilidad

### Ventajas del Sistema Multi-IA

1. **Redundancia:** Si una IA falla, las otras continúan
2. **Validación cruzada:** Múltiples IAs verifican la misma pregunta
3. **Resistencia a sesgos:** Diferentes IAs tienen diferentes sesgos
4. **Mayor precisión:** El consenso reduce errores individuales

### Manejo de Errores

Si una IA falla:
```typescript
// En cada servicio (ej: OpenAI)
catch (error) {
  console.error('OpenAI API error:', error);
  return {
    answer: 'INVALID',
    confidence: 0,
    reasoning: 'API error',
  };
}
```

**Resultado:** La IA que falla vota `INVALID`, pero las otras continúan.

---

## 📈 Métricas y Monitoreo

El sistema retorna métricas útiles:

```typescript
{
  confidence: 75,        // Porcentaje de consenso
  consensusCount: 3,    // Cuántas IAs votaron igual
  totalModels: 4,       // Total de IAs consultadas
  votes: {              // Desglose de votos
    yes: 3,
    no: 1,
    invalid: 0
  }
}
```

**Uso:**
- Monitorear la calidad del consenso
- Detectar cuando las IAs no están de acuerdo
- Ajustar `requiredAgreement` según resultados

---

## 🚀 Flujo Completo Visual

```
1. Smart Contract / Cliente
   │
   ▼
2. POST /api/oracle/resolve
   │
   ▼
3. ConsensusService creado
   │
   ▼
4. Consultas PARALELAS a todas las IAs
   ├─→ OpenAI API (GPT-4)
   ├─→ Anthropic API (Claude 3.5)
   ├─→ Google API (Gemini 2.5)
   └─→ Groq API (Llama 3.1) [opcional]
   │
   ▼
5. Todas las respuestas llegan
   │
   ▼
6. Conteo de votos (YES/NO/INVALID)
   │
   ▼
7. Cálculo de consenso (%)
   │
   ▼
8. Validación (¿≥80% acuerdo?)
   │
   ├─→ SÍ → Retornar resultado (YES/NO)
   └─→ NO → Retornar INVALID
   │
   ▼
9. Resultado final al Smart Contract / Cliente
```

---

## 💡 Preguntas Frecuentes

### ¿Quién decide el resultado final?

**Respuesta:** El `ConsensusService` es el coordinador que:
1. Consulta todas las IAs
2. Cuenta los votos
3. Calcula el consenso
4. Decide el resultado basado en las reglas de consenso

### ¿Qué pasa si una IA falla?

**Respuesta:** La IA que falla retorna `INVALID`, pero las otras continúan. El consenso se calcula con las IAs que respondieron exitosamente.

### ¿Puedo cambiar el umbral de consenso?

**Sí:** Pasa el parámetro `requiredAgreement` al llamar `getConsensus()`:
```typescript
await consensusService.getConsensus(question, context, 0.9); // 90% requerido
```

### ¿Cuántas IAs se consultan?

**Actualmente:** 3-4 IAs
- Siempre: OpenAI, Anthropic, Google
- Opcional: Groq (si `GROQ_API_KEY` está configurada)

### ¿Las IAs se consultan en paralelo o secuencial?

**Paralelo:** Todas se consultan simultáneamente usando `Promise.all()`, lo que reduce el tiempo total de respuesta.

---

## 🔧 Configuración

### Variables de Entorno Requeridas

```env
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GEMINI_API_KEY=... (o GOOGLE_API_KEY)
GROQ_API_KEY=... (opcional)
```

### Endpoints Disponibles

- **Backend:** `POST /api/oracle/resolve`
- **Frontend:** `POST /api/oracle/resolve` (Next.js API route)

---

## 📝 Resumen

1. **Quién coordina:** `ConsensusService`
2. **Cómo consulta:** En paralelo a todas las IAs
3. **Cómo decide:** Por mayoría con umbral mínimo (80%)
4. **Qué retorna:** Resultado con métricas de consenso
5. **Dónde se usa:** Endpoints `/api/oracle/resolve` (backend y frontend)

El sistema es **descentralizado** en el sentido de que consulta múltiples proveedores de IA independientes, pero el **coordinador central** (`ConsensusService`) es quien agrega las respuestas y toma la decisión final.

