# 🔐 Configuración del Wallet de Deployment

## ⚠️ IMPORTANTE - SEGURIDAD

**NUNCA** commitees tu archivo `.env` con la private key real. El archivo `.env` ya está en `.gitignore` y será ignorado por Git.

## 📝 Paso 1: Configurar Private Key

Agrega tu private key al archivo `.env` en la **raíz del proyecto**:

```env
PRIVATE_KEY=2003f926c578fea4a77ffdd98a288a3297ee12b8893505562422dd258e4a5765
```

**Nota**: La private key debe estar **sin el prefijo `0x`**.

## 📋 Paso 2: Verificar Wallet

Ejecuta este comando para verificar tu wallet y obtener la dirección:

```bash
cd smart-contracts
npx ts-node scripts/check-wallet-balance.ts
```

Esto mostrará:
- ✅ Tu dirección de wallet
- ✅ Balance actual en testnet
- ✅ Si necesitas más tokens

## 💧 Paso 3: Obtener Tokens Testnet

Una vez que tengas tu dirección de wallet, usa uno de estos faucets:

### Opción 1: L2Faucet (⭐ Recomendado)

1. Visita: **https://www.l2faucet.com/opbnb**
2. Conecta tu wallet (MetaMask) o pega tu dirección
3. Asegúrate de estar en **opBNB Testnet** (Chain ID: 5611)
4. Solicita tokens
5. Recibirás **0.01 tBNB** directamente en opBNB

### Opción 2: Thirdweb Faucet

1. Visita: **https://thirdweb.com/opbnb-testnet**
2. Conecta tu wallet
3. Solicita tokens
4. Recibirás **0.01 tBNB**

### Opción 3: BNB Chain Faucet (Más cantidad)

1. Visita: **https://testnet.bnbchain.org/faucet-smart**
2. Solicita tokens (recibirás en BSC Testnet)
3. Usa el bridge: **https://testnet.bnbchain.org/bridge**
4. Transfiere de BSC Testnet → opBNB Testnet
5. Recibirás **0.3 tBNB**

## 🎯 Estrategia Recomendada

Para obtener más tokens rápidamente:

1. **Usa L2Faucet**: 0.01 tBNB (directo, rápido)
2. **Usa Thirdweb**: 0.01 tBNB (directo, rápido)
3. **Usa BNB Chain + Bridge**: 0.3 tBNB (más cantidad, requiere bridge)

**Total posible en un día**: ~0.32 tBNB

## ✅ Verificar Configuración

Después de agregar la private key, verifica:

```bash
cd smart-contracts
npx ts-node scripts/check-wallet-balance.ts
```

Deberías ver:
- ✅ Tu dirección de wallet
- ✅ Balance actual (puede ser 0 si aún no has obtenido tokens)

## 🚀 Próximos Pasos

1. ✅ Agrega `PRIVATE_KEY` a tu `.env`
2. ✅ Verifica tu wallet con el script
3. 💧 Obtén tokens testnet de los faucets
4. ✅ Verifica balance nuevamente
5. 🚀 Cuando tengas al menos 0.1 tBNB, puedes hacer deployment

## 🔒 Seguridad

- ✅ `.env` está en `.gitignore` (no se commitea)
- ⚠️ **NUNCA** compartas tu private key
- ⚠️ **NUNCA** commitees archivos con private keys
- ⚠️ Usa esta wallet **SOLO** para deployment (no para fondos importantes)

---

**Para más detalles sobre faucets**: Ver `smart-contracts/FAUCETS_OPBNB.md`

