#!/bin/bash
# Build and publish Enumageddon to PyPI

set -e

echo "[*] Building Enumageddon package..."

# Clean previous builds
rm -rf build/ dist/ *.egg-info

# Install build tools
pip install --upgrade build twine

# Build distribution
python -m build

echo "[+] Build successful!"
echo ""
echo "[*] Package files:"
ls -lh dist/

echo ""
echo "[!] To publish to PyPI, run:"
echo "    twine upload dist/*"
echo ""
echo "[!] Or to test on TestPyPI first:"
echo "    twine upload --repository testpypi dist/*"
