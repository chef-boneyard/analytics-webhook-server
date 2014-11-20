#
# Copyright:: Copyright (c) 2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def persist(id, notificationAlias, payload)
  conf = settings.output
  if !notificationAlias.nil?
    if settings.aliases
      if settings.aliases.has_key?(notificationAlias)
        conf = settings.aliases[notificationAlias]['output']
      end
    end
  end

  case conf['type']
  when 'file'
    file_output(conf, payload)
  when 'log'
    log_output(conf, payload)
  when 'exec'
    exec_output(conf, payload)
  else
    logger.info "Invalid output type, defaulting to standard output"
    log_output(conf, payload)
  end
end
