# 🚀 Guía de Uso de Chainlink Data Streams - MetaPredict

## 📋 Resumen

Esta guía te muestra cómo usar Chainlink Data Streams en MetaPredict para crear mercados basados en precios y resolverlos automáticamente.

## 🎯 Casos de Uso

1. **Mercados de Precios**: "¿BTC superará $50K?"
2. **Validación de Predicciones**: Comparar predicciones AI con precios reales
3. **Resolución Automática**: Resolver mercados cuando se alcanza el precio objetivo

## 📝 Scripts Disponibles

### 1. Configurar Mercados con Stream IDs

Configura Stream IDs para mercados existentes:

```bash
cd smart-contracts
pnpm run streams:configure
```

**Qué hace:**
- Configura Stream IDs para mercados existentes
- Establece precios objetivo para resolución automática
- Ejemplos: BTC/USD, ETH/USD, BNB/USD

### 2. Crear Mercados de Prueba

Crea mercados de prueba y los configura automáticamente con Stream IDs:

```bash
cd smart-contracts
pnpm run streams:create-test
```

**Qué hace:**
- Crea 3 mercados de ejemplo:
  - "¿BTC superará $50K?" (BTC/USD)
  - "¿ETH superará $3,000?" (ETH/USD)
  - "¿BNB superará $400?" (BNB/USD)
- Configura Stream IDs automáticamente
- Establece precios objetivo

### 3. Verificar Reporte de Precio

Verifica un reporte de Data Streams on-chain:

```bash
cd smart-contracts
pnpm run streams:verify <MARKET_ID> <REPORT_HEX>
```

**Ejemplo:**
```bash
pnpm run streams:verify 1 0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8...
```

**Qué hace:**
- Verifica un reporte de Data Streams on-chain
- Actualiza el precio verificado
- Verifica si se alcanzó el precio objetivo

## 🔧 Flujo Completo

### Paso 1: Crear un Mercado

```solidity
// En tu contrato o script
uint256 marketId = await core.createBinaryMarket(
    "¿Bitcoin superará $50,000 USD?",
    "Predicción sobre si el precio de Bitcoin alcanzará o superará los $50,000 USD.",
    resolutionTime, // Timestamp de resolución
    "ipfs://Qm..." // IPFS hash con metadata
);
```

### Paso 2: Configurar Stream ID

```solidity
// Configurar Stream ID para el mercado
bytes32 btcStreamId = 0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8;
int256 targetPrice = 50000 * 1e8; // $50,000 en formato del stream

await dataStreams.configureMarketStream(
    marketId,
    btcStreamId,
    targetPrice
);
```

### Paso 3: Obtener Reporte de Data Streams

**Desde Backend/Frontend:**

```typescript
// Obtener reporte de la API de Data Streams
const streamId = "0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8";
const response = await fetch(
  `https://api.chain.link/data-streams/streams/${streamId}/reports/latest`,
  {
    headers: {
      'Accept': 'application/octet-stream',
    }
  }
);

const buffer = await response.arrayBuffer();
const report = Buffer.from(buffer);
const reportHex = '0x' + report.toString('hex');
```

### Paso 4: Verificar Reporte On-Chain

```typescript
// Verificar el reporte on-chain
const dataStreamsContract = new ethers.Contract(
  "0x8DDf46929c807213c2a313e69908C3c2904c30e7",
  dataStreamsABI,
  signer
);

const tx = await dataStreamsContract.verifyPriceReport(marketId, reportHex);
await tx.wait();

// Verificar si se alcanzó el precio objetivo
const { conditionMet, currentPrice, targetPrice } = 
  await dataStreamsContract.checkPriceCondition(marketId);

if (conditionMet) {
  // Resolver mercado automáticamente
  console.log("¡Precio objetivo alcanzado! Resolviendo mercado...");
}
```

## 📊 Stream IDs Disponibles

| Par | Stream ID | Uso Recomendado |
|-----|-----------|-----------------|
| BTC/USD | `0x00039d9e...75b8` | Predicciones de Bitcoin |
| ETH/USD | `0x00036220...3ae9` | Predicciones de Ethereum |
| BNB/USD | `0x000335fd...21fe` | Predicciones de BNB |
| SOL/USD | `0x0003b778...c24f` | Predicciones de Solana |
| USDT/USD | `0x0003a910...06db` | Validación de peg |
| USDC/USD | `0x00038f83...d992` | Validación de peg |
| XRP/USD | `0x0003c16c...fc45` | Predicciones de XRP |
| DOGE/USD | `0x000356ca...fdc` | Predicciones de Dogecoin |

## 🔄 Integración con el Sistema Actual

### Opción 1: Resolución Automática

Cuando se alcanza el precio objetivo, puedes resolver el mercado automáticamente:

```typescript
// Monitorear precios periódicamente
setInterval(async () => {
  const { conditionMet } = await dataStreamsContract.checkPriceCondition(marketId);
  
  if (conditionMet) {
    // Resolver mercado
    await coreContract.resolveMarket(marketId, Outcome.Yes, 100);
  }
}, 60000); // Cada minuto
```

### Opción 2: Validación con AI Oracle

Usa Data Streams para validar resultados del AI Oracle:

```typescript
// 1. AI Oracle resuelve el mercado
const aiResult = await aiOracle.resolveMarket(marketId);

// 2. Verificar precio con Data Streams
const { currentPrice } = await dataStreamsContract.getLastVerifiedPrice(marketId);

// 3. Comparar y validar
if (aiResult.confidence < 80) {
  // Si AI no está seguro, usar precio de Data Streams
  const { conditionMet } = await dataStreamsContract.checkPriceCondition(marketId);
  // Resolver basado en precio real
}
```

## 🧪 Testing

### Crear Mercados de Prueba

```bash
cd smart-contracts
pnpm run streams:create-test
```

Esto crea 3 mercados de ejemplo configurados con Stream IDs.

### Verificar Precios

```bash
# Obtén un reporte de Data Streams API primero
# Luego verifica:
pnpm run streams:verify <MARKET_ID> <REPORT_HEX>
```

## 📚 Recursos

- [Chainlink Data Streams Docs](https://docs.chain.link/data-streams)
- [Streams API Reference](https://docs.chain.link/data-streams/streams-api-reference)
- [Data Streams Portal](https://data.chain.link/streams)
- [Contrato Desplegado](https://testnet.opbnbscan.com/address/0x8DDf46929c807213c2a313e69908C3c2904c30e7)

## ⚠️ Notas Importantes

1. **Pull-Based**: Data Streams es pull-based, necesitas obtener reportes off-chain primero
2. **Fees**: No requiere LINK tokens para verificar (solo para obtener datos premium)
3. **Frecuencia**: Obtén reportes periódicamente (cada minuto o según necesites)
4. **Validación**: Siempre verifica reportes on-chain antes de usarlos

---

**Última actualización**: 18 de Noviembre, 2025

