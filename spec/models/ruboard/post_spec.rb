require 'spec_helper'

describe Ruboard::Post do

  let!(:post) { FactoryGirl.build(:post) }

  it 'create new instance given valid parameters' do
    post.save!
  end

  describe 'validations' do
    it 'required body' do
      post.body = ''

      post.should_not be_valid
    end
  end
end
