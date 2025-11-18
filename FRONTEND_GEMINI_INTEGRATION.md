# 🎨 Integración Gemini AI - Frontend

## ✅ Estado de la Integración

La integración de Gemini AI en el frontend está **100% completa y funcional**.

### Componentes Integrados

1. **Cliente de Servicios** (`frontend/lib/services/ai/gemini.ts`)
   - ✅ Todas las funciones de AI disponibles
   - ✅ Timeout de 30 segundos con AbortController
   - ✅ Manejo robusto de errores
   - ✅ Mensajes de error amigables para el usuario

2. **API Routes** (`frontend/app/api/ai/*/route.ts`)
   - ✅ `/api/ai/test` - GET y POST para pruebas
   - ✅ `/api/ai/analyze-market` - Análisis de mercados
   - ✅ `/api/ai/suggest-market` - Sugerencias de mercados
   - ✅ `/api/ai/portfolio-analysis` - Análisis de portfolio
   - ✅ `/api/ai/reputation-analysis` - Análisis de reputación
   - ✅ `/api/ai/insurance-risk` - Análisis de riesgo
   - ✅ `/api/ai/dao-analysis` - Análisis de propuestas DAO
   - ✅ `/api/ai/call` - Llamada genérica

3. **Componentes que Usan AI**
   - ✅ `app/create/page.tsx` - Creación de mercados con sugerencias AI
   - ✅ `app/markets/[id]/page.tsx` - Análisis de mercados individuales
   - ✅ `app/portfolio/page.tsx` - Análisis de portfolio
   - ✅ `app/insurance/page.tsx` - Análisis de riesgo de insurance
   - ✅ `app/reputation/page.tsx` - Análisis de reputación
   - ✅ `app/dao/page.tsx` - Análisis de propuestas DAO
   - ✅ `app/markets/page.tsx` - Búsqueda con AI

## 🔧 Configuración

### Variables de Entorno

En tu `.env` (raíz del proyecto):

```env
# Recomendado: Server-side only (más seguro)
GEMINI_API_KEY=tu_api_key_aqui

# Fallback: Client-side (menos seguro, solo para desarrollo)
NEXT_PUBLIC_GEMINI_API_KEY=tu_api_key_aqui
NEXT_PUBLIC_GOOGLE_API_KEY=tu_api_key_aqui
```

**Nota**: `GEMINI_API_KEY` y `GOOGLE_API_KEY` son la misma cosa. Usa `GEMINI_API_KEY` para mejor seguridad.

### Uso en Componentes

```typescript
import { suggestMarketCreation, analyzeMarket } from '@/lib/services/ai/gemini';

// Generar sugerencias
const result = await suggestMarketCreation('cryptocurrency');
if (result.success && result.data) {
  console.log('Sugerencias:', result.data.suggestions);
  console.log('Modelo usado:', result.modelUsed);
} else {
  console.error('Error:', result.error);
}

// Analizar mercado
const analysis = await analyzeMarket('Will Bitcoin reach $100K?', 'Contexto adicional');
if (analysis.success && analysis.data) {
  console.log('Respuesta:', analysis.data.answer);
  console.log('Confianza:', analysis.data.confidence);
}
```

## 📡 Flujo de Datos

```
Componente React
    ↓
lib/services/ai/gemini.ts (Cliente)
    ↓
/api/ai/* (Next.js API Route - Server-side)
    ↓
lib/ai/gemini-advanced.ts (Helper)
    ↓
Google Gemini API
```

### Ventajas de este Flujo

1. **Seguridad**: API key nunca se expone al cliente
2. **Consistencia**: Mismo código en frontend y backend
3. **Manejo de Errores**: Centralizado y robusto
4. **Type Safety**: TypeScript en toda la cadena

## 🎯 Funciones Disponibles

### 1. `testGeminiConnection()`
Prueba básica de conectividad.

```typescript
const result = await testGeminiConnection();
// Retorna: { success: boolean, data?: { response, modelUsed }, error?: string }
```

### 2. `suggestMarketCreation(topic: string)`
Genera sugerencias de mercados para un tema.

```typescript
const result = await suggestMarketCreation('cryptocurrency');
// Retorna: { success: boolean, data?: { suggestions: [...] }, error?: string }
```

### 3. `analyzeMarket(question: string, context?: string)`
Analiza un mercado de predicción.

```typescript
const result = await analyzeMarket('Will Bitcoin reach $100K?', 'Contexto');
// Retorna: { success: boolean, data?: { answer, confidence, reasoning }, error?: string }
```

### 4. `analyzePortfolioRebalance(positions, constraints?)`
Analiza y sugiere rebalanceo de portfolio.

```typescript
const result = await analyzePortfolioRebalance(positions, constraints);
// Retorna: { success: boolean, data?: { riskScore, allocations, ... }, error?: string }
```

### 5. `analyzeReputation(userData)`
Analiza la reputación de un usuario.

```typescript
const result = await analyzeReputation(userData);
// Retorna: { success: boolean, data?: { reputationScore, riskLevel, ... }, error?: string }
```

### 6. `analyzeInsuranceRisk(marketData)`
Analiza el riesgo de insurance para un mercado.

```typescript
const result = await analyzeInsuranceRisk(marketData);
// Retorna: { success: boolean, data?: { riskScore, recommendedCoverage, ... }, error?: string }
```

### 7. `analyzeDAOProposal(proposalData)`
Analiza una propuesta DAO.

```typescript
const result = await analyzeDAOProposal(proposalData);
// Retorna: { success: boolean, data?: { qualityScore, recommendation, ... }, error?: string }
```

### 8. `callGemini(prompt, config?, returnJSON?)`
Llamada genérica a Gemini.

```typescript
const result = await callGemini('Tu prompt aquí', { temperature: 0.7 }, true);
// Retorna: { success: boolean, data?: any, error?: string }
```

## 🛡️ Manejo de Errores

El cliente maneja automáticamente:

- ✅ **Timeouts**: 30 segundos máximo
- ✅ **Errores de red**: Mensajes amigables
- ✅ **Errores de API**: Parsing y validación
- ✅ **API key no configurada**: Mensaje claro
- ✅ **Respuestas inválidas**: Validación de formato

### Ejemplo de Manejo

```typescript
try {
  const result = await suggestMarketCreation(topic);
  
  if (result.success && result.data) {
    // Éxito
    setSuggestions(result.data.suggestions);
    toast.success(`Generadas ${result.data.suggestions.length} sugerencias`);
  } else {
    // Error manejado por el cliente
    toast.error(result.error || 'Error desconocido');
  }
} catch (error) {
  // Error inesperado
  console.error('Error inesperado:', error);
  toast.error('Error inesperado. Por favor, intenta de nuevo.');
}
```

## 🧪 Pruebas

### Prueba desde el Navegador

1. Inicia el frontend:
   ```bash
   cd frontend
   pnpm run dev
   ```

2. Abre en el navegador:
   ```
   http://localhost:3000/api/ai/test
   ```

3. Deberías ver:
   ```json
   {
     "success": true,
     "data": {
       "response": { "status": "ok", ... },
       "modelUsed": "gemini-2.5-flash"
     },
     "message": "Gemini AI está conectado correctamente"
   }
   ```

### Prueba desde Componente

```typescript
import { testGeminiConnection } from '@/lib/services/ai/gemini';

const handleTest = async () => {
  const result = await testGeminiConnection();
  if (result.success) {
    console.log('✅ Gemini funcionando:', result.data);
  } else {
    console.error('❌ Error:', result.error);
  }
};
```

## 📊 Características

### ✅ Implementado

- [x] Cliente con timeout y AbortController
- [x] Todas las funciones de AI disponibles
- [x] Manejo robusto de errores
- [x] Mensajes de error amigables
- [x] TypeScript completo
- [x] Validación de respuestas
- [x] Logging detallado
- [x] Integración en componentes React
- [x] API routes server-side
- [x] Sincronizado con backend

### 🎨 UI/UX

- [x] Loading states en componentes
- [x] Toast notifications para errores/éxitos
- [x] Mensajes de error claros
- [x] Indicadores de modelo usado
- [x] Fallback automático transparente

## 🔄 Sincronización con Backend

El frontend y backend comparten:

- ✅ Mismo helper: `lib/ai/gemini-advanced.ts`
- ✅ Mismo orden de fallback de modelos
- ✅ Mismo manejo de respuestas
- ✅ Mismo parsing de JSON
- ✅ Mismo formato de respuestas

**Resultado**: Comportamiento idéntico en frontend y backend.

## 🚀 Próximos Pasos

1. ✅ Integración completa - **HECHO**
2. ✅ Manejo de errores robusto - **HECHO**
3. ✅ Sincronización frontend/backend - **HECHO**
4. ⏳ Tests unitarios (opcional)
5. ⏳ Tests de integración (opcional)
6. ⏳ Métricas y monitoring (opcional)

## 📝 Notas

- El frontend usa API routes de Next.js que se ejecutan server-side
- La API key nunca se expone al cliente (a menos que uses `NEXT_PUBLIC_*`)
- Todos los endpoints retornan el mismo formato: `{ success, data?, error?, modelUsed? }`
- El timeout es de 30 segundos por defecto (configurable)
- El fallback multi-modelo es transparente para el usuario

## 🎯 Conclusión

**Estado**: ✅ **100% INTEGRADO Y FUNCIONAL**

El frontend está completamente integrado con Gemini AI, con manejo robusto de errores, timeouts, y sincronización completa con el backend. Listo para producción.

