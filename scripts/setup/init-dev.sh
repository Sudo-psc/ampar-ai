#!/bin/bash

# ampar.ai Development Environment Setup Script
# This script sets up the development environment for the ampar.ai platform

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS or Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    print_info "Detected macOS"
    PLATFORM="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    print_info "Detected Linux"
    PLATFORM="linux"
else
    print_error "Unsupported operating system: $OSTYPE"
    exit 1
fi

# Check required tools
print_info "Checking required tools..."

check_command() {
    if ! command -v $1 &> /dev/null; then
        print_error "$1 is not installed. Please install $1 and try again."
        exit 1
    else
        print_success "$1 is installed"
    fi
}

check_command node
check_command npm
check_command docker
check_command docker-compose
check_command git

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    print_error "Node.js version 18 or higher is required. Current version: $(node -v)"
    exit 1
fi

# Check if Git repository exists
if [ ! -d .git ]; then
    print_warning "Not a Git repository. Initializing..."
    git init
    print_success "Git repository initialized"
else
    print_success "Git repository exists"
fi

# Check if Docker daemon is running
if ! docker info >/dev/null 2>&1; then
    print_error "Docker daemon is not running. Please start Docker and try again."
    print_info "On macOS: Open Docker Desktop application"
    print_info "On Linux: sudo systemctl start docker"
    exit 1
else
    print_success "Docker daemon is running"
fi

# Create .env file from example if it doesn't exist
if [ ! -f .env ]; then
    print_info "Creating .env file from env.example..."
    cp env.example .env
    print_success ".env file created. Please update it with your actual values."
else
    print_warning ".env file already exists. Skipping..."
fi

# Install dependencies
print_info "Installing npm dependencies..."
npm install

# Create necessary directories
print_info "Creating necessary directories..."
mkdir -p logs
mkdir -p uploads
mkdir -p tmp

# Set up Git hooks (only if husky is installed and git repo exists)
if [ -f "node_modules/.bin/husky" ] && [ -d .git ]; then
    print_info "Setting up Git hooks..."
    npx husky install
else
    print_warning "Skipping Git hooks setup (husky will be configured when git is ready)"
fi

# Check if we should start Docker containers
read -p "Do you want to start Docker containers now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Initialize database
    print_info "Starting Docker containers (this may take a few minutes)..."
    docker-compose up -d postgres redis pgadmin redisinsight

    # Wait for PostgreSQL to be ready
    print_info "Waiting for PostgreSQL to be ready..."
    sleep 15

    # Check PostgreSQL connection
    if docker-compose exec -T postgres pg_isready -U ampar_user -d ampar_ai >/dev/null 2>&1; then
        print_success "PostgreSQL is ready"
    else
        print_warning "PostgreSQL might not be ready yet. Please check logs with: docker-compose logs postgres"
    fi
else
    print_info "Skipping Docker containers. You can start them later with: docker-compose up -d"
fi

print_success "Initial setup complete!"
print_info ""
print_info "Next steps:"
print_info "1. Update the .env file with your actual configuration values"
print_info "2. Create initial package.json files in each workspace:"
print_info "   - Create apps/web/package.json for Next.js app"
print_info "   - Create apps/api/package.json for NestJS API"
print_info "   - Create other workspace packages as needed"
print_info "3. Install workspace dependencies"
print_info "4. Start the development servers with: npm run dev"
print_info ""
print_info "Available services (when Docker is running):"
print_info "   - PostgreSQL: localhost:5432 (ampar_user/ampar_secure_password)"
print_info "   - Redis: localhost:6379 (password: ampar_redis_password)"
print_info "   - pgAdmin: http://localhost:5050 (admin@ampar.ai/ampar_pgadmin_password)"
print_info "   - RedisInsight: http://localhost:8001"
print_info ""
print_info "To start all Docker services:"
print_info "   docker-compose up -d"
print_info ""
print_info "To view logs:"
print_info "   docker-compose logs -f [service_name]"
print_info ""
print_warning "Remember to keep your .env file secure and never commit it to version control!"

# Create a simple .gitignore if it doesn't exist
if [ ! -f .gitignore ]; then
    print_info "Creating .gitignore file..."
    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/
.nyc_output/

# Next.js
.next/
out/
build/
dist/

# Production
*.pid
*.seed
*.pid.lock

# Logs
logs/
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
lerna-debug.log*
.pnpm-debug.log*

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Turbo
.turbo/

# Docker
docker-compose.override.yml

# Temporary files
tmp/
temp/
uploads/

# Build artifacts
*.tsbuildinfo

# OS files
Thumbs.db
EOF
    print_success ".gitignore created"
fi 