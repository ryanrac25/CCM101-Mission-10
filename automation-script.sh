#!/bin/bash

# CCM101 Enterprise Cloud Architect
# Docker Management and Database Backup Script

PROJECT_DIR="$HOME/Laboratory-10-Enterprise-Cloud-Architect"
BACKUP_DIR="$PROJECT_DIR/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

cd "$PROJECT_DIR" || exit 1

mkdir -p "$BACKUP_DIR"

case "$1" in
    start)
        echo "Starting enterprise cloud services..."
        docker compose up -d
        ;;

    stop)
        echo "Stopping enterprise cloud services..."
        docker compose stop
        ;;

    restart)
        echo "Restarting enterprise cloud services..."
        docker compose restart
        ;;

    status)
        echo "Checking enterprise cloud services..."
        docker compose ps
        ;;

    backup)
        echo "Creating MariaDB database backup..."

        docker compose exec -T database sh -c \
        'mariadb-dump -u root -p"$MARIADB_ROOT_PASSWORD" "$MARIADB_DATABASE"' \
        > "$BACKUP_DIR/wordpress_$TIMESTAMP.sql"

        if [ $? -eq 0 ]; then
            echo "Database backup successful!"
            echo "Saved to: $BACKUP_DIR/wordpress_$TIMESTAMP.sql"
        else
            echo "Database backup failed!"
            rm -f "$BACKUP_DIR/wordpress_$TIMESTAMP.sql"
            exit 1
        fi
        ;;

    *)
        echo "Usage: $0 {start|stop|restart|status|backup}"
        exit 1
        ;;
esac
