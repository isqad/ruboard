require_dependency 'ruboard/application_controller'

module Ruboard
  class TopicsController < Ruboard::ApplicationController

    before_filter :find_forum

    def show
      @topic = @forum.topics.find(params[:id])
      @posts = @topic.posts.includes(:user)
    end

    private
    def find_forum
      @forum = Ruboard::Forum.find(params[:forum_id])
    end

  end
end
