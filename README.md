 # Laravel Development Docker Image

A comprehensive Docker image for Laravel development based on PHP 8.2 FPM with Nginx, optimized for modern Laravel applications with Filament admin panel support.

## Base Image

Built on `ghcr.io/serversideup/php:8.2-fpm-nginx`

## Features

### PHP Extensions
- **intl** - Internationalization support
- **exif** - Image metadata handling
- **soap** - SOAP protocol support
- **xdebug** - Debugging and code coverage (configured for coverage mode)

### System Packages
- **mariadb-client** - Database client (required for Spatie Backup)
- **iputils-ping** - Network diagnostics
- **curl** - HTTP client
- **Node.js 20.x** - JavaScript runtime for asset compilation

### Pre-configured Aliases

Productivity-boosting shell aliases for Laravel development:

#### General Commands
- `ll` - Detailed file listing (`ls -al`)
- `a` - Laravel Artisan shorthand (`php artisan`)
- `c` - Composer shorthand

#### Laravel Utilities
- `logs` - Tail Laravel logs (`tail -n 100 -f storage/logs/laravel.log`)
- `amfs` - Fresh migration with seeding (`a migrate:fresh --seed`)
- `aoc` - Clear all caches (`a optimize:clear`)

#### Filament Generators
- `am:fi-r` - Generate Filament resource
- `am:fi-rm` - Generate Filament relation manager
- `am:fi-w` - Generate Filament widget

## Usage

### Build the Image

```bash
docker build --target development -t my-laravel-app .
```

### Run a Container

```bash
docker run -d \
  -p 8080:80 \
  -v $(pwd):/var/www/html \
  my-laravel-app
```

## Configuration

### Xdebug
Xdebug is pre-configured with coverage mode enabled. Configuration location:
/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


### User Permissions
The image runs as the `www-data` user for security best practices.

## Maintainer

**Ali Salehi**  
Email: alisalehi.dev@gmail.com
