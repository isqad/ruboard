require 'spec_helper'

describe Ruboard::Forum do
  let!(:attrs) {
    {
      :title => 'Test forum',
      :description => 'Description of test forum'
    }
  }

  it 'should create new instance given valid parameters' do
    Ruboard::Forum.create!(attrs)
  end

  it 'is scoped by default' do
    Ruboard::Forum.scoped.to_sql.should =~ /ORDER BY title ASC/
  end

  describe 'validations' do
    it 'required title' do
      Ruboard::Forum.new(attrs.merge(:title => '')).should_not be_valid
    end

    it 'title must be less than 250 chars' do
      Ruboard::Forum.new(attrs.merge(:title => 'a'*251)).should_not be_valid
    end

    it 'title must be greate than 3 chars' do
      Ruboard::Forum.new(attrs.merge(:title => 'a'*2)).should_not be_valid
    end
  end
end
