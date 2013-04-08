require 'spec_helper'

describe Ruboard::ForumsController do
  # Forum list
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index, :use_route => :ruboard
      expect(response.code).to eql('200')
    end
  end

  # Topic list
  describe 'GET show' do
    it 'has a 200 status code' do
      get :show, :use_route => :ruboard
      expect(response.code).to eql('200')
    end
  end
end
