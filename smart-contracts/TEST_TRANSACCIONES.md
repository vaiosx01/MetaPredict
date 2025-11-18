# 🧪 Tests de Transacciones - Smart Contracts

## 📋 Descripción

Este documento describe los tests completos de transacciones entre todos los smart contracts desplegados en opBNB Testnet. Cada test ejecuta **3 transacciones** con cantidades mínimas verificables, generando transaction hashes que pueden ser verificados en [opBNBScan Testnet](https://testnet.opbnbscan.com/).

## 🎯 Objetivo

Verificar que todos los smart contracts funcionan correctamente en testnet mediante transacciones reales que:

- ✅ Generan transaction hashes verificables en opBNBScan
- ✅ Usan cantidades mínimas verificables (1 USDC mínimo)
- ✅ Cubren todas las funcionalidades principales de cada contrato
- ✅ Validan la integración entre contratos

## 📦 Contratos Testeados

### 1. **PredictionMarketCore** - Mercados Binarios
- ✅ Crear mercado binario
- ✅ Colocar apuesta YES
- ✅ Colocar apuesta NO

### 2. **InsurancePool** - Pool de Seguros
- ✅ Depositar en Insurance Pool (mínimo 10 USDC)
- ✅ Reclamar yield acumulado
- ✅ Retirar parcialmente

### 3. **ReputationStaking** - Sistema de Reputación
- ✅ Stake tokens para reputación (mínimo 100 USDC)
- ✅ Votar en dispute
- ✅ Stake adicional para aumentar reputación

### 4. **DAOGovernance** - Gobernanza Descentralizada
- ✅ Crear propuesta de parámetros
- ✅ Votar en propuesta
- ✅ Iniciar votación para mercado subjetivo

### 5. **OmniRouter** - Agregador Cross-Chain
- ✅ Actualizar precio de mercado
- ✅ Actualizar precio con diferentes odds
- ✅ Ruteo de apuesta cross-chain (simulado)

### 6. **BinaryMarket** - Operaciones Directas de Mercado
- ✅ Crear mercado directamente
- ✅ Colocar múltiples apuestas
- ✅ Iniciar resolución de mercado

## 🚀 Ejecutar Tests

### Prerrequisitos

1. **Configurar Private Key**: Asegúrate de tener tu `PRIVATE_KEY` configurada en el archivo `.env` en la raíz del proyecto:
   ```env
   PRIVATE_KEY=tu_private_key_sin_0x
   RPC_URL_TESTNET=https://opbnb-testnet-rpc.bnbchain.org
   ```

2. **Tener fondos en testnet**: Tu wallet debe tener:
   - **BNB** para gas fees (mínimo 0.01 BNB recomendado)
   - **USDC** en opBNB Testnet (mínimo 500 USDC recomendado para todos los tests)

   Para obtener tokens:
   - BNB: [L2Faucet](https://www.l2faucet.com/opbnb) o [Thirdweb Faucet](https://thirdweb.com/opbnb-testnet)
   - USDC: Usa el contrato MockUSDC o solicita en faucets de testnet

### Ejecutar Tests

```bash
cd smart-contracts

# Ejecutar todos los tests de transacciones
pnpm run test:transactions

# Ejecutar con output verbose
pnpm run test:transactions:verbose
```

### Ejecutar Tests Individuales

```bash
# Solo tests de PredictionMarketCore
npx hardhat test test/transactions.test.ts --network opBNBTestnet --grep "PredictionMarketCore"

# Solo tests de InsurancePool
npx hardhat test test/transactions.test.ts --network opBNBTestnet --grep "InsurancePool"

# Solo tests de ReputationStaking
npx hardhat test test/transactions.test.ts --network opBNBTestnet --grep "ReputationStaking"
```

## 📊 Cantidades Mínimas

| Contrato | Función | Cantidad Mínima |
|----------|---------|----------------|
| PredictionMarketCore | `placeBet` | 1 USDC |
| InsurancePool | `deposit` | 10 USDC |
| ReputationStaking | `stake` | 100 USDC |
| DAOGovernance | `createParameterProposal` | Requiere tokens de governance |
| OmniRouter | `routeBet` | 1 USDC + gas fee |

## 🔍 Verificar Transacciones

Después de ejecutar los tests, verás un resumen con todos los transaction hashes:

```
📊 RESUMEN DE TRANSACCIONES
================================================================================

Total de transacciones ejecutadas: 18

🔗 Enlaces a opBNBScan:

  1. 0x1234...
     https://testnet.opbnbscan.com/tx/0x1234...

  2. 0x5678...
     https://testnet.opbnbscan.com/tx/0x5678...
```

Cada hash es un enlace directo a opBNBScan donde puedes ver:
- ✅ Estado de la transacción (Success/Failed)
- ✅ Gas usado
- ✅ Block number
- ✅ Timestamp
- ✅ Eventos emitidos
- ✅ Logs detallados

## ⚠️ Notas Importantes

1. **Tests en Testnet Real**: Estos tests ejecutan transacciones **reales** en opBNB Testnet. Asegúrate de tener fondos suficientes.

2. **Algunos Tests Pueden Fallar**: Algunos tests pueden fallar si:
   - El mercado no ha alcanzado su `resolutionTime`
   - No hay yield acumulado para reclamar
   - No se cumplen condiciones específicas del contrato
   
   Estos casos están manejados y no fallan el test suite completo.

3. **Gas Fees**: Cada transacción consume BNB para gas. Asegúrate de tener suficiente BNB en tu wallet.

4. **Rate Limiting**: Si ejecutas muchos tests seguidos, puedes encontrar rate limits en el RPC. Espera unos segundos entre ejecuciones.

## 🐛 Troubleshooting

### Error: "insufficient funds for gas"
- **Solución**: Obtén más BNB del faucet

### Error: "ERC20: transfer amount exceeds balance"
- **Solución**: Asegúrate de tener suficiente USDC en tu wallet

### Error: "Market not active"
- **Solución**: Algunos tests requieren que el mercado esté en estado específico. Esto es normal y el test lo maneja.

### Error: "RPC rate limit"
- **Solución**: Espera unos minutos y vuelve a intentar, o usa un RPC alternativo

## 📝 Estructura del Test

```typescript
describe("1. PredictionMarketCore - Binary Market Transactions", function () {
  it("Transacción 1: Crear mercado binario", async function () {
    // Ejecuta transacción
    // Guarda hash
    // Verifica en opBNBScan
  });
  
  it("Transacción 2: Colocar apuesta YES", async function () {
    // ...
  });
  
  it("Transacción 3: Colocar apuesta NO", async function () {
    // ...
  });
});
```

## ✅ Checklist de Verificación

Después de ejecutar los tests, verifica:

- [ ] Todas las transacciones tienen status `1` (Success)
- [ ] Todos los hashes son válidos y verificables en opBNBScan
- [ ] Los eventos se emitieron correctamente
- [ ] Los balances se actualizaron como se esperaba
- [ ] No hay errores de gas o revert

## 🔗 Enlaces Útiles

- [opBNBScan Testnet](https://testnet.opbnbscan.com/)
- [opBNB Testnet Faucet](https://www.l2faucet.com/opbnb)
- [Documentación de Hardhat](https://hardhat.org/docs)
- [Ethers.js v6 Docs](https://docs.ethers.org/v6/)

---

**Última actualización**: Noviembre 2025  
**Red**: opBNB Testnet (Chain ID: 5611)  
**Framework**: Hardhat + Ethers.js v6

