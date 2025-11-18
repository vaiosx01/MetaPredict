# 📊 Configuración de Chainlink Data Streams - opBNB

## ✅ Estado: DISPONIBLE EN opBNB

Chainlink Data Streams está disponible en opBNB desde octubre 2024. Proporciona precios en tiempo real con actualizaciones de alta frecuencia (hasta 100ms).

## 🎯 ¿Para qué lo usaremos?

En MetaPredict, Chainlink Data Streams se usará para:
1. **Validar predicciones basadas en precios**: Ej: "¿BTC superará $50K?"
2. **Resolver mercados automáticamente**: Cuando el precio alcanza el objetivo
3. **Validar resultados del AI Oracle**: Comparar predicciones AI con precios reales

## 📋 Pasos para Integración

### 1. Obtener Direcciones de Contratos

Necesitas obtener las direcciones de Chainlink Data Streams para opBNB testnet:

- **Streams Proxy Contract**: Dirección del contrato proxy
- **Streams Lookup Contract**: Para buscar streams disponibles
- **Fee Token**: Token para pagar fees (generalmente LINK)

**Enlaces útiles:**
- [Chainlink Data Streams Docs](https://docs.chain.link/data-streams)
- [Chainlink Data Streams en opBNB](https://www.prnewswire.com/news-releases/chainlink-data-streams-is-now-live-on-opbnb-to-power-secure-defi-markets-on-the-optimized-layer-2-solution-302287542.html)

### 2. Crear/Actualizar Contrato de Integración

Tienes dos opciones:

#### Opción A: Actualizar PythIntegration para soportar Data Streams
- Modificar `PythIntegration.sol` para usar Data Streams además de Pyth
- Mantener compatibilidad con ambos oráculos

#### Opción B: Crear nuevo contrato ChainlinkDataStreamsIntegration
- Contrato dedicado solo para Data Streams
- Más limpio y específico

### 3. Integrar en PredictionMarket

Actualizar `PredictionMarket.sol` para:
- Usar Data Streams para validar precios
- Resolver mercados automáticamente cuando se alcanza el precio objetivo
- Comparar resultados AI con precios reales

## 🔧 Implementación Recomendada

### Contrato ChainlinkDataStreamsIntegration

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@chainlink/contracts/src/v0.8/automation/interfaces/AutomationCompatibleInterface.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ChainlinkDataStreamsIntegration is Ownable {
    // Streams Proxy Contract
    address public immutable streamsProxy;
    
    // Mapping: marketId => streamId
    mapping(uint256 => bytes32) public marketStreamId;
    
    // Mapping: marketId => targetPrice
    mapping(uint256 => int256) public marketTargetPrice;
    
    // Events
    event StreamConfigured(uint256 indexed marketId, bytes32 streamId);
    event PriceReached(uint256 indexed marketId, int256 currentPrice);
    
    constructor(address _streamsProxy) Ownable(msg.sender) {
        streamsProxy = _streamsProxy;
    }
    
    function configureMarketStream(
        uint256 _marketId,
        bytes32 _streamId,
        int256 _targetPrice
    ) external onlyOwner {
        marketStreamId[_marketId] = _streamId;
        marketTargetPrice[_marketId] = _targetPrice;
        emit StreamConfigured(_marketId, _streamId);
    }
    
    function getLatestPrice(bytes32 _streamId) 
        external 
        view 
        returns (int256 price, uint256 timestamp) 
    {
        // Llamar a Streams Proxy para obtener precio
        // Implementación depende de la API de Data Streams
    }
    
    function checkPriceCondition(uint256 _marketId) 
        external 
        view 
        returns (bool conditionMet) 
    {
        bytes32 streamId = marketStreamId[_marketId];
        if (streamId == bytes32(0)) return false;
        
        (int256 currentPrice, ) = getLatestPrice(streamId);
        int256 targetPrice = marketTargetPrice[_marketId];
        
        return currentPrice >= targetPrice;
    }
}
```

## 📝 Variables de Entorno Necesarias

Agregar a `env.example`:

```bash
# Chainlink Data Streams (opBNB)
CHAINLINK_STREAMS_PROXY=0x... # Dirección del contrato proxy
CHAINLINK_STREAMS_LOOKUP=0x... # Dirección del contrato lookup
CHAINLINK_STREAMS_FEE_TOKEN=0x56E16E648c51609A14Eb14B99BAB771Bee797045 # LINK token
```

## 🔗 Recursos

- [Chainlink Data Streams Docs](https://docs.chain.link/data-streams)
- [Data Streams en opBNB](https://www.prnewswire.com/news-releases/chainlink-data-streams-is-now-live-on-opbnb-to-power-secure-defi-markets-on-the-optimized-layer-2-solution-302287542.html)
- [Streams API Reference](https://docs.chain.link/data-streams/streams-api-reference)

## ⚠️ Notas Importantes

1. **Fees**: Data Streams requiere LINK tokens para pagar fees
2. **Stream IDs**: Necesitas obtener los Stream IDs de los pares de precios que necesitas
3. **Actualización**: Los precios se actualizan automáticamente, pero puedes consultarlos on-chain
4. **Integración con AI Oracle**: Puedes usar Data Streams para validar resultados del AI Oracle

---

**Última actualización**: Noviembre 2025

