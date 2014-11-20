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

This provides an endpoint at http://SERVER_NAME/8888/messages which will accept webhook
payloads.

## TODO
* This currently does not support/verify Basic Authentication
* Add HTTPS support

# License

Copyright (c) 2014 Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
