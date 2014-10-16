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