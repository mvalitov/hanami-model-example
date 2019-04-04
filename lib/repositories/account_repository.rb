require 'hanami/model'
require 'import'
require 'dotenv/load'
require_relative '../entities/account'

class AccountRepository < Hanami::Repository

end
Mutex.new.synchronize do
    Hanami::Model.configure do
        adapter :sql, ENV['DATABASE_URL']  # "postgres://postgres:postgres@172.17.0.2/app_development?max_connections=16"
    end.load!
end