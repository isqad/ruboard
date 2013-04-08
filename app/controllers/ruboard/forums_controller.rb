require_dependency 'ruboard/application_controller'

module Ruboard
  class ForumsController < Ruboard::ApplicationController

    def index
      @forums = Ruboard::Forum.with_topics
    end

    def show
      @forum = Ruboard::Forum.with_topics.find(params[:id])
    end

  end
end
