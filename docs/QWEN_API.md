# 🧠 Qwen API (DashScope - Alibaba Cloud)

## ✅ Tier Gratuito

Alibaba Cloud DashScope ofrece **créditos iniciales gratuitos** para Qwen API.

## 🔗 Obtener API Key

1. Visita: https://dashscope.aliyun.com
2. Regístrate o inicia sesión (puede requerir cuenta de Alibaba Cloud)
3. Ve a la sección de API Keys
4. Crea una nueva API key
5. Copia la key

## 📊 Modelos Disponibles

### 1. `qwen-turbo` ⭐ RECOMENDADO
- **Descripción**: Modelo rápido y eficiente
- **Velocidad**: ⚡⚡⚡⚡ Muy rápido
- **Uso**: Análisis rápido de mercado
- **Confidence**: 80%

### 2. `qwen-plus`
- **Descripción**: Modelo balanceado
- **Velocidad**: ⚡⚡⚡ Rápido
- **Uso**: Análisis general
- **Confidence**: 82%

### 3. `qwen-max`
- **Descripción**: Modelo más potente
- **Velocidad**: ⚡⚡ Más lento
- **Uso**: Análisis complejos
- **Confidence**: 84%

### 4. `qwen2.5-7b-instruct`
- **Descripción**: Qwen 2.5 de 7B parámetros
- **Velocidad**: ⚡⚡⚡⚡ Rápido
- **Uso**: Instrucciones
- **Confidence**: 81%

### 5. `qwen2.5-14b-instruct`
- **Descripción**: Qwen 2.5 de 14B parámetros
- **Velocidad**: ⚡⚡⚡ Rápido
- **Uso**: Análisis más complejos
- **Confidence**: 83%

## 🔧 Integración

El servicio `QwenService` intenta múltiples modelos en orden de prioridad:
1. `qwen-turbo` (principal)
2. `qwen-plus`
3. `qwen-max`
4. `qwen2.5-7b-instruct`
5. `qwen2.5-14b-instruct`

## ⚠️ Formato de API

DashScope usa un formato diferente a OpenAI:
- Endpoint: `https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation`
- Formato: `{ model, input: { messages }, parameters }`

## 💰 Precios

- **Créditos iniciales gratuitos** al registrarse
- Precios competitivos (verificar en DashScope)

## 📝 Configuración

Agrega a tu `.env`:
```env
QWEN_API_KEY=your_qwen_api_key_here
# O también:
DASHSCOPE_API_KEY=your_dashscope_api_key_here
```

## 🔗 Referencias

- [DashScope Console](https://dashscope.aliyun.com)
- [DashScope Docs](https://help.aliyun.com/zh/dashscope/)

