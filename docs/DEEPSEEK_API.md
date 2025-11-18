# 🧠 DeepSeek API - Integración Directa

## ✅ Tier Gratuito

DeepSeek ofrece una API directa con **créditos iniciales gratuitos** y precios muy competitivos.

⚠️ **IMPORTANTE**: Después de crear tu cuenta, es posible que necesites:
1. Activar los créditos gratuitos en tu dashboard
2. O recargar créditos si ya los usaste
3. Verificar tu saldo en: https://platform.deepseek.com

## 🔗 Obtener API Key

1. Visita: https://platform.deepseek.com
2. Regístrate o inicia sesión
3. Ve a la sección de API Keys
4. Crea una nueva API key
5. Copia la key (formato: `sk-...`)

## 📊 Modelos Disponibles

### 1. `deepseek-chat` ⭐ RECOMENDADO
- **Descripción**: Modelo principal de DeepSeek
- **Velocidad**: ⚡⚡⚡⚡ Rápido
- **Uso**: Análisis general de mercado
- **Confidence**: 83%

### 2. `deepseek-reasoner`
- **Descripción**: Modelo especializado en razonamiento
- **Velocidad**: ⚡⚡⚡ Rápido
- **Uso**: Análisis que requiere razonamiento profundo
- **Confidence**: 85%

## 🔧 Integración

El servicio `DeepSeekService` intenta ambos modelos en orden de prioridad:
1. `deepseek-chat` (principal)
2. `deepseek-reasoner` (fallback)

## 💰 Precios

- **Créditos iniciales gratuitos** al registrarse
- Precios muy competitivos: ~$0.14 por millón de tokens (cache hits)
- ~$2.19 por millón de tokens de salida

## 📝 Configuración

Agrega a tu `.env`:
```env
DEEPSEEK_API_KEY=sk-your_deepseek_api_key_here
```

## 🔗 Referencias

- [DeepSeek Platform](https://platform.deepseek.com)
- [DeepSeek API Docs](https://api-docs.deepseek.com)
- [API Endpoint](https://api.deepseek.com/v1/chat/completions)

