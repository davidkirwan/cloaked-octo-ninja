# Potentially Useful Rake Scripts
This snippet directory contains a number of potentially useful Rake scripts. I have also included a lib/common/tasks/
containing potentially reusable library classes. Over time I will add to the lib/common/ with other reusable objects.
To use an individual task require lib/common/tasks/file.rb or import all common objects with lib/common/common.rb or
all common tasks with lib/common/tasks/tasks.rb.

## Contents
This following list contains what is currently developed

    .
    |-- archive-encrypt-backup
    |-- lib
    |   |-- common
    |   |   |-- tasks
    |   |   |   |-- configreader.rb
    |   |   |   `-- datestring.rb
    |   |   `-- tasks.rb
    |   `-- common.rb
    `-- simulate-cpu-load
