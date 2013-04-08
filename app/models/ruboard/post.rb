module Ruboard
  class Post < ActiveRecord::Base

    attr_accessible :body, :user, :body

    belongs_to :topic, :counter_cache => true
    belongs_to :user, :class_name => Ruboard.user_class.to_s

    validates :body, :presence => true

    delegate :name, :to => :user, :prefix => true, :allow_nil => true
  end
end
