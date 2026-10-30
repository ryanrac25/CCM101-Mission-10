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
