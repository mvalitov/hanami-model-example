require 'dry/system/container'
require 'dry/system/components'
class Application < Dry::System::Container
  use :logging
  use :env, inferrer: -> { ENV.fetch('APP_ENV', :development).to_sym }
  configure do |config|
    # config.root = /root/app/dir
    config.auto_register = 'lib'
  end
  load_paths!('lib', 'system')
end