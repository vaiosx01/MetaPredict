# Script para inyectar variables de entorno y desplegar en Vercel
# Uso: .\deploy-vercel.ps1

Write-Host "🚀 Iniciando deployment en Vercel..." -ForegroundColor Cyan

# Cambiar al directorio frontend
Set-Location frontend

# Verificar que estamos en el directorio correcto
if (-not (Test-Path "package.json")) {
    Write-Host "❌ Error: No se encontró package.json. Asegúrate de estar en el directorio frontend." -ForegroundColor Red
    exit 1
}

# Leer variables de entorno del archivo env.example en el directorio raíz
$envFile = Join-Path (Split-Path (Get-Location).Path) "env.example"

if (-not (Test-Path $envFile)) {
    Write-Host "❌ Error: No se encontró env.example en el directorio raíz." -ForegroundColor Red
    exit 1
}

Write-Host "📋 Leyendo variables de entorno de env.example..." -ForegroundColor Yellow

# Leer y parsear variables de entorno
$envVars = @{}
Get-Content $envFile | ForEach-Object {
    $line = $_.Trim()
    # Ignorar comentarios y líneas vacías
    if ($line -and -not $line.StartsWith("#") -and $line.Contains("=")) {
        $parts = $line.Split("=", 2)
        if ($parts.Length -eq 2) {
            $key = $parts[0].Trim()
            $value = $parts[1].Trim()
            # Ignorar valores placeholder genéricos
            if ($value -and $value -notmatch "^(your_|change_|localhost|http://localhost|postgresql://user:password)" -and $value -ne "0x0000000000000000000000000000000000000000") {
                $envVars[$key] = $value
            }
        }
    }
}

Write-Host "✅ Encontradas $($envVars.Count) variables de entorno válidas" -ForegroundColor Green

# Inyectar variables en Vercel
Write-Host "`n🔐 Inyectando variables de entorno en Vercel..." -ForegroundColor Cyan
$count = 0
$errors = 0

foreach ($key in $envVars.Keys) {
    $value = $envVars[$key]
    $count++
    
    Write-Host "[$count/$($envVars.Count)] Configurando $key..." -ForegroundColor Gray
    
    # Determinar el entorno (production, preview, development)
    # Variables NEXT_PUBLIC_* van a todos los entornos
    # Variables privadas solo a production
    if ($key.StartsWith("NEXT_PUBLIC_")) {
        $envs = "production,preview,development"
    } else {
        $envs = "production"
    }
    
    # Usar vercel env add con --yes para no interactivo
    $result = vercel env add $key $envs --yes 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        # Si la variable ya existe, actualizarla
        Write-Host "  → Variable ya existe, actualizando..." -ForegroundColor Yellow
        # Verificar si existe y eliminarla primero
        vercel env rm $key production --yes 2>&1 | Out-Null
        vercel env add $key $envs --yes 2>&1 | Out-Null
    }
    
    # Establecer el valor usando echo y pipe
    echo $value | vercel env add $key $envs --yes 2>&1 | Out-Null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✅ $key configurada" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  Error al configurar $key (puede que ya exista)" -ForegroundColor Yellow
        $errors++
    }
}

Write-Host "`n✅ Variables de entorno configuradas: $($envVars.Count - $errors)" -ForegroundColor Green
if ($errors -gt 0) {
    Write-Host "⚠️  Errores: $errors (algunas variables pueden ya existir)" -ForegroundColor Yellow
}

# Actualizar NEXT_PUBLIC_APP_URL después de obtener la URL del proyecto
Write-Host "`n🌐 Obteniendo URL del proyecto..." -ForegroundColor Cyan
$projectInfo = vercel inspect 2>&1
$projectUrl = "https://metapredict.vercel.app"  # URL por defecto, se actualizará después del deploy

# Desplegar en producción
Write-Host "`n🚀 Desplegando en Vercel (producción)..." -ForegroundColor Cyan
Write-Host "Esto puede tardar varios minutos..." -ForegroundColor Yellow

$deployResult = vercel --prod --yes

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ Deployment exitoso!" -ForegroundColor Green
    
    # Extraer URL del deployment
    $deploymentUrl = ($deployResult | Select-String -Pattern "https://.*\.vercel\.app").Matches.Value
    if ($deploymentUrl) {
        Write-Host "🌐 URL del deployment: $deploymentUrl" -ForegroundColor Cyan
        
        # Actualizar NEXT_PUBLIC_APP_URL
        Write-Host "`n🔄 Actualizando NEXT_PUBLIC_APP_URL..." -ForegroundColor Yellow
        echo $deploymentUrl | vercel env add NEXT_PUBLIC_APP_URL production,preview,development --yes 2>&1 | Out-Null
        
        Write-Host "✅ NEXT_PUBLIC_APP_URL actualizado a: $deploymentUrl" -ForegroundColor Green
    }
    
    Write-Host "`n📊 Resumen:" -ForegroundColor Cyan
    Write-Host "  - Variables configuradas: $($envVars.Count)" -ForegroundColor White
    Write-Host "  - Deployment URL: $deploymentUrl" -ForegroundColor White
    Write-Host "`n✨ ¡Deployment completado exitosamente!" -ForegroundColor Green
} else {
    Write-Host "`n❌ Error en el deployment. Revisa los logs arriba." -ForegroundColor Red
    exit 1
}

# Volver al directorio raíz
Set-Location ..

