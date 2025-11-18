# 💧 Obtener Tokens Testnet - Guía Rápida

## 📋 Tu Wallet

**Dirección**: `0x8ec3829793d0a2499971d0d853935f17ab52f800`

## 🎯 Opciones para Obtener Tokens Testnet

### ⭐ Opción 1: L2Faucet (RECOMENDADO - Más Rápido)

**URL**: https://www.l2faucet.com/opbnb

**Pasos**:
1. Visita el link arriba
2. Pega tu dirección: `0x8ec3829793d0a2499971d0d853935f17ab52f800`
3. Asegúrate de que esté seleccionado **opBNB Testnet**
4. Haz clic en "Request" o "Get Tokens"
5. Espera unos segundos
6. Recibirás **0.01 tBNB** directamente en opBNB Testnet

**Ventajas**:
- ✅ Deposita directamente en opBNB (sin bridge)
- ✅ Muy rápido (segundos)
- ✅ Fácil de usar

---

### Opción 2: Thirdweb Faucet

**URL**: https://thirdweb.com/opbnb-testnet

**Pasos**:
1. Visita el link arriba
2. Conecta tu wallet (MetaMask) o pega tu dirección
3. Selecciona **opBNB Testnet** en tu wallet
4. Solicita tokens
5. Recibirás **0.01 tBNB**

**Ventajas**:
- ✅ Interfaz moderna
- ✅ Confiable
- ✅ Directo a opBNB

---

### Opción 3: BNB Chain Faucet (Más Cantidad)

**URL**: https://testnet.bnbchain.org/faucet-smart

**Pasos**:
1. Visita el link arriba
2. Pega tu dirección: `0x8ec3829793d0a2499971d0d853935f17ab52f800`
3. Solicita tokens (recibirás en **BSC Testnet**)
4. Recibirás **0.3 tBNB** en BSC Testnet
5. **Necesitas hacer bridge a opBNB**:
   - Visita: https://testnet.bnbchain.org/bridge
   - Conecta tu wallet
   - Transfiere de BSC Testnet → opBNB Testnet

**Ventajas**:
- ✅ Más cantidad (0.3 tBNB)
- ⚠️ Requiere bridge (paso extra)

---

## 🎯 Estrategia Recomendada

Para obtener más tokens rápidamente, usa **múltiples faucets**:

1. **L2Faucet**: 0.01 tBNB (directo, rápido) ⭐
2. **Thirdweb**: 0.01 tBNB (directo, rápido)
3. **BNB Chain + Bridge**: 0.3 tBNB (más cantidad, requiere bridge)

**Total posible en un día**: ~0.32 tBNB

---

## ✅ Verificar Balance

Después de obtener tokens, verifica tu balance:

```bash
cd smart-contracts
pnpm run wallet:check
```

O visita el explorer:
- **opBNB Testnet Explorer**: https://opbnb-testnet.bscscan.com/address/0x8ec3829793d0a2499971d0d853935f17ab52f800

---

## 🔧 Configurar MetaMask (Si usas wallet)

Si vas a usar MetaMask para conectar a los faucets:

1. **Agregar opBNB Testnet a MetaMask**:
   - Network Name: `opBNB Testnet`
   - RPC URL: `https://opbnb-testnet-rpc.bnbchain.org`
   - Chain ID: `5611`
   - Currency Symbol: `tBNB`
   - Block Explorer: `https://opbnb-testnet.bscscan.com`

2. **O usar Chainlist** (más fácil):
   - Visita: https://chainlist.org
   - Busca "opBNB Testnet"
   - Conecta tu wallet
   - Haz clic en "Add to MetaMask"

---

## 📝 Links Directos

- **L2Faucet**: https://www.l2faucet.com/opbnb
- **Thirdweb**: https://thirdweb.com/opbnb-testnet
- **BNB Chain Faucet**: https://testnet.bnbchain.org/faucet-smart
- **Bridge BSC → opBNB**: https://testnet.bnbchain.org/bridge
- **Explorer**: https://opbnb-testnet.bscscan.com/address/0x8ec3829793d0a2499971d0d853935f17ab52f800

---

## ⚠️ Notas Importantes

- Los faucets tienen límites de **24 horas** por dirección
- Puedes usar **múltiples faucets** el mismo día
- Necesitas al menos **0.1 tBNB** para deployment completo
- Los tokens testnet **no tienen valor real**

---

## 🚀 Próximos Pasos

1. ✅ Obtén tokens de al menos uno de los faucets
2. ✅ Verifica tu balance
3. ✅ Cuando tengas al menos 0.1 tBNB, puedes hacer deployment:
   ```bash
   cd smart-contracts
   pnpm run deploy:testnet
   ```

---

**¿Problemas?** Verifica que:
- Tu dirección sea correcta: `0x8ec3829793d0a2499971d0d853935f17ab52f800`
- Estés usando opBNB Testnet (Chain ID: 5611)
- Hayas esperado el tiempo suficiente (puede tomar unos minutos)

