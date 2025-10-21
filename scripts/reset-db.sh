#!/usr/bin/env bash
# Import seed into a local MySQL (outside Docker).
set -euo pipefail

DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-hethongbansach}"
DB_USER="${DB_USER:-root}"
DB_PASS="${DB_PASS:-root}"
SEED_FILE="${SEED_FILE:-db/seed.sql}"

echo "[*] Creating database ${DB_NAME} (if not exists)..."
mysql -h "$DB_HOST" -P "$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"

echo "[*] Importing seed from ${SEED_FILE} ..."
mysql -h "$DB_HOST" -P "$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$SEED_FILE"
echo "[✓] Done."
