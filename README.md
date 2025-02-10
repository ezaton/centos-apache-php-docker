# Legacy CentOS 5 Apache/PHP Container

This repository contains Docker configuration for a legacy web server environment based on CentOS 5, Apache 2.2, and PHP 5.1.6. This container is designed for running legacy applications that require these specific older versions.

⚠️ **Security Notice**: This container uses end-of-life software versions and should only be used in isolated environments for legacy application support. It is not recommended for production use or exposure to the public internet.

## Components

- Base Image: CentOS 5
- Web Server: Apache 2.2
- PHP Version: 5.1.6
- Additional PHP modules:
  - php-bcmath
  - php-gd
  - php-mbstring
  - php-mysql
  - php-odbc
  - php-pdo
  - Various PEAR modules
  - Full list available in Dockerfile

## Container Configuration

The container includes:
- Custom Apache configuration with logging directed to stdout/stderr for container compatibility
- Default Apache document root at `/var/www/html`
- Port 80 exposed for HTTP traffic
- Apache running in foreground mode

## How to build and run

Build the container:
```bash
docker build -t legacy-centos5-apache .
```

Run the container:
```bash
docker run -d -p 80:80 legacy-centos5-apache
```

## Files

- `Dockerfile` - Container build instructions
- `httpd.conf` - Custom Apache configuration
- `vault.repo` - CentOS 5 vault repository configuration

## Important Notes

1. This container uses the CentOS Vault repositories as CentOS 5 is end-of-life
2. No security updates are available for these software versions
3. PHP 5.1.6 lacks many modern security features and patches
4. Apache 2.2 is no longer maintained
5. Use only for legacy application compatibility testing or migration purposes

## Limitations

- No SSL/TLS support configured by default
- Limited to basic HTTP functionality
- No modern PHP features available
- Security vulnerabilities present in all components

## Intended Use

This container is intended for:
- Legacy application migration testing
- Maintaining compatibility with very old code bases
- Development and testing environments only

DO NOT use this container for:
- Production environments
- Public-facing applications
- Processing sensitive data
- New development projects

## Contributing

If you find issues or have improvements, please submit a pull request or create an issue in the repository.

