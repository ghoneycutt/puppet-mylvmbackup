# Class: mylvmbackup
#
# This module manages mylvmbackup (http://www.lenzg.net/mylvmbackup/)
#
# Requires:
#   class backup
#   class generic
#   $mylvmbackupBackupDir be set
#   $mylvmbackupVgname be set
#   $mylvmbackupLvname be set
#   $mylvmbackupLvsize be set
#
# Sample Usage: include mylvmbackup
#
#    Specifies the pathname of the directory where the archive files will be
#    written to. The backup directory must not be on the same volume as the
#    MySQL data directory. If the directory does not exist, it will be created.
#    mylvmbackupBackupDir = "/data/backups/mysql/"
#
#    Specifies the volume group of the logical volume where the MySQL data
#    directory is located.
#    mylvmbackupVgname    = "vg0"
#
#    Specifies the name of the logical volume where the MySQL data directory
#    is located.
#    mylvmbackupLvname    = "mysql"
#
#    Specifies the size for the snapshot volume.
#    mylvmbackupLvsize    = "2G"
#
class mylvmbackup {

    include backup
    include generic

    package {[
        "lvm2",
        "mylvmbackup",
        "perl-Config-IniFiles",
        "perl-TimeDate",
    ]:} # package

    file {
        "/etc/mylvmbackup.conf":
            mode    => 600,
            content => template("mylvmbackup/mylvmbackup.conf.erb"),
            require => Package["mylvmbackup"];
        "$mylvmbackupBackupDir":
            mode    => 755,
            ensure  => directory,
            require => [File["/data"], File["/data/backups"], ];
    } # file
} # class mylvmbackup
