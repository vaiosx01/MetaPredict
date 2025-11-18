# 🧪 Guía de Pruebas - Gemini AI Backend

## ✅ Prueba Exitosa

La integración de Gemini AI en el backend está **funcionando correctamente**.

### Resultado de la Prueba:
- ✅ API Key configurada correctamente
- ✅ Modelo `gemini-2.5-flash` funcionando
- ✅ Respuesta JSON parseada exitosamente
- ✅ Fallback multi-modelo implementado

## 🚀 Cómo Probar

### Opción 1: Script de Prueba Standalone

```bash
cd backend
pnpm run test:gemini
# o
node test-gemini.js
```

Este script:
- Verifica que la API key esté configurada
- Prueba todos los modelos en orden de fallback
- Muestra la respuesta de Gemini
- Valida el parsing de JSON

### Opción 2: Endpoint HTTP (Backend en Ejecución)

#### Prueba Básica (GET)
```bash
curl http://localhost:3001/api/ai/test
```

#### Prueba con Prompt Personalizado (POST)
```bash
curl -X POST http://localhost:3001/api/ai/test \
  -H "Content-Type: application/json" \
  -d '{"prompt": "Responde con JSON: {\"test\": \"ok\"}", "returnJSON": true}'
```

### Opción 3: Desde el Navegador

1. Inicia el backend:
   ```bash
   cd backend
   pnpm run dev
   ```

2. Abre en el navegador:
   ```
   http://localhost:3001/api/ai/test
   ```

## 📋 Endpoints Disponibles

### Test
- `GET /api/ai/test` - Prueba básica de conectividad
- `POST /api/ai/test` - Prueba con prompt personalizado

### Análisis
- `POST /api/ai/analyze-market` - Analiza un mercado de predicción
- `POST /api/ai/suggest-market` - Genera sugerencias de mercados
- `POST /api/ai/portfolio-analysis` - Analiza portfolio
- `POST /api/ai/reputation-analysis` - Analiza reputación
- `POST /api/ai/insurance-risk` - Analiza riesgo de insurance
- `POST /api/ai/dao-analysis` - Analiza propuesta DAO
- `POST /api/ai/call` - Llamada genérica a Gemini

## 🔧 Configuración Requerida

Asegúrate de tener en tu `.env` (raíz del proyecto):

```env
GEMINI_API_KEY=tu_api_key_aqui
# o
GOOGLE_API_KEY=tu_api_key_aqui
```

## ✅ Verificación

Si la prueba es exitosa, verás:
```
✅ gemini-2.5-flash funcionó correctamente!
✅ JSON parseado correctamente
🎉 Prueba completada exitosamente!
```

## 🐛 Troubleshooting

### Error: "GEMINI_API_KEY is not set"
- Verifica que el `.env` esté en la raíz del proyecto
- Asegúrate de que la variable se llame `GEMINI_API_KEY` o `GOOGLE_API_KEY`

### Error: "All Gemini models failed"
- Verifica que la API key sea válida
- Revisa tu conexión a internet
- Verifica los límites de cuota en Google Cloud Console

### Error: "No valid JSON found"
- El modelo está respondiendo pero no en formato JSON
- Revisa los logs para ver la respuesta raw
- El sistema de fallback debería manejar esto automáticamente

## 📊 Estado Actual

- ✅ Backend configurado correctamente
- ✅ Fallback multi-modelo funcionando
- ✅ Parsing de JSON robusto
- ✅ Manejo de errores completo
- ✅ Logging detallado

**La integración está lista para producción.**

