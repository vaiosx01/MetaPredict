# 📊 Progreso de Migración a Next.js API Routes

## ✅ Completado

### 1. Estructura Base
- ✅ Creado `frontend/lib/services/` para servicios compartidos

### 2. Venus Protocol (✅ COMPLETO)
- ✅ Migrado `VenusService` a `frontend/lib/services/venusService.ts`
- ✅ Creadas todas las rutas API:
  - ✅ `GET /api/venus/markets` - Todos los mercados
  - ✅ `GET /api/venus/markets/[address]` - Mercado específico
  - ✅ `GET /api/venus/vusdc` - Información vUSDC
  - ✅ `GET /api/venus/apy/[address]` - APY de un vToken
  - ✅ `GET /api/venus/insurance-pool/apy` - APY del Insurance Pool
  - ✅ `GET /api/venus/history/[address]` - Datos históricos
  - ✅ `GET /api/venus/history/[address]/until` - Histórico hasta fecha
  - ✅ `GET /api/venus/transactions` - Transacciones
  - ✅ `GET /api/venus/insurance-pool/transactions` - Transacciones del pool

**Total rutas Venus**: 9/9 ✅

---

## ⏳ Pendiente

### 3. Gelato Service
- ⏳ Migrar `GelatoService` a `frontend/lib/services/gelatoService.ts`
- ⏳ Crear rutas:
  - `GET /api/gelato/status`
  - `GET /api/gelato/bot-status`
  - `POST /api/gelato/fulfill-resolution`
  - `POST /api/gelato/create-task`
  - `GET /api/gelato/task/[taskId]`

### 4. Oracle/Consensus
- ⏳ Migrar `ConsensusService` a `frontend/lib/services/llm/consensus.service.ts`
- ⏳ Crear ruta:
  - `POST /api/oracle/resolve` (ya existe en backend/src/app/api/oracle/resolve, mover)

### 5. AI Routes (Completar)
- ⏳ Revisar rutas existentes en `frontend/app/api/ai/`
- ⏳ Migrar rutas faltantes desde `backend/src/routes/ai.ts`

### 6. Markets
- ⏳ Migrar `MarketService` a `frontend/lib/services/marketService.ts`
- ⏳ Crear rutas:
  - `GET /api/markets`
  - `GET /api/markets/[id]`
  - `POST /api/markets`
  - `PUT /api/markets/[id]`
  - `DELETE /api/markets/[id]`

### 7. Reputation
- ⏳ Migrar `ReputationService` a `frontend/lib/services/reputationService.ts`
- ⏳ Crear rutas:
  - `POST /api/reputation/stake`
  - `POST /api/reputation/unstake`
  - `GET /api/reputation/score/[address]`

### 8. Aggregation
- ⏳ Migrar `AggregationService` a `frontend/lib/services/aggregationService.ts`
- ⏳ Crear rutas:
  - `GET /api/aggregation/compare`
  - `POST /api/aggregation/execute`

### 9. Users
- ⏳ Migrar `UserService` a `frontend/lib/services/userService.ts`
- ⏳ Crear rutas:
  - `GET /api/users/[address]`
  - `POST /api/users`

### 10. Oracle Bot (Vercel Cron)
- ⏳ Crear `frontend/app/api/cron/oracle-check/route.ts`
- ⏳ Configurar `vercel.json` con cron job
- ⏳ Migrar lógica del bot a función serverless

---

## 📝 Notas

### Cambios en URLs del Frontend

**Antes:**
```typescript
const response = await fetch('http://localhost:3001/api/venus/markets');
```

**Después:**
```typescript
const response = await fetch('/api/venus/markets');
```

### Variables de Entorno

Todas las variables de entorno funcionan igual, pero ahora se leen desde el root `.env`:
- `VENUS_API_URL`
- `VENUS_TESTNET_API_URL`
- `VENUS_USE_TESTNET`
- `VENUS_VUSDC_ADDRESS`

### Testing

Para probar las nuevas rutas:
```bash
# Desde el frontend
cd frontend
pnpm dev

# Probar endpoint
curl http://localhost:3000/api/venus/markets
```

---

## 🎯 Próximo Paso

**Migrar Gelato Service** (similar a Venus, pero con más complejidad por las interacciones con blockchain)

