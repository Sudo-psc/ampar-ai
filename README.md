# ampar.ai - Plataforma de Telemedicina Híbrida

## 🏥 Visão Geral

A ampar.ai é uma plataforma de telemedicina híbrida que combina triagem por IA, supervisão médica assíncrona e prescrição digital ICP-Brasil, oferecendo atendimento médico completo em até 7 minutos.

## 🎯 Objetivos Técnicos

- **Performance**: Latência de IA < 500ms, SLA uptime ≥ 99,5%
- **Escala**: 200.000 atendimentos/ano
- **Qualidade**: FNR da IA < 5%, NPS ≥ 70
- **Custo**: ≤ R$ 11/consulta

## 🏗️ Arquitetura

### Frontend
- **PWA**: Next.js 14 + React 18 (TypeScript)
- **UI**: Tailwind CSS + DaisyUI (dark mode)
- **i18n**: pt-BR/es-ES
- **Real-time**: WebRTC + WebSocket

### Backend
- **API**: Node.js 18 + NestJS
- **Database**: PostgreSQL + Supabase
- **Auth**: JWT/MFA
- **Cache**: Redis
- **Storage**: AWS S3

### IA e Integrações
- **Triagem**: LangChain + LLM hospedado
- **Prescrição**: Memed/Nexodata
- **Pagamento**: Iugu/Pagar.me
- **Logística**: Rappi/Loggi

### DevOps
- **Container**: Docker + Kubernetes
- **CI/CD**: GitHub Actions
- **Monitoring**: Prometheus + Grafana
- **Security**: SonarQube + Snyk

## 📁 Estrutura do Projeto

```
ampar.ai/
├── apps/
│   ├── web/                    # Next.js PWA
│   ├── api/                    # NestJS API Gateway
│   ├── ai-service/             # Serviço de IA
│   ├── medical-dashboard/      # Dashboard médico
│   └── admin-panel/           # Painel administrativo
├── packages/
│   ├── ui/                    # Componentes compartilhados
│   ├── types/                 # TypeScript types
│   ├── utils/                 # Utilitários
│   └── config/                # Configurações
├── services/
│   ├── auth/                  # Autenticação
│   ├── patient/               # Gestão de pacientes
│   ├── medical/               # Serviços médicos
│   ├── payment/               # Pagamentos
│   ├── prescription/          # Prescrições
│   ├── logistics/             # Logística
│   └── notification/          # Notificações
├── infrastructure/
│   ├── k8s/                   # Kubernetes manifests
│   ├── docker/                # Dockerfiles
│   ├── terraform/             # Infrastructure as Code
│   └── monitoring/            # Configs de monitoramento
├── docs/
│   ├── api/                   # Documentação da API
│   ├── architecture/          # Diagramas de arquitetura
│   ├── security/              # Documentação de segurança
│   └── compliance/            # Documentação regulatória
└── scripts/
    ├── setup/                 # Scripts de setup
    ├── migration/             # Migrações de DB
    └── deployment/            # Scripts de deploy
```

## 🚀 Quick Start

### Pré-requisitos
- Node.js 18+
- Docker & Docker Compose
- PostgreSQL 15+
- Redis 7+

### Instalação

```bash
# Clone o repositório
git clone https://github.com/ampar-ai/platform.git
cd platform

# Instale dependências
npm install

# Configure variáveis de ambiente
cp .env.example .env

# Inicie os serviços
docker-compose up -d

# Execute migrações
npm run db:migrate

# Inicie o desenvolvimento
npm run dev
```

## 🔒 Compliance e Segurança

- **LGPD**: Privacy by Design implementado
- **ISO 27001/27799**: Gestão de segurança da informação
- **CFM 2.314/2022**: Regulamentação de telemedicina
- **Lei 14.510/2022**: Marco legal do ambiente digital
- **RDC 657/2022**: Software como Dispositivo Médico

### Criptografia
- **At-rest**: AES-256
- **In-transit**: TLS 1.3
- **Keys**: AWS KMS

### Auditoria
- Logs imutáveis retidos por 2 anos
- SIEM 24x7 com Elastic
- Notificação ANPD em 72h

## 📊 Monitoramento

- **Métricas**: Prometheus + Grafana
- **Logs**: Loki
- **APM**: Jaeger
- **Uptime**: StatusPage

## 🧪 Testes

- **Unitários**: Jest + Testing Library
- **Integração**: Supertest
- **E2E**: Playwright
- **Carga**: Artillery
- **Segurança**: OWASP ZAP

### Cobertura Mínima
- Unitários: ≥ 80%
- Integração: ≥ 70%
- E2E: Fluxos críticos

## 📈 Métricas de Negócio

- **NPS**: ≥ 70
- **Conversão**: ≥ 85%
- **Tempo de Atendimento**: ≤ 7min
- **FNR da IA**: < 5%
- **Uptime**: ≥ 99,5%

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📞 Contato

- **Email**: dev@ampar.ai
- **Slack**: #ampar-dev
- **Docs**: https://docs.ampar.ai 