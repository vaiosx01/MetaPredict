# ✅ Checklist de Deployment en Vercel

## 📋 Pre-Deployment

### Código
- [x] Todas las rutas migradas a Next.js API Routes
- [x] URLs actualizadas de `localhost:3001` a `/api`
- [x] Servicios migrados a `frontend/lib/services/`
- [x] `vercel.json` configurado con cron jobs
- [x] `env.example` actualizado
- [ ] Código commiteado y pusheado a GitHub

### Testing Local
- [ ] Servidor de desarrollo iniciado: `cd frontend && pnpm dev`
- [ ] Rutas básicas probadas manualmente
- [ ] Script de testing ejecutado: `node frontend/test-api-routes.js`
- [ ] Sin errores de linting

---

## 🚀 Deployment

### Paso 1: Vercel Setup
- [ ] Cuenta de Vercel creada
- [ ] Repositorio conectado a Vercel
- [ ] Root Directory configurado (si aplica: `frontend/`)
- [ ] Framework detectado: Next.js

### Paso 2: Variables de Entorno
- [ ] Todas las variables de `VERCEL_ENV_VARIABLES.md` agregadas
- [ ] Variables marcadas para Production, Preview, Development
- [ ] `NEXT_PUBLIC_APP_URL` actualizado (después del primer deploy)
- [ ] `CRON_SECRET` generado y configurado

### Paso 3: Deploy
- [ ] Build exitoso
- [ ] Sin errores en el deployment
- [ ] URL de producción obtenida

---

## ✅ Post-Deployment

### Verificación de Rutas
- [ ] `GET /api/gelato/status` - ✅ Funciona
- [ ] `GET /api/oracle/status` - ✅ Funciona
- [ ] `GET /api/venus/markets` - ✅ Funciona
- [ ] `GET /api/markets` - ✅ Funciona
- [ ] `GET /api/reputation/leaderboard` - ✅ Funciona
- [ ] `GET /api/ai/test` - ✅ Funciona

### Verificación de Cron Job
- [ ] Cron job visible en Vercel Dashboard
- [ ] Primera ejecución exitosa (esperar 5 minutos)
- [ ] Logs sin errores
- [ ] Oracle Bot procesando eventos correctamente

### Verificación de Variables
- [ ] Variables de entorno cargadas correctamente
- [ ] API keys funcionando (Gemini, Groq, OpenRouter)
- [ ] Gelato configurado correctamente
- [ ] Contratos conectados correctamente

---

## 🔧 Troubleshooting

Si algo falla, revisa:

1. **Variables de entorno**: ¿Están todas configuradas?
2. **Logs de Vercel**: ¿Hay errores en los logs?
3. **Cron Job**: ¿Está activo en Vercel Dashboard?
4. **Build**: ¿El build fue exitoso?

---

## 📞 Soporte

- **Documentación**: Ver `VERCEL_DEPLOYMENT_GUIDE.md`
- **Variables**: Ver `VERCEL_ENV_VARIABLES.md`
- **Testing**: Ver `frontend/test-api-routes.js`

---

**¡Listo para deploy!** 🚀

