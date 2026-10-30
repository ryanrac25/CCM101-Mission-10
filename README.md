# CCM101 - The Enterprise Cloud Architect

## Project Overview

This project demonstrates an enterprise-style cloud application environment using Docker Compose. It runs WordPress as the web application and MariaDB as the database.

The environment is deployed on an Ubuntu Server virtual machine using Oracle VirtualBox.

## Technology Stack

- Ubuntu Server 24.04 LTS
- Oracle VirtualBox
- Docker Engine
- Docker Compose
- WordPress
- MariaDB
- UFW Firewall
- Bash Automation
- Cron Scheduler

## Project Architecture

The project uses two main containers:

1. **WordPress** - Provides the website and content management system.
2. **MariaDB** - Stores the WordPress database.

Both containers communicate through a private Docker bridge network. Persistent Docker volumes retain application and database data.

## Project Files

| File or Folder | Description |
|---|---|
| docker-compose.yml | Defines the WordPress and MariaDB services |
| automation-script.sh | Manages services and creates database backups |
| backups/ | Stores database backup files |
| README.md | Project overview and instructions |

## Requirements

- Ubuntu Server 24.04 LTS
- Docker Engine
- Docker Compose
- SSH access to the Ubuntu server

## Installation and Deployment

1. Install Docker Engine and Docker Compose.
2. Clone or copy this project directory to the Ubuntu server.
3. Navigate to the project directory:

   ```bash
   cd ~/Laboratory-10-Enterprise-Cloud-Architect
