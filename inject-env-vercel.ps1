# Script para inyectar variables de entorno en Vercel
# Uso: .\inject-env-vercel.ps1

Write-Host "🔐 Inyectando variables de entorno en Vercel..." -ForegroundColor Cyan

# Leer variables de entorno del archivo env.example
$envFile = "..\env.example"

if (-not (Test-Path $envFile)) {
    Write-Host "❌ Error: No se encontró env.example" -ForegroundColor Red
    exit 1
}

# Variables críticas que necesitamos (con valores reales del env.example)
$envVars = @{
    # Frontend - Públicas
    "NEXT_PUBLIC_THIRDWEB_CLIENT_ID" = "3631641b29eb64f9b3e1b22a6a8d1a0f"
    "NEXT_PUBLIC_CHAIN_ID" = "5611"
    "NEXT_PUBLIC_OPBNB_TESTNET_RPC" = "https://opbnb-testnet-rpc.bnbchain.org"
    "NEXT_PUBLIC_OPBNB_MAINNET_RPC" = "https://opbnb-mainnet-rpc.bnbchain.org"
    "NEXT_PUBLIC_CORE_CONTRACT_ADDRESS" = "0x8BD96cfd4E9B9ad672698D6C18cece8248Fd34F8"
    "NEXT_PUBLIC_AI_ORACLE_ADDRESS" = "0xB937f6a00bE40500B3Da15795Dc72783b05c1D18"
    "NEXT_PUBLIC_INSURANCE_POOL_ADDRESS" = "0x4fec42A17F54870d104bEf233688dc9904Bbd58d"
    "NEXT_PUBLIC_REPUTATION_STAKING_ADDRESS" = "0xa62ba5700E24554D342133e326D7b5496F999108"
    "NEXT_PUBLIC_DAO_GOVERNANCE_ADDRESS" = "0x6B6a0Ad18f8E13299673d960f7dCeAaBfd64d82c"
    "NEXT_PUBLIC_OMNI_ROUTER_ADDRESS" = "0xeC153A56E676a34360B884530cf86Fb53D916908"
    "NEXT_PUBLIC_BINARY_MARKET_ADDRESS" = "0x4755014b4b34359c27B8A289046524E0987833F9"
    "NEXT_PUBLIC_CONDITIONAL_MARKET_ADDRESS" = "0x7597bdb2A69FA1D42b4fE8d3F08BF23688DA908a"
    "NEXT_PUBLIC_SUBJECTIVE_MARKET_ADDRESS" = "0x3973A4471D1CB66274E33dD7f9802b19D7bF6CDc"
    "NEXT_PUBLIC_USDC_ADDRESS" = "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3"
    "NEXT_PUBLIC_API_URL" = "/api"
    "NEXT_PUBLIC_IPFS_GATEWAY_URL" = "https://ipfs.io/ipfs/"
    
    # Backend - Privadas
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
    "VENUS_VTOKEN" = "0xe3923805f6E117E51f5387421240a86EF1570abC"
    "VENUS_VUSDC_ADDRESS" = "0xe3923805f6E117E51f5387421240a86EF1570abC"
    
    # Chainlink Data Streams
    "CHAINLINK_DATA_STREAMS_VERIFIER_PROXY" = "0x001225Aca0efe49Dbb48233aB83a9b4d177b581A"
    "CHAINLINK_DATA_STREAMS_BTC_USD_STREAM_ID" = "0x00039d9e45394f473ab1f050a1b963e6b05351e52d71e507509ada0c95ed75b8"
    "CHAINLINK_DATA_STREAMS_ETH_USD_STREAM_ID" = "0x000362205e10b3a147d02792eccee483dca6c7b44ecce7012cb8c6e0b68b3ae9"
    "CHAINLINK_DATA_STREAMS_USDT_USD_STREAM_ID" = "0x0003a910a43485e0685ff5d6d366541f5c21150f0634c5b14254392d1a1c06db"
    "CHAINLINK_DATA_STREAMS_BNB_USD_STREAM_ID" = "0x000335fd3f3ffa06cfd9297b97367f77145d7a5f132e84c736cc471dd98621fe"
    "CHAINLINK_DATA_STREAMS_SOL_USD_STREAM_ID" = "0x0003b778d3f6b2ac4991302b89cb313f99a42467d6c9c5f96f57c29c0d2bc24f"
    "CHAINLINK_DATA_STREAMS_USDC_USD_STREAM_ID" = "0x00038f83323b6b08116d1614cf33a9bd71ab5e0abf0c9f1b783a74a43e7bd992"
    "CHAINLINK_DATA_STREAMS_XRP_USD_STREAM_ID" = "0x0003c16c6aed42294f5cb4741f6e59ba2d728f0eae2eb9e6d3f555808c59fc45"
    "CHAINLINK_DATA_STREAMS_DOGE_USD_STREAM_ID" = "0x000356ca64d3b32135e17dc0dc721a645bf50d0303be8ceb2cdca0a50bab8fdc"
    
    # Chainlink CCIP
    "CHAINLINK_CCIP_ROUTER" = "0xD9182959D9771cc77e228cB3caFe671f45A37630"
    "LINK_TOKEN_ADDRESS" = "0x56E16E648c51609A14Eb14B99BAB771Bee797045"
    "CHAINLINK_CCIP_CHAIN_SELECTOR" = "13274425992935471758"
    
    # RPC
    "RPC_URL_TESTNET" = "https://opbnb-testnet-rpc.bnbchain.org"
    "OPBNB_RPC_URL" = "https://opbnb-testnet-rpc.bnbchain.org"
    "OPBNB_CHAIN_ID" = "5611"
    
    # Otros
    "NODE_ENV" = "production"
    "USDC_ADDRESS" = "0x845E27B8A4ad1Fe3dc0b41b900dC8C1Bb45141C3"
}

Write-Host "📋 Configurando $($envVars.Count) variables de entorno..." -ForegroundColor Yellow
Write-Host ""

$count = 0
$success = 0
$skipped = 0

foreach ($key in $envVars.Keys) {
    $value = $envVars[$key]
    $count++
    
    Write-Host "[$count/$($envVars.Count)] $key" -ForegroundColor Gray -NoNewline
    
    # Determinar entornos
    if ($key.StartsWith("NEXT_PUBLIC_")) {
        $envs = "production,preview,development"
    } else {
        $envs = "production"
    }
    
    # Intentar agregar la variable
    # Primero eliminamos si existe
    vercel env rm $key production --yes 2>&1 | Out-Null
    vercel env rm $key preview --yes 2>&1 | Out-Null
    vercel env rm $key development --yes 2>&1 | Out-Null
    
    # Agregar la variable con el valor
    $result = echo $value | vercel env add $key $envs 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅" -ForegroundColor Green
        $success++
    } else {
        Write-Host " ⚠️  (puede que ya exista)" -ForegroundColor Yellow
        $skipped++
    }
}

Write-Host ""
Write-Host "✅ Variables configuradas exitosamente: $success" -ForegroundColor Green
if ($skipped -gt 0) {
    Write-Host "⚠️  Variables omitidas: $skipped" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "✨ Variables de entorno inyectadas correctamente!" -ForegroundColor Cyan

