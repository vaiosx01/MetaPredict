# 🔮 META PREDICT.AI - PROMPT COMPLETO CYBERPUNK WEB3 🔮

## ⚡ VISIÓN NEON: EL ORÁCULO DEL FUTURO ⚡

**MetaPredict.ai** es la primera plataforma de mercados de predicción descentralizada que fusiona **5 inteligencias artificiales** en un consenso cuántico, protegida por un **pool de seguros on-chain** y conectada a través de múltiples blockchains mediante **agregación cross-chain**. Construida sobre **opBNB** para transacciones ultrarrápidas y costos de gas casi nulos.

---

## 🌐 ARQUITECTURA NEURAL: STACK TECNOLÓGICO 🌐

### **Smart Contracts (Capa de Consenso)**
- **Solidity 0.8.24** - Código inmutable en la blockchain
- **Hardhat + Foundry** - Framework de desarrollo y testing
- **Chainlink Functions** - Ejecución de oráculos descentralizados
- **Chainlink CCIP** - Puente cross-chain para agregación de liquidez
- **OpenZeppelin** - Contratos base auditados y seguros
- **ERC-4626** - Estándar para el pool de seguros (InsurancePool)

### **Backend (Cerebro Neural)**
- **Node.js + TypeScript** - Runtime y tipado estático
- **Express** - API REST de alta performance
- **Prisma + PostgreSQL** - Base de datos relacional optimizada
- **Winston** - Sistema de logging avanzado
- **5 LLMs Integrados**:
  - OpenAI GPT-4
  - Anthropic Claude
  - Google Gemini 2.5 Flash (con fallback a 2.5-pro, 2.0-flash, 1.5-flash, 1.5-pro)
  - Together AI (Llama)
  - Hugging Face (Mistral)

### **Frontend (Interfaz Holográfica)**
- **Next.js 15** - Framework React con App Router
- **TypeScript** - Tipado estático completo
- **Tailwind CSS** - Estilos utilitarios con tema dark cyberpunk
- **Framer Motion** - Animaciones fluidas y transiciones neurales
- **Thirdweb SDK v5** - Wallets embebidos y UX sin gas
- **Wagmi + Viem** - Integración con Ethereum/opBNB
- **PWA** - Progressive Web App con service workers
- **React Query** - Gestión de estado y caché de datos

---

## 🧠 MÓDULOS PRINCIPALES: LOS 5 TRACKS INTEGRADOS 🧠

### **1. TRUTHCHAIN - Oracle Multi-AI (Track 1)**
El primer oráculo de predicción que consulta **5 modelos de IA** simultáneamente para alcanzar consenso:

**Funcionalidad:**
- Consulta paralela a 5 LLMs (GPT-4, Claude, Gemini, Llama, Mistral)
- **Consenso del 80%+** = Resolución automática
- **60-80% acuerdo** = Flag para revisión humana
- **<60% acuerdo** = Activación automática del seguro (100% refund)
- Integración con **Pyth Network** para validación de precios
- Resolución en **<1 hora** en opBNB

**Contratos:**
- `AIOracle.sol` - Contrato principal del oráculo
- `TruthChain.sol` - Lógica de consenso multi-LLM
- `InsurancePool.sol` - Pool de seguros ERC-4626

**Flujo:**
```
Usuario → Crear Mercado → Chainlink Functions → Backend API
→ 5 LLMs Paralelos → Consenso → Resolución On-Chain
→ Si falla → Insurance Pool → Refund Automático
```

### **2. HONESTBET DAO - Sistema de Reputación (Track 2)**
Sistema de reputación cross-protocol con staking, slashing y NFTs de reputación:

**Funcionalidad:**
- **Staking de USDC** para unirse al DAO
- **Reputación on-chain** como NFT tradeable
- **Slashing dinámico** basado en:
  - Tamaño del mercado
  - Confianza del usuario
  - Historial de precisión
- **Portabilidad cross-chain** vía Chainlink CCIP
- **Tiers de reputación**: Novice → Expert → Oracle → Legend

**Contratos:**
- `ReputationDAO.sol` - Gobernanza del DAO
- `ReputationStaking.sol` - Staking y slashing

**Fórmula de Slashing:**
```
Slash = Base Stake × (Market Size / $1M) × (1 - Reputation%) × Confidence%
```

### **3. ZEROPAY MARKETS - UX Sin Gas (Track 3)**
Experiencia de usuario completamente sin gas usando wallets embebidos:

**Funcionalidad:**
- **Thirdweb Embedded Wallets** - Login con email/social
- **Session Keys** - Transacciones sin firma repetida
- **Biconomy Paymaster** - Gasless transactions
- **Meta-transactions** - Usuario no paga gas
- **PWA Offline** - Funciona sin conexión

**Stack:**
- Thirdweb SDK v5
- Wagmi hooks personalizados
- Service Workers para offline

### **4. CONDITIONALDAO - Mercados Condicionales (Track 4)**
Mercados con lógica IF-THEN y resolución subjetiva por DAO:

**Tipos de Mercados:**

**A. Binary Markets:**
- Predicciones simples YES/NO
- Ejemplo: "¿Bitcoin alcanzará $100K para fin de año?"

**B. Conditional Markets:**
- Dependen de un mercado padre
- Ejemplo: "SI Bitcoin llega a $100K, ENTONCES ¿Ethereum alcanzará $5K?"

**C. Subjective Markets:**
- Resueltos por votación DAO cuadrática
- Ejemplo: "¿Fue Oppenheimer mejor que Barbie?"
- Votación con peso: `Influencia = sqrt(stake)`

**Contratos:**
- `BinaryMarket.sol` - Mercados binarios
- `ConditionalMarket.sol` - Mercados condicionales
- `SubjectiveMarket.sol` - Mercados subjetivos

### **5. OMNIMARKET - Agregador Cross-Chain (Track 5)**
Agregador de liquidez que compara precios en múltiples chains:

**Funcionalidad:**
- **Query multi-chain** - Consulta precios en múltiples plataformas
- **Mejor ejecución** - Automáticamente elige el mejor precio
- **Ahorro 1-5%** por apuesta
- **Chainlink CCIP** - Puente seguro cross-chain
- **Portfolio tracking** - Vista unificada de posiciones

**Contratos:**
- `OmniRouter.sol` - Router de agregación

---

## 🎨 DISEÑO CYBERPUNK: ESTÉTICA VISUAL 🎨

### **Paleta de Colores:**
- **Fondo**: Negro profundo (#000000) con gradientes púrpura/rosa
- **Acentos**: Púrpura neón (#8B5CF6), Rosa eléctrico (#EC4899), Cyan brillante (#06B6D4)
- **Texto**: Blanco (#FFFFFF) con variaciones grises para jerarquía
- **Efectos**: Glassmorphism, gradientes animados, partículas neurales

### **Componentes Visuales:**
- **NeuralBackground** - Red de partículas conectadas (canvas animado)
- **AnimatedGradient** - Gradientes que fluyen dinámicamente
- **GlassCard** - Tarjetas con efecto vidrio esmerilado
- **GlassmorphicCard** - Variante con blur y transparencia

### **Animaciones:**
- Transiciones suaves con Framer Motion
- Efectos hover con escalado y brillo
- Partículas que se conectan dinámicamente
- Gradientes que pulsan y respiran

---

## 🔐 SEGURIDAD: FORTALEZA INQUEBRANTABLE 🔐

### **Smart Contracts:**
- **ReentrancyGuard** - Protección contra ataques de reentrada
- **Pausable** - Circuit breakers para emergencias
- **Access Control** - Roles y permisos granulares
- **Rate Limiting** - Protección contra spam y Sybil
- **Auditoría CertiK** - Pendiente antes de mainnet

### **Backend:**
- **Input Validation** - Schemas Zod para validación
- **Rate Limiting** - Protección contra DDoS
- **JWT Authentication** - Tokens seguros
- **CORS** - Configuración restrictiva
- **Winston Logging** - Auditoría completa

### **Frontend:**
- **XSS Protection** - Sanitización de inputs
- **CSRF Tokens** - Protección cross-site
- **Secure Headers** - Configuración Next.js
- **PWA Security** - Service workers seguros

---

## 📊 MÉTRICAS Y PERFORMANCE 📊

### **Test Coverage:**
- Smart Contracts: **85%+**
- Backend Services: **80%+**
- Frontend Components: **75%+**

### **Performance:**
- **Resolución de mercados**: <1 hora
- **Gas por transacción**: <$0.001 en opBNB
- **TPS**: 4000+ en opBNB L2
- **Tiempo de carga**: <2s (PWA optimizado)

### **Escalabilidad:**
- **opBNB L2** - 4000 TPS
- **Gasless Transactions** - Biconomy Paymaster
- **Cross-Chain** - Chainlink CCIP
- **Database Indexing** - Prisma optimizations

---

## 🚀 DEPLOYMENT: RUTA AL MAINNET 🚀

### **Redes Soportadas:**
- **opBNB Testnet** (Chain ID: 5611) - Desarrollo y testing
- **opBNB Mainnet** (Chain ID: 204) - Producción

### **Servicios Externos:**
- **Vercel** - Frontend hosting
- **PostgreSQL** - Base de datos (Supabase/Railway)
- **IPFS** - Almacenamiento de metadata
- **Chainlink** - Functions, Automation, CCIP
- **Pyth Network** - Price feeds
- **Thirdweb** - Wallet infrastructure

### **Variables de Entorno:**
```
# Blockchain
OPBNB_RPC_URL=
PRIVATE_KEY=
CHAINLINK_FUNCTIONS_SUBSCRIPTION_ID=
CHAINLINK_DON_ID=

# AI APIs
OPENAI_API_KEY=
ANTHROPIC_API_KEY=
GOOGLE_API_KEY=
TOGETHER_API_KEY=
HUGGINGFACE_API_KEY=

# Thirdweb
THIRDWEB_CLIENT_ID=
THIRDWEB_SECRET_KEY=

# Database
DATABASE_URL=

# IPFS
IPFS_GATEWAY_URL=
```

---

## 🎯 CASOS DE USO: EL FUTURO DE LAS PREDICCIONES 🎯

### **1. Predicciones DeFi:**
- "¿Ethereum alcanzará $5K antes de Q2 2025?"
- "¿El total value locked (TVL) superará $200B este año?"

### **2. Eventos del Mundo Real:**
- "¿Habrá nieve en NYC en Navidad 2025?"
- "¿SpaceX lanzará Starship en Q1 2025?"

### **3. Predicciones Políticas:**
- "¿Trump ganará las elecciones 2024?"
- "¿Se aprobará la regulación de crypto en EU?"

### **4. Predicciones Tecnológicas:**
- "¿GPT-5 será lanzado antes de junio 2025?"
- "¿2025 será el año de los agentes de IA?"

### **5. Predicciones Subjetivas:**
- "¿Fue Oppenheimer mejor que Barbie?"
- "¿Es GPT-5 una mejora significativa sobre GPT-4?"

---

## 💎 TOKENOMICS: ECONOMÍA DEL ECOSISTEMA 💎

### **Fees:**
- **Trading Fee**: 0.5% (50 basis points)
- **Insurance Premium**: 0.1% (10 basis points)
- **Total Fee**: 0.6% por transacción

### **Insurance Pool:**
- **Fuentes de Fondos**:
  - 0.1% de cada apuesta
  - Yield farming en Venus Protocol (5-8% APY)
  - Depositos directos de usuarios

### **Reputation System:**
- **Staking Mínimo**: $100 USDC
- **Slashing**: Dinámico basado en performance
- **Rewards**: Por participación y precisión

---

## 🔮 ROADMAP: VIAJE AL FUTURO 🔮

### **Fase 1: MVP (Completado)**
- ✅ Smart contracts básicos
- ✅ Oracle multi-AI
- ✅ Frontend con diseño cyberpunk
- ✅ Integración Thirdweb

### **Fase 2: Testnet (En Progreso)**
- 🔄 Deploy en opBNB testnet
- 🔄 Testing exhaustivo
- 🔄 Auditoría de seguridad
- 🔄 Optimización de gas

### **Fase 3: Mainnet (Q1 2025)**
- ⏳ Deploy en opBNB mainnet
- ⏳ Marketing y community building
- ⏳ Integración con más chains
- ⏳ Mobile app (React Native)

### **Fase 4: Expansión (Q2-Q3 2025)**
- ⏳ Integración con más oráculos
- ⏳ Mercados de derivados
- ⏳ Token nativo $PREDICT
- ⏳ DAO governance completo

---

## 🏆 HACKATHON: SEEDIFY x BNB CHAIN 🏆

**MetaPredict.ai** fue desarrollado para el **Seedify x BNB Chain Prediction Markets Hackathon**:

- **Tracks Integrados**: Los 5 tracks completos
- **Network**: opBNB (Chain ID: 5611)
- **Prize Target**: $50-70K Grand Prize + Funding
- **Innovaciones Clave**:
  1. Primer mercado de predicción con consenso 5-LLM
  2. Garantía de seguro contra fallos del oráculo
  3. NFTs de reputación como activos tradeables
  4. Mercados condicionales con lógica IF-THEN
  5. Agregador cross-chain que ahorra 1-5% por apuesta

---

## 🎨 PROMPT DE DISEÑO: ESTÉTICA CYBERPUNK 🎨

**Descripción Visual:**
"Una interfaz web3 futurista con estética cyberpunk. Fondo negro profundo con redes neuronales animadas que se conectan dinámicamente. Tarjetas glassmorphic con bordes neón púrpura y rosa. Gradientes que fluyen como energía eléctrica. Tipografía moderna con efectos de glow. Partículas que se mueven como datos en una red neural. Efectos de hover que hacen brillar los elementos. Diseño dark mode con acentos neón vibrantes. Sensación de estar dentro de una matriz digital donde las predicciones se materializan como datos cuánticos."

**Elementos Clave:**
- **Neon Glow**: Todos los elementos importantes tienen un brillo neón
- **Glassmorphism**: Transparencias y blur effects
- **Neural Networks**: Partículas conectadas que representan el consenso AI
- **Gradients Animados**: Colores que fluyen y pulsan
- **Dark Theme**: Fondo negro con contraste alto
- **Futuristic Typography**: Fuentes modernas con efectos de texto
- **Smooth Animations**: Transiciones fluidas y naturales

---

## 📝 NOTAS FINALES 📝

**MetaPredict.ai** representa la evolución de los mercados de predicción, combinando:
- **Inteligencia Artificial** de vanguardia (5 LLMs)
- **Blockchain** descentralizada (opBNB)
- **Seguros On-Chain** (ERC-4626)
- **UX Sin Fricción** (Gasless)
- **Agregación Cross-Chain** (Chainlink CCIP)

Es más que una plataforma: es un **oráculo del futuro** donde las predicciones se resuelven mediante consenso cuántico de inteligencias artificiales, protegidas por seguros descentralizados y ejecutadas en múltiples blockchains simultáneamente.

**El futuro de las predicciones está aquí. Bienvenido a MetaPredict.ai.** 🔮✨

---

*Desarrollado con ❤️ para el ecosistema Web3. Built on opBNB. Powered by AI.*

