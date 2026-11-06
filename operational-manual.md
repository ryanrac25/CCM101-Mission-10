<!-- CCM101 COVER PAGE -->

<div align="center">

# CCM101 – Cloud Computing

## Enterprise Cloud Architect – Operational Manual

### Project: Secure Multi-Tier Web Application

**Application Stack:** WordPress + MariaDB

<br>

**Prepared by:**  
Ryan Christian P. Racuya

John Carlo Viloria

**Section:**  
BSIT 4-G

**Instructor:**  
Jenkielyn C. Torres

**Date:**  
October 2026

</div>

<div style="page-break-after: always;"></div>

# Operational Manual
## CCM101 - The Enterprise Cloud Architect

## 1. System Overview

This project runs WordPress and MariaDB using Docker Compose on an Ubuntu Server virtual machine.

## 2. Starting the System

Go to the project directory and run:

    cd ~/Laboratory-10-Enterprise-Cloud-Architect
    ./automation-script.sh start

## 3. Stopping the System

Run:

    ./automation-script.sh stop

## 4. Restarting the System

Run:

    ./automation-script.sh restart

## 5. Monitoring Services

Check the status of the containers:

    ./automation-script.sh status
    docker compose ps

MariaDB should display a healthy status.

## 6. Accessing WordPress

The WordPress service uses localhost port 8080.

Open a Windows PowerShell window and establish an SSH tunnel:

    ssh -L 8080:localhost:8080 -p 2222 ryan@127.0.0.1

Keep the tunnel open and visit http://localhost:8080 in a browser.

## 7. Manual Database Backup

Run:

    ./automation-script.sh backup

The SQL backup files are stored in the backups/ directory.

## 8. Automatic Database Backup

A Cron job is configured to run every day at 2:00 AM Philippine time.

Check the schedule:

    crontab -l

Check the backup log:

    cat backup-cron.log

## 9. Firewall Management

Check the firewall:

    sudo ufw status verbose

UFW is enabled. Incoming connections are denied by default, and SSH access is allowed. WordPress is accessible through an SSH tunnel.

## 10. Troubleshooting

Check container status:

    docker compose ps

View MariaDB logs:

    docker compose logs database

View WordPress logs:

    docker compose logs wordpress

Start services again if needed:

    ./automation-script.sh start

## 11. Maintenance and Security

- Keep database credentials private.
- Do not delete Docker volumes unless you intend to remove stored data.
- Check database backups regularly.
- Keep Ubuntu and Docker updated.
- Store backup files safely.

## 12. Maintenance Summary

Regular maintenance includes checking container health, reviewing application logs, verifying backups, and monitoring firewall settings.

## 13. Infrastructure Specifications

The project uses a local virtualized environment.

- Host Operating System: Windows 11
- Hypervisor: Oracle VirtualBox
- Guest Operating System: Ubuntu Server 24.04.5 LTS
- Virtual CPU: 2 cores
- Virtual Memory: 6 GB RAM
- Virtual Disk: 60 GB dynamically allocated
- Network Mode: NAT with SSH port forwarding
- SSH Host Port: 2222
- SSH Guest Port: 22

## 14. Application Architecture

The application uses two separate Docker containers.

- WordPress: Web application running Apache and PHP.
- MariaDB: Relational database server.
- Docker Bridge Network: Allows the application and database containers to communicate privately.
- wordpress_data: Persistent storage for WordPress files.
- db_data: Persistent storage for MariaDB database records.

WordPress connects to MariaDB through the internal Docker network using the database service name and port 3306.

## 15. Initial Deployment

Enter the project directory:

    cd ~/Laboratory-10-Enterprise-Cloud-Architect

Check the Docker Compose configuration:

    docker compose config -q

Start the application:

    ./automation-script.sh start

Verify the running containers:

    docker compose ps

The database container should report a healthy status.

## 16. Network and Port Configuration

The VirtualBox NAT configuration forwards host port 2222 to Ubuntu guest port 22 for SSH administration.

The WordPress service is published on 127.0.0.1:8080. It is not directly exposed to the external network.

To access WordPress from the Windows host, establish an SSH tunnel:

    ssh -L 8080:localhost:8080 -p 2222 ryan@127.0.0.1

Open the following address in the host browser:

    http://localhost:8080

## 17. Persistent Storage

Docker Compose defines two named volumes:

- db_data stores MariaDB database files.
- wordpress_data stores WordPress application files.

These volumes preserve application data when containers are stopped or recreated.

Do not use docker compose down -v during normal maintenance because it removes the named volumes.

## 18. Database Recovery

Before restoring a backup, make a separate copy of the current database backup files.

To restore a selected SQL backup, use:

    docker compose exec -T database sh -c 'mariadb -u root -p"$MARIADB_ROOT_PASSWORD" "$MARIADB_DATABASE"' < backups/your-backup-file.sql

Replace your-backup-file.sql with the actual backup filename.

Verify the application and database status after restoration:

    docker compose ps

## 19. Backup Verification

List the available database backups:

    ls -lh backups/

Check the Cron schedule:

    crontab -l

Review the scheduled backup log:

    cat backup-cron.log

A successful backup should produce a non-empty SQL file in the backups directory.

