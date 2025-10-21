
param(
  [string]$DB_HOST = "localhost",
  [string]$DB_PORT = "3306",
  [string]$DB_NAME = "hethongbansach",
  [string]$DB_USER = "root",
  [string]$DB_PASS = "root",
  [string]$SEED_FILE = "db/seed.sql"
)

Write-Host "[*] Creating database $DB_NAME (if not exists)..."
$createCmd = "CREATE DATABASE IF NOT EXISTS `$DB_NAME` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
cmd /c "mysql -h $DB_HOST -P $DB_PORT -u$DB_USER -p$DB_PASS -e `"$createCmd`""

Write-Host "[*] Importing seed from $SEED_FILE ..."
cmd /c "mysql -h $DB_HOST -P $DB_PORT -u$DB_USER -p$DB_PASS $DB_NAME < $SEED_FILE"
Write-Host "[✓] Done."
