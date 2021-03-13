require_relative 'dependencies' # all requires live in this file
require_relative 'service'

# Objects created to be used in automation framework
World(TestWorld)
World(Service)

Hashie.logger.level = Logger.const_get 'ERROR'
