# Backup Rakefile Script
This Rake script is designed to automate simple backups of a single directory by creating an archive then encrypting it using GPG.
It has the following tasks within:

- Read configuration file
- Create an archive from the target folder
- Encrypt the archive file to a recipient key
- Copy the encrypted result to backup location


## Config.yaml Settings
Config.yaml contains the following key:value pairs

    path: /path/to/target
    output: /path/to/output
    archive: tar
    encrypt: true
    recipient: recipient@email.com
    loglevel: 0

- path is the absolute to the location on disk of the directory you wish to have backed up
- output is the absolute path to the location where you wish to copy the resulting backup
- archive can be configured to either zip or tar. _zip_ and or _tar_ must be accessible in the PATH
- encrypt either true or false
- recipient if encrypt is set to true, this is the recipient key _gpg_ will attempt to encrypt the archive to
- loglevel 0 - 4, debug, info, warn, error, fatal respectively
