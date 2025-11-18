# 🤗 Hugging Face Inference Endpoints - Guía Completa (Noviembre 2025)

## 📋 Resumen

Los **Inference Endpoints** de Hugging Face son un servicio gestionado que permite desplegar modelos de IA en producción sin preocuparse por la infraestructura. Según la [documentación oficial](https://huggingface.co/docs/inference-endpoints/about), este servicio maneja todo el ciclo de vida de los contenedores.

## 🎯 ¿Qué son los Inference Endpoints?

Los Inference Endpoints traen juntos tres componentes clave:

1. **Model Weights and Artifacts**: Parámetros entrenados almacenados en el Hugging Face Hub
2. **Inference Engine**: Software que carga y ejecuta el modelo (vLLM, TGI, SGLang, llama.cpp, TEI)
3. **Production Infrastructure**: Infraestructura escalable, segura y confiable gestionada por Hugging Face

## 🚀 Motores de Inferencia Soportados

- **vLLM**: Alto rendimiento para modelos grandes
- **Text-generation-inference (TGI)**: Optimizado para generación de texto
- **SGLang**: Motor de inferencia eficiente
- **llama.cpp**: Para modelos Llama
- **Text-embeddings-inference (TEI)**: Para embeddings

## 📍 Regiones Disponibles (Noviembre 2025)

- **AWS**: us-east-1 (N. Virginia), eu-west-1 (Irlanda)
- **Azure**: eastus (Virginia)
- **GCP**: us-east4 (Virginia)

## 🔧 Cómo Crear un Inference Endpoint

### Pasos:

1. **Acceder a Inference Endpoints**: Inicia sesión en Hugging Face y navega a la sección de Inference Endpoints
2. **Seleccionar modelo**: Elige un modelo del Hugging Face Hub
3. **Configurar instancia**: Selecciona proveedor (AWS/Azure/GCP), región y tipo de instancia
4. **Configurar escalado**: Define mínimo/máximo de réplicas y scale-to-zero si lo deseas
5. **Definir seguridad**: Configura nivel de acceso (público/privado)
6. **Crear endpoint**: Haz clic en "Crear Endpoint" y espera 1-5 minutos

### Configuración Recomendada para Hackathons:

- **Modelo**: `google/flan-t5-base` o `microsoft/DialoGPT-medium` (modelos pequeños y rápidos)
- **Instancia**: CPU o GPU pequeña (para reducir costos)
- **Scale-to-zero**: Habilitado (se detiene cuando no hay uso)
- **Región**: us-east-1 (AWS) - más económica

## 🔌 Cómo Usar el Endpoint en el Código

Una vez creado el endpoint, recibirás una URL única con el formato:
```
https://{endpoint-id}.{region}.inference.endpoints.huggingface.cloud
```

### Ejemplo de llamada HTTP:

```typescript
const response = await axios.post(
  'https://tu-endpoint-id.us-east-1.inference.endpoints.huggingface.cloud',
  {
    inputs: 'Tu prompt aquí',
    parameters: {
      max_new_tokens: 100,
      temperature: 0.7,
    },
  },
  {
    headers: {
      'Authorization': `Bearer ${HUGGINGFACE_API_KEY}`,
      'Content-Type': 'application/json',
    },
  }
);
```

### Ejemplo con cURL:

```bash
curl https://tu-endpoint-id.us-east-1.inference.endpoints.huggingface.cloud \
  -X POST \
  -H "Authorization: Bearer $HUGGINGFACE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "inputs": "Tu prompt aquí",
    "parameters": {
      "max_new_tokens": 100,
      "temperature": 0.7
    }
  }'
```

## 💰 Pricing y Costos

**IMPORTANTE**: Los Inference Endpoints son un servicio de pago. No hay tier gratuito permanente, pero:

- Puedes habilitar **scale-to-zero** para que el endpoint se detenga cuando no hay uso
- Solo pagas por el tiempo que el endpoint está activo
- Para hackathons, considera usar instancias pequeñas y scale-to-zero

### Alternativas Gratuitas:

1. **API de Inference Pública** (deprecada): `api-inference.huggingface.co` - Ya no funciona
2. **Router Endpoint** (limitado): `router.huggingface.co/hf-inference` - Solo algunos modelos
3. **Inference Providers**: Algunos modelos disponibles a través de partners

## 🔄 Integración en MetaPredict

### Opción 1: Usar Inference Endpoint Dedicado (Recomendado para Producción)

Si creas un Inference Endpoint, actualiza el servicio:

```typescript
// backend/src/services/llm/huggingface.service.ts
private endpointUrl = process.env.HUGGINGFACE_ENDPOINT_URL || 
  'https://tu-endpoint-id.us-east-1.inference.endpoints.huggingface.cloud';
```

### Opción 2: Continuar sin Hugging Face (Recomendado para Hackathons)

El sistema de consenso funciona perfectamente con las otras 4 IAs:
- ✅ Gemini 2.5 Flash
- ✅ Groq (Llama 3.1)
- ✅ OpenAI GPT-3.5 Turbo
- ⚠️ Hugging Face (opcional, requiere Inference Endpoint)

## 📚 Referencias

- [Documentación Oficial - About](https://huggingface.co/docs/inference-endpoints/about)
- [Guía de Creación de Endpoints](https://huggingface.co/docs/inference-endpoints/guides/create_endpoint)
- [Guía de Pruebas de Endpoints](https://huggingface.co/docs/inference-endpoints/guides/test_endpoint)
- [FAQ de Inference Endpoints](https://huggingface.co/docs/inference-endpoints/faq)

## ⚠️ Notas Importantes

1. **API Pública Deprecada**: El endpoint `api-inference.huggingface.co` está completamente deprecado
2. **Router Endpoint Limitado**: El endpoint `router.huggingface.co/hf-inference` solo funciona con algunos modelos específicos
3. **Inference Endpoints Requieren Pago**: No hay tier gratuito permanente, pero scale-to-zero ayuda a minimizar costos
4. **Para Hackathons**: Considera usar solo las 4 IAs que funcionan gratuitamente (Gemini, Groq, OpenAI, Anthropic)

## 🎯 Recomendación para MetaPredict

Para el hackathon actual:
- ✅ Continuar con 4 IAs (Gemini, Groq, OpenAI, Anthropic)
- ✅ El sistema de consenso funciona perfectamente sin Hugging Face
- ⚠️ Hugging Face puede agregarse más tarde si se crea un Inference Endpoint dedicado

Para producción:
- Considerar crear un Inference Endpoint dedicado para Hugging Face
- Usar scale-to-zero para optimizar costos
- Monitorear el uso y ajustar la configuración según necesidad

