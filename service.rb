# Main service file used for requiring service files

require 'roda'
require_relative 'lib/yaksi'

require_relative 'domain'

require_relative 'service/root'
require_relative 'service/trees'
