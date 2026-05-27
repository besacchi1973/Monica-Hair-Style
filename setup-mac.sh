#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

clear

echo -e "${BLUE}"
echo "========================================="
echo "Monica Hair Style - Installation"
echo "========================================="
echo -e "${NC}"
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}[ERROR] Node.js is not installed!${NC}"
    echo "Download from: https://nodejs.org/"
    echo "Install Node.js 18+ and try again"
    exit 1
fi

echo -e "${GREEN}[OK] Node.js detected${NC}"
node --version
echo ""

# Check npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}[ERROR] npm is not installed!${NC}"
    exit 1
fi

echo -e "${GREEN}[OK] npm detected${NC}"
npm --version
echo ""

# MongoDB info
echo ""
echo -e "${BLUE}========================================="
echo "IMPORTANT: MongoDB Setup"
echo "=========================================${NC}"
echo ""
echo "Monica Hair Style requires MongoDB."
echo ""
echo -e "${YELLOW}Option 1: MongoDB Atlas (Cloud) - RECOMMENDED${NC}"
echo "  1. Go to: https://www.mongodb.com/cloud/atlas"
echo "  2. Create free account"
echo "  3. Create free database cluster"
echo "  4. Get connection string"
echo ""
echo -e "${YELLOW}Option 2: MongoDB Local${NC}"
echo "  1. Install: brew install mongodb-community"
echo "  2. Start: brew services start mongodb-community"
echo "  3. URI: mongodb://localhost:27017/monica-hair-style"
echo ""
echo "After setup, update .env.local with your connection string"
echo ""
read -p "Press Enter to continue..." -t 10 || true
echo ""

# Install dependencies
echo -e "${BLUE}========================================="
echo "Installing Dependencies"
echo "=========================================${NC}"
echo ""

# Frontend
echo -e "${YELLOW}[1/3] Installing Frontend...${NC}"
echo ""
cd frontend
npm install
if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR] Frontend installation failed!${NC}"
    exit 1
fi
echo -e "${GREEN}[OK] Frontend installed${NC}"
echo ""
cd ..

# Backend
echo -e "${YELLOW}[2/3] Installing Backend...${NC}"
echo ""
cd backend
npm install
if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR] Backend installation failed!${NC}"
    exit 1
fi
echo -e "${GREEN}[OK] Backend installed${NC}"
echo ""
cd ..

# Config
echo -e "${YELLOW}[3/3] Creating configuration...${NC}"
if [ ! -f .env.local ]; then
    cp .env.example .env.local
    echo -e "${GREEN}[OK] Created .env.local${NC}"
else
    echo -e "${GREEN}[OK] .env.local already exists${NC}"
fi
echo ""

echo ""
echo -e "${BLUE}========================================="
echo "Installation Complete!"
echo "=========================================${NC}"
echo ""
echo -e "${GREEN}NEXT STEPS:${NC}"
echo ""
echo "1. ${YELLOW}CONFIGURE DATABASE:${NC}"
echo "   - Open .env.local"
echo "   - Update MONGODB_URI with your connection string"
echo "   - Update JWT_SECRET with a random string"
echo ""
echo "2. ${YELLOW}START DEVELOPMENT:${NC}"
echo "   - Run: npm run dev"
echo "   - Frontend: http://localhost:5173"
echo "   - Backend: http://localhost:5000"
echo ""
echo "3. ${YELLOW}CREATE ACCOUNT:${NC}"
echo "   - Open http://localhost:5173"
echo "   - Create your account"
echo "   - Start managing your salon!"
echo ""
echo -e "${GREEN}Happy coding! 🚀✨${NC}"
echo ""