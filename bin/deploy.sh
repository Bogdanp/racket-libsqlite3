#!/usr/bin/env bash

set -euo pipefail

log() {
    printf "[%s] %s\n" "$(date)" "$@"
}

log "Ensuring artifact folders are present..."
test -e artifacts/linux-x86-64 || exit 2
test -e artifacts/macos-x86-64 || exit 2

log "Copying artifacts into their respective packages..."
cp artifacts/linux-x86-64/lib/libsqlite3.so.0.8.6 libsqlite3-x86_64-linux/libsqlite3.so
cp artifacts/macos-x86-64/lib/libsqlite3.0.dylib libsqlite3-x86_64-linux/libsqlite3.dylib

log "Decrypting deploy key..."
gpg -q \
    --batch \
    --yes \
    --decrypt \
    --passphrase="$DEPLOY_KEY_PASSPHRASE" \
    -o deploy-key \
    bin/deploy-key.gpg
chmod 0600 deploy-key
trap "rm -f deploy-key" EXIT

log "Building packages..."
for package in "libsqlite3-x86_64-linux" "libsqlite3-x86_64-macosx"; do
    log "Building '$package'..."
    pushd "$package"

    version=$(grep version info.rkt | cut -d'"' -f2)
    filename="$package-$version.tar.gz"
    mkdir -p dist
    tar -cvzf "dist/$filename" LICENSE info.rkt libsqlite3.*
    sha1sum "dist/$filename" | cut -d ' ' -f 1 | tr -d '\n' > "dist/$filename.CHECKSUM"
    scp -o StrictHostKeyChecking=no \
        -i ../deploy-key \
        -P "$DEPLOY_PORT" \
        "dist/$filename" \
        "dist/$filename.CHECKSUM" \
        "$DEPLOY_USER@$DEPLOY_HOST":~/www/

    popd
done
