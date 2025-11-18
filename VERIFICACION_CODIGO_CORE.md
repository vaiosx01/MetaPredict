# Verificación del Código del Core Contract

## 🔍 Análisis del Problema

El error "Only core" persiste al intentar apostar, aunque:
- ✅ El BinaryMarket tiene `coreContract` correcto
- ✅ El Core tiene la nueva dirección del BinaryMarket
- ✅ La creación de mercados funciona

## 📋 Código Relevante del Core

### Función placeBet (líneas 252-282)

```solidity
function placeBet(
    uint256 _marketId,
    bool _isYes
) external payable nonReentrant whenNotPaused {
    MarketInfo storage market = markets[_marketId];
    require(market.status == MarketStatus.Active, "Not active");
    require(msg.value >= MIN_BET && msg.value <= MAX_BET, "Invalid amount");
    
    uint256 _amount = msg.value;
    
    // Calculate fees
    uint256 tradingFee = (_amount * FEE_BASIS_POINTS) / 10000;
    uint256 insuranceFee = (_amount * INSURANCE_FEE_BP) / 10000;
    uint256 netAmount = _amount - tradingFee - insuranceFee;
    
    // Transfer to insurance pool
    insurancePool.receiveInsurancePremium{value: insuranceFee}(_marketId, insuranceFee);
    
    // Route to appropriate market contract
    address marketContract = marketTypeContract[_marketId];
    
    if (market.marketType == MarketType.Binary) {
        binaryMarket.placeBet{value: netAmount}(_marketId, msg.sender, _isYes, netAmount);
    } else if (market.marketType == MarketType.Conditional) {
        conditionalMarket.placeBet{value: netAmount}(_marketId, msg.sender, _isYes, netAmount);
    } else {
        subjectiveMarket.placeBet{value: netAmount}(_marketId, msg.sender, _isYes, netAmount);
    }
    
    emit FeeCollected(_marketId, msg.sender, tradingFee, insuranceFee);
}
```

### Observaciones

1. **Línea 274**: El Core llama a `binaryMarket.placeBet()` directamente usando la variable `binaryMarket`
2. **Variable binaryMarket**: Se actualiza mediante `updateModule("binaryMarket", newAddress)` (línea 398)
3. **Modificador onlyCore**: El BinaryMarket verifica `msg.sender == coreContract`

## 🔍 Posibles Causas del Problema

### 1. Versión Diferente del Código
El Core desplegado puede tener una versión anterior que:
- No actualiza correctamente la variable `binaryMarket` en `updateModule`
- Tiene un bug en la función `placeBet`
- Usa una lógica diferente para llamar a `binaryMarket.placeBet()`

### 2. Problema con el Cast
En la línea 398, se hace:
```solidity
binaryMarket = BinaryMarket(_newAddress);
```

Si el Core desplegado tiene una versión anterior, puede que no esté haciendo este cast correctamente.

### 3. Problema con msg.sender
Aunque todo parece correcto, puede haber un problema con cómo se está pasando `msg.sender` cuando el Core llama a `binaryMarket.placeBet()`.

## ✅ Verificación Recomendada

1. **Verificar código en opBNBScan**:
   - URL: https://testnet.opbnbscan.com/address/0x0bB2643aCE44Bbb4Fdcc3a4fC50eECbe3Ab4a76B#code
   - Buscar la función `placeBet` y comparar con el código fuente actual
   - Verificar la función `updateModule` y cómo actualiza `binaryMarket`

2. **Verificar bytecode**:
   - Comparar el bytecode del contrato desplegado con el bytecode compilado localmente
   - Esto confirmaría si hay diferencias en el código

3. **Redesplegar el Core**:
   - Si hay diferencias, redesplegar el Core con la versión actual del código
   - Esto aseguraría que el Core tiene la lógica correcta

## 📝 Próximos Pasos

1. Verificar manualmente el código en opBNBScan
2. Si hay diferencias, considerar redesplegar el Core
3. Si no hay diferencias, investigar más a fondo el problema de `msg.sender`

