module Ruboard
  class Category < ActiveRecord::Base
    attr_accessible :title

    has_many :forums, :dependent => :destroy

  end
end
