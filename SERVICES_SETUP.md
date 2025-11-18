# 🔧 Configuración de Servicios Externos - MetaPredict.ai

Esta guía te ayudará a configurar todos los servicios externos necesarios para que MetaPredict funcione al 100%.

## ✅ Servicios Ya Configurados

- ✅ **NodeReal API** - Para verificación de contratos (opBNBScan)
- ✅ **USDC Token** - Dirección en opBNB testnet: `0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3`
- ✅ **Smart Contracts** - Desplegados y verificados en opBNB testnet

## 🔴 Servicios Requeridos (Faltantes)

### 1. 🔗 Chainlink Functions (Oracle Infrastructure)

**¿Para qué?** Conecta el AI Oracle con el backend para resolver predicciones.

**Estado:** ⚠️ **REQUERIDO** - Sin esto, el AI Oracle no puede funcionar

**Cómo obtenerlo:**

1. **Crear cuenta en Chainlink:**
   - Ve a: https://chain.link/
   - Haz clic en "Get Started" o "Sign Up"
   - Crea una cuenta

2. **Acceder a Chainlink Functions:**
   - Ve a: https://functions.chain.link/
   - Login con tu cuenta

3. **Crear una Subscription:**
   - Ve a: https://functions.chain.link/
   - Haz clic en "Create Subscription"
   - Selecciona la red: **opBNB Testnet** (Chain ID: 5611)
   - Funda la subscription con LINK tokens (necesitas LINK en opBNB testnet)

4. **Obtener las direcciones:**
   - **Functions Router Address** (opBNB Testnet): Consulta en [Chainlink Docs](https://docs.chain.link/chainlink-functions/supported-networks)
   - **DON ID**: Se genera automáticamente cuando creas la subscription
   - **Subscription ID**: Lo verás en tu dashboard después de crear la subscription

**Enlaces útiles:**
- 📚 [Chainlink Functions Docs](https://docs.chain.link/chainlink-functions)
- 🌐 [Chainlink Functions Dashboard](https://functions.chain.link/)
- 📋 [Supported Networks](https://docs.chain.link/chainlink-functions/supported-networks)
- 🔗 [Get LINK Tokens (Testnet)](https://faucets.chain.link/)

**Variables a configurar en `.env.local`:**
```bash
CHAINLINK_FUNCTIONS_ROUTER=0x... # Dirección del router en opBNB testnet
CHAINLINK_FUNCTIONS_SUBSCRIPTION_ID=123 # Tu subscription ID
CHAINLINK_FUNCTIONS_DON_ID=0x... # DON ID de tu subscription
CHAINLINK_SIGNATURE_SECRET=tu_secret_aqui # Para autenticación
```

---

### 2. 🔗 Chainlink CCIP (Cross-Chain Router) - ✅ DISPONIBLE EN opBNB

**¿Para qué?** Permite agregación cross-chain y transferencias entre diferentes blockchains.

**Estado:** ✅ **DISPONIBLE EN opBNB TESTNET** - Necesario solo si quieres funcionalidad cross-chain

**Direcciones oficiales de opBNB Testnet:**

Según la [documentación oficial de Chainlink CCIP](https://docs.chain.link/ccip/directory/testnet/chain/binance-smart-chain-testnet-opbnb-1):

- **CCIP Router Address**: `0xD9182959D9771cc77e228cB3caFe671f45A37630` ✅
- **Chain Selector**: `13274425992935471758`
- **LINK Token Address**: `0x56E16E648c51609A14Eb14B99BAB771Bee797045` (opBNB Testnet)
- **WTBNB Token**: `0x4200...0006` (wrapped tBNB)
- **RMN (Risk Management Network)**: `0xfd20...17B7`

**Cómo obtenerlo:**

1. **Acceder a Chainlink CCIP:**
   - Ve a: https://ccip.chain.link/
   - Login con tu cuenta de Chainlink

2. **Obtener direcciones completas:**
   - Ve a: [Chainlink CCIP Directory - opBNB Testnet](https://docs.chain.link/ccip/directory/testnet/chain/binance-smart-chain-testnet-opbnb-1) ⭐ **OFICIAL**
   - Copia las direcciones completas del Router y otros contratos

3. **Obtener LINK tokens de testnet:**
   - Ve a: [Chainlink Faucet - opBNB Testnet](https://faucets.chain.link/opbnb-testnet)
   - **Selecciona**: **LINK** tokens para la red **opBNB Testnet**
   - Ingresa tu dirección de wallet de opBNB testnet
   - Recibirás **25 LINK tokens de prueba** (suficiente para testing)
   - ⚠️ **IMPORTANTE**: También necesitarás **tBNB** para pagar gas fees. Obtén tBNB del [faucet oficial de opBNB](https://docs.bnbchain.org/bnb-opbnb/developers/network-faucet/)

**Enlaces útiles:**
- 📚 [Chainlink CCIP Docs](https://docs.chain.link/ccip)
- 🌐 [CCIP Dashboard](https://ccip.chain.link/)
- 📋 [opBNB Testnet CCIP Directory](https://docs.chain.link/ccip/directory/testnet/chain/binance-smart-chain-testnet-opbnb-1) ⭐ **OFICIAL**
- 🔗 [Get LINK Tokens (opBNB Testnet Faucet)](https://faucets.chain.link/opbnb-testnet)

**Variables a configurar en `.env.local`:**
```bash
CHAINLINK_CCIP_ROUTER=0xD9182959D9771cc77e228cB3caFe671f45A37630 # Router CCIP en opBNB testnet
LINK_TOKEN_ADDRESS=0x56E16E648c51609A14Eb14B99BAB771Bee797045 # LINK token en opBNB testnet
CHAINLINK_CCIP_CHAIN_SELECTOR=13274425992935471758 # Chain selector de opBNB testnet
```

---

### 3. 📊 Pyth Network (Price Feeds)

**¿Para qué?** Proporciona feeds de precios en tiempo real para mercados de predicción basados en precios.

**Estado:** ⚠️ **OPCIONAL** - Necesario solo para mercados basados en precios

**Cómo obtenerlo:**

1. **Acceder a Pyth Network:**
   - Ve a: https://pyth.network/
   - Explora la documentación

2. **Obtener direcciones:**
   - **Pyth Oracle Address** (opBNB): Consulta en [Pyth Docs](https://docs.pyth.network/)
   - **Price Feed IDs**: Encuentra los IDs de los feeds que necesitas en [Pyth Price Feeds](https://pyth.network/developers/price-feed-ids)

**Enlaces útiles:**
- 📚 [Pyth Network Docs](https://docs.pyth.network/)
- 📊 [Price Feed IDs](https://pyth.network/developers/price-feed-ids)
- 🌐 [Pyth Hermes](https://hermes.pyth.network/) - API para consultar precios

**Variables a configurar en `.env.local`:**
```bash
PYTH_ORACLE_ADDRESS=0x... # Dirección del contrato Pyth en opBNB
PYTH_PRICE_FEED_ID=0x... # ID del feed de precio que necesitas (ej: BTC/USD)
PYTH_HERMES_URL=https://hermes.pyth.network
```

---

### 4. 💰 Venus Protocol (Yield Farming)

**¿Para qué?** Permite que el Insurance Pool genere yield (5-12% APY) depositando USDC.

**Estado:** ⚠️ **OPCIONAL** - Mejora el rendimiento del Insurance Pool

**Cómo obtenerlo:**

1. **Acceder a Venus Protocol:**
   - Ve a: https://venus.io/
   - Explora la documentación

2. **Obtener direcciones:**
   - **vUSDC Address** (opBNB): Dirección del token vUSDC en Venus Protocol
   - Consulta en [Venus Docs](https://docs.venus.io/) o en el contrato de Venus en opBNB

**Enlaces útiles:**
- 📚 [Venus Protocol Docs](https://docs.venus.io/)
- 🌐 [Venus Protocol](https://venus.io/)
- 📋 [Venus Markets](https://app.venus.io/markets)

**Variables a configurar en `.env.local`:**
```bash
VENUS_VTOKEN=0x... # Dirección del vUSDC en opBNB
VENUS_VUSDC_ADDRESS=0x... # Mismo que VENUS_VTOKEN
```

---

### 5. 🥞 PancakeSwap Router (Liquidity Aggregation)

**¿Para qué?** Permite agregar liquidez y hacer swaps en opBNB.

**Estado:** ⚠️ **OPCIONAL** - Necesario solo para agregación de liquidez

**Cómo obtenerlo:**

1. **Acceder a PancakeSwap:**
   - Ve a: https://pancakeswap.finance/
   - Cambia a la red opBNB

2. **Obtener direcciones:**
   - **Router Address** (opBNB): Consulta en [PancakeSwap Docs](https://docs.pancakeswap.finance/)
   - Generalmente: `0x...` (consulta la documentación oficial)

**Enlaces útiles:**
- 📚 [PancakeSwap Docs](https://docs.pancakeswap.finance/)
- 🌐 [PancakeSwap](https://pancakeswap.finance/)

**Variables a configurar en `.env.local`:**
```bash
PANCAKE_ROUTER=0x... # Dirección del router de PancakeSwap en opBNB
```

---

### 6. 🤖 AI API Keys (Ya configurados - GRATIS)

**Estado:** ✅ **OPCIONAL** - Ya tienes las instrucciones, pero aquí están los enlaces directos

#### Google Gemini 2.5 Flash
- 🔗 **Obtener API Key**: https://aistudio.google.com/app/apikey
- 💰 **Costo**: GRATIS (sin tarjeta de crédito)
- 📝 **Variable**: `GEMINI_API_KEY` y `GOOGLE_API_KEY` (mismo valor)

#### Groq Llama 3.1
- 🔗 **Obtener API Key**: https://console.groq.com/keys
- 💰 **Costo**: GRATIS (sin tarjeta de crédito)
- 📝 **Variable**: `GROQ_API_KEY`

#### OpenRouter
- 🔗 **Obtener API Key**: https://openrouter.ai/keys
- 💰 **Costo**: GRATIS (modelos gratuitos)
- 📝 **Variable**: `OPENROUTER_API_KEY`

---

### 7. 🔐 Thirdweb (Wallet Infrastructure)

**¿Para qué?** Embedded wallets y gasless transactions.

**Estado:** ⚠️ **REQUERIDO** - Para la funcionalidad de wallets

**Cómo obtenerlo:**

1. **Crear cuenta en Thirdweb:**
   - Ve a: https://thirdweb.com/
   - Haz clic en "Get Started" o "Sign Up"
   - Crea una cuenta

2. **Crear un proyecto:**
   - Ve a: https://thirdweb.com/dashboard
   - Haz clic en "Create Project"
   - Selecciona "Web3 App"

3. **Obtener Client ID:**
   - En tu proyecto, ve a "Settings" → "API Keys"
   - Copia tu **Client ID**
   - Para backend, también necesitarás el **Secret Key**

**Enlaces útiles:**
- 📚 [Thirdweb Docs](https://portal.thirdweb.com/)
- 🌐 [Thirdweb Dashboard](https://thirdweb.com/dashboard)
- 🔑 [Get API Keys](https://thirdweb.com/dashboard/settings/api-keys)

**Variables a configurar en `.env.local`:**
```bash
NEXT_PUBLIC_THIRDWEB_CLIENT_ID=tu_client_id_aqui
THIRDWEB_SECRET_KEY=tu_secret_key_aqui # Solo para backend
```

---

### 8. 🔌 WalletConnect (Wallet Connections)

**¿Para qué?** Permite conectar wallets como MetaMask, Trust Wallet, etc.

**Estado:** ⚠️ **REQUERIDO** - Para conexión de wallets

**Cómo obtenerlo:**

1. **Crear cuenta en WalletConnect:**
   - Ve a: https://cloud.walletconnect.com/
   - Haz clic en "Get Started" o "Sign Up"
   - Crea una cuenta

2. **Crear un proyecto:**
   - Haz clic en "Create New Project"
   - Ingresa el nombre de tu proyecto
   - Copia tu **Project ID**

**Enlaces útiles:**
- 📚 [WalletConnect Docs](https://docs.walletconnect.com/)
- 🌐 [WalletConnect Cloud](https://cloud.walletconnect.com/)
- 🔑 [Get Project ID](https://cloud.walletconnect.com/)

**Variables a configurar en `.env.local`:**
```bash
NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID=tu_project_id_aqui
```

---

### 9. 🗄️ Base de Datos (PostgreSQL)

**¿Para qué?** Almacena datos de usuarios, mercados, apuestas, etc.

**Estado:** ⚠️ **REQUERIDO** - Para el backend

**Opciones gratuitas:**

#### Opción 1: Supabase (Recomendado)
- 🔗 **Crear cuenta**: https://supabase.com/
- 💰 **Costo**: GRATIS (hasta 500MB)
- 📝 **Variable**: `DATABASE_URL=postgresql://...`

#### Opción 2: Railway
- 🔗 **Crear cuenta**: https://railway.app/
- 💰 **Costo**: GRATIS (con límites)
- 📝 **Variable**: `DATABASE_URL=postgresql://...`

#### Opción 3: Neon
- 🔗 **Crear cuenta**: https://neon.tech/
- 💰 **Costo**: GRATIS (hasta 0.5GB)
- 📝 **Variable**: `DATABASE_URL=postgresql://...`

**Enlaces útiles:**
- 📚 [Supabase Docs](https://supabase.com/docs)
- 📚 [Railway Docs](https://docs.railway.app/)
- 📚 [Neon Docs](https://neon.tech/docs)

---

### 10. 🌐 Backend URL (Hosting)

**¿Para qué?** URL pública del backend para que Chainlink Functions pueda llamarlo.

**Estado:** ⚠️ **REQUERIDO** - Para que Chainlink Functions funcione

**Opciones gratuitas:**

#### Opción 1: Railway (Recomendado)
- 🔗 **Crear cuenta**: https://railway.app/
- 💰 **Costo**: GRATIS (con límites)
- 📝 **Variable**: `BACKEND_URL=https://tu-proyecto.railway.app/api/oracle/resolve`

#### Opción 2: Render
- 🔗 **Crear cuenta**: https://render.com/
- 💰 **Costo**: GRATIS (con límites)
- 📝 **Variable**: `BACKEND_URL=https://tu-proyecto.onrender.com/api/oracle/resolve`

#### Opción 3: Fly.io
- 🔗 **Crear cuenta**: https://fly.io/
- 💰 **Costo**: GRATIS (con límites)
- 📝 **Variable**: `BACKEND_URL=https://tu-proyecto.fly.dev/api/oracle/resolve`

**Enlaces útiles:**
- 📚 [Railway Docs](https://docs.railway.app/)
- 📚 [Render Docs](https://render.com/docs)
- 📚 [Fly.io Docs](https://fly.io/docs/)

---

## 📋 Checklist de Configuración

### 🔴 Críticos (Sin estos no funciona)
- [ ] **Chainlink Functions** - Subscription creada y fundada
- [x] **LINK Tokens** - ✅ 50 LINK obtenidos del faucet
- [x] **tBNB Tokens** - ✅ 1,441 tBNB para gas fees
- [ ] **Thirdweb** - Client ID y Secret Key
- [ ] **WalletConnect** - Project ID
- [ ] **Base de Datos** - PostgreSQL (Supabase/Railway/Neon)
- [ ] **Backend URL** - Backend desplegado y accesible públicamente

### 🟡 Importantes (Mejoran funcionalidad)
- [x] **Chainlink CCIP** - ✅ Disponible en opBNB, LINK tokens obtenidos (50 LINK) - [Ver direcciones](https://docs.chain.link/ccip/directory/testnet/chain/binance-smart-chain-testnet-opbnb-1)
- [ ] **Pyth Network** - Para price feeds
- [ ] **Venus Protocol** - Para yield del Insurance Pool
- [ ] **PancakeSwap Router** - Para agregación de liquidez

### 🟢 Opcionales (Ya configurados)
- [x] **AI API Keys** - Google Gemini, Groq, OpenRouter (gratis)
- [x] **NodeReal API** - Para verificación de contratos

---

## 🚀 Orden Recomendado de Configuración

1. **Primero (Críticos):**
   - Base de Datos (Supabase)
   - Thirdweb (Client ID)
   - WalletConnect (Project ID)
   - Backend URL (Railway/Render)

2. **Segundo (Oracle):**
   - Chainlink Functions (Subscription)
   - Configurar backend para recibir llamadas de Chainlink

3. **Tercero (Mejoras):**
   - Pyth Network (si necesitas price feeds)
   - Venus Protocol (si quieres yield)
   - Chainlink CCIP (si quieres cross-chain)

---

## 📝 Archivo .env.local Completo

Una vez que tengas todos los servicios, tu `.env.local` debería verse así:

```bash
# ============================================
# CRÍTICOS
# ============================================
# Thirdweb
NEXT_PUBLIC_THIRDWEB_CLIENT_ID=tu_client_id
THIRDWEB_SECRET_KEY=tu_secret_key

# WalletConnect
NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID=tu_project_id

# Database
DATABASE_URL=postgresql://user:pass@host:5432/dbname

# Backend URL
BACKEND_URL=https://tu-backend.railway.app/api/oracle/resolve

# Chainlink Functions
CHAINLINK_FUNCTIONS_ROUTER=0x...
CHAINLINK_FUNCTIONS_SUBSCRIPTION_ID=123
CHAINLINK_FUNCTIONS_DON_ID=0x...
CHAINLINK_SIGNATURE_SECRET=tu_secret

# ============================================
# IMPORTANTES
# ============================================
# Chainlink CCIP
CHAINLINK_CCIP_ROUTER=0x...
LINK_TOKEN_ADDRESS=0x...

# Pyth Network
PYTH_ORACLE_ADDRESS=0x...
PYTH_PRICE_FEED_ID=0x...
PYTH_HERMES_URL=https://hermes.pyth.network

# Venus Protocol
VENUS_VTOKEN=0x...
VENUS_VUSDC_ADDRESS=0x...

# PancakeSwap
PANCAKE_ROUTER=0x...

# ============================================
# AI APIs (Ya configurados - GRATIS)
# ============================================
GEMINI_API_KEY=tu_gemini_key
GOOGLE_API_KEY=tu_gemini_key
GROQ_API_KEY=tu_groq_key
OPENROUTER_API_KEY=tu_openrouter_key

# ============================================
# YA CONFIGURADOS
# ============================================
NODEREAL_API_KEY=d1dcc57c6bb84932bec650264779eba5
USDC_ADDRESS=0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3
PRIVATE_KEY=tu_private_key
```

---

## 🆘 ¿Necesitas Ayuda?

Si tienes problemas configurando algún servicio:
1. Revisa la documentación oficial del servicio
2. Verifica que estés usando las direcciones correctas para opBNB testnet
3. Asegúrate de que tu backend esté desplegado y accesible públicamente
4. Verifica que las variables de entorno estén correctamente configuradas

---

**Última actualización:** Noviembre 2025

