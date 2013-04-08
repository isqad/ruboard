require 'ruboard/version'
require 'ruboard/engine'

module Ruboard
  mattr_accessor :user_class

  class << self
    def user_class
      begin
        Object.const_get(@@user_class)
      rescue NameError
        @@user_class.constantize
      end
    end
  end
end
