require 'friendly_id'

module Ruboard
  class Topic < ActiveRecord::Base
    extend FriendlyId

    attr_accessible :title, :forum, :user

    has_many :posts, :dependent => :destroy, :order => 'ruboard_posts.created_at DESC'
    has_many :views, :as => :viewable
    belongs_to :user, :class_name => Ruboard.user_class.to_s
    belongs_to :forum

    validates :title, :presence => true, :length => { :minimum => 3, :maximum => 250 }

    friendly_id :title, :use => :slugged

    accepts_nested_attributes_for :posts

    before_save :set_first_post_user

    def register_view_by(user)
      return unless user

      view = self.views.find_or_create_by_user_id(user.id)
      view.increment!(:count)
      self.increment!(:views_count)
    end

    def view_for(user)
      self.views.find_by_user_id(user.id)
    end

    private
    def set_first_post_user
      post = self.posts.first
      post.user = self.user
    end
  end
end
