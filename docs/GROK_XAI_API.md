# 🤖 Grok (xAI) API - Guía Completa (Noviembre 2025)

## 🎉 ¡SÍ HAY TIER GRATUITO!

**xAI ofrece $5 en créditos API gratuitos mensuales** al crear una cuenta en [console.x.ai](https://console.x.ai).

⚠️ **IMPORTANTE**: Después de crear la cuenta y la API key, necesitas activar/comprar créditos iniciales en tu equipo. Los $5 mensuales se renuevan automáticamente después de la primera compra.

## 📋 Resumen

- **Tier Gratuito**: ✅ $5 en créditos mensuales
- **Registro**: https://console.x.ai
- **API Key**: Disponible después del registro y verificación
- **Modelos Disponibles**: Grok-beta, Grok-2, Grok-2-vision, etc.

## 🚀 Cómo Obtener Acceso Gratuito

### Pasos:

1. **Registrarse en xAI Console**:
   - Ir a: https://console.x.ai
   - Crear una cuenta
   - Verificar email

2. **Obtener API Key**:
   - Acceder al panel de control del desarrollador
   - Generar claves de API
   - Copiar la API key

3. **Usar los Créditos Gratuitos**:
   - Recibirás $5 en créditos mensuales automáticamente
   - Estos créditos se renuevan cada mes
   - Perfecto para hackathons y pruebas

## 💰 Pricing (Después de los Créditos Gratuitos)

Los precios varían según el modelo. Los $5 gratuitos permiten:
- **Grok-beta**: ~$0.01 por 1K tokens de entrada
- **Grok-2**: Precio similar
- **Grok-2-vision**: Precio más alto (multimodal)

**Nota**: Los $5 mensuales son suficientes para muchas pruebas y desarrollo inicial.

## 🔌 Cómo Usar la API

### Endpoint Base:
```
https://api.x.ai/v1/chat/completions
```

### Ejemplo de Llamada:

```typescript
const response = await axios.post(
  'https://api.x.ai/v1/chat/completions',
  {
    model: 'grok-beta',
    messages: [
      {
        role: 'user',
        content: 'Tu pregunta aquí'
      }
    ],
    temperature: 0.7,
    max_tokens: 1000
  },
  {
    headers: {
      'Authorization': `Bearer ${XAI_API_KEY}`,
      'Content-Type': 'application/json',
    }
  }
);
```

### Ejemplo con cURL:

```bash
curl https://api.x.ai/v1/chat/completions \
  -H "Authorization: Bearer $XAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "grok-beta",
    "messages": [
      {
        "role": "user",
        "content": "Tu pregunta aquí"
      }
    ],
    "temperature": 0.7,
    "max_tokens": 1000
  }'
```

## 📊 Modelos Disponibles

- **grok-beta**: Modelo principal de Grok
- **grok-2**: Versión más reciente
- **grok-2-vision**: Versión multimodal (imágenes)
- Otros modelos según disponibilidad

## 🎯 Integración en MetaPredict

### Ventajas de Agregar Grok:

1. ✅ **Tier Gratuito**: $5 mensuales sin tarjeta
2. ✅ **Modelo Potente**: Grok es un modelo avanzado
3. ✅ **API Compatible**: Similar a OpenAI API
4. ✅ **Fácil Integración**: Endpoint estándar

### Configuración:

1. **Obtener API Key**:
   - Ir a https://console.x.ai
   - Crear cuenta y obtener API key

2. **Agregar Variable de Entorno**:
   ```env
   XAI_API_KEY=tu_api_key_aqui
   ```

3. **Crear Servicio**:
   - Similar a `OpenAIService` o `GroqService`
   - Usar endpoint: `https://api.x.ai/v1/chat/completions`

## 📚 Referencias

- [xAI Console](https://console.x.ai)
- [xAI API Documentation](https://x.ai/api)
- [Grok en X (Twitter)](https://x.com/grok)

## ⚠️ Limitaciones del Tier Gratuito

- **$5 mensuales**: Se renuevan cada mes
- **Después de agotar**: Necesitas comprar créditos adicionales
- **Suficiente para**: Hackathons, pruebas, desarrollo inicial

## 🎯 Recomendación

**Grok es una excelente opción para agregar como 6ta IA al sistema de consenso**:
- ✅ Tier gratuito ($5/mes)
- ✅ Modelo potente
- ✅ API compatible
- ✅ Fácil de integrar

**Orden de prioridad sugerido**:
1. Gemini 2.5 Flash
2. Groq (Llama 3.1)
3. Grok (xAI) ⭐ **NUEVO**
4. Hugging Face (si hay Inference Endpoint)
5. OpenAI GPT-3.5 Turbo
6. Anthropic Claude

## 🔄 Comparación con Otras IAs

| IA | Tier Gratuito | Calidad | Velocidad | Recomendación |
|----|---------------|---------|-----------|---------------|
| Gemini 2.5 Flash | ✅ Gratis | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ Excelente |
| Groq | ✅ Gratis | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ Excelente |
| **Grok (xAI)** | ✅ $5/mes | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ✅ **Recomendado** |
| Hugging Face | ❌ Pago | ⭐⭐⭐ | ⭐⭐⭐ | ⚠️ Requiere endpoint |
| OpenAI | ⚠️ Limitado | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⚠️ Cuota limitada |
| Anthropic | ❌ Pago | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⚠️ Requiere pago |

## ✅ Conclusión

**SÍ, Grok de xAI tiene tier gratuito con $5 mensuales**, lo que lo convierte en una excelente opción para hackathons y desarrollo. Es más accesible que Hugging Face y más generoso que OpenAI en el tier gratuito.

