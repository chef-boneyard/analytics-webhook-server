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