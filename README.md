# MSSQL Server Docker Setup

This project sets up a Microsoft SQL Server (MSSQL) instance using Docker. The following instructions will help you build and run the MSSQL container with the necessary tools and configurations.

## Prerequisites

- Docker installed on your system
- Docker Compose installed on your system

## Getting Started

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-repo/tradeport-backend-mssql.git
   cd tradeport-backend-mssql
   
2.Update the init-db.sql file with your database initialization script.

3.Build and run the MSSQL container:

docker-compose -f tradeport-backend-mssql.yml up --build

4.The MSSQL server will be accessible on port 1433.

Volume
The mssql-data volume is used to persist database data between container restarts. This ensures that your data is not lost when the container stops or is removed.

Cleanup
To stop and remove the container, run:

docker-compose down
