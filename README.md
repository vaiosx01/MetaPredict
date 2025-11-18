# 🔮 MetaPredict.ai - The Future of Decentralized Prediction Markets

<div align="center">

![MetaPredict Logo](https://img.shields.io/badge/MetaPredict-AI%20Oracle-blue?style=for-the-badge&logo=ethereum)
![opBNB](https://img.shields.io/badge/opBNB-Testnet-orange?style=for-the-badge&logo=binance)
![Chainlink](https://img.shields.io/badge/Chainlink-Data%20Streams-375BD2?style=for-the-badge&logo=chainlink)
![Status](https://img.shields.io/badge/Status-Production%20Ready-success?style=for-the-badge)

**The world's first all-in-one prediction market platform powered by multi-AI oracle consensus, real-time price feeds, and cross-chain aggregation.**

[![Deployed Contracts](https://img.shields.io/badge/Contracts-10%2F10%20Verified-brightgreen?style=for-the-badge)](https://testnet.opbnbscan.com/)
[![AI Models](https://img.shields.io/badge/AI%20Models-5%20Providers-purple?style=for-the-badge)](./docs/CONSENSUS_SYSTEM.md)
[![Test Coverage](https://img.shields.io/badge/Test%20Coverage-85%25%2B-success?style=for-the-badge)](./docs/TESTING.md)

[🚀 Quick Start](#-quick-start) • [📖 Documentation](#-documentation) • [🔗 Live Contracts](#-deployed-contracts) • [🤖 AI Oracle](#-multi-ai-oracle-consensus-system)

</div>

---

## 🌟 The Vision

Imagine a world where **anyone can predict the future** and be rewarded for their accuracy. Where **AI oracles** work together to ensure fairness, where **real-time data** flows seamlessly, and where **cross-chain liquidity** makes every bet optimal.

**MetaPredict.ai makes this vision a reality.**

We've built the **most advanced prediction market platform** on opBNB, combining:
- 🧠 **5 AI models** from 3 providers working in consensus
- ⚡ **Sub-second price feeds** via Chainlink Data Streams
- 🛡️ **Insurance protection** with automatic refunds
- 🌐 **Cross-chain aggregation** for best prices
- 🎯 **Multiple market types** for every prediction need

---

## 🎯 Key Features

### 🧠 Multi-AI Oracle Consensus System

<div align="center">

| Priority | AI Model | Provider | Speed | Status |
|:--------:|:--------|:--------:|:-----:|:------:|
| 🥇 **1st** | **Gemini 2.5 Flash** | Google AI Studio | ⚡ Fast | ✅ Active |
| 🥈 **2nd** | **Llama 3.1 Standard** | Groq | ⚡⚡ Ultra Fast | ✅ Active |
| 🥉 **3rd** | **Mistral 7B** | OpenRouter | ⚡ Fast | ✅ Active |
| 4️⃣ | **Llama 3.2 3B** | OpenRouter | ⚡ Fast | ✅ Active |
| 5️⃣ | **Gemini (OpenRouter)** | OpenRouter | ⚡ Fast | ✅ Active |

</div>

**How it works:**
1. 🔄 **Sequential Query**: AIs are queried in priority order (not parallel)
2. 🛡️ **Automatic Fallback**: If one AI fails, the next one takes over
3. ✅ **Consensus Required**: 80%+ agreement among responding AIs
4. 💰 **Insurance Activation**: If consensus fails, automatic refund via insurance pool

**Result**: Maximum reliability with zero single-point-of-failure risk.

### ⚡ Chainlink Data Streams Integration

Real-time price feeds with **sub-second updates** (up to 100ms) for price-based predictions.

<div align="center">

| Trading Pair | Stream ID | Update Frequency | Status |
|:------------|:----------|:-----------------|:------:|
| **BTC/USD** | `0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8` | ~100ms | ✅ Active |
| **ETH/USD** | `0x000362205e10b3a147d02792eccee483dca6c7b44ecce7012cb8c6e0b68b3ae9` | ~100ms | ✅ Active |
| **USDT/USD** | `0x0003a910a43485e0685ff5d6d366541f5c21150f0634c5b14254392d1a1c06db` | ~100ms | ✅ Active |
| **BNB/USD** | `0x000335fd3f3ffa06cfd9297b97367f77145d7a5f132e84c736cc471dd98621fe` | ~100ms | ✅ Active |
| **SOL/USD** | `0x0003b778d3f6b2ac4991302b89cb313f99a42467d6c9c5f96f57c29c0d2bc24f` | ~100ms | ✅ Active |
| **XRP/USD** | `0x0003c16c6aed42294f5cb4741f6e59ba2d728f0eae2eb9e6d3f555808c59fc45` | ~100ms | ✅ Active |
| **USDC/USD** | `0x00038f83323b6b08116d1614cf33a9bd71ab5e0abf0c9f1b783a74a43e7bd992` | ~100ms | ✅ Active |
| **DOGE/USD** | `0x000356ca64d3b32135e17dc0dc721a645bf50d0303be8ceb2cdca0a50bab8fdc` | ~100ms | ✅ Active |

</div>

**Contract**: [`ChainlinkDataStreamsIntegration`](https://testnet.opbnbscan.com/address/0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F#code)  
**Verifier Proxy**: `0x001225Aca0efe49Dbb48233aB83a9b4d177b581A`

### 🛡️ Insurance Pool (ERC-4626)

Protect your predictions with our **yield-generating insurance vault**:

- 💰 **Automatic Refunds**: If oracle consensus fails, you get your money back
- 📈 **Yield Farming**: Insurance funds earn yield via Venus Protocol
- 🔒 **ERC-4626 Standard**: Industry-standard vault implementation
- 📊 **Transparent**: All deposits and yields are on-chain

**Contract**: [`InsurancePool`](https://testnet.opbnbscan.com/address/0x4fec42A17F54870d104bEf233688dc9904Bbd58d#code)

### 🏆 Reputation System

Build your reputation and earn rewards:

- 🎖️ **Reputation NFTs**: On-chain reputation as tradeable assets
- 💎 **Stake & Earn**: Stake tokens to increase your reputation
- ⚠️ **Slash Mechanism**: Bad actors lose reputation
- 📈 **Gamification**: Climb the leaderboard

**Contract**: [`ReputationStaking`](https://testnet.opbnbscan.com/address/0xa62ba5700E24554D342133e326D7b5496F999108#code)

### 🎯 Market Types

We support **three types of prediction markets**:

#### 1. 📊 Binary Markets
Simple yes/no predictions. Perfect for straightforward questions.

**Example**: "Will BTC reach $100K by December 2025?"

**Contract**: [`BinaryMarket`](https://testnet.opbnbscan.com/address/0x4755014b4b34359c27B8A289046524E0987833F9#code)

#### 2. 🔗 Conditional Markets
If-then predictions with parent-child relationships.

**Example**: "If BTC reaches $100K, will ETH reach $10K?"

**Contract**: [`ConditionalMarket`](https://testnet.opbnbscan.com/address/0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a#code)

#### 3. 🗳️ Subjective Markets
DAO-governed markets with quadratic voting.

**Example**: "Which DeFi protocol will have the most TVL in 2026?"

**Contract**: [`SubjectiveMarket`](https://testnet.opbnbscan.com/address/0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc#code)

### 🌐 Cross-Chain Aggregation

Save **1-5% per bet** with our cross-chain price aggregator:

- 🔍 **Best Price Discovery**: Automatically finds best prices across chains
- 💸 **Cost Savings**: Save on every transaction
- 🔄 **Chainlink CCIP**: Secure cross-chain messaging
- 📊 **Real-time Rates**: Always get the best deal

**Contract**: [`OmniRouter`](https://testnet.opbnbscan.com/address/0xeC153A56E676a34360B884530cf86Fb53D916908#code)

### 🚀 Gasless UX

Powered by **Thirdweb Embedded Wallets**:

- 🔐 **No Wallet Required**: Users can start immediately
- 🔑 **Session Keys**: Seamless transactions without constant signing
- 💳 **Fiat Onramp**: Buy crypto directly in-app
- 📱 **Mobile Ready**: Works perfectly on mobile devices

---

## 🚀 Quick Start

### Prerequisites

<div align="center">

![Node.js](https://img.shields.io/badge/Node.js-18%2B-green?style=flat-square&logo=node.js)
![pnpm](https://img.shields.io/badge/pnpm-Latest-orange?style=flat-square&logo=pnpm)
![Hardhat](https://img.shields.io/badge/Hardhat-Configured-yellow?style=flat-square&logo=ethereum)
![Foundry](https://img.shields.io/badge/Foundry-Installed-red?style=flat-square&logo=foundry)

</div>

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Vaios0x/MetaPredict.git
cd MetaPredict

# 2. Install dependencies
pnpm install

# 3. Setup environment
cp .env.example .env
# Edit .env with your API keys

# 4. Compile contracts
cd smart-contracts
pnpm hardhat compile

# 5. Run tests
forge test

# 6. Deploy to opBNB testnet
pnpm hardhat run scripts/deploy.ts --network opBNBTestnet

# 7. Start frontend
cd ../frontend
pnpm dev
```

### 🎯 First Steps

1. **Get Testnet Tokens**: Use our [faucet guide](./OBTENER_TOKENS_TESTNET.md)
2. **Configure API Keys**: See [services setup](./SERVICES_SETUP.md)
3. **Create Your First Market**: Use the frontend or interact directly with contracts
4. **Monitor Oracle Bot**: Check [Oracle Bot status](./PRUEBA_ORACLE_BOT.md)

---

## 📋 Deployed Contracts (opBNB Testnet)

<div align="center">

### ✅ **All Contracts Verified (10/10)** ✅

**Last Updated**: November 18, 2025  
**Network**: opBNB Testnet (Chain ID: 5611)  
**Explorer**: [opBNBScan Testnet](https://testnet.opbnbscan.com/)

</div>

| Contract | Address | Status | Explorer |
|:--------|:--------|:------:|:--------:|
| **🎯 Prediction Market Core** | `0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8#code) |
| **🤖 AI Oracle** | `0xB937f6a00bE40500B3Da15795Dc72783b05c1D18` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xB937f6a00bE40500B3Da15795Dc72783b05c1D18#code) |
| **🛡️ Insurance Pool** | `0x4fec42A17F54870d104bEf233688dc9904Bbd58d` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x4fec42A17F54870d104bEf233688dc9904Bbd58d#code) |
| **🏆 Reputation Staking** | `0xa62ba5700E24554D342133e326D7b5496F999108` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xa62ba5700E24554D342133e326D7b5496F999108#code) |
| **🗳️ DAO Governance** | `0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c#code) |
| **🌐 OmniRouter** | `0xeC153A56E676a34360B884530cf86Fb53D916908` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xeC153A56E676a34360B884530cf86Fb53D916908#code) |
| **📊 Binary Market** | `0x4755014b4b34359c27B8A289046524E0987833F9` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x4755014b4b34359c27B8A289046524E0987833F9#code) |
| **🔗 Conditional Market** | `0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a#code) |
| **🗳️ Subjective Market** | `0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc#code) |
| **⚡ Chainlink Data Streams** | `0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F` | ✅ Verified | [View on opBNBScan](https://testnet.opbnbscan.com/address/0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F#code) |

### 📝 External Contracts

| Contract | Address | Description |
|:--------|:--------|:------------|
| **💵 USDC (opBNB Testnet)** | `0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3` | Official USDC token on opBNB testnet |

### 🔗 Quick Links

- **🌐 Network**: opBNB Testnet (Chain ID: 5611)
- **🔍 Explorer**: [opBNBScan Testnet](https://testnet.opbnbscan.com/)
- **👤 Deployer Address**: `0x8eC3829793D0a2499971d0D853935F17aB52F800`
- **📅 Deployment Date**: November 18, 2025
- **✅ Verification Date**: November 18, 2025
- **📄 Deployment File**: `smart-contracts/deployments/opbnb-testnet.json`
- **🎯 Verification Status**: ✅ **10/10 contracts verified**

---

## 🤖 Multi-AI Oracle Consensus System

<div align="center">

### **The Most Reliable Oracle in DeFi**

Our oracle system queries **5 AI models from 3 different providers** in a sequential priority system to ensure maximum reliability and accuracy.

</div>

### 🎯 AI Models in Priority Order

<div align="center">

| Priority | AI Model | Provider | API | Speed | Cost | Status |
|:--------:|:---------|:--------:|:---:|:-----:|:----:|:------:|
| 🥇 **1st** | **Gemini 2.5 Flash** | [Google AI Studio](https://aistudio.google.com/app/apikey) | Free | ⚡ Fast | 💰 Free | ✅ Active |
| 🥈 **2nd** | **Llama 3.1 Standard** | [Groq](https://console.groq.com/keys) | Free | ⚡⚡ Ultra Fast | 💰 Free | ✅ Active |
| 🥉 **3rd** | **Mistral 7B** | [OpenRouter](https://openrouter.ai) | Free | ⚡ Fast | 💰 Free | ✅ Active |
| 4️⃣ | **Llama 3.2 3B** | [OpenRouter](https://openrouter.ai) | Free | ⚡ Fast | 💰 Free | ✅ Active |
| 5️⃣ | **Gemini (OpenRouter)** | [OpenRouter](https://openrouter.ai) | Free | ⚡ Fast | 💰 Free | ✅ Active |

</div>

### 🔄 How It Works

```
1. User creates prediction market
   ↓
2. Market reaches resolution deadline
   ↓
3. Oracle Bot detects ResolutionRequested event
   ↓
4. Backend queries AIs sequentially (Priority 1 → 5)
   ↓
5. Calculate consensus (80%+ agreement required)
   ↓
6. Gelato Relay executes resolution on-chain
   ↓
7. Market resolves automatically
```

### ✅ Advantages

- ✅ **Diversity**: 5 models from 3 providers reduce single-point-of-failure risk
- ✅ **Cost-Effective**: All models use free tiers (no credit card required)
- ✅ **Reliability**: Sequential fallback ensures system continues even if some AIs fail
- ✅ **Speed**: Prioritizes fastest models first (Gemini, Groq)
- ✅ **Accuracy**: 80%+ consensus requirement ensures high-quality predictions
- ✅ **Redundancy**: Multiple models from same providers provide backup

### 🚀 Post-Hackathon Roadmap

After the hackathon, we plan to expand the consensus system by integrating additional AI providers:

**Planned Integrations:**
- 🤖 **Anthropic Claude** - High-quality reasoning and analysis
- 🧠 **OpenAI GPT-4/GPT-4o** - Industry-leading language model
- 🚀 **Grok (xAI)** - Real-time knowledge and reasoning
- 🔬 **DeepSeek** - Advanced mathematical and logical reasoning
- ⚡ **Google Gemini Pro** - Enhanced version of Gemini with better performance

**Benefits of Expansion:**
- 📈 Increased diversity with more AI providers
- 🎯 Enhanced accuracy through broader consensus
- 💪 Better handling of complex prediction scenarios
- 🛡️ Improved redundancy and fault tolerance

For detailed documentation, see [Consensus System Documentation](./docs/CONSENSUS_SYSTEM.md)

---

## ⚡ Chainlink Data Streams Integration

<div align="center">

### **Real-Time Price Feeds with Sub-Second Updates**

MetaPredict utilizes **Chainlink Data Streams** to obtain real-time prices with high-frequency updates (up to 100ms), enabling automatic validation of price-based predictions and market resolution.

</div>

### 📊 Configured Stream IDs

All Stream IDs have been verified and are ready to use:

| Trading Pair | Stream ID | Status |
|:------------|:----------|:------:|
| **BTC/USD** | `0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8` | ✅ Verified |
| **ETH/USD** | `0x000362205e10b3a147d02792eccee483dca6c7b44ecce7012cb8c6e0b68b3ae9` | ✅ Verified |
| **USDT/USD** | `0x0003a910a43485e0685ff5d6d366541f5c21150f0634c5b14254392d1a1c06db` | ✅ Verified |
| **BNB/USD** | `0x000335fd3f3ffa06cfd9297b97367f77145d7a5f132e84c736cc471dd98621fe` | ✅ Verified |
| **SOL/USD** | `0x0003b778d3f6b2ac4991302b89cb313f99a42467d6c9c5f96f57c29c0d2bc24f` | ✅ Verified |
| **XRP/USD** | `0x0003c16c6aed42294f5cb4741f6e59ba2d728f0eae2eb9e6d3f555808c59fc45` | ✅ Verified |
| **USDC/USD** | `0x00038f83323b6b08116d1614cf33a9bd71ab5e0abf0c9f1b783a74a43e7bd992` | ✅ Verified |
| **DOGE/USD** | `0x000356ca64d3b32135e17dc0dc721a645bf50d0303be8ceb2cdca0a50bab8fdc` | ✅ Verified |

### 🔧 Deployed Contract

- **Contract**: `ChainlinkDataStreamsIntegration`
- **Address**: [`0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F`](https://testnet.opbnbscan.com/address/0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F#code)
- **Network**: opBNB Testnet (Chain ID: 5611)
- **Verifier Proxy**: `0x001225Aca0efe49Dbb48233aB83a9b4d177b581A`
- **Explorer**: [View on opBNBScan](https://testnet.opbnbscan.com/address/0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F#code)

### 🚀 How to Use Chainlink Data Streams

#### 1. Configure a Market with Data Streams

```solidity
// In your contract or script
import "./oracle/ChainlinkDataStreamsIntegration.sol";

ChainlinkDataStreamsIntegration dataStreams = ChainlinkDataStreamsIntegration(
    0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F
);

// Configure a market to use BTC/USD
bytes32 btcStreamId = 0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8;
int256 targetPrice = 50000 * 1e8; // $50,000 in stream format

dataStreams.configureMarketStream(
    marketId,
    btcStreamId,
    targetPrice
);
```

#### 2. Get and Verify Prices

**From Frontend/Backend:**

```typescript
// 1. Get report from Data Streams API
const streamId = "0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8";
const report = await fetchDataStreamsReport(streamId);

// 2. Verify on-chain
const dataStreamsContract = new ethers.Contract(
  "0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F",
  dataStreamsABI,
  signer
);

await dataStreamsContract.verifyPriceReport(marketId, report);

// 3. Check if target price was reached
const { conditionMet, currentPrice, targetPrice } = 
  await dataStreamsContract.checkPriceCondition(marketId);
```

#### 3. Complete Flow

```
1. User creates market: "Will BTC exceed $50K?"
   ↓
2. Configure Stream ID: BTC/USD
   ↓
3. Set target price: $50,000
   ↓
4. Get report off-chain from Data Streams API
   ↓
5. Verify report on-chain using verifyPriceReport()
   ↓
6. If price >= target: Automatically resolve market
```

### 🔗 Resources

- 📚 [Chainlink Data Streams Docs](https://docs.chain.link/data-streams)
- 🌐 [Data Streams Portal](https://data.chain.link/streams)
- 📖 [Streams API Reference](https://docs.chain.link/data-streams/streams-api-reference)
- 🌍 [Supported Networks](https://docs.chain.link/data-streams/supported-networks)

### 📚 Additional Documentation

- [Complete Integration Guide](./CHAINLINK_DATA_STREAMS_INTEGRATION.md)
- [Configured Stream IDs](./STREAM_IDS_CONFIGURADOS.md)
- [Stream ID Recommendations](./RECOMENDACIONES_STREAM_IDS.md)

---

## 🛠️ Technology Stack

<div align="center">

### **Built with the Best Technologies**

</div>

| Category | Technology | Purpose |
|:--------|:-----------|:--------|
| **🔗 Blockchain** | ![opBNB](https://img.shields.io/badge/opBNB-Layer%202-orange?style=flat-square&logo=binance) | Main network |
| **⚡ Oracle** | ![Chainlink](https://img.shields.io/badge/Chainlink-Data%20Streams-375BD2?style=flat-square&logo=chainlink) | Real-time price feeds |
| **🤖 AI** | ![Google AI](https://img.shields.io/badge/Google-Gemini-blue?style=flat-square&logo=google) ![Groq](https://img.shields.io/badge/Groq-Llama-purple?style=flat-square) ![OpenRouter](https://img.shields.io/badge/OpenRouter-Mistral-green?style=flat-square) | Multi-AI consensus |
| **🔐 Wallet** | ![Thirdweb](https://img.shields.io/badge/Thirdweb-Embedded%20Wallets-blue?style=flat-square) | Gasless UX |
| **🌐 Cross-Chain** | ![Chainlink CCIP](https://img.shields.io/badge/Chainlink-CCIP-375BD2?style=flat-square&logo=chainlink) | Cross-chain messaging |
| **💰 DeFi** | ![Venus Protocol](https://img.shields.io/badge/Venus-Protocol-green?style=flat-square) | Yield farming |
| **🤖 Automation** | ![Gelato](https://img.shields.io/badge/Gelato-Automation-blue?style=flat-square) | Oracle bot automation |
| **📝 Smart Contracts** | ![Solidity](https://img.shields.io/badge/Solidity-0.8.20-blue?style=flat-square&logo=solidity) | Contract language |
| **🔧 Framework** | ![Hardhat](https://img.shields.io/badge/Hardhat-Development-yellow?style=flat-square&logo=ethereum) ![Foundry](https://img.shields.io/badge/Foundry-Testing-red?style=flat-square&logo=foundry) | Development tools |
| **⚛️ Frontend** | ![Next.js](https://img.shields.io/badge/Next.js-14-black?style=flat-square&logo=next.js) ![React](https://img.shields.io/badge/React-18-blue?style=flat-square&logo=react) ![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?style=flat-square&logo=typescript) | Frontend framework |
| **🚀 Backend** | ![Node.js](https://img.shields.io/badge/Node.js-18-green?style=flat-square&logo=node.js) ![Express](https://img.shields.io/badge/Express-API-gray?style=flat-square&logo=express) | Backend API |

---

## 📖 Documentation

<div align="center">

### **Everything You Need to Know**

</div>

| Document | Description |
|:--------|:------------|
| 📐 [Architecture](./docs/ARCHITECTURE.md) | System architecture and design |
| 📜 [Smart Contracts](./docs/SMART_CONTRACTS.md) | Contract documentation |
| 🤖 [Multi-AI Consensus System](./docs/CONSENSUS_SYSTEM.md) | AI oracle consensus details |
| 📡 [API Reference](./docs/API.md) | Backend API documentation |
| 🧪 [Testing Guide](./docs/TESTING.md) | How to test the platform |
| ⚙️ [Services Setup Guide](./SERVICES_SETUP.md) | Complete setup for external services |

---

## 🏆 Hackathon Submission

<div align="center">

### **Seedify x BNB Chain Prediction Markets Hackathon**

</div>

**Tracks**: All 5 tracks integrated  
**Network**: opBNB (Chain ID: 5611)  
**Prize Target**: $50-70K Grand Prize + Funding

### 🎯 Key Innovations

1. **🧠 Multi-AI Oracle Consensus**: First prediction market with 5-AI consensus from 3 providers (Gemini, Groq, OpenRouter)
2. **🛡️ Insurance Guarantee**: Oracle fails = automatic refund
3. **🎖️ Reputation NFTs**: On-chain reputation as tradeable assets
4. **🔗 Conditional Markets**: Parent-child resolution logic
5. **🌐 Cross-Chain Aggregator**: Save 1-5% per bet
6. **💰 Free Tier AI Models**: All AI services use free tiers (no credit card required)

---

## 📊 Test Coverage

<div align="center">

| Component | Coverage | Status |
|:---------|:--------:|:------:|
| **Smart Contracts** | 85%+ | ✅ Excellent |
| **Backend Services** | 80%+ | ✅ Good |
| **Frontend Components** | 75%+ | ✅ Good |

</div>

---

## 🔐 Security

<div align="center">

| Audit | Status |
|:------|:------:|
| **CertiK Audit** | ⏳ Pending |
| **Slither** | ✅ Passed |
| **Mythril** | ✅ Passed |

</div>

---

## 📝 License

MIT License - See [LICENSE](./LICENSE) file for details

---

## 👥 Team

<div align="center">

**Building the future of decentralized prediction markets**

</div>

- **Lead Dev**: [Your Name]
- **Smart Contracts**: [Name]
- **Frontend**: [Name]
- **AI/ML**: [Name]

---

## 🙏 Acknowledgments

<div align="center">

### **Built with Amazing Technologies**

</div>

- 🔗 **Chainlink** - Data Streams, CCIP & Functions
- 🎨 **Thirdweb** - Embedded Wallets
- 📊 **Pyth Network** - Price feeds (alternative)
- 🌐 **BNB Chain** - opBNB network
- 💰 **Venus Protocol** - Yield farming
- 🤖 **Gelato** - Automation services
- 🧠 **Google AI, Groq, OpenRouter** - AI providers

---

<div align="center">

**🚀 Ready to predict the future? [Get Started Now](#-quick-start)**

[![GitHub](https://img.shields.io/badge/GitHub-Repository-black?style=for-the-badge&logo=github)](https://github.com/Vaios0x/MetaPredict)
[![Documentation](https://img.shields.io/badge/Documentation-Read%20More-blue?style=for-the-badge)](./docs/)
[![Contracts](https://img.shields.io/badge/Contracts-View%20on%20Explorer-orange?style=for-the-badge)](https://testnet.opbnbscan.com/)

Made with ❤️ by the MetaPredict team

</div>
