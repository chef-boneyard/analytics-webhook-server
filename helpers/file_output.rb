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

def file_output(config, payload)
  dir = "/tmp"
  if config.has_key?('settings')
    if config['settings'].has_key?('dest_dir')
      dir = config['settings']['dest_dir']
    end
  end

  uuid = payload['id']
  begin
    File.write("#{dir}/#{uuid}.json", payload.to_json)
  rescue Exception => e
    raise OutputError.new(uuid), e.message
  end
end
