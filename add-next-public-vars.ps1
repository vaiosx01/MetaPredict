# Script para agregar variables NEXT_PUBLIC_* una por una para cada entorno
# Uso: .\add-next-public-vars.ps1

Write-Host "Agregando variables NEXT_PUBLIC_* faltantes..." -ForegroundColor Cyan

# Variables NEXT_PUBLIC_* que necesitan estar en todos los entornos
$nextPublicVars = @{
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
}

$count = 0
$success = 0
$errors = 0

foreach ($key in $nextPublicVars.Keys) {
    $value = $nextPublicVars[$key]
    $count++
    
    Write-Host "[$count/$($nextPublicVars.Count)] Agregando $key..." -ForegroundColor Gray
    
    # Agregar para cada entorno por separado
    $envs = @("production", "preview", "development")
    
    foreach ($env in $envs) {
        Write-Host "  -> $env..." -ForegroundColor DarkGray -NoNewline
        
        # Intentar eliminar primero si existe
        vercel env rm $key $env --yes 2>&1 | Out-Null
        
        # Agregar la variable
        $result = Write-Output $value | vercel env add $key $env 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host " OK" -ForegroundColor Green
        } else {
            # Si ya existe, está bien
            if ($result -match "already exists") {
                Write-Host " OK (ya existe)" -ForegroundColor Yellow
            } else {
                Write-Host " ERROR" -ForegroundColor Red
                Write-Host "    $result" -ForegroundColor DarkRed
                $errors++
            }
        }
    }
    
    if ($errors -eq 0) {
        $success++
    }
    $errors = 0  # Reset para la siguiente variable
}

Write-Host ""
Write-Host "Variables NEXT_PUBLIC_* configuradas: $success/$($nextPublicVars.Count)" -ForegroundColor Green
Write-Host "Proceso completado!" -ForegroundColor Cyan
