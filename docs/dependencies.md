# Dependências NPM - ampar.ai

## Frontend (Next.js PWA)

### Core Dependencies
- **next@14.0.0**: Framework React com SSR/SSG, escolhido por performance e SEO
- **react@18.2.0**: Biblioteca UI com concurrent features para melhor UX
- **react-dom@18.2.0**: Renderização React no DOM
- **typescript@5.3.0**: Type safety essencial para aplicação médica

### UI/UX
- **tailwindcss@3.3.0**: CSS utility-first para desenvolvimento rápido
- **daisyui@4.4.0**: Componentes Tailwind com dark mode nativo
- **@headlessui/react@1.7.0**: Componentes acessíveis WCAG 2.2 AA
- **animejs@3.2.2**: Animações performáticas
- **framer-motion@10.16.0**: Animações declarativas React

### PWA & Performance
- **next-pwa@5.6.0**: Service worker e manifest para PWA
- **workbox-webpack-plugin@7.0.0**: Cache strategies para offline
- **web-vitals@3.5.0**: Monitoramento Core Web Vitals

### Internacionalização
- **next-i18next@15.0.0**: i18n otimizado para Next.js
- **i18next@23.7.0**: Framework de internacionalização
- **react-i18next@13.5.0**: Bindings React para i18n

### WebRTC & Real-time
- **simple-peer@9.11.1**: WebRTC wrapper simplificado
- **socket.io-client@4.5.0**: WebSocket para real-time
- **mediasoup-client@3.6.0**: SFU client para videochamadas

### Forms & Validation
- **react-hook-form@7.48.0**: Forms performáticos
- **zod@3.22.0**: Schema validation type-safe
- **@hookform/resolvers@3.3.0**: Integração zod + react-hook-form

### State Management
- **zustand@4.4.0**: State management leve e simples
- **@tanstack/react-query@5.12.0**: Server state management
- **immer@10.0.0**: Immutable state updates

### Security
- **dompurify@3.0.0**: Sanitização XSS
- **helmet@7.1.0**: Security headers
- **bcryptjs@2.4.3**: Hash de senhas client-side

## Backend (NestJS)

### Core Dependencies
- **@nestjs/core@10.2.0**: Framework Node.js enterprise
- **@nestjs/common@10.2.0**: Decorators e utilities
- **@nestjs/platform-express@10.2.0**: Express adapter
- **rxjs@7.8.0**: Reactive programming

### Database & ORM
- **@prisma/client@5.7.0**: Type-safe ORM
- **prisma@5.7.0**: CLI e migrations
- **@supabase/supabase-js@2.39.0**: Supabase client
- **pg@8.11.0**: PostgreSQL driver

### Authentication & Security
- **@nestjs/jwt@10.2.0**: JWT implementation
- **@nestjs/passport@10.0.0**: Authentication middleware
- **passport-jwt@4.0.0**: JWT strategy
- **argon2@0.31.0**: Password hashing (mais seguro que bcrypt)
- **class-validator@0.14.0**: DTO validation
- **class-transformer@0.5.0**: Object transformation

### Cache & Session
- **@nestjs/cache-manager@2.1.0**: Cache abstraction
- **cache-manager-redis-store@3.0.0**: Redis cache
- **ioredis@5.3.0**: Redis client performático

### API Documentation
- **@nestjs/swagger@7.1.0**: OpenAPI generation
- **swagger-ui-express@5.0.0**: Swagger UI

### Monitoring & Logging
- **@nestjs/terminus@10.2.0**: Health checks
- **winston@3.11.0**: Structured logging
- **winston-loki@6.0.0**: Loki transport
- **prom-client@15.0.0**: Prometheus metrics

### Rate Limiting & Security
- **@nestjs/throttler@5.1.0**: Rate limiting
- **helmet@7.1.0**: Security headers
- **express-rate-limit@7.1.0**: Express rate limiter

## AI Service

### LangChain & LLM
- **langchain@0.0.212**: LLM orchestration
- **@langchain/openai@0.0.20**: OpenAI integration
- **@langchain/anthropic@0.0.10**: Anthropic integration
- **@langchain/google-genai@0.0.10**: Google Gemini integration

### Vector Database
- **@pinecone-database/pinecone@1.1.0**: Vector search
- **pgvector@0.1.0**: PostgreSQL vector extension

## Integrações Externas

### Payment Gateways
- **iugu@1.0.0**: Iugu SDK (custom wrapper)
- **pagarme@4.27.0**: Pagar.me SDK

### Digital Prescription
- **node-forge@1.3.0**: ICP-Brasil certificate handling
- **xml-crypto@4.0.0**: XML signature for prescriptions

### Logistics
- **axios@1.6.0**: HTTP client para APIs REST
- **node-fetch@3.3.0**: Fetch API para Node.js

### Notifications
- **twilio@4.19.0**: SMS notifications
- **@sendgrid/mail@8.1.0**: Email service
- **web-push@3.6.0**: Push notifications

## DevOps & Testing

### Testing
- **jest@29.7.0**: Test runner
- **@testing-library/react@14.1.0**: React testing
- **@testing-library/jest-dom@6.1.0**: DOM matchers
- **supertest@6.3.0**: API testing
- **@playwright/test@1.40.0**: E2E testing

### Build & Bundle
- **turbo@1.11.0**: Monorepo build system
- **webpack@5.89.0**: Module bundler
- **esbuild@0.19.0**: Fast bundler/minifier

### Code Quality
- **eslint@8.54.0**: Linting
- **prettier@3.1.0**: Code formatting
- **husky@8.0.0**: Git hooks
- **lint-staged@15.1.0**: Pre-commit linting

### Security Scanning
- **snyk@1.1266.0**: Vulnerability scanning
- **npm-audit-resolver@3.0.0**: Audit resolution

## Justificativas de Segurança

### Escolhas Críticas

1. **argon2 vs bcrypt**: Argon2 é mais resistente a ataques de força bruta e vencedor do Password Hashing Competition

2. **helmet**: Configura headers de segurança automaticamente (CSP, HSTS, etc.)

3. **dompurify**: Previne XSS ao sanitizar HTML dinâmico

4. **class-validator**: Validação robusta de DTOs previne injection attacks

5. **rate limiting**: Múltiplas camadas (@nestjs/throttler + express-rate-limit) para prevenir DDoS

### Práticas de Segurança

1. **Dependências mínimas**: Apenas pacotes essenciais para reduzir superfície de ataque

2. **Versões fixas**: Lock file rigoroso para prevenir supply chain attacks

3. **Auditoria regular**: `npm audit` executado em CI/CD

4. **Renovate bot**: Atualizações automáticas de segurança

5. **SAST**: SonarQube analisa dependências em busca de vulnerabilidades

### Compliance

- Todas as dependências são compatíveis com LGPD
- Nenhuma dependência envia telemetria sem consentimento
- Licenças verificadas para uso comercial
- Dependências de criptografia atendem ISO 27001

## Monitoramento de Dependências

```bash
# Verificar vulnerabilidades
npm audit

# Atualizar dependências de segurança
npm audit fix

# Scan profundo com Snyk
snyk test

# Verificar licenças
license-checker --production --summary
``` 