# Passive Reconnaissance Tool - Development Guide

## Project Overview

A passive reconnaissance tool for bug bounty hunters to discover endpoints, APIs, and cloud services (AWS/GCP) from in-scope targets. Users define targets in `scope.txt` with wildcard pattern support.

## Key Features Implemented

- ✅ Scope file template (`scope.txt`) with clear examples
- ✅ Wildcard pattern support (`*.website.com` matches `www.dev.website.com`)
- ✅ Scope parser module with regex-based pattern matching
- ✅ CLI interface with multiple options
- ✅ Modular architecture (scope_parser.py, recon.py)

## Development Notes

### Scope Parser (`src/scope_parser.py`)
- Loads domains and wildcard patterns from `scope.txt`
- Uses regex for efficient wildcard matching
- Supports multiple domain levels: `*.dev.example.com`
- Provides validation and pattern testing

### Main Application (`main.py`)
- Entry point with argparse CLI
- Supports single domain or bulk scanning
- `--check-scope` flag for validating configuration
- Extensible for future reconnaissance modules

### Planned Next Steps

1. **Endpoint Discovery**
   - Parse JavaScript files for API endpoints
   - Scan robots.txt and sitemap.xml
   - Integrate with API documentation sources
   - GitHub repository scanning for hardcoded endpoints

2. **Cloud Service Detection**
   - AWS: S3 buckets, CloudFront, API Gateway, Lambda, RDS
   - GCP: Cloud Storage, App Engine, Cloud Run, Firestore
   - DNS analysis for service indicators

3. **Data Sources Integration**
   - Certificate Transparency logs
   - VirusTotal API integration
   - Shodan API support
   - crt.sh enumeration

4. **Output & Reporting**
   - JSON export format
   - CSV for spreadsheet analysis
   - HTML report generation
   - Results deduplication

## Testing

To validate scope functionality:
```bash
python main.py --check-scope
```

## Future Integrations

- External APIs (require API keys in .env)
- Database for historical tracking
- Real-time monitoring capabilities
- Integration with OWASP tools
