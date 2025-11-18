# Script para configurar variables de entorno en Vercel
# Ejecuta este script después de proporcionar tus valores reales

$PROJECT_URL = "https://metapredict-aut8qvt0l-vaiosxs-projects.vercel.app"

Write-Host "🚀 Configurando variables de entorno para MetaPredict en Vercel..." -ForegroundColor Cyan
Write-Host ""

# Variables esenciales para el frontend
$envVars = @(
    @{Name="NEXT_PUBLIC_CHAIN_ID"; Value="5611"; Description="opBNB Testnet Chain ID"},
    @{Name="NEXT_PUBLIC_OPBNB_TESTNET_RPC"; Value="https://opbnb-testnet-rpc.bnbchain.org"; Description="opBNB Testnet RPC URL"},
    @{Name="NEXT_PUBLIC_OPBNB_MAINNET_RPC"; Value="https://opbnb-mainnet-rpc.bnbchain.org"; Description="opBNB Mainnet RPC URL"},
    @{Name="NEXT_PUBLIC_APP_URL"; Value=$PROJECT_URL; Description="Production App URL"},
    @{Name="NEXT_PUBLIC_API_URL"; Value="http://localhost:3001/api"; Description="Backend API URL (actualizar con tu backend)"},
    @{Name="NEXT_PUBLIC_IPFS_GATEWAY_URL"; Value="https://ipfs.io/ipfs/"; Description="IPFS Gateway URL"},
    @{Name="NODE_ENV"; Value="production"; Description="Node Environment"}
)

Write-Host "⚠️  IMPORTANTE: Necesitas configurar manualmente estas variables:" -ForegroundColor Yellow
Write-Host "   - NEXT_PUBLIC_THIRDWEB_CLIENT_ID (obligatorio)" -ForegroundColor Yellow
Write-Host "   - NEXT_PUBLIC_WALLETCONNECT_PROJECT_ID (opcional)" -ForegroundColor Yellow
Write-Host "   - GEMINI_API_KEY (si usas funcionalidad de AI)" -ForegroundColor Yellow
Write-Host "   - NEXT_PUBLIC_API_URL (actualizar con la URL de tu backend)" -ForegroundColor Yellow
Write-Host ""
Write-Host "📝 Para agregar variables, ejecuta:" -ForegroundColor Cyan
Write-Host "   vercel env add <NOMBRE_VARIABLE> production" -ForegroundColor White
Write-Host ""
Write-Host "O visita el dashboard de Vercel:" -ForegroundColor Cyan
Write-Host "   https://vercel.com/vaiosxs-projects/metapredict/settings/environment-variables" -ForegroundColor White
Write-Host ""

# Intentar agregar las variables automáticamente
foreach ($var in $envVars) {
    Write-Host "Agregando $($var.Name)..." -ForegroundColor Gray
    # Nota: vercel env add requiere entrada interactiva, así que esto es solo informativo
}

Write-Host ""
Write-Host "✅ Script completado. Configura las variables manualmente usando los comandos arriba." -ForegroundColor Green

