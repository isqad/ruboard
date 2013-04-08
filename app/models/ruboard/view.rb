module Ruboard
  class View < ActiveRecord::Base
    attr_accessible :user, :count

    belongs_to :user, :class_name => Ruboard.user_class.to_s
    belongs_to :viewable, :polymorphic => true

    validates :viewable_id, :viewable_type, :presence => true
  end
end
