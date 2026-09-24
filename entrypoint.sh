#!/bin/bash
set -e

echo "Checking Database Connection..."

if [ ! -d "sites/qsr-app.onrender.com" ]; then
    echo "Creating new site qsr-app.onrender.com..."
    
    bench new-site qsr-app.onrender.com \
      --db-host "$DB_HOST" \
      --db-port "$DB_PORT" \
      --db-name "erpnext_db" \
      --mariadb-root-username "$DB_USER" \
      --mariadb-root-password "$DB_PASSWORD" \
      --admin-password "$ADMIN_PASSWORD" \
      --install-app erpnext \
      --no-mariadb-socket

    echo "Installing NAV Custom UI App..."
    bench --site qsr-app.onrender.com install-app frappe_custom_ui_app
fi

echo "Starting ERPNext Server..."
exec bench serve --port 8000
