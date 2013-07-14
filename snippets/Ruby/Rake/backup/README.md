# Backup Rakefile Script
This Rake script is designed to automate simple backups of a single directory by creating an archive then encrypting it using GPG.
It has the following tasks within:

- Read configuration file
- Create an archive from the target folder
- Encrypt the archive file to a recipient key
- Copy the encrypted result to backup location
