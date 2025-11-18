# 📋 Estado de Verificación de Contratos

## ✅ Contratos Verificados

1. **AIOracle** (`0xB937f6a00bE40500B3Da15795Dc72783b05c1D18`)
   - ✅ **VERIFICADO** en opBNBScan
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0xB937f6a00bE40500B3Da15795Dc72783b05c1D18#code)

## ⚠️ Contratos Pendientes de Verificación

Los siguientes contratos fueron desplegados pero no se han verificado aún (hubo errores temporales del explorador):

### Contratos Principales

2. **PredictionMarketCore** (`0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8)
   - **Constructor args**: 9 parámetros (USDC + 8 direcciones de contratos)

3. **InsurancePool** (`0x4fec42A17F54870d104bEf233688dc9904Bbd58d`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0x4fec42A17F54870d104bEf233688dc9904Bbd58d)
   - **Constructor args**: 4 parámetros (USDC, Venus vToken, name, symbol)

4. **ReputationStaking** (`0xa62ba5700E24554D342133e326D7b5496F999108`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0xa62ba5700E24554D342133e326D7b5496F999108)
   - **Constructor args**: 1 parámetro (USDC)

5. **DAOGovernance** (`0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c)
   - **Constructor args**: 2 parámetros (USDC, ReputationStaking)

6. **OmniRouter** (`0xeC153A56E676a34360B884530cf86Fb53D916908`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0xeC153A56E676a34360B884530cf86Fb53D916908)
   - **Constructor args**: 1 parámetro (USDC)

### Contratos de Mercados

7. **BinaryMarket** (`0x4755014b4b34359c27B8A289046524E0987833F9`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0x4755014b4b34359c27B8A289046524E0987833F9)
   - **Constructor args**: 2 parámetros (USDC, coreContract - temporalmente deployer)

8. **ConditionalMarket** (`0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a)
   - **Constructor args**: 2 parámetros (USDC, coreContract - temporalmente deployer)

9. **SubjectiveMarket** (`0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc`)
   - ⚠️ Pendiente verificación
   - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc)
   - **Constructor args**: 3 parámetros (USDC, coreContract, DAOGovernance)

### Integraciones

10. **ChainlinkDataStreamsIntegration** (`0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F`)
    - ⚠️ Pendiente verificación
    - 🔗 [Ver en opBNBScan](https://testnet.opbnbscan.com/address/0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F)
    - **Constructor args**: 1 parámetro (Verifier Proxy)

## 🔧 Comandos de Verificación

### 1. PredictionMarketCore (Core)

```bash
cd smart-contracts
pnpm hardhat verify --network opBNBTestnet \
  0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8 \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3" \
  "0x4755014b4b34359c27B8A289046524E0987833F9" \
  "0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a" \
  "0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc" \
  "0xB937f6a00bE40500B3Da15795Dc72783b05c1D18" \
  "0xa62ba5700E24554D342133e326D7b5496F999108" \
  "0x4fec42A17F54870d104bEf233688dc9904Bbd58d" \
  "0xeC153A56E676a34360B884530cf86Fb53D916908" \
  "0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c"
```

### 2. InsurancePool

```bash
pnpm hardhat verify --network opBNBTestnet \
  0x4fec42A17F54870d104bEf233688dc9904Bbd58d \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3" \
  "0xe3923805f6E117E51f5387421240a86EF1570abC" \
  "MetaPredict Insurance Shares" \
  "mpINS"
```

### 3. ReputationStaking

```bash
pnpm hardhat verify --network opBNBTestnet \
  0xa62ba5700E24554D342133e326D7b5496F999108 \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3"
```

### 4. DAOGovernance

```bash
pnpm hardhat verify --network opBNBTestnet \
  0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3" \
  "0xa62ba5700E24554D342133e326D7b5496F999108"
```

### 5. OmniRouter

```bash
pnpm hardhat verify --network opBNBTestnet \
  0xeC153A56E676a34360B884530cf86Fb53D916908 \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3"
```

### 6. BinaryMarket

```bash
pnpm hardhat verify --network opBNBTestnet \
  0x4755014b4b34359c27B8A289046524E0987833F9 \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3" \
  "0x8eC3829793D0a2499971d0D853935F17aB52F800"
```

**Nota**: El segundo parámetro es el deployer address (temporal), ya que el ownership fue transferido a Core después.

### 7. ConditionalMarket

```bash
pnpm hardhat verify --network opBNBTestnet \
  0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3" \
  "0x8eC3829793D0a2499971d0D853935F17aB52F800"
```

### 8. SubjectiveMarket

```bash
pnpm hardhat verify --network opBNBTestnet \
  0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc \
  "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3" \
  "0x8eC3829793D0a2499971d0D853935F17aB52F800" \
  "0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c"
```

### 9. ChainlinkDataStreamsIntegration

```bash
pnpm hardhat verify --network opBNBTestnet \
  0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F \
  "0x001225Aca0efe49Dbb48233aB83a9b4d177b581A"
```

## 🚀 Script de Verificación Automática

Puedes usar el script existente:

```bash
cd smart-contracts
pnpm hardhat run scripts/verify-contracts.ts --network opBNBTestnet
```

**Nota**: Este script necesita ser actualizado con las nuevas direcciones.

## 📊 Resumen

| Contrato | Dirección | Estado | Prioridad |
|----------|-----------|--------|-----------|
| AIOracle | `0xB937f6a00bE40500B3Da15795Dc72783b05c1D18` | ✅ Verificado | - |
| Core | `0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8` | ⚠️ Pendiente | 🔴 Alta |
| InsurancePool | `0x4fec42A17F54870d104bEf233688dc9904Bbd58d` | ⚠️ Pendiente | 🟡 Media |
| ReputationStaking | `0xa62ba5700E24554D342133e326D7b5496F999108` | ⚠️ Pendiente | 🟡 Media |
| DAOGovernance | `0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c` | ⚠️ Pendiente | 🟡 Media |
| OmniRouter | `0xeC153A56E676a34360B884530cf86Fb53D916908` | ⚠️ Pendiente | 🟢 Baja |
| BinaryMarket | `0x4755014b4b34359c27B8A289046524E0987833F9` | ⚠️ Pendiente | 🟡 Media |
| ConditionalMarket | `0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a` | ⚠️ Pendiente | 🟡 Media |
| SubjectiveMarket | `0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc` | ⚠️ Pendiente | 🟡 Media |
| DataStreamsIntegration | `0xe1a2ac2d4269400904A7240B2B3Cef20DBE7939F` | ⚠️ Pendiente | 🟢 Baja |

## ⚠️ Notas Importantes

1. **Core Contract** es el más importante - es el contrato principal que coordina todo
2. Los **Market Contracts** usan el deployer address en el constructor (temporal), pero el ownership fue transferido a Core
3. Si hay errores temporales del explorador, espera unos minutos y reintenta
4. Puedes verificar contratos manualmente desde opBNBScan usando "Verify Contract"

---

**Total**: 1/10 verificados, 9/10 pendientes

