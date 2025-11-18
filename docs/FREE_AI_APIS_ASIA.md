# 🌏 IAs Gratuitas con API - Asia y Otros Países

## 🇨🇳 China

### 1. **Zhipu AI (智谱AI)** ⭐ RECOMENDADO
- **Modelo**: GLM-4.0, GLM-4-Flash
- **API**: https://open.bigmodel.cn
- **Tier Gratuito**: Créditos iniciales gratuitos
- **Registro**: https://open.bigmodel.cn
- **Documentación**: API compatible con OpenAI
- **Ventajas**: Modelo potente, API estable, buen soporte en chino e inglés

### 2. **Moonshot AI (月之暗面)**
- **Modelo**: Moonshot-v1-8k, Moonshot-v1-32k, Moonshot-v1-128k
- **API**: https://platform.moonshot.cn
- **Tier Gratuito**: Créditos iniciales
- **Registro**: https://platform.moonshot.cn
- **Ventajas**: Modelos con contexto largo (hasta 128k tokens)

### 3. **01.ai (零一万物)**
- **Modelo**: Yi-34B, Yi-6B, Yi-VL (multimodal)
- **API**: https://platform.01.ai
- **Tier Gratuito**: Créditos iniciales
- **Registro**: https://platform.01.ai
- **Ventajas**: Modelos eficientes, buen rendimiento

### 4. **Baichuan AI (百川智能)**
- **Modelo**: Baichuan2, Baichuan3
- **API**: Disponible
- **Tier Gratuito**: Verificar en su plataforma
- **Registro**: https://platform.baichuan-ai.com
- **Ventajas**: Modelos de código abierto

## 🌍 Otros Países

### 5. **Together AI** ⭐ RECOMENDADO
- **País**: USA
- **Modelos**: Llama 3.1, Mistral, Mixtral, Qwen, etc.
- **API**: https://api.together.xyz
- **Tier Gratuito**: Según documentación, acceso gratuito sin tarjeta
- **Registro**: https://api.together.xyz/settings/api-keys
- **Ventajas**: Múltiples modelos, buena velocidad
- **Nota**: Ya está en `env.example` pero no configurado

### 6. **OpenRouter**
- **País**: USA
- **Modelos**: Acceso a 300+ modelos (incluyendo muchos gratuitos)
- **API**: https://openrouter.ai/api/v1
- **Tier Gratuito**: Modelos gratuitos disponibles
- **Registro**: https://openrouter.ai
- **Ventajas**: Una API para múltiples modelos, muchos gratuitos

### 7. **OVHcloud AI Endpoints**
- **País**: Francia
- **Modelos**: Modelos open source preentrenados
- **API**: https://www.ovhcloud.com/es/public-cloud/free-ai-api/
- **Tier Gratuito**: Prueba gratuita con créditos
- **Registro**: https://www.ovhcloud.com
- **Ventajas**: Infraestructura europea, buena para GDPR

### 8. **Mistral AI**
- **País**: Francia
- **Modelos**: Mistral 7B, Mixtral 8x7B (open source)
- **API**: https://console.mistral.ai
- **Tier Gratuito**: Verificar en su plataforma
- **Registro**: https://console.mistral.ai
- **Ventajas**: Modelos open source, buen rendimiento

## 📊 Comparación Rápida

| IA | País | Tier Gratuito | Facilidad | Recomendado |
|---|---|---|---|---|
| Zhipu AI | 🇨🇳 China | ✅ Sí | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Moonshot AI | 🇨🇳 China | ✅ Sí | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Together AI | 🇺🇸 USA | ✅ Sí (según docs) | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| OpenRouter | 🇺🇸 USA | ✅ Modelos gratis | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| 01.ai | 🇨🇳 China | ✅ Sí | ⭐⭐⭐ | ⭐⭐⭐ |
| OVHcloud | 🇫🇷 Francia | ✅ Prueba gratis | ⭐⭐⭐ | ⭐⭐⭐ |

## 🎯 Recomendaciones para MetaPredict

### Opción 1: Zhipu AI (China) ⭐
- **Por qué**: Modelo potente (GLM-4.0), API estable, créditos gratuitos
- **Dificultad**: Media (requiere registro en plataforma china)
- **Endpoint**: Compatible con OpenAI

### Opción 2: Together AI (USA) ⭐
- **Por qué**: Ya está en el proyecto, múltiples modelos, documentación clara
- **Dificultad**: Baja (ya tenemos la variable en env.example)
- **Endpoint**: https://api.together.xyz/v1/chat/completions

### Opción 3: OpenRouter (USA)
- **Por qué**: Acceso a múltiples modelos gratuitos en una sola API
- **Dificultad**: Baja
- **Endpoint**: https://openrouter.ai/api/v1/chat/completions

## 🔗 Links de Registro

1. **Zhipu AI**: https://open.bigmodel.cn
2. **Moonshot AI**: https://platform.moonshot.cn
3. **Together AI**: https://api.together.xyz/settings/api-keys
4. **OpenRouter**: https://openrouter.ai
5. **01.ai**: https://platform.01.ai
6. **OVHcloud**: https://www.ovhcloud.com

## 📝 Notas

- Las APIs chinas pueden requerir verificación de identidad
- Together AI y OpenRouter son más fáciles de usar para hackathons
- Zhipu AI tiene modelos muy potentes pero puede requerir más configuración
- OpenRouter es ideal si quieres probar múltiples modelos sin configurar cada uno

