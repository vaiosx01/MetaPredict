# Solución al Error "Only core"

## 🔍 Problema Identificado

El error "Only core" ocurre cuando intentas crear un mercado porque el contrato `BinaryMarket` (y otros contratos de mercado) tienen configurado un `coreContract` diferente al `PredictionMarketCore` actual.

### Causa Raíz

El contrato `BinaryMarket` tiene `coreContract` como `immutable`:

```solidity
address public immutable coreContract;
```

Esto significa que:
- El valor se establece **solo en el constructor** durante el despliegue
- **No se puede cambiar** después del despliegue
- Si se desplegó con la dirección incorrecta, **no hay forma de arreglarlo sin redesplegar**

### Flujo del Error

El error ocurre en dos situaciones:

#### 1. Al Crear un Mercado
1. Usuario intenta crear un mercado llamando a `PredictionMarketCore.createBinaryMarket()`
2. El Core llama internamente a `BinaryMarket.createMarket()`
3. `BinaryMarket` verifica que `msg.sender == coreContract` con el modificador `onlyCore()`
4. Si `coreContract` no coincide con la dirección del Core, falla con "Only core"

#### 2. Al Apostar en un Mercado
1. Usuario intenta apostar llamando a `PredictionMarketCore.placeBet()`
2. El Core llama internamente a `BinaryMarket.placeBet()` (línea 274 de `PredictionMarketCore.sol`)
3. `BinaryMarket` verifica que `msg.sender == coreContract` con el modificador `onlyCore()`
4. Si `coreContract` no coincide con la dirección del Core, falla con "Only core"

## ✅ Solución

### Opción 1: Verificar y Redesplegar (Recomendado)

1. **Verificar la configuración actual**:
   ```bash
   cd smart-contracts
   pnpm hardhat run scripts/check-contract-config.ts --network opBNBTestnet
   ```

2. **Si el `coreContract` es incorrecto**, necesitas:
   - Redesplegar `BinaryMarket` con la dirección correcta del Core
   - Redesplegar `ConditionalMarket` con la dirección correcta del Core
   - Redesplegar `SubjectiveMarket` con la dirección correcta del Core
   - Actualizar el `PredictionMarketCore` para usar las nuevas direcciones

### Opción 2: Cambiar el Diseño del Contrato (Futuro)

Para evitar este problema en el futuro, considera cambiar `coreContract` de `immutable` a una variable normal con una función `setCoreContract()` protegida por `onlyOwner`:

```solidity
address public coreContract; // Remover immutable

function setCoreContract(address _coreContract) external onlyOwner {
    require(_coreContract != address(0), "Invalid address");
    coreContract = _coreContract;
    emit CoreContractUpdated(_coreContract);
}
```

## 🔧 Script de Verificación

He creado un script para verificar la configuración:

```bash
cd smart-contracts
pnpm hardhat run scripts/check-contract-config.ts --network opBNBTestnet
```

Este script:
- Lee la dirección del `coreContract` desde `BinaryMarket`, `ConditionalMarket` y `SubjectiveMarket`
- Compara con la dirección esperada del Core
- Indica si hay un problema de configuración en cada contrato
- Proporciona instrucciones específicas para solucionar el problema

## 📋 Direcciones Actuales

Según `frontend/lib/contracts/addresses.ts`:

- **Core Contract**: `0x0bB2643aCE44Bbb4Fdcc3a4fC50eECbe3Ab4a76B`
- **Binary Market**: `0xA62769c5C4D3f9EB64964241cB1F145bB0294F7E`

El `BinaryMarket` debe tener `coreContract = 0x0bB2643aCE44Bbb4Fdcc3a4fC50eECbe3Ab4a76B`

## 🚀 Pasos para Redesplegar

Si necesitas redesplegar:

1. **Desplegar nuevos contratos de mercado** con la dirección correcta del Core:
   ```typescript
   const binaryMarket = await BinaryMarket.deploy(
     CORE_CONTRACT_ADDRESS // Usar la dirección correcta del Core
   );
   ```

2. **Actualizar el Core** para usar las nuevas direcciones:
   ```typescript
   await core.updateModule("binaryMarket", newBinaryMarketAddress);
   await core.updateModule("conditionalMarket", newConditionalMarketAddress);
   await core.updateModule("subjectiveMarket", newSubjectiveMarketAddress);
   ```

3. **Actualizar el frontend** con las nuevas direcciones en `addresses.ts`

## ⚠️ Nota Importante

Si los contratos ya están en producción con usuarios y fondos, **NO puedes simplemente redesplegar**. En ese caso:

1. Los contratos antiguos seguirán funcionando con la configuración antigua
2. Necesitarías migrar los datos a los nuevos contratos
3. Considera implementar un sistema de proxy o upgradeable contracts para el futuro

## 📝 Mejoras Implementadas

He mejorado el manejo de errores en el frontend para mostrar un mensaje más descriptivo cuando ocurre este error:

### En Creación de Mercados (`useCreateMarket.ts`)
- **Antes**: "Error creating binary market"
- **Ahora**: "Error de configuración: El contrato BinaryMarket no tiene configurado correctamente el coreContract. El contrato necesita ser redesplegado con la dirección correcta del Core Contract."

### En Apuestas (`usePlaceBet.ts`)
- **Antes**: "Error placing bet"
- **Ahora**: "Error de configuración: Los contratos no están correctamente vinculados. Verifica que el contrato core esté configurado en los contratos secundarios."

Esto ayuda a los desarrolladores a identificar el problema más rápidamente tanto al crear mercados como al apostar.

