## Readme for the MongoDB-Database-Backup Rakefile script

To launch this system simply call _rake db:backup_ from the same directory as the Rakefile script, alternatively
if you wish to run from elswhere in the file system, you can do so in the following way: 

_rake -f /path/to/the/Rakefile db:backup_

If you are running this, or planning to run it in a cron job, you can do so in the following way simply add
something similar to the following to your crontab file:

# To run the database backup at 23:35 each day Monday to Friday all year around.
_35 23 * * 1-5 /path/to/the/executable/rake -f /path/to/the/Rakefile db:backup --trace > /path/to/error/rake.log 2>&1_