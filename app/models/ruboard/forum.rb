module Ruboard
  class Forum < ActiveRecord::Base
    attr_accessible :title, :category

    belongs_to :category
    has_many :topics, :dependent => :destroy

    acts_as_nested_set
  end
end
