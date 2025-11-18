# 💰 Cómo Obtener USDC en opBNB Testnet - Todas las Opciones

## 🎯 Resumen Rápido

**Red**: opBNB Testnet (Chain ID: 5611)  
**USDC Address**: `0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3`  
**⚠️ NO está en Ethereum ni BSC directamente**

---

## ✅ OPCIÓN 1: Desplegar MockUSDC (⭐ MÁS FÁCIL Y RÁPIDA)

### Ventajas
- ✅ No necesitas USDC real
- ✅ Puedes mintear tokens ilimitados
- ✅ Funciona perfecto para testing
- ✅ Solo necesitas tBNB para gas

### Pasos

1. **Desplegar MockUSDC**:
```bash
cd smart-contracts
npx hardhat run scripts/deploy-mock-usdc.ts --network opBNBTestnet
```

2. **Actualizar variables de entorno**:
```env
USDC_ADDRESS=0x...direccion_del_mock_usdc...
NEXT_PUBLIC_USDC_ADDRESS=0x...direccion_del_mock_usdc...
```

3. **Mintear más tokens si necesitas**:
```typescript
// En una consola Hardhat o script
const mockUSDC = await ethers.getContractAt("MockUSDC", "0x...direccion...");
await mockUSDC.mint("0xTuDireccion", 10000); // 10,000 USDC
```

---

## ✅ OPCIÓN 2: Bridge desde BSC Testnet

### Pasos

1. **Obtener USDC en BSC Testnet**:
   - Ve a: https://testnet.bnbchain.org/faucet-smart
   - Solicita tBNB
   - Usa un DEX en BSC Testnet para cambiar tBNB → USDC
   - O pide USDC en comunidades de BSC Testnet

2. **Bridge a opBNB Testnet**:
   - Ve a: https://testnet.bnbchain.org/bridge
   - Conecta tu wallet
   - Selecciona: **BSC Testnet** → **opBNB Testnet**
   - Selecciona USDC como token
   - Ingresa cantidad
   - Confirma transacción

---

## ✅ OPCIÓN 3: Obtener USDC desde Ethereum Testnet

### Pasos

1. **Obtener USDC en Ethereum Sepolia/Goerli**:
   - Usa faucets de Ethereum testnet
   - Obtén USDC de testnet

2. **Bridge cross-chain**:
   - Usa un bridge que soporte Ethereum → opBNB
   - **Nota**: Esto puede ser complicado, no todos los bridges soportan opBNB

---

## ✅ OPCIÓN 4: Usar USDT en lugar de USDC

Si encuentras USDT en opBNB Testnet:

1. **Buscar dirección de USDT**:
   - Verifica en opBNBScan: https://testnet.opbnbscan.com/
   - Busca "USDT" en el explorador

2. **Actualizar configuración**:
```env
USDC_ADDRESS=0x...direccion_usdt...
NEXT_PUBLIC_USDC_ADDRESS=0x...direccion_usdt...
```

3. **Verificar decimales**:
   - Si USDT tiene 6 decimales: ✅ Funciona sin cambios
   - Si USDT tiene 18 decimales: Necesitas ajustar el código

---

## ✅ OPCIÓN 5: Pedir en Comunidades

### Discord/Telegram de BNB Chain

1. **BNB Chain Discord**:
   - Únete al servidor oficial
   - Pide USDC de testnet en el canal de desarrollo
   - Comparte tu dirección: `0xTuDireccion`

2. **Telegram de opBNB**:
   - Busca grupos de desarrolladores de opBNB
   - Pide tokens de testnet

3. **Foros de desarrollo**:
   - Stack Overflow
   - Reddit r/BNBChain
   - GitHub Discussions

---

## ✅ OPCIÓN 6: Crear tu propio Faucet

Si tienes acceso a USDC en otra red:

1. **Desplegar contrato de faucet**:
```solidity
contract USDCFaucet {
    IERC20 public usdc;
    
    function requestTokens() external {
        usdc.transfer(msg.sender, 1000 * 1e6); // 1000 USDC
    }
}
```

2. **Fundear con USDC**:
   - Deposita USDC en el contrato
   - Otros pueden solicitar tokens

---

## ✅ OPCIÓN 7: Usar un Exchange de Testnet

### Posibles exchanges en opBNB Testnet:

1. **PancakeSwap Testnet** (si está disponible):
   - https://pancakeswap.finance/
   - Cambia a opBNB Testnet
   - Swap tBNB → USDC

2. **Otros DEXs**:
   - Busca DEXs que soporten opBNB Testnet
   - Verifica en documentación de opBNB

---

## 🚀 RECOMENDACIÓN: Usar MockUSDC

**Para testing y desarrollo, la mejor opción es MockUSDC** porque:

1. ✅ **No dependes de tokens externos**
2. ✅ **Puedes mintear lo que necesites**
3. ✅ **Es gratis (solo gas)**
4. ✅ **Funciona exactamente igual que USDC real**
5. ✅ **No necesitas bridges ni exchanges**

### Script Completo

Ya creé el script `deploy-mock-usdc.ts` que:
- ✅ Despliega MockUSDC
- ✅ Mintea 10,000 USDC automáticamente
- ✅ Guarda la dirección en un archivo
- ✅ Te da instrucciones para actualizar .env

**Solo ejecuta**:
```bash
cd smart-contracts
npx hardhat run scripts/deploy-mock-usdc.ts --network opBNBTestnet
```

---

## 📋 Checklist de Opciones

- [ ] **Opción 1**: Desplegar MockUSDC ⭐ (Recomendada)
- [ ] **Opción 2**: Bridge desde BSC Testnet
- [ ] **Opción 3**: Bridge desde Ethereum Testnet
- [ ] **Opción 4**: Usar USDT en lugar de USDC
- [ ] **Opción 5**: Pedir en comunidades
- [ ] **Opción 6**: Crear tu propio faucet
- [ ] **Opción 7**: Usar exchange de testnet

---

## ⚠️ Notas Importantes

1. **opBNB ≠ BSC**: opBNB es una Layer 2, no es BSC directamente
2. **opBNB ≠ Ethereum**: Son redes completamente diferentes
3. **Testnet tokens**: Los tokens de testnet no tienen valor real
4. **MockUSDC**: Es perfecto para testing, no para producción

---

## 🔗 Enlaces Útiles

- **opBNBScan Testnet**: https://testnet.opbnbscan.com/
- **BNB Chain Bridge**: https://testnet.bnbchain.org/bridge
- **opBNB Docs**: https://docs.bnbchain.org/bnb-opbnb/
- **MockUSDC Contract**: `smart-contracts/contracts/mocks/MockUSDC.sol`

---

**¿Necesitas ayuda con alguna opción específica?** Puedo ayudarte a configurar MockUSDC o cualquier otra opción.

