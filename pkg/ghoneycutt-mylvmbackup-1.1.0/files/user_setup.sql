CREATE USER 'mylvmbackup'@'localhost' IDENTIFIED BY 'notagoodpassword';
GRANT RELOAD, REPLICATION CLIENT ON *.* TO 'mylvmbackup'@'localhost';
GRANT SELECT ON mysql.* TO 'mylvmbackup'@'localhost';
