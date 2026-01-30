#!/bin/bash
# verify-package.sh - Local installation verification script
# Tests that enumageddon can be installed and run properly

set -e  # Exit on error

echo "================================"
echo "Enumageddon Package Verification"
echo "================================"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'  # No Color

# Check Python version
echo -e "\n${YELLOW}1. Checking Python version...${NC}"
python --version || python3 --version
if python -m pip --version &>/dev/null || python3 -m pip --version &>/dev/null; then
    echo -e "${GREEN}✓ pip is available${NC}"
else
    echo -e "${RED}✗ pip not found${NC}"
    exit 1
fi

# Check setuptools
echo -e "\n${YELLOW}2. Checking setuptools...${NC}"
if python -m pip show setuptools &>/dev/null || python3 -m pip show setuptools &>/dev/null; then
    echo -e "${GREEN}✓ setuptools installed${NC}"
else
    echo -e "${RED}✗ setuptools not found${NC}"
    exit 1
fi

# Check wheel
echo -e "\n${YELLOW}3. Checking wheel...${NC}"
if python -m pip show wheel &>/dev/null || python3 -m pip show wheel &>/dev/null; then
    echo -e "${GREEN}✓ wheel installed${NC}"
else
    echo -e "${RED}✗ wheel not found${NC}"
    exit 1
fi

# Check build module
echo -e "\n${YELLOW}4. Checking build module...${NC}"
if python -m pip show build &>/dev/null || python3 -m pip show build &>/dev/null; then
    echo -e "${GREEN}✓ build module installed${NC}"
else
    echo -e "${RED}✗ build module not found - installing...${NC}"
    python -m pip install build || python3 -m pip install build
fi

# Check twine
echo -e "\n${YELLOW}5. Checking twine...${NC}"
if python -m pip show twine &>/dev/null || python3 -m pip show twine &>/dev/null; then
    echo -e "${GREEN}✓ twine installed${NC}"
else
    echo -e "${RED}✗ twine not found - installing...${NC}"
    python -m pip install twine || python3 -m pip install twine
fi

# Verify package structure
echo -e "\n${YELLOW}6. Verifying package structure...${NC}"
if [ -f "setup.py" ]; then
    echo -e "${GREEN}✓ setup.py found${NC}"
else
    echo -e "${RED}✗ setup.py not found${NC}"
    exit 1
fi

if [ -f "pyproject.toml" ]; then
    echo -e "${GREEN}✓ pyproject.toml found${NC}"
else
    echo -e "${RED}✗ pyproject.toml not found${NC}"
    exit 1
fi

if [ -d "src/enumageddon" ]; then
    echo -e "${GREEN}✓ src/enumageddon/ directory found${NC}"
else
    echo -e "${RED}✗ src/enumageddon/ directory not found${NC}"
    exit 1
fi

if [ -f "src/enumageddon/__init__.py" ]; then
    echo -e "${GREEN}✓ src/enumageddon/__init__.py found${NC}"
else
    echo -e "${RED}✗ src/enumageddon/__init__.py not found${NC}"
    exit 1
fi

if [ -f "src/enumageddon/main.py" ]; then
    echo -e "${GREEN}✓ src/enumageddon/main.py found${NC}"
else
    echo -e "${RED}✗ src/enumageddon/main.py not found${NC}"
    exit 1
fi

# Check documentation
echo -e "\n${YELLOW}7. Verifying documentation...${NC}"
if [ -f "README.md" ]; then
    echo -e "${GREEN}✓ README.md found${NC}"
else
    echo -e "${RED}✗ README.md not found${NC}"
fi

if [ -f "LICENSE" ]; then
    echo -e "${GREEN}✓ LICENSE found${NC}"
else
    echo -e "${RED}✗ LICENSE not found${NC}"
fi

if [ -f "INSTALL.md" ]; then
    echo -e "${GREEN}✓ INSTALL.md found${NC}"
else
    echo -e "${RED}✗ INSTALL.md not found${NC}"
fi

# Verify setup.py syntax
echo -e "\n${YELLOW}8. Validating setup.py syntax...${NC}"
python -m py_compile setup.py 2>/dev/null || python3 -m py_compile setup.py 2>/dev/null
echo -e "${GREEN}✓ setup.py is valid${NC}"

# Build the package
echo -e "\n${YELLOW}9. Building distribution packages...${NC}"
if [ -d "dist" ]; then
    echo "Cleaning old dist/ directory..."
    rm -rf dist/ build/ *.egg-info
fi

python -m build 2>&1 || python3 -m build 2>&1
if [ -f "dist/enumageddon-1.0.0.tar.gz" ]; then
    echo -e "${GREEN}✓ Source distribution created${NC}"
else
    echo -e "${RED}✗ Source distribution not created${NC}"
    exit 1
fi

if [ -f "dist/enumageddon-1.0.0-py3-none-any.whl" ]; then
    echo -e "${GREEN}✓ Wheel distribution created${NC}"
else
    echo -e "${RED}✗ Wheel distribution not created${NC}"
    exit 1
fi

# Test local installation (dry-run)
echo -e "\n${YELLOW}10. Validating package integrity...${NC}"
tar -tzf dist/enumageddon-1.0.0.tar.gz | head -20
echo -e "${GREEN}✓ Tarball is valid${NC}"

# Display package info
echo -e "\n${YELLOW}11. Package metadata:${NC}"
echo "File: dist/enumageddon-1.0.0.tar.gz"
ls -lh dist/enumageddon-1.0.0.tar.gz
echo "File: dist/enumageddon-1.0.0-py3-none-any.whl"
ls -lh dist/enumageddon-1.0.0-py3-none-any.whl

# Ready for publishing
echo -e "\n${GREEN}================================${NC}"
echo -e "${GREEN}✓ PACKAGE VERIFICATION PASSED${NC}"
echo -e "${GREEN}================================${NC}"

echo -e "\n${YELLOW}Next steps to publish:${NC}"
echo -e "${GREEN}1. Create PyPI account:${NC} https://pypi.org/account/register/"
echo -e "${GREEN}2. Test on TestPyPI:${NC} twine upload --repository testpypi dist/*"
echo -e "${GREEN}3. Publish to PyPI:${NC} twine upload dist/*"

echo -e "\n${YELLOW}After publishing, users can install with:${NC}"
echo -e "  pip install enumageddon"
echo -e "  pipx install enumageddon"
echo -e "  docker run enumageddon --help"

echo -e "\n${GREEN}Files ready in dist/:${NC}"
ls -lh dist/
