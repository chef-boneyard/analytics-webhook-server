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

require_relative '../spec_helper'

describe 'Messages Path' do
  message = {
    "id"=>"4FE05E90-68AB-4354-98D7-2670005912DB",
    "entity_name"=>"4.5.6",
    "entity_type"=>"version",
    "organization_name"=>"ponyville",
    "message_version"=>"0.1.0",
    "message_type"=>"action",
    "recorded_at"=>"1993-06-15T05:54:30Z",
    "remote_hostname"=>"127.0.0.1",
    "remote_request_id"=>"4FE05E90-68AB-4354-98D7-2670005912DB",
    "request_id"=>"7lykM3oH1Jesbe6hirbIgq4zNEBZLqv5EFgMMkPeGIfq2pV2",
    "requestor_name"=>"rarity",
    "requestor_type"=>"user",
    "service_hostname"=>"127.0.0.1",
    "task"=>"create",
    "user_agent"=>"Chef Client/0.10.0 (ruby-1.9.3-p484; x86_64-linux; +http://opscode.com)",
    "parent_name"=>"apache2",
    "parent_type"=>"cookbook"
  }


  describe 'POST /messages' do
    before {
      post '/messages', message.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    }

    it 'is successful' do
      expect(last_response.status).to eq 201
      expect(last_response.body).to eq({"success" => "persisted #{message['id']}"}.to_json)
    end
  end

  describe 'POST /default/messages' do
    before {
      post '/default/messages', message.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    }

    it 'is successful' do
      expect(last_response.status).to eq 201
      expect(last_response.body).to eq({"success" => "persisted #{message['id']}"}.to_json)
    end
  end
end
