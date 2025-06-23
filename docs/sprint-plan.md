# Plano de Sprint - ampar.ai (4 semanas)

## Sprint 1: Fundação e Infraestrutura (Semana 1)

### Objetivos
- Configurar infraestrutura base
- Implementar autenticação e autorização
- Criar estrutura de monorepo
- Configurar CI/CD pipeline

### Histórias de Usuário

#### US-001: Setup do Monorepo
**Como** desenvolvedor  
**Quero** ter uma estrutura de monorepo configurada  
**Para** desenvolver de forma organizada e escalável  
**Pontos:** 5  
**Responsável:** DevOps Lead  

**Critérios de Aceite:**
- [ ] Estrutura de pastas criada
- [ ] Lerna/Nx configurado
- [ ] Scripts de build e test funcionando
- [ ] Documentação básica

#### US-002: Infraestrutura AWS
**Como** DevOps  
**Quero** ter a infraestrutura AWS configurada  
**Para** hospedar a aplicação de forma segura  
**Pontos:** 8  
**Responsável:** DevOps Lead  

**Critérios de Aceite:**
- [ ] EKS cluster configurado
- [ ] RDS PostgreSQL provisionado
- [ ] ElastiCache Redis configurado
- [ ] S3 buckets criados
- [ ] AWS KMS para criptografia
- [ ] VPC e subnets configuradas

#### US-003: Autenticação Base
**Como** usuário  
**Quero** me autenticar na plataforma  
**Para** acessar os serviços de forma segura  
**Pontos:** 13  
**Responsável:** Backend Lead  

**Critérios de Aceite:**
- [ ] Supabase Auth configurado
- [ ] JWT tokens implementados
- [ ] MFA por SMS/Email
- [ ] RBAC básico (Paciente, Médico, Admin)
- [ ] Rate limiting
- [ ] Logs de auditoria

#### US-004: CI/CD Pipeline
**Como** desenvolvedor  
**Quero** ter pipeline de CI/CD automatizado  
**Para** deployar com segurança e rapidez  
**Pontos:** 8  
**Responsável:** DevOps Lead  

**Critérios de Aceite:**
- [ ] GitHub Actions configurado
- [ ] Testes automatizados
- [ ] SonarQube integrado
- [ ] Snyk security scan
- [ ] Deploy automático staging
- [ ] Rollback automático

### Total Sprint 1: 34 pontos

---

## Sprint 2: Core do Frontend e IA (Semana 2)

### Objetivos
- Desenvolver PWA base
- Implementar serviço de IA para triagem
- Criar fluxo de onboarding
- Configurar monitoramento

### Histórias de Usuário

#### US-005: PWA Base
**Como** paciente  
**Quero** acessar a plataforma via PWA  
**Para** ter experiência mobile nativa  
**Pontos:** 13  
**Responsável:** Frontend Lead  

**Critérios de Aceite:**
- [ ] Next.js 14 configurado
- [ ] PWA instalável
- [ ] Tailwind + DaisyUI (dark mode)
- [ ] Responsivo desktop/mobile
- [ ] i18n pt-BR/es-ES
- [ ] Service Worker para offline

#### US-006: Onboarding LGPD
**Como** novo usuário  
**Quero** me cadastrar seguindo LGPD  
**Para** usar a plataforma de forma legal  
**Pontos:** 8  
**Responsável:** Frontend + Backend  

**Critérios de Aceite:**
- [ ] Formulário de cadastro
- [ ] Validação de CPF
- [ ] Consentimento LGPD explícito
- [ ] Verificação por email/SMS
- [ ] Termos de uso e privacidade
- [ ] Coleta mínima de dados

#### US-007: Serviço de IA - Triagem
**Como** paciente  
**Quero** ser triado por IA  
**Para** receber atendimento adequado  
**Pontos:** 21  
**Responsável:** AI Engineer + Backend  

**Critérios de Aceite:**
- [ ] LangChain configurado
- [ ] Modelo LLM hospedado em VPC
- [ ] Endpoint /triage implementado
- [ ] Resposta em formato SOAP
- [ ] Flag de escalonamento
- [ ] Latência < 500ms
- [ ] Fallback para erro

#### US-008: Chat Interface
**Como** paciente  
**Quero** conversar com a IA via chat  
**Para** fazer minha triagem  
**Pontos:** 13  
**Responsável:** Frontend Lead  

**Critérios de Aceite:**
- [ ] Interface de chat responsiva
- [ ] Suporte a voz (Speech-to-Text)
- [ ] Perguntas dinâmicas
- [ ] Indicadores de digitação
- [ ] Histórico de mensagens
- [ ] Fallback telefônico

#### US-009: Monitoramento Base
**Como** DevOps  
**Quero** monitorar a aplicação  
**Para** garantir SLA de 99,5%  
**Pontos:** 8  
**Responsável:** DevOps Lead  

**Critérios de Aceite:**
- [ ] Prometheus configurado
- [ ] Grafana dashboards
- [ ] Alertas críticos
- [ ] Health checks
- [ ] Métricas de latência
- [ ] Uptime monitoring

### Total Sprint 2: 63 pontos

---

## Sprint 3: Atendimento Médico e Integrações (Semana 3)

### Objetivos
- Implementar videochamadas
- Desenvolver painel médico
- Integrar prescrição digital
- Configurar pagamentos

### Histórias de Usuário

#### US-010: Videochamada WebRTC
**Como** médico  
**Quero** fazer videochamada com paciente  
**Para** realizar consulta remota  
**Pontos:** 21  
**Responsável:** Frontend + Backend  

**Critérios de Aceite:**
- [ ] WebRTC implementado
- [ ] Qualidade 1080p
- [ ] Compartilhamento de tela
- [ ] Gravação (opcional)
- [ ] Chat durante chamada
- [ ] Controles de áudio/vídeo
- [ ] Fallback para problemas de conexão

#### US-011: Painel Médico
**Como** médico  
**Quero** ter painel de atendimento  
**Para** gerenciar consultas eficientemente  
**Pontos:** 13  
**Responsável:** Frontend Lead  

**Critérios de Aceite:**
- [ ] Fila de pacientes em tempo real
- [ ] Informações do paciente
- [ ] Histórico médico
- [ ] Triagem da IA visível
- [ ] Timer de consulta
- [ ] Status de disponibilidade

#### US-012: Escalonamento Automático
**Como** sistema  
**Quero** escalonar pacientes para médicos  
**Para** garantir atendimento adequado  
**Pontos:** 13  
**Responsável:** Backend Lead  

**Critérios de Aceite:**
- [ ] Algoritmo de priorização por risco
- [ ] Fila virtual com ETA
- [ ] Notificações em tempo real
- [ ] Balanceamento de carga médicos
- [ ] SLA de 5 minutos
- [ ] Fallback para sobrecarga

#### US-013: Prescrição Digital
**Como** médico  
**Quero** prescrever medicamentos digitalmente  
**Para** facilitar acesso do paciente  
**Pontos:** 21  
**Responsável:** Backend + Integration  

**Critérios de Aceite:**
- [ ] Integração Memed/Nexodata
- [ ] Assinatura ICP-Brasil
- [ ] QR-Code de verificação
- [ ] Template de receitas
- [ ] Validação de medicamentos
- [ ] Histórico de prescrições

#### US-014: Gateway de Pagamento
**Como** paciente  
**Quero** pagar a consulta  
**Para** completar o atendimento  
**Pontos:** 13  
**Responsável:** Backend + Integration  

**Critérios de Aceite:**
- [ ] Integração Iugu/Pagar.me
- [ ] Pagamento via Pix
- [ ] Cartão de crédito/débito
- [ ] Parcelamento
- [ ] Comprovantes automáticos
- [ ] Webhook de confirmação

### Total Sprint 3: 81 pontos

---

## Sprint 4: E-Pharmacy e Finalização (Semana 4)

### Objetivos
- Integrar farmácias para delivery
- Implementar dashboards operacionais
- Configurar logs de auditoria
- Testes de carga e segurança

### Histórias de Usuário

#### US-015: E-Pharmacy Integration
**Como** paciente  
**Quero** comprar medicamentos via app  
**Para** receber em casa rapidamente  
**Pontos:** 21  
**Responsável:** Backend + Integration  

**Critérios de Aceite:**
- [ ] Integração Rappi/Loggi
- [ ] Catálogo de medicamentos
- [ ] Checkout integrado
- [ ] Rastreamento em tempo real
- [ ] Notificações de entrega
- [ ] SLA de 2 horas

#### US-016: Dashboard Operacional
**Como** administrador  
**Quero** dashboards operacionais  
**Para** monitorar KPIs do negócio  
**Pontos:** 13  
**Responsável:** Frontend + Data  

**Critérios de Aceite:**
- [ ] Métricas de atendimento
- [ ] NPS em tempo real
- [ ] Conversão de onboarding
- [ ] Performance da IA
- [ ] Receita e custos
- [ ] Exportação CSV/JSON

#### US-017: Auditoria e Compliance
**Como** compliance officer  
**Quero** logs auditáveis  
**Para** atender regulamentações  
**Pontos:** 13  
**Responsável:** Backend + DevOps  

**Critérios de Aceite:**
- [ ] Logs imutáveis (append-only)
- [ ] Retenção de 2 anos
- [ ] Alertas de segurança
- [ ] Export para ANPD
- [ ] SIEM integrado
- [ ] Relatórios de compliance

#### US-018: Testes de Performance
**Como** QA  
**Quero** validar performance  
**Para** garantir SLAs  
**Pontos:** 8  
**Responsável:** QA + DevOps  

**Critérios de Aceite:**
- [ ] 3.000 consultas simultâneas
- [ ] p95 < 500ms no /triage
- [ ] Teste de stress
- [ ] Monitoramento de recursos
- [ ] Plano de escalabilidade
- [ ] Documentação de capacidade

#### US-019: Segurança e Pentest
**Como** security officer  
**Quero** validar segurança  
**Para** proteger dados sensíveis  
**Pontos:** 13  
**Responsável:** Security + DevOps  

**Critérios de Aceite:**
- [ ] OWASP Top 10 verificado
- [ ] Pentest automatizado
- [ ] Scan de dependências
- [ ] Certificação SSL/TLS
- [ ] Backup e recovery
- [ ] Plano de resposta a incidentes

#### US-020: Go-Live Preparation
**Como** product owner  
**Quero** preparar go-live  
**Para** lançar com qualidade  
**Pontos:** 8  
**Responsável:** Todo o time  

**Critérios de Aceite:**
- [ ] Ambiente de produção
- [ ] Runbooks operacionais
- [ ] Plano de rollback
- [ ] Treinamento de usuários
- [ ] Suporte 24x7
- [ ] Métricas de sucesso

### Total Sprint 4: 76 pontos

---

## Resumo Geral

### Distribuição de Pontos por Sprint
- **Sprint 1**: 34 pontos (Fundação)
- **Sprint 2**: 63 pontos (Core + IA)
- **Sprint 3**: 81 pontos (Atendimento)
- **Sprint 4**: 76 pontos (E-Pharmacy + Go-Live)

**Total**: 254 pontos em 4 semanas

### Equipe Sugerida (8 pessoas)
- **1 Product Owner** (20% dedicação)
- **1 Tech Lead** (100% dedicação)
- **2 Frontend Developers** (100% dedicação)
- **2 Backend Developers** (100% dedicação)
- **1 DevOps Engineer** (100% dedicação)
- **1 QA Engineer** (100% dedicação)

### Velocity Estimada
- **63,5 pontos/semana** (254 ÷ 4)
- **12,7 pontos/pessoa/semana** (254 ÷ 20 pessoas-semana)

### Riscos e Mitigações

#### Alto Risco
- **Integração com APIs externas**: Criar mocks para desenvolvimento paralelo
- **Compliance regulatório**: Consultoria jurídica especializada
- **Performance da IA**: Testes de carga desde Sprint 2

#### Médio Risco
- **WebRTC complexidade**: POC na Sprint 2
- **Escalabilidade**: Monitoramento desde Sprint 1

### Definição de Pronto (DoD)
- [ ] Código revisado e aprovado
- [ ] Testes unitários ≥ 80% cobertura
- [ ] Testes de integração passando
- [ ] Documentação atualizada
- [ ] Deploy em staging funcionando
- [ ] Aprovação do Product Owner

### Cerimônias
- **Daily**: 15min às 9h
- **Planning**: 4h no início de cada sprint
- **Review**: 2h no final de cada sprint
- **Retrospective**: 1h após review
- **Refinement**: 2h no meio da sprint 