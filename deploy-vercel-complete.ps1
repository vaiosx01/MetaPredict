# Script completo para desplegar en Vercel con todas las variables actualizadas
# Incluye las nuevas direcciones de contratos desplegados

Write-Host "🚀 MetaPredict - Despliegue en Vercel" -ForegroundColor Cyan
Write-Host "=====================================`n" -ForegroundColor Cyan

# Cambiar al directorio frontend
Set-Location frontend

# Verificar autenticación
Write-Host "🔐 Verificando autenticación en Vercel..." -ForegroundColor Yellow
$user = vercel whoami 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ No estás autenticado. Ejecuta: vercel login" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Autenticado como: $user`n" -ForegroundColor Green

# Variables públicas con nuevas direcciones de contratos
Write-Host "📝 Configurando variables públicas (NEXT_PUBLIC_*)..." -ForegroundColor Yellow

$publicVars = @{
    "NEXT_PUBLIC_THIRDWEB_CLIENT_ID" = "3631641b29eb64f9b3e1b22a6a8d1a0f"
    "NEXT_PUBLIC_CHAIN_ID" = "5611"
    "NEXT_PUBLIC_OPBNB_TESTNET_RPC" = "https://opbnb-testnet-rpc.bnbchain.org"
    "NEXT_PUBLIC_OPBNB_MAINNET_RPC" = "https://opbnb-mainnet-rpc.bnbchain.org"
    
    # ✅ NUEVAS DIRECCIONES DE CONTRATOS (actualizadas desde deployment)
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
    
    # Variables adicionales
    "NEXT_PUBLIC_IPFS_GATEWAY_URL" = "https://ipfs.io/ipfs/"
    "NEXT_PUBLIC_API_URL" = "/api"
}

# Variables privadas
$privateVars = @{
    # AI Services
    "GEMINI_API_KEY" = "AIzaSyCJmpYkAx0-0ZnVt0sq_KW4Lg4XtcE4mHs"
    "GOOGLE_API_KEY" = "AIzaSyCJmpYkAx0-0ZnVt0sq_KW4Lg4XtcE4mHs"
    "GROQ_API_KEY" = "$env:GROQ_API_KEY"
    "OPENROUTER_API_KEY" = "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"
    
    # Gelato
    "GELATO_RELAY_API_KEY" = "PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_"
    "GELATO_AUTOMATE_API_KEY" = "PHzJr00HWZM2hiDuKYTtIANHsKQbjGfL6FOq4cjiDPY_"
    "GELATO_RPC_API_KEY" = "9204798d9d704f239b47867f60092ab1"
    "GELATO_RPC_URL_TESTNET" = "https://opbnb-testnet.gelato.digital/rpc/9204798d9d704f239b47867f60092ab1"
    
    # Venus
    "VENUS_API_URL" = "https://api.venus.io"
    "VENUS_TESTNET_API_URL" = "https://testnetapi.venus.io"
    "VENUS_USE_TESTNET" = "true"
    
    # Chainlink Data Streams
    "CHAINLINK_DATA_STREAMS_VERIFIER_PROXY" = "0x001225Aca0efe49Dbb48233aB83a9b4d177b581A"
    
    # RPC
    "RPC_URL_TESTNET" = "https://opbnb-testnet-rpc.bnbchain.org"
    "OPBNB_RPC_URL" = "https://opbnb-testnet-rpc.bnbchain.org"
    "OPBNB_CHAIN_ID" = "5611"
    
    # Environment
    "NODE_ENV" = "production"
    "CRON_SECRET" = "metapredict-cron-secret-2025-change-in-production"
}

# Función para agregar variable de entorno
function Add-VercelEnv {
    param(
        [string]$Key,
        [string]$Value,
        [string]$Environment = "production"
    )
    
    Write-Host "  Configurando $Key..." -ForegroundColor Gray -NoNewline
    
    # Usar echo para pasar el valor
    $Value | vercel env add $Key $Environment 2>&1 | Out-Null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅" -ForegroundColor Green
        return $true
    } else {
        Write-Host " ⚠️  (puede que ya exista)" -ForegroundColor Yellow
        # Intentar actualizar
        $Value | vercel env rm $Key $Environment --yes 2>&1 | Out-Null
        $Value | vercel env add $Key $Environment 2>&1 | Out-Null
        return $true
    }
}

# Configurar variables públicas
Write-Host "`n📝 Variables públicas:" -ForegroundColor Cyan
foreach ($key in $publicVars.Keys) {
    Add-VercelEnv -Key $key -Value $publicVars[$key] -Environment "production"
    Add-VercelEnv -Key $key -Value $publicVars[$key] -Environment "preview"
    Add-VercelEnv -Key $key -Value $publicVars[$key] -Environment "development"
}

# Configurar variables privadas
Write-Host "`n🔒 Variables privadas:" -ForegroundColor Cyan
foreach ($key in $privateVars.Keys) {
    Add-VercelEnv -Key $key -Value $privateVars[$key] -Environment "production"
    Add-VercelEnv -Key $key -Value $privateVars[$key] -Environment "preview"
    Add-VercelEnv -Key $key -Value $privateVars[$key] -Environment "development"
}

# Actualizar NEXT_PUBLIC_APP_URL después del deploy
Write-Host "`n⚠️  NOTA: Actualiza NEXT_PUBLIC_APP_URL después del deploy con la URL real de Vercel" -ForegroundColor Yellow

# Desplegar
Write-Host "`n🚀 Desplegando proyecto en Vercel (producción)..." -ForegroundColor Cyan
vercel --prod --yes

Write-Host "`n✅ ¡Despliegue completado!" -ForegroundColor Green
Write-Host "`n📋 Próximos pasos:" -ForegroundColor Yellow
Write-Host "  1. Obtén la URL del deploy desde Vercel Dashboard" -ForegroundColor White
Write-Host "  2. Actualiza NEXT_PUBLIC_APP_URL con esa URL" -ForegroundColor White
Write-Host "  3. Verifica que todos los contratos estén conectados correctamente" -ForegroundColor White

# Volver al directorio raíz
Set-Location ..

