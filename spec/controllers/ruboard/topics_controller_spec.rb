require 'spec_helper'

describe Ruboard::TopicsController do
  # Post list
  describe 'GET show' do
    it 'has a 200 status code' do
      get :show
      expect(response.code).to eql(200)
    end
  end
end
