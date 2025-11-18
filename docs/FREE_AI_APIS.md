# 🆓 Guía de APIs de IA Gratuitas para Hackathons

Esta guía explica cómo obtener acceso gratuito a las diferentes APIs de IA utilizadas en MetaPredict, especialmente para hackathons donde no se quiere usar tarjeta de crédito.

## ✅ APIs 100% Gratuitas (Sin Tarjeta)

### 1. Google Gemini 2.5 Flash ⭐ RECOMENDADO
- **Estado**: ✅ 100% Gratis, sin tarjeta
- **Obtener**: https://makersuite.google.com/app/apikey
- **Modelo**: `gemini-2.5-flash`
- **Límites**: Generoso, suficiente para hackathons
- **Ventajas**: 
  - Sin tarjeta de crédito
  - Muy rápido
  - Buena calidad
- **Ya configurado**: ✅

### 2. Groq (Llama 3.1) ⭐ RECOMENDADO
- **Estado**: ✅ 100% Gratis, sin tarjeta
- **Obtener**: https://console.groq.com/keys
- **Modelo**: `llama-3.1-8b-instant`
- **Límites**: Muy generoso
- **Ventajas**:
  - Sin tarjeta de crédito
  - Extremadamente rápido
  - Perfecto para hackathons
- **Ya configurado**: ✅

### 3. Grok (xAI) ⭐ RECOMENDADO
- **Estado**: ✅ $5 créditos mensuales gratuitos (se renuevan cada mes)
- **Obtener**: https://console.x.ai
- **Modelo**: `grok-4-latest` (con fallback a grok-beta, grok-2)
- **Límites**: $5 USD en créditos mensuales (suficiente para hackathons)
- **Ventajas**:
  - $5 créditos mensuales sin tarjeta (al registrarse)
  - Modelo potente y avanzado
  - API compatible con OpenAI
  - Fácil integración
- **Ya configurado**: ✅

### 4. Together AI (Llama 3.1)
- **Estado**: ✅ Según documentación: Gratis sin tarjeta
- **Obtener**: https://api.together.xyz/settings/api-keys
- **Modelo**: `meta-llama/Llama-3.1-8B-Instruct`
- **Límites**: Verificar en su sitio web
- **Ventajas**:
  - Según documentación: Sin necesidad de información de pago
  - Acceso a modelos Llama
- **Estado**: ⏳ Pendiente de verificación

---

## ⚠️ APIs con Créditos Gratuitos (Pueden Requerir Tarjeta)

### 5. OpenAI GPT-3.5 Turbo
- **Estado**: ⚠️ Créditos gratuitos, pero puede requerir tarjeta
- **Obtener**: https://platform.openai.com/api-keys
- **Modelo**: `gpt-3.5-turbo`
- **Créditos**: $5 USD iniciales (puede variar)
- **Requisitos**: 
  - Puede requerir tarjeta para verificar cuenta
  - Los créditos gratuitos se agotan rápido
- **Ya configurado**: ✅ (pero cuota excedida actualmente)

### 6. Anthropic Claude 3.5 Sonnet
- **Estado**: ⚠️ $5 USD en créditos gratuitos, pero requiere tarjeta
- **Obtener**: https://console.anthropic.com/
- **Modelo**: `claude-3-5-sonnet-20241022`
- **Créditos**: $5 USD (1,000-2,000 llamadas aproximadamente)
- **Requisitos**:
  - ⚠️ **Puede requerir tarjeta de crédito** para verificar la cuenta
  - Alternativa: Programa para investigadores (sin tarjeta)
- **Alternativa sin tarjeta**: 
  - Programa de Acceso para Investigadores Externos
  - Link: https://support.anthropic.com/en/articles/9125743-what-is-the-external-researcher-access-program
- **Estado**: ⏳ Opcional, no crítico para hackathon

---

## 📊 Recomendación para Hackathons

### Configuración Completa (5 IAs - Sin Tarjeta) ✅
1. ✅ **Google Gemini 2.5 Flash** - Ya configurado
2. ✅ **Groq Llama 3.1 (Standard)** - Ya configurado (temp 0.1)
3. ✅ **Groq Llama 3.1 (Conservative)** - Ya configurado (temp 0.0)
4. ✅ **Groq Llama 3.1 (Analytical)** - Ya configurado (temp 0.2)
5. ✅ **Groq Llama 3.1 (Balanced)** - Ya configurado (temp 0.15)

**Con estas 5 IAs ya tienes un sistema de consenso funcional al 100% - TODAS GRATUITAS**

**Nota:** Usamos múltiples configuraciones del mismo modelo (`llama-3.1-8b-instant`) con diferentes temperaturas y prompts para obtener múltiples perspectivas, ya que Groq solo tiene este modelo disponible actualmente.

### Configuración Completa (6 IAs)
- Requiere tarjeta para Anthropic (opcional)
- Together AI: Verificar si realmente no requiere tarjeta

---

## 🎯 Resumen Rápido

| IA | Gratis | Sin Tarjeta | Estado |
|---|---|---|---|
| Gemini 2.5 Flash | ✅ | ✅ | ✅ Configurado |
| Groq Llama 3.1 (Standard) | ✅ | ✅ | ✅ Configurado |
| Groq Llama 3.1 (Conservative) | ✅ | ✅ | ✅ Configurado |
| Groq Llama 3.1 (Analytical) | ✅ | ✅ | ✅ Configurado |
| Groq Llama 3.1 (Balanced) | ✅ | ✅ | ✅ Configurado |

---

## 🔗 Enlaces Rápidos

- **Gemini**: https://makersuite.google.com/app/apikey
- **Groq**: https://console.groq.com/keys
- **Grok (xAI)**: https://console.x.ai
- **Together AI**: https://api.together.xyz/settings/api-keys
- **OpenAI**: https://platform.openai.com/api-keys
- **Anthropic**: https://console.anthropic.com/

---

## 💡 Consejos para Hackathons

**Con Gemini + 4 configuraciones de Groq Llama 3.1 ya tienes 5 IAs gratuitas y funcionales para un hackathon exitoso! 🚀**

Todas las IAs están configuradas y funcionando:
- ✅ Gemini 2.5 Flash (Google)
- ✅ Groq Llama 3.1 (Standard) - temperatura 0.1
- ✅ Groq Llama 3.1 (Conservative) - temperatura 0.0
- ✅ Groq Llama 3.1 (Analytical) - temperatura 0.2
- ✅ Groq Llama 3.1 (Balanced) - temperatura 0.15

**Estrategia:** Como Groq solo tiene disponible `llama-3.1-8b-instant`, usamos múltiples configuraciones (temperaturas, prompts, system messages) para obtener diferentes perspectivas del mismo modelo, asegurando diversidad en el consenso.

