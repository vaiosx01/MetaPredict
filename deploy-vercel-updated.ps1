# Script para desplegar en Vercel con todas las variables de entorno actualizadas
# Incluye las nuevas direcciones de contratos desplegados

Write-Host "🚀 Configurando variables de entorno en Vercel..." -ForegroundColor Cyan

# Variables públicas (NEXT_PUBLIC_*)
$publicVars = @{
    "NEXT_PUBLIC_THIRDWEB_CLIENT_ID" = "3631641b29eb64f9b3e1b22a6a8d1a0f"
    "NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID" = "your_walletconnect_project_id_here"
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
    "NEXT_PUBLIC_APP_URL" = "https://metapredict.vercel.app"
    "NEXT_PUBLIC_IPFS_GATEWAY_URL" = "https://ipfs.io/ipfs/"
    "NEXT_PUBLIC_API_URL" = "/api"
}

# Variables privadas (server-side)
$privateVars = @{
    # AI Services - Usar las claves que tengas configuradas
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
    
    # RPC
    "RPC_URL_TESTNET" = "https://opbnb-testnet-rpc.bnbchain.org"
    "OPBNB_RPC_URL" = "https://opbnb-testnet-rpc.bnbchain.org"
    "OPBNB_CHAIN_ID" = "5611"
    
    # Environment
    "NODE_ENV" = "production"
    "CRON_SECRET" = "metapredict-cron-secret-2025-change-in-production"
}

Write-Host "`n📝 Configurando variables públicas..." -ForegroundColor Yellow
foreach ($key in $publicVars.Keys) {
    Write-Host "  Setting $key..." -ForegroundColor Gray
    vercel env add $key production <# -NoNewline #> | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✅ $key" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  $key (puede que ya exista)" -ForegroundColor Yellow
    }
}

Write-Host "`n🔒 Configurando variables privadas..." -ForegroundColor Yellow
foreach ($key in $privateVars.Keys) {
    Write-Host "  Setting $key..." -ForegroundColor Gray
    vercel env add $key production <# -NoNewline #> | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✅ $key" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  $key (puede que ya exista)" -ForegroundColor Yellow
    }
}

Write-Host "`n🚀 Desplegando proyecto en Vercel..." -ForegroundColor Cyan
cd frontend
vercel --prod

Write-Host "`n✅ Despliegue completado!" -ForegroundColor Green

