# 🤖 Guía de Prueba del Oracle Bot

## ✅ Estado Actual

- ✅ **AIOracle desplegado** con `fulfillResolutionManual`: `0xB937f6a00bE40500B3Da15795Dc72783b05c1D18`
- ✅ **AIOracle verificado** en opBNBScan
- ✅ **Código del bot** implementado y listo
- ⏳ **Backend** necesita ser iniciado manualmente

## 🚀 Pasos para Probar el Bot

### Paso 1: Verificar Variables de Entorno

Asegúrate de que tu `.env.local` o `.env` tenga:

```bash
# Gelato
GELATO_RELAY_API_KEY=PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_
GELATO_AUTOMATE_API_KEY=PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_

# AI Oracle (NUEVO)
NEXT_PUBLIC_AI_ORACLE_ADDRESS=0xB937f6a00bE40500B3Da15795Dc72783b05c1D18
NEXT_PUBLIC_CORE_CONTRACT_ADDRESS=0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8

# Backend URL
BACKEND_URL=http://localhost:3001/api/oracle/resolve
NEXT_PUBLIC_API_URL=http://localhost:3001/api

# RPC
RPC_URL_TESTNET=https://opbnb-testnet-rpc.bnbchain.org
GELATO_RPC_URL_TESTNET=https://opbnb-testnet.gelato.digital/rpc/9204798d9d704f239b47867f60092ab1
```

### Paso 2: Iniciar Backend

```bash
cd backend
pnpm run dev
```

Deberías ver:
```
🚀 MetaPredict.ai Backend running on port 3001
📡 API available at http://localhost:3001/api
🤖 Oracle Bot started successfully
```

### Paso 3: Verificar Estado de Gelato

En otra terminal:

```bash
curl http://localhost:3001/api/gelato/status
```

**Respuesta esperada:**
```json
{
  "configured": true,
  "apiKeyPresent": true,
  "message": "Gelato is configured and ready"
}
```

### Paso 4: Verificar Estado del Bot

```bash
curl http://localhost:3001/api/gelato/bot-status
```

**Respuesta esperada:**
```json
{
  "isRunning": true,
  "monitorStatus": {
    "isMonitoring": true,
    "aiOracleAddress": "0xB937f6a00bE40500B3Da15795Dc72783b05c1D18",
    "predictionMarketAddress": "0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8",
    "chainId": 5611,
    "processedCount": 0
  }
}
```

### Paso 5: Probar Resolución Manual (Opcional)

⚠️ **ADVERTENCIA**: Esto ejecutará una transacción real en testnet. Solo prueba si tienes un mercado real con ID 1.

```bash
curl -X POST http://localhost:3001/api/gelato/fulfill-resolution \
  -H "Content-Type: application/json" \
  -d '{
    "aiOracleAddress": "0xB937f6a00bE40500B3Da15795Dc72783b05c1D18",
    "marketId": 1,
    "outcome": 1,
    "confidence": 85,
    "chainId": 5611
  }'
```

**Respuesta esperada:**
```json
{
  "taskId": "0x..."
}
```

### Paso 6: Probar Flujo Completo End-to-End

1. **Crear un mercado de prueba** (desde frontend o directamente en el contrato)
2. **Esperar a que llegue a deadline** o forzar resolución
3. **El bot debería detectar** el evento `ResolutionRequested`
4. **El bot llama al backend** `/api/oracle/resolve`
5. **El backend ejecuta consenso multi-AI**
6. **El bot usa Gelato Relay** para llamar `fulfillResolutionManual()`
7. **El mercado se resuelve** automáticamente

## 🔍 Verificar Logs del Bot

El bot debería mostrar logs como:

```
[EventMonitor] ResolutionRequested detected: requestId=..., marketId=1
[EventMonitor] Processing resolution for marketId=1
[EventMonitor] Backend resolved: outcome=1, confidence=85
[EventMonitor] Gelato Relay task created: taskId=... for marketId=1
```

## ⚠️ Troubleshooting

### Error: "GELATO_RELAY_API_KEY not configured"
- Verifica que la API key esté en `.env.local` o `.env`
- Reinicia el backend después de agregar la variable

### Error: "AI_ORACLE_ADDRESS not configured"
- Verifica que `NEXT_PUBLIC_AI_ORACLE_ADDRESS` esté configurado
- Usa la nueva dirección: `0xB937f6a00bE40500B3Da15795Dc72783b05c1D18`

### Error: "Bot is not running"
- Verifica los logs del backend para ver el error
- Asegúrate de que el RPC esté accesible
- Verifica que las direcciones de contratos sean correctas

### El bot no detecta eventos
- Verifica que el contrato AIOracle esté emitiendo eventos
- Verifica que el RPC esté funcionando
- Revisa los logs del bot para errores

## 📝 Script de Prueba Automatizado

He creado `backend/test-oracle-bot.js` que puedes ejecutar:

```bash
cd backend
node test-oracle-bot.js
```

Este script prueba:
1. Estado de Gelato
2. Estado del bot
3. Resolución manual (comentado por defecto)

## ✅ Checklist de Prueba

- [ ] Backend iniciado sin errores
- [ ] Gelato configurado correctamente
- [ ] Bot iniciado y monitoreando
- [ ] Endpoints responden correctamente
- [ ] Prueba de resolución manual exitosa (opcional)
- [ ] Flujo end-to-end funcionando

---

**Estado**: ✅ Código listo, pendiente iniciar backend y probar

