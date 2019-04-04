require 'dry/system/container'
require 'dry/system/components'
require 'hanami/model'
require 'dotenv/load'

class Application < Dry::System::Container
  use :logging
  use :env, inferrer: -> { ENV.fetch('APP_ENV', :development).to_sym }
  configure do |config|
    # config.root = /root/app/dir
    config.auto_register = 'lib'
  end
  load_paths!('lib', 'system')
end

# Application.finalize(:persistence) do |container|
#   init do
#     require 'hanami/model'
#     require 'dotenv/load'
#     container.register('persistence.db', 
#         Mutex.new.synchronize do
#             Hanami::Model.configure do
#                 adapter :sql, ENV['DATABASE_URL']  # "postgres://postgres:postgres@172.17.0.2/app_development?max_connections=16"
#             end.load!
#         end
#     )
#   end
# end