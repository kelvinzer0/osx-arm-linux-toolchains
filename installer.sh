#!/bin/bash

set -e

# Daftar URL toolchain
URLS=(
  "https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/aarch64-unknown-linux-gnu.tar.xz"
  "https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/arm-unknown-linux-gnueabi.tar.xz"
  "https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/armv8-rpi3-linux-gnueabihf.tar.xz"
  "https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/arm-unknown-linux-gnueabihf.tar.xz"
)

DEST_DIR="/opt/cross"
mkdir -p "$DEST_DIR"

echo "🚀 Mengunduh dan mengekstrak toolchain..."
for url in "${URLS[@]}"; do
  filename=$(basename "$url")
  name="${filename%.tar.xz}"
  
  echo "⬇️ Mengunduh $filename..."
  curl -L "$url" -o "/tmp/$filename"

  echo "📦 Mengekstrak $filename ke $DEST_DIR/$name..."
  sudo mkdir -p "$DEST_DIR/$name"
  sudo tar -xf "/tmp/$filename" -C "$DEST_DIR/$name" --strip-components=1
done

echo "🔏 Melakukan code signing pada semua binary..."
for toolchain in "$DEST_DIR"/*; do
  echo "🔐 Signing $toolchain..."
  sudo find "$toolchain" -type f -perm +111 | xargs -n1 sudo codesign --force --deep --sign -
done

echo "➕ Menambahkan PATH ke ~/.zshrc..."
for toolchain in "$DEST_DIR"/*; do
  bin_path="$toolchain/bin"
  if ! grep -q "$bin_path" ~/.zshrc; then
    echo "export PATH=\"$bin_path:\$PATH\"" >> ~/.zshrc
    echo "✅ Ditambahkan: $bin_path"
  fi
done

echo "✅ Instalasi selesai! Silakan jalankan 'source ~/.zshrc' atau buka terminal baru."
