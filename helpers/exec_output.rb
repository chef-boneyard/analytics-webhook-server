def exec_output(config, payload)
  template = config['settings']['cmd']
  resource = Hash[payload.map{|(k,v)| [k.to_sym,v]}]
  cmd = template % resource
  command = Mixlib::ShellOut.new(cmd)
  command.run_command
  status = command.status
  unless status.success?
    raise OutputError.new(cmd), "Command `#{cmd}` failed to execute"
  end
end

