# 🚀 Guía de Deployment en Vercel

## 📋 Prerequisitos

1. ✅ Cuenta en [Vercel](https://vercel.com)
2. ✅ Repositorio en GitHub/GitLab/Bitbucket
3. ✅ Todas las variables de entorno listas

---

## 🔧 Paso 1: Preparar el Proyecto

### 1.1 Verificar estructura

Asegúrate de que tu proyecto tenga esta estructura:

```
MetaPredict/
├── frontend/          # Next.js app (root para Vercel)
│   ├── app/
│   ├── lib/
│   ├── package.json
│   └── vercel.json   # ✅ Ya creado
├── smart-contracts/
├── backend/          # ⚠️ Ya no necesario (opcional)
└── .env.example
```

### 1.2 Configurar Root Directory

Vercel necesita saber que el proyecto Next.js está en `frontend/`:

**Opción A: Deploy desde subdirectorio**
- En Vercel Dashboard → Settings → General
- Set "Root Directory" to `frontend`

**Opción B: Deploy desde root (recomendado)**
- Mover `vercel.json` al root si es necesario
- O configurar en Vercel Dashboard

---

## 🔐 Paso 2: Configurar Variables de Entorno

### 2.1 Variables Públicas (NEXT_PUBLIC_*)

Estas se exponen al navegador:

```bash
# Thirdweb
NEXT_PUBLIC_THIRDWEB_CLIENT_ID=3631641b29eb64f9b3e1b22a6a8d1a0f

# WalletConnect
NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID=your_walletconnect_project_id_here

# Blockchain
NEXT_PUBLIC_CHAIN_ID=5611
NEXT_PUBLIC_OPBNB_TESTNET_RPC=https://opbnb-testnet-rpc.bnbchain.org

# Contract Addresses
NEXT_PUBLIC_CORE_CONTRACT_ADDRESS=0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8
NEXT_PUBLIC_AI_ORACLE_ADDRESS=0xB937f6a00bE40500B3Da15795Dc72783b05c1D18
NEXT_PUBLIC_INSURANCE_POOL_ADDRESS=0x4fec42A17F54870d104bEf233688dc9904Bbd58d
NEXT_PUBLIC_REPUTATION_STAKING_ADDRESS=0xa62ba5700E24554D342133e326D7b5496F999108
NEXT_PUBLIC_DAO_GOVERNANCE_ADDRESS=0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c
NEXT_PUBLIC_OMNI_ROUTER_ADDRESS=0xeC153A56E676a34360B884530cf86Fb53D916908
NEXT_PUBLIC_BINARY_MARKET_ADDRESS=0x4755014b4b34359c27B8A289046524E0987833F9
NEXT_PUBLIC_CONDITIONAL_MARKET_ADDRESS=0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a
NEXT_PUBLIC_SUBJECTIVE_MARKET_ADDRESS=0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc

# Tokens
NEXT_PUBLIC_USDC_ADDRESS=0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3

# App URL
NEXT_PUBLIC_APP_URL=https://your-app.vercel.app
```

### 2.2 Variables Privadas (Server-side)

Estas NO se exponen al navegador:

```bash
# AI Services
GEMINI_API_KEY=AIzaSyCJmpYkAx0-0ZnVt0sq_KW4Lg4XtcE4mHs
GOOGLE_API_KEY=AIzaSyCJmpYkAx0-0ZnVt0sq_KW4Lg4XtcE4mHs
GROQ_API_KEY=your_groq_api_key_here
OPENROUTER_API_KEY=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

# Gelato
GELATO_RELAY_API_KEY=PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_
GELATO_AUTOMATE_API_KEY=PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_
GELATO_RPC_API_KEY=9204798d9d704f239b47867f60092ab1
GELATO_RPC_URL_TESTNET=https://opbnb-testnet.gelato.digital/rpc/9204798d9d704f239b47867f60092ab1

# Venus
VENUS_API_URL=https://api.venus.io
VENUS_TESTNET_API_URL=https://testnetapi.venus.io
VENUS_USE_TESTNET=true
VENUS_VTOKEN=0xe3923805f6E117E51f5387421240a86EF1570abC
VENUS_VUSDC_ADDRESS=0xe3923805f6E117E51f5387421240a86EF1570abC

# Chainlink Data Streams
CHAINLINK_DATA_STREAMS_VERIFIER_PROXY=0x001225Aca0efe49Dbb48233aB83a9b4d177b581A
CHAINLINK_DATA_STREAMS_BTC_USD_STREAM_ID=0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8
CHAINLINK_DATA_STREAMS_ETH_USD_STREAM_ID=0x000362205e10b3a147d02792eccee483dca6c7b44ecce7012cb8c6e0b68b3ae9
CHAINLINK_DATA_STREAMS_USDT_USD_STREAM_ID=0x0003a910a43485e0685ff5d6d366541f5c21150f0634c5b14254392d1a1c06db
CHAINLINK_DATA_STREAMS_BNB_USD_STREAM_ID=0x000335fd3f3ffa06cfd9297b97367f77145d7a5f132e84c736cc471dd98621fe
CHAINLINK_DATA_STREAMS_SOL_USD_STREAM_ID=0x0003b778d3f6b2ac4991302b89cb313f99a42467d6c9c5f96f57c29c0d2bc24f
CHAINLINK_DATA_STREAMS_USDC_USD_STREAM_ID=0x00038f83323b6b08116d1614cf33a9bd71ab5e0abf0c9f1b783a74a43e7bd992
CHAINLINK_DATA_STREAMS_XRP_USD_STREAM_ID=0x0003c16c6aed42294f5cb4741f6e59ba2d728f0eae2eb9e6d3f555808c59fc45
CHAINLINK_DATA_STREAMS_DOGE_USD_STREAM_ID=0x000356ca64d3b32135e17dc0dc721a645bf50d0303be8ceb2cdca0a50bab8fdc

# RPC
RPC_URL_TESTNET=https://opbnb-testnet-rpc.bnbchain.org
OPBNB_RPC_URL=https://opbnb-testnet-rpc.bnbchain.org
OPBNB_CHAIN_ID=5611

# Cron Security (opcional)
CRON_SECRET=your-random-secret-key-here

# Environment
NODE_ENV=production
VENUS_USE_TESTNET=true
```

### 2.3 Cómo Agregar Variables en Vercel

1. Ve a tu proyecto en [Vercel Dashboard](https://vercel.com/dashboard)
2. Settings → Environment Variables
3. Agrega cada variable:
   - **Name**: `GEMINI_API_KEY`
   - **Value**: `AIzaSyC...`
   - **Environment**: Production, Preview, Development (selecciona todos)
4. Repite para todas las variables

**Tip**: Puedes importar desde `.env.example` copiando y pegando.

---

## 🚀 Paso 3: Deploy

### 3.1 Deploy Automático (Git Push)

1. **Push a GitHub:**
   ```bash
   git add .
   git commit -m "feat: Migrate to Next.js API Routes"
   git push origin main
   ```

2. **Vercel detecta automáticamente** y despliega

### 3.2 Deploy Manual

1. Ve a [Vercel Dashboard](https://vercel.com/dashboard)
2. Click "Add New Project"
3. Importa tu repositorio
4. Configura:
   - **Framework Preset**: Next.js
   - **Root Directory**: `frontend` (si aplica)
   - **Build Command**: `pnpm build` (o `npm run build`)
   - **Output Directory**: `.next`
5. Click "Deploy"

---

## ⚙️ Paso 4: Configurar Vercel Cron

### 4.1 Verificar vercel.json

El archivo `frontend/vercel.json` ya está configurado:

```json
{
  "crons": [
    {
      "path": "/api/cron/oracle-check",
      "schedule": "*/5 * * * *"
    }
  ]
}
```

### 4.2 Activar Cron Jobs

1. Ve a tu proyecto en Vercel Dashboard
2. Settings → Cron Jobs
3. Verifica que el cron job esté activo
4. El cron se ejecutará automáticamente cada 5 minutos

### 4.3 Monitorear Cron Jobs

- Ve a Vercel Dashboard → Deployments
- Click en un deployment
- Ve a "Functions" → Busca `/api/cron/oracle-check`
- Verás logs de ejecuciones

---

## 🧪 Paso 5: Testing Post-Deployment

### 5.1 Probar Rutas Públicas

```bash
# Desde tu máquina
curl https://your-app.vercel.app/api/gelato/status
curl https://your-app.vercel.app/api/oracle/status
curl https://your-app.vercel.app/api/venus/markets
```

### 5.2 Probar Cron Job

1. Espera 5 minutos después del deploy
2. Ve a Vercel Dashboard → Deployments
3. Revisa los logs del cron job
4. O llama manualmente:
   ```bash
   curl https://your-app.vercel.app/api/cron/oracle-check \
     -H "Authorization: Bearer YOUR_CRON_SECRET"
   ```

### 5.3 Verificar Variables de Entorno

Crea una ruta de prueba (solo para testing):

```typescript
// frontend/app/api/test-env/route.ts
export async function GET() {
  return Response.json({
    hasGemini: !!process.env.GEMINI_API_KEY,
    hasGroq: !!process.env.GROQ_API_KEY,
    hasOpenRouter: !!process.env.OPENROUTER_API_KEY,
    // NO devuelvas los valores reales, solo si existen
  });
}
```

Luego elimina esta ruta después de verificar.

---

## 📊 Paso 6: Monitoreo

### 6.1 Logs en Vercel

- **Dashboard → Deployments → [Latest] → Functions**
- Verás logs de todas las funciones serverless
- Filtra por ruta: `/api/oracle/resolve`, `/api/cron/oracle-check`, etc.

### 6.2 Métricas

- **Dashboard → Analytics**
- Verás:
  - Requests por ruta
  - Tiempo de respuesta
  - Errores
  - Uso de funciones

### 6.3 Alertas

Configura alertas en Vercel para:
- Errores en funciones
- Tiempo de respuesta alto
- Uso excesivo de recursos

---

## 🔧 Troubleshooting

### Error: "Function timeout"

**Solución**: Aumenta `maxDuration` en la ruta:
```typescript
export const maxDuration = 60; // 60 segundos (máximo en Hobby)
```

### Error: "Environment variable not found"

**Solución**: 
1. Verifica que la variable esté en Vercel Dashboard
2. Verifica que esté marcada para el ambiente correcto (Production/Preview/Development)
3. Redespliega después de agregar variables

### Error: "Cron job not running"

**Solución**:
1. Verifica `vercel.json` está en el root o en `frontend/`
2. Verifica que el path sea correcto: `/api/cron/oracle-check`
3. Espera unos minutos (puede tardar en activarse)
4. Revisa logs en Vercel Dashboard

### Error: "Module not found"

**Solución**:
1. Verifica que todas las dependencias estén en `frontend/package.json`
2. Ejecuta `pnpm install` localmente para verificar
3. Vercel instalará dependencias automáticamente

---

## 📝 Checklist de Deployment

- [ ] Variables de entorno configuradas en Vercel
- [ ] `vercel.json` configurado con cron jobs
- [ ] URLs actualizadas de `localhost:3001` a `/api`
- [ ] Proyecto desplegado en Vercel
- [ ] Cron job activo y funcionando
- [ ] Rutas API probadas y funcionando
- [ ] Logs monitoreados
- [ ] Variables de entorno verificadas (sin exponer valores)

---

## 🎯 URLs Post-Deployment

Después del deploy, tus URLs serán:

- **Frontend**: `https://your-app.vercel.app`
- **API Routes**: `https://your-app.vercel.app/api/*`
- **Cron Job**: Se ejecuta automáticamente cada 5 minutos

---

## 📚 Recursos

- [Vercel Documentation](https://vercel.com/docs)
- [Next.js API Routes](https://nextjs.org/docs/app/building-your-application/routing/route-handlers)
- [Vercel Cron Jobs](https://vercel.com/docs/cron-jobs)
- [Environment Variables](https://vercel.com/docs/projects/environment-variables)

---

**¡Listo para deploy!** 🚀

