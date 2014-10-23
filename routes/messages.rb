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