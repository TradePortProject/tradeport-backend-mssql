# Use the official MSSQL Server image from Microsoft
FROM mcr.microsoft.com/mssql/server:latest

# Set environment variables
ENV SA_PASSWORD=Your_password123
ENV ACCEPT_EULA=Y

# Switch to root user to run installation commands
USER root

# Install the MSSQL tools and ODBC driver
RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools

# Add MSSQL tools to the PATH environment variable
ENV PATH=/opt/mssql-tools/bin:$PATH

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the initialization script to the container
COPY init-db.sql /init-db.sql

# Switch back to the default user
USER mssql

# Run the SQL Server, then run the initialization script
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & sleep 30 && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i /init-db.sql && wait"
