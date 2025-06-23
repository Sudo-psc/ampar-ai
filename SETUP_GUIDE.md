# Guia de Setup Rápido - ampar.ai

## ✅ Status Atual

Você completou com sucesso:
1. ✅ Estrutura do monorepo criada
2. ✅ Dependências base instaladas
3. ✅ Configurações principais criadas
4. ✅ Package.json inicial para apps/web e apps/api

## 🚀 Próximos Passos

### 1. Iniciar Docker (IMPORTANTE!)
```bash
# No macOS: Abra o Docker Desktop primeiro!
# Depois execute:
docker-compose up -d postgres redis pgadmin redisinsight
```

### 2. Verificar se os serviços estão rodando
```bash
docker-compose ps
```

### 3. Instalar dependências dos workspaces
```bash
# Na raiz do projeto
npm install
```

### 4. Criar estrutura básica do Next.js
```bash
cd apps/web
npx create-next-app@latest . --typescript --tailwind --app --no-src-dir
cd ../..
```

### 5. Criar estrutura básica do NestJS
```bash
cd apps/api
nest new . --skip-git --package-manager npm
cd ../..
```

## 📝 Comandos Úteis

### Docker
```bash
# Iniciar todos os serviços
docker-compose up -d

# Ver logs
docker-compose logs -f [service_name]

# Parar serviços
docker-compose down

# Limpar tudo (CUIDADO!)
docker-compose down -v
```

### Desenvolvimento
```bash
# Rodar todos os apps em dev
npm run dev

# Rodar apenas um app
npm run dev --workspace=@ampar/web

# Build de todos
npm run build

# Testes
npm test
```

## 🔗 URLs dos Serviços

Quando o Docker estiver rodando:
- **PostgreSQL**: `localhost:5432`
  - User: `ampar_user`
  - Password: `ampar_secure_password`
  - Database: `ampar_ai`

- **Redis**: `localhost:6379`
  - Password: `ampar_redis_password`

- **pgAdmin**: http://localhost:5050
  - Email: `admin@ampar.ai`
  - Password: `ampar_pgadmin_password`

- **RedisInsight**: http://localhost:8001

## ⚠️ Troubleshooting

### Docker não está rodando
```bash
# macOS
open -a Docker

# Linux
sudo systemctl start docker
```

### Erro de permissão
```bash
# Linux
sudo usermod -aG docker $USER
# Logout e login novamente
```

### Porta já em uso
```bash
# Verificar qual processo está usando a porta
lsof -i :5432  # ou outra porta

# Matar o processo
kill -9 [PID]
```

## 📚 Documentação

- [Plano de Sprint](docs/sprint-plan.md)
- [Dependências](docs/dependencies.md)
- [API OpenAPI](docs/api/openapi.yaml)

## 🔐 Segurança

**LEMBRE-SE**: 
- Nunca commite o arquivo `.env`
- Sempre use senhas fortes em produção
- Mantenha as dependências atualizadas 