# Script para actualizar variables de entorno en Vercel con nuevas direcciones de contratos

Write-Host "🔄 Actualizando variables de entorno en Vercel..." -ForegroundColor Cyan
Write-Host "==============================================`n" -ForegroundColor Cyan

# Cambiar al directorio frontend
Push-Location frontend

# Nuevas direcciones de contratos
$contractAddresses = @{
    "NEXT_PUBLIC_CORE_CONTRACT_ADDRESS" = "0x0bB2643aCE44Bbb4Fdcc3a4fC50eECbe3Ab4a76B"
    "NEXT_PUBLIC_AI_ORACLE_ADDRESS" = "0xcc10a98Aa285E7bD16be1Ef8420315725C3dB66c"
    "NEXT_PUBLIC_INSURANCE_POOL_ADDRESS" = "0xD30B71e1Af743cD93b3b1d7d314822Bc4cd860dA"
    "NEXT_PUBLIC_REPUTATION_STAKING_ADDRESS" = "0x5935C4002Bf11eCD4525d60Ef7e2B949421E15E7"
    "NEXT_PUBLIC_DAO_GOVERNANCE_ADDRESS" = "0xC2eD64e39cD7A6Ab9448f14E1f965E1D1e819123"
    "NEXT_PUBLIC_BINARY_MARKET_ADDRESS" = "0xA62769c5C4D3f9EB64964241cB1F145bB0294F7E"
    "NEXT_PUBLIC_CONDITIONAL_MARKET_ADDRESS" = "0xd0FBDB61F04Cee610bF53eD1Bef4Bd2356EffF1b"
    "NEXT_PUBLIC_SUBJECTIVE_MARKET_ADDRESS" = "0xE933FB3bc9BfD23c0061E38a88b81702345E65d3"
    "NEXT_PUBLIC_OMNI_ROUTER_ADDRESS" = "0x11C1124384e463d99Ba84348280e318FbeE544d0"
    "NEXT_PUBLIC_DATA_STREAMS_INTEGRATION_ADDRESS" = "0x1758d4da0bAd4DB90Dfd56Be259C19cabDcF03fd"
}

$environments = @("production", "preview", "development")

Write-Host "📝 Actualizando direcciones de contratos...`n" -ForegroundColor Yellow

foreach ($key in $contractAddresses.Keys) {
    Write-Host "  $key" -ForegroundColor Cyan
    $value = $contractAddresses[$key]
    
    foreach ($env in $environments) {
        Write-Host "    [$env] " -ForegroundColor Gray -NoNewline
        
        # Eliminar variable existente
        vercel env rm $key $env --yes 2>&1 | Out-Null
        
        # Agregar nueva variable
        $value | vercel env add $key $env 2>&1 | Out-Null
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅" -ForegroundColor Green
        } else {
            Write-Host "❌ Error" -ForegroundColor Red
        }
    }
    Write-Host ""
}

Write-Host "✅ Variables actualizadas correctamente!`n" -ForegroundColor Green

# Volver al directorio anterior
Pop-Location

Write-Host "🚀 Listo para desplegar. Ejecuta: cd frontend; vercel --prod" -ForegroundColor Cyan

