# 🔄 Integración Gelato Automation - MetaPredict.ai

## 📊 Resumen

Gelato Automation se usa como **alternativa a Chainlink Functions** para automatizar las resoluciones del AIOracle, ya que Chainlink Functions **NO está disponible en opBNB**.

## ✅ Estado de la Integración

- ✅ **Servicio de Gelato creado**: `backend/src/services/gelatoService.ts`
- ✅ **Rutas API creadas**: `backend/src/routes/gelato.ts`
- ✅ **Variables de entorno configuradas**: `env.example`
- ✅ **API Key configurada**: `PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_`
- ✅ **RPC Privado configurado**: `9204798d9d704f239b47867f60092ab1`

## 🔧 Configuración

### Variables de Entorno

En `.env` (raíz del proyecto):

```env
# Gelato Automation (ALTERNATIVA a Chainlink Functions)
GELATO_RELAY_API_KEY=PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_
GELATO_AUTOMATE_API_KEY=PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_

# RPC Privado Gelato (para mejor rendimiento)
GELATO_RPC_API_KEY=9204798d9d704f239b47867f60092ab1
GELATO_RPC_URL_TESTNET=https://opbnb-testnet.gelato.digital/rpc/9204798d9d704f239b47867f60092ab1
```

## 🚀 Uso

### 1. Verificar Configuración

```bash
curl http://localhost:3001/api/gelato/status
```

### 2. Crear Tarea Automatizada

```bash
curl -X POST http://localhost:3001/api/gelato/setup-oracle-automation \
  -H "Content-Type: application/json" \
  -d '{
    "aiOracleAddress": "0x9A9a15F8172Cb366450642F1756c44b57911cdbb",
    "backendUrl": "http://localhost:3001/api/oracle/resolve"
  }'
```

### 3. Resolver Mercado Manualmente (usando Gelato Relay)

```bash
curl -X POST http://localhost:3001/api/gelato/fulfill-resolution \
  -H "Content-Type: application/json" \
  -d '{
    "aiOracleAddress": "0x9A9a15F8172Cb366450642F1756c44b57911cdbb",
    "marketId": 1,
    "outcome": 1,
    "confidence": 85,
    "chainId": 5611
  }'
```

## 🔄 Flujo de Resolución con Gelato

### Opción 1: Bot Backend (Recomendado)

```
1. Mercado llega a deadline
2. Bot backend monitorea eventos ResolutionRequested
3. Bot llama backend /api/oracle/resolve
4. Backend ejecuta consenso multi-AI
5. Bot usa Gelato Relay para ejecutar fulfillResolutionManual en el contrato
6. Contrato resuelve el mercado
```

### Opción 2: Gelato Automation (Requiere contrato executor)

```
1. Gelato Automation monitorea eventos cada X minutos
2. Contrato executor detecta mercados pendientes
3. Contrato llama backend vía HTTP (si Gelato Web3 Functions está disponible)
4. Backend retorna resultado
5. Contrato ejecuta fulfillResolutionManual
6. Mercado resuelto
```

## 📝 Endpoints API

### `GET /api/gelato/status`
Verifica la configuración de Gelato.

**Respuesta:**
```json
{
  "configured": true,
  "apiKeyPresent": true,
  "message": "Gelato is configured and ready"
}
```

### `POST /api/gelato/tasks`
Crea una nueva tarea automatizada.

**Body:**
```json
{
  "name": "Task Name",
  "execAddress": "0x...",
  "execSelector": "0x...",
  "execData": "0x...",
  "interval": 60,
  "useTreasury": true
}
```

### `GET /api/gelato/tasks/:taskId`
Obtiene el estado de una tarea.

### `DELETE /api/gelato/tasks/:taskId`
Cancela una tarea.

### `POST /api/gelato/relay`
Envía una transacción usando Gelato Relay (gasless).

**Body:**
```json
{
  "chainId": 5611,
  "target": "0x...",
  "data": "0x...",
  "user": "0x..." // opcional
}
```

## 🔗 Referencias

- [Gelato Documentation](https://docs.gelato.network/)
- [Gelato Dashboard](https://app.gelato.network/)
- [Gelato Private RPCs](https://docs.gelato.cloud/private-rpcs/)

## ⚠️ Notas Importantes

1. **Chainlink Functions NO disponible**: Gelato es la alternativa recomendada para opBNB.
2. **Gas Tank**: Necesitas depositar fondos en tu Gas Tank de Gelato para patrocinar transacciones.
3. **RPC Privado**: El RPC privado de Gelato ofrece mejor rendimiento y rate limits.
4. **Contrato Executor**: Para automatización completa, necesitarás un contrato que monitoree eventos y llame al backend.

## 🎯 Próximos Pasos

1. ✅ Configurar Gas Tank en Gelato Dashboard
2. ⏳ Crear contrato executor (opcional, para automatización completa)
3. ⏳ Implementar bot backend que monitoree eventos y use Gelato Relay
4. ⏳ Probar integración end-to-end

---

**Última actualización**: Noviembre 2025

