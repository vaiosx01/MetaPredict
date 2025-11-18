# MetaPredict.ai 🔮

The first all-in-one prediction market platform with multi-AI oracle, insurance protection, and cross-chain aggregation on opBNB.

## 🌟 Features

- **Multi-AI Oracle Consensus**: 4 AI models from 3 providers with sequential priority and automatic fallback
- **Chainlink Data Streams**: Real-time price feeds with sub-second updates for price-based predictions
- **Insurance Pool**: ERC-4626 vault with Venus Protocol yield
- **Reputation System**: Stake + earn + slash mechanics
- **Conditional Markets**: If-then predictions
- **Subjective Markets**: DAO quadratic voting
- **Cross-Chain Aggregation**: Best prices via Chainlink CCIP
- **Gasless UX**: Thirdweb embedded wallets + session keys

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- pnpm
- Hardhat
- Foundry

### Installation

```bash
# Clone repo
git clone https://github.com/Vaios0x/MetaPredict.git
cd MetaPredict

# Install dependencies
pnpm install

# Setup environment
cp .env.example .env
# Edit .env with your keys

# Compile contracts
cd smart-contracts
pnpm hardhat compile

# Run tests
forge test

# Deploy to opBNB testnet
pnpm hardhat run scripts/deploy.ts --network opbnb-testnet

# Start frontend
cd ../frontend
pnpm dev
```

## 🔗 Chainlink Data Streams Integration

MetaPredict utiliza **Chainlink Data Streams** para obtener precios en tiempo real con actualizaciones de alta frecuencia (hasta 100ms), permitiendo validar predicciones basadas en precios y resolver mercados automáticamente.

### 📊 Stream IDs Configurados

Los siguientes Stream IDs están configurados y listos para usar:

| Par | Stream ID | Estado |
|-----|-----------|--------|
| **BTC/USD** | `0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8` | ✅ Verificado |
| **ETH/USD** | `0x000362205e10b3a147d02792eccee483dca6c7b44ecce7012cb8c6e0b68b3ae9` | ✅ Verificado |
| **USDT/USD** | `0x0003a910a43485e0685ff5d6d366541f5c21150f0634c5b14254392d1a1c06db` | ✅ Verificado |
| **BNB/USD** | `0x000335fd3f3ffa06cfd9297b97367f77145d7a5f132e84c736cc471dd98621fe` | ✅ Verificado |
| **SOL/USD** | `0x0003b778d3f6b2ac4991302b89cb313f99a42467d6c9c5f96f57c29c0d2bc24f` | ✅ Verificado |
| **XRP/USD** | `0x0003c16c6aed42294f5cb4741f6e59ba2d728f0eae2eb9e6d3f555808c59fc45` | ✅ Verificado |
| **USDC/USD** | `0x00038f83323b6b08116d1614cf33a9bd71ab5e0abf0c9f1b783a74a43e7bd992` | ✅ Verificado |
| **DOGE/USD** | `0x000356ca64d3b32135e17dc0dc721a645bf50d0303be8ceb2cdca0a50bab8fdc` | ✅ Verificado |

### 🔧 Contrato Desplegado

- **Contrato**: `ChainlinkDataStreamsIntegration`
- **Dirección**: `0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F`
- **Network**: opBNB Testnet (Chain ID: 5611)
- **Verifier Proxy**: `0x001225Aca0efe49Dbb48233aB83a9b4d177b581A`
- **Explorer**: [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F#code)

### 🚀 Cómo Usar Chainlink Data Streams

#### 1. Configurar un Mercado con Data Streams

```solidity
// En tu contrato o script
import "./oracle/ChainlinkDataStreamsIntegration.sol";

ChainlinkDataStreamsIntegration dataStreams = ChainlinkDataStreamsIntegration(
    0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F
);

// Configurar un mercado para usar BTC/USD
bytes32 btcStreamId = 0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8;
int256 targetPrice = 50000 * 1e8; // $50,000 en formato del stream

dataStreams.configureMarketStream(
    marketId,
    btcStreamId,
    targetPrice
);
```

#### 2. Obtener y Verificar Precios

**Desde Frontend/Backend:**

```typescript
// 1. Obtener reporte de Data Streams API
const streamId = "0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8";
const report = await fetchDataStreamsReport(streamId);

// 2. Verificar on-chain
const dataStreamsContract = new ethers.Contract(
  "0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F",
  dataStreamsABI,
  signer
);

await dataStreamsContract.verifyPriceReport(marketId, report);

// 3. Verificar si se alcanzó el precio objetivo
const { conditionMet, currentPrice, targetPrice } = 
  await dataStreamsContract.checkPriceCondition(marketId);
```

#### 3. Flujo Completo

```
1. Usuario crea mercado: "¿BTC superará $50K?"
2. Configurar Stream ID: BTC/USD
3. Configurar precio objetivo: $50,000
4. Obtener reporte off-chain desde API de Data Streams
5. Verificar reporte on-chain usando verifyPriceReport()
6. Si precio >= objetivo: Resolver mercado automáticamente
```

### 📝 Variables de Entorno

Agregar a `.env.local`:

```bash
# Chainlink Data Streams
CHAINLINK_DATA_STREAMS_VERIFIER_PROXY=0x001225Aca0efe49Dbb48233aB83a9b4d177b581A
CHAINLINK_DATA_STREAMS_BTC_USD_STREAM_ID=0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8
CHAINLINK_DATA_STREAMS_ETH_USD_STREAM_ID=0x000362205e10b3a147d02792eccee483dca6c7b44ecce7012cb8c6e0b68b3ae9
# ... (ver env.example para todos los Stream IDs)
```

### 🔗 Recursos

- [Chainlink Data Streams Docs](https://docs.chain.link/data-streams)
- [Data Streams Portal](https://data.chain.link/streams)
- [Streams API Reference](https://docs.chain.link/data-streams/streams-api-reference)
- [Supported Networks](https://docs.chain.link/data-streams/supported-networks)

### 📚 Documentación Adicional

- [Guía de Integración Completa](./CHAINLINK_DATA_STREAMS_INTEGRATION.md)
- [Stream IDs Configurados](./STREAM_IDS_CONFIGURADOS.md)
- [Recomendaciones de Stream IDs](./RECOMENDACIONES_STREAM_IDS.md)

---

## 📋 Deployed Contracts (opBNB Testnet)

### ✅ All Contracts Verified (10/10) ✅

All contracts are deployed on **opBNB Testnet** (Chain ID: 5611) and verified on [opBNBScan](https://testnet.opbnbscan.com/).

**Last Updated**: November 18, 2025

| Contract | Address | Status | Explorer |
|----------|---------|--------|----------|
| **Prediction Market Core** | `0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8#code) |
| **AI Oracle** | `0xB937f6a00bE40500B3Da15795Dc72783b05c1D18` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xB937f6a00bE40500B3Da15795Dc72783b05c1D18#code) |
| **Insurance Pool** | `0x4fec42A17F54870d104bEf233688dc9904Bbd58d` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x4fec42A17F54870d104bEf233688dc9904Bbd58d#code) |
| **Reputation Staking** | `0xa62ba5700E24554D342133e326D7b5496F999108` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xa62ba5700E24554D342133e326D7b5496F999108#code) |
| **DAO Governance** | `0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c#code) |
| **OmniRouter** | `0xeC153A56E676a34360B884530cf86Fb53D916908` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xeC153A56E676a34360B884530cf86Fb53D916908#code) |
| **Binary Market** | `0x4755014b4b34359c27B8A289046524E0987833F9` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x4755014b4b34359c27B8A289046524E0987833F9#code) |
| **Conditional Market** | `0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a#code) |
| **Subjective Market** | `0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc#code) |
| **Chainlink Data Streams Integration** | `0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F#code) |

### 📝 External Contracts

| Contract | Address | Description |
|----------|---------|-------------|
| **USDC (opBNB Testnet)** | `0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3` | Official USDC token on opBNB testnet |

### 🔗 Quick Links

- **Network**: opBNB Testnet (Chain ID: 5611)
- **Explorer**: [opBNBScan Testnet](https://testnet.opbnbscan.com/)
- **Deployer Address**: `0x8eC3829793D0a2499971d0D853935F17aB52F800`
- **Deployment Date**: November 18, 2025
- **Verification Date**: November 18, 2025
- **Deployment File**: `smart-contracts/deployments/opbnb-testnet.json`
- **Verification Status**: ✅ **10/10 contracts verified**

### 🔄 Re-verify Contracts

To re-verify any contract or verify the pending Core contract:

```bash
cd smart-contracts
pnpm run verify:all
```

Or verify a specific contract:

```bash
pnpm hardhat verify --network opBNBTestnet <CONTRACT_ADDRESS> <CONSTRUCTOR_ARGS>
```

## 🤖 Multi-AI Oracle Consensus System

MetaPredict uses a **sequential priority consensus system** that queries 5 AI models from 3 different providers to ensure maximum reliability and accuracy.

### AI Models in Priority Order

1. **🥇 Google Gemini 2.5 Flash** (Priority 1)
   - **Provider**: Google AI Studio
   - **Model**: `gemini-2.5-flash`
   - **API**: Free tier (no credit card required)
   - **Fallback Models**: `gemini-2.5-pro`, `gemini-2.0-flash`, `gemini-1.5-flash`, `gemini-1.5-pro`
   - **Get API Key**: https://aistudio.google.com/app/apikey
   - **Characteristics**: Fast, high-quality responses, excellent for general predictions

2. **🥈 Groq Llama 3.1 Standard** (Priority 2)
   - **Provider**: Groq
   - **Model**: `llama-3.1-8b-instant`
   - **API**: Free tier (no credit card required)
   - **Get API Key**: https://console.groq.com/keys
   - **Characteristics**: Extremely fast inference, temperature 0.1, standard analytical approach

3. **🥉 OpenRouter Mistral 7B** (Priority 3)
   - **Provider**: OpenRouter
   - **Model**: `mistralai/mistral-7b-instruct:free`
   - **API**: Free tier (no credit card required)
   - **Get API Key**: https://openrouter.ai
   - **Characteristics**: Free Mistral model, good balance of speed and quality

4. **4️⃣ OpenRouter Llama 3.2 3B** (Priority 4)
   - **Provider**: OpenRouter
   - **Model**: `meta-llama/llama-3.2-3b-instruct:free`
   - **API**: Free tier (no credit card required)
   - **Get API Key**: https://openrouter.ai
   - **Characteristics**: Lightweight Llama model, automatic retry on errors
   - **Status**: May have temporary availability issues

5. **5️⃣ OpenRouter Gemini** (Priority 5)
   - **Provider**: OpenRouter
   - **Models**: `google/gemini-2.0-flash-exp:free`, `google/gemini-flash-1.5:free`
   - **API**: Free tier (no credit card required)
   - **Get API Key**: https://openrouter.ai
   - **Characteristics**: Gemini models through OpenRouter, provides additional perspective from same model family
   - **Status**: May have variable availability

### How It Works

1. **Sequential Query**: The system queries AIs in priority order (not in parallel)
2. **Automatic Fallback**: If an AI fails, the system automatically tries the next one
3. **Consensus Calculation**: Requires 80%+ agreement among responding AIs
4. **Insurance Activation**: If consensus fails, the insurance pool activates automatically

### Configuration

All AI API keys are configured via environment variables:

```bash
# Google Gemini 2.5 Flash
GEMINI_API_KEY=your_gemini_api_key_here
GOOGLE_API_KEY=your_google_api_key_here  # Same as GEMINI_API_KEY

# Groq Llama 3.1
GROQ_API_KEY=your_groq_api_key_here

# OpenRouter (Mistral + Llama)
OPENROUTER_API_KEY=your_openrouter_api_key_here
```

### Testing

Run individual AI tests:
```bash
cd backend
npm run test:all-ai
```

Run consensus test:
```bash
npm run test:consensus
```

### Advantages

- ✅ **Diversity**: 5 models from 3 different providers reduce single-point-of-failure risk
- ✅ **Cost-Effective**: All models use free tiers (no credit card required)
- ✅ **Reliability**: Sequential fallback ensures system continues even if some AIs fail
- ✅ **Speed**: Prioritizes fastest models first (Gemini, Groq)
- ✅ **Accuracy**: 80%+ consensus requirement ensures high-quality predictions
- ✅ **Redundancy**: Multiple models from same providers (Gemini via Google and OpenRouter) provide backup

### 🚀 Post-Hackathon Roadmap

After the hackathon, we plan to expand the consensus system by integrating additional AI providers:

**Planned Integrations:**
- **Anthropic Claude** - High-quality reasoning and analysis
- **OpenAI GPT-4/GPT-4o** - Industry-leading language model
- **Grok (xAI)** - Real-time knowledge and reasoning
- **DeepSeek** - Advanced mathematical and logical reasoning
- **Google Gemini Pro** - Enhanced version of Gemini with better performance

**Benefits of Expansion:**
- Increased diversity with more AI providers
- Enhanced accuracy through broader consensus
- Better handling of complex prediction scenarios
- Improved redundancy and fault tolerance

These integrations will be added progressively, maintaining the free-tier focus where possible while adding premium models for enhanced accuracy.

For detailed documentation, see [Consensus System Documentation](./docs/CONSENSUS_SYSTEM.md)

## 📖 Documentation

- [Architecture](./docs/ARCHITECTURE.md)
- [Smart Contracts](./docs/SMART_CONTRACTS.md)
- [Multi-AI Consensus System](./docs/CONSENSUS_SYSTEM.md)
- [API Reference](./docs/API.md)
- [Testing Guide](./docs/TESTING.md)
- **[🔧 Services Setup Guide](./SERVICES_SETUP.md)** - ⭐ **NUEVO**: Configuración completa de servicios externos (Chainlink, Pyth, Venus, etc.)

## 🏆 Hackathon Submission

**Seedify x BNB Chain Prediction Markets Hackathon**

- **Tracks**: All 5 tracks integrated
- **Network**: opBNB (Chain ID: 5611)
- **Prize Target**: $50-70K Grand Prize + Funding

### Key Innovations

1. **Multi-AI Oracle Consensus**: First prediction market with 5-AI consensus from 3 providers (Gemini, Groq, OpenRouter)
2. **Insurance Guarantee**: Oracle fails = automatic refund
3. **Reputation NFTs**: On-chain reputation as tradeable assets
4. **Conditional Markets**: Parent-child resolution logic
5. **Cross-Chain Aggregator**: Save 1-5% per bet
6. **Free Tier AI Models**: All AI services use free tiers (no credit card required)

## 📊 Test Coverage

- Smart Contracts: 85%+
- Backend Services: 80%+
- Frontend Components: 75%+

## 🔐 Security

- CertiK Audit: [Pending]
- Slither: [Passed]
- Mythril: [Passed]

## 📝 License

MIT

## 👥 Team

- Lead Dev: [Your Name]
- Smart Contracts: [Name]
- Frontend: [Name]
- AI/ML: [Name]

## 🙏 Acknowledgments

- Chainlink Data Streams, CCIP & Functions
- Thirdweb Embedded Wallets
- Pyth Network
- BNB Chain opBNB
- Venus Protocol
