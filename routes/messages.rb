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

class WebhookReceiver < Sinatra::Base

  post '/:alias/messages' do
    content_type :json
    notificationAlias = params[:alias]
    begin
      status 201
      payload = JSON.parse request.body.read
      id = payload['id']
      persist(id, notificationAlias, payload)
      {'success' => "persisted #{id}"}.to_json
    rescue JSON::ParserError => e
      logger.error(e.message)
      status 400
      {'error' => "invalid JSON"}.to_json
    rescue OutputError => e
      logger.error(e.message)
      status 500
      {'error' => e.message}.to_json
    rescue Exception => e
      logger.error(e.message)
      status 500
      {'error' => e.message}.to_json
    end
  end

  post '/messages' do
    content_type :json

    begin
      status 201
      payload = JSON.parse request.body.read
      id = payload['id']
      persist(id, nil, payload)
      {'success' => "persisted #{id}"}.to_json
    rescue JSON::ParserError => e
      logger.error(e.message)
      status 400
      {'error' => "invalid JSON"}.to_json
    rescue OutputError => e
      logger.error(e.message)
      status 500
      {'error' => e.message}.to_json
    rescue Exception => e
      logger.error(e.message)
      status 500
      {'error' => e.message}.to_json
    end
  end
end
