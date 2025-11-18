# 📊 Integración de Chainlink Data Streams - MetaPredict

## ✅ Estado: DISPONIBLE EN opBNB

Chainlink Data Streams está disponible en opBNB desde octubre 2024. Proporciona precios en tiempo real con actualizaciones de alta frecuencia (hasta 100ms).

## 🎯 ¿Para qué lo usaremos?

En MetaPredict, Chainlink Data Streams se usará para:
1. **Validar predicciones basadas en precios**: Ej: "¿BTC superará $50K?"
2. **Resolver mercados automáticamente**: Cuando el precio alcanza el objetivo
3. **Validar resultados del AI Oracle**: Comparar predicciones AI con precios reales
4. **Precios en tiempo real**: Obtener precios actualizados cada segundo

## 📋 Direcciones de Contratos (opBNB Testnet)

### Verifier Proxy
- **opBNB Testnet**: `0x001225Aca0efe49Dbb48233aB83a9b4d177b581A`
- **opBNB Mainnet**: `0x7D543D1a715ED544f7e3Ae9e3b1777BCdA56bF8e`

**Fuente**: [Chainlink Data Streams Supported Networks](https://docs.chain.link/data-streams/supported-networks)

## 🔧 Cómo Funciona

### Flujo Pull-Based de Data Streams:

1. **Off-Chain**: Obtienes datos de precios via API REST o WebSocket
2. **On-Chain**: Verificas los datos usando el Verifier Proxy
3. **Uso**: Usas los precios verificados para resolver mercados

```
Frontend/Backend
  → Obtiene reporte de Data Streams API
  → Llama verifyPriceReport() con el reporte
  → Contrato verifica el reporte on-chain
  → Precio verificado disponible para usar
```

## 📝 Contrato Creado

He creado `ChainlinkDataStreamsIntegration.sol` que:
- ✅ Verifica reportes de Data Streams on-chain
- ✅ Almacena últimos precios verificados
- ✅ Valida precios predichos contra precios reales
- ✅ Detecta cuando se alcanza un precio objetivo
- ✅ Compatible con el sistema actual

## 🚀 Pasos para Usar

### 1. Obtener Stream IDs

Los Stream IDs se obtienen de la API de Chainlink Data Streams:
- [Stream IDs Documentation](https://docs.chain.link/data-streams/streams-ids)
- [Data Streams API](https://docs.chain.link/data-streams/streams-api-reference)

Ejemplos de Stream IDs comunes:
- BTC/USD
- ETH/USD
- BNB/USD
- etc.

### 2. Desplegar el Contrato

El contrato se despliega automáticamente si tienes `CHAINLINK_DATA_STREAMS_VERIFIER_PROXY` configurado:

```bash
cd smart-contracts
pnpm run deploy:testnet
```

### 3. Configurar Mercados

Una vez desplegado, configura los mercados:

```solidity
// Configurar un mercado para usar Data Streams
dataStreamsIntegration.configureMarketStream(
    marketId,
    streamId, // BTC/USD stream ID
    targetPrice // Precio objetivo (ej: 50000 * 1e8 para $50K)
);
```

### 4. Obtener y Verificar Precios

Desde tu frontend/backend:

```typescript
// 1. Obtener reporte de Data Streams API
const report = await fetchDataStreamsReport(streamId);

// 2. Verificar on-chain
await dataStreamsIntegration.verifyPriceReport(marketId, report);

// 3. Verificar si se alcanzó el precio objetivo
const { conditionMet, currentPrice, targetPrice } = 
    await dataStreamsIntegration.checkPriceCondition(marketId);
```

## 📊 Variables de Entorno

Agregar a `.env.local`:

```bash
# Chainlink Data Streams (opBNB Testnet)
CHAINLINK_DATA_STREAMS_VERIFIER_PROXY=0x001225Aca0efe49Dbb48233aB83a9b4d177b581A

# Stream IDs (obtener de la API)
CHAINLINK_DATA_STREAMS_BTC_USD_STREAM_ID=0x...
CHAINLINK_DATA_STREAMS_ETH_USD_STREAM_ID=0x...
```

## 🔗 Recursos

- [Chainlink Data Streams Docs](https://docs.chain.link/data-streams)
- [Supported Networks](https://docs.chain.link/data-streams/supported-networks)
- [Stream IDs](https://docs.chain.link/data-streams/streams-ids)
- [Streams API Reference](https://docs.chain.link/data-streams/streams-api-reference)
- [Data Streams en opBNB](https://www.prnewswire.com/news-releases/chainlink-data-streams-is-now-live-on-opbnb-to-power-secure-defi-markets-on-the-optimized-layer-2-solution-302287542.html)

## ⚠️ Notas Importantes

1. **Pull-Based**: Data Streams es pull-based, necesitas obtener datos off-chain primero
2. **Fees**: No requiere LINK tokens para verificar (solo para obtener datos premium)
3. **Stream IDs**: Necesitas obtener los Stream IDs de los pares que necesitas
4. **Integración**: Puede usarse junto con Pyth Network o como alternativa

## 🎯 Próximos Pasos

1. ✅ Contrato creado (`ChainlinkDataStreamsIntegration.sol`)
2. ✅ Interface creada (`IChainlinkDataStreams.sol`)
3. ✅ Variables de entorno actualizadas
4. ⏳ Obtener Stream IDs de la API
5. ⏳ Desplegar contrato (se hace automáticamente si está configurado)
6. ⏳ Integrar en frontend/backend para obtener reportes

---

**Última actualización**: Noviembre 2025

