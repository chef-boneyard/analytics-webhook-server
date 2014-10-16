#analytics-webhook-server
Generic webhook server for accepting analytics notifications

##Prerequisites
Install dependencies:

    $ bundle

##Configuration

Currently supported output types:
###Log
Writes data received to the log file
```
---
output:  
    type: log
```

###File
Writes data received to a file named `message_id`.json where `message_id` is 
from the `id` field from the analytics notification. This is then stored in the
configured path `dest_dir` or `/tmp` if one is not specified
```
---
output: 
    type: file
    settings:
        dest_dir: /path/to/dir
```

###Exec
Executes a command specified using variables from the analytics notification. 
Available fields are documented in [analytics-docs](https://github.com/opscode/analytics_docs)
```
---
output: 
    type: exec
    settings:
        cmd: "echo %<id>s > /tmp/foo.txt"
```

##Usage

    $  bundle exec rackup -p 8888 config.ru

