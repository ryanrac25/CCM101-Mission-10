# CCM101 - Enterprise Cloud Architect
## System Architecture Diagram

```mermaid
flowchart TB
    A["Windows Host Computer"]
    B["Oracle VirtualBox"]
    C["Ubuntu Server 24.04 LTS"]
    D["UFW Firewall"]
    E["Docker Engine"]
    F["Docker Compose"]
    G["Private Docker Bridge Network"]
    H["WordPress Container<br/>Apache + PHP"]
    I["MariaDB Container"]
    J[("wordpress_data Volume")]
    K[("db_data Volume")]
    L[("Database Backup Files")]
    M["Bash Automation Script"]
    N["Cron Scheduler<br/>Daily at 2:00 AM"]

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
    G --> I
    H --> J
    I --> K
    M --> E
    N --> M
    M --> L
```
## Architecture Description

The Windows host runs Oracle VirtualBox, which provides the Ubuntu Server virtual machine.

Ubuntu Server runs Docker Engine and Docker Compose. WordPress and MariaDB operate as separate containers connected through a private Docker bridge network.

WordPress uses MariaDB to store website data. Docker volumes provide persistent storage for application files and database records.

The UFW firewall protects the Ubuntu server. The Bash automation script manages Docker services and creates database backups. Cron automatically executes the backup script every day at 2:00 AM Philippine time.
