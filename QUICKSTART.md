# 🚀 Quick Start - Publish Enumageddon to PyPI

## 5-Minute Setup to Get Your Package Live

### Step 1: Create PyPI Account (2 minutes)

1. Go to https://pypi.org/account/register/
2. Fill in username and password
3. Verify your email
4. (Optional but recommended) Enable 2FA at https://pypi.org/manage/account/

### Step 2: Generate API Token (1 minute)

1. Visit https://pypi.org/manage/account/tokens/
2. Click "Add API token"
3. Name it: `enumageddon-upload`
4. Scope: "Entire account"
5. Copy the token (you'll only see it once!)

### Step 3: Configure Local Authentication (1 minute)

Create `~/.pypirc` file with your token:

**On Windows (PowerShell):**
```powershell
$pypirc = @"
[pypi]
username = __token__
password = pypi-AgXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
"@

$pypirc | Out-File -Encoding UTF8 "$env:USERPROFILE\.pypirc"
```

**On Linux/Mac:**
```bash
cat > ~/.pypirc << EOF
[pypi]
username = __token__
password = pypi-AgXXXXXXXXXXXXXXXXXXXXXXXXXXXX
EOF
chmod 600 ~/.pypirc
```

### Step 4: Build Your Package (1 minute)

```bash
cd "C:\Users\madso\OneDrive\Documents\GitHub Project"
bash build.sh
```

This creates two distribution files in `dist/`:
- `enumageddon-1.0.0.tar.gz` (source distribution)
- `enumageddon-1.0.0-py3-none-any.whl` (wheel binary)

### Step 5: Publish to PyPI (30 seconds)

```bash
twine upload dist/*
```

**Expected output:**
```
Uploading distributions to https://pypi.org/legacy/
Uploading enumageddon-1.0.0-py3-none-any.whl
100%|████████████████| 45.3k/45.3k [00:02<00:00, 18.7kB/s]
Uploading enumageddon-1.0.0.tar.gz
100%|████████████████| 34.2k/34.2k [00:01<00:00, 32.1kB/s]

View at: https://pypi.org/project/enumageddon/1.0.0/
```

---

## ✅ You're Done!

Your package is now live on PyPI! Users worldwide can install it with:

```bash
pip install enumageddon
enumageddon --help
```

---

## 🧪 Want to Test First? (TestPyPI)

Before publishing to production, test on TestPyPI:

### 1. Create TestPyPI Account
Go to https://test.pypi.org/account/register/ and create an account

### 2. Generate Test Token
Visit https://test.pypi.org/manage/account/tokens/ and create a token

### 3. Add to ~/.pypirc
```ini
[testpypi]
username = __token__
password = pypi-AgXXXXXXXXXXX...
```

### 4. Upload to TestPyPI
```bash
twine upload --repository testpypi dist/*
```

### 5. Test Installation
```bash
pip install --index-url https://test.pypi.org/simple/ enumageddon
enumageddon --help
```

### 6. If Success, Publish to Production
```bash
twine upload dist/*
```

---

## 📊 What Happens Next?

### PyPI Processing (15-30 minutes)
- Your package is processed
- Metadata is validated
- Package becomes searchable

### User Installation Becomes Available
After 15 minutes, users can install via:

**Method 1: pip (Most Common)**
```bash
pip install enumageddon
enumageddon --help
```

**Method 2: pipx (Isolated)**
```bash
pipx install enumageddon
enumageddon --help
```

**Method 3: Docker (Containerized)**
```bash
docker build -t enumageddon .
docker run enumageddon --help
```

**Method 4: Source (Development)**
```bash
git clone <repo-url>
cd enumageddon
pip install -e .
enumageddon --help
```

---

## 🔄 Future Updates

When you want to release version 1.1.0:

### 1. Update Version Numbers
- Edit `setup.py`: change `version="1.0.0"` to `version="1.1.0"`
- Edit `pyproject.toml`: change `version = "1.0.0"` to `version = "1.1.0"`
- Edit `src/enumageddon/__init__.py`: update `__version__`

### 2. Update CHANGELOG
Add entry to README.md:
```markdown
## Changelog

### 1.1.0 (2025-01-15)
- New feature: X
- Bug fix: Y
- Improvement: Z

### 1.0.0 (2025-01-10)
- Initial release
```

### 3. Rebuild and Upload
```bash
rm -rf dist/ build/ *.egg-info
bash build.sh
twine upload dist/*
```

---

## 🆘 Troubleshooting

### Problem: "twine: command not found"
```bash
pip install twine
```

### Problem: "401 Unauthorized"
- Check your API token in ~/.pypirc
- Make sure it's a **PyPI token**, not TestPyPI
- Verify no typos in the token

### Problem: "403 Forbidden - Invalid authentication"
- Delete `~/.pypirc`
- Regenerate your API token
- Create new `.pypirc` with fresh token

### Problem: "Package already exists"
- You're trying to upload the same version twice
- Increment version number: 1.0.0 → 1.0.1
- Rebuild and upload again

### Problem: Build fails with missing setuptools
```bash
pip install --upgrade setuptools wheel build
bash build.sh
```

---

## 📊 Monitor Your Package

After publishing, monitor it at:
- **PyPI Page**: https://pypi.org/project/enumageddon/
- **Download Stats**: https://pypi.org/project/enumageddon/#history
- **JSON API**: https://pypi.org/pypi/enumageddon/json

---

## 🎯 Summary

| Step | Time | Action |
|------|------|--------|
| 1 | 2 min | Create PyPI account |
| 2 | 1 min | Generate API token |
| 3 | 1 min | Create ~/.pypirc |
| 4 | 1 min | Run `bash build.sh` |
| 5 | 30 sec | Run `twine upload dist/*` |
| **Total** | **~5 min** | **Package published!** |

---

## ✨ Congratulations!

Your package is now available to the entire Python community!

**Users can install with:**
```bash
pip install enumageddon
```

---

**Need help?** Visit:
- PyPI Publishing Guide: https://packaging.python.org/
- twine Documentation: https://twine.readthedocs.io/
- setuptools Guide: https://setuptools.pypa.io/
