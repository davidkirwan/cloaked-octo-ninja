
# Imports
require 'logger'

# Setup variables
begin
  @log = Logger.new(STDOUT)

  @log.level = Logger::DEBUG
  #@log.level = Logger::INFO
  #@log.level = Logger::WARN
  #@log.level = Logger::ERROR
  #@log.level = Logger::FATAL

  @log.debug "debug"
  @log.info "info"
  @log.warn "warn"
  @log.error "error"
  @log.fatal "fatal"

rescue Exception => e
  raise e
end
