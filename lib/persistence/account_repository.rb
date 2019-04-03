require 'hanami/model'
require 'import'

module Persistence
  class AccountRepository < Hanami::Repository
    include Import['entities.account', 'persistence.db']
  
  end
end