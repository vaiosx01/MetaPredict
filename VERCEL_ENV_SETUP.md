# 🚀 Configuración de Variables de Entorno en Vercel

## ✅ Proyecto Desplegado

- **URL de Producción**: https://metapredict-aut8qvt0l-vaiosxs-projects.vercel.app
- **Dashboard**: https://vercel.com/vaiosxs-projects/metapredict/settings/environment-variables

## 📋 Variables de Entorno Necesarias

### Variables Obligatorias

1. **NEXT_PUBLIC_THIRDWEB_CLIENT_ID** (OBLIGATORIO)
   - Obtén tu Client ID en: https://thirdweb.com/dashboard
   - Sin esto, la aplicación no funcionará

2. **NEXT_PUBLIC_API_URL**
   - URL de tu backend API
   - Ejemplo: `https://tu-backend.vercel.app/api` o `https://tu-backend.railway.app/api`

### Variables Recomendadas

3. **NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID**
   - Obtén tu Project ID en: https://cloud.walletconnect.com/
   - Necesario para conectar wallets

4. **GEMINI_API_KEY**
   - API key de Google Gemini
   - Necesario para funcionalidad de AI
   - Obtén en: https://makersuite.google.com/app/apikey

### Variables con Valores por Defecto (ya configuradas)

Estas variables tienen valores por defecto que funcionan, pero puedes personalizarlas:

- `NEXT_PUBLIC_CHAIN_ID=5611` (opBNB Testnet)
- `NEXT_PUBLIC_OPBNB_TESTNET_RPC=https://opbnb-testnet-rpc.bnbchain.org`
- `NEXT_PUBLIC_OPBNB_MAINNET_RPC=https://opbnb-mainnet-rpc.bnbchain.org`
- `NEXT_PUBLIC_APP_URL=https://metapredict-aut8qvt0l-vaiosxs-projects.vercel.app`
- `NEXT_PUBLIC_IPFS_GATEWAY_URL=https://ipfs.io/ipfs/`
- `NODE_ENV=production`

### Direcciones de Contratos (actualizar después del deployment)

- `NEXT_PUBLIC_PREDICTION_MARKET_ADDRESS=0x0000000000000000000000000000000000000000`
- `NEXT_PUBLIC_AI_ORACLE_ADDRESS=0x0000000000000000000000000000000000000000`
- `NEXT_PUBLIC_INSURANCE_POOL_ADDRESS=0x0000000000000000000000000000000000000000`
- `NEXT_PUBLIC_USDC_ADDRESS=0x0000000000000000000000000000000000000000`

## 🔧 Cómo Agregar Variables

### Opción 1: Dashboard Web (Recomendado)

1. Ve a: https://vercel.com/vaiosxs-projects/metapredict/settings/environment-variables
2. Haz clic en "Add New"
3. Ingresa el nombre y valor de la variable
4. Selecciona los ambientes (Production, Preview, Development)
5. Haz clic en "Save"

### Opción 2: CLI de Vercel

```powershell
# Navegar al directorio del proyecto
cd C:\Daaps\MetaPredict

# Agregar una variable (te pedirá el valor)
vercel env add NEXT_PUBLIC_THIRDWEB_CLIENT_ID production

# Agregar múltiples variables
vercel env add NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID production
vercel env add GEMINI_API_KEY production
vercel env add NEXT_PUBLIC_API_URL production
```

### Opción 3: Script Automático

Puedes usar el script `setup-vercel-env.ps1` como referencia, pero necesitarás agregar las variables manualmente ya que `vercel env add` requiere entrada interactiva.

## 🔄 Después de Agregar Variables

Después de agregar las variables, necesitas hacer un redeploy:

```powershell
vercel --prod
```

O desde el dashboard, haz clic en "Redeploy" en el último deployment.

## ✅ Checklist

- [ ] NEXT_PUBLIC_THIRDWEB_CLIENT_ID configurado
- [ ] NEXT_PUBLIC_API_URL configurado (si tienes backend)
- [ ] NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID configurado (opcional pero recomendado)
- [ ] GEMINI_API_KEY configurado (si usas AI)
- [ ] Variables de contratos actualizadas (después del deployment de contratos)
- [ ] Redeploy realizado

## 🔗 Enlaces Útiles

- Dashboard de Vercel: https://vercel.com/vaiosxs-projects/metapredict
- Configuración de Variables: https://vercel.com/vaiosxs-projects/metapredict/settings/environment-variables
- Thirdweb Dashboard: https://thirdweb.com/dashboard
- WalletConnect Cloud: https://cloud.walletconnect.com/
- Google Gemini API: https://makersuite.google.com/app/apikey

