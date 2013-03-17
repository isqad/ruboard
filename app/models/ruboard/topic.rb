module Ruboard
  class Topic < ActiveRecord::Base
    attr_accessible :title, :forum, :user

    has_many :posts, :dependent => :destroy
    belongs_to :user
    belongs_to :forum
  end
end
