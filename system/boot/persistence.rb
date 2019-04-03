Application.finalize(:persistence) do |container|
  start do
    require 'hanami/model'
    require 'dotenv/load'
    container.register('persistence.db', 
        Mutex.new.synchronize do
            Hanami::Model.configure do
                adapter :sql, ENV['DATABASE_URL']  # "postgres://postgres:postgres@172.17.0.2/app_development?max_connections=16"
            end.load!
        end
    )
  end
end