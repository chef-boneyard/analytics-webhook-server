def persist(id, payload)
  conf = settings.output
  case conf['type']
  when 'file'
    file_output(conf, payload)
  when 'stdout'
    log_output(conf, payload)
  when 'exec'
    exec_output(conf, payload)
  else
    logger.info "Invalid output type, defaulting to standard output"
    log_output(conf, payload)
  end
end