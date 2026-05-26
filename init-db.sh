#!/bin/bash
set -e

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    -- Create databases
    CREATE DATABASE IF NOT EXISTS authService;
    CREATE DATABASE IF NOT EXISTS accountService;
    CREATE DATABASE IF NOT EXISTS transactionService;

    -- Create users and grant privileges
    CREATE USER IF NOT EXISTS 'authService_user'@'%' IDENTIFIED BY 'authService_pass12';
    GRANT ALL PRIVILEGES ON authService.* TO 'authService_user'@'%';

    CREATE USER IF NOT EXISTS 'accountService_user'@'%' IDENTIFIED BY 'accountService_pass12';
    GRANT ALL PRIVILEGES ON accountService.* TO 'accountService_user'@'%';

    CREATE USER IF NOT EXISTS 'transactionService_user'@'%' IDENTIFIED BY 'transactionService_pass12';
    GRANT ALL PRIVILEGES ON transactionService.* TO 'transactionService_user'@'%';

    FLUSH PRIVILEGES;
EOSQL
