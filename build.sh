#!/usr/bin/env bash

# Set the directory of this script
BUILD_BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# List of PHP -> PHPUnit Versions
declare -A IMAGE_MAP=(
    ["5.3-apache"]="4.8.36"
    ["5.5-apache"]="4.8.36"
    ["5.6-fpm"]="5.7.9"
    ["7.0-fpm"]="6.5.7"
    ["7.1-fpm"]="7.0.2"
    ["7.2-fpm"]="7.0.2"
)

for phpImage in "${!IMAGE_MAP[@]}"; do

    # Strip the image type out of the version (-fpm / -apache)
    phpVersion=$(echo $phpImage| cut -d'-' -f 1)

    echo "Building Dockerfiles for PHP $phpVersion and PHP Unit ${IMAGE_MAP[$phpVersion]}...";

    # Create directories if needed
    if [ ! -d "$BUILD_BASE_DIR/$phpVersion" ]; then
        mkdir -p "$BUILD_BASE_DIR/$phpVersion/dev";
    fi

    # Build regular image
    cat "$BUILD_BASE_DIR/Dockerfile.template" > "$BUILD_BASE_DIR/$phpVersion/Dockerfile"

    sed -ri \
        -e 's!%%PHP_IMAGE%%!'"${phpImage}"'!' \
        -e 's!%%PHAR_LOCATION%%!'"https://phar.phpunit.de/phpunit-${IMAGE_MAP[$phpImage]}.phar"'!' \
        "$BUILD_BASE_DIR/$phpVersion/Dockerfile"

    # Build dev variant
    cat "$BUILD_BASE_DIR/Dockerfile.template" > "$BUILD_BASE_DIR/$phpVersion/dev/Dockerfile"

    sed -ri \
        -e 's!%%PHP_IMAGE%%!'"${phpImage}-dev"'!' \
        -e 's!%%PHAR_LOCATION%%!'"https://phar.phpunit.de/phpunit-${IMAGE_MAP[$phpImage]}.phar"'!' \
        "$BUILD_BASE_DIR/$phpVersion/dev/Dockerfile"

done
