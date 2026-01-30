# Installation Guide

Enumageddon can be installed in multiple ways:

## Option 1: pip (Python Package Manager)

The easiest and most universal way:

```bash
pip install enumageddon
```

Or with Python 3 explicitly:

```bash
pip3 install enumageddon
```

## Option 2: pipx (Isolated Python Environments)

pipx is recommended for tools, as it installs them in isolated environments:

```bash
pipx install enumageddon
```

Then use it from anywhere:

```bash
enumageddon -u https://target.com/FUZZ
enumageddon -k mycompany --aws --gcp --azure
```

## Option 3: apt (Linux Debian/Ubuntu)

After publishing to a PPA (Personal Package Archive):

```bash
sudo apt update
sudo apt install enumageddon
```

Then use it directly:

```bash
enumageddon -u https://target.com/FUZZ
```

## Option 4: From Source

Clone the repository and install:

```bash
git clone https://github.com/yourusername/enumageddon.git
cd enumageddon
pip install -e .
```

## Option 5: Docker

Build a Docker image:

```bash
docker build -t enumageddon .
docker run enumageddon -k mycompany --aws
```

## Verify Installation

After installation, verify it works:

```bash
enumageddon --help
```

You should see the help menu with all available options.

## Requirements

- Python 3.7 or higher
- requests >= 2.31.0
- dnspython >= 2.4.0
- python-dotenv >= 1.0.0

These are automatically installed when you use pip, pip3, or pipx.

## Troubleshooting

### "enumageddon: command not found"

If you installed with `pip` but can't find the command:
- Make sure `~/.local/bin` is in your PATH: `export PATH="$HOME/.local/bin:$PATH"`
- Or use `python -m enumageddon.main` instead

### Permission Issues

If you get permission errors:
```bash
pip install --user enumageddon
```

Or use pipx (recommended):
```bash
pipx install enumageddon
```

### Python Version Issues

Make sure you have Python 3.7+:
```bash
python --version
python3 --version
```

## Getting Started

Once installed, try these commands:

```bash
# Basic URL fuzzing
enumageddon -u https://example.com/FUZZ

# Cloud enumeration
enumageddon -k mycompany --aws

# Verbose output
enumageddon -k mycompany --aws -vv

# Save results
enumageddon -u https://example.com/FUZZ -o results.json
```

For more examples, see [README.md](README.md)
