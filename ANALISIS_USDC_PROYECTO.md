# 📊 Análisis Completo: Uso de USDC en MetaPredict.ai

## 🎯 Resumen Ejecutivo

**USDC es el token principal** utilizado en todo el proyecto MetaPredict.ai. Se usa como:
- ✅ Token de apuestas (betting token)
- ✅ Token de staking (reputation)
- ✅ Token de governance (DAO)
- ✅ Asset del Insurance Pool
- ✅ Token para yield farming (Venus Protocol)

**Dirección USDC en opBNB Testnet**: `0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3`

**Decimales**: 6 (como USDC real)

---

## 📍 1. SMART CONTRACTS - Uso de USDC

### 1.1 PredictionMarketCore.sol
**Ubicación**: `smart-contracts/contracts/core/PredictionMarketCore.sol`

**Uso de USDC**:
```solidity
IERC20 public immutable bettingToken; // USDC

constructor(
    address _bettingToken, // USDC address
    ...
) {
    bettingToken = IERC20(_bettingToken);
}

// Funciones que usan USDC:
- placeBet(): Transfiere USDC del usuario al contrato
- stakeReputation(): Transfiere USDC para staking
- initiateResolution(): Calcula fees en USDC
```

**Límites**:
- `MIN_BET = 1e6` (1 USDC)
- `MAX_BET = 100_000e6` (100,000 USDC)
- `FEE_BASIS_POINTS = 50` (0.5% fee en USDC)
- `INSURANCE_FEE_BP = 10` (0.1% fee en USDC)

---

### 1.2 InsurancePool.sol
**Ubicación**: `smart-contracts/contracts/oracle/InsurancePool.sol`

**Uso de USDC**:
```solidity
// ERC4626 Vault que usa USDC como asset
constructor(
    IERC20 _asset, // USDC
    address _venusVToken, // vUSDC para yield
    ...
)

// Funciones:
- deposit(): Deposita USDC en el pool
- withdraw(): Retira USDC del pool
- receiveInsurancePremium(): Recibe USDC de apuestas
- processClaim(): Paga USDC en claims de seguro
- _stakeInVenus(): Stakes USDC en Venus Protocol para yield
```

**Límites**:
- `MIN_DEPOSIT = 10e6` (10 USDC mínimo)
- 70% del pool se staking en Venus (vUSDC)
- 30% queda líquido para claims

---

### 1.3 ReputationStaking.sol
**Ubicación**: `smart-contracts/contracts/reputation/ReputationStaking.sol`

**Uso de USDC**:
```solidity
IERC20 public immutable stakingToken; // USDC

constructor(address _stakingToken) {
    stakingToken = IERC20(_stakingToken);
}

// Funciones:
- stake(): Stakes USDC para ganar reputación
- unstake(): Retira USDC staked
- processVoteResult(): Slashing/rewards en USDC
```

**Límites y Tiers**:
- `minStake = 100e6` (100 USDC mínimo)
- **Tiers en USDC**:
  - Bronze: 100 USDC
  - Silver: 1,000 USDC
  - Gold: 10,000 USDC
  - Platinum: 50,000 USDC
  - Diamond: 100,000 USDC

---

### 1.4 BinaryMarket.sol
**Ubicación**: `smart-contracts/contracts/markets/BinaryMarket.sol`

**Uso de USDC**:
```solidity
IERC20 public immutable bettingToken; // USDC

// Funciones:
- placeBet(): Transfiere USDC del core al market
- claimWinnings(): Paga USDC a ganadores
```

---

### 1.5 ConditionalMarket.sol
**Ubicación**: `smart-contracts/contracts/markets/ConditionalMarket.sol`

**Uso de USDC**: Similar a BinaryMarket, usa USDC para apuestas.

---

### 1.6 SubjectiveMarket.sol
**Ubicación**: `smart-contracts/contracts/markets/SubjectiveMarket.sol`

**Uso de USDC**: Similar a BinaryMarket, usa USDC para apuestas.

---

### 1.7 DAOGovernance.sol
**Ubicación**: `smart-contracts/contracts/governance/DAOGovernance.sol`

**Uso de USDC**:
```solidity
IERC20 public governanceToken; // USDC (usado como governance token)

constructor(
    address _governanceToken, // USDC
    ...
)

// Funciones:
- createParameterProposal(): Requiere 100e18 USDC (pero debería ser 100e6)
- castVote(): Votos basados en balance de USDC
```

**Nota**: Hay un bug - usa `100e18` pero debería ser `100e6` (USDC tiene 6 decimales).

---

### 1.8 OmniRouter.sol
**Ubicación**: `smart-contracts/contracts/aggregation/OmniRouter.sol`

**Uso de USDC**:
```solidity
IERC20 public immutable bettingToken; // USDC

// Funciones:
- routeBet(): Transfiere USDC para apuestas cross-chain
- updatePrice(): Actualiza precios de mercados (en USDC)
```

---

### 1.9 MockUSDC.sol
**Ubicación**: `smart-contracts/contracts/mocks/MockUSDC.sol`

**Propósito**: Contrato mock para testing en testnet.

**Características**:
- 6 decimales (como USDC real)
- Función `mint()` pública para mintear tokens ilimitados
- Útil para testing sin necesidad de USDC real

---

## 📍 2. FRONTEND - Uso de USDC

### 2.1 Hooks de USDC

#### useUSDCBalance.ts
**Ubicación**: `frontend/lib/hooks/useUSDCBalance.ts`

**Funcionalidad**:
- Lee el balance de USDC del usuario
- Convierte de raw (6 decimales) a número legible
- Usa Thirdweb para interactuar con el contrato

**Uso**:
```typescript
const { balance, balanceRaw, isLoading } = useUSDCBalance();
// balance: número legible (ej: 100.5)
// balanceRaw: bigint con 6 decimales
```

---

#### usePlaceBet.ts
**Ubicación**: `frontend/lib/hooks/betting/usePlaceBet.ts`

**Funcionalidad**:
- Aprobar USDC antes de apostar
- Colocar apuestas usando USDC
- Maneja conversión de decimales (6 decimales)

**Funciones**:
```typescript
// Aprobar USDC
useApproveUSDC(): Aprobar USDC al contrato de predicción

// Colocar apuesta
usePlaceBet(): 
  - Convierte amount a bigint (× 1e6)
  - Aprueba USDC
  - Coloca apuesta
```

---

### 2.2 Componentes que usan USDC

#### BettingPanel.tsx
**Ubicación**: `frontend/components/markets/BettingPanel.tsx`

**Uso**:
- Muestra balance de USDC del usuario
- Input para cantidad en USDC
- Botones para aprobar y apostar con USDC

---

#### DepositPanel.tsx
**Ubicación**: `frontend/components/insurance/DepositPanel.tsx`

**Uso**:
- Deposita USDC en Insurance Pool
- Convierte amount a bigint (× 1e6)
- Muestra información de yield en USDC

---

#### Market Detail Page
**Ubicación**: `frontend/app/markets/[id]/page.tsx`

**Uso**:
- Muestra balance de USDC del usuario
- Integra BettingPanel para apostar con USDC

---

### 2.3 Configuración de Direcciones

#### addresses.ts
**Ubicación**: `frontend/lib/contracts/addresses.ts`

```typescript
USDC: getAddress(
  process.env.NEXT_PUBLIC_USDC_ADDRESS, 
  '0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3'
)
```

---

## 📍 3. SCRIPTS DE DEPLOYMENT - Uso de USDC

### 3.1 deploy.ts
**Ubicación**: `smart-contracts/scripts/deploy.ts`

**Uso de USDC**:
```typescript
// Obtiene dirección de USDC desde .env o usa default
let usdcAddress: string;
if (process.env.USDC_ADDRESS) {
    usdcAddress = process.env.USDC_ADDRESS;
} else {
    usdcAddress = "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3"; // opBNB Testnet
}

// Pasa USDC a todos los contratos:
- InsurancePool(usdcAddress, ...)
- ReputationStaking(usdcAddress)
- DAOGovernance(usdcAddress, ...)
- OmniRouter(usdcAddress)
- BinaryMarket(usdcAddress, ...)
- ConditionalMarket(usdcAddress, ...)
- SubjectiveMarket(usdcAddress, ...)
- PredictionMarketCore(usdcAddress, ...)
```

---

### 3.2 verify-contracts.ts
**Ubicación**: `smart-contracts/scripts/verify-contracts.ts`

**Uso**: Verifica contratos usando la dirección de USDC como argumento.

---

## 📍 4. TESTS - Uso de USDC

### 4.1 transactions.test.ts
**Ubicación**: `smart-contracts/test/transactions.test.ts`

**Uso de USDC**:
```typescript
const DEPLOYED_CONTRACTS = {
  USDC: "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3"
};

const MIN_AMOUNT = ethers.parseUnits("1", 6); // 1 USDC
const MIN_STAKE = ethers.parseUnits("100", 6); // 100 USDC

// Tests que usan USDC:
- Crear mercado y apostar (1 USDC)
- Depositar en Insurance Pool (10 USDC)
- Stake para reputación (100 USDC)
- Votar en DAO (requiere USDC)
```

---

### 4.2 PredictionMarket.test.ts
**Ubicación**: `smart-contracts/test/PredictionMarket.test.ts`

**Uso**: Crea MockUSDC para testing local.

---

## 📍 5. VARIABLES DE ENTORNO - USDC

### 5.1 Variables Principales

```env
# Frontend
NEXT_PUBLIC_USDC_ADDRESS=0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3

# Smart Contracts
USDC_ADDRESS=0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3

# Venus Protocol (vUSDC)
VENUS_VUSDC_ADDRESS=0xe3923805f6E117E51f5387421240a86EF1570abC
VENUS_VTOKEN=0xe3923805f6E117E51f5387421240a86EF1570abC

# Chainlink Data Streams (precio USDC/USD)
CHAINLINK_DATA_STREAMS_USDC_USD_STREAM_ID=0x00038f83323b6b08116d1614cf33a9bd71ab5e0abf0c9f1b783a74a43e7bd992
```

---

## 📍 6. BACKEND/API - Uso de USDC

### 6.1 Venus Service
**Ubicación**: `frontend/lib/services/venusService.ts`

**Uso de USDC**:
```typescript
// Obtiene información de vUSDC (USDC en Venus)
getVUSDCInfo(): Promise<VenusVTokenInfo>

// Calcula APY del Insurance Pool basado en vUSDC
calculateInsurancePoolAPY(): Promise<InsurancePoolAPY>
```

---

### 6.2 API Routes
**Ubicación**: `frontend/app/api/venus/vusdc/route.ts`

**Endpoint**: `GET /api/venus/vusdc`

**Funcionalidad**: Retorna información de vUSDC (USDC en Venus Protocol).

---

## 📍 7. DOCUMENTACIÓN - Referencias a USDC

### 7.1 Archivos de Documentación

- `TEST_TRANSACCIONES.md`: Menciona cantidades mínimas en USDC
- `RESUMEN_TESTS_TRANSACCIONES.md`: Lista tests con USDC
- `DEPLOYMENT_GUIDE.md`: Instrucciones para configurar USDC
- `VERCEL_ENV_VARIABLES.md`: Variables de entorno con USDC
- `README.md`: Menciona USDC como token de apuestas

---

## 🔄 8. FLUJO DE USDC EN EL PROYECTO

### 8.1 Flujo de Apuestas
```
Usuario → Aprobar USDC → PredictionMarketCore
  ↓
PredictionMarketCore → Insurance Pool (0.1% fee)
  ↓
PredictionMarketCore → Market Contract (apuesta)
  ↓
Market Contract → Almacena USDC en pools
```

### 8.2 Flujo de Insurance Pool
```
Usuario → Deposita USDC → Insurance Pool
  ↓
Insurance Pool → 70% a Venus (vUSDC) para yield
  ↓
Insurance Pool → 30% líquido para claims
  ↓
Yield generado → Distribuido a depositantes
```

### 8.3 Flujo de Reputation Staking
```
Usuario → Stakes USDC → ReputationStaking
  ↓
ReputationStaking → Almacena USDC
  ↓
Usuario vota en disputes → Slashing/Rewards en USDC
```

---

## ⚠️ 9. PROBLEMAS DETECTADOS

### 9.1 Bug en DAOGovernance
**Ubicación**: `DAOGovernance.sol` línea 181

```solidity
// ❌ INCORRECTO (usa 18 decimales)
require(governanceToken.balanceOf(msg.sender) >= 100e18, ...);

// ✅ DEBERÍA SER (6 decimales para USDC)
require(governanceToken.balanceOf(msg.sender) >= 100e6, ...);
```

---

### 9.2 Inconsistencia en Decimales
Algunos contratos asumen 6 decimales (USDC), otros 18 (tokens estándar). Verificar siempre.

---

## ✅ 10. RECOMENDACIONES

### 10.1 Para Testing
1. **Usar MockUSDC**: Desplegar MockUSDC en testnet para testing sin USDC real
2. **Mintear tokens**: Usar función `mint()` de MockUSDC para obtener tokens

### 10.2 Para Producción
1. **Obtener USDC real**: Usar USDC oficial en opBNB Mainnet
2. **Verificar dirección**: Confirmar dirección de USDC en mainnet
3. **Configurar variables**: Actualizar `.env` con dirección correcta

### 10.3 Para Desarrollo
1. **Usar MockUSDC localmente**: Para tests unitarios
2. **Usar USDC testnet**: Para tests de integración
3. **Documentar cambios**: Si cambias de USDC a otro token

---

## 📊 11. RESUMEN POR MÓDULO

| Módulo | Uso de USDC | Cantidad Mínima | Decimales |
|--------|-------------|-----------------|-----------|
| **PredictionMarketCore** | Token de apuestas | 1 USDC | 6 |
| **InsurancePool** | Asset del vault | 10 USDC | 6 |
| **ReputationStaking** | Token de staking | 100 USDC | 6 |
| **DAOGovernance** | Token de governance | 100 USDC* | 6 |
| **BinaryMarket** | Token de apuestas | 1 USDC | 6 |
| **ConditionalMarket** | Token de apuestas | 1 USDC | 6 |
| **SubjectiveMarket** | Token de apuestas | 1 USDC | 6 |
| **OmniRouter** | Token de apuestas | 1 USDC | 6 |

*Nota: Hay un bug que usa 100e18 en lugar de 100e6

---

## 🔗 12. ENLACES ÚTILES

- **USDC opBNB Testnet**: `0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3`
- **Explorer**: https://testnet.opbnbscan.com/address/0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3
- **MockUSDC Contract**: `smart-contracts/contracts/mocks/MockUSDC.sol`

---

**Última actualización**: Noviembre 2025  
**Análisis completo**: ✅ 100% del proyecto analizado

