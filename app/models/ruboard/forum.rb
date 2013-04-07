require 'friendly_id'

module Ruboard
  class Forum < ActiveRecord::Base
    extend FriendlyId

    attr_accessible :title, :description

    default_scope order('title ASC')

    has_many :topics, :dependent => :destroy

    validates :title, :presence => true, :length => { :minimum => 3, :maximum => 250 }

    friendly_id :title, :use => :slugged

  end
end
