# 🔐 Configurar Wallet de Deployment

## ⚠️ IMPORTANTE

Tu archivo `.env` está protegido y no puedo editarlo directamente por seguridad. Sigue estos pasos:

## 📝 Paso 1: Agregar Private Key al .env

Abre tu archivo `.env` en la **raíz del proyecto** y busca esta línea:

```env
PRIVATE_KEY=your_private_key_here
```

Reemplázala con:

```env
PRIVATE_KEY=2003f926c578fea4a77ffdd98a288a3297ee12b8893505562422dd258e4a5765
```

**Nota**: La private key debe estar **sin el prefijo `0x`** y sin espacios.

## 📋 Paso 2: Obtener Dirección del Wallet

Después de agregar la private key, ejecuta:

```bash
cd smart-contracts
node scripts/get-wallet-address.js
```

Esto mostrará:
- ✅ Tu dirección de wallet
- 🔗 Links a los faucets
- 📝 Instrucciones para obtener tokens

## 💧 Paso 3: Obtener Tokens Testnet

Una vez que tengas tu dirección de wallet, usa estos faucets:

### ⭐ Opción 1: L2Faucet (Recomendado - Más Rápido)

1. Visita: **https://www.l2faucet.com/opbnb**
2. Pega tu dirección de wallet
3. Asegúrate de estar en **opBNB Testnet** (Chain ID: 5611)
4. Haz clic en "Request"
5. Recibirás **0.01 tBNB** en unos segundos

### Opción 2: Thirdweb Faucet

1. Visita: **https://thirdweb.com/opbnb-testnet**
2. Conecta tu wallet o pega tu dirección
3. Solicita tokens
4. Recibirás **0.01 tBNB**

### Opción 3: BNB Chain Faucet (Más cantidad)

1. Visita: **https://testnet.bnbchain.org/faucet-smart**
2. Solicita tokens (recibirás en BSC Testnet)
3. Usa el bridge: **https://testnet.bnbchain.org/bridge**
4. Transfiere de BSC Testnet → opBNB Testnet
5. Recibirás **0.3 tBNB**

## ✅ Paso 4: Verificar Balance

Después de obtener tokens, verifica tu balance:

```bash
cd smart-contracts
pnpm run wallet:check
```

O:

```bash
node scripts/get-wallet-address.js
```

## 🎯 Resumen Rápido

1. ✅ Agrega `PRIVATE_KEY=2003f926c578fea4a77ffdd98a288a3297ee12b8893505562422dd258e4a5765` a tu `.env`
2. ✅ Ejecuta `node scripts/get-wallet-address.js` para ver tu dirección
3. 💧 Obtén tokens en https://www.l2faucet.com/opbnb
4. ✅ Verifica balance con `pnpm run wallet:check`
5. 🚀 Cuando tengas al menos 0.1 tBNB, puedes hacer deployment

## 🔒 Seguridad

- ✅ Tu `.env` está en `.gitignore` (no se commitea)
- ⚠️ **NUNCA** compartas tu private key
- ⚠️ **NUNCA** commitees archivos con private keys
- ⚠️ Usa esta wallet **SOLO** para deployment

---

**Para más detalles**: Ver `smart-contracts/FAUCETS_OPBNB.md`

