module Ruboard
  class Post < ActiveRecord::Base
    attr_accessible :body, :user

    belongs_to :topic
    belongs_to :user
  end
end
