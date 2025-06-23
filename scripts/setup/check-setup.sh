#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}   ampar.ai Setup Verification  ${NC}"
echo -e "${BLUE}================================${NC}"
echo

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    print_success "Node.js installed: $NODE_VERSION"
else
    print_error "Node.js not installed"
fi

# Check npm
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm -v)
    print_success "npm installed: $NPM_VERSION"
else
    print_error "npm not installed"
fi

# Check Docker
if command -v docker &> /dev/null; then
    if docker info >/dev/null 2>&1; then
        print_success "Docker installed and running"
    else
        print_warning "Docker installed but daemon not running"
    fi
else
    print_error "Docker not installed"
fi

# Check Git
if [ -d .git ]; then
    print_success "Git repository initialized"
else
    print_warning "Not a Git repository"
fi

# Check .env file
if [ -f .env ]; then
    print_success ".env file exists"
else
    print_warning ".env file not found (copy from env.example)"
fi

# Check workspaces
echo
print_info "Checking workspaces..."

if [ -f apps/web/package.json ]; then
    print_success "Web app configured (Next.js)"
else
    print_error "Web app not configured"
fi

if [ -f apps/api/package.json ]; then
    print_success "API configured (NestJS)"
else
    print_error "API not configured"
fi

# Check node_modules
if [ -d node_modules ]; then
    print_success "Dependencies installed"
else
    print_error "Dependencies not installed (run: npm install)"
fi

# Check Docker containers
echo
print_info "Checking Docker containers..."

if docker ps --format '{{.Names}}' 2>/dev/null | grep -q ampar-postgres; then
    print_success "PostgreSQL container running"
else
    print_warning "PostgreSQL container not running"
fi

if docker ps --format '{{.Names}}' 2>/dev/null | grep -q ampar-redis; then
    print_success "Redis container running"
else
    print_warning "Redis container not running"
fi

echo
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}         Next Steps             ${NC}"
echo -e "${BLUE}================================${NC}"
echo

if ! docker info >/dev/null 2>&1; then
    echo "1. Start Docker Desktop"
fi

if [ ! -f .env ]; then
    echo "2. Copy env.example to .env and configure"
fi

echo "3. Start Docker containers:"
echo "   docker-compose up -d postgres redis pgadmin redisinsight"
echo
echo "4. Start development servers:"
echo "   npm run dev"
echo
echo "5. Access services:"
echo "   - Web app: http://localhost:3000"
echo "   - API: http://localhost:3001"
echo "   - pgAdmin: http://localhost:5050"
echo "   - RedisInsight: http://localhost:8001"
echo 